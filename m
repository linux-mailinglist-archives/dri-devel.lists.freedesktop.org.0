Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8182D0BA5C
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 18:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F3310E918;
	Fri,  9 Jan 2026 17:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="oBTAZU7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9A310E90E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 17:30:23 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b73161849e1so878086866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 09:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1767979822; x=1768584622; darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=soBNR1e6XweQILJtXjtm9TEGUThkXw+V/3f+H5hzVkI=;
 b=oBTAZU7x1Fb6LX6yEfKt5OD8ai0rSZqyCYUZ6HVEdWG525SnojmUOskn0w0XERNlko
 92tRRGDt0yiwCddfJBXy354OPeUlsRvA7+eaHzXt08N134zRvOJGKpodEvd92VikZa1K
 nzFglIQIrq1XtUTC1J/cD4I00XZDYrN/Qx8pN9UrCXpCHiwqalvfGo8ufbJtC4E/sL/z
 R/QKG9zO01ozw0xhBUftSD8Ef/E0a2PlhitiVPshdEGojkpz3zDzD5OWquwClj39sYe0
 LGGPEGft6XHp2IFElcX63XA+kYbfyYdGcddwDG1G5Gxa3QjJdLn6qcXwSq5kgH7VRSqb
 RBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767979822; x=1768584622;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=soBNR1e6XweQILJtXjtm9TEGUThkXw+V/3f+H5hzVkI=;
 b=vec+vVFusKJpAU4NefjqrBxGXzbfpmcxu3sayE8eOXrlJM8wYnp1u7wkoqLb3h1Y04
 ro6nq8rTl/5Y6yw5DTpMcXrjHQJVovsQIJZyfXMpNoEhh4yl452gVy1lLPHk/gSFTlZx
 hlUnYbdu5++D3LnLc/Yl0A2cABmdcrl4OwZeSQGKVtHwe0X5HzT+ZELH5sV052Tkq1xR
 sILAY3c1o/h2wnnlHMhyOgW+pcBJnWYfzYlbFq3XlIJoOOKws0FFYDBDrosLttnqyPQw
 9l+1RUjalunLCFkW9XK/d1fpZr+7KidlC8kCR1/PklZifaFTU6ObMEGYT285gqPiR1WJ
 7M9Q==
X-Gm-Message-State: AOJu0YyicFbO2f0aiFg2fG8uWW7nyexX6+VwDUsukFIka8jCHJ5EYI6j
 5GtibicBbOQKfrdnewsswMeoT5lT6sLuKZkuJcCiIbVWXgmY26luk6KElZVSVea9zAI=
X-Gm-Gg: AY/fxX706CAzBoiwODudkbOBWOLC2tuv54k1p6ZQhd2Q7KgU2Ui5uJ8gZapXTl1q/Pg
 bDMybZcB1eabLkji8lVlJSNw7E+DygBvW9uZ7gZHoKH65cdv7lMFkRQGPqubXVgyS9mHkipLywb
 p37pKE7Q6WqTZgIHO0tar9YweBzJYH+EiZTg5wVGSZSR8baIX0DlLZHSWqgpAU3hjksb/iHLfpw
 X1BOlBUJGyKg0/iM6ZCtPs1Vez2JYD+75HrUP7ti4WyKeLo8lM5ZiclEEcnFkxXW8k4+RvGn1Hk
 IiXLOegHfKVoVBg5FibBXJxJD5zlZSmhRvgCiVy8KTjBnL322efzgL+jrzh85LQ7fdyaZKTN+Kz
 wSFMd4O8IYO/xSrKTa1FCI/SjvViepXL9LpKLIzQrA1w7IPqJ3jGsvAtVjfFChh6DUaXa0NlQO/
 YbDHzKuaEBcEWB6vut0sUQU8ntLIes08D2mRrWf6gDIXJ/SisHx+hDiBCSlmGuqP1LpHROfBs=
X-Google-Smtp-Source: AGHT+IHFU94UKK7N8MjH0NapjtAUM1yZypK3zcxYo0z9XKFp722c/LN1D62iYRnj+aYYDrmJMwDA6A==
X-Received: by 2002:a17:907:7283:b0:b73:79e9:7d3b with SMTP id
 a640c23a62f3a-b84451ec8bamr1068044566b.25.1767979821976; 
 Fri, 09 Jan 2026 09:30:21 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a230db0sm1195426266b.2.2026.01.09.09.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 09:30:21 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Date: Fri, 09 Jan 2026 18:30:12 +0100
Subject: [PATCH 3/3] drm/nouveau: Increase GPFIFO ring buffer size on Maxwell+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-nouveau-gpfifo-increase-v1-3-ed0be9822878@mary.zone>
References: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
In-Reply-To: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3
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

Since Tesla days, the limit has been increased considerably.

From the various testing I did, since at least Maxwell, it is safe
to use up to at least 32768 entries and this should be matching
NVIDIA proprietary driver behavior.

This patch increase the ring buffer to 32768 entries on Maxwell and
later allowing up to 16382 entries to be used by the userspace.

Signed-off-by: Mary Guillemard <mary@mary.zone>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_chan.h  |  6 +++++-
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index a5445e97179f..d4a25a442568 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -233,10 +233,24 @@ static inline int
 getparam_dma_ib_max(struct nvif_device *device)
 {
 	const struct nvif_mclass hosts[] = {
-		{ NV03_CHANNEL_DMA, 0 },
-		{ NV10_CHANNEL_DMA, 0 },
-		{ NV17_CHANNEL_DMA, 0 },
-		{ NV40_CHANNEL_DMA, 0 },
+		{ BLACKWELL_CHANNEL_GPFIFO_B, 0 },
+		{ BLACKWELL_CHANNEL_GPFIFO_A, 0 },
+		{    HOPPER_CHANNEL_GPFIFO_A, 0 },
+		{    AMPERE_CHANNEL_GPFIFO_B, 0 },
+		{    AMPERE_CHANNEL_GPFIFO_A, 0 },
+		{    TURING_CHANNEL_GPFIFO_A, 0 },
+		{     VOLTA_CHANNEL_GPFIFO_A, 0 },
+		{    PASCAL_CHANNEL_GPFIFO_A, 0 },
+		{   MAXWELL_CHANNEL_GPFIFO_A, 0 },
+		{    KEPLER_CHANNEL_GPFIFO_B, 0 },
+		{    KEPLER_CHANNEL_GPFIFO_A, 0 },
+		{     FERMI_CHANNEL_GPFIFO  , 0 },
+		{       G82_CHANNEL_GPFIFO  , 0 },
+		{      NV50_CHANNEL_GPFIFO  , 0 },
+		{      NV40_CHANNEL_DMA     , 0 },
+		{      NV17_CHANNEL_DMA     , 0 },
+		{      NV10_CHANNEL_DMA     , 0 },
+		{      NV03_CHANNEL_DMA     , 0 },
 		{}
 	};
 	int cid;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 294d061497c0..708ded06a859 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -67,13 +67,17 @@ int  nouveau_channel_idle(struct nouveau_channel *);
 void nouveau_channel_kill(struct nouveau_channel *);
 
 /* Maximum GPFIFO entries per channel. */
-#define NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT (0x02000 / 8)
+#define NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT		(0x02000 / 8)
+#define MAXWELL_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT	(0x40000 / 8)
 
 static inline u32 nouveau_channel_get_gpfifo_entries_count(u32 oclass)
 {
 	if (oclass < NV50_CHANNEL_GPFIFO)
 		return 0;
 
+	if (oclass >= MAXWELL_CHANNEL_GPFIFO_A)
+		return MAXWELL_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT;
+
 	return NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT;
 }
 

-- 
2.52.0

