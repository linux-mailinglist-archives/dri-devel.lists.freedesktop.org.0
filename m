Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF953EFAD7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA2F6E3CE;
	Wed, 18 Aug 2021 06:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273066E3EF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:05:59 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id x16so1066867pfh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NTYV2vCojWGaRvoj20z4daltbaCLEHm5I23EtSqrsdc=;
 b=gcLhrbC6oh1Q4v7lBnuyaS91t4jaL8TehpxBKFXFSBMm2H8MVSQk2tUC2P0GUeSeUv
 h/dbuSnQtyawGoL6LpCi/+xx7NsJ21uSVxeAivgSkoywKe+OIiou9Fs+GBDr8IzotyVN
 9YcRY+LtNaBwMh5J6OjEP2f59D4wukYLAQ6gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NTYV2vCojWGaRvoj20z4daltbaCLEHm5I23EtSqrsdc=;
 b=fPvRLJmDSLRWwmL2AkNhAx8VD5HsIPdGPNTr9GvZ3XP7gIlu+LPq55g+c5IUB3P5VU
 JxHS8HqaNmvya7R2CIHqNDo5vewwL+5db9NmM3Ryxqd1QOjis9oVRkc5qHSbdh+5Bcon
 GwAHJ7QuNUS4PHx7bEQg5PDgQaT+EEkomEJfob4iv7+H1XGQU68kTEUR9bByzZFTZ82h
 j3GsMdy5HyKEVvTVHk1/j14N7YSg2qet6aeHFPp+QXrI5+EHz4NbrXw9uw+QdUPEEdfd
 Ar/cINFSOQgNZRyYMILhhHPd40vQa2fftrfcZf/D8+/7l/GfWcqdPCBsR0GiAtaaM0t+
 pPrw==
X-Gm-Message-State: AOAM533K8OyQFlcVqNQo5LS7Ec9s+oY/HI77ULYHDnSdCPC8AvwQhn7J
 N9ppB/DmQs3YDDPWc3tY6u2fCQ==
X-Google-Smtp-Source: ABdhPJzKHoX3yyU+dnBla/w9sJktvSQulGP69FZGHBDzf2nPRtzqPXfJGufcOa8NTqoZzja7AHU62Q==
X-Received: by 2002:a05:6a00:2d6:b0:3e2:e023:c6cd with SMTP id
 b22-20020a056a0002d600b003e2e023c6cdmr1988068pft.19.1629266758722; 
 Tue, 17 Aug 2021 23:05:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id n23sm5008845pgv.76.2021.08.17.23.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:05:57 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 12/63] thermal: intel: int340x_thermal: Use struct_group()
 for memcpy() region
Date: Tue, 17 Aug 2021 23:04:42 -0700
Message-Id: <20210818060533.3569517-13-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3430; h=from:subject;
 bh=eWRxzyg8ZHcfvuxChrH1G3MSkKagVjV8YQYyT7daR/o=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMgzFFZrngl6f/ha2lcQf7jZ0XOwEEmDffMqDAl
 g1Ks8xmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjIAAKCRCJcvTf3G3AJr4LEA
 CsX0wkoSQ5k+eRw495v98ZukqiRSRwtgtvHDRZg+FSzpTwOnEEYMAyH7uOTV2xyt//wSEjLpityQkQ
 6DJYoi8exVReP0/IGENdNgCX9CSvnY4mKgOStyQOF6wF6zUmA49X9+fDt/me/CXdx2hYbg0vtLMnkq
 5gBvKdXtWgWRoELEugEmh2t5qHjUpqpCNnyRtLha7bTKgabmSOmpcevXF1HoOvOs1cRNXoPcdx5CV0
 bDoINmq6Xyh/tk0h4pIdo6SfZAOs0c3ErkSnT15sehzyggOoDkGVjJG5VBR3mukUg7mBnWnktHwIHX
 /tYJqO+CdgwVMhdFRyKr6l6llZ3FYBwNYN/FLkfP1rnu6FXfH0LeQTTnuKm5YeiGKMK3k9oxRcqmp2
 gMgnuYcTxVZ3rCDIYJJ6MzSIQtwWs9qBXZvHiQV4DaUG4xlsdQl73NhV0kA1qUrWu1KG3ET05Fm+c4
 HDpZitCNYo0GvcGDfWBeLQqlbQ7IfL2V3I6YLWINVfJEsKl+g2+ctBb19ZzFmusloqZCbrZPyTc+0S
 NmmotsEztnwmtEBmMhE7LJfL4We9u8itUfkywd+2pr4j4z1E7U8Zv+BycFc/U8vYneKZZgYxcHGWiO
 T+ntRlh8llbsS1IRx6+6G4JBfFq6XbT/Hv9hLw4FXNSrDM+N5Np9vPDUT0Ow==
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

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), avoid intentionally writing across
neighboring fields.

Use struct_group() in struct art around members weight, and ac[0-9]_max,
so they can be referenced together. This will allow memcpy() and sizeof()
to more easily reason about sizes, improve readability, and avoid future
warnings about writing beyond the end of weight.

"pahole" shows no size nor member offset changes to struct art.
"objdump -d" shows no meaningful object code changes (i.e. only source
line number induced differences).

Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Amit Kucheria <amitk@kernel.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 .../intel/int340x_thermal/acpi_thermal_rel.c  |  5 +-
 .../intel/int340x_thermal/acpi_thermal_rel.h  | 48 ++++++++++---------
 2 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
index a478cff8162a..e90690a234c4 100644
--- a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
+++ b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
@@ -250,8 +250,9 @@ static int fill_art(char __user *ubuf)
 		get_single_name(arts[i].source, art_user[i].source_device);
 		get_single_name(arts[i].target, art_user[i].target_device);
 		/* copy the rest int data in addition to source and target */
-		memcpy(&art_user[i].weight, &arts[i].weight,
-			sizeof(u64) * (ACPI_NR_ART_ELEMENTS - 2));
+		BUILD_BUG_ON(sizeof(art_user[i].data) !=
+			     sizeof(u64) * (ACPI_NR_ART_ELEMENTS - 2));
+		memcpy(&art_user[i].data, &arts[i].data, sizeof(art_user[i].data));
 	}
 
 	if (copy_to_user(ubuf, art_user, art_len))
diff --git a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
index 58822575fd54..78d942477035 100644
--- a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
+++ b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
@@ -17,17 +17,19 @@
 struct art {
 	acpi_handle source;
 	acpi_handle target;
-	u64 weight;
-	u64 ac0_max;
-	u64 ac1_max;
-	u64 ac2_max;
-	u64 ac3_max;
-	u64 ac4_max;
-	u64 ac5_max;
-	u64 ac6_max;
-	u64 ac7_max;
-	u64 ac8_max;
-	u64 ac9_max;
+	struct_group(data,
+		u64 weight;
+		u64 ac0_max;
+		u64 ac1_max;
+		u64 ac2_max;
+		u64 ac3_max;
+		u64 ac4_max;
+		u64 ac5_max;
+		u64 ac6_max;
+		u64 ac7_max;
+		u64 ac8_max;
+		u64 ac9_max;
+	);
 } __packed;
 
 struct trt {
@@ -47,17 +49,19 @@ union art_object {
 	struct {
 		char source_device[8]; /* ACPI single name */
 		char target_device[8]; /* ACPI single name */
-		u64 weight;
-		u64 ac0_max_level;
-		u64 ac1_max_level;
-		u64 ac2_max_level;
-		u64 ac3_max_level;
-		u64 ac4_max_level;
-		u64 ac5_max_level;
-		u64 ac6_max_level;
-		u64 ac7_max_level;
-		u64 ac8_max_level;
-		u64 ac9_max_level;
+		struct_group(data,
+			u64 weight;
+			u64 ac0_max_level;
+			u64 ac1_max_level;
+			u64 ac2_max_level;
+			u64 ac3_max_level;
+			u64 ac4_max_level;
+			u64 ac5_max_level;
+			u64 ac6_max_level;
+			u64 ac7_max_level;
+			u64 ac8_max_level;
+			u64 ac9_max_level;
+		);
 	};
 	u64 __data[ACPI_NR_ART_ELEMENTS];
 };
-- 
2.30.2

