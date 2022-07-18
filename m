Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC0F578845
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 19:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB64718A0E5;
	Mon, 18 Jul 2022 17:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBA414BFC6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 17:24:27 +0000 (UTC)
Received: from sobremesa.fritz.box (82-69-11-11.dsl.in-addr.zen.co.uk
 [82.69.11.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A70086601A76;
 Mon, 18 Jul 2022 18:24:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658165065;
 bh=8kjYep3P7r+Fe97FNRG98SFiE90FwzDObqoPAwpS2h0=;
 h=From:To:Cc:Subject:Date:From;
 b=cygdomEyTJCuqFh2GPsMrhgaqPh1YWYUbHMhhy2KioqrhBE+hS/VCcN/vFUNNu4wv
 mMXit2EN/OSGxKIxeNZD+bzezAzVwixzGh+N8tdvJ3NEom7988XcsIHih+2j4v8mwX
 l6BXqQyf6z6GooKQS3CgrQKQe033693vEJ4EVe9nrj5xy0SpcuB2Z1RfpYJo1Cp2jS
 ERQJaS6moqeWfUaYgTQMVtiOMdui5KuWvRkpNoffs12qnYaV6vn5Dxf9VC6K4i9znO
 e3SLuVyaLm6ykwEE2l1aG1pYM0XlUDDlEQ15nc2lY0ErZUawymiYNTQfsr4Eyo32pL
 WDSR94qB6/oMQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/2] devcoredump support for Panfrost GPU driver
Date: Mon, 18 Jul 2022 18:24:16 +0100
Message-Id: <20220718172418.584231-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
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
Cc: adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is v5 for a previous patch series being discussed at:

https://lore.kernel.org/dri-devel/20220622143616.1265405-1-adrian.larumbe@collabora.com/T/#t

Mesa MR under review can be found at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14034

Changes with respect to v4 of the same patch:

 - Added MMU and JS base and stride macros for range checks within
   panfrost_core_dump_registers
 - Fixed dereference-before-assignment BO pointer bug 
 - Chose the right-sized endianness conversion function for header's valid bit

Adrián Larumbe (2):
  drm/panfrost: Add specific register offset macros for JS and MMU AS
  drm/panfrost: Add support for devcoredump

 drivers/gpu/drm/panfrost/Kconfig         |   1 +
 drivers/gpu/drm/panfrost/Makefile        |   3 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c | 249 +++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_dump.h |  12 ++
 drivers/gpu/drm/panfrost/panfrost_job.c  |   3 +
 drivers/gpu/drm/panfrost/panfrost_regs.h |  42 ++--
 include/uapi/drm/panfrost_drm.h          |  47 +++++
 7 files changed, 338 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h

-- 
2.37.0

