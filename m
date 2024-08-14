Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E08795175A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 11:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B36210E43F;
	Wed, 14 Aug 2024 09:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZbdM4Lfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E1310E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 09:08:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26B48E0003;
 Wed, 14 Aug 2024 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723626538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VkLZLhKQXpVHMvRnPIvLXvvF5eoBWM6KQDlYAfk1Vb4=;
 b=ZbdM4Lfs69l0Lxqvoi6WE/fK6UeqJSvEbbkIqKtoPceYPUIs4UtugUvYJYilVVuwBVk8/W
 +o6VNNPJhyMqZJGsnRdjRMXXmFmjLlS5+9DVpUJ3gzeqPw7fyQZ/xG8BqVAWwGgU9W08Vh
 7waaFw4ufLwG7ECNGEKGsdtG6qhUButznz6fS3KwUvVpUYEXRzDI3kPu4qtvUHmB40nhNc
 4JHqW7NjPu0jc81fAcu0HiAyAaTPYzgoRB/7d834L9Nz6sy7NMGvDpCX7v0WbYQTTffBa4
 sbJ9ui18yWD3xsCnok5WfB1aI29dp6T9KgBmNKmvQT6DR0fu9S0ZWYbfigzpKA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH RFC 0/6] drm/vkms: Completly split headers
Date: Wed, 14 Aug 2024 11:08:53 +0200
Message-Id: <20240814-google-split-headers-v1-0-51712f088f5d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACZ0vGYC/42RTW7DIBCFr2Kx7rSAibGjqqpUqQfotooijMcOq
 m1SIE6iKHfvxEkXXVTKapi/7z3gxCIGh5EtsxMLOLno/EiJeMiY3ZixQ3AN5UxyqfhCCui873q
 EuO1dgg2aBkMEZXJNXVm2uWS0ug3YusOM/WQf729sdS0G/N6RRLp1ahMRrB8Gl5ZZEwYYXLRPv
 wcY8ZAutAFjNLOTZfY8Gyl5BcfdBJPgwEEYbXWhRFG0+rX2PvVufCTsyz/LQkGtiL4n7d4HaH0
 YTIowSYKVda6qyrZYcbwTtg90o9rYrzXN4ro+zvGKy4uFElYLvSiqO3G3F7a9Ca511iT6EjInL
 jREXTS64VaWf2mr8/kH2UBpOswBAAA=
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
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4122;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FWiLB98hRf4UANd5kQyvNhUOiS5PS8g7fDNs89+0wcU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvHQnkE5NYr0CZINOzrh3ebNpD+MIqA1v56phf
 Sf3dkDYAAKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrx0JwAKCRAgrS7GWxAs
 4pNNEACtGS52ioaQpOarXUNWlSuzVE4BT0wzKLHNIqCCRK34/rCnHlJpk+wsfdDQG/ym0UJOdBh
 lwdeUhX5s0hQBwOG/vtirt7Ojg7IKVBX7ggq1GE0y6jcPBPmbx/sknaN7G7CsP56WSESFFyvPl/
 R3E/REoxfgt2jwHkrOh9KgWyEGu31Zinh+pq8ZYcOQIjjyilM0+ZOt9p1CP2q2O/+gViAq1Hac0
 bYzJG21NiPI/o8fcZEOuhSUd5/GhOYwijK60JddfKIYj7oIzqM9PmQuxbpwGTQnSWRYTov8o+sC
 Vk+rSDxdVV7DCMrWoC33Jxkn5zqlWA/M68QtWrG1cvtcimJlARw9hcn0YWhEhLVLZOvF2PE3Phh
 DLFqXUTvyuqzvVo1rH9WbYnLAUAyEC1QPwuB5F147Pe5ylQvh9hJXagU9OjMqUZ6Pobr9nG4Pvv
 8C3r23yHB8+XYx02cLL7XuNAkDOVgHNymcEYZS7E77C0gvUPKlGU+vJiH8TO4OqoHhSfLiZP9HQ
 U69VXoxBncBClVgIArr1HT4OJa6htyusMzACW0TuiljB78civ8V/F3Ip3cxTx2YeBp9YGXyDnMR
 PjIfxQNqdk9CyDSEwXIehlWmFbBnrodlxDxk4J4RPo2Km+mrEGFlKKpjnHS/JAVYR/pboIRbTd2
 cCPXa58R26HZjqg==
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

VKMS code is already splitted in many files. In order to avoid mixing 
code, this series aims to properly add a header for each .c.

It will help for the readability as each function defined in a .c will be 
declared in its own .h, and not mixed with other in a big vkms_drv.h. This 
will help a lot for the managment of multiple devices and the introduction 
of ConfigFS.

This series depends on [1].

[1]: https://lore.kernel.org/all/20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (6):
      drm/vkms: Properly extract vkms_formats header
      drm/vkms: Extract vkms_writeback header
      drm/vkms: Extract vkms_plane header
      drm/vkms: Rename to_vkms_plane_state to avoid confusion
      drm/vkms: Extract vkms_crtc header
      drm/vkms: Extract vkms_composer header

 drivers/gpu/drm/vkms/vkms_composer.c  |   5 +-
 drivers/gpu/drm/vkms/vkms_composer.h  |  18 ++++
 drivers/gpu/drm/vkms/vkms_crtc.c      |   7 +-
 drivers/gpu/drm/vkms/vkms_crtc.h      |  87 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c       |   1 +
 drivers/gpu/drm/vkms/vkms_drv.h       | 192 ----------------------------------
 drivers/gpu/drm/vkms/vkms_formats.c   |   4 +
 drivers/gpu/drm/vkms/vkms_formats.h   |  80 +++++++++++++-
 drivers/gpu/drm/vkms/vkms_output.c    |   5 +-
 drivers/gpu/drm/vkms/vkms_plane.c     |   7 +-
 drivers/gpu/drm/vkms/vkms_plane.h     |  64 ++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |   5 +-
 drivers/gpu/drm/vkms/vkms_writeback.h |  21 ++++
 13 files changed, 296 insertions(+), 200 deletions(-)
---
base-commit: 219b45d023ed0902b05c5902a4f31c2c38bcf68c
change-id: 20240521-google-split-headers-4a3705228f32
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
prerequisite-message-id: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
prerequisite-patch-id: df699289213021fa202fcdf1b4bdff513d09caa2
prerequisite-patch-id: 59d021ccb166fbe2962de9cda72aceb3caa9cabe
prerequisite-patch-id: 895ace6d58b3776798791705b7b05e26b8d37c7b
prerequisite-message-id: <20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com>
prerequisite-patch-id: a4408d1de7730262456bdd618d3cb86f5f5b01ba
prerequisite-patch-id: f215b5aee5644d2e5b1b2af0bb0f4f1e7609558b
prerequisite-patch-id: d4f3b4c714324c5f326af3daba394899e6663d75

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

