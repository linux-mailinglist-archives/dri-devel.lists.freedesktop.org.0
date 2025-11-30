Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C161FC9562B
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 00:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B5A10E293;
	Sun, 30 Nov 2025 23:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cx7BZTRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0958B10E067
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 14:42:32 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-37ba781a6c3so28143401fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 06:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764513751; x=1765118551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p73b8XMlnTSi7KqBmjtWQMkQBIAWTKM0Ot/hr/K9NMU=;
 b=cx7BZTRNr2/QFLtRcSzL4vKpESlfrAFzXpOiCJM5amQ9wQUzN3lFyecun78cPWX2HD
 n1Imn+dFLJWetvblMliTPBVl9hQFn+VEPltS4BfyScptTSJhllhLTXURa/w+zc6ynlOm
 YVDs3IFAPMLYEn4VpFXxZbKm2l4VwYHa24A9UfJkC6xplXK6MYnh/4vB8F+MrvScCxQs
 HPBqjcOUpEFHHDlcggLPBhXwoFY2h/Uca6juc63l8EGXJA1qDc8sX25RxnRSh4DznnQf
 uYalInRwp2puQ//dkdccmddDVc+S+fTPfLuuVdrE3Vokh5e7i6eKNYi+g/swx0E9uyT7
 KJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764513751; x=1765118551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p73b8XMlnTSi7KqBmjtWQMkQBIAWTKM0Ot/hr/K9NMU=;
 b=aq1IfH0CduJJWcnwx0mfApNOnZuxSjY+PxffBdPZOQXyrvbR6y7exgxwkoVOEqup0V
 cfs+nsxENFGdYXYWt5kMZPUGiNKW1oD3HIy99SS1JecVdhKTrl4iaNCYils4DVMskZoL
 TRkHFnTjZblXvN0Au+fNfBeb2L9z1pEIFOZhEYtf1tBGwY8dPhV2V5NDJy5icwW6Jvsg
 mPQkzFCiYtC56UReehfTQZqrl9I2zY3ndxa++SclPUABcOXEqVzwKOR03dN3usUsL48k
 JMW/vt2c9jbqVt0N2CbaqFjJyWnfmtHNaXWwubKLTqPdYZs19uoNJQvhJmoUuJReteH4
 RVLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOuj/I/CPRJssYIZAQKtOYuZ2VBgKtVWLiURLVdgaCirJOzIkUEVV4eWreh3Mk8GMpX5K2umQL28I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS7wsavDE4nh2qhT2lxoQjR18YJo42+EzBmG3bri3ZlfrkXdpH
 tjCWj5dcx0+KI4PQWcQFqOuA74FlSVmXQuddzcY8lUez3PqRirZGOFnq
X-Gm-Gg: ASbGncsHJdE+JwuHTok0GtmSRQfGH/2h/4i5K9n3cycuu3Mgyxpq93witvKbInJPEDq
 Xr4t2lNvgZ+0t/RZYwxHtyjGa6qfp/APo/O+YHW0kBcy7i9B7LK4iJDcu1ae10b0lhBP3m3K0Xk
 vkgQaqBl/rU65xAfPw8oV2GAZMA14TpXpKa9KrpKe4G57s4kkLp5hiVoUlYPPW5XNBBJQVsfH4V
 h6CJEwJ04tsoo+KWmsnMi6qZmy5zimMoI6GCS4LC+SHZUVZi9MI6kDlR+sTWgUtA7aAlM5H5IPd
 qRRbl5eThrhdiC0tW7jvMhyszHKoCFJI0LU2gpkzBW5EPO1nkMqmLq7OjYpx6uXFl0R3MrzuSry
 9u7UAcQPcA8NqIG/FMDDgUAM/ciK2sR/ttMAcQ+2Qs9HDrDtv3LPmrp2hsOhBJPNDY3dp6N3xu+
 AK+Bku++uo2R2CsBK2wkEn66+zRV/9amg3iYTokd3mTQfOCex7
X-Google-Smtp-Source: AGHT+IH1K7vOLIGvq0uhY0khDGnZ6O5dtNHEYSExFHc8Hxw3O6yt++WQ+vurMa839//Vrr6SIF7E4w==
X-Received: by 2002:a05:6512:2304:b0:595:8062:135 with SMTP id
 2adb3069b0e04-596a3eb322amr11827999e87.20.1764513750889; 
 Sun, 30 Nov 2025 06:42:30 -0800 (PST)
Received: from home-server.lan (89-109-48-215.dynamic.mts-nn.ru.
 [89.109.48.215]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bfa48cc8sm2846041e87.83.2025.11.30.06.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Nov 2025 06:42:30 -0800 (PST)
From: Alexey Simakov <bigalex934@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: Alexey Simakov <bigalex934@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Francisco Jerez <currojerez@riseup.net>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Alexandr Sapozhnikov <alsp705@gmail.com>
Subject: [PATCH v2] drm/nouveau: fix div-by-zero in nouveau_bo_fixup_align
Date: Sun, 30 Nov 2025 17:42:21 +0300
Message-Id: <20251130144221.7689-1-bigalex934@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 30 Nov 2025 23:28:49 +0000
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

The expression 64 * nvbo->mode can be zero when nvbo->mode equals
U32_MAX / 64, causing a division by zero in do_div(). Values greater
than U32_MAX / 64 cause a u32 overflow, leading to incorrect results.

Since nvbo->mode comes from userspace via ioctl, it must be validated
to prevent crashes or undefined behavior.

Add a check to ensure nvbo->mode is less than U32_MAX / 64
before use in multiplication.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: a0af9add499c ("drm/nouveau: Make the MM aware of pre-G80 tiling.")
Co-developed-by: Alexandr Sapozhnikov <alsp705@gmail.com>
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
Signed-off-by: Alexey Simakov <bigalex934@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 96a8b7b1215e..774888ffa4a8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -207,6 +207,9 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	struct nvif_vmm *vmm = cli->svm.cli ? &cli->svm.vmm : &cli->vmm.vmm;
 	int i, pi = -1;
 
+	if (tile_mode > U32_MAX / 64)
+		return ERR_PTR(-EINVAL);
+
 	if (!*size) {
 		NV_WARN(drm, "skipped size %016llx\n", *size);
 		return ERR_PTR(-EINVAL);
-- 
2.34.1

