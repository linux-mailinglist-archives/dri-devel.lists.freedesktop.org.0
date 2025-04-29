Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E16BAA1087
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 17:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BD910E4D2;
	Tue, 29 Apr 2025 15:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tLiLPQhJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FD710E143
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 15:32:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E65B9615CC;
 Tue, 29 Apr 2025 15:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC1FC4CEEE;
 Tue, 29 Apr 2025 15:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745940715;
 bh=OcjtC1r6unSYOAqmQ+trqxX0jm6Xo2rTov4KFM6JIsY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tLiLPQhJOUd/1thEH5LDj94nbgUtA4pFOTNXvyuLKXlAVFGNAMsl4Gbh876VcUu0P
 xa42ymQ4eavZZ5f5d+17c7VfpSzyICmm40vjL61R3fiog3RnHgygISjyrGh1h93dbu
 auUlDa9K+5kLWAdzGvv8PytuEog/ayRePNIO/lHkEobHH+TNLIZsbLWr1D3UrNA1Hq
 3WMeLqJykmwHApRFXHwnIGtY26IdNoiYbv+USHprKR1ndy0VMgr/2cw0TFf8cdzaeQ
 y1U3GXr+qeCHsVtwehmwn0r62m3fL8J4nJeR/ZU4z6H48ZVF5egWMXNhD21x9ToDGc
 UX6AdJsk+cuJA==
From: Maxime Ripard <mripard@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	Philipp Stanner <phasta@mailbox.org>
Subject: Re: [PATCH] drm/tests: shmem: Fix memleak
Date: Tue, 29 Apr 2025 17:31:49 +0200
Message-ID: <174594070795.925005.16917161299075727119.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408140758.1831333-1-mripard@kernel.org>
References: <20250408140758.1831333-1-mripard@kernel.org>
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

On Tue, 08 Apr 2025 16:07:58 +0200, Maxime Ripard wrote:
> The drm_gem_shmem_test_get_pages_sgt() gets a scatter-gather table using
> the drm_gem_shmem_get_sg_table() function and rightfully calls
> sg_free_table() on it. However, it's also supposed to kfree() the
> returned sg_table, but doesn't.
> 
> This leads to a memory leak, reported by kmemleak. Fix it by adding a
> kunit action to kfree the sgt when the test ends.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
