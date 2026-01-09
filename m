Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D9DD0B36A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9428D10E90D;
	Fri,  9 Jan 2026 16:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jD6DlzBQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9C510E913
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 16:25:13 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso16836785e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 08:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767975912; x=1768580712; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6D61jCcPKdIzLOh1VTWA3yx/fr9rhqVqmFGIMjfLvdI=;
 b=jD6DlzBQ8b3umEHA5KBKdl2+sVzHdGneZm8tb8taJFFKc7hMsj3VdeyHqsJXbu8XhY
 0QOhDoEZVU0BKCH1bXzlldkugetGhgAXgq8XtSV0kK+3jM7DXVnPNq1LTZEl5hRHVwKn
 eFdXWOzt/w2iBpWoLn7qobA9bu9b5u7QRQfC1DvtGTQklMlXfBEIIS80somrEkipRsBl
 KPpyAZr5kL4DXBsinyCHziDV9ZgM/HIlEaUVO52wXfRsMFuXtrj8uKVUiQ3SXZoPmd43
 UzDiF44WzNHUr2GpxBqpJZsuH3+DhQEz5v/s3RyvqHRUJb6nDFq3PbVilaDz2eHmhUs+
 F1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767975912; x=1768580712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6D61jCcPKdIzLOh1VTWA3yx/fr9rhqVqmFGIMjfLvdI=;
 b=ipS/qNb11/CvAZul0JpE2Ouss5o+eVptMcOxPPEcUse4amuXjzRQUrdpyOVO+M/eQk
 sMjoHkDqAY32BTf7FMrcnRody69ugxluHQ66ZROYtjijW13XmGNyZJynEgjOmGe6qyto
 0RIVF6LtT2W5P8VxUWrAuqbLbY02I19+qepZhcv8taO2VTEszrm+7ZiiqVjQfbO7nVLD
 HXd6kdBOwoWf51/og98rpCXZ1c25wbaalH1hkJC8EF8BAyrxpl7MQViV42piXAKgLExr
 3ivnDZ6zXUHmC1ZTvJpVsNpC6th25Z4DooKuRfdpg1VYjaPWpcZ557y+KC1Wkj9VFC2R
 KwRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6DsnSlbbCaW8z3SUloiJJywOzYr13VooPQfZU2meHLYwz0UKwO34umuw5huTwGwodYwdEXA2Chbk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2QdryYs5Wya9QMdb61uSOsVPgZUXeYdfSjt0ENMkWoHOliAaC
 13izZGafNhzCuEoapswuecuvgk2S4vONoI3Af6G/qQqY/czAWAcpD/gA
X-Gm-Gg: AY/fxX5qQlLuHOajnnCO3s8USk3qBohjC/dFNN2zLcxfve9mSzAByT5NsU0gHCo7Suu
 Jg6BP55J7SfixTpJtu7+V9/hNz/veglQvaKI+3U6h4UviX9aIqcJkfOONsRTfYUMN06N5uhn0qg
 bjKV9Su8swa/yehd+KsQX2gowX4LBlamrgIVIkMgf2hr8bPxiZktTh0n/nw4ZD98mhx6z7Kc6Ds
 ttp4VgnYUBfhgi/SsSxUOoO8Qz291CgjlXqU3bQX9M8s3DkndSLH6XmKZbJI2cHRFK+REqrWEd2
 O0oyCNyGLvonNYiJMLp80yTcKamMbxYES9RVT1dx1apZOXxVvlzSzU94kjROq/4SrI8jLBdr5jw
 2xeQ2tpWzlalafelZ99OI3CKu8sbj2YFTTm//dFyJjj3MPCWPydx1wfHg5fQvjX5mc80Do5TgUH
 p4EkOAS1AtOBme1K2w9POmSfK0
X-Google-Smtp-Source: AGHT+IETHFe1bt83p7OLl4C3e0be5VCh+jmS63D91zqEYAh74kxUAD5M7+gilHthbzHGo+uLzSlcbA==
X-Received: by 2002:a05:6000:2010:b0:431:f5:c36f with SMTP id
 ffacd0b85a97d-432bcfe4cfamr17880196f8f.31.1767975911920; 
 Fri, 09 Jan 2026 08:25:11 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ff0b2sm23201743f8f.42.2026.01.09.08.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 08:25:11 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-hardening@vger.kernel.org, Yicong Hui <yiconghui@gmail.com>
Subject: [PATCH] drm/amdgpu: Replace deprecated strcpy() in
 amdgpu_virt_write_vf2pf_data
Date: Fri,  9 Jan 2026 16:25:14 +0000
Message-ID: <20260109162514.308143-1-yiconghui@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

strcpy() is deprecated as it does not do any bounds checking (as
specified in Documentation/process/deprecated.rst).

There is a risk of buffer overflow in the case that the value for
THIS_MODULE->version exceeds the 64 characters. This is unlikely, but
replacing the deprecated function will pre-emptively remove this risk
entirely.

Replace both instances of strcpy() with the safer strscpy() function.

Changes have been compile tested.

Signed-off-by: Yicong Hui <yiconghui@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 47a6ce4fdc74..1c4e74e35cf3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -604,10 +604,10 @@ static int amdgpu_virt_write_vf2pf_data(struct amdgpu_device *adev)
 
 #ifdef MODULE
 	if (THIS_MODULE->version != NULL)
-		strcpy(vf2pf_info->driver_version, THIS_MODULE->version);
+		strscpy(vf2pf_info->driver_version, THIS_MODULE->version);
 	else
 #endif
-		strcpy(vf2pf_info->driver_version, "N/A");
+		strscpy(vf2pf_info->driver_version, "N/A");
 
 	vf2pf_info->pf2vf_version_required = 0; // no requirement, guest understands all
 	vf2pf_info->driver_cert = 0;
-- 
2.52.0

