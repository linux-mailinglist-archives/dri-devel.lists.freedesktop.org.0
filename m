Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1742229A394
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 05:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A564B6E088;
	Tue, 27 Oct 2020 04:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CB76E088
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 04:15:39 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201027041537epoutp0463379a193af7fc7d581222050c344282~BvkMBsMjW0097800978epoutp04i
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 04:15:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201027041537epoutp0463379a193af7fc7d581222050c344282~BvkMBsMjW0097800978epoutp04i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1603772137;
 bh=vv7sDp/CWxEzC6FM8S+ckIPvRwYpNMTZ7LMulkjKrh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WB77jJc1uKZswG4sC6bF1jNuvSWmkV7irazYhXgM6IL8bi2h7jm3WUnrMKRWDMV5s
 l1Y5vMAYtweoBVNjaKNWUm3JNIJEGo62kU1EoHIRlBpJ9bCRCZQQNxTlo351UfmpAx
 MIkX0f+OJ1xIF2R+1x68NI6TrkxOfwucKP1a/4Lk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201027041536epcas1p29b2187c7149fdf43c441fcd670274667~BvkLa_lGx1220212202epcas1p22;
 Tue, 27 Oct 2020 04:15:36 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.158]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4CKyzq2k96zMqYkV; Tue, 27 Oct
 2020 04:15:35 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 07.24.09582.7EE979F5; Tue, 27 Oct 2020 13:15:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20201027041535epcas1p489bbfe80b461f1e5c5deca1a571f1f35~BvkJ4Y-rs2999929999epcas1p4R;
 Tue, 27 Oct 2020 04:15:35 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201027041535epsmtrp23b7ad5e93cebe299ba687e370e58cdd2~BvkJ3bo7N3020530205epsmtrp2J;
 Tue, 27 Oct 2020 04:15:35 +0000 (GMT)
X-AuditID: b6c32a37-8afff7000000256e-28-5f979ee7af8c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 0E.69.08745.6EE979F5; Tue, 27 Oct 2020 13:15:34 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201027041534epsmtip1bf950b6be90a1d2d8a61053b26a74705~BvkJmh0iy2894628946epsmtip1c;
 Tue, 27 Oct 2020 04:15:34 +0000 (GMT)
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
To: maxime@cerno.tech, eric@anholt.net, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org
Subject: [PATCH 1/1] drm/vc4: drv: Add error handding for bind
Date: Tue, 27 Oct 2020 13:14:42 +0900
Message-Id: <20201027041442.30352-2-hoegeun.kwon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027041442.30352-1-hoegeun.kwon@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0wbZRjHfe+uR8F1nt10byph7HQmdKFQusIxKerWNKfbDIoxzhC7hp60
 UtqmR3VzmtVtJV2hbGwyJlA2I4gBYaQSVpvgSrdCRAcoCJE6h7owVwIlFthk+KPtYfS/7/Pk
 832fH+/DR4VuXMTXGysZi1FjIPEUrO9qhiTzdkuDOntu5mHKNfIVQnW5ghj1d18dSs27P8ao
 C9dGeNTEcgSn/O+PAyrS7sQpz6+TPGrc14xTdaGeJOr8vb8AZe+/lkR5WwbAMxvpY5FBnG68
 eR2nfxwZxen+lYsY7ek4idOXV2Z49M3qIYT+vPUobQ+uYnRtbwego560ogdfKy/QMRotY0ln
 jKUmrd5YpiD3Fqv3qOW52dJMaT6VR6YbNRWMglTuK8pU6Q2xMcj0tzQGayxVpGFZMquwwGKy
 VjLpOhNbqSAZs9ZgzjdLWE0FazWWSUpNFbuk2dk58hh4sFx33RlCzGO8Q3fag6gNzGJOkMyH
 xE7o+LIJcYIUvpDwAni8qh7jgt8BjAb9vDglJKIA2ieTnYCfcLimrBzjA7AnVA+4IMbc+OV+
 woATmXC5ZgqJ682EGk66qnhxCCU6EDjibU3U3kQUQs+JIBrXGLEdhn3fJQwCQgEH5z9Cuf62
 ws4ef0Inx/hPR6N4/CFItPHh6t3FJA5SwvnwnwinN8HwUO96XgSjC/04p1k48WEY48w2AE/V
 Na1DMnil7SwSnw0lMuAlXxaX3ga/uO8GcY0SG+HCcg2PG18AHVVCDnkSztq4DUEiFQ672tdb
 oGG4c2h9K3UAtoVasNMgrfG/ChcB6ACPMma2ooxhpWbZ/7/MAxJ3Ks7zgnPzi5IAQPggACAf
 JTcLmlPr1UKBVnP4HcZiUlusBoYNAHlse3Wo6JFSU+zQjZVqqTxHJpNRO6W5cqmU3CJY2+FQ
 C4kyTSVTzjBmxvKvD+Eni2zINBGQTxd/Wx26xO9uOjxsl7zgIFP3Vh/6YP+ZgMot7hqWaOei
 8pLu+k8eG1vVHXgostsmPjK+dEHl3LXboVT1nT66IXIbFDyR25TSb6s+O3uGRT8jn+UFTpTQ
 P5+fyae7hed+erOzZmV5JKrNGKTe85cr9E9LkAa7dezrLbbgy2+7O5tPfvPHhqVj2/X3Cmfk
 t7S9nsV9vhd79D/sMEbuXGnetrQ1dcH2wEDj1Hg4r1UxGryb0XWkxHdw4tWuWqWjd+BxynFc
 5Z+eWntK5MrqnXt9v2DN/e6AqPiA+bnfbiBXva3fv9IwmvaGsmO+UVwqzpnSXr6156XaweeV
 3cZTbQYXibE6jVSMWljNP7Rr90owBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsWy7bCSnO6zedPjDc7tM7foPXeSyWJt71EW
 i//bJjJbvJ27mMVi/pFzrBZXvr5nszjQeJnR4v3yLjaLTY+vsVpc3jWHzWLi7Q3sFjN+/GO0
 aN17hN1ix7yDjA58Hk3vj7F5zLp/ls3jzrnzbB57vy1g8di0qpPNY/u3B6we97uPM3lsXlLv
 0Xr0F4tH35ZVjB6fN8kFcEdx2aSk5mSWpRbp2yVwZZztus1UcIG14uXyo8wNjM9Yuhg5OCQE
 TCR6r5d2MXJyCAnsYJSY/VgWxJYQkJFY1b+FFaJEWOLw4eIuRi6gko+MEl+/LmIHqWET0JX4
 2nOdCcQWEUiVaHt/hAWkiFlgE5NE38keRpCEsICdxKaWo8wgNouAqsSrXZfAGngFbCWOvV3I
 DLFMXmL1hgNgNidQ/Yrzn9kgDrKV+HOglWUCI98CRoZVjJKpBcW56bnFhgVGeanlesWJucWl
 eel6yfm5mxjBIa+ltYNxz6oPeocYmTgYDzFKcDArifDOkZkaL8SbklhZlVqUH19UmpNafIhR
 moNFSZz366yFcUIC6YklqdmpqQWpRTBZJg5OqQammhN550VquKtFQwo4uru2W1c/1zz5f/GO
 HOl8lYaSpRcsRLiPh875rdZ9L2F9ysxaN9cbH8IyIt22e0w5U+ohZntZW3eWnVvYB8eiK5Zn
 Vb+JakrVL/n9ck+79NNtnFs9dIIZ+O6f3GaauW/3g+U/vLYIrzBJnn/3Q0+W3sktKSYsnFKX
 29SiH0quS+68bezv8Oh27SFDU6v4sn5dm5iEjij9ay77Y0U8llkKyuz7Nqm56sBF+yNdzz7M
 bZBw1HMQf9llzflikZxz+woLkzi3XTZ9d7X8LnTN9V+5dNWnWreut5fCXm3XziuuT4pziaiR
 2MbiL/CJNUUmRbA451jM4llhZ6fKd1Wsyjy1UomlOCPRUIu5qDgRACiDybPoAgAA
X-CMS-MailID: 20201027041535epcas1p489bbfe80b461f1e5c5deca1a571f1f35
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201027041535epcas1p489bbfe80b461f1e5c5deca1a571f1f35
References: <20201027041442.30352-1-hoegeun.kwon@samsung.com>
 <CGME20201027041535epcas1p489bbfe80b461f1e5c5deca1a571f1f35@epcas1p4.samsung.com>
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
Cc: devicetree@vger.kernel.org, sungguk.na@samsung.com,
 dave.stevenson@raspberrypi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, hoegeun.kwon@samsung.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a problem that if vc4_drm bind fails, a memory leak occurs on
the drm_property_create side. Add error handding for drm_mode_config.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index f1a5fd5dab6f..a17aa1db11b6 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -314,6 +314,7 @@ static int vc4_drm_bind(struct device *dev)
 	component_unbind_all(dev, drm);
 gem_destroy:
 	vc4_gem_destroy(drm);
+	drm_mode_config_cleanup(drm);
 	vc4_bo_cache_destroy(drm);
 dev_put:
 	drm_dev_put(drm);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
