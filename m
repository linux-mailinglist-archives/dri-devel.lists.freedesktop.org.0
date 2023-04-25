Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EAF6EDC97
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 09:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D8310E6A6;
	Tue, 25 Apr 2023 07:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F328F10E6A6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 07:30:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [109.100.38.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C17A46602121;
 Tue, 25 Apr 2023 08:30:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682407817;
 bh=Ax75EHHqCVT7Us2bohT3Vsb3ZzO+h/nhDQABV/0A01s=;
 h=From:To:Cc:Subject:Date:From;
 b=jKII3ma6rInVMP6DRGz8r6t+wBACVig25JU5wUna7zvBEZIQPrX36yFEqvsKPO5Cq
 EOM/JZVCYeAdIv8BW9rQnkvlyMN1os6a3VuLbbJipjwg8MB6jNehqeDd8xfLvHLxyK
 sQru2TS31nejFLCVEEHpmZemsTf24XC++iCIzfQ4mOarYJJDKR1oxFkGQzO32tSBFo
 XDNtNoeqIy2UfKpDfi7q+17j85RV3AwR2fJv2c+tAO9oLcSQprzx32MXKABJypF0KO
 R1YxPHNqQZFoUOmueA1IdivXVN0K2PUvw5ZNtfDv787XMmzB1JDffyc2H/WP21/ul6
 YC+wXovNfc8Rw==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/vkms: Add support for multiple pipes
Date: Tue, 25 Apr 2023 10:30:09 +0300
Message-Id: <20230425073012.11036-1-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: mwen@igalia.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 mcanal@igalia.com, melissa.srw@gmail.com, marius.vlad@collabora.com,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With multiple pipe available we can perform management of outputs at
a more granular level, such that we're able to turn off or on several
outputs at a time, or combinations that arise from doing that. 

The Weston project use VKMS when running its test suite in CI, and we
have now uses cases which would need to ability to set-up the outputs
DPMS/state individually, rather than globally -- which would affect all
outputs. This an attempt on fixing that by giving the possibility to
create more than one pipe, and thus allowing to run tests that could
exercise code paths in the compositor related to management of outputs.

v3:
  - Apply the series against drm-misc-next (Maíra Canal)
  - Add a lower range check to avoid passing negative values to
  max_pipes (Maíra Canal)

v2:
  - Replace 'outputs' with 'pipes' as to use the proper terminology 
    (Thomas Zimmermann, Maíra Canal)
  - Fixed passing wrong possible_crtc bitmask when initializing the
    write back connector which address kms_writeback failure (Maíra Canal)
  - Add a feat. note about moving overlay planes between CRTCs (Melissa Wen)

Marius Vlad (3):
  vkms: Pass the correct bitmask for possible crtcs
  vkms: Add support for multiple pipes
  Documentation/gpu/vkms.rst: Added a note about plane migration

 Documentation/gpu/vkms.rst            |  5 +++--
 drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
 drivers/gpu/drm/vkms/vkms_drv.c       | 31 +++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++++---
 drivers/gpu/drm/vkms/vkms_output.c    |  7 +++---
 drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++++-----------
 6 files changed, 53 insertions(+), 29 deletions(-)

-- 
2.39.2

