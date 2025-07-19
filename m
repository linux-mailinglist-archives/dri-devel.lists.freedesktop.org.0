Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A6B0AEA5
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 10:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE32D10E1E5;
	Sat, 19 Jul 2025 08:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="A2Dkewyh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F79F10E1E5
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 08:27:08 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b391ca6146eso2479161a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752913628; x=1753518428;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sJeA0ZOH8c7XggE0U2uw5Qes21v9D2XQPKfKpRuKve4=;
 b=A2DkewyhwDalYxbGf2j3+D5zL/fcA9L8Otl8pA+nDDQEl0gLreTdHFPbyjYXKTKUcz
 51WoerVIyMpSi3LrIZPy/d255wTIV6ms8beP4z8aDsmhJiAWzqePtbjzJGnOV/RlcL3I
 DuEg3rZYx4xCGd7ZsvjzmhDSU8fn5p5i906riEPBveWWQcfKYb+iC6IIVLrfi0K0m//t
 hkY87I544mKn3eUtv5MY+wiGFvh6VlR3JfkQMDgqsQhDfMxvkbL03g+XkfVuvXTV7tFJ
 0dRn/IQpaR9ADL0YgxqAksYowpArlMwHxZGqnTO5CmNtzMrgCvmPQZsHruL29LoYij3P
 aKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752913628; x=1753518428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJeA0ZOH8c7XggE0U2uw5Qes21v9D2XQPKfKpRuKve4=;
 b=oheZ1az17Mv1C3zh+jTju8Zg1Iz/MQM0MAJkD/avqcUjoZjZfGR7EiN20gtZOOBa7x
 VpeJgr5fcI7G4JRfR4VoH3boQRfwd2hA+/UMvfeTP7I26noLFBv03PulvOGOAFg0L6SH
 aNj/l0+WPt5PW/EYx4bcK9L5dHaQNzXJBt4mUFedVLp3C2TJiAuJibDxn4y2HrGKPKMF
 qja/O+yCwnHxX7pLmqJY/ZazMWVhKxtMz5pEMVeFhFpsLGA/HsNDEy9Rx/4Pmvd2v3dC
 RjaPKx0JQyUf5lKLXWqFXSH21bo8kP1qzn7Jo7oK2YnikZqXPli55F53vCknD4q0vw5X
 1bEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVftSTF7pp8+pMtEaqz94f60zpnb7oj3DOW/VeYXyKxLlZWsb9GMP2zCuEPNZxqaDimOpJzCOdzGMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZIn6gH7suwS0z0vb3dw5Y68n7au64BS5XIoIgZAZlFqHKq4y5
 aAC7CvbcNCMZXis+2PBn2K6RuzZ0avfwjuV1sAJrmZ4UMkfQlLy2O+FNgJt1SF2w0HA=
X-Gm-Gg: ASbGncsROjgbzTmIA5KqcQe8qtEnFl02/hgMK2rEciKsWeKnFc7RO9e0G06zaFml1RT
 +ee8Nm2hr2NUJPYqYE5jYM9F7jKzo7PlXAN72Rz6RJTvxUDJjUrlAUOj0RZtO4bjntHTmz5jXZN
 goOx8BW79f0kPSV/+A/TUm4PPbtl/9PgoctBUc987vdhAJbz6lU9X2g5purvqEosQuiLYcA30aC
 Uw4xBi1wiAP4Jx5ePb97ga5ABmWuhppqWSPdzZxvFl6ooRIXP3U6uaLkvt/EEObk9VQ3Tvara3A
 XdqYDhKRix4PEQthxp7PE6jgy28yGkg1hObEAtvzD+iiKL2Ot0bfRoQqyRTGy6iSDY0eB+7i2Dr
 Ql0zFpPcw7Yz0nshaYFA/ih2d69xUE2FdM4dfAwEyv5WgWpJdtQ==
X-Google-Smtp-Source: AGHT+IEtGHThs3c5zaWTIBYa9eDjBCvzdPq04CWI3MnLdXSZNpbYivBg67p870OLCeNcYRQCUXTizw==
X-Received: by 2002:a05:6a20:729b:b0:235:d4a:1318 with SMTP id
 adf61e73a8af0-2390dc6512emr16725964637.38.1752913628137; 
 Sat, 19 Jul 2025 01:27:08 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 01:27:07 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v5 3/4] drm: Remove unused MIPI write seq and chatty functions
Date: Sat, 19 Jul 2025 02:26:37 -0600
Message-ID: <20250719082639.307545-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250719082639.307545-1-me@brighamcampbell.com>
References: <20250719082639.307545-1-me@brighamcampbell.com>
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

Remove the deprecated mipi_dsi_generic_write_seq() and
mipi_dsi_generic_write_chatty() functions now that they are no longer
used.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 34 +++-------------------------------
 include/drm/drm_mipi_dsi.h     | 23 -----------------------
 2 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 4a7ca1261105..dff00d725236 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -772,41 +772,13 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 EXPORT_SYMBOL(mipi_dsi_generic_write);
 
 /**
- * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an error log
- * @dsi: DSI peripheral device
- * @payload: buffer containing the payload
- * @size: size of payload buffer
- *
- * Like mipi_dsi_generic_write() but includes a dev_err()
- * call for you and returns 0 upon success, not the number of bytes sent.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size)
-{
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	ret = mipi_dsi_generic_write(dsi, payload, size);
-	if (ret < 0) {
-		dev_err(dev, "sending generic data %*ph failed: %zd\n",
-			(int)size, payload, ret);
-		return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
-
-/**
- * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write_chatty() w/ accum_err
+ * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write() w/ accum_err
  * @ctx: Context for multiple DSI transactions
  * @payload: buffer containing the payload
  * @size: size of payload buffer
  *
- * Like mipi_dsi_generic_write_chatty() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
+ * A wrapper around mipi_dsi_generic_write() that deals with errors in a way
+ * that makes it convenient to make several calls in a row.
  */
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size)
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index ffdfcb57cbd4..528b5979ab8b 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -285,8 +285,6 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 void mipi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
@@ -387,27 +385,6 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 					  u16 scanline);
 void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 
-/**
- * mipi_dsi_generic_write_seq - transmit data using a generic write packet
- *
- * This macro will print errors for you and will RETURN FROM THE CALLING
- * FUNCTION (yes this is non-intuitive) upon error.
- *
- * Because of the non-intuitive return behavior, THIS MACRO IS DEPRECATED.
- * Please replace calls of it with mipi_dsi_generic_write_seq_multi().
- *
- * @dsi: DSI peripheral device
- * @seq: buffer containing the payload
- */
-#define mipi_dsi_generic_write_seq(dsi, seq...)                                \
-	do {                                                                   \
-		static const u8 d[] = { seq };                                 \
-		int ret;                                                       \
-		ret = mipi_dsi_generic_write_chatty(dsi, d, ARRAY_SIZE(d));    \
-		if (ret < 0)                                                   \
-			return ret;                                            \
-	} while (0)
-
 /**
  * mipi_dsi_generic_write_seq_multi - transmit data using a generic write packet
  *
-- 
2.50.1

