Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC703A1A540
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 14:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29D810E80B;
	Thu, 23 Jan 2025 13:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MzOqUGTq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D4610E0AB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737640454;
 bh=2zVRnMaSJGa8LPDpFqfUhB6l5SHiGscWU+i1noCJMck=;
 h=From:To:Cc:Subject:Date:From;
 b=MzOqUGTqTtOu1XkXVBsK982ZUuFeBOVTHVTcYUGCYrUS2MtFRISD90nSR1mAGDgYv
 YFHetiBL+85BvKZYGmBpszQglAvnNeefDEy8MvQ2AsC1tU4i2d2xWq4FLPE4jZcPnx
 sbaogNwpDwmM+vZg108eOSWVL18btstIuSCEIIgVk9L7QXNK7eTlQ7t8hge1Nj3O6P
 ZU88A7vnQ/8NmA2tlTXsyxtOnJ7U4QJa2YALHJl2LMmif7+aRdfILNP26McoE/u0n7
 aI8l82An7t8D07M+CMZVvHSRgfG7oGCisRdwnzG5RaFlq7Vl7zgHCsg+MOuJiYMe4S
 x24l0uqr4YSpA==
Received: from localhost.localdomain (unknown [171.76.86.251])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8297517E0E48;
 Thu, 23 Jan 2025 14:53:57 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: kernelci@lists.linux.dev
Cc: linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, Tim.Bird@sony.com,
 laurent.pinchart@ideasonboard.com, broonie@kernel.org, leobras.c@gmail.com,
 groeck@google.com, rdunlap@infradead.org, geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi, jarkko@kernel.org
Subject: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
Date: Thu, 23 Jan 2025 19:23:30 +0530
Message-ID: <20250123135342.1468787-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
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

This patch series introduces "kci-gitlab," a GitLab CI pipeline
specifically designed for kernel testing. It provides kernel
developers with an integrated, efficient, and flexible testing
framework using GitLab's CI/CD capabilities. This patch includes
a .gitlab-ci file in the tools/ci/gitlab-ci/ folder, along with
additional YAML and script files, to define a basic test pipeline
triggered by code pushes to a GitLab-CI instance.
The initial version implements:
    
- Static checks: Includes checkpatch and smatch for code validation.
- Build tests: Covers various architectures and configurations.
- Boot tests: Utilizes virtme for basic boot testing.

Additionally, it introduces a flexible "scenarios" mechanism to
support subsystem-specific extensions.

This series also introduces a drm scenario that adds a job to run IGT
tests for vkms. This scenario includes helper scripts to build deqp-runner
and IGT, leveraging approaches from the drm-ci/mesa-ci project.

We are working towards creating a generic, upstream GitLab-CI pipeline
(kci-gitlab) that will replace DRM-CI [1]. The proposed GitLab-CI pipeline
is designed with a distributed infrastructure model, making it possible
to run on any gitLab instance. We plan to leverage KernelCI [2] as the
backend, utilizing its hardware, rootfs, test plans, and KCIDB [3]
integration.

For an example of a fully executed pipeline with drm scenario set,
including documentation generation,
see: https://gitlab.freedesktop.org/vigneshraman/kernel/-/pipelines/1350262

Please refer to the documentation included in the patch, or check the
rendered version, here: 
https://vigneshraman.pages.freedesktop.org/-/kernel/-/jobs/69787927/artifacts/artifacts/Documentation-output/ci/gitlab-ci/gitlab-ci.html

Differences from v1 to v2:
- moved to tools/ci as suggested by Linus on the previous version
- add arm64 containers for native compilation
- added boot tests using virtme: this is the base structure for boot tests,
  next steps would be adding other tests such as kselftests/kunit tests
- added DRM scenario testing on vkms: this should replace current vkms test
  in drm-ci. This work shows how a test scenario can be used by different
  subsystems to add their tests.
- update documentation

For more details on the motivation behind this work, please refer to the
cover letter of v1: https://patchwork.kernel.org/project/linux-kselftest/cover/20240228225527.1052240-1-helen.koike@collabora.com/

[1] https://www.collabora.com/news-and-blog/blog/2024/02/08/drm-ci-a-gitlab-ci-pipeline-for-linux-kernel-testing/
[2] https://kernelci.org/
[3] https://docs.kernelci.org/kcidb/

Helen Koike (3):
  kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
  kci-gitlab: Add documentation
  kci-gitlab: docs: Add images

Vignesh Raman (2):
  MAINTAINERS: Add an entry for ci automated testing
  kci-gitlab: Add drm scenario

 Documentation/ci/gitlab-ci/gitlab-ci.rst      | 471 ++++++++++
 .../ci/gitlab-ci/images/drm-vkms.png          | Bin 0 -> 73810 bytes
 .../ci/gitlab-ci/images/job-matrix.png        | Bin 0 -> 20000 bytes
 .../gitlab-ci/images/new-project-runner.png   | Bin 0 -> 607737 bytes
 .../ci/gitlab-ci/images/pipelines-on-push.png | Bin 0 -> 532143 bytes
 .../ci/gitlab-ci/images/the-pipeline.png      | Bin 0 -> 62464 bytes
 .../ci/gitlab-ci/images/variables.png         | Bin 0 -> 277518 bytes
 Documentation/index.rst                       |   7 +
 MAINTAINERS                                   |  10 +
 tools/ci/gitlab-ci/arm_cross_compile.yml      |   9 +
 tools/ci/gitlab-ci/arm_native_compile.yml     |  20 +
 tools/ci/gitlab-ci/bootstrap-gitlab-runner.sh |  55 ++
 tools/ci/gitlab-ci/build.yml                  |  43 +
 tools/ci/gitlab-ci/cache.yml                  |  24 +
 tools/ci/gitlab-ci/ci-scripts/build-docs.sh   |  35 +
 tools/ci/gitlab-ci/ci-scripts/build-kernel.sh |  43 +
 .../ci/gitlab-ci/ci-scripts/ici-functions.sh  | 106 +++
 .../ci/gitlab-ci/ci-scripts/install-smatch.sh |  13 +
 .../ci-scripts/parse_commit_message.sh        |  27 +
 .../ci/gitlab-ci/ci-scripts/run-checkpatch.sh |  20 +
 tools/ci/gitlab-ci/ci-scripts/run-smatch.sh   |  45 +
 tools/ci/gitlab-ci/ci-scripts/run-virtme.sh   |  52 ++
 tools/ci/gitlab-ci/ci-scripts/test-boot.sh    |  14 +
 tools/ci/gitlab-ci/container.yml              | 114 +++
 tools/ci/gitlab-ci/docker-compose.yaml        |  18 +
 tools/ci/gitlab-ci/gitlab-ci.yml              |  72 ++
 tools/ci/gitlab-ci/scenarios.yml              |  15 +
 .../scenarios/drm/build-deqp-runner.sh        |  42 +
 tools/ci/gitlab-ci/scenarios/drm/build-igt.sh |  80 ++
 .../ci/gitlab-ci/scenarios/drm/build-rust.sh  |  42 +
 .../scenarios/drm/create-cross-file.sh        |  65 ++
 tools/ci/gitlab-ci/scenarios/drm/drm.yml      |  44 +
 .../scenarios/drm/prepare-container.sh        |  18 +
 tools/ci/gitlab-ci/scenarios/drm/run-igt.sh   |  83 ++
 tools/ci/gitlab-ci/scenarios/drm/test.yml     |  32 +
 .../scenarios/drm/xfails/vkms-none-fails.txt  |  22 +
 .../scenarios/drm/xfails/vkms-none-flakes.txt |  90 ++
 .../scenarios/drm/xfails/vkms-none-skips.txt  | 812 ++++++++++++++++++
 .../scenarios/file-systems/file-systems.yml   |  11 +
 tools/ci/gitlab-ci/scenarios/media/media.yml  |  11 +
 .../gitlab-ci/scenarios/network/network.yml   |  11 +
 tools/ci/gitlab-ci/static-checks.yml          |  21 +
 tools/ci/gitlab-ci/test.yml                   |  16 +
 43 files changed, 2613 insertions(+)
 create mode 100644 Documentation/ci/gitlab-ci/gitlab-ci.rst
 create mode 100644 Documentation/ci/gitlab-ci/images/drm-vkms.png
 create mode 100644 Documentation/ci/gitlab-ci/images/job-matrix.png
 create mode 100644 Documentation/ci/gitlab-ci/images/new-project-runner.png
 create mode 100644 Documentation/ci/gitlab-ci/images/pipelines-on-push.png
 create mode 100644 Documentation/ci/gitlab-ci/images/the-pipeline.png
 create mode 100644 Documentation/ci/gitlab-ci/images/variables.png
 create mode 100644 tools/ci/gitlab-ci/arm_cross_compile.yml
 create mode 100644 tools/ci/gitlab-ci/arm_native_compile.yml
 create mode 100755 tools/ci/gitlab-ci/bootstrap-gitlab-runner.sh
 create mode 100644 tools/ci/gitlab-ci/build.yml
 create mode 100644 tools/ci/gitlab-ci/cache.yml
 create mode 100755 tools/ci/gitlab-ci/ci-scripts/build-docs.sh
 create mode 100755 tools/ci/gitlab-ci/ci-scripts/build-kernel.sh
 create mode 100644 tools/ci/gitlab-ci/ci-scripts/ici-functions.sh
 create mode 100755 tools/ci/gitlab-ci/ci-scripts/install-smatch.sh
 create mode 100755 tools/ci/gitlab-ci/ci-scripts/parse_commit_message.sh
 create mode 100755 tools/ci/gitlab-ci/ci-scripts/run-checkpatch.sh
 create mode 100755 tools/ci/gitlab-ci/ci-scripts/run-smatch.sh
 create mode 100755 tools/ci/gitlab-ci/ci-scripts/run-virtme.sh
 create mode 100755 tools/ci/gitlab-ci/ci-scripts/test-boot.sh
 create mode 100644 tools/ci/gitlab-ci/container.yml
 create mode 100644 tools/ci/gitlab-ci/docker-compose.yaml
 create mode 100644 tools/ci/gitlab-ci/gitlab-ci.yml
 create mode 100644 tools/ci/gitlab-ci/scenarios.yml
 create mode 100755 tools/ci/gitlab-ci/scenarios/drm/build-deqp-runner.sh
 create mode 100755 tools/ci/gitlab-ci/scenarios/drm/build-igt.sh
 create mode 100755 tools/ci/gitlab-ci/scenarios/drm/build-rust.sh
 create mode 100755 tools/ci/gitlab-ci/scenarios/drm/create-cross-file.sh
 create mode 100644 tools/ci/gitlab-ci/scenarios/drm/drm.yml
 create mode 100755 tools/ci/gitlab-ci/scenarios/drm/prepare-container.sh
 create mode 100755 tools/ci/gitlab-ci/scenarios/drm/run-igt.sh
 create mode 100644 tools/ci/gitlab-ci/scenarios/drm/test.yml
 create mode 100644 tools/ci/gitlab-ci/scenarios/drm/xfails/vkms-none-fails.txt
 create mode 100644 tools/ci/gitlab-ci/scenarios/drm/xfails/vkms-none-flakes.txt
 create mode 100644 tools/ci/gitlab-ci/scenarios/drm/xfails/vkms-none-skips.txt
 create mode 100644 tools/ci/gitlab-ci/scenarios/file-systems/file-systems.yml
 create mode 100644 tools/ci/gitlab-ci/scenarios/media/media.yml
 create mode 100644 tools/ci/gitlab-ci/scenarios/network/network.yml
 create mode 100644 tools/ci/gitlab-ci/static-checks.yml
 create mode 100644 tools/ci/gitlab-ci/test.yml

-- 
2.43.0

