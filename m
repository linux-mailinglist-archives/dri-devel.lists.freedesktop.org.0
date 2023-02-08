Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E24A68F28E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 16:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D4010E093;
	Wed,  8 Feb 2023 15:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D5010E093
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 15:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675871706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7sUnVzlMx2m7Rm8oB22gZPkorcr5iVWMwlElG24lMuQ=;
 b=FqRa0PAiRAgFzKGPuMl6n86T0H7/Az+ceMEcWmjSbdpBJv6JM+hu2R/oElsnSHHXZtdhiN
 79JFyU/n+iPPQCg/BC2+YNOkRQ4Tc9qnuLuSmC7C0siwFmM8GXv11g3hc3o8e4L1+SqDJL
 9Ju7Ci3n2yNVx3kqorxYkXJsFFhopA8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-2lACXwXxMkavv7cxOT53JA-1; Wed, 08 Feb 2023 10:55:05 -0500
X-MC-Unique: 2lACXwXxMkavv7cxOT53JA-1
Received: by mail-qk1-f199.google.com with SMTP id
 x17-20020a05620a449100b00731b7a45b7fso7509609qkp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 07:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7sUnVzlMx2m7Rm8oB22gZPkorcr5iVWMwlElG24lMuQ=;
 b=QFqgj6oynFQ73LYvxotyo2xd2MmlZI+ehJOc1gyvdCJOCCugNrKHa0veJx0vjO+5+j
 V+tHtA+jW0K1u+8kyO0PLVKyMXOAIN24fiGne4v03xg+a/N8u6/mUIusMmeZfzgAxg6V
 7HE3rGa2V0bPIi7aNK4sLARTHETL/RxnhMMthZ8k9lc528rpZoGTJKqQcQIIUYnAzLRa
 qpLTQzXMatryPgJsVADRHxKYlHwH8KgvIOmtHpCohPoVHHvcckckWNfaHV1UMS3yxP0T
 MRVbVekc2oDq+ynEC214cPKEZUS49bsTbBpyWzGJbApvwisOxPUrUOzZSXVsPCgv8PKL
 WQ9A==
X-Gm-Message-State: AO0yUKUPPH6TMF0QKVL44pu+Xl6iTSrDRF9RT01ONF6FvIvZ02yhWKOe
 kHHM/1RzU0cDFZN8+ldUycOV8WbnydLdUl2Jo4RlhAZd1YINENd/sO7TdHoJ/hTkstw8fWDGsT0
 loP9GYP8w89/AL4+6icsiSb09h0/D
X-Received: by 2002:a05:622a:5ca:b0:3b9:c08f:219c with SMTP id
 d10-20020a05622a05ca00b003b9c08f219cmr13508075qtb.29.1675871704837; 
 Wed, 08 Feb 2023 07:55:04 -0800 (PST)
X-Google-Smtp-Source: AK7set862iDAv82HIBQc08b5kthNBVKLMTR0KXzZsKi+mk6XsGXu9KCp2Z6GeLeI1VsYZYW5IjQWMQ==
X-Received: by 2002:a05:622a:5ca:b0:3b9:c08f:219c with SMTP id
 d10-20020a05622a05ca00b003b9c08f219cmr13508050qtb.29.1675871704525; 
 Wed, 08 Feb 2023 07:55:04 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 s9-20020a05620a0bc900b0071aacb2c76asm11841896qki.132.2023.02.08.07.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 07:55:04 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: ogabbay@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
 kelbaz@habana.ai
Subject: [PATCH] habanalabs: change unused extern decl of hdev to forward decl
 of hl_device
Date: Wed,  8 Feb 2023 07:54:50 -0800
Message-Id: <20230208155450.1941608-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Building with clang W=2 has several similar warnings
drivers/accel/habanalabs/common/decoder.c:46:51: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
static void dec_error_intr_work(struct hl_device *hdev, u32 base_addr, u32 core_id)
                                                  ^
drivers/accel/habanalabs/common/security.h:13:26: note: previous declaration is here
extern struct hl_device *hdev;
                         ^

There is no global definition of hdev, so the extern is not needed.
Searched with
grep -r '^struct' . | grep hl_dev

Change to an forward decl to resolve these issues
drivers/accel/habanalabs/common/mmu/../security.h:133:40: error: ‘struct hl_device’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
  133 |         bool (*skip_block_hook)(struct hl_device *hdev,
      |                                        ^~~~~~~~~

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/accel/habanalabs/common/security.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/security.h b/drivers/accel/habanalabs/common/security.h
index 234b4a6ed8bc..d7a3b3e82ea4 100644
--- a/drivers/accel/habanalabs/common/security.h
+++ b/drivers/accel/habanalabs/common/security.h
@@ -10,7 +10,7 @@
 
 #include <linux/io-64-nonatomic-lo-hi.h>
 
-extern struct hl_device *hdev;
+struct hl_device;
 
 /* special blocks */
 #define HL_MAX_NUM_OF_GLBL_ERR_CAUSE		10
-- 
2.26.3

