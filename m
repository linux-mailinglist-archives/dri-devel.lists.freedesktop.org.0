Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87CC94ADB6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 18:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E27110E173;
	Wed,  7 Aug 2024 16:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="SJ0dq38k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3409410E181
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 16:09:51 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723046987; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SjcJDubq4V/yt5MaTZ7WRlyyozNJDzTYiwS1tD6Ax2dL987Ayq5nLFJwUoOLsbayrFuqsbzhJe8ujBPjRLL3XZiNiHo5nzLmJXjC6Kp+SA5qUp4udx+GXQhu/5jMp8APumXO+lXfPMWKgfFmpRdJN4LYdtUiIsXY419kistenqo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723046987;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yIsDSZDx97jmN9PU77YfYDi3e/PQPn6A1nrKDz9ozT0=; 
 b=i/wJlMU9wlKxmhUXEFajERgt8XXWgOtVC/3IJyeTvRdkGmVs1BrT4684ylUf0JU4fzuUWKoSk8rsCv2UoZOruSlPI/EZl4UT9d2YO6qocYZ4QDrV+AIRs7iKsVlSlSYd2S8928HTLmK63A/2EMxIB0blaWma1WjIXn1nx1q0cw0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723046987; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=yIsDSZDx97jmN9PU77YfYDi3e/PQPn6A1nrKDz9ozT0=;
 b=SJ0dq38kExxZjaeLXUVxhQLlxKvAK1hvUl6GSk+wbDFId2pDTCHg+kk92tuXrPNc
 Ys8MtFV+bgaQ5tlOqnfn4MHM0m7pxL34gztbA6VeGDEfmDruqnL3T1X31cdPLjTgaNC
 L9TTAEmDzrH5MGb9HVZu7uN9G0I04Jaih+FQ70Xg=
Received: by mx.zohomail.com with SMTPS id 1723046986917194.02206961208128;
 Wed, 7 Aug 2024 09:09:46 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>
Subject: [PATCH 0/3] drm/panfrost: Wire cycle counters and timestamp info to
 userspace
Date: Wed,  7 Aug 2024 18:08:56 +0200
Message-ID: <20240807160900.149154-1-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Mali has hardware cycle counters and GPU timestamps available for
profiling.

This patch series adds support for cycle counters propagation and
also new timestamp info parameters.

Those new changes to the uAPI will be used in Mesa to implement
timestamp queries for OpenGL and Vulkan.

Mary Guillemard (3):
  drm/panfrost: Add SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY
    parameters
  drm/panfrost: Add cycle counter job requirement
  drm/panfrost: Handle JD_REQ_CYCLE_COUNT

 drivers/gpu/drm/panfrost/panfrost_drv.c | 25 +++++++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_job.c | 10 ++++++++++
 include/uapi/drm/panfrost_drm.h         |  3 +++
 3 files changed, 36 insertions(+), 2 deletions(-)


base-commit: f7f3ddb6e5c8dc7b621fd8c0903ea42190d67452
-- 
2.45.2

