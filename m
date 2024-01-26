Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A933283DF6C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 18:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E87C10E29A;
	Fri, 26 Jan 2024 17:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A6510FC42;
 Fri, 26 Jan 2024 17:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LKjrPQFGdzlUlEj4QHci5QGqfkMaef42zy077cz0Z5c=; b=jM8uZsgsuaSI89pSKCGGB33Hdc
 3AhaXrSC0FFbaCBRDWxvEBaxyZ5pk4ROaek2lPJcESLhTupMAR1TOzVEnMExE3J2+QcSc4OsY7M1h
 MqG8Pj+cgbaJuJorhpzKJnpHgPw/cqYPQqHFXeytv9pZ30uCsojdVKZ00lclsPNYp/s/IAi6z5vbP
 5Qq+vLFv8PRxBCk6T59w4RW8NRM/El2soDzDv/56Y0acdBQoAFs6ezx8tFWagaWGyMSDLDlcILWEQ
 DxbO6RCx33E0WUiV8lg315HlS0tqUiqtaEiXoaldwr2Uu6XOXTYnuprOGpvT/Bl6zz1+xC+WM0CVi
 qIYGlPBA==;
Received: from [197.255.135.238] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rTPA0-00AOH1-M4; Fri, 26 Jan 2024 17:34:32 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, alex.hung@amd.com,
 christian.koenig@amd.com, daniel@ffwll.ch, harry.wentland@amd.com,
 jani.nikula@intel.com, Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com
Subject: [RFC PATCH 0/2] drm/amd/display: switch amdgpu_dm_connector to
Date: Fri, 26 Jan 2024 15:28:52 -0100
Message-ID: <20240126163429.56714-1-mwen@igalia.com>
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I'm debugging a null-pointer dereference when running
igt@kms_connector_force_edid and the way I found to solve the bug is to
stop using raw edid handler in amdgpu_connector_funcs_force and
create_eml_sink in favor of managing resouces via sruct drm_edid helpers
(Patch 1). The proper solution seems to be switch amdgpu_dm_connector
from struct edid to struct drm_edid and avoid the usage of different
approaches in the driver (Patch 2). However, doing it implies a good
amount of work and validation, therefore I decided to send this RFC
first to collect opinions and check if there is any parallel work on
this side. It's a working in progress.

The null-pointer error trigger by the igt@kms_connector_force_edid test
was introduced by:
- e54ed41620f ("drm/amd/display: Remove unwanted drm edid references")

You can check the error trace in the first patch.

This series was tested with kms_hdmi_inject and kms_force_connector. No
null-pointer error, kms_hdmi_inject is successul and kms_force_connector
is sucessful after the second execution - the force-edid subtest
still fails in the first run (I'm still investigating).

There is also a couple of cast warnings to be addressed - I'm looking
for the best replacement. 

I appreciate any feedback and testing.

Melissa

Melissa Wen (2):
  drm/amd/display: fix null-pointer dereference on edid reading
  drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 78 ++++++++++---------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  9 ++-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 23 +++---
 4 files changed, 60 insertions(+), 54 deletions(-)

-- 
2.43.0

