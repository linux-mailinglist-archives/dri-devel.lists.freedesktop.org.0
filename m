Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81589FF0E3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 18:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C1010E69E;
	Tue, 31 Dec 2024 17:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TErpEQHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FAF10E69B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 17:32:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55B69FF802;
 Tue, 31 Dec 2024 17:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735666321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E23u2HV9o/J41l+eBD2531fojOe2RYdl9ZE1qpOWnRM=;
 b=TErpEQHgWypcCcQoXKIRsGNoos/5ebedbRsj8NtPDQO9hP+Mh+s+cHL/LP8vjjVvS27Bkm
 tiiyqjI4cuiEan4ob5hCsOjUsLZ2CbdpF2ag5HjVcyVI3aPf3HOK7vpCB0aSGP2P1n0XP4
 D1RJ9C66oLDi21w1WJJ8BMczqigw6xzae35kbC+m574LoqLLUXzaLDXl5I5eWrmds4Y7Wn
 DaV2esML/7eHVJX4M+qEa5gNKBEn8Wfs0EQHnU6cYOtWatD/0zLP0BxU6SKvlqOhmX3SPf
 MN+hSEQ90JneJ+WFmqtqyS5Nadinm6hOxFRgd/RYWBmbUONVNhH26hVCZweQuQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Dec 2024 18:31:49 +0100
Subject: [PATCH v15 6/7] drm/vkms: Add how to run the Kunit tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-yuv-v15-6-eda6bb3028e6@bootlin.com>
References: <20241231-yuv-v15-0-eda6bb3028e6@bootlin.com>
In-Reply-To: <20241231-yuv-v15-0-eda6bb3028e6@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XHoQP/J8cFoOO0Iqf+wQXqpq8li+aYQP7MigkGdUhFo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBndCqGf5HQoQyx1heQsJNCHcLGuk+s4uQ/EWhyx
 v4NS7KhdWyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3QqhgAKCRAgrS7GWxAs
 4h/QD/0c4jwBqeyukKh3nFr9RuIjAaO/iduccuSa/qbkqL4AstJCg/+h2iEcqkX9WZDCwdJRGBS
 XQRI/kEpgVYzPfiY4Iu269ODepfCXxM2a5LWcoFuuOTZDQ2ONmK76NffNy2Ky04gW0po8fJxzH3
 Vme1m7CU8XdD1+VPxsPDhp8tPZZ/HA7zQaD0KMbQ9ArOBDqk01UQ/R2KPZNx5DSOzWHEgw0s/5t
 1VmeQApikxJMlYyuaJahsIGNyecIcALXTWUZ3/7j34sZ8/aAkXU0GiHAAlCE+EAkGH7pRtKoH4G
 NMA/SxfXWBK6rAEOSJ1OAf76S2t21MPt8cC97QL+JR03uwxyATrVKA2WquwSr0KcCl41+iQMj7l
 zjP73I23RAGlbx6AyKV0TvV8mSveCgr+UdVlOFgs+0ML1xLr/A5nCEoGHtkTv2eBAPXHc2v8l1G
 2TIErZ04w+2wOLrWULW5jOlLc4nJ9nmhGmBaHD/JHmgBAYJl1oH9jqs0J4TcyrnVxAxCYIZEMYi
 Ynp3vr1NGAGbECr+5UqUQAxcuvkgXcxkghF2yoLvrxgGUJU3ihi/FQhUSsR6roFUKRwcttj8dHS
 wAXWLLMdeMi4iU69LWfrhndSI63AYT9nYSTOmVtJz9Xi6TqLYOo7p9of8BEBOrw6HjBqKrpCAG2
 xjNO93a/z8dorQA==
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
2.47.1

