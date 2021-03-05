Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130CA32E70B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 12:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D6C6E1C0;
	Fri,  5 Mar 2021 11:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39296E1A2;
 Fri,  5 Mar 2021 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=JPPM5asBdLyCvpdHn1RVoZYoZUV2eOtjUgBsNTnt0Z0=; 
 b=qe3kgIkxqtPdVo72Gu5fXnq828ubAtMRCky+8q1toSqTyIK/z0kwCXVg8rydSRr6Fd83ZhGIdTvyVNVZoeksQUGAj3RbDZFmuHqXqOkgxHAptnuvY1BVjz6uRat/BONeDncIni9Zx22TK9fEts4yeaGa9zyaeLXgLD/NFkRIr3ICaWJWP8muV8HRWTWlPMP12SIcgvrGGMg5XKjPgqXKSCOpmCycWXMWALPkZfq0MbOweHY9ERf6VD+KOsYrmIwanAGu/BjpUXCtYO68I/n1/4piVVHMdN0HjUzTg+X43SL1jf6UXle3MR4cYONY+UMVdciBtet93MOoHXN6U/A/mw==;
Received: from lneuilly-657-1-8-171.w81-250.abo.wanadoo.fr ([81.250.147.171]
 helo=masxo.routerf36dc8.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lI8OI-0008UE-4h; Fri, 05 Mar 2021 12:13:06 +0100
From: Neil Roberts <nroberts@igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] panfrost: Test accessing a purged buffer via mmap
Date: Fri,  5 Mar 2021 12:12:44 +0100
Message-Id: <20210305111246.1381965-1-nroberts@igalia.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a test for Panfrost to make sure that accessing a buffer
that has been madvised and then purged causes a bus fault. It is
intended to test the fix provided by this series:

https://patchwork.freedesktop.org/series/87324/

The series has now been merged into drm-misc-fixes (thanks!)

In order to trigger the purge, the test just tries to allocate a bunch
of buffers until one of them causes the original buffer to be purged.
During the review of the kernel patch series, Daniel Vetter suggested
it would be better to use debugfs or vm_drop_caches file from proc.
However, I noticed that there are other tests that use the same method
as in this series (eg, igt_vc4_trigger_purge). Seeing as there is
already a precedent for IGT tests to do this, I wonder if we could
leave that as a later change for someone who is more active in
Panfrost development.

Neil Roberts (2):
  lib/panfrost: Add a utility to madvise a buffer
  tests/panfrost: Add a test for accessing a purged buffer

 lib/igt_panfrost.c        |  12 ++++
 lib/igt_panfrost.h        |   1 +
 tests/meson.build         |   1 +
 tests/panfrost_purgemap.c | 146 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 tests/panfrost_purgemap.c

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
