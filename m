Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC8BB05A32
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A48810E5B6;
	Tue, 15 Jul 2025 12:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QF8lJOGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CD8892AA;
 Tue, 15 Jul 2025 12:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G5tGG9amdL2b0ifcnhepNyhm4h9SwYWFaCFHBzhKkUo=; b=QF8lJOGMamFp3i34+/XW5O2GDn
 71NiknX0apJ3b+619bcPJXd2PBL6R+06254tF6QlVTJftkaOUrW4vUD7h893zRA+7bBCQlOvxCGcx
 OihUhWlMYgOIKNjWzUITbw2ZxNZ+2dBdmUshHouaClGY7bLUvTeLBaRLkKKiMsCaK9Qy9jR7J1TdZ
 G22u76BSZtn+pdiLUbBD3VBZFgIqKhGNyIEAGz5ebzQk+JSxz0BRsSFj87fHZ4Nug49hXI8Iar+8M
 jNIFqj05xBUYz3euuROmgAnbGnDrRGI7DVRpewUxl+JB3cJJM8HUM+ospZkqODk+qBaPdajyFGg7J
 GLKyCtsg==;
Received: from [187.36.210.68] (helo=morissey)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ubenv-00GpXn-Oc; Tue, 15 Jul 2025 14:30:40 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Qiang Yu <yuq825@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v6 0/8] drm/sched: Allow drivers to skip the reset with
 DRM_GPU_SCHED_STAT_NO_HANG
Date: Tue, 15 Jul 2025 09:30:18 -0300
Message-ID: <175258238784.119068.1577042922667240898.b4-ty@igalia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
References: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
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


On Mon, 14 Jul 2025 19:07:01 -0300, Maíra Canal wrote:
> TL;DR: No changes from v5, I just rebased it on top of drm-misc-next. I
> plan to push the series to the drm-misc tree tomorrow.
> 
> Thanks for all the reviews!
> 

Applied, thanks!

[1/8] drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RESET
      commit: 0a5dc1b67ef5c7e851b57764a2aab8cc4341a7b7
[2/8] drm/sched: Allow drivers to skip the reset and keep on running
      commit: 0b1217bfdfddf664c15954d1d51ee18ed88a2ccf
[3/8] drm/sched: Make timeout KUnit tests faster
      commit: 9b9b5a3605b9a5ef1d412e47b2ae70090c8d3580
[4/8] drm/sched: Add new test for DRM_GPU_SCHED_STAT_NO_HANG
      commit: 1472e7549f84c472a9ebb9a8bb0aaafe985ea608
[5/8] drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      commit: 6b37fbacd087fbd517b6b276ca8bebd1dc052fb7
[6/8] drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      commit: 8902c2b17a6ec723ab7924bc4113bef47603c0dc
[7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      commit: 53dcd0eaa271e870ca5d0b203be67b468214c1bc
[8/8] drm/panfrost: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      commit: 9fb32803dfba63697080db7969bc3aa1bf323dc3

Best regards,
- Maíra
