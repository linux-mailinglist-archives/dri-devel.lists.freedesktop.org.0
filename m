Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9C19734D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFE76E91C;
	Wed, 21 Aug 2019 07:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71766E91C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 07:25:12 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7L7Nsnp096645;
 Wed, 21 Aug 2019 07:25:07 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2ue9hpkdcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 07:25:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7L7NjYE094845;
 Wed, 21 Aug 2019 07:25:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2ugj7q4e0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 07:25:06 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7L7P31V001215;
 Wed, 21 Aug 2019 07:25:04 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Aug 2019 00:25:03 -0700
Date: Wed, 21 Aug 2019 10:24:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: [PATCH] drm/tinydrm: fix a loop in debugfs code
Message-ID: <20190821072456.GJ26957@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908210080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210080
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=1YiOw5vp2IiMUEcQ5k4z28G1MhXaEeAqH3xKQ4ND+0g=;
 b=V24qK2/zGD47e5njbolQsWso2DYednOqMm+XjcJIvZdUnQQKDceklMwx8Q8TeY2AsJTw
 VEuDGfNvMj5R+IluIBIPccay/F21c7yxucTkiJmhHydgFm3L6e5x5zl/Q6PD8iFFHTvW
 VgHzcJ/co3lgIgt4Xqkxq0BRgFPe8A4A0L4L7xvz8qXC1Be2DuV0XWRpnb/WHkhQ3FxH
 lUvNXLnMbomzMUBr2LDSw66d4KMM1ZCQ0FlZB0YA5HsPqIF3LCimVZrllpv6Y6PRewup
 l75TqTGABfblS3GPsdIHShTbrfI3osPWshp1Qz6Gn4qGR4eXUJvo8Ybrshajcy5Gt/ul Pw== 
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjb2RlIHdpbGwgbGlrZWx5IGNyYXNoIGlmIHdlIHRyeSB0byBkbyBhIHplcm8gYnl0ZSB3
cml0ZS4gIFRoZSBjb2RlCmxvb2tzIGxpa2UgdGhpczoKCiAgICAgICAgLyogc3RyaXAgdHJhaWxp
bmcgd2hpdGVzcGFjZSAqLwogICAgICAgIGZvciAoaSA9IGNvdW50IC0gMTsgaSA+IDA7IGktLSkK
ICAgICAgICAgICAgICAgIGlmIChpc3NwYWNlKGJ1ZltpXSkpCgkJCS4uLgoKV2UncmUgd3JpdGlu
ZyB6ZXJvIGJ5dGVzIHNvIGNvdW50ID0gMC4gIFlvdSB3b3VsZCB0aGluayB0aGF0ICJjb3VudCAt
IDEiCndvdWxkIGJlIG5lZ2F0aXZlIG9uZSwgYnV0IGJlY2F1c2UgImkiIGlzIHVuc2lnbmVkIGl0
IGlzIGEgbGFyZ2UKcG9zaXRpdmUgbnVtZXIgaW5zdGVhZC4gIFRoZSAiaSA+IDAiIGNvbmRpdGlv
biBpcyB0cnVlIGFuZCB0aGUgImJ1ZltpXSIKYWNjZXNzIHdpbGwgYmUgb3V0IG9mIGJvdW5kcy4K
ClRoZSBmaXggaXMgdG8gbWFrZSAiaSIgc2lnbmVkIGFuZCBub3cgZXZlcnl0aGluZyB3b3JrcyBh
cyBleHBlY3RlZC4gIFRoZQp1cHBlciBib3VuZCBvZiAiY291bnQiIGlzIGNhcHBlZCBpbiBfX2tl
cm5lbF93cml0ZSgpIGF0IE1BWF9SV19DT1VOVCBzbwp3ZSBkb24ndCBoYXZlIHRvIHdvcnJ5IGFi
b3V0IGl0IGJlaW5nIGhpZ2hlciB0aGFuIElOVF9NQVguCgpGaXhlczogMDJkZDk1ZmUzMTY5ICgi
ZHJtL3Rpbnlkcm06IEFkZCBNSVBJIERCSSBzdXBwb3J0IikKU2lnbmVkLW9mZi1ieTogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fbWlwaV9kYmkuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jCmluZGV4IDE5NjFmNzEzYWFhYi4uYzRl
ZTI3MDlhNmYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jCkBAIC0xMTg3LDggKzExODcsNyBAQCBz
dGF0aWMgc3NpemVfdCBtaXBpX2RiaV9kZWJ1Z2ZzX2NvbW1hbmRfd3JpdGUoc3RydWN0IGZpbGUg
KmZpbGUsCiAJc3RydWN0IG1pcGlfZGJpX2RldiAqZGJpZGV2ID0gbS0+cHJpdmF0ZTsKIAl1OCB2
YWwsIGNtZCA9IDAsIHBhcmFtZXRlcnNbNjRdOwogCWNoYXIgKmJ1ZiwgKnBvcywgKnRva2VuOwot
CXVuc2lnbmVkIGludCBpOwotCWludCByZXQsIGlkeDsKKwlpbnQgaSwgcmV0LCBpZHg7CiAKIAlp
ZiAoIWRybV9kZXZfZW50ZXIoJmRiaWRldi0+ZHJtLCAmaWR4KSkKIAkJcmV0dXJuIC1FTk9ERVY7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
