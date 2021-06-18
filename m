Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB7E3AD87D
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 09:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9166EA85;
	Sat, 19 Jun 2021 07:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2046EA90;
 Fri, 18 Jun 2021 19:57:41 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id v6so8435846qta.9;
 Fri, 18 Jun 2021 12:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GY9x7msUmJcvaumS+lj9smAT8dHRMoBPIwcLcMKiK3A=;
 b=JdNn1KT6TaQiFeDktSjY8UE5naaRUyEo00QMZxWZ9sw35X6hk+553w0kNL3zV410JW
 L0Qp1o8ZkEhtOtAPbaSOKdK/GrfFzjPu8BEk9xexJEGgU/7ug2sB2vjt4b8GgBLtu4hn
 TwQ+DN8Sq9naCNurHRsMXJHDC70tVQP4fSf8t+V72eAK9ptEBZlnrd09dbjAn7yLw+JL
 XQHN0tLJdkWG5xcDJMXyergwK6RJX1NdaMlDDgy6pK9qFvjZedSRg1xaoBNEfGRchE6G
 jnK8fez/fvUKesUSARApcZ3MLPratI2k5reCSwouuTQHvZZQcmNXWqDBY8jSL3+0FnGF
 MIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GY9x7msUmJcvaumS+lj9smAT8dHRMoBPIwcLcMKiK3A=;
 b=bARdMimPitgAXvAD8hszvlfwoGATNHoQwwB60HhTVlHbcxR/ogMN1XY7mPUDiwWsWB
 679bo47TgcZKbVwxtri3ACRwmnrryiOXn+4aZJ1J19i18O2PdA1hJSGkzB7k0erh6H7H
 vaJRzKW6UVzFQLO3BcJYRDG70H+MvFvtnFWI4ZRZxmjLy8sTHSLl0uaczdUuNYI5NEwA
 HP1EV/ib4UwQuLP2T+kFXBPPa+tQ64a1f0I6y7mjZGYoVWJdLnLASCnJInjnTIM9b+TV
 IQeKbpUHkjURSijymAg3dpeylaueREVET1e3JYNq3DmPxLWpqoNJxxr4TVxDJ5FfrPmS
 D12Q==
X-Gm-Message-State: AOAM533LuJsYKFFwEUoTqD5Xx8o1TiFxyCBQ0W4U4eWRgVfjIm5/6lmZ
 HkOF8dYBC1ZE+4sJdjA75q8=
X-Google-Smtp-Source: ABdhPJxMXyrerRHfnKt4Y5jcTbuNcjxScLwJjwRAfJiwC4Sjv0jNq9Ke3GcbBRz8auKFW61AAw6YEw==
X-Received: by 2002:ac8:694b:: with SMTP id n11mr12234191qtr.97.1624046260236; 
 Fri, 18 Jun 2021 12:57:40 -0700 (PDT)
Received: from localhost ([207.98.216.60])
 by smtp.gmail.com with ESMTPSA id o13sm23438qki.44.2021.06.18.12.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:57:39 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Marc Zyngier <maz@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexey Klimov <aklimov@redhat.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/3] find: micro-optimize for_each_{set,clear}_bit()
Date: Fri, 18 Jun 2021 12:57:34 -0700
Message-Id: <20210618195735.55933-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618195735.55933-1-yury.norov@gmail.com>
References: <20210618195735.55933-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Jun 2021 07:44:34 +0000
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
Cc: Yury Norov <yury.norov@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macros iterate thru all set/clear bits in a bitmap. They search a
first bit using find_first_bit(), and the rest bits using find_next_bit().

Since find_next_bit() is called shortly after find_first_bit(), we can
save few lines of I-cache by not using find_first_bit().

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/find.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/find.h b/include/linux/find.h
index 4500e8ab93e2..ae9ed52b52b8 100644
--- a/include/linux/find.h
+++ b/include/linux/find.h
@@ -280,7 +280,7 @@ unsigned long find_next_bit_le(const void *addr, unsigned
 #endif
 
 #define for_each_set_bit(bit, addr, size) \
-	for ((bit) = find_first_bit((addr), (size));		\
+	for ((bit) = find_next_bit((addr), (size), 0);		\
 	     (bit) < (size);					\
 	     (bit) = find_next_bit((addr), (size), (bit) + 1))
 
@@ -291,7 +291,7 @@ unsigned long find_next_bit_le(const void *addr, unsigned
 	     (bit) = find_next_bit((addr), (size), (bit) + 1))
 
 #define for_each_clear_bit(bit, addr, size) \
-	for ((bit) = find_first_zero_bit((addr), (size));	\
+	for ((bit) = find_next_zero_bit((addr), (size), 0);	\
 	     (bit) < (size);					\
 	     (bit) = find_next_zero_bit((addr), (size), (bit) + 1))
 
-- 
2.30.2

