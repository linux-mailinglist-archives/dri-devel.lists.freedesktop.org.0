Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1ED2DBFB
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AF26E2DF;
	Wed, 29 May 2019 11:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DD56E2DF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 11:35:14 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TBT3Su069315;
 Wed, 29 May 2019 11:35:08 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 2spu7dh8w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 11:35:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TBYDZb058353;
 Wed, 29 May 2019 11:35:08 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2srbdxb84a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 11:35:08 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4TBZ688029299;
 Wed, 29 May 2019 11:35:06 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 May 2019 04:35:05 -0700
Date: Wed, 29 May 2019 14:34:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] drm/mcde: Fix an uninitialized variable
Message-ID: <20190529113458.GG19119@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905290078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905290078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=+b6PzCmzHOqCAsONZWcgBpVTvrx2iz0jbNueJJ48hsc=;
 b=ngoqhXYOn+ufxF85iD8LeCi6ji04piM98Lvi/UcN/Av9Oia6uLxEptBuHJ3XGNGzJFfo
 5RriIyCarntnSmkgthf+7cnUD9bwkZu6Q3ThaOqcdeS2cwhNBPQukicx920yrGhbqdZv
 /4CQtNmmk6nSsXS/fQgqTG7M/+XAxGoCV3VlnwhJGmR0eG15INKRF5Z7Kaa0K13oYdAS
 Kd2GmuDxIOchPmyQEu1z8kzjwEKHabRkdgm7+vsN3vK7byASgWdtjoVCp4fNv+oW8PbS
 gxkF30zBZs1YYPI/3jWAtItiKr8+cS186kUUT2ZgmH+nEEnGdGCcwEgRkRc3/NmsLr1/ 8Q== 
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmV2ZXIgc2V0ICJ2YmxhbmsiIHRvICJmYWxzZSIuCgpDdXJyZW50IHZlcnNpb25zIG9mIEdD
QyB3aWxsIGluaXRpYWxpemUgaXQgdG8gemVybyBhdXRvbWF0aWNhbGx5IGF0CmNlcnRhaW4gb3B0
aW1pemF0aW9uIGxldmVscyBzbyB0aGF0J3MgcHJvYmFibHkgd2h5IHRoaXMgZGlkbid0IHNob3cg
dXAKaW4gdGVzdGluZy4KCkZpeGVzOiA1ZmM1MzdiZmQwMDAgKCJkcm0vbWNkZTogQWRkIG5ldyBk
cml2ZXIgZm9yIFNULUVyaWNzc29uIE1DREUiKQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVy
IDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21jZGUvbWNk
ZV9kaXNwbGF5LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rpc3BsYXku
YyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZGlzcGxheS5jCmluZGV4IGYzZWYxMDhhNDFk
OS4uNzUxNDU0YWUzY2QxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rp
c3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rpc3BsYXkuYwpAQCAtNjUs
NyArNjUsNyBAQCBlbnVtIG1jZGVfZHNpX2Zvcm1hdHRlciB7CiB2b2lkIG1jZGVfZGlzcGxheV9p
cnEoc3RydWN0IG1jZGUgKm1jZGUpCiB7CiAJdTMyIG1pc3BwLCBtaXNvdmwsIG1pc2Nobmw7Ci0J
Ym9vbCB2Ymxhbms7CisJYm9vbCB2YmxhbmsgPSBmYWxzZTsKIAogCS8qIEhhbmRsZSBkaXNwbGF5
IElSUXMgKi8KIAltaXNwcCA9IHJlYWRsKG1jZGUtPnJlZ3MgKyBNQ0RFX01JU1BQKTsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
