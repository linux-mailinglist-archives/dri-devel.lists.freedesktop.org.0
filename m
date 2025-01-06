Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0411A02382
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 11:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B9010E624;
	Mon,  6 Jan 2025 10:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WSmZx8+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC2E10E625
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 10:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TzXM/HO6AZvs8QX7Cwrel+atQeZrpNJNCGpMvVyiGiQ=; b=WSmZx8+4vVuQh6yqfoSEO9ck52
 gNuyKL8qjtIBe5I6UzgF6FzU1CC0HAPBcbutBTpsi+hepLQiX9rDPHSJEzUtZ6O+C5zfc7GZht8ZO
 cvsN6Ws4kai1oUpmDPO73entFovDEt1QRewqIFP1+34sd5UHC117dSk6z8Nn92wfsW9mNi3VzG/Bu
 6sZaBoG7PiDIk9ASziIsxR+EJoF1mrSXZ+Z90ZboJpZ5DHoEYZGQbLDGbTKv2tbXMf52tg06tCefm
 zg8vh8k1o0SdacB5N0noDyIa6n+YbUCS1fouqn+G4N7csYyOzllQyUu5CQG9r2Teo0/gZfL6WlAAi
 /3dUhCjQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tUklX-00CERw-Mk; Mon, 06 Jan 2025 11:55:23 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 0/7] A few drm_syncobj optimisations
Date: Mon,  6 Jan 2025 10:55:14 +0000
Message-ID: <20250106105521.53149-1-tursulin@igalia.com>
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

Improvement seems to be around 1.5%* more FPS if observed with "vkgears
-present-mailbox" on a Steam Deck Plasma desktop, but I am reluctant to make a
definitive claim on the numbers since there is some run to run variance. It
would be best if someone could verify or suggest a more heavy workload for
syncobjs.

*)
Before average fps after 200s: 22102
After: 22426

Tvrtko Ursulin (7):
  drm/syncobj: Remove unhelpful helper
  drm/syncobj: Do not allocate an array to store zeros when waiting
  drm/syncobj: Avoid one temporary allocation in drm_syncobj_array_find
  drm/syncobj: Use put_user in drm_syncobj_query_ioctl
  drm/syncobj: Avoid temporary allocation in
    drm_syncobj_timeline_signal_ioctl
  drm/syncobj: Add a fast path to drm_syncobj_array_wait_timeout
  drm/syncobj: Add a fast path to drm_syncobj_array_find

 drivers/gpu/drm/drm_syncobj.c | 281 ++++++++++++++++++----------------
 1 file changed, 147 insertions(+), 134 deletions(-)

-- 
2.47.1

