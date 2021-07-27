Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E843D80A5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EE16EA80;
	Tue, 27 Jul 2021 21:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC7C6EA09
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:06:57 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso6694062pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eOeu4d7QLTPBu6QYYoqWVSDz/qzrHDToqQYaK/VYhSM=;
 b=nmClRthMB6NUA8m9k5ViyzIj9tZSLtz+W7Y/dUJqpsE4Ra7JIpNa/jk5t7+u9guaKS
 rD4SN4syDHrUBQt/o8lo3la5Br4kga0btCULhIMfCaHEe3PG6RzT3IeGYfyUKyEfoq3Z
 2Fz2wu2iQF1vNyl73FIcK6AVJYeThxSfaojvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eOeu4d7QLTPBu6QYYoqWVSDz/qzrHDToqQYaK/VYhSM=;
 b=HefyXtsh3nNXLT6dtHDU6tR1D/gK+Y5o7UYtdD4WrGb1ZcdWdRsdMzUQHKy7HmNnUM
 YsvOStvXNpm9zXt60hfowZnbnd4Lu6IKAjs3IvbX7VUO1pZ32JnFRbZbuBP9D2QXJVYv
 fLi22xF+zwmvsAKcZWquHq0a5cfLksPKmpCdnNR6wCYIPb3alojNkaaAPlQBVSWPSeDO
 S26UAi7KRvXGuWr2TOq/6DfTBi8ewinscvqO9vJFereC8idsmdUHvGifdUxipxQlPrmX
 m++CdVKbovcB0h6JNtlO2rV6mzpswDJ45jUgoODYpHd26fdc+dN6a6/f0GOAd+CMDaBC
 M/gw==
X-Gm-Message-State: AOAM531XR9M3qdOpxdgQF84V6op8OoWqs/uVJWUu9LUltDfrp80XX+VC
 zbKLlyWMALhNEpNm8CM7xztuqA==
X-Google-Smtp-Source: ABdhPJynj7Mxd5dzejb/chP88BPdMVTyDp7rQutQlvaypR/9xo8DyQW71dEyKFZ3FwRUaCTEut3Rdg==
X-Received: by 2002:a17:902:7884:b029:12a:efa7:18d8 with SMTP id
 q4-20020a1709027884b029012aefa718d8mr20498548pll.85.1627420017391; 
 Tue, 27 Jul 2021 14:06:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e12sm3784712pjh.33.2021.07.27.14.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:06:54 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 43/64] ath11k: Use memset_after() for clearing queue
 descriptors
Date: Tue, 27 Jul 2021 13:58:34 -0700
Message-Id: <20210727205855.411487-44-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3116; h=from:subject;
 bh=j3LfXLw0C1RpC2nAiDmR2FV9ppMLr+xX2/Byaw0lUBI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOJQjRIUTQLa3kW6JEv7dcnm26TeZbOKFOYV9Uy
 JUsIKlSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBziQAKCRCJcvTf3G3AJv7OD/
 wOv9NnzO8vnuCd1yLn28Uh20ipd4blI/H+kMp3Wx9VsXqAUniUau5o4ju7EMl4saOmJ/ltHPdb99Yn
 /TXqBvuvm/fcFKOY1q7nIR/AaYPJW7LhNkRTXplMqKXe+3Qnnu8FBSAw2DUq1zXDmuYemIlXptx4ne
 Bmu+McSU4fRhGXiPWsd07ziif5KbBqSw6Xksw8nxp+XBVcxJX8et8bdwHVvJj0saggDJ1aJ4HQ1mF9
 4HllmEQZL+wN8MhR+vknVrUK52Mj7rfxI7dwb4lSH2MhOUDYqcIIacwA5QxlhlqjlKy6/FQBNGIoBY
 ryzx8o2IbdOCSNbzQwAASqLiVYlD6HbVddTDKOJUZ+x++HGUnv9Ns/IgQDKGBNyhoj/ri9ybH6GklO
 voujRz697QTfjIL/VjnyvyF+xPaJEI8Wohz7g53gpHyYojdV+zinQHZWRwFAMHSly548C+mHC2LU2f
 E4CcST932vQu8ftiiXm818XOydMxX00CvzoOdlcSm4NgFL87y5zloqO76ihmGAN/LUl+GulYt7gpaN
 6tsAlGYd0W8yUr7UrJaRl6QTkAffrdEJCc47+DqZK4QRdgofQHTqb0FpwfJ1WH7QWGQzpFXEyUW2Se
 Px6rDcKN7HvstRyGsxqRWPFEVU0eQ/A1CMhA1WHwshXb3mfP/uaPnWfv3RBw==
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

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Use memset_after() so memset() doesn't get confused about writing
beyond the destination member that is intended to be the starting point
of zeroing through the end of the struct. Additionally split up a later
field-spanning memset() so that memset() can reason about the size.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 325055ca41ab..c72b6b45b3ba 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -29,8 +29,7 @@ static int ath11k_hal_reo_cmd_queue_stats(struct hal_tlv_hdr *tlv,
 		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
 
 	desc = (struct hal_reo_get_queue_stats *)tlv->value;
-	memset(&desc->queue_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_after(desc, 0, cmd);
 
 	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
@@ -62,8 +61,7 @@ static int ath11k_hal_reo_cmd_flush_cache(struct ath11k_hal *hal, struct hal_tlv
 		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
 
 	desc = (struct hal_reo_flush_cache *)tlv->value;
-	memset(&desc->cache_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_after(desc, 0, cmd);
 
 	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
@@ -101,8 +99,7 @@ static int ath11k_hal_reo_cmd_update_rx_queue(struct hal_tlv_hdr *tlv,
 		  FIELD_PREP(HAL_TLV_HDR_LEN, sizeof(*desc));
 
 	desc = (struct hal_reo_update_rx_queue *)tlv->value;
-	memset(&desc->queue_addr_lo, 0,
-	       (sizeof(*desc) - sizeof(struct hal_reo_cmd_hdr)));
+	memset_after(desc, 0, cmd);
 
 	desc->cmd.info0 &= ~HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED;
 	if (cmd->flag & HAL_REO_CMD_FLG_NEED_STATUS)
@@ -762,15 +759,17 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 	 * size changes and also send WMI message to FW to change the REO
 	 * queue descriptor in Rx peer entry as part of dp_rx_tid_update.
 	 */
-	memset(ext_desc, 0, 3 * sizeof(*ext_desc));
+	memset(ext_desc, 0, sizeof(*ext_desc));
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
 				    HAL_DESC_REO_QUEUE_EXT_DESC,
 				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_1);
 	ext_desc++;
+	memset(ext_desc, 0, sizeof(*ext_desc));
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
 				    HAL_DESC_REO_QUEUE_EXT_DESC,
 				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_2);
 	ext_desc++;
+	memset(ext_desc, 0, sizeof(*ext_desc));
 	ath11k_hal_reo_set_desc_hdr(&ext_desc->desc_hdr, HAL_DESC_REO_OWNED,
 				    HAL_DESC_REO_QUEUE_EXT_DESC,
 				    REO_QUEUE_DESC_MAGIC_DEBUG_PATTERN_3);
-- 
2.30.2

