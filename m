Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0156D1DDE9F
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 06:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3652D6E976;
	Fri, 22 May 2020 04:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA1F6E08E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 04:15:09 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec7517c0000>; Thu, 21 May 2020 21:13:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 May 2020 21:15:09 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 May 2020 21:15:09 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 May
 2020 04:15:08 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 22 May 2020 04:15:08 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.182]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ec751cb0005>; Thu, 21 May 2020 21:15:08 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] video: fbdev: fix error handling,
 convert to pin_user_pages*()
Date: Thu, 21 May 2020 21:15:04 -0700
Message-ID: <20200522041506.39638-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590120829; bh=4CvomaKzVwHB+77SfF7gRmZ5Wb1M+7zo/2BM1L60cTk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=IHgj/s0tM22z621m0z8ePs8Uvb1f01gFZTsmrfC4NWm58+BHqupDe1z8HyohCtUPD
 xFZERRuzJgbzy3FpFiRVVklOb8j7ry1m6NCgtQd4zmeFQV6RpUQBJyT0rN03kvEEfM
 PC+lmZGzXxeY00Fn64STilbZm1LqHwjoh7FUXCYSQI899vTRsFTNz6Eo1is8ej5bcu
 qkMjXjiStDYm7zjLYU02pC3HaWWGRZDsHu9y8zUYxCOsIXERPr2TeQVqpLC17sKoEx
 cWqserHfltRNnMKtT8v6yZAfBKU9VisFjyQtFj35L4pBOgNVGWdVMgdDdpeq/ohEfM
 E9o5kJXdzF3XA==
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Note that I have only compile-tested this series, although that does
also include cross-compiling for a few other arches. I'm hoping that
this posting will lead to some run-time testing.

Also: the proposed fix does not have a "Fixes:" tag, nor does it
Cc stable. That's because the issue has been there since the dawn of
git history for the kernel. If it's gone unnoticed this long, then
there is clearly no need for the relatively fast track of putting it
into stable, IMHO. But please correct me if that's wrong.

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org

John Hubbard (2):
  video: fbdev: fix error handling for get_user_pages_fast()
  video: fbdev: convert get_user_pages() --> pin_user_pages()

 drivers/video/fbdev/pvr2fb.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)


base-commit: 051143e1602d90ea71887d92363edd539d411de5
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
