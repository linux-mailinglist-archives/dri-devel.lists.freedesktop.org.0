Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EECFD3EFAD8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9FE6E3E3;
	Wed, 18 Aug 2021 06:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F1C6E3FE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:06:02 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id x16so1066950pfh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lG0U8bM2TUXGlj9bAHKfwVFEdBo2YZlvkgJ69Lo3ko=;
 b=Y/DVgqUz//veWIPGInRHjxd8QhbyKfsy0kdugXO1nEyKRG4J+RATjtzLJoSS87jCco
 VSjAoqrkaHNZh0+mHRdYJBCbqV9xxVXdwGu7uaa7PR+N6pyz9+QKjSd2/AWYtac6EKNc
 sHLZn6ndy938GBH63DZ5ESf+mXsv8jS252ytM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6lG0U8bM2TUXGlj9bAHKfwVFEdBo2YZlvkgJ69Lo3ko=;
 b=mK812cs41VzDjh/uq65r9FDcQV5NBQijZ2aMnNyYoNbQcdHghDECDjwic6AB2Xhqj4
 NekcfGCGXmztH9PsEv28EDOVCSmLiPE2bVwHm83k2gq0djU8spEi+hfGhyAIQoSQoZNv
 FCA7qlWpQT91321zCuLgxvJjmjiaPwHEVB5xkYXmYLYLBpYspHqxW6Aqf5bxnz+YbXAA
 Ypxbi676orzpl8qhM6eEff2OiXaKJAVFO5FX6XuuQZX790ItiMsBH2c4nDFEL5nGHmRm
 hsqoZVPqta7GHKfieKbLayxnwR6sFtGnWSFJHG2Y0iJom7G1n8fimIuPkQom1sjBIMMw
 CN0g==
X-Gm-Message-State: AOAM530QLVIyT7TXemKfT0rWZ95wDGIF70rcEfIthxxpAxJdUz1p3PjK
 sqj+iWazuBQR+hdb//drhbQOfA==
X-Google-Smtp-Source: ABdhPJx9i0gP/tEqucjw5t2MRNzXtgPICZZmJol3/cEVKCeeDWJ8qCew27BG46wra+MkbfYjKbKkfg==
X-Received: by 2002:a05:6a00:cd0:b0:3e2:209e:4e30 with SMTP id
 b16-20020a056a000cd000b003e2209e4e30mr7598474pfv.59.1629266761883; 
 Tue, 17 Aug 2021 23:06:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r10sm4624434pff.7.2021.08.17.23.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:05:58 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 28/63] fortify: Explicitly disable Clang support
Date: Tue, 17 Aug 2021 23:04:58 -0700
Message-Id: <20210818060533.3569517-29-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427; h=from:subject;
 bh=MScHo/g3fAm2U5yn8644/6JAGaRCvw+x4s3NMxUkYP4=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMkDmaoP7/LrBvrUTwAq8PIwkOtE8yNEb1/iGaE
 eotqJxGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJAAKCRCJcvTf3G3AJvkeD/
 wK2I9wXb6VkTqNx8ve7VdNSMmlz+1i164ClH9CGR/35x6hLdSQ8qayX0H9g6LrgzVflJDSu0VPqZq6
 B60wT0GUsaN+NPYsGb2bVu1Rg3uumqZGiK90AHNJmSYkYU2G3Fqfi/WbeuSh9MygcOeGp/a9x/PQH5
 e8dULezGq6dCpC7cs5Zl3okkhjEBCJNG2UsDzKuR/shPokEXvmczONNPE0wD9SGKoJlCrtTATmKvin
 4tu2+3vQYizkssvftVjPL/zU+2R6x89hzrj96XdH+uAmeG5P820sWztifwnAHNcLVL5gq7wUOMrJ+f
 Z4XjIAC/G5EaSS4AhVIu9sD/iX8aeWmFJWF/Y21WLVPcvT0CbToC2WmKfl6Cf/5cmduks3BDmUc73D
 LWQ9JncTl44MKCvuBhARaFmlaFAJHnLG2EvjMIRi62WS27zMVn6Had7IAo/qffp70xB+LqBNwHlEFR
 1DOf7RDGukFMS2YPB64C7srE0otlJasITjwoT2VlC8SUubfSWf2Xs29w2K9ID2LufJo4jW+DES/y1x
 In7sKpTi8O1ywlBFrMpRGpBZemeuMVX+n2a4KW0Dlmr8PJZVEczotW0P4mEO8JYhohZFLrpQR/oM0d
 v1l42WB3iKEQLRJlt/B8Os8r3w8Ad46AyHq8GE3PhyPABlRRPciSKq8TGApQ==
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

Clang has never correctly compiled the FORTIFY_SOURCE defenses due to
a couple bugs:

	Eliding inlines with matching __builtin_* names
	https://bugs.llvm.org/show_bug.cgi?id=50322

	Incorrect __builtin_constant_p() of some globals
	https://bugs.llvm.org/show_bug.cgi?id=41459

In the process of making improvements to the FORTIFY_SOURCE defenses, the
first (silent) bug (coincidentally) becomes worked around, but exposes
the latter which breaks the build. As such, Clang must not be used with
CONFIG_FORTIFY_SOURCE until at least latter bug is fixed (in Clang 13),
and the fortify routines have been rearranged.

Update the Kconfig to reflect the reality of the current situation.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/security/Kconfig b/security/Kconfig
index 0ced7fd33e4d..fe6c0395fa02 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -191,6 +191,9 @@ config HARDENED_USERCOPY_PAGESPAN
 config FORTIFY_SOURCE
 	bool "Harden common str/mem functions against buffer overflows"
 	depends on ARCH_HAS_FORTIFY_SOURCE
+	# https://bugs.llvm.org/show_bug.cgi?id=50322
+	# https://bugs.llvm.org/show_bug.cgi?id=41459
+	depends on !CC_IS_CLANG
 	help
 	  Detect overflows of buffers in common string and memory functions
 	  where the compiler can determine and validate the buffer sizes.
-- 
2.30.2

