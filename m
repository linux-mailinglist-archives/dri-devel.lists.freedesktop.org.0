Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A199BCE925
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 23:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0762F10E079;
	Fri, 10 Oct 2025 21:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="URdI7/KP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B200010E079
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 21:00:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760130022; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dNsLnuXKe8UFgg9g0TIytkHuxqJwEXV9BBDPda28muy+AXlVX8BsyOkHxo8UMbVBYZl8kowuJkdSRruENts6TosWDD5INkTgquUCuHjprvZ0TzgryDxM4ge98iNgT5B/FXvYmSz++jzD/PBG8r/kdc1+gmGt8AvT3aIoe3iAu0c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760130022;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4OeIkartm93on5oAc/a8vf8nlOu9F7BGT4mVfpQiEsc=; 
 b=fy1QCgQ16NzV87X7H0HW8yfiCCsv/vATGH9L7gA0dj8OqCPAhAZhB37B82takPJYTG9BbpkC/Q7qm6K6bKhdiKHULBhxn1Ujk7jUuZ9t6mfCaQ8gNt1uiG0BJ2Lwp6Aq3hAOiZiKvV8r/Cv3mAJ62IJTbq9ANfLApkw5DSQMmTc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760130022; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=4OeIkartm93on5oAc/a8vf8nlOu9F7BGT4mVfpQiEsc=;
 b=URdI7/KPUKRgOo3n77+kSdOIRchPUdlJRuSm8l7sAuRJGqMtcwCf8jPSQRF3neLh
 Pclrcv4EDgalguyw9MaL7YGWFWu9YCLNSq+UhgJl2e64Vgbrflv554ro08K2sFyqkNO
 XgrQKlbRZnWJLfpbQsD3p5240dWHxwxCn9ETZPqs=
Received: by mx.zohomail.com with SMTPS id 1760130020205726.9321883233297;
 Fri, 10 Oct 2025 14:00:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: dri-devel@lists.freedesktop.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com, heiko@sntech.de, 
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 linux-rockchip@lists.infradead.org, alok.a.tiwari@oracle.com,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: dw_hdmi: use correct SCLIN mask for RK3228
Date: Fri, 10 Oct 2025 23:00:16 +0200
Message-ID: <5980548.GXAFRqVoOG@workhorse>
In-Reply-To: <20251010173143.72733-1-alok.a.tiwari@oracle.com>
References: <20251010173143.72733-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Friday, 10 October 2025 19:31:41 Central European Summer Time Alok Tiwari wrote:
> In dw_hdmi_rk3228_setup_hpd(), the SCLIN mask incorrectly references
> the RK3328 variant. This change updates it to the RK3228-specific mask
> RK3228_HDMI_SCLIN_MSK using FIELD_PREP_WM16, ensuring proper HPD and
> I2C pin configuration for RK3228.
> 
> Change: RK3328_HDMI_SCLIN_MSK -> RK3228_HDMI_SCLIN_MSK
> 
> Fixes: 63df37f3fc71 ("drm/rockchip: dw_hdmi: switch to FIELD_PREP_WM16* macros")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index 7b613997bb50..727cdf768161 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -361,7 +361,7 @@ static void dw_hdmi_rk3228_setup_hpd(struct dw_hdmi *dw_hdmi, void *data)
>  
>  	regmap_write(hdmi->regmap, RK3228_GRF_SOC_CON2,
>  		     FIELD_PREP_WM16(RK3228_HDMI_SDAIN_MSK, 1) |
> -		     FIELD_PREP_WM16(RK3328_HDMI_SCLIN_MSK, 1));
> +		     FIELD_PREP_WM16(RK3228_HDMI_SCLIN_MSK, 1));
>  }
>  
>  static enum drm_connector_status
> 

Oops, thanks.

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

In the future, please use something like get_maintainers or b4 to
make sure all recipients that should be included are included; in
this case, I'm very much interested in hearing of problems I
created.

Kind regards,
Nicolas Frattaroli


