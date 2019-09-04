Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24191A7FFA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 12:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6DA8925E;
	Wed,  4 Sep 2019 10:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B943D8925E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 10:06:02 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84A4CCN123300;
 Wed, 4 Sep 2019 10:05:49 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2utb5yr0ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Sep 2019 10:05:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84A3UTr124734;
 Wed, 4 Sep 2019 10:03:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2us5phxehv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Sep 2019 10:03:42 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x84A3b00028553;
 Wed, 4 Sep 2019 10:03:37 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 04 Sep 2019 03:03:36 -0700
Date: Wed, 4 Sep 2019 13:03:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190904100329.GE7007@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909040100
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909040100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=1pbyPUZ5EEtRV82fn90ZdgEccg0SrdakAzKxHScHT/U=;
 b=b0aetbA7LwUIAYLLZ7f7Uk/p74nbKkUflQXc0F6FIvbrJyIrbReJWw/j+6yGC8ne3noE
 fIIRbfho/5iqK2JVbrbnC2vjyYzdW5ImzJLChQ0me3Ux5V32y4NkNyqLReh0yFgpVzfm
 1gNyO7KHi6DIRqVATi+WfmbHcj8aZG4tOL8tWxhHi33Nl3mNeyZkvkkwwWfyBuH4NIyz
 OjNSt4XrN78fiW/do+lFruewMenInkVSgnUYishq3qvRKqfvB97S+WuOrZ31w0iG9u1o
 Zp+tFFPN8xyIrXV1DgDzIuuzqOoysAOjA7j/+DwbJRHZk3j3po9PxZeoEEDDSw6Kem7X 5w== 
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
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJsdmRzLT5iYWNrbGlnaHQiIHBvaW50ZXIgY291bGQgYmUgTlVMbCBpZiBvZl9wYXJzZV9w
aGFuZGxlKCkKcmV0dXJucyBOVUxMLgoKRml4ZXM6IDdjOWRmZjViZDY0MyAoImRybTogcGFuZWxz
OiBBZGQgTFZEUyBwYW5lbCBkcml2ZXIiKQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQG9yYWNsZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LWx2ZHMuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMKaW5kZXggYWQ0N2NjOTU0NTllLi4z
YjRlYjk1OWU5OTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRz
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYwpAQCAtMjcyLDcgKzI3
Miw4IEBAIHN0YXRpYyBpbnQgcGFuZWxfbHZkc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCXJldHVybiAwOwogCiBlcnJvcjoKLQlwdXRfZGV2aWNlKCZsdmRzLT5iYWNrbGln
aHQtPmRldik7CisJaWYgKGx2ZHMtPmJhY2tsaWdodCkKKwkJcHV0X2RldmljZSgmbHZkcy0+YmFj
a2xpZ2h0LT5kZXYpOwogCXJldHVybiByZXQ7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
