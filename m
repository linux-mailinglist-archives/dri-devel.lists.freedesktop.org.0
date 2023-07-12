Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D576075089B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834FE10E082;
	Wed, 12 Jul 2023 12:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3FE10E082
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:47:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31438512cafso7475488f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689166027; x=1691758027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=U3ZCk3eAmtscaWlsOqqn77IMDd+zWNzYSst4sakZn0U=;
 b=HfmZoDU0bHio+KNDZG1qEu7OgR1UZ7Fcpj+lHfxSeeTlfDI2Dl8/76U5vXnGCgtzec
 7Rbe2nH5cVmTzRIQFYJUN08ldnuCzpLeewUFKP2MhjoGzbb/FYG7pQsFxJmRpO/YAU6+
 i/aorodrSb/h1xx/sQR86Lj7jBPuZ13SLwsRR8PcVqZOjg42fZ3kzfiFfGan0pi6XTwX
 Tast76XIUZRIL6DMN6h0StfucxevaVAZcEUeJI9tLft9hCqOWesEplHGcrW5Ys1Zuayq
 2JgxVXuFaCH3D2M4fm9+EBhUg6aobL2fRKHO0jwO/1fQquz587DDxFfcDTpzUDnoIpMu
 9zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689166027; x=1691758027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U3ZCk3eAmtscaWlsOqqn77IMDd+zWNzYSst4sakZn0U=;
 b=UM9rLK4UMr7eO9R7dh4B6ouAlF4tias4kZi67M/0PVp0O5QJTzii6IN1FH7oBU8ocr
 8HHvNGzAN6j45W49fXX8NCRTm7I9Otovce4tDJIX7Ugf4UfIXDMmzqjHFZCD39MrXYEr
 zFb+XUmRCXYuDsmM3whCKlGVWA78Qf+iNLNIP4qDaEB1OAW347zdfbbrjUwKuZoJhaq7
 HdtjO8k2hQOeB8N0ddqyKKmH6oeZvWutaIgpHnJwejUnKkbbAGSycojn7Ygm8oXXn85B
 4kZGbkdNtVVTyqBGrsjM0Q861Y1wJJ0KQ3alIKQxkSk/XokxSRf+1QdE/3f4Q7SHOJF+
 faXg==
X-Gm-Message-State: ABy/qLbdim6HZUtBKbZZARvairCvUVZZPComBtpvz9yGTI9SCS2WznC+
 wh7g1apBwjiDd3/23PCEfwEcLC+G2t0=
X-Google-Smtp-Source: APBJJlHeu3pfG/5Bg4WrJ3Z+wByypdDZ2dyszjkCejJuNNKNPRvLedz4FjZuL53XpED6TAODVfylOw==
X-Received: by 2002:a5d:6902:0:b0:315:8f4f:81b2 with SMTP id
 t2-20020a5d6902000000b003158f4f81b2mr14115524wru.64.1689166026707; 
 Wed, 12 Jul 2023 05:47:06 -0700 (PDT)
Received: from EliteBook.fritz.box ([2a00:e180:1557:4100:d4c4:2bb7:77d6:6d86])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfe508000000b0031424950a99sm4989225wrm.81.2023.07.12.05.47.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:47:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: Switching more drivers to use drm_exec
Date: Wed, 12 Jul 2023 14:46:57 +0200
Message-Id: <20230712124704.333004-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi guys,

with the exception of VMWGFX this moves over all the drivers to using the new drm_exec object.

Please review and/or comment,
Christian.


