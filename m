Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C514D1F50
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 18:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27F210E2DC;
	Tue,  8 Mar 2022 17:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4959410E2DC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 17:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646761431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alZLDhY3ctKEsDcSiL/Qu/J5K/GOOm/V8wMQqvRO8KI=;
 b=Jy3AjAee/ussIpmLzbRa1KhuKHpYxT9AaFDnYdyPa79NNn02rK299y1RWgvXNSfaV4PDl+
 32kos9Rf4qbHG0IeyV8fZ13ugO6vPryjINmcvmSoK5UxFK+TCuSM6eEvp4M6CvOfIDRGd4
 Hky4/Z/i0DcxctpLA4dQEk+nt9uG24Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-PWD1tRqTPI2mTQluLvE8fw-1; Tue, 08 Mar 2022 12:43:50 -0500
X-MC-Unique: PWD1tRqTPI2mTQluLvE8fw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76C3D180A08C;
 Tue,  8 Mar 2022 17:43:48 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2ECE980FC8;
 Tue,  8 Mar 2022 17:43:42 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/mgag200: Fix PLL setup for g200wb and g200ew
Date: Tue,  8 Mar 2022 18:43:21 +0100
Message-Id: <20220308174321.225606-1-jfalempe@redhat.com>
In-Reply-To: <20220308171111.220557-1-jfalempe@redhat.com>
References: <20220308171111.220557-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: stable@vger.kernel.org, michel@daenzer.net,
 Jocelyn Falempe <jfalempe@redhat.com>, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit f86c3ed55920 ("drm/mgag200: Split PLL setup into compute and
 update functions") introduced a regression for g200wb and g200ew.
The PLLs are not set up properly, and VGA screen stays
black, or displays "out of range" message.

MGA1064_WB_PIX_PLLC_N/M/P was mistakenly replaced with
MGA1064_PIX_PLLC_N/M/P which have different addresses.

Patch tested on a Dell T310 with g200wb

Fixes: f86c3ed55920 ("drm/mgag200: Split PLL setup into compute and update functions")
Cc: stable@vger.kernel.org
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_pll.c b/drivers/gpu/drm/mgag200/mgag200_pll.c
index e9ae22b4f813..52be08b744ad 100644
--- a/drivers/gpu/drm/mgag200/mgag200_pll.c
+++ b/drivers/gpu/drm/mgag200/mgag200_pll.c
@@ -404,9 +404,9 @@ mgag200_pixpll_update_g200wb(struct mgag200_pll *pixpll, const struct mgag200_pl
 		udelay(50);
 
 		/* program pixel pll register */
-		WREG_DAC(MGA1064_PIX_PLLC_N, xpixpllcn);
-		WREG_DAC(MGA1064_PIX_PLLC_M, xpixpllcm);
-		WREG_DAC(MGA1064_PIX_PLLC_P, xpixpllcp);
+		WREG_DAC(MGA1064_WB_PIX_PLLC_N, xpixpllcn);
+		WREG_DAC(MGA1064_WB_PIX_PLLC_M, xpixpllcm);
+		WREG_DAC(MGA1064_WB_PIX_PLLC_P, xpixpllcp);
 
 		udelay(50);
 
-- 
2.35.1

