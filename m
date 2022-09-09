Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BBE5B36CA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3733B10E040;
	Fri,  9 Sep 2022 11:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CAE10E040
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662724615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pj2w22L/gCJSd0xe+TcxiePzeqM8Jq7mS0yk2aQQO5M=;
 b=BRQUZzR2kUFloiKfkiuTnMEoM9bZGpzonADjuc3czY6TWmmjrsA4SQmXa0+ycxstPtcH7j
 RCACdIcmQecjmzQ5e/qZ+Ot5obAtFSJQNmbS+r2oOqceSDPzrO9WZWPclzHLb9tD4Xje5Y
 YHzKdssWBXoflh+muTQhWSsSWwUMVRQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-kla6Q5KjPvSUpXi7HF6Jlg-1; Fri, 09 Sep 2022 07:56:54 -0400
X-MC-Unique: kla6Q5KjPvSUpXi7HF6Jlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD242293248E;
 Fri,  9 Sep 2022 11:56:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 396741410F36;
 Fri,  9 Sep 2022 11:56:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 1/6] drm/gma500: Wait longer for the GPU to power-down
Date: Fri,  9 Sep 2022 13:56:41 +0200
Message-Id: <20220909115646.99920-2-hdegoede@redhat.com>
In-Reply-To: <20220909115646.99920-1-hdegoede@redhat.com>
References: <20220909115646.99920-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On a cedartrail during boot the following error was logged each boot:

[   12.168341] gma500 0000:00:02.0: GPU: power management timed out.

Increase the timeout to fix this.

Sometimes the display also failed to come up properly (userspace was
running normally, but the LCD was showing all black as contents).
Hopefully this also fix this issue.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/cdv_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index ce96234f3df2..ff5104fe5692 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -230,7 +230,7 @@ static void cdv_init_pm(struct drm_device *dev)
 		u32 pwr_sts = inl(dev_priv->apm_base + PSB_APM_STS);
 		if ((pwr_sts & PSB_PWRGT_GFX_MASK) == 0)
 			return;
-		udelay(10);
+		usleep_range(100, 1000);
 	}
 	dev_err(dev->dev, "GPU: power management timed out.\n");
 }
-- 
2.37.2

