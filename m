Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF86AEE2E3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4A110E499;
	Mon, 30 Jun 2025 15:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="homNYDyT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D9110E496
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:41:22 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45310223677so16072805e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751298081; x=1751902881; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1z60LJpeCsx+DQYSsYPaFihy+XtLiJlbKQXXW44rZ4Q=;
 b=homNYDyTBXURV1s+xxjQwhrCv9JSzLSzkcFc9dfLjZirEdsxJdpKnGxrsAEvHwW1LZ
 udTIKxhTCt7TgwTf9zG1c0GEcKwCMyoo6/KDKFePc/dZkZAMWmv+WsILOcfDxfPJE1Qc
 QvZrTBEXGRi3SWLGyldQoGWIfo1PiOjZvq1VPuCkJgKlOdqE2M/bTVrA2D/trc0FR2xr
 YeZfC/H9/QRK2etdBTi9EjdMvnY9YbbkgF0F6FlLUHNkFXl97QxXssN/d3ntA8gdNmvy
 kOaUpQRg8JomXZ+csqFxyO7qeZ/al5B7iUxQhHv/iLYAxnhwxQgyGbY7rqDqv/EoImV/
 b51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751298081; x=1751902881;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1z60LJpeCsx+DQYSsYPaFihy+XtLiJlbKQXXW44rZ4Q=;
 b=JpOfS6deFYit3RMb9sH5HBIGlBQqKESUdnHLLrcbT/8xJNPiXxHeS0wx4LCR6oQ0vw
 E0bm4dsmLgxZumkR7To6J4YaNHY4gGHMToj+EPI2wqNuROLKLN8uowa0KV5p1FGXFNDM
 6dhVd9szJhyGiK4ZWloEc7J7V4IsVWBa5HmBJENSdL06RXfXNJFjYcuAMpCPygTQ4l78
 Lr+DZ7iZ7VfbXkxeFmw4jB3H/tWSGUBmrD+Sezesq8u6IPN23q33UAt7wCy+x1Vii17X
 KPA0frwLDV3dLclQJu/MH3bXk5F9kUCrojAyJBVDRpABZJ3NxdNIqzx0ZRC58dv7MuvJ
 PXiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTot2i3DJErMVCakiyU01scuMtS+j/r0pgndGtEseOrk0DCQ1rCsyEjHC7mgeO4f7ww/b+GVocFwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3sEMm42nf94P8i+6YRmS30KMN2d5Ni0dRPCBXxjkR3rTnACEX
 erA1XGzNoQlWiiC018auTbtJODaetkAAP2tjCspEjQCsUTv62z+6TLKx+rhgQUxe1Ko=
X-Gm-Gg: ASbGncv4k+HpI8x4NID0WIH6k6lZTpUhnpgMKp7ciTWxyJJv2hsbTioEzIoU0zXoX7V
 zVM17H1/ZPY6UOKjR7Mr7ckH994hhp8x+RWmOgy2oAnhdUmtDUj+QeW/Avj+LkFApa1zuXLtsj4
 0g9LDHYbnHC4UUzelXO2TFRvJejC+Z38t1MZN0HJOn9Do8qMM9x7+MsWhnHQ8+Yo5YUb8Ztpyli
 NQrn5br3Edahm9/5FsbDin1FgCRGHRCyCNFKavmp3F26LnpkQbjOvvOs1TpwEBTTFFyNoWnuPRj
 Sy9HGW/aRv/reRQquyorWTK2KyCJb7U1vF0Z20zufo3mUEoJh72FrnmxRR6Y6EU0JpksidkfBkK
 W67RMiKazhfJhsyMYDg==
X-Google-Smtp-Source: AGHT+IEwZYeQq7R6iX1m5jsexMwhCGBbiitsk8fXsOHSKTMoDV4VyRKhA0M48JTMKvtM+bpQkMOr1w==
X-Received: by 2002:a05:600c:4f16:b0:450:cf00:20f5 with SMTP id
 5b1f17b1804b1-4538ee578c4mr147054525e9.9.1751298081295; 
 Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad01csm170270975e9.22.2025.06.30.08.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: quic_jesszhan@quicinc.com, mripard@kernel.org, simona@ffwll.ch, 
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, sebastian.reichel@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250618091520.691590-1-andyshrk@163.com>
References: <20250618091520.691590-1-andyshrk@163.com>
Subject: Re: [PATCH] drm/panel: raydium-rm67200: Move initialization from
 enable() to prepare stage
Message-Id: <175129808078.2286551.2035019384518524281.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:41:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Wed, 18 Jun 2025 17:15:20 +0800, Andy Yan wrote:
> The DSI host has different modes in prepare() and enable() functions,
> prepare() is in LP command mode and enable() is in HS video mode.
> 
> >From our experience, generally the initialization sequence needs to be
> sent in the LP command mode.
> 
> Move the setup init function from enable() to prepare() to fix a display
> shift on rk3568 evb.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: raydium-rm67200: Move initialization from enable() to prepare stage
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/691674a282bdbf8f8bce4094369a2d1e4b5645e9

-- 
Neil

