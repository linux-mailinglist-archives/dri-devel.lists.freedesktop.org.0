Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1523D80A6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A526EA84;
	Tue, 27 Jul 2021 21:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483D56EA09
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:06:59 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id k1so17570452plt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eHJ5K8LiDBXCeTCe7PvgaP3UqQR5uDLvklqQUiAbnC0=;
 b=C9odf/LxM8hQlFgEX94OyyWcybtfMz5fkcvxUOiwkptiFAnxb7Vjc9j5fcILzWzUe0
 9SXGn/8zZ/4rPOmwRPn9BGvFK32z6oyRZbo5d8AQJpThOjubhaqeuoW3W01DCWdHwowW
 ZQKSKYcukTOUL4ao1lnoeA3vzowcOeQgLkBm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eHJ5K8LiDBXCeTCe7PvgaP3UqQR5uDLvklqQUiAbnC0=;
 b=UQb1ntFH9bqskufRA3p6aVJSUUB62LCtvkrd6BVoTdD1TC6UqMhD4wwQvoMbjgtMlz
 EbfHbSkqQgaC5LOVRyYCscVUDH1yg5EBKA1tFIu0KJx9msC1gYsl/DyPpBr49/kQqPAp
 Xo+PQcb2cdDMFHbjWcr41MYvSqUaTcXu5i0H4Ysd93ZQaBDXrkeYyaPuwZwm1KKq8d9b
 09obNSYqbBiMlBmH+6HWqhHqOZpt7bFSFk0QozVYH4VdClB6FBD08fGArUk5zasv946O
 u9NYxqVdFMQc3GmawMw6ZFbGzdFd+mbVDdO/2r1Q3pf1kmRgyURESHjuMJMXyps5J0hX
 hOOQ==
X-Gm-Message-State: AOAM532km23StqW+wHp1ZvUt5AsiepGk12W4zPmq60Wxw4+Jnhpz9/+u
 on/ep68mI9HOPHrf6fykuwl4GA==
X-Google-Smtp-Source: ABdhPJyiPLiIxF0eZ6Ht4eersAStzTtAa77UuUUu3QKRioXbvWIKsuENyKgvU1Bb8BbQdCxPR7B6MQ==
X-Received: by 2002:a05:6a00:cc1:b029:32b:8465:9b59 with SMTP id
 b1-20020a056a000cc1b029032b84659b59mr24967310pfv.66.1627420018950; 
 Tue, 27 Jul 2021 14:06:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r128sm4687668pfc.155.2021.07.27.14.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:06:55 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 63/64] iwlwifi: dbg_ini: Split memcpy() to avoid multi-field
 write
Date: Tue, 27 Jul 2021 13:58:54 -0700
Message-Id: <20210727205855.411487-64-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543; h=from:subject;
 bh=s7Xq57zTgnpQLZW9o4dFqvke+b60yZlygvvLnoMj4dM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOO7ylJm1Pef8Nw2Y9AVMYN/aYHsm9YN/NkJMM0
 14MmcVqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzjgAKCRCJcvTf3G3AJh5wD/
 0a9KvpCqyFZ9QKAdlblaiFHTvLu6J0I4KvuS/Pu8WGvbtdHoFcEc1A0J0FqancucuNe2oN76GijGN8
 ZmNxkbLuDowcPvHB1KNKV+y/VKyD/GjTqJSFGbHSgE1d3XVQUqA8M80luRN12bHJex3vWEGlQIgVUS
 eo5mVVxa1vQFLA/APQtdO4QC3S0Rxaeq//vH7IZ+y8uTxf7ChRZtqCWERhOu6zi0YYM7UsadKsQ1UW
 kuKw1BHS6rVbpMLujJWWAPEyxEe0W/MD7sUJar7lh/sg2nbnVIlvXob+LuNF5xQtZwtIVnlj1/Tx1c
 JeZYoyxgw4/uvoQF/VaOiL8Fb1Mky8hA3J0Q0KSrMfDlDYr2psRQCz/wYgNiK8aZmkNvU6EyldhpRR
 jvpt2FEuN89iS51ofpMkKT9jWkj2G2IJnYUpSSBDS7x/6U33s9hWYtpjYFkmrtQS+KN+/zM7e0Wq85
 h9kdtxEMB5GcqKunvfEzrJH/6l30zcuWdtxzKr+5eUMIzfT4m7IfJftQW1OHHiIRW8y1i2y9mOZGde
 lSqRZZ+xSG98+pb5deEI05oPi7AOE1XKeHnMMfVyygop9nOeSAmsJJWm+ExFOnNUkiTzMkM+sJqqiU
 uZuZWsn+50meKz7mBFEHFWpt++2rlXLf2jFCbTMaiMMKok79IQfcYfkHRDkg==
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

To avoid a run-time false positive in the stricter FORTIFY_SOURCE
memcpy() checks, split the memcpy() into the struct and the data.
Additionally switch the data member to a flexible array to follow
modern language conventions.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/intel/iwlwifi/fw/file.h     | 2 +-
 drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/fw/file.h b/drivers/net/wireless/intel/iwlwifi/fw/file.h
index 9a8c7b7a0816..226ccd3a6612 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/file.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/file.h
@@ -116,7 +116,7 @@ enum iwl_ucode_tlv_type {
 struct iwl_ucode_tlv {
 	__le32 type;		/* see above */
 	__le32 length;		/* not including type/length fields */
-	u8 data[0];
+	u8 data[];
 };
 
 #define IWL_TLV_UCODE_MAGIC		0x0a4c5749
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
index 0ddd255a8cc1..f4efddf3e3c3 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
@@ -71,7 +71,8 @@ static int iwl_dbg_tlv_add(const struct iwl_ucode_tlv *tlv,
 	if (!node)
 		return -ENOMEM;
 
-	memcpy(&node->tlv, tlv, sizeof(node->tlv) + len);
+	memcpy(&node->tlv, tlv, sizeof(node->tlv));
+	memcpy(node->tlv.data, tlv->data, len);
 	list_add_tail(&node->list, list);
 
 	return 0;
-- 
2.30.2

