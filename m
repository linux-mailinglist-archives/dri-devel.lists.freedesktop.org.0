Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DDEA3D9DD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 13:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B32D10E4BD;
	Thu, 20 Feb 2025 12:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ddVPCUca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C8510E4BD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 12:24:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 820665C4839;
 Thu, 20 Feb 2025 12:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021D7C4CED1;
 Thu, 20 Feb 2025 12:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1740054263;
 bh=SxZ5pAEGWdtBNEet9Ndp7pxpdZnMI7osiIrQlY/cItY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ddVPCUcayAGNvIt6g32kpYTE7g00AYZiCL8F1wnMVJbuVk7wKnIbo7nTibOCxafJ4
 u87PlqdmX1Jn54P42D+655STOi7vsrf73OpQ7cuNojrEU3b1RsW4W5U7HLYH47wjVC
 xusyIl8ZN23bDUik4/fcP7ZQaeluK3qXE1t+/29c=
Date: Thu, 20 Feb 2025 13:24:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 1/6] drivers: base: devres: Allow to release group on
 device release
Message-ID: <2025022007-judiciary-broadly-a1f8@gregkh>
References: <20250212200542.515493-1-lucas.demarchi@intel.com>
 <20250212200542.515493-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212200542.515493-2-lucas.demarchi@intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2025 at 12:05:37PM -0800, Lucas De Marchi wrote:
> When releasing a device, if the release action causes a group to be
> released, a warning is emitted because it can't find the group. This
> happens because devres_release_all() moves the entire list to a todo
> list and also move the group markers. Considering r* normal resource
> nodes and g1 a group resource node:
> 
> 		    g1 -----------.
> 		    v		  v
> 	r1 -> r2 -> g1[0] -> r3-> g[1] -> r4
> 
> After devres_release_all(), dev->devres_head becomes empty and the todo
> list it iterates on becomes:
> 
> 			       g1
> 			       v
> 	r1 -> r2 -> r3-> r4 -> g1[0]
> 
> When a call to component_del() is made and takes down the aggregate
> device, a warning like this happen:
> 
> 	RIP: 0010:devres_release_group+0x362/0x530
> 	...
> 	Call Trace:
> 	 <TASK>
> 	 component_unbind+0x156/0x380
> 	 component_unbind_all+0x1d0/0x270
> 	 mei_component_master_unbind+0x28/0x80 [mei_hdcp]
> 	 take_down_aggregate_device+0xc1/0x160
> 	 component_del+0x1c6/0x3e0
> 	 intel_hdcp_component_fini+0xf1/0x170 [xe]
> 	 xe_display_fini+0x1e/0x40 [xe]
> 
> Because the devres group corresponding to the hdcp component cannot be
> found. Just ignore this corner case: if the dev->devres_head is empty
> and the caller is trying to remove a group, it's likely in the process
> of device cleanup so just ignore it instead of warning.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
