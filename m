Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D959F72A5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 03:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640DC10E44B;
	Thu, 19 Dec 2024 02:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wiz4x8jd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C6210E44B;
 Thu, 19 Dec 2024 02:35:16 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-728ea1573c0so290410b3a.0; 
 Wed, 18 Dec 2024 18:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734575715; x=1735180515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zz5f2fkK5TyUEN5/ypHLYKDvnfLQ33CHwDb71kc+wK0=;
 b=Wiz4x8jdikthKgCfv6BY5z67V7JYaJliEV1ndcCl67DVrn08zmI/h/JgYqudBEgMow
 aRMh56JFW8Nf74QsTm7oW7d7NrasB6faZRSj/crpa16yETcu5sXgF3eOHx+B60ifGe6H
 qMy0zLH+9gKpb2jJsvbd7y4G9iOmj0S6A/RwWWSGz1UIgpotZo1MgLjaYUSADEYhKzll
 aMERShPNH1nqKaBdOUs8/JpR6DwknNk0P5ekj/KOVZSr1fB3X15SUp3CmpiSaLU0JVzd
 gKQR3EBV1js6MpInv2z92gAMSMsrVxhECcp8gblalsM96BbdrHt3krNJA7EnRGWCj/yp
 ZeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734575715; x=1735180515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zz5f2fkK5TyUEN5/ypHLYKDvnfLQ33CHwDb71kc+wK0=;
 b=kXk+nJ4lr9Do6Fd7ZlBJ+mofqwRIrjfztuau5Ul3ZvzDKJAmX+IfrsTYrgxvFvEmk3
 AN7qQmAOAe2RkCZ4T2mwJi460N8ubL7t7INT7Pq4kSK7QuI3Ms6HQqzO5Mu+e717+GUB
 JEy5UloTnOp0cSOP19zW2dZS3o2MEadfUR1cHwSozWFi5nTtOOt79kKbH4NlQSx6Oaec
 dURr7ucxigIxT2ami+rwVxkny2ut/h0aG2G7YQPENvrXvdHvxU1S9Ti1G7bepKSwuOfr
 Sk1M25DZK4WqMkh+ep1XTKxXsuhhD+hSIFyfULXjnIfTysgp0OCjXsuE6EWUMj20sU6h
 g6zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4regOXPovfBhD8VXxLf2WNWaeiCYRpiNpfzmdU9dmNFTE1CO1kY6Y+u9VR+tal3dixVcvAK1EBD9m@lists.freedesktop.org,
 AJvYcCVZuY78NbdJEaA7v7AG83E8VGWluVGIxmTGAkqp95E1Fa6amVMB9Cdd6EAwH3y9SBMgHuLMzL5zP1c=@lists.freedesktop.org,
 AJvYcCXjbbcvWNA7zAwbz0jipdrJAHzebU5Row9Pn05ymx8vSjaOlXnymBwc4iOiZD/qA2ASN/fCdWaGMQ==@lists.freedesktop.org,
 AJvYcCXlN+EwkGWDVKmQ6kCmAvI/DXXPGfDgHEbIm9sQQ2r7LJ+2vNmpYcYRi0cqwaeu7QDfVemLUF/kx7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA9jo4oW5XVAsHwdPZOCaawQuBHJFdG31jktfI27o1X3zKfygL
 ILlXpdqbCXoDqTC4heV2UZiNaoghjmEx+cxG9BFK8sJ2ZV9XwrRK
X-Gm-Gg: ASbGncuWFXqxAbdzoSNL2LhzNmFTC09k0UtsN4/Hzw+ylNxrofxZqkqFo4hoW4naInG
 e7SZb8rrKVvINWnjF3N5H7HOIc3oYavl0K/14ZzNz4QMQM8ktHFNk8GLAJb8Kjr9Dq+vd84c+WX
 L6CN7Vt0WYe7cfK/kqqEW8R7+iMUpbHwDQJ+7lo+aLFznTzQ3guyOP5vzlpUk32G9nUaKkAPznQ
 c8nGiYV22lhU2t9AwToESXlUvyuUlpMDFzKIF/W/SzqR1HMr6SALeYwLx26wVmIzIVFXKNQYMdN
 5dDyjVc=
X-Google-Smtp-Source: AGHT+IE+5BVERtvEj0uFGUNd3NBBPkGat0lwCNqupmyw0FAX2xvKE0cJmTowKcGod/Hmj9SrgliLyA==
X-Received: by 2002:a05:6a20:a11f:b0:1e0:c0fa:e088 with SMTP id
 adf61e73a8af0-1e5b4810ff0mr7532504637.18.1734575715510; 
 Wed, 18 Dec 2024 18:35:15 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-842b821da83sm142163a12.40.2024.12.18.18.35.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Dec 2024 18:35:15 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, pmladek@suse.com, kvalo@kernel.org,
 bp@alien8.de, andriy.shevchenko@linux.intel.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Yafang Shao <laoar.shao@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH v2 3/5] net: Remove get_task_comm() and print task comm
 directly
Date: Thu, 19 Dec 2024 10:34:50 +0800
Message-Id: <20241219023452.69907-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241219023452.69907-1-laoar.shao@gmail.com>
References: <20241219023452.69907-1-laoar.shao@gmail.com>
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
 net/wireless/wext-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/wireless/wext-core.c b/net/wireless/wext-core.c
index 3bb04b05c5ce..bea70eb6f034 100644
--- a/net/wireless/wext-core.c
+++ b/net/wireless/wext-core.c
@@ -640,10 +640,8 @@ EXPORT_SYMBOL(wireless_send_event);
 #ifdef CONFIG_CFG80211_WEXT
 static void wireless_warn_cfg80211_wext(void)
 {
-	char name[sizeof(current->comm)];
-
 	pr_warn_once("warning: `%s' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211\n",
-		     get_task_comm(name, current));
+		     current->comm);
 }
 #endif
 
-- 
2.43.5

