Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D46C7F055D
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8972210E1BE;
	Sun, 19 Nov 2023 10:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3F210E1C3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:15:08 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so474285166b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388907; x=1700993707; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
 b=NQCTh6FF/RvtkkLAT4Z7gFKhkTKyLHegVr8ag8z3z66yEjQjIYlE2RpMrLUT/rhWoo
 m4jpbriOP90WbZKddoJrh4guXH8yVr5+pyB2/HkEKKTprsaciGhikOy0fT7Qr3NmpIpR
 OVid21/OEk4oOg5xAFd5iyhOxuOD3N84yvRWDJa3OeyC6TSUjr8ylugBK2rx5GLe+ddQ
 cMiR3VzSwyccSA9uDIY/PmEQmMENqgH+Cr4TvhQl04gDq+Fuf4KvyzIt63DUR+9RblIf
 /5EA0NU2kvoGQ2mXLgLcuBhGnUgW8NJq9DNsHY02/j5xyZJQ8z3bxHzStugQcOETs/Sd
 gQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388907; x=1700993707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
 b=iK/z/s2hjTyWFDutzS+qXckogcX5yBHH7ze4j8oUstQXT6MVwbsgNvONNjYPliKutt
 7prfV1KD9qnyuxj2GJtk2vfRGGKbf5SMQccoLEq0wZJvtwYcu299KycBKTrNW0NwKU1E
 qhYb6sIYUV8n1Yn1MPYvIhilFuVqDZ+zpN6QndgxXg0F15V+dX4sT6FH9eAvMeOjKU2d
 vfpzRYlghQGQ9LW7CRnPUHM7X+RHXRSSqPr4kvD2Qmavb8UyiKoX2mPM+HbnbKpHYg7p
 bSmeihfThjF7I4YoWSG8xm+5D7Tg+xxWLFClzE82zGrkx6cexINt46dK8dYsqAil3gIm
 hycA==
X-Gm-Message-State: AOJu0YypV9B3G8jSRlbTeMtYcJgG27QQGtCC5rhl8De0ux61IVF1G8DA
 qj/pVis9vtcUbHU7n54bb0o=
X-Google-Smtp-Source: AGHT+IHz4Mkuei+5Zlm1vnh7Y4mgzhrej2LzRNWm+r0PgkV3RcbkaFxreIMEyEHshEm5B+Cmem+Rtw==
X-Received: by 2002:a17:907:9708:b0:9e5:e56b:9b7 with SMTP id
 jg8-20020a170907970800b009e5e56b09b7mr3842857ejc.42.1700388907007; 
 Sun, 19 Nov 2023 02:15:07 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:15:06 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:44 +0100
Message-ID: <20231119101445.4737-20-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-i2c@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/display/drm_dp_helper.c       |    1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f3680f4e6..ac901f4b4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2102,7 +2102,6 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
 	if (!aux->ddc.algo)
 		drm_dp_aux_init(aux);
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	aux->ddc.dev.parent = aux->dev;
 
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 0e0d0e76d..4376e2c1f 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5803,7 +5803,6 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 	aux->ddc.algo_data = aux;
 	aux->ddc.retries = 3;
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	/* FIXME: set the kdev of the port's connector as parent */
 	aux->ddc.dev.parent = parent_dev;

