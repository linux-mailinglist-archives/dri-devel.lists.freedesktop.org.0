Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0130840B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 04:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D956EA3B;
	Fri, 29 Jan 2021 03:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA176EA3B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 03:05:20 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id m6so5335861pfk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 19:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zTNb1lTIEVQ6SY+1PM+jItpjx6YB2483ibK9X9oBYPQ=;
 b=z1kwyFNg5hSYRi20ZvZ8wuUsM10FJZoI8McYKRlownqrb/9vwSuD19hHoANIKl9o7S
 NM3r0rFYtS7BoYRIxUKv2hJYefP+6PduFPKe6sNVWE7NJvVoSFSo+oGB5ds50UhCUA9V
 SyK9daFDnwbPsOxmmmogF/izeRWdoG3OgCQ6k0DmEgOaW1qa9ZwCI/06RZVukTBn91KD
 jWkK57VznZPmUOrJGfJnxT8iH5+1O3xSd8qHCSqHOszD3n07tm6upXSk82uB3LtU1IAy
 N+1l7G24LEncO+U+I1O4bg5Gt8C/bhkcHAaGe6YPBKuBSfvXS+AFhnzu9hoyFu2QqGYg
 S+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zTNb1lTIEVQ6SY+1PM+jItpjx6YB2483ibK9X9oBYPQ=;
 b=SRuHVFcCyrVJ0yZ5NbgPM+ypdYjZkNLGui967DbhI0JQ+IoHcenr4PSzyJga/K1wZn
 2GpzSGQayMVuOmSk4XY409JTrO0JKDyairmG5v+Do8DKfs3hFsEw/P3psQwoOAK/Hylc
 w7mafkal1kGd8YhkUknTYPIcunZXXWWBd8UEfTyXnnbfd6L5clTiQ6oGlcbGJ9igOMu6
 taXZkme3w8sYBS5lFx4eG79n/NFrQhCAL6V4tfv2RAaF3iMUYjdfTXWgkDvlNwnOmkgC
 7MTehqlG69qooCr60aSYSWILKCyIJqdofbnoD0U3W+xDCvc9JOqcS3QlyQvYMYnlDb9e
 +IBA==
X-Gm-Message-State: AOAM531VH1pUXV/TrPejvRG6a29+EPOl65pyvq/dr2+73cvUSpHJO28M
 gghR4ohv4Mx/61icqXsdVqqyUQ==
X-Google-Smtp-Source: ABdhPJxgU85/WQXQ6xIZh5kol/FeQ53pYxb2sLTuRnfE+yO6MQ1sib5AHGRb02vCaC8rjeUx7mU2rw==
X-Received: by 2002:a63:f404:: with SMTP id g4mr2518687pgi.114.1611889520497; 
 Thu, 28 Jan 2021 19:05:20 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y75sm6854496pfg.119.2021.01.28.19.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 19:05:19 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] kselftests: dmabuf-heaps: Softly fail if don't find a
 vgem device
Date: Fri, 29 Jan 2021 03:05:12 +0000
Message-Id: <20210129030514.1231773-3-john.stultz@linaro.org>
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

While testing against a vgem device is helpful for testing importing
they aren't always configured in, so don't make it a fatal failure.

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
 .../testing/selftests/dmabuf-heaps/dmabuf-heap.c  | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index 46f6759a8acc..8cedd539c7fb 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -184,15 +184,14 @@ static int test_alloc_and_import(char *heap_name)
 	if (importer_fd < 0) {
 		ret = importer_fd;
 		printf("Failed to open vgem\n");
-		goto out;
-	}
-
-	ret = import_vgem_fd(importer_fd, dmabuf_fd, &handle);
-	if (ret < 0) {
-		printf("Failed to import buffer\n");
-		goto out;
+	} else {
+		ret = import_vgem_fd(importer_fd, dmabuf_fd, &handle);
+		if (ret < 0) {
+			printf("Failed to import buffer\n");
+			goto out;
+		}
+		printf("import passed\n");
 	}
-	printf("import passed\n");
 
 	ret = dmabuf_sync(dmabuf_fd, DMA_BUF_SYNC_START);
 	if (ret < 0) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
