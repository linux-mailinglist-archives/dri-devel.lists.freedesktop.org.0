Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025813286E9
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 18:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977306E849;
	Mon,  1 Mar 2021 17:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2BA6E849
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 17:19:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A8FA651E8;
 Mon,  1 Mar 2021 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614619167;
 bh=vmBJfQov9r+kOBWsOrfukGcLZjgVtA6JQZx4OWgTqvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wfABAUo5e7dKE4OAX2QsXeyzXG5w0LhWCp9pCCkHl+w4CJkahsIOm6HrmwfTrbWYR
 GbfhCbXXXlFfrzE1Uk0KVEdnrXBKrhbasU6vfEE3RX6XgzDi35QTHlU38RpxHfCF2T
 xipuR9/aiYaIWixhviNMZzcFpqF6kMCu1S2Jxuas=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.10 355/663] kselftests: dmabuf-heaps: Fix Makefiles
 inclusion of the kernels usr/include dir
Date: Mon,  1 Mar 2021 17:10:03 +0100
Message-Id: <20210301161159.422940508@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301161141.760350206@linuxfoundation.org>
References: <20210301161141.760350206@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Sasha Levin <sashal@kernel.org>, Sandeep Patil <sspatil@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Laura Abbott <labbott@kernel.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Hridya Valsaraju <hridya@google.com>, linux-media@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Stultz <john.stultz@linaro.org>

[ Upstream commit 64ba3d591c9d2be2a9c09e99b00732afe002ad0d ]

Copied in from somewhere else, the makefile was including
the kerne's usr/include dir, which caused the asm/ioctl.h file
to be used.

Unfortunately, that file has different values for _IOC_SIZEBITS
and _IOC_WRITE than include/uapi/asm-generic/ioctl.h which then
causes the _IOCW macros to give the wrong ioctl numbers,
specifically for DMA_BUF_IOCTL_SYNC.

This patch simply removes the extra include from the Makefile

Cc: Shuah Khan <shuah@kernel.org>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kselftest@vger.kernel.org
Fixes: a8779927fd86c ("kselftests: Add dma-heap test")
Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/dmabuf-heaps/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/Makefile b/tools/testing/selftests/dmabuf-heaps/Makefile
index 607c2acd20829..604b43ece15f5 100644
--- a/tools/testing/selftests/dmabuf-heaps/Makefile
+++ b/tools/testing/selftests/dmabuf-heaps/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS += -static -O3 -Wl,-no-as-needed -Wall -I../../../../usr/include
+CFLAGS += -static -O3 -Wl,-no-as-needed -Wall
 
 TEST_GEN_PROGS = dmabuf-heap
 
-- 
2.27.0



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
