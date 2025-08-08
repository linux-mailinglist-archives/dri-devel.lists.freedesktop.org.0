Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F26AB1EB32
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 17:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3134D10E960;
	Fri,  8 Aug 2025 15:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KUIblmlW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83F910E960
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 15:12:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D13843BBC;
 Fri,  8 Aug 2025 15:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0E6C4CEF7;
 Fri,  8 Aug 2025 15:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1754665947;
 bh=ZxRKGIVUbjSraV5hBQcR8vq7j3X1Q8xvJwBOa/cCs3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KUIblmlW7Tutv06pro2zkO9Eh0mI8JznHI9DaugQlkBUOkNfGsF1cYhiLsw2SN3iq
 UVUbSEEK4cPtBy2ADDFMZRsU8viivVnVIi1wTCeRYvf8BefXAxjtkDojhTamWgaOde
 6I9NytUD2G8x16Elu937djrUxp27V3aGbPhSVyo8=
Date: Fri, 8 Aug 2025 16:12:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, jeff.hugo@oss.qualcomm.com,
 lizhi.hou@amd.com, stable@vger.kernel.org
Subject: Re: [PATCH] accel/ivpu: Fix potential Spectre issue in debugfs
Message-ID: <2025080810-putt-ungraded-d49c@gregkh>
References: <20250808111120.329022-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808111120.329022-1-jacek.lawrynowicz@linux.intel.com>
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

On Fri, Aug 08, 2025 at 01:11:20PM +0200, Jacek Lawrynowicz wrote:
> Fix potential Spectre vulnerability in repoted by smatch:
> warn: potential spectre issue 'vdev->hw->hws.grace_period' [w] (local cap)
> warn: potential spectre issue 'vdev->hw->hws.process_grace_period' [w] (local cap)
> warn: potential spectre issue 'vdev->hw->hws.process_quantum' [w] (local cap)
> 
> The priority_bands_fops_write() function in ivpu_debugfs.c uses an
> index 'band' derived from user input. This index is used to write to
> the vdev->hw->hws.grace_period, vdev->hw->hws.process_grace_period,
> and vdev->hw->hws.process_quantum arrays.
> 
> This pattern presented a potential Spectre Variant 1 (Bounds Check
> Bypass) vulnerability. An attacker-controlled 'band' value could
> theoretically lead to speculative out-of-bounds array writes if the
> CPU speculatively executed these assignments before the bounds check
> on 'band' was fully resolved.

You do know that debugfs access is restricted to root access only, so
spectre issues are the least of your worries if you have root :)

That being said, no real objection from me for this, but there's
probably a metric-ton of these in other debugfs files if you want to
start whacking away at them...

thanks,

greg k-h
