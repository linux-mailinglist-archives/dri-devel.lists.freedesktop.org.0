Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F257C3B330
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8FC10E8BF;
	Thu,  6 Nov 2025 13:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rqv10nPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC3A10E8BF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8YSjoON0ggDZKFJQfJRIxng4jeAU7bOZiO63prpJPhM=; b=rqv10nPZlCGnn33Gq0E4mVYKSU
 M7OKylbsqMduTdn2ZkZc1tbzrllFfh/aUFLFXuwVvez4mLo8lGQ7mJ8fos9D/6F93d3VuTsIy6kAu
 nGYrPm0+AGmFjs8U2fVXrYe6+nz7AbNfqdK6Tw6uXIqYLQ+3aZp949to0mJrE9RpqmMjx6XJhNlSU
 fMGWTGDvOdhgcoHiJbsMMzNmFNdog/ZMEXArhAlD/yD1qJ8/pm07QV6jtmhdCXVWkUVT4Io2MpUxy
 IIMHzs90gZgyZSYlC1oZlZIeIM0bp1XuOXJnpf8CmZElv5otl00VwiJpFfiQHbns0wGSGwSO+BPRf
 dW+J5sXA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH00l-0030kJ-QV; Thu, 06 Nov 2025 14:26:47 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 0/3] DRM syncobj wait fast path
Date: Thu,  6 Nov 2025 13:26:42 +0000
Message-ID: <20251106132645.28208-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

In practice there are multiple DRM syncobj operations (and/or ioctls) per
rendered frame, and vast majority of them operates on a just a couple of
handles, or timeline points.

This series adds a fast path to avoid the temporary allocations for those cases.

Tvrtko Ursulin (3):
  drm/syncobj: Use vmemdup_array_user in drm_syncobj_array_find
  drm/syncobj: Add a fast path to drm_syncobj_array_wait_timeout
  drm/syncobj: Add a fast path to drm_syncobj_array_find

 drivers/gpu/drm/drm_syncobj.c | 141 +++++++++++++++++++++++++---------
 1 file changed, 106 insertions(+), 35 deletions(-)

-- 
2.48.0

