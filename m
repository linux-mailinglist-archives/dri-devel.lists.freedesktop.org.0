Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7FCB823
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 12:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296FA6EB17;
	Fri,  4 Oct 2019 10:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D356EB16
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 10:23:13 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x94AMe8G034304;
 Fri, 4 Oct 2019 10:23:08 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2va05sa90e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Oct 2019 10:23:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x94AIftW045278;
 Fri, 4 Oct 2019 10:23:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2vdt3pdguf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Oct 2019 10:23:07 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x94AN0ET030028;
 Fri, 4 Oct 2019 10:23:02 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 04 Oct 2019 03:23:00 -0700
Date: Fri, 4 Oct 2019 13:22:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/i810: Prevent underflow in ioctl
Message-ID: <20191004102251.GC823@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9399
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910040096
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9399
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910040096
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=swaVTqtr5y/z7JmmgDSDknFRcupEJeXLjsqarFMdI80=;
 b=I2h95FJdtEletzPZq92JHCKmVl+FDkvM6O9nEcDf40oGqhJ2ezdPN6bYpgfpsdVzanEI
 V6SO63YwFPsqby03b82MXXxKnjXJg08K/uIebEknmWcbdniauEtWzxZnI+HqeTryGGD1
 YX4cHdDyNsh2P5lcoEjL8tXLAtWA3PeaifTgxi6Dx4so+twknPI5rsM+mTt2VSMGY2cW
 J4HrElj+tUVY7EdfFTWQTJzZJIwXqRCf50HpQwzRdNSbuDNA7w94jSsB0AbgghjMBvZ/
 EVGI8I04gi9tPm+8qUwttaz8TAMxou3EUg2B/NzLyPDUzmHCr2pbZpAHre3b1Z4EJIG7 Tw== 
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJ1c2VkIiB2YXJpYWJsZXMgaGVyZSBjb21lIGZyb20gdGhlIHVzZXIgaW4gdGhlIGlvY3Rs
IGFuZCBpdCBjYW4gYmUKbmVnYXRpdmUuICBJdCBjb3VsZCByZXN1bHQgaW4gYW4gb3V0IG9mIGJv
dW5kcyB3cml0ZS4KClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
b3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2RtYS5jIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTgxMC9pODEwX2RtYS5jCmluZGV4IDJhNzc4MjNiOGU5YS4uZTY2YzM4MzMyZGY0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pODEwL2k4MTBfZG1hLmMKQEAgLTcyOCw3ICs3MjgsNyBAQCBzdGF0aWMgdm9pZCBpODEwX2Rt
YV9kaXNwYXRjaF92ZXJ0ZXgoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAobmJveCA+IEk4
MTBfTlJfU0FSRUFfQ0xJUFJFQ1RTKQogCQluYm94ID0gSTgxMF9OUl9TQVJFQV9DTElQUkVDVFM7
CiAKLQlpZiAodXNlZCA+IDQgKiAxMDI0KQorCWlmICh1c2VkIDwgMCB8fCB1c2VkID4gNCAqIDEw
MjQpCiAJCXVzZWQgPSAwOwogCiAJaWYgKHNhcmVhX3ByaXYtPmRpcnR5KQpAQCAtMTA0OCw3ICsx
MDQ4LDcgQEAgc3RhdGljIHZvaWQgaTgxMF9kbWFfZGlzcGF0Y2hfbWMoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgc3RydWN0IGRybV9idWYgKmJ1ZiwgaW4KIAlpZiAodSAhPSBJODEwX0JVRl9DTElF
TlQpCiAJCURSTV9ERUJVRygiTUMgZm91bmQgYnVmZmVyIHRoYXQgaXNuJ3QgbWluZSFcbiIpOwog
Ci0JaWYgKHVzZWQgPiA0ICogMTAyNCkKKwlpZiAodXNlZCA8IDAgfHwgdXNlZCA+IDQgKiAxMDI0
KQogCQl1c2VkID0gMDsKIAogCXNhcmVhX3ByaXYtPmRpcnR5ID0gMHg3ZjsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
