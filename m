Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDB6A3EC67
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 06:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2291F10E0A4;
	Fri, 21 Feb 2025 05:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HaBXhcLM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A7C10E0A4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 05:58:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D1AEB5C5409;
 Fri, 21 Feb 2025 05:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F60BC4CEE2;
 Fri, 21 Feb 2025 05:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1740117513;
 bh=eAuYwlysZ7m/8cEe+oEJgI+h3VQhPc9pSBGB6ags7Uc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HaBXhcLMbmXEktGS8xExYWOIRJx4iu28bJYpKdWe6sFRAQEk7X3FmLFtZzdLWTWSE
 aqGB6WtsmkM80XRAlrAG7qTMEPf795k1FfkObOKuRVqreJSMiKUBSo//CqBUH4gaKP
 zG6aTDW17Ohe2etUth4Y8w1RT7l3GFtaSk6ggGhI=
Date: Fri, 21 Feb 2025 06:57:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 1/6] drivers: base: devres: Allow to release group on
 device release
Message-ID: <2025022102-another-balmy-fe4d@gregkh>
References: <20250212200542.515493-1-lucas.demarchi@intel.com>
 <20250212200542.515493-2-lucas.demarchi@intel.com>
 <2025022007-judiciary-broadly-a1f8@gregkh>
 <ky3kd4rwuwm6lehmb3n7bplnaoxiwuje67q6m7tvuz6vt7bnnb@lool6xnskx32>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ky3kd4rwuwm6lehmb3n7bplnaoxiwuje67q6m7tvuz6vt7bnnb@lool6xnskx32>
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

On Thu, Feb 20, 2025 at 05:48:10PM -0600, Lucas De Marchi wrote:
> On Thu, Feb 20, 2025 at 01:24:20PM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Feb 12, 2025 at 12:05:37PM -0800, Lucas De Marchi wrote:
> > > When releasing a device, if the release action causes a group to be
> > > released, a warning is emitted because it can't find the group. This
> > > happens because devres_release_all() moves the entire list to a todo
> > > list and also move the group markers. Considering r* normal resource
> > > nodes and g1 a group resource node:
> > > 
> > > 		    g1 -----------.
> > > 		    v		  v
> > > 	r1 -> r2 -> g1[0] -> r3-> g[1] -> r4
> > > 
> > > After devres_release_all(), dev->devres_head becomes empty and the todo
> > > list it iterates on becomes:
> > > 
> > > 			       g1
> > > 			       v
> > > 	r1 -> r2 -> r3-> r4 -> g1[0]
> > > 
> > > When a call to component_del() is made and takes down the aggregate
> > > device, a warning like this happen:
> > > 
> > > 	RIP: 0010:devres_release_group+0x362/0x530
> > > 	...
> > > 	Call Trace:
> > > 	 <TASK>
> > > 	 component_unbind+0x156/0x380
> > > 	 component_unbind_all+0x1d0/0x270
> > > 	 mei_component_master_unbind+0x28/0x80 [mei_hdcp]
> > > 	 take_down_aggregate_device+0xc1/0x160
> > > 	 component_del+0x1c6/0x3e0
> > > 	 intel_hdcp_component_fini+0xf1/0x170 [xe]
> > > 	 xe_display_fini+0x1e/0x40 [xe]
> > > 
> > > Because the devres group corresponding to the hdcp component cannot be
> > > found. Just ignore this corner case: if the dev->devres_head is empty
> > > and the caller is trying to remove a group, it's likely in the process
> > > of device cleanup so just ignore it instead of warning.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > 
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Thanks. Is it ok to take these 3 through the drm tree or are you taking
> it through yours?

As the drm patches depened on these, I figured they should all go
through the drm tree, so please feel free to take them.

thanks,

greg k-h
