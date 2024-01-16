Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481E182E89D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 05:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D5A10E3D7;
	Tue, 16 Jan 2024 04:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D55610E087;
 Tue, 16 Jan 2024 04:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lClxhiG7kPciwzOgT7N9lpSqHzzXmh68CO/DdbLniM4=; b=WCWJvECMzP18zlfiqAgmLtYK9B
 7FoSNN0Rx8W4NA4lp7OfrC+VCLJ6jNC7axeCVcvVI1qyTym5ARO2W/mYSCyEWBtctnhwpQ5h2lGqe
 9cwx0Tr1wfwEp18q6n97bdVDNcrDdbTTOkyYQK88Fi1QKCMPNixb4lm8rdU6S/GoNhoy3KZcWheZQ
 YgD6jiSygxm2HKWkR+ReauFXYb5d9yPiVSGTo1lsbDRB0Il3LngupnHkt84qozAN31stOezZsjP7V
 oVRJBdKAmb8NySiMftR+adkjM1ZKOu7MDpM7TbsH6nH798+luyXOrn6esqueBgtdPDMmF3Ojh0Ns0
 mW7wAUwQ==;
Received: from [177.45.63.147] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rPbQn-006r0R-Be; Tue, 16 Jan 2024 05:52:09 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/atomic: Allow drivers to write their own plane check
 for async 
Date: Tue, 16 Jan 2024 01:51:57 -0300
Message-ID: <20240116045159.1015510-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
IME-Version: 1.0
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>, daniel@ffwll.ch,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Daniel Stone <daniel@fooishbar.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

AMD hardware can do more on the async flip path than just the primary plane, so
to lift up the current restrictions, this patchset allows drivers to write their
own check for planes for async flips.

I'm not sure if adding something new to drm_plane_funcs is the right way to do,
because if we want to expand the other object types (crtc, connector) we would
need to add their own drm_XXX_funcs, so feedbacks are welcome!

	André

André Almeida (2):
  drm/atomic: Allow drivers to write their own plane check for async
    flips
  drm/amdgpu: Implement check_async_props for planes

 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 30 +++++++++
 drivers/gpu/drm/drm_atomic_uapi.c             | 62 ++++++++++++++-----
 include/drm/drm_atomic_uapi.h                 | 12 ++++
 include/drm/drm_plane.h                       |  5 ++
 4 files changed, 92 insertions(+), 17 deletions(-)

-- 
2.43.0

