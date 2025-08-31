Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E24B3DAA3
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC4D10E384;
	Mon,  1 Sep 2025 07:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MtpMbpIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D705510E0A1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 00:12:50 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-71d6059f3aaso1236607b3.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 17:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756599170; x=1757203970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIpHgZuMEMBIYjGCBCUL23oZ9wiLkUHkgB6ohcFNE1E=;
 b=MtpMbpITsHSAJH4OYjKKJS6pfKRS7LPwJGucbuLTjzQcwJMG5STY1nizdU4RCNQNCL
 5Y1lIj5E9vViPV3cpJ8MNBxwXUmShb51ZKJxBxbWI+kCXP3SHh/QiGzYmCw0PAMJjLh8
 Q7b9E/GMCuKvLfK4215tfenyv2o/wkRb1tGe4yTNxsd8PC+W9306SVzYOUvjPjdhUxZr
 6kNqstp5YvZE8CoAQtcsVxiBuWdpVIicsKnqV73E/Gwd9FBr1hFCzNHE0hqmcTKAIvDi
 fBvoSo6Ht/4b11cmYvTOLQNJjcisR1BK2pZuYkfedw4coohl1YM1Vju8J85bwgghpbOR
 HAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756599170; x=1757203970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIpHgZuMEMBIYjGCBCUL23oZ9wiLkUHkgB6ohcFNE1E=;
 b=M6wrRnxQ7LQgJ16C9/noiee3JOQZgOaxXvDGp50bnoWY85nwmHnR+94Nn+pcYsHtvL
 cxYT2tybRTu9sTJpUe2DOwmVQvB8Xm9+twBvuRQc62+odKm0YT0fqakb9D9rnMkp6Ov0
 94GbvJxbL+jhOmT4+XiBNtyMBf5BoB9guqXhomjjC4M3tMTuRV9n91W+CLklL1+Rq/OV
 NXISe+Zi3ciWejBGVLvP/LTNRwo3dU04d9PukCkIl6QIBy72mTBzfCobdRsE7FGLqaAd
 RyMEoO1bJXeozzhoNGSbhOl8lrEaPLYWAVrxSUT8oVfwAFzGiMssQpLW9lHF7PTIFwbV
 /pUg==
X-Gm-Message-State: AOJu0YzM4YI89zEqYkraHqiNmMqeIojy0NiSHLzZPPyWECOLX+CaYh4A
 2C5bd4srcap83I6lbIUkAit9JnW5Xp4sodTeMBEWuevzYVlCh3vWJ8b9
X-Gm-Gg: ASbGncu6qZA7+b1SbLfS68dG2RK9Cm2HWamiELmdEeQvr+2Ecz/4m4gbyl8MwyBe/R7
 xLectpKgijzlfByOh9/PMUSedqNkOy7p5eB2sQ7CSxrhZLiPPnafM+YXdbVj37pt4Od+RdbQ2Vm
 XHvrbjsFM0IhX5i8T8sljE5HSXr1SeeCvO+TeabmhrAkIuuZ7inUbY+7C6GTpJViTZ2RC7nRN/o
 372yqmZKr07hY05dDrG25jlByqcSqbJRYvF3Drqn8IblPkApMd21ZegCjhWXVf0s86re+U37jfT
 g2g0CaCBEP311987uNoPDysmgt3uKjMvYdxp3mITLuVll8pSCSj31zbT7Z8CK79BaqHgkLOFFfh
 E1K6L001+hVGogMim4SHN82K7PJRO/3t44VFink8DH2IBwf7o+xdEvFrtu9Amm5fgWubL98BRhk
 BRjiSwBKm8QE229Y9672HJMjlK
X-Google-Smtp-Source: AGHT+IEB12C1slBWMgDluynqUliRzseU7UeHqm9h/4/nwZXuLSw4J/ZpLk5Mtoh9cu0eTNRdQCHBOA==
X-Received: by 2002:a05:690c:3385:b0:71c:1807:9947 with SMTP id
 00721157ae682-7226a3b0062mr44388837b3.5.1756599169700; 
 Sat, 30 Aug 2025 17:12:49 -0700 (PDT)
Received: from mamin506-9800x3d.attlocal.net
 (162-197-212-189.lightspeed.sntcca.sbcglobal.net. [162.197.212.189])
 by smtp.googlemail.com with ESMTPSA id
 00721157ae682-7227d90301csm4986827b3.62.2025.08.30.17.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 17:12:49 -0700 (PDT)
From: Min Ma <mamin506@gmail.com>
To: lizhi.hou@amd.com
Cc: dri-devel@lists.freedesktop.org, jacek.lawrynowicz@linux.intel.com,
 linux-kernel@vger.kernel.org, mamin506@gmail.com, ogabbay@kernel.org,
 quic_jhugo@quicinc.com
Subject: [PATCH v3] MAINTAINERS: Update Min Ma's email for AMD XDNA driver
Date: Sat, 30 Aug 2025 17:12:28 -0700
Message-ID: <20250831001228.592-1-mamin506@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <dc0227cb-7e02-10c6-9790-2e2331ddfd6e@amd.com>
References: <dc0227cb-7e02-10c6-9790-2e2331ddfd6e@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:02:45 +0000
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

I recently left AMD and would like to continue participating in
the review and maintenance of the XDNA driver using my personal
email address.

Signed-off-by: Min Ma <mamin506@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10850512c118..6eefa494000c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1231,7 +1231,7 @@ F:	drivers/spi/spi-amd.c
 F:	drivers/spi/spi-amd.h
 
 AMD XDNA DRIVER
-M:	Min Ma <min.ma@amd.com>
+M:	Min Ma <mamin506@gmail.com>
 M:	Lizhi Hou <lizhi.hou@amd.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-- 
2.43.0

