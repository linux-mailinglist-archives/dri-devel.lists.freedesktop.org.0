Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B69516CA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFC310E427;
	Wed, 14 Aug 2024 08:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HA0nHhnL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE17010E096
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:42:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58999FF807;
 Wed, 14 Aug 2024 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723624941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CkrEdabYe0y9aIeNNIJuJ5CQU0BDgi8kMyiAxZsWDaY=;
 b=HA0nHhnLh5Gz+ZxPsXYW3sScNYinK5iV6FRcDkJEkqVCRM/NnjLRCHNdtGuZaloU+VWbxP
 VoQRzsTAbe7jWJqxfALD6Iw4Uf4dtASJDkI6Ut1clTaEJmBnTgczsOqVoNQWZB7+8odOaV
 VwepmNj7ggNipx3fWY7GSKQ2bafpapyBUpyvetT3YsLTMDHw2ugiJukgsu6jhwYbY4qJvM
 YEfaZ7qhNsqOG4pJ0XMEHqfP88XuwzzRbc4Y/tJtamoNjlGePiwXeH5WFf7Rev0Rl2jAdD
 T8/5Iy0+wKrC86DXF5CwDPJJSNzJmAfSZ750gC5Ba4Z/aNTCBvTkOdpnFO01lg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v2 0/3] drm/vkms: Reimplement line-per-line pixel
 conversion for writeback
Date: Wed, 14 Aug 2024 10:42:15 +0200
Message-Id: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOdtvGYC/3WPy27DIBBFf8ViXVogfmFVVf+jsiLAQ4MSTAvEi
 RX53zuxValdZAWX0ZxzuZEE0UEiXXEjESaXXBgxiKeCmIMaP4G6ATMRTJRMCEEv0WXQyhz3Jzf
 CXs/rSduyqWpWaT5UhuDyVwTrriv4o8d8cCmHOK+eid9fN2TF60fIiVNGGy1gp6203Mh3HULG0
 bMJnvTLZonwfcbWeVMRrRJQnHuXu2KInnqXzMvvhY5wzfd6HlJS6+e64nUt0jJJ5/OEVoZarhr
 T1CWva9v81b49WOYl1SXSL+g+hUhtiF7lRCeBsFbvSimNBcngP6xflh913sXSggEAAA==
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3135;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=JyaeBi4ttJVIxpb2eIxkK/ildv6Y/mVI1IT727n+qyc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvG3qSBNzbIvIQZ6Ls4hcCpNv/1kMU/1rS2RJ3
 /ZmVnOgvbCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxt6gAKCRAgrS7GWxAs
 4q3ZD/4njcOCak4z2ROTa34/GAYKEeg9ZjFJ1rPDeJC2bi5Grqu/4IGf/vzsMiUwo+hTp+yjtb6
 qUBaqo2AIzoOxYzFuHjdWIF3Pnw6d3pqKTT7ZS28M4x2gWB+IRM1WjHAS6+482xjTt9dcA9fRtX
 734F/h1Akvyzmxjm06LgKLWoba7Z6IQqjoPajiGNFG35ZRxEhWBqWWPek1A5OJvLVb60Ov1bIVM
 I0ucsMApwhOvMjNxe7luCMt+4AAJMgCNBoTh8PMBDPxuW2G+iBiGYdG+eT1c901sacaoM7A/H6y
 TTbiKmoTzRnko00Rih1a/5xmgyUOMtYBsQMqKEhdxUQ9v2SS4OIObgvTnZ+Ium3U0eCnNoW0kiI
 TKM4jfofWNrsWRWW4+j8IxTCotcxTdrLLt3OTt/01e23yu5AT+e+tuexuvhju2q5dEzIxJIQRe9
 FPyZEyn3OkRMlAnq5ySbqF68K7cqtQEw9Q9QCxRO2U8POW5Hvvw9nHOhu5e/fzu5TnnQUirl6AW
 mvynb11q3mAkyxfACt5tiFKiq1zDAcCCKlTMhfC2raH9x4Do9Ri8ws52SXtmtEZiQ4EsnO2nPaY
 EkfpxAzGbmu6ik3GGpafKYhhFZjQerocfqq/25DvXn1ClxiR+SnOKlj68vqSjE0kMeTqJZq4dzW
 uzFgeD81Vw7NgoA==
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

This series re-introduce the line-by-line algorithm. This is simpler than 
the read part because no rotation/translations are involved. 

PATCH 1/3 is the re-introduction itself
PATCH 2/3 is a proposition to avoid code repetition using a "big" macro.
PATCJ 3/3 is the usage of PATCH 2 to support a new format

This series depends on [1].

[1]: https://lore.kernel.org/all/20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v2:
- PATCH 2/3: Remove YUV from supported format list, it is not supported 
- Link to v1: https://lore.kernel.org/r/20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com

---
Louis Chauvet (3):
      drm/vkms: Re-introduce line-by-line algorithm for writeback
      drm/vkms: Add a macro for write_line functions
      drm/vkms: Add support for XRGB2101010

 drivers/gpu/drm/vkms/vkms_composer.c  | 17 +++++++
 drivers/gpu/drm/vkms/vkms_drv.h       | 20 ++++----
 drivers/gpu/drm/vkms/vkms_formats.c   | 86 ++++++++++++++++++++++++-----------
 drivers/gpu/drm/vkms/vkms_formats.h   |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  5 +-
 5 files changed, 93 insertions(+), 37 deletions(-)
---
base-commit: 219b45d023ed0902b05c5902a4f31c2c38bcf68c
change-id: 20240222-writeback_line_by_line-8475605b1d5c
prerequisite-message-id: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
prerequisite-patch-id: ae2d8b2efbbaa9decce56632c498c87e708288b3
prerequisite-patch-id: c26b6d4867eaf6566195aa0002765357d4f69f8c
prerequisite-patch-id: 8791d34a6f3148dc518da5249453067e40d346e3
prerequisite-patch-id: 26ec7cd5a449004bcfd6ce483671f87655f8635c
prerequisite-patch-id: 2e855ba871f2e99d4b6b7d85da2ddac6bb32262e
prerequisite-patch-id: 82523a917646793deeec7cdcc7ff286bd924fd21
prerequisite-patch-id: 0e355e5316281f53ab5e97ab6e63b0a682f3eb9e
prerequisite-patch-id: 7a63d245a377d5f5283f48e8f52421b912811752
prerequisite-patch-id: dda6bf4692cd1795c489ff58e72c0841ea8ffbc4
prerequisite-patch-id: f70e535b6086cc587975fbfa75741f485f679a32
prerequisite-patch-id: 6c2aa2645c7d854951608aa4d15a02e076abe1fe
prerequisite-patch-id: dc61c6d3db73053fc36e115af561e0c42b467de2
prerequisite-patch-id: deda292af6d8bbf6762b0bf4d351ffd2225995d8
prerequisite-patch-id: 18554f49b53cbcfd4a8ca50dc83b17dd3cf96474
prerequisite-patch-id: 5633292e10132d29be2467812e6e2e824cfedb67
prerequisite-patch-id: 43f37e9c1bc041d491e41dfb59548ed258a1e071
prerequisite-message-id: <20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com>
prerequisite-patch-id: d10db4cb12a88de2e5f6440e9fcf5ddda191e3cd
prerequisite-patch-id: 16bac0ef1f1dc010a72ce2faae66631797d23d3f
prerequisite-patch-id: 8e0e5cc0727e8fd2d14ebafc5538fd987c2dd38e
prerequisite-patch-id: 32bad3bf3df46d042e9edd4c1259c2e2a3fb8975
prerequisite-patch-id: 4bd9e4cef308abd17b7b274a5575a3de73a1503b
prerequisite-patch-id: a98fac5a2c60fe23fbc6a455e9a4ab8b0f187ee8
prerequisite-patch-id: 62c8d109a22b9978f755255b67f13fe74fb7008d
prerequisite-patch-id: baa8da4871dd90b03a07c6d9ddb45e10929ee70a

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

