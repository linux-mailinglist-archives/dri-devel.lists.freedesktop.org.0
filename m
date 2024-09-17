Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94BD97B283
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 18:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5155410E49E;
	Tue, 17 Sep 2024 16:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hr35UBh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A6010E49E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 16:02:32 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42cb60aff1eso57603805e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726588951; x=1727193751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3kbWVWlWmyCgkKcJ+HaZFf9kkYklQ81QL9Q+STaEbPw=;
 b=hr35UBh1B0SAM1qfLgWyHy3zDV6XFcHJb1DYrXXJAaPJKsW1M35InY6tjGu/XCRHac
 dG/Wr2jWeWxCy3QIFJLgmbAf6b7P81ns6MbC/0Y1dpI+z+2//xjHtvfTJVaKPSspCoLb
 TvU5O46q5msl2IH7RBqeNfw9hNec07rzeEO/ZAPPXWHZVboUG1rrciViQmC104Aof2XL
 pQhH1fQ3cltXr/zff400M/0K8FTFFEBImVi8cGc44MmLr5E9LxVxYAPqI55P3jkxM9eg
 oVWTyUXPMpfqheTVIrc9/TDkp5wxpjGdbgMVq4wyelaXuC69gilD0R5xwGbrmbKdR1S0
 vRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726588951; x=1727193751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3kbWVWlWmyCgkKcJ+HaZFf9kkYklQ81QL9Q+STaEbPw=;
 b=I5jVej4VRoiGMgG4APq5MqSm0rQGwG6A/MIGEWz8vQymRBNgCYqIrY8HHz2SHKsmcy
 ZgXY6rNxKlg53KU6zzHoCs01bLr4yVTgHV8P+U104TqrmgboZoKEnSFx6EEVVMXOHcdi
 B/l2fETlhiVxK6wuhRCY+gkrt+k4PGaLrTLTuOqtGJyLcKpSyVcUPLEuT3mc1HI4FOFZ
 Y1EMSHyXM0PxKyf0nmgUA9KybxUkBYlOjDQtgRJYtguVKEbJyDmU5CwQ64J48KXscy7H
 JqiUgMM+02e2ljZdsvdqjnjt/x/P5QdzNBoaBwAcwpTLm/7lmqKcfg6D0F76aAtfY1BI
 d6CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXai6PqvXyV9mkqE2qwX2Wqdw4NQkmGiBWqNydG2xo+k/kv5kCNmgUz5R/6V+kYCKtxeBWa6rhbrdY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjpBnL2CmV09Xut4xlDts85HzSfVZUHPZHSE/1lPX7it9EtBid
 fSwzNsiAhiPO4V38aCepNzyvs0rvtiQKU0QEUq0Mp6943U76vtaY
X-Google-Smtp-Source: AGHT+IHTNlNyBEouYbMiOHsa8/MLBLRjXHi4/gnaqBXDyWKeQ4B86r0KXV3ir8Cn9Ma3ufcHsjMwLQ==
X-Received: by 2002:a05:600c:3b17:b0:42c:ba83:3f0e with SMTP id
 5b1f17b1804b1-42cdb538c44mr159369745e9.7.1726588950632; 
 Tue, 17 Sep 2024 09:02:30 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b1947e2sm144569475e9.44.2024.09.17.09.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:02:30 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 simona@ffwll.ch, thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] drm/vkms: Suppress context imbalance sparse warning
Date: Tue, 17 Sep 2024 18:02:24 +0200
Message-ID: <20240917160228.2933-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240912-vkms-warnings-v1-1-59f3e13ea8e5@bootlin.com>
References: <20240912-vkms-warnings-v1-1-59f3e13ea8e5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Louis,

> The functions `vkms_crtc_atomic_begin` and `vkms_crtc_atomic_flush` are
> responsible for locking and unlocking a mutex, respectively. Add the
> `__acquires` and `__releases` annotations to these functions to prevent
> the associated sparse warning about context imbalance.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks for fixing this warning. Tested it and I can confirm that these
warnings are fixed now:

  drivers/gpu/drm/vkms/vkms_crtc.c:233:13: warning: context imbalance in 'vkms_crtc_atomic_begin' - wrong count at exit
  drivers/gpu/drm/vkms/vkms_crtc.c:262:39: warning: context imbalance in 'vkms_crtc_atomic_flush' - unexpected unlock

Feel free to add:
Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> 
> ---
> base-commit: d2194256049910d286cd6c308c2689df521d8842
> change-id: 20240912-vkms-warnings-e0e331bc5e6d
> 
> Best regards,
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 40b4d084e3ceef9e1e24b7338efdd9253afee8d6..2ad164b518fb93f5b6b86948116ff7ed97770b60 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -232,6 +232,7 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
>  
>  static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
>  				   struct drm_atomic_state *state)
> +	__acquires(&vkms_output->lock)
>  {
>  	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
>  
> @@ -243,6 +244,7 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
>  
>  static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>  				   struct drm_atomic_state *state)
> +	__releases(&vkms_output->lock)
>  {
>  	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
>  
> 
