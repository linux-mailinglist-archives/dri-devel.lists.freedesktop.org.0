Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA6B51A125
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D7B10ECF3;
	Wed,  4 May 2022 13:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D7E10F0C9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651671658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3E2rsJXZMfi5AGg/cyIGaUPfUdjTHQuGFK+mlvzyolY=;
 b=aVPGydDxUIFslISKoXor8JoqPR+4WqFM5x/IL3yFhrzcg/RMBeodBLa0N/weEvwNzUnN8t
 Hy3ONHVy0gdBuH3k6+PEB0q56IEdtrUvXXi4lYkOCXKs9zU3xE6r7hRBIrZYZDMWBwQFy/
 wYz6pNe99y6aMjgb8CXCvyGAbWfe6QA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-QzDcj9vwPYeUODNdjPkflg-1; Wed, 04 May 2022 09:40:52 -0400
X-MC-Unique: QzDcj9vwPYeUODNdjPkflg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5BF9185A7A4;
 Wed,  4 May 2022 13:40:51 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CABD6C28101;
 Wed,  4 May 2022 13:40:50 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
	lyude@redhat.com,
	tzimmermann@suse.de
Subject: [PATCH v2 3/3] mgag200: Warn once if trying to set start address on
 broken hardware.
Date: Wed,  4 May 2022 15:40:26 +0200
Message-Id: <20220504134026.283417-4-jfalempe@redhat.com>
In-Reply-To: <20220504134026.283417-1-jfalempe@redhat.com>
References: <20220504134026.283417-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some MGA200 hardware are broken, and can't use a start address > 0

v2: Warn if startaddr is not 0, and hw doesn't support it.
  (instead of removing MGAG200_FLAG_HW_BUG_NO_STARTADD)

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 2bc380a85996..d2cf26b3cee0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -223,6 +223,9 @@ static void mgag200_set_startadd(struct mga_device *mdev,
 
 	startadd = offset / 8;
 
+	if (startadd > 0)
+		drm_WARN_ON_ONCE(dev, mdev->flags & MGAG200_FLAG_HW_BUG_NO_STARTADD);
+
 	/*
 	 * Can't store addresses any higher than that, but we also
 	 * don't have more than 16 MiB of memory, so it should be fine.
-- 
2.35.1

