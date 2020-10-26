Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D54298DCF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 14:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8EF6E133;
	Mon, 26 Oct 2020 13:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 942 seconds by postgrey-1.36 at gabe;
 Mon, 26 Oct 2020 13:27:20 UTC
Received: from mail.codeweavers.com (mail.codeweavers.com [50.203.203.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7D26E133
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kOGBy83gPfRHwJKiQK/8YJ1+92SKsGK1ZFtpod1fVoA=; b=vlUwfTOqJOEl0oKVSd2d6fcAk8
 ZFuofD9eh4kAY3F4mO4AslIAtQVMeTtU9Pc66SLpilynqtL999dvup36EiykUl0KMcIYt5qoJdgiT
 bAC6T5Z4YG2rxq9gxKxsTDAqdtgqKiui1hrzk81S7cvEh6v0Lp0PF8GLA7SFqmyYkCyY=;
Received: from [10.69.141.123] (helo=dell.localdomain)
 by mail.codeweavers.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <pgofman@codeweavers.com>)
 id 1kX2Hg-0004zW-10; Mon, 26 Oct 2020 08:11:37 -0500
From: Paul Gofman <pgofman@codeweavers.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] xf86drm.c: Use integer logarithm.
Date: Mon, 26 Oct 2020 16:11:20 +0300
Message-Id: <20201026131120.1068959-1-pgofman@codeweavers.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: -40.4
X-Spam-Report: Spam detection software,
 running on the system "mail.codeweavers.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: log() is affected by FP control word and can provide
 inaccurate
 result. Fixes Killer Instinct under Wine not being able to find AMD vulkan
 device. Signed-off-by: Paul Gofman <pgofman@codeweavers.com> --- With the
 rounding mode the application sets (unsigned int)log2(4) is 1. The log2_int()
 implemetation is copied from radeon/radeon_surface.c. 
 Content analysis details:   (-40.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 USER_IN_WELCOMELIST    user is listed in 'welcomelist_from'
 -20 USER_IN_WHITELIST      DEPRECATED: See USER_IN_WELCOMELIST
 -20 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -0.5 BAYES_00               BODY: Bayes spam probability is 0 to 1%
 [score: 0.0000]
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
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
Cc: Paul Gofman <pgofman@codeweavers.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

log() is affected by FP control word and can provide inaccurate result.

Fixes Killer Instinct under Wine not being able to find AMD vulkan
device.

Signed-off-by: Paul Gofman <pgofman@codeweavers.com>
---
    With the rounding mode the application sets (unsigned int)log2(4) is 1.
    The log2_int() implemetation is copied from radeon/radeon_surface.c.

 xf86drm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/xf86drm.c b/xf86drm.c
index 50a6f092..dbb7c14b 100644
--- a/xf86drm.c
+++ b/xf86drm.c
@@ -124,6 +124,22 @@ static drmServerInfoPtr drm_server_info;
 static bool drmNodeIsDRM(int maj, int min);
 static char *drmGetMinorNameForFD(int fd, int type);
 
+static unsigned log2_int(unsigned x)
+{
+    unsigned l;
+
+    if (x < 2) {
+        return 0;
+    }
+    for (l = 2; ; l++) {
+        if ((unsigned)(1 << l) > x) {
+            return l - 1;
+        }
+    }
+    return 0;
+}
+
+
 drm_public void drmSetServerInfo(drmServerInfoPtr info)
 {
     drm_server_info = info;
@@ -4001,7 +4017,7 @@ static void drmFoldDuplicatedDevices(drmDevicePtr local_devices[], int count)
         for (j = i + 1; j < count; j++) {
             if (drmDevicesEqual(local_devices[i], local_devices[j])) {
                 local_devices[i]->available_nodes |= local_devices[j]->available_nodes;
-                node_type = log2(local_devices[j]->available_nodes);
+                node_type = log2_int(local_devices[j]->available_nodes);
                 memcpy(local_devices[i]->nodes[node_type],
                        local_devices[j]->nodes[node_type], drmGetMaxNodeName());
                 drmFreeDevice(&local_devices[j]);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
