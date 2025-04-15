Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC3BA8A03F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 15:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943CE10E798;
	Tue, 15 Apr 2025 13:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Y7PIHt3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6599A10E798
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:55:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF27B43B62;
 Tue, 15 Apr 2025 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744725349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vltx8mX8ESD4Izg3jWX1FdzqFZybnTpIrj/T6kwhbj4=;
 b=Y7PIHt3TdvglBtvpaf71cuytlUfvac/z1WF3tpqrQf+0fRmcq7Al7CCupeBl+okgYFsmqH
 4tO+r0QA+rfegpOj0M4adti30DXuFD0pRWnuH3TD3AKLy8WMkHgTYMkQUXYr/HELSAUH4E
 s9/IhI/yulLeSNXZzYecrAYZWcd+2BmgjSAI+tv+yLPeRWw0eWCBQuaJuP31V7t/dUj2Tv
 VG9vb2TSvnU6rIDJ7dxF9aRkAv4n8l5fzZXK5L3bTSarzGsX0Gj9t74YaM2nfyxHGpP7HI
 kecFSkSWc5KdFT79HKkKdujixSnVYracvJinT9tuCXpCscn2+SvN56zKGHafqg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 15 Apr 2025 15:55:38 +0200
Subject: [PATCH v18 7/8] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250415-yuv-v18-7-f2918f71ec4b@bootlin.com>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
In-Reply-To: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=YGppOmZ08w7cdLZ6VCQdJA6v437CNcrpfGrTCIG4Hjw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBn/mVYl7A5OdU5wgLFgyJqo3WRwjpjBtmyRzIeF
 DTRv82maMmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ/5lWAAKCRAgrS7GWxAs
 4sVcEACT01B7kphm74TDymnMyKEpMCa9bKQPZte1wJeWHiY7H9cgAS8xT9rhnERo2sDe/GzI3D5
 MN9bXVJ60rTo2XK14CNwaEf5BRWzpmtF9YrgqIcx90bB288yAgz6FwaKqOwhH8EAwXvj0yXO5KT
 mPqUG0qjJDSiJ7YmAWjXdNaIpeT/86M9sSf2KXZxVwaX/fLMBJpmvwhn6AHsuGn5EG2kWTD9gCM
 xXQ/mv88CxmhAQ/fSrAETbrmxEGLOinaLCxwNt+jOecr7dIO12W++lYSU1JMtGBVRU3l9fK8BvF
 7jhDq8vj0QCnzqB6zOcfMx00E/cXXHhrVB13t/MdrPwvCF9qEZgh7vOLBh809FeFM72vipaU9De
 U5LfMTuAQZT25Yc+wMYATzN5MGTXaBCNqFoonfd/BTvnuHQEQLlS+aIXoZlaHXop1xJRLW+SzR+
 5hn8cZG4Vb99ikWhtVTX8YrsAi268SuiXkneHfOrnrCBaPUBNlO+H9IxVHfXryroipPQKhLUs7I
 WQG17CqbnqNOmOXZYqvIESSenQYhrDab1fTTFh5g3KMiEvPTbI+a8lmfcmxHJgfESFVviczAvcq
 QKrM5LCp3OzuTDh46Szvrq86zlQv3FX2YUAGFR3DTOHb1+U0hC/7Rp399clCnuBKOf9YI/cE+sw
 ENBQvcl5xu8eshg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeffhfffhfeukefhvdeftdejhfevfefhffffheeiffelieejkeehvdettdffveenucffohhmrghinheprhhsthdrthhonecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedviedprhgtphhtthhopehsihhmohhnrgdrvhgvthhtvghrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrihhrrggtrghnrghlsehrihhsvghuphdrn
 hgvthdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgrrhgthhgvuhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomh
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
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 88e0913ca33a..8a8b1002931f 100644
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
2.49.0

