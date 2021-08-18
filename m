Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5B3F0A64
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F36A6E888;
	Wed, 18 Aug 2021 17:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 942 seconds by postgrey-1.36 at gabe;
 Wed, 18 Aug 2021 13:20:06 UTC
Received: from mail-m971.mail.163.com (mail-m971.mail.163.com [123.126.97.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C4176E5AB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=1ty22
 VOMwZz6zNP9VFFtEN/bLi/9Opdu0wufpsZYxvU=; b=i7B4+rwLQ+mjFUw+4LiCg
 wuTOwj4+GIIggPwv/s+CqaBR5YrmzueXWvpchOZeltR7OomoWEgxjXu46GIz/Nga
 ukQC0qXZ0dOA3Quo59Pt0Ywa3h5QiIWMzHlplguIbLNAWJjdyLv6sP2XreKZZuzD
 EwMhX7wwXVHfiayv6MqLZk=
Received: from localhost.localdomain (unknown [111.201.47.26])
 by smtp1 (Coremail) with SMTP id GdxpCgD3FkzqBB1hdtlmOA--.179S4;
 Wed, 18 Aug 2021 21:02:41 +0800 (CST)
From: Wentao_Liang <Wentao_Liang_g@163.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Wentao_Liang <Wentao_Liang_g@163.com>
Subject: [PATCH] drm/prime: fix a potential double put (release) bug
Date: Wed, 18 Aug 2021 21:02:31 +0800
Message-Id: <20210818130231.3484-1-Wentao_Liang_g@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GdxpCgD3FkzqBB1hdtlmOA--.179S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw4rGF4xWr43CrWDJr17Awb_yoW8Kr1fpF
 WYyFyUKrWUtF4jqFyfAF1kZan09w45Ga1xXrW3Jw4Yv3WFqr1DWF9rAr9Fyr15G34Dtw1S
 yFyUXry5JryUCF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jkYFAUUUUU=
X-Originating-IP: [111.201.47.26]
X-CM-SenderInfo: xzhq3t5rboxtpqjbwqqrwthudrp/xtbBQhHyL1++M90j-wAAsd
X-Mailman-Approved-At: Wed, 18 Aug 2021 17:40:22 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In line 317 (#1), drm_gem_prime_import() is called, it will call
drm_gem_prime_import_dev(). At the end of the function
drm_gem_prime_import_dev() (line 956, #2), "dma_buf_put(dma_buf);" puts
dma_buf->file and may cause it to be released. However, after
drm_gem_prime_import() returning, the dma_buf may be put again by the
same put function in lines 342, 351 and 358 (#3, #4, #5). Putting the
dma_buf improperly more than once can lead to an incorrect dma_buf-
>file put.

We believe that the put of the dma_buf in the function
drm_gem_prime_import() is unnecessary (#2). We can fix the above bug by
removing the redundant "dma_buf_put(dma_buf);" in line 956.

 314     if (dev->driver->gem_prime_import)
 315         obj = dev->driver->gem_prime_import(dev, dma_buf);
 316     else
 317         obj = drm_gem_prime_import(dev, dma_buf);
 				//#1 call to drm_gem_prime_import
				//   ->drm_gem_prime_import_dev
				//   ->dma_buf_put
 ...

 336     ret = drm_prime_add_buf_handle(&file_priv->prime,
 337             dma_buf, *handle);

 ...

 342     dma_buf_put(dma_buf);  //#3 put again
 343
 344     return 0;
 345
 346 fail:

 351     dma_buf_put(dma_buf); //#4 put again
 352     return ret;

 356 out_put:
 357     mutex_unlock(&file_priv->prime.lock);
 358     dma_buf_put(dma_buf);  //#5 put again
 359     return ret;
 360 }

 905 struct drm_gem_object *drm_gem_prime_import_dev
 							(struct drm_device *dev,
 906                         struct dma_buf *dma_buf,
 907                         struct device *attach_dev)
 908 {

 ...

 952 fail_unmap:
 953     dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
 954 fail_detach:
 955     dma_buf_detach(dma_buf, attach);
 956     dma_buf_put(dma_buf);  //#2 the first put of dma_buf
								//	 (unnecessary)
 957
 958     return ERR_PTR(ret);
 959 }

Signed-off-by: Wentao_Liang <Wentao_Liang_g@163.com>
---
 drivers/gpu/drm/drm_prime.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 2a54f86856af..cef03ad0d5cd 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -953,7 +953,6 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
 fail_detach:
 	dma_buf_detach(dma_buf, attach);
-	dma_buf_put(dma_buf);
 
 	return ERR_PTR(ret);
 }
-- 
2.25.1

