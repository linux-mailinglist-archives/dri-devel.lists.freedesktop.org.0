Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCEEAC4D84
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 13:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9063710E4A8;
	Tue, 27 May 2025 11:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H/1Vjf2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C4A10E495;
 Tue, 27 May 2025 11:33:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C8125A4F632;
 Tue, 27 May 2025 11:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FB6C4CEF2;
 Tue, 27 May 2025 11:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748345629;
 bh=LxLVRB8GvDbWgwRUBMxy60vYqqNKxSuBn+6jZzlFCL8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=H/1Vjf2sPX5KsrcOHk+12wXlOtPzI8Iukxuhbz6YGMxCk/wg193jaEboTR7JMwqjR
 A9zcY+aMWg5Whhb838580SWhl32lJTyaeXjR7+5s637gghgbo1dvemnPZdTZrSWUBg
 eFyNfk7oW4yRp5BNydPJwKtTcBXHsiuIZS1Gq+MBQbqs6g8uu0grCCoQgL6kUlHhNA
 jCZe7msdNHpPl5KFH4eZ6Yd4nxfpwvBo4vMklqgi0G8kbl5odQJDplygC/J1HNTtPx
 yH4l8Ebd8L9mRqgRrnCXKDeG5G5WqJaZnmJVXAInZ26JwNcWMBK1VzT01uYWQ6n8Q2
 BVwX1wFQUw7jA==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 27 May 2025 07:33:33 -0400
Subject: [PATCH v10 2/9] ref_tracker: add a top level debugfs directory for
 ref_tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-reftrack-dbgfs-v10-2-dc55f7705691@kernel.org>
References: <20250527-reftrack-dbgfs-v10-0-dc55f7705691@kernel.org>
In-Reply-To: <20250527-reftrack-dbgfs-v10-0-dc55f7705691@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=LxLVRB8GvDbWgwRUBMxy60vYqqNKxSuBn+6jZzlFCL8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNaMVUlqezMYH1mChIIL5u6XBGAgfwmyhmxpLN
 5wWe7G0X5CJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDWjFQAKCRAADmhBGVaC
 FcTlEAC7BuBEddZnQjUlkz5zSm4otOItDTjUhGMXZTeBxwZ3rNVydEEUQpBLVk+WDdZyiMlhHwt
 75DORyJfHzYdSpf0e/WnyqVbJj4ByPcSQRFSj5rcaKmNWHEltD274lcgSWy0Zl1YYpiSYFWGVJE
 2P2R5iZlsXboEsudbSNlwcs7+LqEUN2MorNhS1WWMQK0TpDBTuuBRi3CAWPv5ZdF+MsECg/vD7U
 BvwqFHL0hXJc0I/si0gzjXIdW+GpyEcrVcfIy6iq2TCfiFEXBH7KSnt0g8usF80u5EsEiyQP32V
 zNNvMqpDouDHwT/jvnzGYV9XYq8lPmxWfUcL1/LmOEiTbRNnmHA7wwiu5Ps/9ohtgyGlQNKIi4v
 RWaHQqF+txZ4CKdwrrmp1yflqz/+TMxC0moyxYq0lPnCHCwmgKoJabsH0P9nvwruD3GUnAh35hI
 LMPi8vUD0Al5my93UERGLE72U8+3gRMLqnu0TmfHgdxdkvUoArxgvsZKbesv9wqI4PeXBb57J7J
 jTFSWhLLq9BA/rO3HI/juKsV92jV3ID0scnnOoaoj21LeVitpINSdxDeh3//d5yCJ+WqHNCCzGS
 VgJHp6RpKevoKCI/KYcm2CYf2hAFLWNYszqo6g9CdygWkfk2Tk98iba2JQAcirKqrFEFXF33V6P
 llhWX9B9xmZxYBg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
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

Add a new "ref_tracker" directory in debugfs. Each individual refcount
tracker can register files under there to display info about
currently-held references.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 lib/ref_tracker.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index de71439e12a3bab6456910986fa611dfbdd97980..34ac37db209077d6771d5f4367e53d19ba3169c6 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -273,3 +273,19 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ref_tracker_free);
+
+#ifdef CONFIG_DEBUG_FS
+#include <linux/debugfs.h>
+
+static struct dentry *ref_tracker_debug_dir = (struct dentry *)-ENOENT;
+
+static int __init ref_tracker_debugfs_init(void)
+{
+	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
+	if (IS_ERR(ref_tracker_debug_dir))
+		pr_warn("ref_tracker: unable to create debugfs ref_tracker directory: %pe\n",
+			ref_tracker_debug_dir);
+	return 0;
+}
+late_initcall(ref_tracker_debugfs_init);
+#endif /* CONFIG_DEBUG_FS */

-- 
2.49.0

