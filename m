Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8B3B7439
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DD76FA3B;
	Thu, 19 Sep 2019 07:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786936F407;
 Wed, 18 Sep 2019 16:31:42 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8IGNYFC178508;
 Wed, 18 Sep 2019 16:31:40 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2v385e53u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 16:31:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8IGMrLq173711;
 Wed, 18 Sep 2019 16:31:40 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2v37mmwqag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 16:31:39 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8IGVbII022554;
 Wed, 18 Sep 2019 16:31:37 GMT
Received: from x250.idc.oracle.com (/10.191.241.104)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Sep 2019 09:31:36 -0700
From: Allen Pais <allen.pais@oracle.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/radeon: fix a potential NULL pointer dereference
Date: Wed, 18 Sep 2019 22:01:22 +0530
Message-Id: <1568824282-4081-1-git-send-email-allen.pais@oracle.com>
X-Mailer: git-send-email 1.9.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=984
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909180156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909180156
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=JOeXBgFpap6hbPYDZwnqzFOoJIRBSAjBdsCXmG6t548=;
 b=czwpzDkkypI7XnCJTlhZfQIRHfQ1TIxg/tUVDvIvei/9QZR1yFMse4SzKendmNuGp/wU
 W9JgU58BsZriqRa2mMBubDk4gQCII8tuE89mLRRxH4Kh2DEh5AhPJuHsNTh/hItjMYiV
 TIaFAaQMATXRpXlZ8U8tVBBSkxCNANX13b2mqFn90/dvVwYaShftic7rDaXekeuUsUbX
 YDzndLBPRIX2CbL5iI8CaKRVr0yB1naWdFKmDU2K1OJsXpvcyJSbRvMGctjL5KejkiRA
 gyvn7q+UNejGztkVpqgOV2uBVNQxE5tOxxX0Zh5PxEMnONH//vSo2vynBOAXRCXXKcWm hA== 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YWxsb2Nfd29ya3F1ZXVlIGlzIG5vdCBjaGVja2VkIGZvciBlcnJvcnMgYW5kIGFzIGEgcmVzdWx0
LAphIHBvdGVudGlhbCBOVUxMIGRlcmVmZXJlbmNlIGNvdWxkIG9jY3VyLgoKU2lnbmVkLW9mZi1i
eTogQWxsZW4gUGFpcyA8YWxsZW4ucGFpc0BvcmFjbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rp
c3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYwppbmRleCBi
ZDUyZjE1Li4xYTQxNzY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5j
CkBAIC02ODMsNiArNjgzLDEwIEBAIHN0YXRpYyB2b2lkIHJhZGVvbl9jcnRjX2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgaW50IGluZGV4KQogCWRybV9tb2RlX2NydGNfc2V0X2dhbW1hX3Np
emUoJnJhZGVvbl9jcnRjLT5iYXNlLCAyNTYpOwogCXJhZGVvbl9jcnRjLT5jcnRjX2lkID0gaW5k
ZXg7CiAJcmFkZW9uX2NydGMtPmZsaXBfcXVldWUgPSBhbGxvY193b3JrcXVldWUoInJhZGVvbi1j
cnRjIiwgV1FfSElHSFBSSSwgMCk7CisJaWYgKHVubGlrZWx5KCFyYWRlb25fY3J0Yy0+ZmxpcF9x
dWV1ZSkpIHsKKwkJa2ZyZWUocmFkZW9uX2NydGMpOworCQlyZXR1cm47CisJfQogCXJkZXYtPm1v
ZGVfaW5mby5jcnRjc1tpbmRleF0gPSByYWRlb25fY3J0YzsKIAogCWlmIChyZGV2LT5mYW1pbHkg
Pj0gQ0hJUF9CT05BSVJFKSB7Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
