Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C5C8766BF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 15:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2CE1138DF;
	Fri,  8 Mar 2024 14:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="H5AgBLhs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44EA1138DE;
 Fri,  8 Mar 2024 14:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kyFdaFZn5fxDlyBsRXk/mw238QRIyiO/3fj7J8kHjNw=; b=H5AgBLhsvkRfuIv80r18F6uxFH
 3mzommNNDYBDIa5KLMtTPW6A5YvjaC8R4DrshbDWekHaNBgehR+Ma49Vfw9MsFghc2n53IhMhwK04
 f1PEIbryunTIUbqr10vnICOY7r1+IjQHdqxW+jf1lI8r4MXgIZRwZeVF3dmGn6/z80cDXgmbFl7z2
 SrcRx33EVFIpCritGKEkOJQDPr7vHoQg8/O4nF0B8oMvJiR6KGsq3I4vRigdse5hlwJvYGNDjiWST
 0BPx6FGB/Imrbi4MW08qlT4ovr2DNTnYPeqMj52laQEBWBOdLndkwjh0PDDM0CE8OmomLdSUfPyZ/
 /eU+yLpQ==;
Received: from [152.249.135.210] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ribdg-007p93-HA; Fri, 08 Mar 2024 15:56:01 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [RESEND PATCH v4 0/3] drm/atomic: Allow drivers to write their own
 plane check for async
Date: Fri,  8 Mar 2024 11:55:50 -0300
Message-ID: <20240308145553.194165-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.44.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

AMD hardware can do async flips with overlay planes, so this patchset does a
small redesign to allow drivers to choose per plane type if they can or cannot
do async flips.

It also allows async commits with IN_FENCE_ID in any driver.

Changes from v3:
- Major patchset redesign 
v3: https://lore.kernel.org/lkml/20240128212515.630345-1-andrealmeid@igalia.com/

Changes from v2:
 - Allow IN_FENCE_ID for any driver
 - Allow overlay planes again
v2: https://lore.kernel.org/lkml/20240119181235.255060-1-andrealmeid@igalia.com/

Changes from v1:
 - Drop overlay planes option for now
v1: https://lore.kernel.org/dri-devel/20240116045159.1015510-1-andrealmeid@igalia.com/

André Almeida (3):
  drm/atomic: Allow userspace to use explicit sync with atomic async
    flips
  drm: Allow drivers to choose plane types to async flip
  drm/amdgpu: Make it possible to async flip overlay planes

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 1 +
 drivers/gpu/drm/drm_atomic_uapi.c                       | 8 +++++---
 drivers/gpu/drm/drm_plane.c                             | 3 +++
 include/drm/drm_plane.h                                 | 5 +++++
 4 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.43.0

