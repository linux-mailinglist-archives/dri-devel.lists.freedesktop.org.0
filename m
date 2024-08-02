Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC0946175
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 18:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171E210E1C4;
	Fri,  2 Aug 2024 16:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YFaKCafh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9717710E1B9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 16:10:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5533D1C0008;
 Fri,  2 Aug 2024 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1722615026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzFKeSqiY4vFvEcNgDBqwksNHERVh13Inx7aPCMRfMs=;
 b=YFaKCafhMjnOPi4FmgpWYudbCqdtE5ffNoykwUfwrovgbxz3fyMnGqN9IpZbYb2rjebljN
 kbXW9z8YoaLyqQIw8Wb+RfCkctf/XYmHZ9nqG29pagKegSSqLnSITB4FQBUBiFxR2iPa4z
 vL+ArOFHmkqkTCHNSoflRX8eh37Bba6t/jCa6eKYqMRU1yIA446+PvSAyKiJaGoCiP8mVE
 5VFB8UAfywWsPbBYlYlpO44QAGYawiWWzrrcHSbZKKE6zNwU8WGdB8zS2oV/Eh2+uiETK3
 U83ZD2VROVtMbyW7ZJ2F0kZXRzyeng8kBvL7PJeyHijiGHPxzNPEtm7zPhtUoA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 02 Aug 2024 18:10:01 +0200
Subject: [PATCH v9 16/17] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-yuv-v9-16-08a706669e16@bootlin.com>
References: <20240802-yuv-v9-0-08a706669e16@bootlin.com>
In-Reply-To: <20240802-yuv-v9-0-08a706669e16@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=W1OdILhswR2WQBWaVIRt4ZEe8mhw2+qZswvOt3xLL2w=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmrQTbPJ5mhrrigztKjlh5Pq9wYajQfoRaU4Sxi
 1zNZ+iQ07qJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZq0E2wAKCRAgrS7GWxAs
 4p/WEACBX28wFo7zpS8hTfl9u6aThRtHW4UiHtPNBpbRsIEUT9J9sIC60Fz49uIo3DdOnkJczdD
 4k3KuCgIcBF67jJ/BHf5L2pFI0k/wppcX8/o1nKGD+919YVGXxE/tK1b0yjaud+h0HmWPdnrNzL
 oq6c9MZWNZO4+aYZ715FQMygJsQoE0QInKTcktXHay5GLuwvChaYbeDcRxLmqnJcXeRjei0bbt6
 HV8j1xCuurGo7jyFqHy7D3Uqr2mXZ5dMcRGEQLVueO8VRjaT6YijCrwFpKN2Zq5EmnCGKxvox6B
 stBCm9g1QYUPsXAQ99MVcgvRpeRZ3BlzMQHgrN6Rvu8pzvBx4Nmbrxi3LmAgkVrdy3+HFbWKA3O
 ysvMEdYBhxmUGIrqxHicjo3hLLpIZdCEWF00sMJ6HDoLVqA2jQwCQk3329ap+HrqF2mV2Igv35Q
 3wiiFlurPDpuTMnT3lzkEQsVca+69woi0ZKQY4mm3jrM+AEbBcAqq6ztEb2luf2oabD+fktW9Es
 qJfqPVEIGn7dC1OL7aevtxwaR5qTF6pwG/O9714gCIP6ib5qC7ei1Cf+By6FCiagjkQROftuF1b
 i7ubdnnDqveQGeKAskFrOf8SCLpeZ6iug9r3XLRD4PWbaapuMc7zknKTgpYYAhLssKC/PQgCZ3t
 GLb8XGXVAiFayBg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

From: Arthur Grillo <arthurgrillo@riseup.net>

Now that we have KUnit tests, add instructions on how to run them.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 13b866c3617c..5ef5ef2e6a21 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -89,6 +89,17 @@ You can also run subtests if you do not want to run the entire test::
   sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
   sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
 
+Testing With KUnit
+==================
+
+KUnit (Kernel unit testing framework) provides a common framework for unit tests
+within the Linux kernel.
+More information in ../dev-tools/kunit/index.rst .
+
+To run the VKMS KUnit tests::
+
+  tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/vkms/tests
+
 TODO
 ====
 

-- 
2.44.2

