Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABF1B3BCEE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 15:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1429F10EBC2;
	Fri, 29 Aug 2025 13:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gqkrgTUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC1910EBC2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 13:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y4xY7fsjVfUr1fdojVjacAsbCWoee9zhDzWREhLdPTI=; b=gqkrgTUQJhPdT/InUZlXBARrAf
 jlI7EesYxfYrjTM4yLTF2iPGBnSd4hWbptpCpNIXRkdKkeatDRVk+gmV6HIwlWwZsN0E+SSUHjeiw
 U0Vkn58UbGjOYiIHlGX+TO2XwL+v12nHMPQz391DpK70nSpicVdyDja+I3EimbF61QDQUOR1hQR0s
 OhZ62jXtKTLC562f4yA0350xtHBkTmbSwgkBMTI5B7i7ZH1kyHvJc0SUjZbKgaJWr5tPqYyObCiJz
 aWll67CQy/TJK3XmC9ta1a47WPToUmOJMTKyv40Ya8LOP1taTZQCtaltX7K7NAJk5RZv1AEbMmnBk
 dRo7cLyw==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=morissey.sc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1urzZt-003qyb-QN; Fri, 29 Aug 2025 15:55:42 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: kernel-dev@igalia.com,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/6] drm/v3d: General job locking improvements +
 race-condition fixes
Date: Fri, 29 Aug 2025 10:55:17 -0300
Message-ID: <175647571207.105075.8406952604948379394.b4-ty@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250826-v3d-queue-lock-v3-0-979efc43e490@igalia.com>
References: <20250826-v3d-queue-lock-v3-0-979efc43e490@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Tue, 26 Aug 2025 11:18:57 -0300, Maíra Canal wrote:
> This patch series was initially motivated by a race condition (exposed
> in PATCH 4/6) where we lacked synchronization for `job->file` access.
> This led to use-after-free issues when a file descriptor was closed
> while a job was still running.
> 
> However, beyond fixing this specific race, the series introduces
> broader improvements to active job management and locking. While PATCH
> 1/6, 2/6, and 5/6 are primarily code refactors, PATCH 3/6 brings a
> significant change to the locking scheme. Previously, all queues shared
> the same spinlock, which caused unnecessary contention during high GPU
> usage across different queues. PATCH 3/6 allows queues to operate more
> independently.
> 
> [...]

Applied, thanks!

[1/6] drm/v3d: Store a pointer to `struct v3d_file_priv` inside each job
      commit: e5e3d7bff7645d2577c56ccc8b110b9b6978aa08
[2/6] drm/v3d: Store the active job inside the queue's state
      commit: 0d3768826d38c0ac740f8b45cd13346630535f2b
[3/6] drm/v3d: Replace a global spinlock with a per-queue spinlock
      commit: e9d8e027483267a9505f5b6b7f0476b5299743af
[4/6] drm/v3d: Address race-condition between per-fd GPU stats and fd release
      commit: fa6a20c8747041df406d184321a2a49e82d46298
[5/6] drm/v3d: Synchronous operations can't timeout
      commit: 78fe02d090d38393cc00de9d1929e59426f202a4
[6/6] drm/v3d: Protect per-fd reset counter against fd release
      commit: 7d9bc9bee2778e2da7147aeb3a81427487598493

Best regards,
- Maíra
