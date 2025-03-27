Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1C9A7363D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 17:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7991F10E91E;
	Thu, 27 Mar 2025 16:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="M/KY0KHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93C710E914
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743091295;
 bh=CJMXttHZW24GLFDyoCbAWCoq1dZEZGyrIQbFWrK58xE=;
 h=From:To:Cc:Subject:Date:From;
 b=M/KY0KHUFmVKK4tmSBN2loVG7JNRJ3k/k7w0hsaXP7SnT7JlETGy/HDysgq+Yut5i
 TcR4JmxZvq81fVP7ZfGbGLv5ay4pRq/SUo3ahAALvEi1OThQCPFbPOaOjyha9vWm99
 gvSywvMBxK8h5uS51ieXU2UTAGmCFsuKo5l2ZUMpYY2wP9F/MkbFFSs9oy75mUwPLq
 LF37eWprcf6KgpuDLNxw4rso0XDhC6PeFpy2i4UJrVFNvi8GjLPk7qSQ9dxNbmOCPO
 nxG4RVxsqQtsgytixUMzRpWm0WSGFEcD8yfh1WxMs3TkzKoHmB3wV12Ap6BgFKpBWS
 NQAMg+YY2I7uw==
Received: from debian.. (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 800C017E091E;
 Thu, 27 Mar 2025 17:01:32 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] drm/ci: Add devicetree validation and KUnit tests
Date: Thu, 27 Mar 2025 21:31:09 +0530
Message-ID: <20250327160117.945165-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add jobs to validate devicetrees and run KUnit tests.

Pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1390797

Vignesh Raman (3):
  drm/ci: force use of BFD linker
  drm/ci: Add jobs to validate devicetrees
  drm/ci: Add jobs to run KUnit tests

 drivers/gpu/drm/ci/build.sh                | 14 ++------
 drivers/gpu/drm/ci/check-devicetrees.yml   | 38 ++++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh     | 18 ++++++++++
 drivers/gpu/drm/ci/dtbs-check.sh           | 41 ++++++++++++++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml           |  2 ++
 drivers/gpu/drm/ci/kunit.sh                | 34 ++++++++++++++++++
 drivers/gpu/drm/ci/kunit.yml               | 19 ++++++++++
 drivers/gpu/drm/ci/override-ld-with-bfd.sh | 16 +++++++++
 8 files changed, 170 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml
 create mode 100755 drivers/gpu/drm/ci/override-ld-with-bfd.sh

-- 
2.47.2

