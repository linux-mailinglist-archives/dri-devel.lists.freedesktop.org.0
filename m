Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F79AB1969
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA6D10EABA;
	Fri,  9 May 2025 15:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G/1Z1FF2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5655410EAB6;
 Fri,  9 May 2025 15:54:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CC7F6629E2;
 Fri,  9 May 2025 15:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF7BC4CEED;
 Fri,  9 May 2025 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746806084;
 bh=Les2Q1JDGDchAASaheHbCbzDsZvfcnT1V7XgBGKxhhs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=G/1Z1FF2sDlh8rzNTtBhbPYIpla0iT1GaPO57MPPrbIvXy1+h38PirspvcoWIyjJ7
 AbcSD550VKMMjXQ22K+NyEPy1k6X6sTQY6nVMQ1xc2EKZQRnMk2Hvp3LYJ60UPdovs
 4HYXWX+KycCl22/wbaGaWqCXgXJpwtm7Ey1/iWVPwAJjE8BiddUwIKu1m8wythLgWs
 f7TLz7ZkioQhJWJ9RlaG6eRY88vect+hVl3V6G/7EmYSkth3rbY00yUlyOtdXGc/Et
 FqkK81zdYkXge/373CLUCNnOdhTxO1dH1CqTXqhEhbukG5lxvpwUFCZozlE9XSaBrj
 KUqFJau6vZU7Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Fri, 09 May 2025 11:53:45 -0400
Subject: [PATCH v9 09/10] i915: add ref_tracker_dir symlinks for each tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-reftrack-dbgfs-v9-9-8ab888a4524d@kernel.org>
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
 Jeff Layton <jlayton@kernel.org>, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Les2Q1JDGDchAASaheHbCbzDsZvfcnT1V7XgBGKxhhs=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoHiUwgYXNMuLWTr7s6QnRaLRoXJ0I2i/1kYd1u
 w+TY6LosRKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaB4lMAAKCRAADmhBGVaC
 FbuBEACyCMSaZdQrb5+qfWbknXd2TSel14YSmialcBJY+8oYVkleiO28T5yl4M/TqgXhUSuTzJ4
 SWSiCysPWTP7wGowlokclp5TRjSjd/sZkhLyGOqpt4nB0v6JgdIeGujIqdVRFrajC2HEjmLwauh
 dl1eAiZpKv9soPKhFROa17/XLgFlkWNRBHtE52GBpA+YIKRsF/JrarbIXKu+nvhUuOJw7V4EZ2l
 YZWBjgN6q8O9abfP42+99yycuYjV+kft4+u80Tu9rM46ABTwtTreS7fL4n/EugPIapSbAgy4aq8
 OkX8cSYqGP4kvE6soX5mAh6gnf1zoD5KgCj0MRRlHFRNhhsqobsOaxyrmHpndZOGtaW3XOjBAh7
 rZKpaGAlnEGjcooGs0FxK0Ml/EN2x+YCan1ywIxW2peCVeipH9PKKvv7gHrGTw5ONXomfDx9UZ+
 oiZtILhxYnM/vzkDjFOblcM/Qi6MpdR37hJnXpmJsp7pyICslcMPmLZNrtZm/ZDLxFfacX5SXP7
 aCLb5BmBemu5qzMl9OINqd8Sxz4m4oyjvqN/LASHueGnm9QA58lXJJ101Sm7cyGPMVLmpr75mOo
 W1hjzTVkKEgJLXsN+ZAz1Xa5tJZR/M27GMDuM8tgTIur8DB4JXujXPYz0oV1vI84ykb+MiO545G
 rpoBUFbP6rgwvTw==
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

Now that there is the ability to create a symlink for each tracker, do
so for the i915 entries.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/gpu/drm/i915/intel_runtime_pm.c | 1 +
 drivers/gpu/drm/i915/intel_wakeref.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 3fdab3b44c08cea16ac2f73aafc2bea2ffbb19e7..94315e952ead9be276298fb2a0200d102005a0c1 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -61,6 +61,7 @@ static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 {
 	ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT,
 			     "intel_runtime_pm", dev_name(rpm->kdev));
+	ref_tracker_dir_symlink(&rpm->debug, "intel_runtime_pm-%s", dev_name(rpm->kdev));
 }
 
 static intel_wakeref_t
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 5269e64c58a49884f5d712557546272bfdeb8417..2e0498b3fa7947f994de1339d4d2bed93de1a795 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -115,6 +115,7 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
 	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref", name);
+	ref_tracker_dir_symlink(&wf->debug, "intel_wakeref-%s", name);
 #endif
 }
 

-- 
2.49.0

