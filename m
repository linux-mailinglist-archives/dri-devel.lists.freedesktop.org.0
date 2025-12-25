Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F38CDDF2F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 18:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8365111A7CA;
	Thu, 25 Dec 2025 17:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="De70Yv5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0710411AC14
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 17:09:38 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-644795bf5feso5902657d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766682577; x=1767287377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dc5Me+mE1rk9t6TSSnoEi9o5UAq5H187I9GSo5hasb4=;
 b=De70Yv5VEHQ/dS9ZJ+vZwubElt9AgNXvZEC/jfRVRIHMgrx04aNs2Mi5mttVQQoBBn
 sojIk9465kr/4xUTi9zAZVHIq+oe+ySXedgn+sf9HR2aXktYh+FMiFYnIDDSPCxObUPx
 4B81O7eBfNJ6rjCoYyLveoXul0WLPX6GXeu9Xb9hcJTUkvoZh6ciILyus0RRN2ck7k9e
 qCbvUMgq/xKy3yelgve+8YqH8ZIy95x8uwUCKbFwOiCqVs2I71izLVy2YkGLmbRs3TVd
 L9XMLCrbtzmcbKXiQTaJthIAWt5cmKjzJR3UTB3iecbQ31xcwx5zoCJFnX+XSC3iW+wx
 T7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766682577; x=1767287377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dc5Me+mE1rk9t6TSSnoEi9o5UAq5H187I9GSo5hasb4=;
 b=JfVIPStTaNq3J0Y7gUtbBtcrCBPcJ97BJ8ubN7lfK5HRf29U7hN3gaEAKpFmQunc7F
 z1n/f7Lyh5MUkMS5KoKGq26cingB/CKhaN5911vclD53+rDmdIxhgtY8WD0Lybw2Res6
 R8VrgNtLAkDOOQfRsEg2/nFFUrSj/Q3SZa1z9OXQeuclTlBuTOuYJwW9c0KdX1QyMPtz
 AQlm2Ns9+IE1Yc06DiLpPo2z9euPBenlHHyqqQGne3t1CFAz9BiWhRvG/02+yZdMY6GW
 qIom3nGMco1UyRCrgKP9GtX9jcdRQfvarj/L67ar/gGQbIxrDb2kCjQFrOY+lUkruf12
 8YFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXYj2vRC9AEuNnTi0tZFLWt4oG4XSwwuzB0KDvkJ3TFjWoGAZgvF7b85vtMXMtaJO64a8Zs5217MU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkSxTUEIuZfrxFOK0oHllLiERkoGBpeNMr57FsTtNIlM/ufsrJ
 3nb+Mt6NbTCzynoK10cp146s1zfsDs91nRr6jbw90cR8zqWb9JSS3V25
X-Gm-Gg: AY/fxX4ij/IB8iH+TOzOFZPhy5r8oRTaCTMSw8IsTeAs1HkySFazjSNlz+Ym/DsYcT1
 anEuZ7ccrpJ7PUBRUpSVbJiSSlCY0qYbVk4RCk+UbFdXYdxxtazvIAEnHBxdqdc3pfbezLtvKea
 Yv7TrH/OGZi9PlplA0YzlRY+63mwcg6lPEB7l27q51DJ/Sg/SDbSKhBAFp+KnC6Sa9xu/5GYza/
 5RskR2poH/bXWG4rEJ+INBuGlfz7zjixsvTE6eP8+uGPU5xiMGU9rxQEfPhXcY0hJiHiGlkGW/t
 6kT8pzloNrD2VzzE9CfRh/nJXQA3MAzSRNFm5lbAhhF+gugy74pNEz7er+rcQFZVOKkybCxpKru
 IziKSiI5Jl/fGnzoBA9ejas4gVBOvpPYiqPRVpRAGLVpS7qSCBEBcuuoeTl+tWpb8mK9wvr/+7g
 gfZZ3iJZ4=
X-Google-Smtp-Source: AGHT+IF3pn2lAHgaG+6TAPCfe6GjTjYcrsSqlU3VOVIzxXfAGamdgIbuGhSoSIuBjHiFa2I0R1eJBQ==
X-Received: by 2002:a05:690e:1502:b0:644:60d9:866b with SMTP id
 956f58d0204a3-6466a9265a2mr13857881d50.92.1766682577038; 
 Thu, 25 Dec 2025 09:09:37 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:5a70:118b:3656:4527])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6466a92186bsm9734975d50.12.2025.12.25.09.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 09:09:36 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH v4 4/7] kernel.h: include linux/instruction_pointer.h
 explicitly
Date: Thu, 25 Dec 2025 12:09:26 -0500
Message-ID: <20251225170930.1151781-5-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251225170930.1151781-1-yury.norov@gmail.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
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

In preparation for decoupling linux/instruction_pointer.h and
linux/kernel.h, include instruction_pointer.h explicitly where needed.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 arch/s390/include/asm/processor.h | 1 +
 include/linux/ww_mutex.h          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/s390/include/asm/processor.h b/arch/s390/include/asm/processor.h
index 3affba95845b..cc187afa07b3 100644
--- a/arch/s390/include/asm/processor.h
+++ b/arch/s390/include/asm/processor.h
@@ -31,6 +31,7 @@
 #include <linux/cpumask.h>
 #include <linux/linkage.h>
 #include <linux/irqflags.h>
+#include <linux/instruction_pointer.h>
 #include <linux/bitops.h>
 #include <asm/fpu-types.h>
 #include <asm/cpu.h>
diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index 45ff6f7a872b..9b30fa2ec508 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -17,6 +17,7 @@
 #ifndef __LINUX_WW_MUTEX_H
 #define __LINUX_WW_MUTEX_H
 
+#include <linux/instruction_pointer.h>
 #include <linux/mutex.h>
 #include <linux/rtmutex.h>
 
-- 
2.43.0

