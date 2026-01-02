Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F58CEEFDB
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 17:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D63A10E296;
	Fri,  2 Jan 2026 16:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mareichelt.com header.i=@mareichelt.com header.b="lqf5AkAa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 567 seconds by postgrey-1.36 at gabe;
 Fri, 02 Jan 2026 16:40:22 UTC
Received: from mail.antaris-organics.com (mail.antaris-organics.com
 [91.227.220.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FBE10E296
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 16:40:22 +0000 (UTC)
Date: Fri, 2 Jan 2026 17:30:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mareichelt.com;
 s=202107; t=1767371454;
 bh=W9x6B8RzXHD/s8bwGkmccsIgeP5fFleFJ110N4EFG7Y=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To:Cc:Cc:content-type:content-type:date:date:
 From:from:in-reply-to:in-reply-to:message-id:mime-version:
 mime-version:references:reply-to:Sender:Subject:Subject:To:To;
 b=lqf5AkAa/DoxkAYzjCuBjHhW+xWFdftVlnaQy71fwhffSKJqE0SXgt+qVrCJGIvSu
 mCq00ogYsb04ofykSwXzsY5TbCgigxrqBPbPFuuc5duzFyyhWXP5zTcHG3/Sjmo3KX
 c3LkNMivFTKjZIdEUOr0R2Qg+acBDyzy9aS+fTmghtotPOQtxw1VisplcNxQubXRdB
 wizQhu87oa6ebSs7NNcs60u54Nna1C6wq/PCE2OsKwOKOs7U7WPP+QYEjEwUxdjrwo
 4tQjfDfdicqbYjucDpgmCdthoZhoCkKTZgROznMG+HkrUOFtCsk46BSnyMzsa410/5
 PI5bsenp+hO0g==
From: Markus Reichelt <ml@mareichelt.com>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 0/6] video/logo: allow custom boot logo and simplify logic
Message-ID: <20260102163053.GE26548@pc21.mareichelt.com>
Mail-Followup-To: Vincent Mailhol <mailhol@kernel.org>,
 Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
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

* Vincent Mailhol <mailhol@kernel.org> wrote:

> This series allows the user to replace the default kernel boot logo by
> a custom one directly in the kernel configuration. This makes it
> easier to customise the boot logo without the need to modify the
> sources and allows such customisation to remain persistent after
> applying the configuration to another version of the kernel.

Hah! What I have been doing for so many moons is to just cp my own logo
'logo_linux_clut224.ppm' -> 'drivers/video/logo/logo_linux_clut224.ppm'
for each custom kernel build - that works like a charm.
Maybe... I'm too pragmatic? It's that famous 'kill bill' logo from ages
ago, 224 colors PPM

Haven't tested your patch series cos stuff just works for me.
Looking forward to feedback from all those logo nerds out there.

Markus
