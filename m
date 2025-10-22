Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB62BFB87E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3478510E752;
	Wed, 22 Oct 2025 11:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l3ZvOTHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A32710E753
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:04:47 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-475c1f433d8so10994765e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761131086; x=1761735886; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ec4fethFoS2+SPeTVw+Fwof3KrdKYWIF/kwJYkEKmFY=;
 b=l3ZvOTHYo5JjuLjxcjoTrC7Wx4WKjMFW3RVwoSA3f8hUEBqs8OE8bu72jrSj9UP0PI
 l0Y3Pz19HldafAfaCAjky16qtOcQF9x6h91o+WY5Ln48Jn+SZCdxzJAJAeLyxxL+MgYR
 OPJpzDQjbxrKcANt9yeGBLhTvDh0/S5HzgpjzL79u9M2eqblEAOjStei2qLPmO6ibw+4
 1qycKIlQLY5vzJyrLhcUORpfpYvfJw00/QreDsv8rosegcj0VONXEveo7SaLo7gZnUTH
 /kzBmNgmc4kSYFG8CYayT3v4lF5imtbJViGIe3AsiXgCsM2WXy5is98pLL/V56QBzqeW
 7q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761131086; x=1761735886;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ec4fethFoS2+SPeTVw+Fwof3KrdKYWIF/kwJYkEKmFY=;
 b=ntl/j0UedUXSUDOkapkt8nIfgVuaOOT10PD15lOT7f7cLo4lkk7034vBn5kcl39ekW
 B7HlDIkWY0O2bGx64eJCFF2i3tMvWXgqxCKP1HW/U4r4HttIXlZLE+x7akx0h7O9mdYM
 szorsK/AN8J1yxu/xukV8VfWY2d9EbfD/qmoJ9+/YvDenlFilacuFxG03h2lkntFu+Y3
 b4mZgGBvDPenJHj3+hhlTB2uJrKVZNQbCdlLyN20vXhCN4S9Jn0RvoiyjgJyz5oYjPX3
 LQZPntmHLjONDu7bvdERb6CKxeyWQFfPG6Id6Ppq37RWJ1jQ1M77yVhF8ycjLVZLmMrD
 s1Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMLECVYAHtMEGZyKoZpuz7fbIZmJ7fMYp+G43DQAIy2O7gZUDx7H/Ex1sraBxTc5xKXF+HxDvZmmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzm0U2VEotXuHx70sYyt8rdf8WfE/c4J5D/HfxUY5M0Nd7Upae9
 u9xK7OnaoRuZrsvhby67E0PVHVeriO0XxCimyfO20kXSt0wBNiItXbWBXqdIv7ZKv7U=
X-Gm-Gg: ASbGncs/oRuL0Lm4zGQrkReX58URb1XTFVBaC8P0Oe5vMjGtjXRswujj/epEyXQBzit
 A+aRXm3s7om4YimXmtv15bBki3Xi+dySsWJSYs1Dy+EhQVohUyxfJ8oussUhaR1ZOQgdll8HCXM
 vZG1e7zSy1U4wyBwajA89/nIWkAm14r5HgbBV9Xz+FsHqqBUa2cJ26gY1EElqXkhCQ/YJYnlWVm
 nCmMhugojwyfvPEwc0g9YAfIBmN0Cqt0/O8bdR0XdgXGXOCAE734/zEKxC0bRRdvCnCV1sgVTyv
 qsn3LRkTwwFJiwAYk8UhaEVVjHnItJ95g9QSQaVf4YYZ5qiIl95ByYSwackfee0rlmV50axTrOP
 gpQxd93bl2HvD2vPiRoq3pncwhF6poy9XkKmSTH49H+fQv4xhki+cE/7+6OjSrVKtCebo4RLO3s
 4Lfo0iJBNeYzMddj/n
X-Google-Smtp-Source: AGHT+IGMYkocvaBnPACpDrQqTQlINhZBUKIMjE+J1fPKEeBjdhwvP+lt5c1FWsAPVXg7BnBQuKDcjw==
X-Received: by 2002:a05:600c:621b:b0:46e:48fd:a1a9 with SMTP id
 5b1f17b1804b1-4711791fbbbmr156254735e9.33.1761131085678; 
 Wed, 22 Oct 2025 04:04:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-47496d4b923sm33430975e9.14.2025.10.22.04.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 04:04:45 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:04:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/ras: delete an unnecessary NULL check
Message-ID: <aPi6SqcrGtBvK24S@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The list iterator in a list_for_each_entry() loop can never be NULL.
Delete the unnecessary NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/ras/rascore/ras_umc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_umc.c b/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
index 4067359bb299..03c4cddfbfd9 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
@@ -207,7 +207,7 @@ int ras_umc_log_pending_bad_bank(struct ras_core_context *ras_core)
 	mutex_lock(&ras_umc->pending_ecc_lock);
 	list_for_each_entry_safe(ecc_node,
 		tmp, &ras_umc->pending_ecc_list, node){
-		if (ecc_node && !ras_umc_log_bad_bank(ras_core, &ecc_node->ecc)) {
+		if (!ras_umc_log_bad_bank(ras_core, &ecc_node->ecc)) {
 			list_del(&ecc_node->node);
 			kfree(ecc_node);
 		}
-- 
2.51.0

