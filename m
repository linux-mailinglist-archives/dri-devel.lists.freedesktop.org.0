Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BA23D8116
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64D16E9DD;
	Tue, 27 Jul 2021 21:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D4C6E9DD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:16:51 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id k1so14618plt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w4Fdwl9HiFMZ+llOdhUBfZSYAz9VTvRZ/zqP2rqnbdI=;
 b=OubzHKZ8rQkxISQj3tvDfVhvRaRW388it7d5HkY7TCu/bBaa8Pr8HfYZFrPrOiunFF
 6bCQMEiL+lVzAM6jCwQcLzTiImmq8ntJYj7aynk5kXTfEehuycCEDZIeJcO5eJpfZQKn
 hq2FyEBWz+GBZM7N+a3OD/2asYrrsHtNzmSN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w4Fdwl9HiFMZ+llOdhUBfZSYAz9VTvRZ/zqP2rqnbdI=;
 b=bUj3CVLy/qNTy873fzlzCBI6kN0ByeAdNYlAeODteqr9MYRlw6reZWgsbmnsbw1uvw
 PTvxlMZCyxTjiwZNmA60oGV77PTbPzsY6esQW3uWbQZo+9O0kyNWJy0g1XGVQdu7hq5D
 4J67GpyGFUmeyB9bF4bCYIVxKxAWAqwdqE/lHPHmNW3DhOUkPWWy7SbubVL5HjOSKcQ7
 nU/rTvPCqTC4SZMLVCJg6FBEl13/nVhXRlk7sAw3ms3sP14zDEgYM7s60oaVazI9ftz+
 3WThwNuGksZ/SpkXARM+CB4XNmJ6HmRT9UPMV6loYepB6C9FrRdlNRGyA6y4cD/tEn/P
 gLAg==
X-Gm-Message-State: AOAM5335E1ZNmbhLgGD5GeDnqRW2vgI1uWFmTvc+hpzHlon9wokolP7M
 Eph652V7V5e+Twx7sj5bZeR+6g==
X-Google-Smtp-Source: ABdhPJzBdsmV+2iswoqD8g+SAJNwVreAx8UwnGfV68SrU1eBmBrhzMiv9tA9zD/XN/ReoAPLtd1HsQ==
X-Received: by 2002:aa7:9a07:0:b029:329:46d2:c6e4 with SMTP id
 w7-20020aa79a070000b029032946d2c6e4mr25255299pfj.81.1627420610912; 
 Tue, 27 Jul 2021 14:16:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m11sm1742495pgn.56.2021.07.27.14.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:16:50 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 37/64] string.h: Introduce memset_after() for wiping trailing
 members/padding
Date: Tue, 27 Jul 2021 13:58:28 -0700
Message-Id: <20210727205855.411487-38-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359; h=from:subject;
 bh=b9cZC+rDD66z1p4TxzACgUY06GpnBkPGzRd2vUJnnzo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOIfqyzMaVVJ7fOFmkjuM928F3ZrP6Vj5vJQu9j
 TGA+E1GJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBziAAKCRCJcvTf3G3AJvL4D/
 432CWZcCqOkVhZ6rWzVtqmSaSBdcUlSVZvNTubv+qk3MAjGXh0WePvQ/w470x2ODfGCERhFWEDFlQj
 68DffRJeemD9mQNtxja/G+yKlfKQtqj2GsW7tkAYMYGdzk44ucXmoA6jnRW6vcayOBno0Ak7JtF4lG
 m7CwO3b7xHmECqmbPERBBHV/EFy/4S7JgLqoPni03PW1KgZDyCWqbwmB04HSW1ssZRyLMd4s3QMY1T
 +9uiq7oHu8jR42VT7YaiZc18izUh7AQddCZBlvqcHK6sPbsh+klX5zZS9n02ODAklfDkBGB2gb1tzk
 qTxXC88avclTCkPd2GBEUQEctsttYoNcK4xZ3zRj+wlfk6n2j/Aj/ysxug7cILnKKFV1GD6Yf8nsLg
 2k2xEUpWUhhQ6fcZqBd7cBs5gIDYK2zreDrTKcqVFSQ0lX6w9ZyGULXQjv3ILYDHDHvd1PewBgByhA
 8aurJtfihL4zDAjHyVugkZ+nfaAmQVaovogYrWCCXoxbMKSIxExx4nWszpvOPpR1mX+l7gYP24rMp1
 l768YtsiX/jU5xOMRn5iJGLFogebnye0HYfk45A60bKdiGZmynlnz5gGZL9zYD/aSJOhSfF3kz5hcE
 XG0Q1qnKtvYm975U6RI0dZPUWK34kAgIzA9fINgzTL6Q+FxQr5sF43MKxRyQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A common idiom in kernel code is to wipe the contents of a structure
after a given member. This includes places where there is trailing
struct padding. These open-coded cases are usually difficult to read and
very sensitive to struct layout changes. Introduce a new helper,
memset_after() that takes the target struct instance, the byte to
write, and the member name after which the zeroing should start.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/string.h | 12 ++++++++++++
 lib/test_memcpy.c      | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index cbe889e404e2..4f9f67505f70 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -272,6 +272,18 @@ static __always_inline void memcpy_and_pad(void *dest, size_t dest_len,
 		memcpy(dest, src, dest_len);
 }
 
+/**
+ * memset_after - Set a value after a struct member to the end of a struct
+ *
+ * @obj: Address of target struct instance
+ * @v: Byte value to repeatedly write
+ * @member: after which struct member to start writing bytes
+ */
+#define memset_after(obj, v, member) do {				\
+	memset((u8 *)(obj) + offsetofend(typeof(*(obj)), member), v,	\
+	       sizeof(*(obj)) - offsetofend(typeof(*(obj)), member));	\
+} while (0)
+
 /**
  * str_has_prefix - Test if a string has a given prefix
  * @str: The string to test
diff --git a/lib/test_memcpy.c b/lib/test_memcpy.c
index 7c64120a68a9..f52b284f4410 100644
--- a/lib/test_memcpy.c
+++ b/lib/test_memcpy.c
@@ -223,6 +223,13 @@ static int __init test_memset(void)
 			  0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30,
 			},
 	};
+	struct some_bytes after = {
+		.data = { 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x72,
+			  0x72, 0x72, 0x72, 0x72, 0x72, 0x72, 0x72, 0x72,
+			  0x72, 0x72, 0x72, 0x72, 0x72, 0x72, 0x72, 0x72,
+			  0x72, 0x72, 0x72, 0x72, 0x72, 0x72, 0x72, 0x72,
+			},
+	};
 	struct some_bytes dest = { };
 	int count, value;
 	u8 *ptr;
@@ -254,6 +261,11 @@ static int __init test_memset(void)
 	memset(ptr++, value++, count++);
 	compare("argument side-effects", dest, three);
 
+	/* Verify memset_after() */
+	dest = control;
+	memset_after(&dest, 0x72, three);
+	compare("memset_after()", dest, after);
+
 	return 0;
 #undef TEST_OP
 }
-- 
2.30.2

