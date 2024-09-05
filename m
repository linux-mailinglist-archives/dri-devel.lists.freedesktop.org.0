Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE01496D6D0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 13:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0C810E075;
	Thu,  5 Sep 2024 11:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="a2kUXhMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0F410E075
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 11:13:59 +0000 (UTC)
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725534835; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ko+ssTjfuzPSoVr5DCixIvL3qEV+P46vAy/qfUPUYEMINkqFX6b+LgLp05dF178JwOBoCJCY6RsZDC+JzuHkYZ4DXMKI64wAYYM7i0uXOwZzIRMXVpeJFi9cNzlx1pTz/r3LR1NB4LA4E3GyqEPkMlF2dIDRWQeyr4kUvY6oUbY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725534835;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zYO5M+XyjUp7mPx9nd9oE8rcz7ltsIbCI/ZCic2x2mA=; 
 b=jiW9jWOLQDgsiUlR6U7m+ORi0LdrGwbIzGTRulyHt8ifuvJSg1tebKS3CJo4VW5YaLydYbdemYNVANEro+4i9lcSyY/vF5FiJxFr155rSsjSmbHhAjEFm6p1kUI3VHaRRcBwDf8nPf00AH+G4Lr0YUD4ZqXkM/tuezG3DPcanL8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725534835; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=zYO5M+XyjUp7mPx9nd9oE8rcz7ltsIbCI/ZCic2x2mA=;
 b=a2kUXhMMBjaPKLip3MF83DxcNCQEwhiDizIplRF43//Jm7JjnnPgZWhZRICO1bxF
 finMm+AFTsJF9/Sb2WuJ8hFDYHQINfRl4TFo5q1kHWC2JlMf8rA6V+uHZ4aCG3yABWj
 QbVz1dFCwQmdvdkFS9Otg3nkp3Uqa+22mFmE+Qkg=
Received: by mx.zohomail.com with SMTPS id 1725534833685272.4438221352942;
 Thu, 5 Sep 2024 04:13:53 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>
Subject: [PATCH 0/2] drm/panthor: Expose realtime group priority and allowed
 priorites to userspace
Date: Thu,  5 Sep 2024 13:13:36 +0200
Message-ID: <20240905111338.95714-1-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.46.0
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

This patch series adds support for realtime group priority and exposes
allowed priorities info with a new dev query.

Those changes are required to implement EGL_IMG_context_priority and
EGL_NV_context_priority_realtime extensions properly.

This patch series assumes that [1] is applied. (found in drm-misc-fixes)

The Mesa MR using this series is available here [2].

[1]https://lore.kernel.org/all/20240903144955.144278-2-mary.guillemard@collabora.com/
[2]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30991

Mary Guillemard (2):
  drm/panthor: Add PANTHOR_GROUP_PRIORITY_REALTIME group priority
  drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query

 drivers/gpu/drm/panthor/panthor_drv.c   | 61 +++++++++++++++++--------
 drivers/gpu/drm/panthor/panthor_sched.c |  2 -
 include/uapi/drm/panthor_drm.h          | 45 ++++++++++++++++++
 3 files changed, 87 insertions(+), 21 deletions(-)

-- 
2.46.0

