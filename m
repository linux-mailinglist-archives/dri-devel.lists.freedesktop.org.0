Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A9CCDDE1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 11:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77346E4DD;
	Mon,  7 Oct 2019 09:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173C26E4DD;
 Mon,  7 Oct 2019 09:02:23 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x978xNGV034568;
 Mon, 7 Oct 2019 09:02:18 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2vejku5hd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Oct 2019 09:02:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x978xQqS190026;
 Mon, 7 Oct 2019 09:02:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2vf4ph5dc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Oct 2019 09:02:17 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9792ESe013268;
 Mon, 7 Oct 2019 09:02:15 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 07 Oct 2019 02:02:13 -0700
Date: Mon, 7 Oct 2019 12:02:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rex Zhu <rex.zhu@amd.com>, Kevin Wang <Kevin1.Wang@amd.com>
Subject: [PATCH] drm/amd/powerplay: Fix error handling in
 smu_init_fb_allocations()
Message-ID: <20191007090206.GD3865@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910070094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910070094
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=+9sHUYnl7Rq+MROQDknEnBJdttxVkDtS1pV81Z5rZ1E=;
 b=EP8ROu7c7AAtB35Z3jPzS9AaJNaSP6VU/KPnfD5rGV6SEXoWQTRJvdQE6KpYgudecmwA
 t55Sy8Spy8OWIURTtIgjlhotoyb/KvzkX7RhbLpNMOGdxWQu1qPEcc1O6Y9qU2TQK1Th
 Pujs4hEubYwtwER0fmHFLrs+a7UUjr9enxnL5aotmabUP1WxPaK1ojtf+BxPpEfPvPXr
 r/h9j+3Lo7XQZcifZ6qXWE4Zxp2e90TV+759MVF6GtzTCC3R+WdUV/ArQ2LZjRFqmRpm
 M2kITIS9HFnCcSjBTkUtXdsOA7Y5wGEAAVFtdiThS5kMBMe4rIwJDXAXlbhiqWtr8mnx 7g== 
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGVycm9yIGhhbmRsaW5nIGlzIG9mZiBieSBvbmUuICBXZSBzaG91bGQgbm90IGZyZWUgdGhl
IGZpcnN0CiJ0YWJsZXNbaV0uYm8iIHdpdGhvdXQgZGVjcmVtZW50aW5nICJpIiBiZWNhdXNlIHRo
YXQgbWlnaHQgcmVzdWx0IGluIGEKZG91YmxlIGZyZWUuICBUaGUgc2Vjb25kIHByb2JsZW0gaXMg
dGhhdCB3aGVuIGFuIGVycm9yIG9jY3VycywgdGhlbiB0aGUKemVyb3RoIGVsZW1lbnQgInRhYmxl
c1swXS5ibyIgaXNuJ3QgZnJlZWQuCgpJIGhhZCBtYWtlICJpIiBzaWduZWQgaW50IGZvciB0aGUg
ZXJyb3IgaGFuZGxpbmcgdG8gd29yaywgc28gSSBqdXN0CnVwZGF0ZWQgInJldCIgYXMgd2VsbCBh
cyBhIGNsZWFuIHVwLgoKRml4ZXM6IGY5NjM1N2E5OTFiOSAoImRybS9hbWQvcG93ZXJwbGF5OiBp
bXBsZW1lbnQgc211X2luaXQoZmluaSlfZmJfYWxsb2NhdGlvbnMgZnVuY3Rpb24iKQpTaWduZWQt
b2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgNSArKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggZjFmYmJjOGI3N2VlLi5jOTI2NmVh
NzAzMzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAg
LTg5Niw4ICs4OTYsNyBAQCBzdGF0aWMgaW50IHNtdV9pbml0X2ZiX2FsbG9jYXRpb25zKHN0cnVj
dCBzbXVfY29udGV4dCAqc211KQogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gc211LT5h
ZGV2OwogCXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqc211X3RhYmxlID0gJnNtdS0+c211X3Rh
YmxlOwogCXN0cnVjdCBzbXVfdGFibGUgKnRhYmxlcyA9IHNtdV90YWJsZS0+dGFibGVzOwotCXVp
bnQzMl90IGkgPSAwOwotCWludDMyX3QgcmV0ID0gMDsKKwlpbnQgcmV0LCBpOwogCiAJZm9yIChp
ID0gMDsgaSA8IFNNVV9UQUJMRV9DT1VOVDsgaSsrKSB7CiAJCWlmICh0YWJsZXNbaV0uc2l6ZSA9
PSAwKQpAQCAtOTE1LDcgKzkxNCw3IEBAIHN0YXRpYyBpbnQgc211X2luaXRfZmJfYWxsb2NhdGlv
bnMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAKIAlyZXR1cm4gMDsKIGZhaWxlZDoKLQlmb3Ig
KDsgaSA+IDA7IGktLSkgeworCXdoaWxlICgtLWkgPj0gMCkgewogCQlpZiAodGFibGVzW2ldLnNp
emUgPT0gMCkKIAkJCWNvbnRpbnVlOwogCQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnRhYmxlc1tp
XS5ibywKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
