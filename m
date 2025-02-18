Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2381A3A20F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 17:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B6F10E3DF;
	Tue, 18 Feb 2025 16:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="TPgp3EXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 467 seconds by postgrey-1.36 at gabe;
 Tue, 18 Feb 2025 16:05:05 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72A210E3DF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KZBDJtxcaW+EbK7xr8lVciQc5WFsH1M+cUzHurUjtms=; b=TPgp3EXJIxknNdQRFhGKtjsSGD
 zh4oCSSNqtHdPQMgdkyQvRpsrKvYx+FfAcbjG1SEjN46nlQGNh1VzvYSPlgseTPRMjdLM/i9cpMj9
 fLr8mhI8SxYDvXtugtqKsWdgSXeq87xwkVhYvmajXXxibojsAq/8Wk39wKqtPz3T4beE9QXZafPNF
 soUyX6Y40/lic0qMOCa+I1W6Oi9kgpSzpKz0zAjPH5iiEZvMycxwI/2JnlVvGxZaUgUy6GfjlffP5
 GYZGJ2RSLoTewgKGctKEHMR4CVHcP5yxhFQXwUwiw1GhFZxNPyh87MOEhHyi/DyOlzN1euG+K476r
 oh59WZhw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37344)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tkPy8-0002Wi-1o;
 Tue, 18 Feb 2025 15:57:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tkPy4-0007NT-0f;
 Tue, 18 Feb 2025 15:57:04 +0000
Date: Tue, 18 Feb 2025 15:57:04 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 06/25] drm/armada: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <Z7St0O3A_mXEYK49@shell.armlinux.org.uk>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218142542.438557-7-tzimmermann@suse.de>
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

On Tue, Feb 18, 2025 at 03:23:29PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. No alignment required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Russell King <linux@armlinux.org.uk>

armada_pitch() does have some special alignment (it aligns the pitch to
128 bytes). I've no idea what drm_mode_size_dumb() does. Can you check
whether it does the same please?

If it doesn't, then this patch is incorrect.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
