Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFD498F42D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF9C10E8B4;
	Thu,  3 Oct 2024 16:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="rgDhKPeH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 332 seconds by postgrey-1.36 at gabe;
 Thu, 03 Oct 2024 16:24:19 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D087310E8B4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8VFCquFTBw+dL27Xzp2OsRt1sPML0xALYJmjaiCuhhM=; b=rgDhKPeH+AO/mHrnadgpPMChEr
 qQiB3fiHqtd5YaWhpzNzu6hjJqUwD9Ck4b3xCFp7D8aONfJ8lfADuxAZw0KQax9/R77a+6Qq8i1Rr
 /6B2yiaVaf8RZP546dJMdV/GU+2jlsn/W5lir1iWF1PheSD94LUld124qIubeluUpfU99iCcU1lZI
 +pVeHtdBWhBKg+as6Q8K87E/6jmNfLavpzGVFfHNMd3fEFLgFIt9MhnKrNYvJXIsuMakVGmuXU1DA
 U0qV/IKJpTInhYlaBVipC+66DUyLlWQ6WimTiE3WcLJZV74NCmcl95imnUSOcsjJTTYXlQgFwjPiO
 +q3lYlQA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58586)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1swOXK-0000eB-1Y;
 Thu, 03 Oct 2024 17:18:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1swOXH-0000FO-21;
 Thu, 03 Oct 2024 17:18:39 +0100
Date: Thu, 3 Oct 2024 17:18:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: clingfei <clf700383@gmail.com>
Cc: deller@gmx.de, shc_work@mail.ru, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev: clps711x-fb: unregister fb when clps711x_fb_probe
 register failed
Message-ID: <Zv7D3yPdfLVpEESu@shell.armlinux.org.uk>
References: <20241003161236.3527733-1-clf700383@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003161236.3527733-1-clf700383@gmail.com>
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

On Fri, Oct 04, 2024 at 12:12:36AM +0800, clingfei wrote:
> When register_framebuffer failed, it jumps out_fb_dealloc_cmap without
> calling unregister_framebuffer, which may cause potential memory leak.

This looks completely wrong. If register_framebuffer() fails, then the
work that register_framebuffer() does internally should be cleaned up
and unregister_framebuffer() should not be necessary.

The code looks correct as-is to me, so there's no need to patch it.
If there is a memory leak, that'll be in register_framebuffer() itself.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
