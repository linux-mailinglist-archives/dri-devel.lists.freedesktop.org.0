Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8BA9B8233
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 19:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA8C10E908;
	Thu, 31 Oct 2024 18:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="faiK9yf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0B510E908
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 18:06:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E7182000F;
 Thu, 31 Oct 2024 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730397977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dr23WBAY8ZlBbMVkhnAU+t1UPEWAWhnUCz8S7CEndk=;
 b=faiK9yf7SG5VWhqxjI7OQYfTJCjTC/kXWbTKyR85Z9wRBPDHGFGatRmW1p6pfD+NpH7hQH
 qJvECZm+zTdJO9j/OOUZcJpz7G+PQBY/sZMgjxCvkGjwEZuYAJop9bHoxPyoiUAhSJpMSj
 PpDBAYJDLBJkmUtifD5ofUVk46CCHy38rS71lVKGD53E4lgr4jskE2tfVA7440m9tEHWrS
 91itqMj3gHjpazHbvibxm21eqdoKWcpHRnXZ33nlTvOVEYGuYVjH+NTMrIDRwtrkYHu2ME
 c2zV+Uy/80wekas0CgOlMs9+dc0PjEEcA2aO9hM2j2OS9r8AZhevuOSEUANsLg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 31 Oct 2024 19:06:06 +0100
Subject: [PATCH v13 6/7] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-yuv-v13-6-c67a337301ae@bootlin.com>
References: <20241031-yuv-v13-0-c67a337301ae@bootlin.com>
In-Reply-To: <20241031-yuv-v13-0-c67a337301ae@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 20241031-yuv-v13-0-bd5463126faa@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cnp5oJy7nuzGGG9ERF9CFtbtr9GkJcMMWvS4L3S4Vps=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnI8cOFnJu/bZQoRm8WNJWKPZ7P7plt4DDDTlM8
 j66b+RPbOGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZyPHDgAKCRAgrS7GWxAs
 4rjhD/9wfcZde53S6DmfNyReBfKsHbeMUDS8S1lrLiocRSH5sVv+v55ZHLE0Mc2saY8LYQtJQ96
 TPk2LlZMpuIoCVz5W58wUrRK4zvK8RmY/vC7I+OKGrsl4lN18ytbHTojjtWlBW0Rf0Kvn2GMIpV
 xNBbC89FUpabOywT40Nr91bjdk23FFkmacwBYNAjnOnFHaubB8ldtNx0uYU2BFDWactuxc08qso
 O6PMGQiNUA7dnPYFyA1HsD9PnR39jQ0itseWGpOZ5q6dZfyksL3N16/+dJGer3jloVy1tXD1ikr
 m9cOAb37TsDRXl51RJBVHuMRwi7h8VJgT9t/ERi0w+l+KeGxXVJV4xuRBUAfMi6zbwOwXajxFIE
 QJ5qX38IZWM7Obfgod0IZ/7w1Z7hJifCy9iNb+FOSpTLGThKLWKbTQtPBlvW5V4Eyjh6I7YzGhr
 YwuByOtPMIjdk6GbbyYl1WqodB2bU+2bskr1FHHCOjMqhg48JA0IOJKTxXlnq+HOcC6lMPOwK9v
 q3c+B0irndOdxOwF3b6hv4L3Je9H0lwqir09GGEE2yRYAp99L0gjyQkC6eJg9Snlwl/WObxl8FA
 2oNFXOZ4PyeC4imMKun6PhwgcVLwhX7QAoY9nz83YPlmUp4fdoyUMWlVtlStQu0ZB/nacUPhKOB
 gG1dkbcug/N/GkQ==
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
2.46.2

