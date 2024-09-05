Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42CA96E12C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 19:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D557810E888;
	Thu,  5 Sep 2024 17:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="Z83LRDkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387B910E888
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 17:35:28 +0000 (UTC)
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725557723; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TuLBEVWRBcDiVKWhwyNV1ctD1d72aYhSugdgXIsgM7MrawUu2WC6natXhQbjuVg1SF8SETads0m36bMrpY3yaqI7xBlR9YkbcuNacEtmWfVuX1xvwciq/WD4OgCwvXxnngsfX5i0zAblD334qIMfYFdA7dbF0DsGbkxEirzru7I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725557723;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=uCPBpKjvFpzfgJ19E83MsJvpP3DosEZWIQfDvlOJc7s=; 
 b=hYJpxA/2HXmN0XuT17IuLkZAd9hAYHMNn+CmhizWrPW4yYUFBEstLUDQhMbXmuAiy9HCDAldRZr5fON4ZsU/oA1HNbVZKPOfLdzsFsIbI/5vRUUn7KS5EmxgXdfBtV5OP6LDJHXNa+AUU/XBSC11oDHrvAaC7xQlmlJAoD/DGMI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725557723; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=uCPBpKjvFpzfgJ19E83MsJvpP3DosEZWIQfDvlOJc7s=;
 b=Z83LRDkE+ZYEmnW9nYFolnk6GsossFkfcVUa9rBeNnZ4RA4Gyp2AH10M+eJSSFVI
 zfb22JIbcOwTYiebkhCzr2jy1SXCiUtwod2A7E9Qq7fwUXkquIArO1KyknyDqH0JH2J
 5kf4zWIxVaNkz3zRVYtFl0c0HaXyLdtTQHQ5ubPs=
Received: by mx.zohomail.com with SMTPS id 1725557720415634.3620957149494;
 Thu, 5 Sep 2024 10:35:20 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>
Subject: [PATCH v2 0/2] drm/panthor: Expose realtime group priority and
 allowed priorites to userspace
Date: Thu,  5 Sep 2024 19:32:21 +0200
Message-ID: <20240905173222.252641-2-mary.guillemard@collabora.com>
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

v2:
- Add Steven Price r-b on the first patch
- Remove drm_panthor_group_allow_priority_flags definition and document
  that allowed_mask is a bitmask of drm_panthor_group_priority on the
  second patch

[1]https://lore.kernel.org/all/20240903144955.144278-2-mary.guillemard@collabora.com/
[2]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30991

Mary Guillemard (2):
  drm/panthor: Add PANTHOR_GROUP_PRIORITY_REALTIME group priority
  drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query

 drivers/gpu/drm/panthor/panthor_drv.c   | 61 +++++++++++++++++--------
 drivers/gpu/drm/panthor/panthor_sched.c |  2 -
 include/uapi/drm/panthor_drm.h          | 29 ++++++++++++
 3 files changed, 71 insertions(+), 21 deletions(-)

-- 
2.46.0

