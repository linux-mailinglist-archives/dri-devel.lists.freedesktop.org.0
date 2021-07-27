Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EADF3D8099
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BDD6EA4D;
	Tue, 27 Jul 2021 21:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDED86EA57
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:06:53 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id j1so1815392pjv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=clRlkcTWzJOWdb6SjT1HZu+AyElzVwLtoYPXziOiXRE=;
 b=MBUIR3iBfXKxxQGTkwEdR+msAp6pxmWHaDphvmnJvT1Zw3YRPe0XXCC1E1e0Bq7P9v
 PHNDTqIkm/jI1FEa26EuyG+8VRkITbDssqS0hfWFfeIsKVWMxs6NsU4giYYW+nhBICQ9
 RxMzcJq+3X+F/NXCQU0H77itPS7DDeCUh+z/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=clRlkcTWzJOWdb6SjT1HZu+AyElzVwLtoYPXziOiXRE=;
 b=uk6aybBbm3DBGtkWZQSrvJT0BHalk8oNQHWD3usHP4iWMFQgO4cVZgAyn3asjg2ytu
 616ZG37crlRC0VSzjWhjQVC1K+vFtjvb2RAuLauOPfyDdg/7Flarq4tT5urzu2Tz/O6G
 C2A2txV2EHxxkevUvziiID9qTtLrTuZc084gcnGAf7Astluxz4JTelmU/KExZ3UBXwvI
 iyUNFt1V8uXK6Y99c/7iSjkgyOGYr6xku5RxIoabJTTnyDEMVPLAuDwhrINv1G96QInq
 n1rOKLbtURgWag0usy+CL20zj8B6PAkPjOussU0AWbkDVZMsnMBLBmJFkBjGoKMkz04C
 9grg==
X-Gm-Message-State: AOAM5330RTo5iVa4IJ6auB8R2dVnN4GsPTUWxbiNfACnaZPiVzwEhr/W
 dPdfopNWLIl5tNx3qotljNEppQ==
X-Google-Smtp-Source: ABdhPJyQWD89modfR5XqhD/BrBVi4uhzmxv+/WY0dPBKz1b0mLB8ON+0pnmzIlozqgKLDJGyoixVLw==
X-Received: by 2002:a65:420d:: with SMTP id c13mr9244079pgq.123.1627420013548; 
 Tue, 27 Jul 2021 14:06:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l1sm3813994pjq.1.2021.07.27.14.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:06:50 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 16/64] thermal: intel: int340x_thermal: Use struct_group() for
 memcpy() region
Date: Tue, 27 Jul 2021 13:58:07 -0700
Message-Id: <20210727205855.411487-17-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3277; h=from:subject;
 bh=FXb9nQQ+9raXNRheCnPL/rsMtfpVZSmOVeEiPUzBx+k=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOD97boEQtghYWjunVAHXryqRBeKslQ/U0/9Z2K
 SuHsN8WJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzgwAKCRCJcvTf3G3AJs4JD/
 4t9krlI0msPh0DWMgqWRsM+X+y+HiMVgVUi7JkKAiBNJZoty9G4c1eS7yLV6TgLer2yFH8Ds58wUxF
 O6n5C18sFXheNiEEW+6vqVVeyQpO6nOPUonTlA8hTYBZp6CBNW7L7fqFalI7RlROQmukoEwMQZpWKx
 EuiGE22FT/3gJFEHq6KV61yPGYruCiyqaRADMcMMvyaJddy1qUkMgv0+9MsD6Pk/GN14+iLJT/WvX/
 +Ncg6xMtv77TZnfLggNoIAXvzxqKTuj4YKPXx37SB2DDRCzdDh7R0hdU6WnJYEDwR5nd28AxRY9pW0
 3/vFBrVdXmb5M1ePJqtCrbIM24arQveQJ0OFOeHTeWVNTcpF2rYY6HkYdqN5OgBXbagUUrHLo5sTJT
 oCoXT0USJzevlZoW3hXd+qGHUmuaA7+oUpf8ERJftB1gtBZ5+mAE3oNp6XoGlqZWXKaZOqEXohtJdE
 JKAKoqmW3JI+EQI+YUWLhorOoexqDCL3tG1VxN6M8wVEznEOVlCPdgcKjMwd4TvvKajC88ejnODvYX
 Yx+uFlSgaEFH992Tzy+Sem73iwT45T1pxFzlgXi6UKZ/H5V8dY1HWDHhQdWkFNrA7YldsHu5LMPO23
 EVZMhiu2pPLzAvDWB389kz3t6FqAo/HGYnm8kfHnyCibi/cFhsXVyBwQujpg==
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
field bounds checking for memcpy(), avoid intentionally writing across
neighboring fields.

Use struct_group() in struct art around members weight, and ac[0-9]_max,
so they can be referenced together. This will allow memcpy() and sizeof()
to more easily reason about sizes, improve readability, and avoid future
warnings about writing beyond the end of weight.

"pahole" shows no size nor member offset changes to struct art.
"objdump -d" shows no meaningful object code changes (i.e. only source
line number induced differences).

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

