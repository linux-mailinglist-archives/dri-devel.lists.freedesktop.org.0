Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D307DD9BB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 01:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC2B10E5F2;
	Wed,  1 Nov 2023 00:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1513910E5EB;
 Wed,  1 Nov 2023 00:26:22 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3574297c79eso22148415ab.1; 
 Tue, 31 Oct 2023 17:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698798381; x=1699403181; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1C+2NMg1JH09l8lpRwB0Ubzh+mfktnl5vVkwETAlRt8=;
 b=YJeo0ivieNCrqKCsNYML+Oi1TWrS8zvkXPxGUon+AG3PDcYbPUJBWVAZ/aWQtp8DSv
 K9vBoSPKugFz9KcNLcS/sq8Ol/LjUn6w8hmgianDJiLongqR/YzUlpf6FzF59q9XLln0
 ru0mVPZdkdYX9Dqq/McB6LzSI+QePNuPJMuEpSioTwgJIs4h+qoCWSdXKrqPdHEDCOBx
 cJIwQjzCJHBGC/JhaWDoqifWozFVEZ+dylrR0L9cpvrwTUMEcd5TrM/E5+qvnh8lEpxm
 ANeobKLp1AY75co4s+imeSXbx7+c6peme7WTlaSTqUQPL8tWMb4f4muAOCdx+Fii29cq
 1wXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698798381; x=1699403181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1C+2NMg1JH09l8lpRwB0Ubzh+mfktnl5vVkwETAlRt8=;
 b=mPm1rUc1fAKN6Crhim/2/hPIyenc4gpxBn8UKRxB8EaNZ1RHAD/ULTstFayk/ZXjmE
 f1nZB0ro58EBrUR+IM6QYKLHq2F5hORa93khBgYIfcFxmXriYBpFoIR+mDMaBIu497Rz
 WmWGuo8tIEN1g2HkaEwpRW+RFxsZJofESeUJ0q5kK1Ma7hY+bKL7mbSFm76gfcamk9wp
 wyoF4qMpt6kE8JiRin3Er8DK3IJbPyBXbLjW6oVmXz2SwbR2TreqECM+QdKt1yrrQ2uV
 XyZ5XAdVLBlAHrHU5E91Qtqy/4u82qgGweH/lV9dR0Lis2DYQ4YclyjMf/RonNkxxTwV
 h0sw==
X-Gm-Message-State: AOJu0YypXNp4cW5L5mzLDTDdB/oralzG7gdlgH54PxJVG39qUPFLczEp
 9l4tZVi4X47az4IyqgvoqbM=
X-Google-Smtp-Source: AGHT+IHkBAKd0v4sabAiwOZ6Frg7FF4WYiVc4qinzWmOuYCNDVvs+YpA63Dkxm+3LAL7oJXh0CcdwQ==
X-Received: by 2002:a92:c244:0:b0:357:f730:cc4c with SMTP id
 k4-20020a92c244000000b00357f730cc4cmr17966574ilo.6.1698798381342; 
 Tue, 31 Oct 2023 17:26:21 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:26:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7d 03/23] dyndbg: make ddebug_class_param union members same
 size
Date: Tue, 31 Oct 2023 18:25:49 -0600
Message-ID: <20231101002609.3533731-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101002609.3533731-1-jim.cromie@gmail.com>
References: <20231101002609.3533731-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, linux-doc@vger.kernel.org,
 daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, will@kernel.org,
 groeck@google.com, maz@kernel.org, mcgrof@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, arnd@arndb.de, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 linux-arm-kernel@lists.infradead.org, lb@semihalf.com, yanivt@google.com,
 quic_psodagud@quicinc.com, joe@perches.com, bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct ddebug_class_param keeps a ref to the state-storage of the
param, make both flavors use the same unsigned long under-type.
ISTM this is simpler and safer.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4fcbf4d4fd0a..5231aaf361c4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index ceb3067a5c83..b984ce338921 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -796,7 +796,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.41.0

