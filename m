Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C689E0A0F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 18:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E69010E7FA;
	Mon,  2 Dec 2024 17:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j/90kkzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7BC10E7EC;
 Mon,  2 Dec 2024 17:35:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B4E26A4105D;
 Mon,  2 Dec 2024 17:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AEC8C4CEE9;
 Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733160904;
 bh=0n7K8123aVRmHZxGT60ksDzEW/cULJYrbFl/Q86l37M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=j/90kkzHJYpxgw9fCykFpmgCYrZb/HPUY4Fn5AfokJhP84zgU7WPjnPRfcVDKNTZ6
 wg+fmlmBVyCt//Ey3/M6ExHqZHnZfnNtjNwYpa7cjYFMZUUr9k/jEbhhMlkpXAEPu8
 tyBddS+OV2r4MV7GOACqXDiV2MFmPliFoCKNi3gXMxhlm3mvVMqJV7rk2kHU1Nf1iF
 Rmspw7y6S/BTMrAVwZfQYYIvu3wu1tA0CWgmUb/hRT/5vecMQRWoCUH10RiN4SK+ik
 KNISAN2qv9Bv/qfkjhjCxYcPlt6QwRjzMjF4MkKIAmeuKGAEzSHUCnhg3q3mCxkg59
 zwzNKjWmBqpZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 88EEED7831C;
 Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Tue, 03 Dec 2024 02:33:29 +0900
Subject: [PATCH 07/10] overflow: replace __is_constexpr() by is_const()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-is_constexpr-refactor-v1-7-4e4cbaecc216@wanadoo.fr>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
In-Reply-To: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 David Laight <David.Laight@aculab.com>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
Cc: linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2119;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=3zhdAHGJKxe/cfP6gSQHSq0jEALX5ywlxJaLknSE8PU=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+74/q876MC9CKYjyo9Ky9cdPpsilBc38vnbBxvs6ZW
 UF5mtXRHaUsDGJcDLJiiizLyjm5FToKvcMO/bWEmcPKBDKEgYtTACbyQ5fhr7xK1ZyIKSviHgrp
 8+d4/NxvmD6DX/jspxv39qf9Nnzx8QYjw5+v16eWdS2+XNXV/TjVMnulR8GKU3Mazly4pdn98Ng
 OKx4A
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
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
Reply-To: mailhol.vincent@wanadoo.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

is_const() is a one to one replacement of __is_constexpr(). Do the
replacement so that __is_constexpr() can be removed.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/overflow.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index 0c7e3dcfe8670cb95f371a6f7d41bb8b63b1786c..d69361a3128897d493b5e2ec471f077ca2b9861d 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -234,7 +234,7 @@ static inline bool __must_check __must_check_overflow(bool overflow)
  * Returns: true if overflow can occur, false otherwise.
  */
 #define overflows_type(n, T)					\
-	__builtin_choose_expr(__is_constexpr(n),		\
+	__builtin_choose_expr(is_const(n),			\
 			      __overflows_type_constexpr(n, T),	\
 			      __overflows_type(n, T))
 
@@ -250,7 +250,7 @@ static inline bool __must_check __must_check_overflow(bool overflow)
  * back to __same_type().
  */
 #define castable_to_type(n, T)						\
-	__builtin_choose_expr(__is_constexpr(n),			\
+	__builtin_choose_expr(is_const(n),				\
 			      !__overflows_type_constexpr(n, T),	\
 			      __same_type(n, T))
 
@@ -352,7 +352,7 @@ static inline size_t __must_check size_sub(size_t minuend, size_t subtrahend)
  * Return: number of bytes needed or SIZE_MAX on overflow.
  */
 #define flex_array_size(p, member, count)				\
-	__builtin_choose_expr(__is_constexpr(count),			\
+	__builtin_choose_expr(is_const(count),				\
 		(count) * sizeof(*(p)->member) + __must_be_array((p)->member),	\
 		size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
 
@@ -368,7 +368,7 @@ static inline size_t __must_check size_sub(size_t minuend, size_t subtrahend)
  * Return: number of bytes needed or SIZE_MAX on overflow.
  */
 #define struct_size(p, member, count)					\
-	__builtin_choose_expr(__is_constexpr(count),			\
+	__builtin_choose_expr(is_const(count),				\
 		sizeof(*(p)) + flex_array_size(p, member, count),	\
 		size_add(sizeof(*(p)), flex_array_size(p, member, count)))
 

-- 
2.45.2


