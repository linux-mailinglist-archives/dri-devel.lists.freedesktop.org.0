Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A94ADEF27
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE89510E865;
	Wed, 18 Jun 2025 14:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TyBV+imc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D3610E012;
 Wed, 18 Jun 2025 14:24:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7B8914A9F9;
 Wed, 18 Jun 2025 14:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8166BC4CEF3;
 Wed, 18 Jun 2025 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750256672;
 bh=Cf9EAXyNK0VxD7speigkvYTyuNOgS7Co5M1zyvhQst0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TyBV+imcrtJiwwpbaeLynAeTh8hwcKByRSAP15DhiBFuiHAKC0I3rXELx284XWUu4
 PbZs4oKwh6XtBCoxEZmvzPi88IVZC1M7U8OZ+HF4HNHMTRhZ0oAFx0nlfoUeby3Med
 +HmDKK27RzqYvjm4UzDdbQoEd+kaLnYJ9K6x1e/kte2HAQEnGbciewagvWUd+CrCIr
 PTDbwKiWZYMcwB6304zPpGfUuHd8LndCg6LJPZsBymPgMz7zT8pRAhxGRP+9ntshrr
 8PJeBzExRXPb1JMNnj4f1hiZ95ogJAIUA+Sv5SSJvsUXYqLOQcZrClsXAsyrrG6d/A
 qLI+9FLExrKnA==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 18 Jun 2025 10:24:15 -0400
Subject: [PATCH v15 2/9] ref_tracker: add a top level debugfs directory for
 ref_tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-reftrack-dbgfs-v15-2-24fc37ead144@kernel.org>
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
In-Reply-To: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
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
Cc: Krzysztof Karas <krzysztof.karas@intel.com>, 
 Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Cf9EAXyNK0VxD7speigkvYTyuNOgS7Co5M1zyvhQst0=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoUswYtRrKDTz0z/5jptbsBl6j0GRK2O1Cx7HMd
 fA0vrEFgoGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaFLMGAAKCRAADmhBGVaC
 FeXnEACIiGhOyzQ/qv4M8h1JZn+mH/jIaYUe2C3dkp3GOUP+LGeFMJgy5VWMgPBZzbB6jBFWT5g
 KGSQbrSNDjnQ89ux0ka392dfz5/0GB91dyVfcmKqIWPEbDf9ihAoI95KksGzuYeIHqxdUwx+Lgb
 RDDlyYj9QY5Vo1ofaF7ixnH2Oj0bhLN92P6rHUQdJpbFGwYFs3nPyKNhQvqsmToKP5rXOw2W/S8
 bYeq9/tzN/7MkUDDjVgp5WoIwFdsQ4YjXB6oaibttgE6M4PhxOWDCJbsAeokn2/ImAqn8SKdwof
 SqVFm97peAjTiVbZUH45yXV0vjokuHj8z8KoHMkPCLBftGY9ZbAgD8RA/t7ZIAOMNOArqAa/gVh
 rHL81qWVWtlC8bEQZSEJD7hfYJULnorieZeDMsbao2bDNeaE8SkYSjt1WlJLFibOoHAThoghG9v
 9C6qkM29R7m8kvPcrS2fs089z7OHstiyyVFI1QGYTPv8+HqlHzwS3HxYknmXAzspSUK8zlSzWIT
 BYKaTgcvvC8pc5OJ5gTig6Uxk4w049FeD2kSN+ek4opuD+k6HfvLXN5mcFoMhVEUlB0Uk+6YXVf
 xtTQObTA3yG4zEVxpoS1J8RCKk3PBeBZnxEJJw7OLyz0xy3Az4DJsJ/6N5qIRTrR4GnjZx1x2yr
 IFD37GA/g4tOwXw==
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
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 lib/ref_tracker.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index de71439e12a3bab6456910986fa611dfbdd97980..d374e5273e1497cac0d70c02c282baa2c3ab63fe 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -273,3 +273,16 @@ int ref_tracker_free(struct ref_tracker_dir *dir,
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
+	return 0;
+}
+late_initcall(ref_tracker_debugfs_init);
+#endif /* CONFIG_DEBUG_FS */

-- 
2.49.0

