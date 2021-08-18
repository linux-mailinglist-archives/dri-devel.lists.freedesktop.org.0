Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE0A3EFABF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9AD6E3F2;
	Wed, 18 Aug 2021 06:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AB86E3F2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:05:59 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id q2so1141089pgt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mboTeGUKr9yolgqYZyfRuYdmdGDjzaFuP+f8ddDuJQs=;
 b=VXB5rWrOkOUtfCqlqmI5NSVNx72RB77dAy2oZKxsFgyJYk7pRfvjGekORMHd3qeDjV
 w62NkRG1JnHmoQW1LYbSqf66ms3qEBb5M12TfQfmYL+UCdit3vS6intdi7dOK4yxjtOO
 0a7us/8TNkOy5LfwCUNfHgiRrh5IwxNX3jPnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mboTeGUKr9yolgqYZyfRuYdmdGDjzaFuP+f8ddDuJQs=;
 b=D+DvXryTm1oqobPyjB7uQic6HqP+BrpB0ME1Pkd/FIFcK9DZ7yVAfj7VG82iNj/a6k
 KlEaXm6wEeoq0v8dR1z5iHLYJK3NeZv4JHTyci24/DznxuMfqm+f1vbku7pYvxXO/9O7
 pJdUTFQNX0Ag9N/tF1qJ1mXgpvS8hHcwuFHgwgI42mgT7NwvNGx5KOvpzKNwRsG33DxN
 hxjFMIh+mRCreliBPqFaAx2pwafmatn8v7+fpNYhH2Ba3hd0us32PNQfJqwNGz9Z80GG
 IWMjdD9M8QrkxsO+7tB3/UogXiHfB3StKJOBHtZwRrcSudke+n86mh9pKMClAKWmPMMW
 gSDg==
X-Gm-Message-State: AOAM530F2440NbS5mBqbI54hMyXaiQQUgwtcGip3xsZh++XubxYxbZkZ
 LMQdwvb7nvNRyE2qu5iogblZhA==
X-Google-Smtp-Source: ABdhPJw0NQnubE2J9ww2IV6yMWGOt/X1HjRivrIndHgKRL2cM8oCkbJtHPmmWE3y9dhwziqzIdlJ6Q==
X-Received: by 2002:a63:2442:: with SMTP id k63mr7181356pgk.54.1629266759640; 
 Tue, 17 Aug 2021 23:05:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v15sm4713102pff.105.2021.08.17.23.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:05:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Daniel Axtens <dja@axtens.net>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 29/63] fortify: Fix dropped strcpy() compile-time write
 overflow check
Date: Tue, 17 Aug 2021 23:04:59 -0700
Message-Id: <20210818060533.3569517-30-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; h=from:subject;
 bh=sAqjTzTf+mWFy7xD73ZEpzjamgoLfVlMB8Pw3aei0Xc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMkHMEpm10nE/aAHB48K6cSsvZL5sfcJfQj9wD4
 87AucWeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJAAKCRCJcvTf3G3AJoHIEA
 CVNsWBrDfaVMhp7dy0y/IJxDyV8yomgG4F72g/uCRRfJZ6t0QDX4mJHghw3qnhtNERaVf1zfyT4EpR
 Q+CnBXAbbYOY29o4ZaC5ADslFqQrcq5UXqAtvXX2hNdtEpN7jEvy+T0Dp7gErnaLTs1ZlewzFJixmh
 05xnc5PGkQ/a2fhA/CtaXfcvvgj/Y1w7itfG3KT1Pc8P7hAB0xQUn5JwIyBFfsLsANHAXHUbw9VYDP
 fZZ0GNAEXZSrloJoa/3h+EnpUqfUAHZ6NG7o5k6rBUn2ktEbmeFwRAcvF137eXA++u2tSdegoXt14J
 LaoJ3RY4se8BmlCpgiOu6mTSPrs6Jb74GZdcpGwlL++bhsP342ng60dkvdbosL5Cz5rcQRxwrJ252w
 1U0/10JSG6NNPtAYO7As1zp/w4iaNAbTundBjm6o+FckreellK+acr/YR5tu8mhYcwwjhv7Gn0PW53
 tctiINRIsKtDHMAo5AYvcxOB0Cxa8Q44hhowrhkhYkzBO6F+t4p0Ht1Gse9m+/b9W5FzR+ruuTjN4b
 sJwG5NlgDrw9HodFlOrFU0g6f9jy+pOvo/aUejebmfFQ0E0rMohB1Ca6a4NGl1oW+3zmYJgmF3QYnL
 3ztj9l/h7QOAIug/e6PSNcgokPbHAFyVpu6eHLsTcqKbjMMcdhK2ihPt1Oaw==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The implementation for intra-object overflow in str*-family functions
accidentally dropped compile-time write overflow checking in strcpy(),
leaving it entirely to run-time. Add back the intended check.

Fixes: 6a39e62abbaf ("lib: string.h: detect intra-object overflow in fortified string functions")
Cc: Daniel Axtens <dja@axtens.net>
Cc: Francis Laniel <laniel_francis@privacyrequired.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/fortify-string.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index 7e67d02764db..68bc5978d916 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -287,7 +287,10 @@ __FORTIFY_INLINE char *strcpy(char *p, const char *q)
 	if (p_size == (size_t)-1 && q_size == (size_t)-1)
 		return __underlying_strcpy(p, q);
 	size = strlen(q) + 1;
-	/* test here to use the more stringent object size */
+	/* Compile-time check for const size overflow. */
+	if (__builtin_constant_p(size) && p_size < size)
+		__write_overflow();
+	/* Run-time check for dynamic size overflow. */
 	if (p_size < size)
 		fortify_panic(__func__);
 	memcpy(p, q, size);
-- 
2.30.2

