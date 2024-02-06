Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DE684BB48
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 17:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340BF112CD7;
	Tue,  6 Feb 2024 16:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8969112CD9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 16:45:52 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 6 Feb
 2024 19:45:48 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 6 Feb 2024
 19:45:48 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/i915/gt: Prevent possible NULL dereference in
 __caps_show()
Date: Tue, 6 Feb 2024 08:45:43 -0800
Message-ID: <20240206164543.46834-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
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

After falling through the switch statement to default case 'repr' is
initialized with NULL, which will lead to incorrect dereference of
'!repr[n]' in the following loop.

Fix it with the help of an additional check for NULL.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 4ec76dbeb62b ("drm/i915/gt: Expose engine properties via sysfs")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
P.S. The NULL-deref problem might be dealt with this way but I am
not certain that the rest of the __caps_show() behaviour remains
correct if we end up in default case. For instance, as far as I
can tell, buf might turn out to be w/o '\0'. I could use some
direction if this has to be addressed as well.

 drivers/gpu/drm/i915/gt/sysfs_engines.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index 021f51d9b456..6b130b732867 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -105,7 +105,7 @@ __caps_show(struct intel_engine_cs *engine,
 
 	len = 0;
 	for_each_set_bit(n, &caps, show_unknown ? BITS_PER_LONG : count) {
-		if (n >= count || !repr[n]) {
+		if (n >= count || !repr || !repr[n]) {
 			if (GEM_WARN_ON(show_unknown))
 				len += sysfs_emit_at(buf, len, "[%x] ", n);
 		} else {
-- 
2.25.1

