Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A62B4C4B0E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E9410E5C3;
	Fri, 25 Feb 2022 16:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B993310E5C3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 16:43:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A7BEB83284;
 Fri, 25 Feb 2022 16:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBE0C340E7;
 Fri, 25 Feb 2022 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645807381;
 bh=APXY3EnRpsBOupquCiWiXnjHHke28N5/pcJDyEoZ/UQ=;
 h=From:To:Cc:Subject:Date:From;
 b=U/Ibm/gp6t9I+K0zJ8pjRvlOOUkTCoRp4vLm3L/rDBwerli1baLd0g/ZdU88LPdBy
 RZ4d7Y2jBu/del2aMnr10HRGLH5u8IOuIW9/5AMzEudVp3LwC3U8mkSqyAjDgXMvON
 HBPz0nA6WcKBDsnZO32sKJ2K7Xg6pULjiaRhDJETda0LhPM1KGZVg5aIQnKMW1JPSY
 UHr+6AE2mSRh9IXr/b1zi1Rcbo13RxP7hGp0F3KFLBA3fycHF6yEFBsRZIkzP/y30g
 KKzqGiqxA8eL3nSmc806TYft/Qv9BSCbsKVvrIxu94EfNCuaA3eHdzzkpzhOTA9ElV
 Bq99ghUu2qnwA==
From: broonie@kernel.org
To: Dave Airlie <airlied@linux.ie>,
	DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm tree
Date: Fri, 25 Feb 2022 16:42:31 +0000
Message-Id: <20220225164231.904173-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Allen Chen <allen.chen@ite.com.tw>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Hermes Wu <hermes.wu@ite.com.tw>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hsin-yi Wang <hsinyi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

After merging the drm tree, today's linux-next build (x86 allmodconfig)
failed like this:

lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x10b: call to do_strncpy_from_user() with UACCESS enabled
lib/strnlen_user.o: warning: objtool: strnlen_user()+0xbb: call to do_strnlen_user() with UACCESS enabled
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c: In function 'receive_timing_debugfs_show':
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
 3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
      |                       ^~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
 3076 |  u8 read_buf[READ_BUFFER_SIZE];
      |     ^~~~~~~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
 3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
      |                       ^~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
 3076 |  u8 read_buf[READ_BUFFER_SIZE];
      |     ^~~~~~~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
 3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
      |                       ^~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
 3076 |  u8 read_buf[READ_BUFFER_SIZE];
      |     ^~~~~~~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
 3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
      |                       ^~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
 3076 |  u8 read_buf[READ_BUFFER_SIZE];
      |     ^~~~~~~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
 3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
      |                       ^~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
 3076 |  u8 read_buf[READ_BUFFER_SIZE];
      |     ^~~~~~~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
 3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
      |                       ^~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
 3076 |  u8 read_buf[READ_BUFFER_SIZE];
      |     ^~~~~~~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
 3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
      |                       ^~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
 3076 |  u8 read_buf[READ_BUFFER_SIZE];
      |     ^~~~~~~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
 3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
      |                       ^~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
 3076 |  u8 read_buf[READ_BUFFER_SIZE];
      |     ^~~~~~~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
 3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
      |                       ^~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
 3076 |  u8 read_buf[READ_BUFFER_SIZE];
      |     ^~~~~~~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
 3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
      |                       ^~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
 3076 |  u8 read_buf[READ_BUFFER_SIZE];
      |     ^~~~~~~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3077:23: error: array subscript 4096 is outside array bounds of 'u8[200]' {aka 'unsigned char[200]'} [-Werror=array-bounds]
 3077 |  u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
      |                       ^~~
/tmp/next/build/drivers/gpu/drm/bridge/ite-it6505.c:3076:5: note: while referencing 'read_buf'
 3076 |  u8 read_buf[READ_BUFFER_SIZE];
      |     ^~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  b5c84a9edcd418 ("drm/bridge: add it6505 driver")

I have used the drm tree from yesterday instead.
