Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100E336994C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 20:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B68E6EC25;
	Fri, 23 Apr 2021 18:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5F86E419
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 18:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619202127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnwUXuktq3XktOISO/1NK97hBW8acao1j5wHNN1fMSg=;
 b=gaq9xd1M5a0wEQwVNJvA6EjtCqt1W8tr8nA7casaoQrJbc5kDV6XJbbDTobrwtWwlMQPdk
 +k0YuyDIS4fmmpzwx9haRLkPKZXaYT8PrtvHTtT9xiDbxLYCNv7/9XnJgTNjJZGNE2KTTA
 J4L+XvP7y+kQTCzcfBbj46JcL0mTl9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-qFHRcptSMyq-AEa6BhKJLQ-1; Fri, 23 Apr 2021 14:22:05 -0400
X-MC-Unique: qFHRcptSMyq-AEa6BhKJLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49537343A3;
 Fri, 23 Apr 2021 18:22:04 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-114-74.rdu2.redhat.com [10.10.114.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17B69608BA;
 Fri, 23 Apr 2021 18:22:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/tegra: Fix DP AUX channel reference leaks
Date: Fri, 23 Apr 2021 14:21:46 -0400
Message-Id: <20210423182146.185633-3-lyude@redhat.com>
In-Reply-To: <20210423182146.185633-1-lyude@redhat.com>
References: <20210423182146.185633-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed while fixing the regression I introduced in Tegra that Tegra seems
to actually never release the device or module references it's grabbing for
the DP AUX channel. So, let's fix that by dropping them when appropriate.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/tegra/sor.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 4e0e3a63e586..474586e18d06 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3772,12 +3772,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
 
 	err = tegra_sor_parse_dt(sor);
 	if (err < 0)
-		return err;
+		goto put_aux;
 
 	err = tegra_output_probe(&sor->output);
-	if (err < 0)
-		return dev_err_probe(&pdev->dev, err,
-				     "failed to probe output\n");
+	if (err < 0) {
+		err = dev_err_probe(&pdev->dev, err, "failed to probe output\n");
+		goto put_aux;
+	}
 
 	if (sor->ops && sor->ops->probe) {
 		err = sor->ops->probe(sor);
@@ -3966,6 +3967,11 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 remove:
 	tegra_output_remove(&sor->output);
+put_aux:
+	if (sor->aux && sor->output.ddc) {
+		module_put(sor->aux->dev->driver->owner);
+		put_device(sor->aux->dev);
+	}
 	return err;
 }
 
@@ -3985,6 +3991,11 @@ static int tegra_sor_remove(struct platform_device *pdev)
 
 	tegra_output_remove(&sor->output);
 
+	if (sor->aux && sor->output.ddc) {
+		module_put(sor->aux->dev->driver->owner);
+		put_device(sor->aux->dev);
+	}
+
 	return 0;
 }
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
