Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754A558199D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 20:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E94978DC;
	Tue, 26 Jul 2022 18:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA48975C5;
 Tue, 26 Jul 2022 18:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fufhIgAGmEPr2y0gVTawBxYZsHer/zgSvMgFNkAzwAo=; b=Ioq29zwDPkae9RKQm0zTORcfp3
 0ZEsHxkp5sJawQ//sCkaOmzL/5+u5dk1o35WMjEIiVqHVuuoglglzRbxHNv/J4L3LCuyQLhey1iR8
 +GA1c+gocBUbrQxuvz4GUL16kLMFX+HnyqVD4+IuumUycVIetU2WlcV1vjV/fJqjIXuFuMLvlDyG1
 unw87/ucyfzu2PZ/qvaxx/4tM4ximU0qD1V8kfpjtawZVArwvHMBOdaP9aQvDFi1uu1bxavQ8z2S4
 L5bmsB30EkLGB+HKJ1+pjwl2eZ+0wvwmYrNrsYbwGjkYPjJLDAuZ0bV9kJYnfaX/FzeOXhcAjrIub
 7xyqEQuA==;
Received: from 201-13-50-220.dsl.telesp.net.br ([201.13.50.220]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oGPCZ-007aEh-BE; Tue, 26 Jul 2022 20:22:39 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 'Pan Xinhui' <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tom St Denis <tom.stdenis@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v2 0/4] drm/amd: Add more GFXOFF stats for vangogh
Date: Tue, 26 Jul 2022 15:21:48 -0300
Message-Id: <20220726182152.123649-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.37.1
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds new logging features for GFXOFF available for vangogh
and documentation for it.

I've created a small userspace program to interact with this new debugfs
interface and it can be found at: 

https://gitlab.freedesktop.org/andrealmeid/gfxoff_tool

Changelog:
 v2:
 - Make entrycount uint64_t
 - Add a note in docs about data types and overflow

André Almeida (4):
  drm/amd: Add detailed GFXOFF stats to debugfs
  drm/amd/pm: Implement GFXOFF's entry count and residency for vangogh
  Documentation/gpu: Document GFXOFF's count and residency
  drm/amdgpu: Document gfx_off members of struct amdgpu_gfx

 Documentation/gpu/amdgpu/thermal.rst          |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 168 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |  39 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h       |  14 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c           |  45 +++++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |   3 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |  35 +++-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  22 +++
 .../pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h    |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |   5 +-
 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  |  92 ++++++++++
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
 13 files changed, 443 insertions(+), 8 deletions(-)

-- 
2.37.1

