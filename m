Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5FE971065
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4E610E304;
	Mon,  9 Sep 2024 07:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BAmRtZ5w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F8710E304;
 Mon,  9 Sep 2024 07:56:50 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42cb806623eso6119605e9.2; 
 Mon, 09 Sep 2024 00:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868609; x=1726473409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8B7BVoErPcOoKPxSdUBz41r3SRVlI1m5+I4zzu3vMfI=;
 b=BAmRtZ5whs4lEky8awP37703iWCQSkOqOGJ5+NU/JgIi8YZhCcqYdYjFnuYRvPLWkB
 srha3XO7mqRCKpBS3AWOKhxTtw25NJQYFt6yu+0TXyVcgCK9POkz3ugjUKRzHezQNbRi
 odIw5mlzWm0C+BzPH5bQRNQkDzGgABOwqmTyxFGNs9fBFILh0SP36s4oWGAWY1WssLNW
 bWIF/WvMPPTfTNkpYAyY+HeaItv/zgBTu7fCt89+WLBDjsLgl8c/CSMNqHve2ez3fbhd
 5Wkp03DxiTS3nDP7p6EQFx0aHy4AF49Lj/QOS2pZFmfce/85XfXAZMZy8wCwtQfFPCMM
 I/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868609; x=1726473409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8B7BVoErPcOoKPxSdUBz41r3SRVlI1m5+I4zzu3vMfI=;
 b=q5Vcltq8+86ni/8WlKArkLhdeIh7j/BCE5Fylvd/B/IQd374UpYsqebn5atYZ/gSP7
 APrOyNh0hZobFB1GrU6/5pfHrQ3qAZckpqvP3HRIWZEkWVmv9ri5Eh6pTkKbNhPvZVsf
 1k9pLzPpjYEML1Vvr9PC93Zzynewg/XlbOuT3kcCAPXPWkP/TVOFUVhhmNqfprp9wyDs
 WzMukQn3E20NVMlsYjwTSgWk9T3k65HJupdNEHjPLhl2SbBTMRIbK8VS1sjMnq2DcWn+
 CL6ZOcqngQQyDoU+wxPWgMrjXgoBH1yCuMzLh3gfit0kgvMdHxm6zwD58jsfqF24lCgw
 +dEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNQfGVe4RPRmIn1vdTlvz3qpklecF5myTN9MQXdbgxLKw83Q9WqueTVurJnrGTQM71PJUC3TgUy2WT@lists.freedesktop.org,
 AJvYcCV477G3VQy8AQGkPHHFK/pBVTT/FSZi7hU+wagHyC8LxWKFtRexkQEHTVz0Fp6HkWfav5mz7uYi5kg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMY2ny8FQ9EXmrYAlyMutGmREIwo9pEMfHepna550EQIrJnJf4
 jPq9UHLQwRH7ldf6QSIdfKennPoqAaAMvuhVOWgJfe2OK2QQKeP7
X-Google-Smtp-Source: AGHT+IHWkhCod/cUhSnjyZKEZLy/v5Es+DtTGTGYiOp483T8sPZJXqNXcFpaXCFZinKhbm5C7GjmvA==
X-Received: by 2002:a05:600c:3b20:b0:42c:b8c9:16cb with SMTP id
 5b1f17b1804b1-42cb8c91953mr12858525e9.5.1725868608863; 
 Mon, 09 Sep 2024 00:56:48 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:56:47 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND v2 01/19] x86/kaslr: Include <linux/prandom.h> instead
 of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:44 +0200
Message-ID: <20240909075641.258968-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/mm/kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
index 230f1dee4f09..e17e6e27b7ec 100644
--- a/arch/x86/mm/kaslr.c
+++ b/arch/x86/mm/kaslr.c
@@ -22,7 +22,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/memblock.h>
 #include <linux/pgtable.h>
 
-- 
2.46.0

