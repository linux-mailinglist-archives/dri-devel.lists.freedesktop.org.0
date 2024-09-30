Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494DF98A2C4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F59A10E43F;
	Mon, 30 Sep 2024 12:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ub5nO6T+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA47A10E43B;
 Mon, 30 Sep 2024 12:37:33 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42e82f7f36aso34403775e9.0; 
 Mon, 30 Sep 2024 05:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699852; x=1728304652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QP8C+iJ4JK1Je/p5BuVlufkcfyY44goQKWFtPIGK2ac=;
 b=Ub5nO6T+fexlFYovOD69rN+9VzvxYWbt8tu25pr3M9kvd1o+kocgCd2crBAesnSl1l
 u/5lIcors75ziDgzJx16KHrpG2pLfQEFCSBKeGVVE6Du6C8AyxTfQmtSnxhWxJ7fdJhm
 NOZ/hBgCIRGvkuXKu/dQv3hIHuimaqr0GMefTqcDxqSpe6jZSEqzftgtXXVsZxutzVFh
 JafTBZwemjiJveYMyCZKKno4wF9AHw+hGZm3B/ZBYoKGeaweUoCbh5/Tay9hvwUU9HXw
 XVQ5GLdnIq+tMoYDDFZixHlaCOwL/1EyLCdJG09YcxkjekJTwO+yhCGKOs5OIdfazgqe
 p0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699852; x=1728304652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QP8C+iJ4JK1Je/p5BuVlufkcfyY44goQKWFtPIGK2ac=;
 b=FM37swTrwnkC/EQpIx8mTEvNpukRBvXT0lsstXLMQ+UUhpYWPo69Hm/2j5YXRH/3Qs
 DbRlNIVq+oPrmXOJZvdw2fyx5GeqR2CRKVEibkSVdVQUav7UiPTsJaf6HN1bj2uF3ysD
 krRoTpSAq3uMCrhPf96PM3+z3sMbe95qAycxLoXEVdAy0/p+4f8P8VugYvN+eLdxxAwK
 k5z9qi2OXCGJq9VDFXV0z7rz2NWmx3wqFI9zPTeW4uHmPd/2oVaG3On0Uy51VsFCGcCL
 EYukQRWkdOyid7sWlZxBm8+1UInggM2VglHvFp2M0+lOOeHaWmD2xqy5ntcXb7VRuDnY
 npiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdc+V2+kAUHoA/aqlixdY+12Q/L+20gGLUy+8rVEqq35Yn5dQHfJwMe58pTuqADjJzTwM+8+z9HFs=@lists.freedesktop.org,
 AJvYcCVjzxl2vGrd8ADXIlF37BSFXqJg3fhjM2VTNLvRuiFMHoPbyIPaBYANDtPrc6py0ClTH+2XFM61jlve@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrVID9u29qwkkktuV+eQlK19fU6vW2vXu0KMMVXMrxLANALEXz
 Q09vDBv7DiTfRf2OO3NxjKCh3T7Jz2PNqlOupixZaMIHnDql3CoN
X-Google-Smtp-Source: AGHT+IFhXFsuzmbiOuOqLO3F1XUYhHCyK1gMZJdEjcH96x1NbPGi/KaJvtZi9F1OwQRNBRa/x7UBZA==
X-Received: by 2002:adf:f1ce:0:b0:371:82ec:206f with SMTP id
 ffacd0b85a97d-37cd5aa9c14mr6102871f8f.16.1727699851849; 
 Mon, 30 Sep 2024 05:37:31 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:30 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v3 17/19] netem: Include <linux/prandom.h> in sch_netem.c
Date: Mon, 30 Sep 2024 14:33:28 +0200
Message-ID: <20240930123702.803617-18-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
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

Include <linux/prandom.h> header to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 net/sched/sch_netem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index 39382ee1e331..fe6fed291a7b 100644
--- a/net/sched/sch_netem.c
+++ b/net/sched/sch_netem.c
@@ -17,6 +17,7 @@
 #include <linux/errno.h>
 #include <linux/skbuff.h>
 #include <linux/vmalloc.h>
+#include <linux/prandom.h>
 #include <linux/rtnetlink.h>
 #include <linux/reciprocal_div.h>
 #include <linux/rbtree.h>
-- 
2.46.2

