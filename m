Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B367E05FA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 17:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2820010EA13;
	Fri,  3 Nov 2023 16:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB9D10E172;
 Fri,  3 Nov 2023 15:50:28 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-28099d11c49so564597a91.1; 
 Fri, 03 Nov 2023 08:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699026628; x=1699631428; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UzPpHStW8fd1Sa/XvvRvmDs3ZUV3eU14pMhnuEaZyXo=;
 b=PJ+feD0m5YeG+/qU8tFRfEU2q+Z3gZOpdbFzad0VY34yy1Ra4eLVQ3niZ8pQUWGu0q
 cuRuOqpS2Q4gk3SFlnMuWpdMwhy+bEvlmkJfbZrtcmLjZvIi6VOLVNRsyT9Dl+J+Drvs
 rdcbFnFxBwhCv3KXuSSbdQtqduvL1+ztlEiUsBPefDq2IiqbcTl/bD0llbkEhZK+tGRZ
 kY6Ano0tk1Vpoe0znvnv6DVgcPgUZFiTRCr687agY7+ba2oncFnQLvqdHqFZKuf6PXLf
 A4whm5n4WE83QwSQyegHGYMIe92hHPF3MhGwF5l/Li8qqnbTmLxeqWPqXVYa2FswWBYR
 pIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699026628; x=1699631428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UzPpHStW8fd1Sa/XvvRvmDs3ZUV3eU14pMhnuEaZyXo=;
 b=crt0RpiHVziFojDGGaIoQwQ38E3PTmzpInYxXscZrtnv8LlbJiRC4rHelNhE/pH6Uz
 jnoNgTq88HfBY5JbsbkSRyInocKI2y+203TwA1plqRUJbIpIHUttlM7ieRa+T/7K8TsZ
 rUIelSDnOt29ZyzylgRQOxMWKn9xBxxPojYK53nsJGdNGYYe7UYwv3yY3Os4Ttg2zLO3
 mR775ny/RWESs0DO7sviqPUeaalNf52LpKy1TQpemImjq/MjHecgLkC2p9y8z61eSlTC
 gL/2Y2jR6QfNo07U5d0v8lp5bwTYG/OGDvlXZvxxUAhrTXhCtAiJBBej/TXeP7AiHhsS
 DDrg==
X-Gm-Message-State: AOJu0YwMGGn/5UWHxPszwKCifu8Wq12ZBfXO8Pw0IVmbYu0X+g9K/1Jh
 Ul+nRQmCC1PHhtNXjSeOId4=
X-Google-Smtp-Source: AGHT+IF1P3WyRtABQCc7gbOnKw/OsbBmL5Ob0nkdHmczkHloZMZMVQhl0Mb+oTGSIJdMVU+1lpfLXQ==
X-Received: by 2002:a17:90a:7064:b0:27d:32d8:5f23 with SMTP id
 f91-20020a17090a706400b0027d32d85f23mr21154782pjk.2.1699026628449; 
 Fri, 03 Nov 2023 08:50:28 -0700 (PDT)
Received: from abhinav.. ([103.75.161.210]) by smtp.gmail.com with ESMTPSA id
 v3-20020a17090ad58300b00274922d4b38sm1469858pju.27.2023.11.03.08.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 08:50:28 -0700 (PDT)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
Date: Fri,  3 Nov 2023 21:20:13 +0530
Message-Id: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:00:14 +0000
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
Cc: Abhinav Singh <singhabhinav9051571833@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sparse static analysis tools generate a warning with this message
"Using plain integer as NULL pointer". In this case this warning is
being shown because we are trying to intialize a pointer to NULL using
integer value 0.

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---
 drivers/gpu/drm/radeon/clearstate_evergreen.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/clearstate_evergreen.h b/drivers/gpu/drm/radeon/clearstate_evergreen.h
index 63a1ffbb3ced..3b645558f133 100644
--- a/drivers/gpu/drm/radeon/clearstate_evergreen.h
+++ b/drivers/gpu/drm/radeon/clearstate_evergreen.h
@@ -1049,7 +1049,7 @@ static const struct cs_extent_def SECT_CONTEXT_defs[] =
     {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
     {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
     {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
-    { 0, 0, 0 }
+    { NULL, 0, 0 }
 };
 static const u32 SECT_CLEAR_def_1[] =
 {
@@ -1060,7 +1060,7 @@ static const u32 SECT_CLEAR_def_1[] =
 static const struct cs_extent_def SECT_CLEAR_defs[] =
 {
     {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
-    { 0, 0, 0 }
+    { NULL, 0, 0 }
 };
 static const u32 SECT_CTRLCONST_def_1[] =
 {
@@ -1070,11 +1070,11 @@ static const u32 SECT_CTRLCONST_def_1[] =
 static const struct cs_extent_def SECT_CTRLCONST_defs[] =
 {
     {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
-    { 0, 0, 0 }
+    { NULL, 0, 0 }
 };
 static const struct cs_section_def evergreen_cs_data[] = {
     { SECT_CONTEXT_defs, SECT_CONTEXT },
     { SECT_CLEAR_defs, SECT_CLEAR },
     { SECT_CTRLCONST_defs, SECT_CTRLCONST },
-    { 0, SECT_NONE }
+    { NULL, SECT_NONE }
 };
--
2.39.2

