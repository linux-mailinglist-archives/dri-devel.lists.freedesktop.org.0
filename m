Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F0A1A2F8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F2610E7E0;
	Thu, 23 Jan 2025 11:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XdHYPpHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAF510E7E0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:31:41 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so763184e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 03:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737631900; x=1738236700; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6GV/GI1CAs1idJHC9goHRl9dRjKhZ5TZhhQYyHtO4m8=;
 b=XdHYPpHArcvBp/8U/vI9dxRoEgLpdQglhtpLBpgehhywEDwp46FixQmMoB10JrjpFb
 JcVFbsnVN/eiomOIUElF6Z2x5iyGtSgSk7wG7Fz6fW+fkQ40guRg0kVXIediOl2ZjXW1
 8kjZBrWo/d2MiOeEzEWKiL7bki48DtQPh/7nSbWNU9UxBK6Rzq/b15Cwc1VfIQ6wP7Di
 WQxxd3Nbv4p+nbhcuBIGZkx0Or+Q/yvSJhgAfCiLi4m9xzaXqgDTdI7gjF2iuL6T4Dqn
 8TMX36VlNJi70NdtnaKUgVEarHm+fJoihVDUU86iE/EKy+40IHUNUC7N/CbDt/w8642I
 06UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737631900; x=1738236700;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6GV/GI1CAs1idJHC9goHRl9dRjKhZ5TZhhQYyHtO4m8=;
 b=qSh0hdvelMBY6f1uYaSVE8KCV08ZwX49DcxndV7cu7YR/nfUUepn4jdoo8A5Es0JV4
 NRxBs3lHTFxiKTLR3Cd+ZW09lmwo4cJXUoOcVv0Z8cGBKeaKclf9NwMY1OGVoW1zwncW
 a1blnSzCxJ9+fi+Gm863pqgmaskXPUtuIoVpD19G4Ya6lE5t5THBbEdnpr6xNfFwSDKS
 TuEo3Rq4ijU9Og7nrzU98n+9L1IYfeo03n7irMurjvj2ubkBMjAm5cf7tgsyjMiMVdVA
 8IxbgbmdMJtLN4I3ILyvlSGjgJ1/cb640YNn0H2YZVBV+B4w6eSPGPYY+THK1NF2aA8P
 14UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqOvWPukSsGXeXAPxem08ozm2yvIxD7ZSRIG+5Vpx4ne28zsq8C2WIdqESjlS6HN6E5Ol3zzTUFQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxt8DlT8NMV/wBo5a8hu/7131T1uJnoUr/CoTrpNYX6YJgJRiu
 UhpZDj1DRLbqlZ6IM5lHLlD44cj07HwAxV8xbkBOLhJNmHwPC3z3OGXprkWCNIU=
X-Gm-Gg: ASbGncvtESP5gp7La62ZvEPoB0Q/AILYrv3kj1fQsTJho0LS75vaGJG+eq048vZ5yPb
 xJl40JptctAkuebG7JjTpsfnGmivR8LH63bRyYbzXebsTUmaRwtNFQCRZMzuezVuuH7OhUaAXp4
 4aZBGoQIgITrS8OCpY2gwqAaI0FSWZHN/AW4rypVRpjzG2Wdl2HZgGiGxgJwb9t9PKBUf2+cr3V
 o3ibTGNgfrwJi3ikrisds2k1G3bjerS+O/0/epQwjaoxjPLGHRUDmAnGuIvIaFMy3uNKAl/JVz7
 fSLXMqfweek6epiw96VQpssCrRAHU0YCwHE+JWMYxnEuE1qAb/qXw077DhKJ
X-Google-Smtp-Source: AGHT+IHtXPZP5fXc+jx9qkDw8OG65Yz52T0nmfyDaHj9u5aH3nN5zjNMvgxVC7Tag6Djcezn71sacw==
X-Received: by 2002:a05:6512:483:b0:540:1b2d:8ee1 with SMTP id
 2adb3069b0e04-5439c21f2bfmr7480684e87.11.1737631899528; 
 Thu, 23 Jan 2025 03:31:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af7a281sm2612994e87.259.2025.01.23.03.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:31:38 -0800 (PST)
Date: Thu, 23 Jan 2025 13:31:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 12/14] drm/edp-panel: Add LG Display panel model
 LP079QX1-SP0V
Message-ID: <rwn3g7tqgjnc525cjqtivgfgedhooiayn5nujng7bdzazgqhle@wfpuvoyr2tii>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-13-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123100747.1841357-13-damon.ding@rock-chips.com>
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

On Thu, Jan 23, 2025 at 06:07:45PM +0800, Damon Ding wrote:
> The raw edid for LP079QX1-SP0V panel model is:
> 
> 00 ff ff ff ff ff ff 00 16 83 00 00 00 00 00 00
> 04 17 01 00 a5 10 0c 78 06 ef 05 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ea 4e 00 4c 60 00 14 80 0c 10
> 84 00 78 a0 00 00 00 18 00 00 00 10 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 4c
> 50 30 37 39 51 58 31 2d 53 50 30 56 00 00 00 fc
> 00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 3f
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Please use get_maintainers.pl when compiling To/Cc lists. Added Douglas
to CC manually.

Or, better, split irrelevant patches to separate series.

> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index f8511fe5fb0d..77e3fd3ed160 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1808,6 +1808,12 @@ static const struct panel_delay delay_200_150_e50 = {
>  	.enable = 50,
>  };
>  
> +static const struct panel_delay delay_50_500_e200 = {
> +	.hpd_absent = 50,
> +	.unprepare = 500,
> +	.enable = 200,
> +};
> +
>  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
>  { \
>  	.ident = { \
> @@ -1955,6 +1961,8 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
>  	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
>  
> +	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200, "LP079QX1-SP0V"),
> +
>  	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
>  	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "MB116AN01"),
>  	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB116AN01-2"),
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
