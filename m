Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FDB78F8CB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 08:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FB810E72E;
	Fri,  1 Sep 2023 06:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Fri, 01 Sep 2023 06:58:28 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CE310E72C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 06:58:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4390BB824AE;
 Fri,  1 Sep 2023 06:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092B1C433C7;
 Fri,  1 Sep 2023 06:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693551080;
 bh=js9V0rYp6XYv+sNWXNaad1vvLDDI3kITo4+FFHg6IZ4=;
 h=From:To:Cc:Subject:Date:From;
 b=dK1TCwB8xgpNHT5VTEfDLlrKFXdbNEUet+spzHTj5hdIITxB+KCTP19YZs+EsoDp1
 76rqHKzo/rHYaqpoky6Bqc/bLMsUCRSoUmTBGp/khHwlSwv1jyVteVVAv1MXZF1Xbn
 ZITjw1kkDAtPWaOstpygCbmUGBzjFXPJ1xR+8oIUkMsIzo/4BsGUx5q235yn5Dw00X
 VgJeEhSVDr/RrFRgwlOSqHgxnDEcGvtOJoqEYm+YV1D76Gf1qWbIAM4Ha5N3pKpYDw
 gWvbHlEOY+u8kD6jGqgLvgp+exml8pYOjxZuUuZP7BekAEQGD8mthUuR4kEdZSYzGd
 ZcsUGNYU6f5+w==
Received: from mchehab by mail.kernel.org with local (Exim 4.96)
 (envelope-from <mchehab@kernel.org>) id 1qbxzw-0012V8-1t;
 Fri, 01 Sep 2023 08:51:16 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 0/2] Add support for inlined documentation for kunit and
 kselftests
Date: Fri,  1 Sep 2023 08:51:04 +0200
Message-ID: <cover.1693550658.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.41.0
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a follow-up of the discussions taken here:

   https://lore.kernel.org/linux-doc/20230704132812.02ba97ba@maurocar-mobl2/T/#t

I sent a previous version as RFC. This is basically what we had there, with some
improvements at test_list.py.

It adds a new extension that allows documenting tests using the same tool we're
using for DRM unit tests at IGT GPU tools: https://gitlab.freedesktop.org/drm/igt-gpu-tools.

While kernel-doc has provided documentation for in-lined functions/struct comments,
it was not meant to document tests.

Tests need to be grouped by the test functions. It should also be possible to produce
other outputs from the documentation, to integrate it with test suites. For instance, 
Internally at Intel, we use the comments to generate DOT files hierarchically grouped
per feature categories.

This is meant to be an initial series to start documenting kunit.

It comes with a documenation for a kunit suite from drm at drm_buddy_test.c.

My plan is that, once we get this merged, start documenting other unit tests and work
to add extra requirements at the tool needed by Linux Kernel.

On this series, we have:

- patch 1:
  adds test_list.py - which is identical to the file with the same name I developed for
  IGT tree;
- patch 2:
  adds  test documentation from a single DRM kunit file (drm_buddy_test.c).

Mauro Carvalho Chehab (2):
  docs: add support for documenting kUnit and kSelftests
  drm: add documentation for drm_buddy_test kUnit test

 Documentation/conf.py                  |    2 +-
 Documentation/index.rst                |    2 +-
 Documentation/sphinx/test_kdoc.py      |  108 ++
 Documentation/sphinx/test_list.py      | 1314 ++++++++++++++++++++++++
 Documentation/tests/index.rst          |    6 +
 Documentation/tests/kunit.rst          |    5 +
 drivers/gpu/drm/tests/drm_buddy_test.c |   12 +
 7 files changed, 1447 insertions(+), 2 deletions(-)
 create mode 100755 Documentation/sphinx/test_kdoc.py
 create mode 100644 Documentation/sphinx/test_list.py
 create mode 100644 Documentation/tests/index.rst
 create mode 100644 Documentation/tests/kunit.rst

-- 
2.41.0


