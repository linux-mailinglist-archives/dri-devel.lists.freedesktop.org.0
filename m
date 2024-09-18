Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4951797B99E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 10:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5720110E180;
	Wed, 18 Sep 2024 08:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="lFp9Qhxd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3711310E180
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 08:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726649641; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iQSh8PfxDJSm9lj3UHXbZjd1Bcj/t+L1ARXiszmu8urR0MP0sYp/miFjIS4kDJQc3bsC2P4gCBqr6N/jMWr1yaTssnoXO+B/Gx1GxCwRpOSDgFpNRkudlBtKbkTqJ6NWshUzv+rwfUiZrv+h+o0AmWYmxnkSzTfL7PG98xKBGLo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1726649641;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FXUAv8aO/iNDJnUmfdDpvAEljxvfwHBmpqsS/FErEzE=; 
 b=YVAH0oTPLUixohmdbbxAknGVgp1epSRPirQU7CUg4trORfYFjy95i2WXmwBoJ0ybs1bWc8l23nmbrHxYBYqgG8O0k1FIxsBLgNNTKI5ogrYeNpLdiaQhZpfRZLA7J4xQd3iI6l7KfLtl/c9nE5DLB5th7/OYya9+by3mtbeErL0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726649641; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=FXUAv8aO/iNDJnUmfdDpvAEljxvfwHBmpqsS/FErEzE=;
 b=lFp9QhxdOC2tWXhBJQ3BeTMLGRRSjkPerl2vPpFO0ioRxTp2fk9M1yTI+4AOFbK4
 SlQo9wpoJCHLRoOoWHTOjO8sMh/yP7W1PhjpChqY5skqeNXH9EuYvgitm9UggCR7kpT
 U0BdEbJRaLERYk8yFgw7WWraC2jyzappjMexONBQ=
Received: by mx.zohomail.com with SMTPS id 1726649639948432.64678799221724;
 Wed, 18 Sep 2024 01:53:59 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>
Subject: [PATCH 0/2] drm/panthor: Expose scheduler groups info in debugfs
Date: Wed, 18 Sep 2024 10:50:54 +0200
Message-ID: <20240918085056.24422-2-mary.guillemard@collabora.com>
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

This patch series adds a new debugfs file named "sched_groups" allowing
a user to query information about all userspace clients scheduler groups.

This patch series assumes that [1] and [2] are applied.

[1]https://lore.kernel.org/all/20240903144955.144278-2-mary.guillemard@collabora.com/
[2]https://lore.kernel.org/all/20240909064820.34982-2-mary.guillemard@collabora.com/

Mary Guillemard (2):
  drm/panthor: Add csg_priority to panthor_group
  drm/panthor: Expose scheduler groups info in debugfs

 drivers/gpu/drm/panthor/panthor_drv.c   |   1 +
 drivers/gpu/drm/panthor/panthor_sched.c | 145 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |   4 +
 3 files changed, 147 insertions(+), 3 deletions(-)

-- 
2.46.0

