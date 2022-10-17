Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A122E600CCC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 12:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969CD10E3DC;
	Mon, 17 Oct 2022 10:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 97A0210E3DC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 10:46:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29F591042;
 Mon, 17 Oct 2022 03:46:17 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.1.201])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3B293F67D;
 Mon, 17 Oct 2022 03:46:09 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v2 0/2] drm/panfrost: Fix UAPI for C++/BSD compatibility
Date: Mon, 17 Oct 2022 11:46:00 +0100
Message-Id: <20221017104602.142992-1-steven.price@arm.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Panfrost DRM interface to user space is uesd in Mesa for targets
other than C/Linux. Specifically the header file needs to compile in C++
code and for FreeBSD which shares the same UABI.

The first patch fixes the C++ compilation issue by removing the
(unnecessary) type name from internal structs which is invalid in C++.

The second patch technically changes the UABI by changing the header
values in the dump format to be native endian rather than fixed
little-endian. Since (a) there are no known big-endian Mali systems, and
(b) this has only appeared in -rc1, this shouldn't break user space.
Tools can use the 'magic' field to identify the endianness of the dump
if they want to support big-endian.

This is effectively a 'v2' of Adrián's series here [1].

[1] https://lore.kernel.org/r/20220920211545.1017355-1-adrian.larumbe%40collabora.com

Steven Price (2):
  drm/panfrost: Remove type name from internal structs
  drm/panfrost: replace endian-specific types with native ones

 drivers/gpu/drm/panfrost/panfrost_dump.c | 36 ++++++++++++------------
 include/uapi/drm/panfrost_drm.h          | 36 +++++++++++++-----------
 2 files changed, 38 insertions(+), 34 deletions(-)

-- 
2.34.1

