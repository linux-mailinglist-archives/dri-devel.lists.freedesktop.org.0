Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9989F0454
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 06:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ECD10E4E1;
	Fri, 13 Dec 2024 05:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SooqcpWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FACB10E4E1;
 Fri, 13 Dec 2024 05:47:14 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2166022c5caso12160875ad.2; 
 Thu, 12 Dec 2024 21:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734068833; x=1734673633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gS7oaK0RsPIguog+zKCBYVnzq+DdL6weynD0punt/E0=;
 b=SooqcpWOMyT6L+d+J8A3U+MM6HS1Zct3Uya92glSX1EsZwBrCuMRBjQaB6G6XmZBKX
 OhLz9+fsvP3tFVeXM7+thySamGOtqs/gFs2tjE/nqvwcsKLThtGtI7ix+lFKVgLqFhDY
 jOoP25O7oOoITZPjoeYwqHpelrbXHESqmBYJtMmpX+HYm1FDetf7PO7pGxPIgAYREhrj
 MRS5stK3MauoY14vGXaPxZ8XjyB66SLbQ0oJfrdbRUiQJxnLwqlPl4tK/zJQyuiAI1JF
 k5pG1eBUqn5rkop5m/GJmvVnXl6nMyfzx7oT7Fdp2ODjsmWPYu0EliWercV0Hqm9mNKO
 4iVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734068833; x=1734673633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gS7oaK0RsPIguog+zKCBYVnzq+DdL6weynD0punt/E0=;
 b=hcrQr/q5Oyxb4i2SNljT6oH9IK0BCnWBxLrAZfZuLpvU8rOoZCTB8F/DZL1UWUv+GA
 Qmcpp4jzN/u6xhr/g98+xE8Va20AcTLBEhv68qORry9txwsqh8pIXNKgMvGb6Q240tFP
 XcIzChjEg+NCg+nr+7aGC8LcSnQAvM8vrWkBIdbFOJ0btTqW17vj8s+NU8mVVAluqIt5
 mOSOOMFs1UypVWRgPf3vJm/SFgiVgxB0gJugrr6RKngIzLEJ0wk23F2ebfV2GLHCZbyz
 AGiPY2pMAPd6Uo7DoCxS83v0IRykdr6zDRcK/7iQwzFDLGxMVNeRoYOwG9Ram0fiPtoy
 XYng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCa8MZT7JxxkR+Wn3CtC/w3e3o3rJPemQbtEYH7Ps84GuyHaOjq7UEYS79vSovDEmm/B/bzISB2JCh@lists.freedesktop.org,
 AJvYcCVVbESmras5uK42Vgfasp7ClkBlEbvL8jLLU+pRuVj1GrqhtTPNVOe3lUYJROUiqxf21tOEc4cvAs4=@lists.freedesktop.org,
 AJvYcCWXjZ3bENLnflz78b8GANS87lyRWES8YIXymmUo8dYLrETuv5s/tZd6T/eS3hX0IJBE3dl3JvMH4w==@lists.freedesktop.org,
 AJvYcCXCa+THm8osG364Y3SpXFzGma5+igllk+8N8bbtW6kpwT2QIxIT7QJIZ9ffuX+fc+v7ZF8dSUMSJkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUPY780y6GReLjARmsBGoKodW72tdbvcJtJQSwumDUo1w3JY06
 gyi7Pe8SfxgoXBiP8qSLN/m9tVRQu1zuBYT1wdhvC/wtQ1BQH86c+pNda9fHFm4=
X-Gm-Gg: ASbGncu1IQUDFe8mqzBTQ/enmjFTglyicHNaTNRT3jJqkYBSQtwn3lghP5WZamCeQw2
 bwhmj0KmoBC+nbg18DBG4249aIjvVqHKOOLe8H+l89pAxDuYR8f5ntgZAf14nyjMeBd1zmitgKy
 YRIKPbDOYy8KYpVrX+m/pJWYKrSLZgAQLF9SYeWje9z7gCzRYSiFkiHFIh8dulEHjqly0jVV3rE
 pWCkiHbRDvs8TGee5nhGsIa9Wbf1IPRML9XKmmj5nnkB5Sv7ZwcqJoDhK3dXSm6EqbYkkq1Rf26
 JGhe5T0=
X-Google-Smtp-Source: AGHT+IG/u9vPHYJsr72JqaDrYLM72r0Mv+gF1sZwvgldiU0c1giVELNbwcEluD8XRP6pboK2QDHicw==
X-Received: by 2002:a17:902:f60c:b0:216:7c33:8994 with SMTP id
 d9443c01a7336-21892a7a811mr23989435ad.53.1734068833602; 
 Thu, 12 Dec 2024 21:47:13 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.47.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Dec 2024 21:47:13 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH 4/7] net: Replace get_task_comm() with %pTN
Date: Fri, 13 Dec 2024 13:46:07 +0800
Message-Id: <20241213054610.55843-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since task->comm is guaranteed to be NUL-terminated, we can print it
directly without the need to copy it into a separate buffer. This
simplifies the code and avoids unnecessary operations.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
---
 net/wireless/wext-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/wireless/wext-core.c b/net/wireless/wext-core.c
index 3bb04b05c5ce..1f2a7ab546ba 100644
--- a/net/wireless/wext-core.c
+++ b/net/wireless/wext-core.c
@@ -640,10 +640,8 @@ EXPORT_SYMBOL(wireless_send_event);
 #ifdef CONFIG_CFG80211_WEXT
 static void wireless_warn_cfg80211_wext(void)
 {
-	char name[sizeof(current->comm)];
-
-	pr_warn_once("warning: `%s' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211\n",
-		     get_task_comm(name, current));
+	pr_warn_once("warning: `%pTN' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211\n",
+		     current);
 }
 #endif
 
-- 
2.43.5

