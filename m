Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB408A914FC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752CC10EA32;
	Thu, 17 Apr 2025 07:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="R6pz/zx2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Wed, 16 Apr 2025 09:44:36 UTC
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6912510E8BA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:44:36 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250416093608epoutp035a026267e6f3ecc5629bb4726a898942~2wt7n3fUa1304013040epoutp03F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:36:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250416093608epoutp035a026267e6f3ecc5629bb4726a898942~2wt7n3fUa1304013040epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1744796168;
 bh=QdnL6XR0UVOrOeO0QZOgKOjZM7nJvKwUrWtc5DUomoo=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=R6pz/zx23EihM/W1oWuvLW3ODrSfwxm/ORz5/pprRbT1JGUJH6ehltDS1Lo6Af/MS
 LHmRJLf8mL9thkCGXvhI90pRc4B/muh1KinxWet8rMamo0w9CE3jLJKseKEbwibf8I
 v7Kd4maIMZJPrbJ+Ssz2TM5pYYCooiiAv/0BN+0A=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20250416093607epcas5p2e700aa8c95b46799f4ad94cf2c65c290~2wt7K21q72786127861epcas5p23;
 Wed, 16 Apr 2025 09:36:07 +0000 (GMT)
X-AuditID: b6c32a49-b61ff700000027a0-4c-67ff7a07702b
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B1.C9.10144.70A7FF76; Wed, 16 Apr 2025 18:36:07 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH] drm/edid: fixed the bug that hdr metadata was not cleared
From: =?UTF-8?B?5p2O6aOe5aif?= <feijuan.li@samsung.com>
To: "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: =?UTF-8?B?5ZSQ57qi6aOe?= <hongfei.tang@samsung.com>,
 =?UTF-8?B?5Lil5piO6LS1?= <minggui.yan@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p3>
Date: Wed, 16 Apr 2025 18:36:07 +0900
X-CMS-MailID: 20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsWy7bCmli571f90g+s/1C1OXF/EZHHl63s2
 i039jYwWK77MZLe4vGsOm8XCj1tZLG7/7mCzaOtcxmox+91+dostbyayOnB57P22gMVj56y7
 7B6bVnWyecw7Gehxv/s4k0ffllWMHptPV3t83iQXwBHFZZOSmpNZllqkb5fAlfHq+QeWgs0c
 Fe/XbmBuYJzF3sXIySEhYCLx8/c31i5GLg4hgd2MEov2TGLsYuTg4BUQlPi7QxikRljAS+LG
 +jNg9UICChLrvk1hAikRFrCUeLY1HcRkEzCXWHUxE2SKiMAGZoltu6czgZQzC+RKnP/0iA1i
 Fa/EjPanLBC2tMT25VsZIWxRiZur37LD2O+PzYeKi0i03jvLDGELSjz4uZsRpnfNnJtQM/Ml
 nm5ZzQ6yWEKghVHi4NktrBAJc4l9LVfBhvIK+Eoc2jYdbDGLgKrE/YajUINcJF40zmOGOFRe
 YvvbOcwgzzALaEqs36UPEeaT6P39hAnm/h3zYGwViUNr2qFWSUkc2b0f6n4PifZr25ggQRUo
 cfPENMYJjHKzEAE6C8myWQjLFjAyr2KUTC0ozk1PLTYtMMxLLdcrTswtLs1L10vOz93ECE42
 Wp47GO8++KB3iJGJg/EQowQHs5II7znzf+lCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeZt3tqQL
 CaQnlqRmp6YWpBbBZJk4OKUamBrsF804znP2n9rH2tvKN48dN9Y69fl4i1Ox8UKW56uufDPu
 rkvvr70X2XTzSn26vO6iqmVFYYoPrTsaN50SeLppWWj991OfJ5ocN3g04b3yZQ/3pM1XxN8v
 ujB5wZ73vhuiGDf8bzvwWsNyz8LiHZqrWvhzZmkGdIrV9Dyfmby0jufzAp80RcOOC+27VWId
 JiVEVlretNu7r+H/oeJPTJv/Ry/+1v/6YNfvrIxtH2WDFP9Nf3wqiWGn83GZhAVXzELnfYrl
 lGST5tffJnw7Vnfqew6Gqz1LP4UqSb7+riRVOHvDdOV71YfzJ+3Pi9WVPbJyQ/9BjtsnhOXj
 nWONhGunLWFV0WdsP1Kukvzk/jslluKMREMt5qLiRAAMunZgpQMAAA==
X-CMS-RootMailID: 20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388
References: <CGME20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p3>
X-Mailman-Approved-At: Thu, 17 Apr 2025 07:22:17 +0000
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
Reply-To: feijuan.li@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From a34a1e2dd7aacd45f18775564fce12b03ae4009c Mon Sep 17 00:00:00 2001
From: "feijuan.li" <feijuan.li@samsung.com>
Date: Wed, 16 Apr 2025 11:07:39 +0000
Subject: [PATCH] drm/edid: fixed the bug that hdr metadata was not cleared

When DP connected to a device with HDR capability,
the hdr structure was filled.Then connected to another
sink device without hdr capability, but the hdr info
still exist.

Signed-off-by: feijuan.li <feijuan.li@samsung.com>
---
 drivers/gpu/drm/drm_edid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13bc4c290b17..5cf5d30321b6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5607,6 +5607,7 @@ static void clear_eld(struct drm_connector *connector)
 {
 	mutex_lock(&connector->eld_mutex);
 	memset(connector->eld, 0, sizeof(connector->eld));
+	memset(&connector->hdr_sink_metadata, 0, sizeof(connector->hdr_sink_metadata));
 	mutex_unlock(&connector->eld_mutex);
 
 	connector->latency_present[0] = false;
-- 
2.25.1

