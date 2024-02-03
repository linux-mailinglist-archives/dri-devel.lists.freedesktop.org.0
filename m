Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727AC8488E9
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 22:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2478B10FD1B;
	Sat,  3 Feb 2024 21:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="Gzl+rbpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEAD10F748
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 18:24:46 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6de28744a46so2417172b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 10:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706984686; x=1707589486;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:dkim-signature:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9wvmygpMXKch9KjcDbs26g5cam8cyiZFx8cVfTokl0Q=;
 b=dT4QzUpw7b/m/VtDAstFTQpeRita6htqhON2QjSPXDZ1PufmDxFO3QOJO+grm0XGrK
 +ZkpCUxTEpLLdlF2BHia1B+1m94uVeiDityyXU7QgyQJ5xsoug/quivEjjkHCMGc98oF
 ovCKgr/4jw7SUraW0UQAu78KjTXeX3fh/ihqS8AhTfxM8cTyMraLIXoIEEzDJovII5n8
 TkSu6qgsvuCo3iiq1+Q42eZ7od2bURRaeDXO+KNcFNeQqMxtC4gxS27CzUnF4LF5kWhC
 pLOnLYsNDHksLhzNLfx57znzVbE57xHGg571eg7Mizovg5/AdJ6ZhVCV/QSIfNDANF8d
 rQWg==
X-Gm-Message-State: AOJu0YzBMawPkgSMSFY43+n9Em57ziCgbTSkpwMPka4CZLGSAY2Ofw1i
 AfAZQxf88YhN7J52z4Qqvp3lzBV+R8T0Cy+wTJNOYb9eWEDNVg8b
X-Google-Smtp-Source: AGHT+IFQVCelozL/GNnweEhB8CUVXpac1LsrkVkHvqyHoNGMKBPqqiNx8r/TGIcpMURRFb1sdCXDUA==
X-Received: by 2002:a05:6a00:2b56:b0:6e0:3361:ab48 with SMTP id
 du22-20020a056a002b5600b006e03361ab48mr770083pfb.1.1706984686331; 
 Sat, 03 Feb 2024 10:24:46 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUGEKQka4PJeL/5J+MzrCxnk8WdgpBGlxgHwEEaqc2IgzivGeBfvhzQUawlnZT0L4o6juNzHqaUhrTB5CycOYSXmoyBbPMIiPXnMckA606crreFBMb+r70h5O7f9De5u1Mzohx1Ja786Y1hmgHX64bUZ5Ej32DsDGQS1vzFuqSlCFFtjfdlE0wR/c+LG/KcOOY5GrAmbfbJ/CKuByMmpe6INFNy01b8/Z7p8q2DNU2I+2wN/Iow
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a63ed4d000000b005cf9e59477esm3979859pgk.26.2024.02.03.10.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:24:45 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2023; t=1706984685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9wvmygpMXKch9KjcDbs26g5cam8cyiZFx8cVfTokl0Q=;
 b=Gzl+rbpt03600Z5QlubY2Uz0IOXHrdFq6L09LLKOLrscLk37b4a3dHA1QCZWduMcw1ZYCv
 EFw2NxDVEEP8VW4tyS/ArufOSydhNEFzGOWgbTQYVdFJC2ZfmsaXer2x1j6UPhQrHcJCmC
 i5GGluBBcdSK0lBR+lmSybIKo9NHYea00Vtzbfo6lg0UFu2ijRWHWD+uz5OGSciKxHmmrv
 oZlOheH2XlsqnjAgOzJRJzbUDH8am86XqUjkj5d2ckfFPbt8f+pyyeebO6FbDBrGtoD8dM
 ooaPr9lj/Ezj3PuFgtNl0lLZC3xagAqCcI06Nj0deTQoTFFGcab/M4v1nQ3uEg==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Sat, 03 Feb 2024 15:25:04 -0300
Subject: [PATCH 2/2] drm: mipi-dsi: make mipi_dsi_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240203-bus_cleanup-gpu-v1-2-1b6ecdb5f941@marliere.net>
References: <20240203-bus_cleanup-gpu-v1-0-1b6ecdb5f941@marliere.net>
In-Reply-To: <20240203-bus_cleanup-gpu-v1-0-1b6ecdb5f941@marliere.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=Jb2CPAEe0Zv9sdkMFnExsmwVmtr4EceLYp23eTMTLN0=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlvoUC/Lz6356r1q0GAvsmkQCwWxHc5uvTWgroU
 kdL/uMoE6qJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb6FAgAKCRDJC4p8Y4ZY
 pl10D/9i67GeFbwaTagf1GafrmidveAEGjCdW+xMz/LNxIarAFa/ouvJKDcube/GztA9Z0OXUAX
 9CZhxQJhglbI/CAFkJix/ooeAVD2l5wxWlJLMvdwdj0TIZCkomI4eh/cGp0PG7WLdNo9GODNQfU
 o7Zdp2uWzVVFL9z/Rj01C86bVVUU+AKelJBM9D2EaTd7gPrWVinKD2r4/KnVk9m5O8JTm7Sjp9I
 OFpc8UOPECwR6ibfvjwroqaVvs+6eAxpSBXjmhT2h2dMRqnWrMcJnXGoRaXBl4x+TMjfTdmgN7+
 r9PX6tHQq7mCh63bjRxl1j7DHNulfiIXmQpjSI5X9gzPGQ5msCOMS5uygT5Qseld3343Q7FnhVX
 rlSCUpaXYfU9dDKmNoWcl3tdD/DLXrRyb4Fjftlpkqphuvu7ynfe/tJHq5HM47LKa7SOYV86g4d
 KHln5o0G5hzTCAQR3NYcuxs7FxzyF6+TsJ/Z3hd0ULHzUhQTzOc9EP09QI14nJlzay6KFFaPkZA
 bs5n0kjvA8QLCBpmOhemY0l7b6ooODQCnSU0u2WFA1hd8iUnugqCrCBNBxHW532DmuchW+ADjik
 snN5nmZQLzF2ugSNvpQ+em677ZXlUixigIuchhPxwZjeUIySzrXrVWXN+NX0RuMCWEdrs4Vox3E
 xVD+kjlhTvOptWQ==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Mailman-Approved-At: Sat, 03 Feb 2024 21:20:22 +0000
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

Now that the driver core can properly handle constant struct bus_type,
move the mipi_dsi_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 843a6dbda93a..ef6e416522f8 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -89,7 +89,7 @@ static const struct dev_pm_ops mipi_dsi_device_pm_ops = {
 	.restore = pm_generic_restore,
 };
 
-static struct bus_type mipi_dsi_bus_type = {
+static const struct bus_type mipi_dsi_bus_type = {
 	.name = "mipi-dsi",
 	.match = mipi_dsi_device_match,
 	.uevent = mipi_dsi_uevent,

-- 
2.43.0

