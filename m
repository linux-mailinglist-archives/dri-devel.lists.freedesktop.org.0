Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F1B94D5C5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 19:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3944910E9CA;
	Fri,  9 Aug 2024 17:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nOpwgwZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9708710E9C6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 17:55:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D4EDFF804;
 Fri,  9 Aug 2024 17:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723226115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzFKeSqiY4vFvEcNgDBqwksNHERVh13Inx7aPCMRfMs=;
 b=nOpwgwZOBfbZF4saM6Fyn7MxszjsJwBrdEh2vWKchPW6smU8CdHoNWtYazFH5t0yG1IXlV
 SbRz2CI6VPHw34R41fFsjmhCKb4dV4xd7T3FRcccLau/L7NBUteGhh27elsqugMrftQhGo
 K2tj2W8ViJE2NHSyAT3JFUwqLbj7erP+kqWKB4EkTWVqv85a3LozRy2avjjq8+4maDAWdt
 N7qLBgJbrekcESdSpOcXoxTfz6DVNYvJbc5OhjzO2Aq028N/qMP4xzRiPr1foxhSImWiLx
 EhTi2KN3OPzc/sx1WiWHMWWHfr1pmnY9+pM1JFWgUIIxkMQTcxUr9fp3qX5ATA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 09 Aug 2024 19:54:56 +0200
Subject: [PATCH v10 15/16] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-yuv-v10-15-1a7c764166f7@bootlin.com>
References: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
In-Reply-To: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
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
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmtlfrgouryDlGMA5PNMQMZ5CVsVglsQNyeN7Ch
 iLIwbKPLoqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrZX6wAKCRAgrS7GWxAs
 4qr6D/9hYhAga7BQUfHAYLq9lEP04icdlwBDhQ6IIgVuL/p2Q5GYlCjC3T29WsId4GSGuEbvGJ6
 sIBAigaWfh2O2Fr6qDSsyeDgVmjmtUeKbu6IrbYkBkWmangFT3ZWrJEo3hRLXUQ7Zse7LkUa9j2
 uchBXpdOLI+dRNg0S/ce9Br2ZytdX7ZHylIwFp2IdXLwsB9hfmixPUscxKyZd54hpGO/1yWTnBS
 9+MhCh73rEOkRImV+6bfdliCfasL7Z07nFhgct5fuUgId2KZle2B5IHdqiaBXXFjwVZt1z9fUzu
 5p9GAQO4Byp4awwFTtKjnOEyonznK1kzG0/YwGxzcIEAxaLQFyoOuQR018ntHkOc0f0o4W7rE8x
 apM/PKgmfEbMajSqLLmiC9JO/7g8uhtSB4TJPW9jujKfOtLdEEYUaDSRpfMxCsN8RZpJwBk5H/Q
 Q55zyWK4YR9DWBjJXpBNXG9F/3W3Q1TY8VxcpfnLO5xlwgpQ6d4qcumY81pHpiMePf+Z4mj5MYT
 DgAb1KEL7EQPuPbEKJrprfZO2LyX5I3+kVs+ZUr0aQQ1a3zfi9EuWJwD+SnRA1gkGtG36LuDRhf
 F0EZIFYRryNVNXdCvpYA/AT9R0eCZqwfYt5KkKdsA0WySGfwdBG0u4I1S9LiZtgKrMJxlRH6t2k
 1Ngd04MS6xgF2PQ==
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

