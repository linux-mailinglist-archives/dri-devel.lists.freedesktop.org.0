Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A50E9506FC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 15:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BD710E35D;
	Tue, 13 Aug 2024 13:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rA5P71Oa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D992210E355;
 Tue, 13 Aug 2024 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A/BsryxCutNldVgj2/gUsJ3wHeDswYAvhJ3FFoZ8Q48=; b=rA5P71Oa187ujo9NPTVaaQsRme
 uTmSmy++LXM/wkc4CJjmwLD5vOPuRiEVF6nFDO7b+wqKnUKCI0cE4QDOimhjEBz2XDqcscXL0pOy6
 bt/qrYTeIxR/E/NVUwjlTsha0aCZqhtBIg7epvAr214c+WX+xQz/qIixfR6a/1uoF7g/iEvtuUR8K
 wBkHbTqSZAofKM8hxJ1vymBcvOq5iqa42Z/3szZy1FqL+wqx8XTfKCmXWDVx1mX6VM3aaFa20IuNx
 hGUZweiB+Bk+BrwQfs3WxqXfAAzPPY8zcH/emJKNJPcX53KvQFCXsGzEji/I2K7Yi+QVywguKWGQy
 LygFfupg==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sds1U-00Bxv2-3G; Tue, 13 Aug 2024 15:57:16 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 0/2] DRM fdinfo legacy drm-memory- clarification and amdgpu
 update
Date: Tue, 13 Aug 2024 14:57:10 +0100
Message-ID: <20240813135712.82611-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Re-sending these two since they garnered little attention last time round.

First patch clarifies what drm-memory- is, and that it is legacy, and second
patch updates amdgpu to start emitting new keys together with the legacy (by
using the common DRM helper).

With that gputop will show the resident usage (not just total) and as bonus I
added active and purgeable.

Tvrtko Ursulin (2):
  Documentation/gpu: Document the situation with unqualified drm-memory-
  drm/amdgpu: Use drm_print_memory_stats helper from fdinfo

 Documentation/gpu/drm-usage-stats.rst      | 25 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 48 +++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 96 +++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 35 +++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     | 20 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h     |  3 +-
 7 files changed, 144 insertions(+), 84 deletions(-)

-- 
2.44.0

