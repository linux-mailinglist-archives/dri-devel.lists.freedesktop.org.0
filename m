Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A04C9D1851
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 19:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5972110E560;
	Mon, 18 Nov 2024 18:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fpOTqIN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A319E10E569
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 18:43:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54D351BF20E;
 Mon, 18 Nov 2024 18:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731955406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfHoqEBmoVIVQo1Iw5eRxgKBa4FOCahU3iIkG6Ku/Eo=;
 b=fpOTqIN5mToMQvcoyY4BmiUAk1TTvSag89SVkOP9JIPykD75XU8NSVdp6jDJzq2a1OTro9
 7cYyg6VkRQ3NYMjffPZ57k9iY64HJmPIOs6tSaqj4bfNy4datq/9NuehjdrevkLBxWsCjT
 CNfTPZ1BYndjBCwVTICZCSlajwpn6x9PDPUu+QDtMHZnX9GH3A0idRSrEyX2jWMkj8CeUu
 0fsQlFdauWvJyPHwBKNgU3S6l4aiBJcnwVJZB2JIEJWYbQ5+j9o1Q2qCPOzSNCcPuYU3p8
 piRMsdZNaq9yGAvoFOHs7gTm3St/Re+1G8JzVw9Xgm873w8Ks8TVXYJFOAAYyA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 18 Nov 2024 19:43:19 +0100
Subject: [PATCH v13 6/7] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-yuv-v13-6-ac0dd4129552@bootlin.com>
References: <20241118-yuv-v13-0-ac0dd4129552@bootlin.com>
In-Reply-To: <20241118-yuv-v13-0-ac0dd4129552@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=KcZXKbnDJcUNaO/ryK3mrQAB5uKi2etnbYIX4nCF2Hk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnO4rFnVPLdvp3y370uS8KmlpIR5xxyCugSoHQM
 4UDXZu/UraJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZzuKxQAKCRAgrS7GWxAs
 4nc5D/sFkHZnsYRQK7QcmUF+61Y6uH4ACBxpuY+bkbLx4oxOo/vHXmxaFwwJHASHBKEtvZkgksb
 0LsCxF716aoVc8Kg0rsRywt5C7Euk/z6CVYyPS3WdjrBTWAUI2LAYAvn/JEfgi7TAdX8xsa7YxR
 Q7rUv7r3+kdqEOsGNZt51+zEU4zbBt/XXEIJ7zbiP5zDxQyMmVlJxEZMriLvJddIOwFJPK7vQFe
 +carx52CL7avGC5KNYfhllrDqzhLzvIUzgQd7CwMhPJEH6qj4fsorp4D7LKV1v9CULIJJMlBJOX
 ZrvzqCgGNWVHWKzQYYs70/dpIzm6eKTo7yAtNgiY7lfnS9Fgx+kRW+LCjTSXCECcOvmmJNVZ7Sk
 VYbhXWdr3QX+MTsGMv+KjKw2gox5S9xGcvModIrajUwct1aEKewvGSf7uWo/3ZceNjn1pHQZjbA
 8D7AKGOrTjWvv6nihHcyWMge9D47gZRwyPtwmUajvB/igxLT75+scIXSF6iU1QWYBHM/DdC9TIb
 A68poEaolzTPKkMfatxPhyEasdLQldvsU7nE+pbWqzwskIVnpGJv+qi3ghL/1HrDtIOrA5KMca2
 iCSgNH9sYqakXOnxM1litj7tdsKgLOLu4oEAOfhIrpINFinRqaEKHigy8mjX1Y4ITfXEWx4DO6b
 sBnPGHI9WF8UKKg==
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
index 13b866c3617cd44043406252d3caa912c931772f..5ef5ef2e6a210382a070eaf3552bbce75b04ff0c 100644
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
2.47.0

