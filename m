Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3EABD0187
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 13:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F8B10E008;
	Sun, 12 Oct 2025 11:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KM3s2G33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5CB10E008
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 11:28:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-421851bca51so2190311f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 04:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760268538; x=1760873338; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWKcq5BvBCbW0uN/aWPEZSUYGg1aTkDuwmWaEW+ABv0=;
 b=KM3s2G334G9N2hgiqZdlKuOct4B6Zo5V+Q/cnPSYDlk6FlzBOAZwehf2GFMnGkR8aI
 4G3snZRX7xdhJzFea2pXHvVk2fCxhVS47p/ydpQJKi07jaQ78OmgnXBOQeNYhFS26V6h
 Kdu6U/KS+ICZJmUUIVRI68pjrxAaQDF0YDEZMIksn1wRU+pXEQsupb8dytDCbe1CbP5N
 jIJQ7+L5nbF37YkshyDl37gbsqzyuAapn84AkGkufT0iwpRcgLEdV0fMGDYZnTcPRMa0
 NHrb1zh1zXcPv8VW2yZX+yr2snYUMtIAc3yS742l152zTZ1bxwwIPRsy9zoiWEA1/xMW
 f3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760268538; x=1760873338;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uWKcq5BvBCbW0uN/aWPEZSUYGg1aTkDuwmWaEW+ABv0=;
 b=NWJMUQm5GAPTBs+ww9Rgcu7hDoVVMef4OddbeDZT3B58FZNKTV7qpc2W1cwZARoL0F
 wIUom3U7iasyhs9g8TQ48u4bvCPAsYvD+Z/oMUZSXIz5Ht9rJkyv0t1TOXRRAps+eHpc
 RUXLjLuAf90fHLK2vULH4p9nBmw4cH33lwvUyN6i+TlQ59V4ZAXzK84riN81gvfn1I7s
 fgegJBMGi6cd2nGpGxP6QQF0ofaNbtm1afzGSQwf2sSqnqUmU7ny8zrDzxBFC1AFfIH/
 TzA1zNPZ8nG0nf65itqy0NMfnXPeioxv73W/OzNVbU0lydHcVk67QsOsR7aQDZXnYqTY
 3SyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZS8oxeqI4z6C0fV+SQstVwG5i89FIsmtZgB9QPbjBnz6qtD7HjNJX3xh/Rww/wRTVmPYkHxM9Tv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeK33hXt+sVNUEaiFx58Jzpk8KloCuf8+myZUNWNiTGgUQsMiZ
 lFXi+xxVw4GsXh2i2giHOEMX8KBlL1uzbYmmFbQn+IGyJJ7iHPAlEjcn
X-Gm-Gg: ASbGncsDtHgz3knknZ+PhGVCZEsYx6/oaY3CDVOI3mOOx2bY0kuaaLmK+AXtgeWmqPB
 YAA+Rktn0wRx7snUe4VvingsnrCboIKEfhVDp35a3OTKsER3pPt/VJ98rBluOy3QEhsHcLhH8gD
 QIg4tTX+c2ilDrMSjX4w74xVYLxAGh8cvXzMzLW5ynrYt7A+HKqMLDUZ5yS9yK73H2JwJXRlsMy
 /8ymJ8OmiX2OLNVEpaucZ66hC+i3+C/moaEOPNwKEFqTlPat0iYob5eRdU7wdd2neJyOcDvyJfE
 3ZIPByhRdM778mMaHiAJiHy9yRmcl+igUx4Ix/xi4QglFSRUtMUTUDD+RlBWECIIX+Z+VmsNaCY
 /RohMKaI7Ty50cS8t1ZXYgP7A2+JoYEUvLC0t3DUWHxzeHqDWrp47qcHAZlA7S6nuSg==
X-Google-Smtp-Source: AGHT+IFIgmUyYZvJ+WTBCCmNwTjhLJVGwhLPHJ+WDG3InpnSBdGbHVHGfZIIZz0xV+9R6mVWBHO/bw==
X-Received: by 2002:a05:6000:2509:b0:426:da6d:ca6e with SMTP id
 ffacd0b85a97d-426da6dcaa6mr2164779f8f.58.1760268538276; 
 Sun, 12 Oct 2025 04:28:58 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce589b3dsm13194458f8f.24.2025.10.12.04.28.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 Oct 2025 04:28:57 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] drm/rockchip: vop2: use correct destination rectangle
 height check
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20251011130450.123444-1-alok.a.tiwari@oracle.com>
Date: Sun, 12 Oct 2025 15:28:39 +0400
Cc: michael.riesch@wolfvision.net, robh@kernel.org, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <79AC74F5-9579-4A1A-B051-FD8731DCC524@gmail.com>
References: <20251011130450.123444-1-alok.a.tiwari@oracle.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
X-Mailer: Apple Mail (2.3826.700.81)
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

> On 11 Oct 2025, at 5:04=E2=80=AFpm, Alok Tiwari =
<alok.a.tiwari@oracle.com> wrote:
>=20
> The vop2_plane_atomic_check() function incorrectly checks
> drm_rect_width(dest) twice instead of verifying both width and height.
> Fix the second condition to use drm_rect_height(dest) so that invalid
> destination rectangles with height < 4 are correctly rejected.
>=20
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c =
b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index b50927a824b4..697f54777a32 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1031,7 +1031,7 @@ static int vop2_plane_atomic_check(struct =
drm_plane *plane,
> return format;
>=20
> if (drm_rect_width(src) >> 16 < 4 || drm_rect_height(src) >> 16 < 4 ||
> -    drm_rect_width(dest) < 4 || drm_rect_width(dest) < 4) {
> +    drm_rect_width(dest) < 4 || drm_rect_heigh(dest) < 4) {

Typo: s/drm_rect_heigh/drm_rect_height

Christian

