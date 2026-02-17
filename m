Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO5tI1IelGk1AAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:52:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416E01495BB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D187410E452;
	Tue, 17 Feb 2026 07:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cEMXejsH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5A510E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 01:48:21 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-649278a69c5so3230481d50.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 17:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771292900; x=1771897700; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BjA8YI4abbHFrmSC0kcj7gswukKzCoDbvbkarUE29Sw=;
 b=cEMXejsHlw5cfppB84cngoAGGMlb403OhVi5nRX8HQVtvgax26XkBbnAZ1VEa8raX+
 xXt8xvSW4gBQ0072HGM6UakqjXjCGSXMTxkvc+Rbz7Pu6OhdF7MDpugYZuAvdvvw08Ri
 KDmWrjRfpCbhSNBv88l3s3vYFpRGwwMzAoAKmJ7Y6elKLJD3OjELRudbbrPB6NnFQGR+
 zYLbUI4PbjVKeCeZT6GuWByTufvDmEVctLHh8+Ti0U0AzRabR5hH2JWgApHVK3B2lfHI
 T+gUdUcerQy0d/x3x5ecbT5HlGBmhkmqF9uOPvGq2VUIMWnv0adUOV3DlVfNdQDH7mJU
 OoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771292900; x=1771897700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjA8YI4abbHFrmSC0kcj7gswukKzCoDbvbkarUE29Sw=;
 b=Oh7V/8akigqi37alerTqj0p6gTiYnvoV6xr8M8NU+Jbyii/2V7xkLUjzM79xUTU067
 6tbHbijPZNenydEjADDvSDNFVc/sKzSc84EQ/3M8LVtcqQ3X9uhzzA1HpyozipMyIq69
 NmyogTsMHhelb58c0iq4vedq7VKz8XKtZeXd7JkS32THyAtkltca5T+30cJ3Lxc7YsHJ
 ieQxdRM9k0OqY2jy1KSuk0mrrjr9UE0KRl33pC+hOCZIXJbEzNI4tQXiWZtlIANVwiPh
 uvdU5CbxoMr0LqJug1k2dk8k5wwr5dQjLM1WTbqTz737YlHidK1lnxMaMygOjewoeE3b
 T8nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnPMqH1h2pg7pJStaLBWvnRsMk/UZzpOXuc4G2eYUvgOWwMOBcdjcx7cwrFPs8p7Y8jzko4k8HkoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/B3DlQlF8ApbFNWvAtm880jsBqEpXBlbXoDmTRRhvnbeePBYP
 6LmhDVoQ3cFGW5hRFpFzEjDjrQGnrAdhk3RRsTOF1ZiisDhjO/mNJdf8
X-Gm-Gg: AZuq6aLCjFaIjTAMWfiMYbsxqh62yZ53+nK7E11Y4007KJgoLsFKXqbUah4+x7m5MCz
 boK4zHKzXyUy1KiWsOwcH1kpBBIANBrg07mxKykwY8tSSosMXyq0zly64jmq4MWy2xm+kPJeB0o
 2Lq54TUFcaeBAPha2ik3O9JsnX1pL5wjKSxyDgzB+5VlJc4z3QD7RgeGQM/7XO8l1SB6jMJA6pN
 EpI5fpObnmzMwEOvcZAJ5NFx+RVboAvlTiGQ/nUd6ynGeIYJG2OIT5jokPwyEQ0BovLZxI8xutW
 ZJ1mMYdGG7xfoSy7GErdBiHLIezwzVGFb1GOf1ZkkUGnqV4CZmOxld6gj+pkT/LLLoCHOpo5pAl
 CZIBYwxYbs6iy2L1CiArWJIKc3DFTF9/MPJmmZXTkb73G9gQW8YsdzsD+W5CkZQKzuLlYvMv2DK
 FvTKm2S+DuCQzLfZHblLBvReJKdzRQheeMi4PV0GJiGYODcux6qj0JjUX3dsqyb/RugGd+3vaSI
 +5qLOpTWDD+tHyzNG3qXZFYvZ0G5LiyDnV41lyiYbk=
X-Received: by 2002:a05:690c:b1d:b0:796:55b1:a16b with SMTP id
 00721157ae682-7979e81638bmr110018307b3.31.1771292900128; 
 Mon, 16 Feb 2026 17:48:20 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-797a668ad26sm43680067b3.37.2026.02.16.17.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 17:48:19 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 mripard@kernel.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] drm/sun4i: backend: fix error pointer dereference
Date: Mon, 16 Feb 2026 19:48:01 -0600
Message-ID: <20260217014801.60760-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 Feb 2026 07:52:42 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:neil.armstrong@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:ethantidmore06@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 416E01495BB
X-Rspamd-Action: no action

The function drm_atomic_get_plane_state() can return an error pointer
and is not checked for it. Add error pointer check.

Detected by Smatch:
drivers/gpu/drm/sun4i/sun4i_backend.c:496 sun4i_backend_atomic_check() error:
'plane_state' dereferencing possible ERR_PTR()

Fixes: 96180dde23b79 ("drm/sun4i: backend: Add a custom atomic_check for the frontend")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 40405a52a073..6391bdc94a5c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -491,6 +491,9 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
 	drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
 		struct drm_plane_state *plane_state =
 			drm_atomic_get_plane_state(state, plane);
+		if (IS_ERR(plane_state))
+			return PTR_ERR(plane_state);
+
 		struct sun4i_layer_state *layer_state =
 			state_to_sun4i_layer_state(plane_state);
 		struct drm_framebuffer *fb = plane_state->fb;
-- 
2.53.0

