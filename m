Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941409FFF88
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 20:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB00B10E797;
	Thu,  2 Jan 2025 19:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GP7qCKHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C12310E7A4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=otpNX3dzaOOV/Nu73OBu2C7Z3mvZLbDnU2QmjqPikb0=; b=GP7qCKHij21TCUv8DyXVfNePyU
 gvn4g3b9fpzmZtMaI+zrPi4TSxyljMZh12NaFqoDqNLQ+TKyVYJQQ7DQd9l2Yv1sHuDuixnKh8T3f
 4w1FsJSYjQWrNIieEyUyAdGPx/hd9/byRK8ipdzIteeB5VelxQq5yKHlxwCibYEI1/QGZ+7di0iol
 4Enk6LG18HakzWul4zmrm4/3TtvA+0XKAbUGDwe625Nv8HesCrd0H9dJ93t/9mrbzXBKSm3SaxOT+
 OA3RikhBISD4SvQCIvf7Pn9SsHw8LYkqNa61ehmfzQVQJaJY94Y4RpCwf4u8py0hHzKeIIXdWmYXO
 oElqgGMg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tTR7N-00Au7C-BJ; Thu, 02 Jan 2025 20:44:29 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 0/6] A few drm_syncobj optimisations
Date: Thu,  2 Jan 2025 19:44:11 +0000
Message-ID: <20250102194418.70383-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

A small set of drm_syncobj optimisations which should make things a tiny bit
more efficient on the CPU side of things.

/Maybe/ between 1-2% more FPS can be observed with "vkgears -present-mailbox" on
the Steam Deck Plasma desktop but I am reluctant to make a definitive claim. It
would be best if someone could verify or suggest a more heavy workload for
syncobjs.

Less lines of source code and "Every little helps" (tm), right?

Tvrtko Ursulin (6):
  drm/syncobj: Avoid double memset in drm_syncobj_find_fence
  drm/syncobj: Remove unhelpful helper
  drm/syncobj: Do not allocate an array to store zeros
  drm/syncobj: Avoid one temporary allocation in drm_syncobj_array_find
  drm/syncobj: Use put_user in drm_syncobj_query_ioctl
  drm/syncobj: Avoid temporary allocation in
    drm_syncobj_timeline_signal_ioctl

 drivers/gpu/drm/drm_syncobj.c | 238 +++++++++++++++-------------------
 1 file changed, 106 insertions(+), 132 deletions(-)

-- 
2.47.1

