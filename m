Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AA5481D04
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 15:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEECE10E4B5;
	Thu, 30 Dec 2021 14:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4191410E4B5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 14:26:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g26so54746884lfv.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 06:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+tf4nBFZgti+nl0o1bJRk3qvXgnYx/HTJhgteUE1QXw=;
 b=gH9FQ3nysBpaf6G5Z0BPfhrqQtpn+qTmTd9UB7DUm+POlRm9S/SWcJhtT6sWg8x5VG
 5wF/wNm7rAkcswm9tYQ+CR7jZhIoTCyvDYLB7k3A7y1VmhocDh4hpQHOMgOns1Zs2jEp
 a8xCGzZH9LvUYy31L0ngkPTIni39sm99s1tDL2lPqEJYEMz/R72swz7s82+NAfYC3Y2n
 ZwN8MwlCkUqzY6M3n5PPQRrVfnVFwAL180ELTGvhAOdIpyXLvNDrhQN8zc6co8nNtpIC
 3HzPMQFQk6TgJ+rS48DAfXKP2meFfw6HhUdjPeaS2dPj9EChx7KhfBUwex5IrnrVLfyx
 UFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+tf4nBFZgti+nl0o1bJRk3qvXgnYx/HTJhgteUE1QXw=;
 b=lK9C0WXUywNEuLNnvNquTF4eOpnxf2N7Fw02oMg/77hVOcLFnZY8iCKoxONrtJvYqz
 SvooNGRIRFRxWvyGZmAW7M5hpaEQxktGTSP/6O+cAkNzAnZivGTjdraPfxpPvcIIaCIv
 KAKaRpi7tvZOixrfY3GT/onXsx5/jdSp4kROv4yvhRkBXNNPDMilZqF5Sq4wkMIwIsQv
 /WXsz+olSxdbL0AE+4XEsTAWy2D9lLx4NRAjVmL03FFu9gy+D9tAyOzNv1YM1KJ/9fwN
 xi/77SylNm4jHeRD3+j0yg8XN5SN0q18J2likqI40kHzAC1DnyM4okDHUdDLSqgS3ogL
 WI5w==
X-Gm-Message-State: AOAM533Habs1vVJn5pCYXToJTvAGHmDbufHrbvkhvBcQB7hJrb0JbN3/
 ZzvLfO0lhg+wvcW3bLTxqyk=
X-Google-Smtp-Source: ABdhPJxxcwPDUWvaddgiXQGl/eGIsXz0jw20BcLQgPCKVg4rWRtMVdGV8LZ3Vvbkd2/qzkOSH5LouA==
X-Received: by 2002:ac2:52a3:: with SMTP id r3mr28192890lfm.580.1640874412548; 
 Thu, 30 Dec 2021 06:26:52 -0800 (PST)
Received: from localhost.localdomain ([94.103.235.97])
 by smtp.gmail.com with ESMTPSA id v27sm2510259lfo.97.2021.12.30.06.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 06:26:52 -0800 (PST)
From: Pavel Skripkin <paskripkin@gmail.com>
To: kraxel@redhat.com, sumit.semwal@linaro.org, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch
Subject: [PATCH] udmabuf: validate ubuf->pagecount
Date: Thu, 30 Dec 2021 17:26:49 +0300
Message-Id: <20211230142649.23022-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Pavel Skripkin <paskripkin@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Syzbot has reported GPF in sg_alloc_append_table_from_pages(). The
problem was in ubuf->pages == ZERO_PTR.

ubuf->pagecount is calculated from arguments passed from user-space. If
user creates udmabuf with list.size == 0 then ubuf->pagecount will be
also equal to zero; it causes kmalloc_array() to return ZERO_PTR.

Fix it by validating ubuf->pagecount before passing it to
kmalloc_array().

Fixes: fbb0de795078 ("Add udmabuf misc device")
Reported-and-tested-by: syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Happy New Year and Merry Christmas! :)


With regards,
Pavel Skripkin

---
 drivers/dma-buf/udmabuf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index c57a609db75b..e7330684d3b8 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -190,6 +190,10 @@ static long udmabuf_create(struct miscdevice *device,
 		if (ubuf->pagecount > pglimit)
 			goto err;
 	}
+
+	if (!ubuf->pagecount)
+		goto err;
+
 	ubuf->pages = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->pages),
 				    GFP_KERNEL);
 	if (!ubuf->pages) {
-- 
2.34.1

