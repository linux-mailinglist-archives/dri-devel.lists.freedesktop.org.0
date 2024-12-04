Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC59E4648
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 22:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D5010E2B7;
	Wed,  4 Dec 2024 21:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="M99RHwx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7040C10E2B7;
 Wed,  4 Dec 2024 21:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TmKSPLH+acaMQiDkwQYewqhV5UaU00fvXp8PhyzYddI=; b=M99RHwx9iM0W//yU5zqHr97nkH
 mmnyO4nplNfxpYg3KQnQ01tGCREYzbxYTI7a45DZhg32+PIHcb+L6LIZ281pY9szr3WHoorxaxHiM
 0iVNdpjuYM+QThJPJ2ccCvR/jiFhUgNx1ERs2ncsFQ/0XdYpP9nPz2kP5agcsFHsWwpFp3594dA2g
 XC6dS1MRmXbIBA97dAEtvKawmJZjWxuo/2XVDB3Ro2bgfsz12fn/UvnokOSWIVH8hwz3HWuYwtNCK
 0/YpK12IUN6Rwh7d4du538/b4AoDFn5e6YPn7c8CGuiY2Z+Bu6VkMXyxW3bq9lSRqPfl4QBi0NSZJ
 8K0+t9oQ==;
Received: from [179.214.71.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tIwcs-00Ghe4-4T; Wed, 04 Dec 2024 22:09:38 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, pekka.paalanen@collabora.com,
 Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 zaeem.mohamed@amd.com
Cc: mario.limonciello@amd.com, timur.kristof@gmail.com, victoria@system76.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [RFC PATCH 0/2] drm/amd/display: address page fault caused by max
 surface mismatch
Date: Wed,  4 Dec 2024 17:43:58 -0300
Message-ID: <20241204210929.1994522-1-mwen@igalia.com>
X-Mailer: git-send-email 2.45.2
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

[Resending due to temporary mailing list server error on
gabe.freedesktop.org - trying again to reach dri-devel and amd-gfx] 

Hi,

This is another attempt to approach page fault error faced by Cosmic
users of AMD display hw that exposes two overlay planes. It was first
reported as an interface freeze caused by array-index-out-of-bounds,
where the number of active planes was greater than the maximum number of
surfaces reported. This number of active planes started to be greater
with the introduction of cursor overlay mode, so a situation in which
one primary, two overlays and one cursor overlay == 4 became possible.

After further investigation, I noticed there was a definition mismatch
around the number of surfaces supported by the hw, and two different
values (MAX_SURFACES and MAX_SURFACE_NUM) would be taken through the
DC surface updates flow. Also, the main cause of the interface
freeze seems to be a page fault error, where the regular flow take
MAX_SURFACES == 3 into account and commit_minimal_transition_state
uses MAX_SURFACE_NUM == 6.

AFAIU, four is the maximum number of surfaces supported by the hw and
this amount accomodates current needs, that's why this proposal is
aligned with this number. However, this may not be the right value again
according to a commit in the driver branch that states that 6 is "the
max surfaces supported asics can have" [1]. Misleading change?

Previous discussions can be found at:
- https://lore.kernel.org/amd-gfx/20241114143741.627128-1-zaeem.mohamed@amd.com/
- https://lore.kernel.org/amd-gfx/20241025193727.765195-2-zaeem.mohamed@amd.com/
- https://lore.kernel.org/amd-gfx/20240925154324.348774-1-mwen@igalia.com/

Reported issues (and more discussions) related to this series are at AMD
issue tracker:
- https://gitlab.freedesktop.org/drm/amd/-/issues/3693
- https://gitlab.freedesktop.org/drm/amd/-/issues/3594

Please let me know your thoughts.

Melissa

[1] https://gitlab.freedesktop.org/agd5f/linux/-/commit/3cfd03b79425c 

Melissa Wen (2):
  drm/amd/display: fix page fault due to max surface definition mismatch
  drm/amd/display: increase MAX_SURFACES to the value supported by hw

 drivers/gpu/drm/amd/display/dc/core/dc.c                | 2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c          | 8 ++++----
 drivers/gpu/drm/amd/display/dc/dc.h                     | 4 ++--
 drivers/gpu/drm/amd/display/dc/dc_stream.h              | 2 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h               | 1 -
 drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c | 2 +-
 6 files changed, 9 insertions(+), 10 deletions(-)

-- 
2.45.2

