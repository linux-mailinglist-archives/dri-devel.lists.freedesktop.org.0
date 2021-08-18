Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374043EFABE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E503E6E3EC;
	Wed, 18 Aug 2021 06:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0C36E3EC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:05:58 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id q2so1141033pgt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c3QYmodiWkXXXHnLZdw/pUaRbLmOUogtqxubemJOUWA=;
 b=USSHyqJVpQWy8ZMzwl4EbGadTiH3HWAD5GKcye1LyreXSczSehLAnTCXNNAfVEOX6u
 dbx790aQ5KW7gPDgQoMYSPQsAV043/8VAoFfABDnVXFQLnG8rP3OolrjSWEo9TPmmYPs
 NckpHz6JjgIw87sGZSzScnstmZ3DWQOuxHRNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c3QYmodiWkXXXHnLZdw/pUaRbLmOUogtqxubemJOUWA=;
 b=q5uF3qzbh4jqQ7SK5xlKo0qw66pHrkyu83/GXo3vwSNodEw62n23KSpiNDdf/RQIbn
 gElZWiGw3+OqtJrYEcJgOLVlO+LC/ruZEGltt8nq8/8D7GE1WGIlotQ0hPCCwTrcqA5G
 MhXvbkcK1vxAogy0CKfGzmh1BSmVXzTrsJLXM9PA69iUL8N7TxBHX7B8mV3ZLbSyUwb4
 atPD/SLWgV/ERUU+1Qd1PqHAPkq5QniOVOZ25FVqcwrwX284ruYHBTAKvxwoG6tCcqah
 ZxoauNzwzrdJn0zGkBDhGt6S8fpIYDOPM9+Lyl53/k8cU94dVlb7rjU5XAUnG4vNi/bR
 ntwA==
X-Gm-Message-State: AOAM533ATwy24jf+NN5MeQCdqRCphe+gwt6lHlrsXe6tEmxG++MKTA9P
 000XxIai+lrtkU1PdrRk95mJ+A==
X-Google-Smtp-Source: ABdhPJywRH9jCkWB+sdI8LV/t2Ou1DJCL47kcdyq5rETJ8QPkKXpqliLW+MKQDbreOWicfFnlLn7Kg==
X-Received: by 2002:a63:ef12:: with SMTP id u18mr7200850pgh.331.1629266758150; 
 Tue, 17 Aug 2021 23:05:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c24sm5560285pgj.11.2021.08.17.23.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:05:57 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 13/63] iommu/amd: Use struct_group() for memcpy() region
Date: Tue, 17 Aug 2021 23:04:43 -0700
Message-Id: <20210818060533.3569517-14-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; h=from:subject;
 bh=20A/+PUHWtthTe8z3o3iWDN4Pea8VoPXFbZDABJx3xk=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMgAqqlbIpZIBPs4khRtZS/Nl/a6SaswUJcEQdW
 lSBIpT+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjIAAKCRCJcvTf3G3AJjFlD/
 9d5SSKFk/Byob7i8UcCVOb7iPk8Hi2YrJmknzLO1KIxaNkvuyEARZbq6e4B+T+TPepPhntcPKBfOXP
 FzeN5FXWJBzVyGoIzNGiCPh2WjsSRI106tmAJhcdyZYmVBcyeyjdu/N1w4oKdYAk4K9v7zjJqZe47b
 FRaeQAjBKc+4h21NGRtTPZDzSgeXabFrYbQBwUnsITGiIKiRbOWCcDGh1aIZNv6BQVD4Fgpe9isZog
 0BCF6kfGofFSR3+EdUSEAaJY5GtmJoPQ5dltBc0m7OGIWYQaf0gwiedtUQd1gVD70DjbjWh3AlITFT
 Vf7P1sH6jk2mKWV2rZKVWibtUzQcLIXbdByJB+gXLflqIxjrUioE82UZxpX/cMIXbUJ+LVuXzllnFo
 8nL/lrsLyasmOQKMZ7Hfx+H9y1Qtsx4Yi9Gf/d+PO5Yq2sV2urkcsqTblr1O674nNzPnTn3PqKHyZd
 OXFfw5XKgJ15ZpYPMmqOBTwA+1lyh2ypbwGLGTnQJZurT9iDDKnxhukSUEE4UmEgYep9iej5UlVsg1
 cUbGoY51vQpCifPn0TF/vQv4ai8qMbObKYv7Xb/rqwe3jqgkYO7Xj97gKJUlXnAJ4bWiRMOFBvJI19
 zdGfqZsTlEqTMGHOWNFvVFBQcZYVfy0VfPzdZMvR916KpKjQPu9DSR2qCvyw==
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
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Use struct_group() in struct ivhd_entry around members ext and hidh, so
they can be referenced together. This will allow memcpy() and sizeof()
to more easily reason about sizes, improve readability, and avoid future
warnings about writing beyond the end of ext.

"pahole" shows no size nor member offset changes to struct ivhd_entry.
"objdump -d" shows no object code changes.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux-foundation.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/iommu/amd/init.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index bdcf167b4afe..70506d6175e9 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -121,8 +121,10 @@ struct ivhd_entry {
 	u8 type;
 	u16 devid;
 	u8 flags;
-	u32 ext;
-	u32 hidh;
+	struct_group(ext_hid,
+		u32 ext;
+		u32 hidh;
+	);
 	u64 cid;
 	u8 uidf;
 	u8 uidl;
@@ -1377,7 +1379,8 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 				break;
 			}
 
-			memcpy(hid, (u8 *)(&e->ext), ACPIHID_HID_LEN - 1);
+			BUILD_BUG_ON(sizeof(e->ext_hid) != ACPIHID_HID_LEN - 1);
+			memcpy(hid, &e->ext_hid, ACPIHID_HID_LEN - 1);
 			hid[ACPIHID_HID_LEN - 1] = '\0';
 
 			if (!(*hid)) {
-- 
2.30.2

