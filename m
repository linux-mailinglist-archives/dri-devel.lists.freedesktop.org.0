Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BE9832EA7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 19:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C75510E1D5;
	Fri, 19 Jan 2024 18:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD5510E19C;
 Fri, 19 Jan 2024 18:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=snS3sepdCs4f30m6IiSQJtRwuG+MKNNfpUzB7tS2E6E=; b=Rn4mlrLKo/ZYehkmOop33PLDPN
 UhTix9wtq+KOdPY1ltIEEzTRN2i445FkNqJPbe65lzVHlkVGXy6yw4F0/hvfuJ1ystQ20uGwNJmw3
 iOQDBpmvBIdEpz8zjLdnXEjxY1JbZNJCxvJwBEwDNA5J2iV0WzV9/AB5OrvJb5p5w4zdjxL1GM2ck
 ZTl//TlPnWoKFvaRyU4gVNhK/6Cvvqdb4srxuaJTfU6Ll62vr34UItsdYpXiRwgf5F0UvvCKs+1/4
 oLkLiuQliar5aRo015hSSNukTtY/q+BJAcHe29J2kbzUgGRwar2/dp2uXBLg3WSraSSlcxBEPPyLp
 9OkZLP8A==;
Received: from [177.45.63.147] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rQtMD-00873a-BS; Fri, 19 Jan 2024 19:12:45 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/atomic: Allow drivers to write their own plane
 check for async
Date: Fri, 19 Jan 2024 15:12:33 -0300
Message-ID: <20240119181235.255060-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.43.0
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>, daniel@ffwll.ch,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Joshua Ashton <joshua@froggi.es>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

AMD hardware can do more on the async flip path than just the primary plane, so
to lift up the current restrictions, this patchset allows drivers to write their
own check for planes for async flips.

For now this patchset only allow for async commits with IN_FENCE_ID and
FB_DAMAGE_CLIPS. Userspace can query if a driver supports this with TEST_ONLY
commits.

I will left overlay planes for a next iteration.

Changes from v1:
 - Drop overlay planes option for now
v1: https://lore.kernel.org/dri-devel/20240116045159.1015510-1-andrealmeid@igalia.com/

	André

André Almeida (2):
  drm/atomic: Allow drivers to write their own plane check for async
    flips
  drm/amdgpu: Implement check_async_props for planes

 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 29 +++++++++
 drivers/gpu/drm/drm_atomic_uapi.c             | 62 ++++++++++++++-----
 include/drm/drm_atomic_uapi.h                 | 12 ++++
 include/drm/drm_plane.h                       |  5 ++
 4 files changed, 91 insertions(+), 17 deletions(-)

-- 
2.43.0

