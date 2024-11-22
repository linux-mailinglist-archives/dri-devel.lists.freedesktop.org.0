Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC349D61CE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E092E10EBEE;
	Fri, 22 Nov 2024 16:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UnIVGG6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A827710EBEA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:15:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57C7C1C0005;
 Fri, 22 Nov 2024 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ROA9s97zr/TnBShjvPt9n/VC1Dc0gzXiBJZ5MkzKUk=;
 b=UnIVGG6PtfNfoD2S85gfD15bbQddp5DcxMxLSjc+jo42ZoF7rDgDZZ+UKCJwBBeIO5qa0b
 cp9SKt+S2HCeJOmhqtpQvA3a+JsaFDwAgY+x/LNZ0pRHfJ358ouzEoNOD1H/Yn20iibCee
 SxjjGrj6UTNygOaSjJhngKOlD5EUfld3MqdFkD239bUz1+IXfHKRlcLM2uU4EkqPGGA42V
 QrtkPRLdWm6kDosZ9ejVkocccsgkneGUnB54QgSCeHpu/dgPZqAgXOuNxS7ZecSZRdn7j6
 Gk3EJLMrGxB5sNRdKk803tKprG9uhwF27L91Hv7vo8TFKgc6VRtGB/VJfHuusA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:15:04 +0100
Subject: [PATCH v14 4/7] drm: Export symbols to use in tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-yuv-v14-4-e66d83d28d0c@bootlin.com>
References: <20241122-yuv-v14-0-e66d83d28d0c@bootlin.com>
In-Reply-To: <20241122-yuv-v14-0-e66d83d28d0c@bootlin.com>
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
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=axL606VOP+Vzkxig7OQTFfHk5EC8HgjRmS6iK/9rLyk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQK4HXt7kZyL9h/sZ3lKLwtcJhjG6CeuXVv49x
 fiQQp9OE0WJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CuBwAKCRAgrS7GWxAs
 4p3OD/40fJ6Kxjor7dbrBzKuRdnky8GURp/WOHla6m/iz7pHGwbKMKOUqaXODZk3BvtItDPYsOT
 D8/vJlZvdjQ1zEs215Hp4fWh3aPYUgU+Xdot3NQMQ6asW7vioyV50efOOO/5z+20UQ+OScGQm7/
 cLNnHV9cbOAWlPZWXSU86o4NeiqakGcUuqqMEOXUKakD861zE1R3WN75yun8qX6T9Z8QQAoqYz4
 O1nwBqSjIBtsIeF4IdnRG1zaioa39wpVlKyO6Cv0HSfKNCZvgIholyk+ec61JA1TejQh+9OQ0Aa
 3i9GhQ0ALkXSKcjS3TOqVnCuWt1lv5moFQsqZpEjWWXkE5yq/lSF9Rswz7/tW7sAjdAa6FhAQ5W
 92BbA/WBdF+u4PRsqM/hg5svwl4/aO4puotlM1ajtnZEijvnn5qxhQ/9aXzA5lu8OiZ3ZLiTwzA
 FGHPg4auCnpgFxB2DbALdOlP1BpKrcP8rPwGWROnf8DToMPDZkq99KTxfQiFi8TLSrrdF4ol5pV
 b8VAUOU0JZZt8jhiAoFJtgg73XXcQLyTgQVGmJEfXrnbVngiwWbIa60lHx51yabXtng39n1X4Ej
 MoVNVtgnj8tEQgoeCzNRsmi1CF5FxtcwlhtojHxWZo8mtMM+WXoI0dLQV0DJuzPv3TlkSjiHOXM
 w5yyDUKcmU2hvpQ==
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

The functions drm_get_color_encoding_name and drm_get_color_range_name
are useful for clarifying test results. Therefore, export them so they
can be used in tests built as modules.
---
 drivers/gpu/drm/drm_color_mgmt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff605cbdd3d56dceafb2ca00a5c886..509aa4325391340f8cfc50bd0fc277c48c889d3d 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -494,6 +494,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
+EXPORT_SYMBOL(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
@@ -509,6 +510,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 
 	return color_range_name[range];
 }
+EXPORT_SYMBOL(drm_get_color_range_name);
 
 /**
  * drm_plane_create_color_properties - color encoding related plane properties

-- 
2.47.0

