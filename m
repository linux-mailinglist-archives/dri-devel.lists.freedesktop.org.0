Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F0AB1999
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 18:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1790010EAB6;
	Fri,  9 May 2025 16:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g88zdz3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C60410EA95;
 Fri,  9 May 2025 16:01:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E222B629E1;
 Fri,  9 May 2025 15:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1C5C4CEE4;
 Fri,  9 May 2025 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746806070;
 bh=LxLVRB8GvDbWgwRUBMxy60vYqqNKxSuBn+6jZzlFCL8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=g88zdz3qfycUSPF8fcFoQsSFCGQrrZNGmffLzaoSaxHrtIuPahPUiW1lE9FeaFlC9
 PVbycfySMPUtdOdkQHHzA0BdKodnvQWV2gKOI+oPpqo6BIBxg6H/knk+R45K3vsFft
 yWf+7zUM8Y/QC8XMm33emK326dyqiqrnRIDumZDyeihtQZQq8tbziDXCDL3m0nwo4m
 9ELl4zi08myvz4q04N4dhfwy9JGVoWO+MzXnnn5vgf1GnbicJ5JT8SoGOfs7KrzMoU
 V7oYPZsZo0dCUnr/K3U4HnLgUG5kbX0FSDWtfeF6d5xnxzLoEcWNBxbWsb1k/vkswn
 ZgcpWcngdGGbQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Fri, 09 May 2025 11:53:38 -0400
Subject: [PATCH v9 02/10] ref_tracker: add a top level debugfs directory
 for ref_tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-reftrack-dbgfs-v9-2-8ab888a4524d@kernel.org>
References: <20250509-reftrack-dbgfs-v9-0-8ab888a4524d@kernel.org>
In-Reply-To: <20250509-reftrack-dbgfs-v9-0-8ab888a4524d@kernel.org>
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
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoHiUuSHanXz7A1Ilm2bM/zNryrFCG5d5XssAi5
 bTRecqbRRGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaB4lLgAKCRAADmhBGVaC
 FWSNEADGUHGBJlbP+lSQMWSbujQFrxCQUQlG/XOq6ZeOfhBtZyD0pvT2smyjryOOhnPVbxk/kx6
 9CYmpuVNYBYkEREU1ucURtaS6i/VVwY3TnSxh2g0wdjmaaw3XXOJV1sI/lrveWg//k84fzB/pEt
 63mG9CqIrsPepCLTBHZA65Q3syMILqHYF0871uDGvv8ik8lsvAEgICprbeIWJ6GypVpjnIav5Gt
 VGPC3pn0MUAedmjFchHgoBqurqub4JMeo5VxH2JNu+0KZDbqAXS+0qmQlhM0j+uejoc/Hweneo0
 +bd3ejsBxmxSAxu1kjDyxZ92cA5n0N8eBr4XSv6VLVJMVgn166y8+XUbC+WJCp+gbJUGocRFP8R
 bZ+s2ic/BRSUCmSaCG0+y3thioU7MmmBXXoS3BDDLwIAgMUoWemTVmnCbhd+QpvpW/lZS3Tpw9W
 0IkDQbCY8wNjCUaESq/C5GfIVH+KYFeNmiCVPCkICJ58IgoXrBUv5qoh4ICYcf890JXr126q+Fc
 4+bJgyFXWY8Dv87xTZPTmCuC3lQ1mss8LQ54n9Pn1PgVVorVInEFkzvWhXbjH59sHeI3JO/Ogne
 e1hvr52FMKTmrrf2F/fmednW1aaoUhOSYDiSulw+wr/i57UXm04UWjbOZfKv6sKqy/1AaLQcupP
 FClonXePgeB5TfA==
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

