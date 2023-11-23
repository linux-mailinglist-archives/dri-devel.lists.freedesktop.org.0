Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D67F5B5E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECAC10E701;
	Thu, 23 Nov 2023 09:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AFA10E6F3;
 Thu, 23 Nov 2023 09:40:52 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-548b54ed16eso899528a12.0; 
 Thu, 23 Nov 2023 01:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732451; x=1701337251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bJZTY7Ppscmc7/agjAjlMp0CjMt1Rvl0KUPChAkdlBw=;
 b=cZOLyIZ/mXRnOXfPF3wqGoBISCTNPNl5lxn5R0F9IdaWjp1rQuuI8EjbF0er1rxBHi
 jRLcpsDucD5AfkpZtoEaY+Pz+0uPkfJLPT97MkeDGWDurW7SrIZNvTM0eriqncwTCk/5
 K+p0bRU+7R+94NUOvPhQLBrYtWKnpKVIEG+MrmlZtdmqdtKqWJPY37g5dim6EdIw9kSc
 x6sI9Zn7txsCV78hoS+ngbCIVBrszIitL4W6pEha+UKnYgZmeKBn+akV2k7P1m0rRJZy
 j9W2zIVDV7rHtAx+GG5EJAQ85yc7SrB48Q1VM8MI0yqJpKDXsAppZJ3paOMe3aclPQfK
 cnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732451; x=1701337251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bJZTY7Ppscmc7/agjAjlMp0CjMt1Rvl0KUPChAkdlBw=;
 b=cfUZoSJNxzVqpeH6nfzo6tBr7rL0KB5Xnzm/+MZfKpyRXFJJUNr4I/WBJmNnYWvBwF
 OEReCntU0AVfNmPRNe6sXmN7I7UMk7EofdqHGz0jxYhc/SjuyQYae6vY/yEjiVrScABl
 4xl5fOHtKGdUyrSyG0NUYQa71rB1fnRLXdbwlkIVJEGIy60SzlxLGIvNo0Ir/MpVj6kz
 zhK2R6VtvRbXhYfeHYu5RRSYQadHgwHMUEjpYDrNAaJR2PaxpLhRol7Axfhog0XBk8F5
 lcyeSsUuQpNoQHIZpw24yBCCBstC4mmI3bthlDC4BQ75Ag2aqsds12Qx+mLHmiTvfQHe
 MQVQ==
X-Gm-Message-State: AOJu0YxV2V3Nw/9GEWo6zvcaiXhj65h1rFL9PdJm0lNVUt65ZMUeXspg
 R3lwMBexHT66ZHJOwyCHL98=
X-Google-Smtp-Source: AGHT+IHzN7AwPcm/sO9dy22vICRd2Xk4zJMeYsib0E7Fgzi8vCiMlpZC9C+ucr3iLv4APW5MC35HAA==
X-Received: by 2002:a17:907:371:b0:a02:9700:bf53 with SMTP id
 rs17-20020a170907037100b00a029700bf53mr3303778ejb.46.1700732450616; 
 Thu, 23 Nov 2023 01:40:50 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:50 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v5 07/20] drivers/gpu/drm: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:27 +0100
Message-ID: <20231123094040.592-8-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c |    1 -
 drivers/gpu/drm/radeon/radeon_i2c.c     |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index 82608df43..d79cb13e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -175,7 +175,6 @@ struct amdgpu_i2c_chan *amdgpu_i2c_create(struct drm_device *dev,
 
 	i2c->rec = *rec;
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);
diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
index 314d066e6..3d174390a 100644
--- a/drivers/gpu/drm/radeon/radeon_i2c.c
+++ b/drivers/gpu/drm/radeon/radeon_i2c.c
@@ -918,7 +918,6 @@ struct radeon_i2c_chan *radeon_i2c_create(struct drm_device *dev,
 
 	i2c->rec = *rec;
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);

