Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D85182FF32
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 04:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D2E10E629;
	Wed, 17 Jan 2024 03:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDCD10E613;
 Wed, 17 Jan 2024 03:13:22 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5571e662b93so8719950a12.2; 
 Tue, 16 Jan 2024 19:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705461141; x=1706065941; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WgEOXnBwtjV0DRgAs0TONH+yAncBHjvW7O8dDZAmbmY=;
 b=kUCtG8WEoxI17DlM1YzAZ/cN8FaKx5Gq1FI4sb/yT8oyo16EDs/jEHstjHVvbAyN3b
 tbCiPztVkW8SeQKdqqyWL/oE85oLnvJmP5wWGWgoT+fuY6ksP+d08FjY24pmdKprZM9+
 4QrKPvk/r+0ce4dPIMFy39jxeFNiSPLbK3xBJitpPRy6zTmlQTu60g9tL0HDQZgEvkJd
 Xm2GxgD7auFXfzdGtSsg7wKyr4IVPxJECt5KIYBfcokXtlHG3rAZgQDgzxpEuXcf0s25
 3sfgZRfGt0Gm+p+Qu0Suog46/lsrI4uEpEJOor8xfOvhfYvbr9kG925bQ83uSNJ7aXj+
 2T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705461141; x=1706065941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgEOXnBwtjV0DRgAs0TONH+yAncBHjvW7O8dDZAmbmY=;
 b=f/30HH8h+FcekcKdIldi6Zp6P5asZbK6A8h1v8lV7Ct3pGUcPl2kMfa3Ab1aC3YwYu
 VTVpgvvyAXJ9KAjdjpb07J9gTyuMYeU8cpwGsgmrTgUTmMeXDRmC3AYmyHI95R5JVExd
 AYnnhbk5Alv91uobbeb8CcxeWFu1VKlD7cAmBWvSZKSZ0EfcgI0NL0O/dHr2uAR6jTgA
 ELKAz2CHggEJOXszuwBfP1FaBsq51jsKHnSAHrCqJpf3bLaN/4TXH5/JhqZg0K0qOtdE
 TywpXrlA+2GI+6DX5lwb9jNcM2nzgznfywnCEHNq4mIRxy20M3kdGvzo/tGP3MMwhk3k
 odPQ==
X-Gm-Message-State: AOJu0Yxy/abAGtHnNLdbTlyjmC94KY5uUgmy64E3pReVWFiwWPxex6zu
 k0SuhfDmskPuTm5Up0vaCMw=
X-Google-Smtp-Source: AGHT+IFbr8FIXBAVFLQAm0BnJme9prl4lYGU0GNZbLVZDPfrnNKHuH2dSlYobzkRpW1IT5DgI99FTA==
X-Received: by 2002:aa7:d389:0:b0:558:9126:5673 with SMTP id
 x9-20020aa7d389000000b0055891265673mr4261820edq.39.1705461140983; 
 Tue, 16 Jan 2024 19:12:20 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05640204cd00b0055971af7a23sm2258418edw.95.2024.01.16.19.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 19:12:20 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [PATCH v1 2/6] drm/lima: reset async_reset on pp hard reset
Date: Wed, 17 Jan 2024 04:12:08 +0100
Message-ID: <20240117031212.1104034-3-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117031212.1104034-1-nunes.erico@gmail.com>
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 anarsoul@gmail.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lima pp jobs use an async reset to avoid having to wait for the soft
reset right after a job. The soft reset is done at the end of a job and
a reset_complete flag is expected to be set at the next job.
However, in case the user runs into a job timeout from any application,
a hard reset is issued to the hardware. This hard reset clears the
reset_complete flag, which causes an error message to show up before the
next job.
This is probably harmless for the execution but can be very confusing to
debug, as it blames a reset timeout on the next application to submit a
job.
Reset the async_reset flag when doing the hard reset so that we don't
get that message.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_pp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index a5c95bed08c0..a8f8f63b8295 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -191,6 +191,13 @@ static int lima_pp_hard_reset(struct lima_ip *ip)
 	pp_write(LIMA_PP_PERF_CNT_0_LIMIT, 0);
 	pp_write(LIMA_PP_INT_CLEAR, LIMA_PP_IRQ_MASK_ALL);
 	pp_write(LIMA_PP_INT_MASK, LIMA_PP_IRQ_MASK_USED);
+
+	/*
+	 * if there was an async soft reset queued,
+	 * don't wait for it in the next job
+	 */
+	ip->data.async_reset = false;
+
 	return 0;
 }
 
-- 
2.43.0

