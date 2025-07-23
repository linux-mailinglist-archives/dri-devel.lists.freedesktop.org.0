Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F50B0EC38
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C402A10E76A;
	Wed, 23 Jul 2025 07:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mm3yimsH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DC610E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 06:38:57 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e8b838203d3so824000276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 23:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753252736; x=1753857536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqv+T/SIEF1Kbneo/Sl7fRz3B0vTyt+hrI5wqB0sj7A=;
 b=Mm3yimsHytbevfftvxkSuS9HCjN0LdUOiPPkMXlzg3JyiONlMjfMpUvW7ykmyv35TW
 UZClbCaLsxyrP66tEtQNw3yBlkAKYRUoKCThSnfD6lbNRRazk0IXhIwl/321hxBdqWzj
 x/3MI4qv3jz7IgHLyRE9q83cq6OI2yFBes7bDQcsU3TI/OCXHExUbT7KAWkCtHeiib6g
 qyMq6QBpZgH2X3RtSCJoWTYwjUWe/HnGMUggG9JQ1CvjnbwmAlMvAZzWxVaSaeB+oq6s
 aUvy7FbnMiieMoh+RIeAs6NAnP3HmWNs+shuGeAAWtIfb7TDkySdQJUXJa41WL1A0/Vc
 b0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753252736; x=1753857536;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qqv+T/SIEF1Kbneo/Sl7fRz3B0vTyt+hrI5wqB0sj7A=;
 b=vDjcn68y4H6xOfF3vwl4F5zE3exVKenVfqX/xxz5B8Vsssmeqj/M47ZrCo7+wTWSeV
 +Vsc2uEugRfgFHVriteUHgNQXKYTZ5Cp0WEq3CsjM0dxHaPdXLftFjfCZYQVDmpCpyIJ
 QdhKcERJNMtwzt7sy7eDkf0Jo+/UmgmPuwqbxFZSEEYFSOls062rliwcXWxJ/wG3r88y
 SRw+CY9qmkF07EkTsgPfw64koU/DRaEI3D9roNf0D7RtxTrI3ik0u/ntrpmzIkkOyHrB
 DkP423WRZrNNJPv0TzBB6JxEkm/Zivt0EGWaZ1WBKyMi6SvRsbS5QN2S7aI/WpSEEfpI
 WaIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaEkNBIF7Zantf3DQ4Uta9JGa8ydX+m5uoLsFJzwLobl1j5mVBRhqPHBzhX5hUD7jWBKDhXv0/QAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq47Xiy+GPTibJqNqF7YNOHQlxbZxajwAQ1Ff+LOje20oBMghd
 XQgkSdsU4SXqEdQ/M06NUeuck8EJwmK/2vt1Kvl9ilVB29smufKxFUKj
X-Gm-Gg: ASbGnctU0U4j9s28d8hGdHqITUzgDiFumw13WPFW/pBYjMGqpRbcYGWo7dN0TYCsHSd
 KMV3OktaVn52JfAQoJTMsGwV8M8tzLGM5EgUeFBffOT55db3gbFdY+3K01NNgCdKnMN8hE/5e0L
 qombA5jivZI+zpYW9MYocz0NvZV7OLm5WHOATDUZ/Y0pudayKPXjmkvp9ysF1Gmw9jpwLv09Ag9
 oQm8uOyma5uQH8DQALus4bcfCcP/jKWAFXp0b+O/iHlRI9PDKTowkqOiulD/GDSs/Gf4Y456yyf
 tkBQn/aV+dp35+F0sVZ/WQ9sWwjm/WS37SgSkcIQ8o5MWu4q2OywB4DiaEPhKfvmtKeFLVxwQ/I
 Vi1BtyDRO7uP5PHG5YUnHDwgBL7xcTBtYB7YA0AJKQ9lTnrtZSKn0YJ+SlHnpM5ycKXkeokU/XH
 RFrO8ZzTUFEMk=
X-Google-Smtp-Source: AGHT+IHqmW49ZZANvNBaNgggrQ29I6My8kl8bn5i+sILCwaQX0HxqwrEfZnSXrOqBfoDKTsomvJbOw==
X-Received: by 2002:a05:6902:2786:b0:e81:b941:c210 with SMTP id
 3f1490d57ef6-e8dc5818abbmr1198612276.2.1753252735788; 
 Tue, 22 Jul 2025 23:38:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:6470:8880:4432:859b:f25f:b2ca?
 ([2600:1700:6470:8880:4432:859b:f25f:b2ca])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e8d7cc198a4sm3778895276.2.2025.07.22.23.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 23:38:55 -0700 (PDT)
Message-ID: <96e9e5b9-d7f2-4527-baf2-f7519ffbb612@gmail.com>
Date: Tue, 22 Jul 2025 23:38:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Min Ma <mamin506@gmail.com>
Subject: [PATCH] MAINTAINERS: Update Min Ma's email for AMD XDNA driver
To: ogabbay@kernel.org, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 dri-devel@lists.freedesktop.org
Cc: mamin506@gmail.com, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Jul 2025 07:46:33 +0000
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
the review and maintenance of the XDNA driver using my personal email 
address.
This commit updates my contact information accordingly.

Signed-off-by: Min Ma <mamin506@gmail.com>
---
  MAINTAINERS | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10850512c118..6eefa494000c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1231,7 +1231,7 @@ F:        drivers/spi/spi-amd.c
  F:     drivers/spi/spi-amd.h

  AMD XDNA DRIVER
-M:     Min Ma <min.ma@amd.com>
+M:     Min Ma <mamin506@gmail.com>
  M:     Lizhi Hou <lizhi.hou@amd.com>
  L: dri-devel@lists.freedesktop.org
  S:     Supported
--
2.43.0

