Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A01E7AB6E7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4A210E05E;
	Fri, 22 Sep 2023 17:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7107210E05E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 17:12:57 +0000 (UTC)
Received: from ginger.. (unknown [177.98.21.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5633D6607262;
 Fri, 22 Sep 2023 18:12:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695402776;
 bh=AxQ28p5S5GmVSbnU0jiwXnKK+GT+jESsGF+xjPThjDw=;
 h=From:To:Cc:Subject:Date:From;
 b=H8ILSP/y7VBgP8A2WJoBG5c/iMSrK00F/VQB5B/SdG8wqMUDn0A6ycuioUUdS8c0T
 lAxK2Dh0kGkhfhuH8EzZnfCGg+5NJAHd82FueP3gcwwyBgprXxoyC8lLBn8xiqUkFy
 FbJcFCteQDesVuTh/Pvv+jPXHLxmQrwntjmUs3TAs0h6bD6TirZNzhUdvpnMnDTVg4
 b6cMaJ8fsKjFL4ZL/cWG4o561udLHacc9K5o6/nJAzV/QeauehSnmo6YPdBMdVHuRl
 z2HE7dLji55P8TxQen6aby8ECSjcx+dXw9FU/1nzxPwH82VYM24YUZGuYe5DqJLwx8
 1xbvsQm+9jIxw==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/ci: Update Mesa and Introduce VKMS Support
Date: Fri, 22 Sep 2023 14:12:35 -0300
Message-Id: <20230922171237.550762-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
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
Cc: mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 michel.daenzer@mailbox.org, vignesh.raman@collabora.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset offers two enhancements to drm/ci:

1. Mesa Version Update. drm/ci re-uses components from Mesa project.
A recent bug in MesaCI was fixed. The first patch updates drm/ci
Mesa's version, re-allowing containers rebuilds when uncached,
essencial for new runs.

2. VKMS Driver Testing, together with the -skips.txt and -fails.txt
list that were found during the tests.

See pipeline https://gitlab.freedesktop.org/helen.fornazier/linux/-/pipelines/992263
(there is a vgem job on top but it shouldn't affect the result)


v2:
- mesauprev: point to upstream mesa/mesa (solved the TODO and removed RFC tag)
- vkms jov: do not mv modules to /lib/modules in the job definition, leave it to
  crosvm-runner.sh

Helen Koike (2):
  drm/ci: uprev mesa version - fix container build
  drm/ci: add tests on vkms

 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/ci/build.sh                   |  1 -
 drivers/gpu/drm/ci/gitlab-ci.yml              | 16 +++++++++-
 drivers/gpu/drm/ci/igt_runner.sh              |  6 ++--
 drivers/gpu/drm/ci/image-tags.yml             |  2 +-
 drivers/gpu/drm/ci/lava-submit.sh             |  2 +-
 drivers/gpu/drm/ci/test.yml                   | 23 ++++++++++++++-
 drivers/gpu/drm/ci/x86_64.config              |  1 +
 .../drm/ci/xfails/virtio_gpu-none-flakes.txt  |  0
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 29 +++++++++++++++++++
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 10 +++++++
 11 files changed, 83 insertions(+), 8 deletions(-)
 delete mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt

-- 
2.34.1

