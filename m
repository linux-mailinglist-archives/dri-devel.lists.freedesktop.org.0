Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1D30840C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 04:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4616EA6A;
	Fri, 29 Jan 2021 03:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547AC6EA3B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 03:05:19 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id e9so4487383plh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 19:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=++jZtzOYyQ1+vtEeMaOUIstaO3RLvVGMYd5LElrs3tk=;
 b=uhyod5IVvkWiHsST5/O68YcC4Axe3RKRQzvKBXYml1+ezIoSduIUXyT3McvxxfQb6X
 MdGdB6a0QGYeKJPc6EOPv4LDPZzHfkLWnQhCaEjmTW+3EDXkZRQFpri3M7TDZpXFwknB
 nzDT/YpZaeczzI5+TCeNblHK1riCKukRLYsO4ZNEgO2aC4WhQT2Ut1dctUoeYX4W6t9T
 ZW828X9T4wU/86xrUnE1rqIASwioP5MyUUMrrPaQuKKUYlALfUnddC1lV5fGS3MkmN8L
 pujzNObUmAqlaJN71GQQzc71PDhg+rwgYMgYwG4kvOBSZEYKrvspyB0LF4dA10Zcxcfq
 DqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=++jZtzOYyQ1+vtEeMaOUIstaO3RLvVGMYd5LElrs3tk=;
 b=JRGbh+7XNxiJxiWD1PrePK6vmKMurEnKUnbq1JB7lrkADhXcep9qk2qQoq0kwMVORQ
 DbYH/896/Lt8Qa90YqripcHI0W76B7wke0xV3WSI3h+DmCc/7thOoMQNDKd0RJpVJpGY
 x51c9crsg4NL5f5lvkJSRMY9GfMKv6v6Jx1KG1QQW1Gc0RIGd4Y7W1MLxr31fuiyyi7o
 Wcl6OKq5dte/rebojw3K1vcjcB2BdHqmyrYRWm2EsOpVZ//jM4v50gVFTsOnVPG8FswT
 jNy0pxtVBQQ7v6Z4GPDNEWdfvrKkzA+BKRp2SkEYLyjLlK/9GIApO3V/yCMBLGWLu+8r
 lfeQ==
X-Gm-Message-State: AOAM533n+LuWWu6uy+As+bS7qqCR7iD+1rzho3LlU9/oB127k4+xceW2
 C2yQxXIXsuJoFbeuXYJ0lK64kefGFrpuLw==
X-Google-Smtp-Source: ABdhPJyGn3wdGoYadza5iNZE6bj/nXq6MrRCQBVxL3lyhFqvG5bHcjloTEwy1RXyVtmPLRFrsk59eQ==
X-Received: by 2002:a17:902:a710:b029:dc:3817:e7c2 with SMTP id
 w16-20020a170902a710b02900dc3817e7c2mr2361020plq.0.1611889518950; 
 Thu, 28 Jan 2021 19:05:18 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y75sm6854496pfg.119.2021.01.28.19.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 19:05:18 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/5] kselftests: dmabuf-heaps: Add clearer checks on
 DMABUF_BEGIN/END_SYNC
Date: Fri, 29 Jan 2021 03:05:11 +0000
Message-Id: <20210129030514.1231773-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129030514.1231773-1-john.stultz@linaro.org>
References: <20210129030514.1231773-1-john.stultz@linaro.org>
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
Cc: Sandeep Patil <sspatil@google.com>, Suren Baghdasaryan <surenb@google.com>,
 dri-devel@lists.freedesktop.org, Laura Abbott <labbott@kernel.org>,
 linux-kselftest@vger.kernel.org, Hridya Valsaraju <hridya@google.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add logic to check the dmabuf sync calls succeed.

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
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 .../selftests/dmabuf-heaps/dmabuf-heap.c      | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index 909da9cdda97..46f6759a8acc 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -130,16 +130,13 @@ static int dmabuf_heap_alloc(int fd, size_t len, unsigned int flags,
 					 dmabuf_fd);
 }
 
-static void dmabuf_sync(int fd, int start_stop)
+static int dmabuf_sync(int fd, int start_stop)
 {
 	struct dma_buf_sync sync = {
 		.flags = start_stop | DMA_BUF_SYNC_RW,
 	};
-	int ret;
 
-	ret = ioctl(fd, DMA_BUF_IOCTL_SYNC, &sync);
-	if (ret)
-		printf("sync failed %d\n", errno);
+	return ioctl(fd, DMA_BUF_IOCTL_SYNC, &sync);
 }
 
 #define ONE_MEG (1024 * 1024)
@@ -197,9 +194,18 @@ static int test_alloc_and_import(char *heap_name)
 	}
 	printf("import passed\n");
 
-	dmabuf_sync(dmabuf_fd, DMA_BUF_SYNC_START);
+	ret = dmabuf_sync(dmabuf_fd, DMA_BUF_SYNC_START);
+	if (ret < 0) {
+		printf("Sync start failed!\n");
+		goto out;
+	}
+
 	memset(p, 0xff, ONE_MEG);
-	dmabuf_sync(dmabuf_fd, DMA_BUF_SYNC_END);
+	ret = dmabuf_sync(dmabuf_fd, DMA_BUF_SYNC_END);
+	if (ret < 0) {
+		printf("Sync end failed!\n");
+		goto out;
+	}
 	printf("syncs passed\n");
 
 	close_handle(importer_fd, handle);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
