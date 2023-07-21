Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE2375D13A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 20:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8B110E6E2;
	Fri, 21 Jul 2023 18:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596BA10E6E2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 18:23:32 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4R6yc400rzz9sv8;
 Fri, 21 Jul 2023 18:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1689963812; bh=HlF370xavQnrD0oYD7nCTKXlNfMpJbgttGKHGl5uPIg=;
 h=From:To:Cc:Subject:Date:From;
 b=OLTAptpLGr/3hmNMIlkF7PYK2DymylIaYyGGRGpDF9Zc4VPYeoYVfrFCRvPCVxSMr
 Ag6kqcKVt3MydzlPzflQd3V5Ohz/LMDv0pyG/pDVTssiJP2LPq0HYGEQ0JX6fwRr7g
 OTUaF8m81LMDm3/J6nUX6lyET3Gakeu1aKXkkmWU=
X-Riseup-User-ID: CF297929997E0C55641F8226951D0D3B390E846BEDEB143FB7C197D3F12735F2
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4R6ybz5vQszFpqX;
 Fri, 21 Jul 2023 18:23:27 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] Increase code coverage on drm_format_helper.c
Date: Fri, 21 Jul 2023 15:23:10 -0300
Message-ID: <20230721182316.560649-1-arthurgrillo@riseup.net>
MIME-Version: 1.0
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
Cc: tzimmermann@suse.de, tales.aparecida@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, davidgow@google.com, jose.exposito89@gmail.com,
 andrealmeid@riseup.net, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following series include improvements and new KUnit tests to some
functions on drm_format_helper.c.

The first patch improves existing conversion tests to assure that the
default pitch is used when NULL is used on the `dst_pitch` argument.

Patches 2, 3, 4, and 6 add the new parametrized tests to the following
functions:

- drm_fb_swab()
- drm_fb_clip_offset()
- drm_fb_build_fourcc_list()
- drm_fb_memcpy()

The 5th patch is a change to the conversion_buf_size() helper used on
the tests, this change was needed to make the patch 6.

a coverage report for the file can be found below:
https://grillo-0.github.io/coverage-reports/gsoc-drm-format-test/drivers/gpu/drm/drm_format_helper.c.gcov.html

Arthur Grillo (6):
  drm/format-helper: Test default pitch fallback
  drm/format-helper: Add KUnit tests for drm_fb_swab()
  drm/format-helper: Add KUnit tests for drm_fb_clip_offset()
  drm/format-helper: Add KUnit tests for drm_fb_build_fourcc_list()
  drm/format-helper-test: Add multi-plane support to
    conversion_buf_size()
  drm/format-helper: Add KUnit tests for drm_fb_memcpy()

 .../gpu/drm/tests/drm_format_helper_test.c    | 849 ++++++++++++++++--
 1 file changed, 791 insertions(+), 58 deletions(-)

-- 
2.41.0

