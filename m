Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E224B5C9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4796E351;
	Wed, 19 Jun 2019 10:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C971C6E34D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:02:05 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J9xA9V010668;
 Wed, 19 Jun 2019 10:01:54 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2t7809aewc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 10:01:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JA19V6142777;
 Wed, 19 Jun 2019 10:01:53 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2t77yn0bb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 10:01:53 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5JA1mow025338;
 Wed, 19 Jun 2019 10:01:49 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 03:01:47 -0700
Date: Wed, 19 Jun 2019 13:01:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] drm: self_refresh: Fix a reversed condition in
 drm_self_refresh_helper_cleanup()
Message-ID: <20190619100141.GA28596@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190083
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=kLj8ZQ4NWy3sWgqEOEEsZOAICsA5ZWqeqT2DhancBZQ=;
 b=ymkn3DZPcDzkFic/lihIYR4HQ0aCCLXtqNeYDCjT0FDfVey2F1t+g8UbWHNZ8nyte8wx
 93rE2Kx6DMscmh+Lm/yzUGhhe5gKr+6yRiopYV1o8kuobNCRgXXbaxZ0wXZb8UGlRo50
 6YnfdEKHioqJVtT9xeI+DsmumPOARw0k00TqnwIxaFVgHviWPjD3e9THxV3xPHJx6T27
 8YciTSoAdyUNmSTffrHG0Siv8zYk2cIpQewOJZXNp5hAF+45+tAP4a8LUNre98NVEBNM
 c9JBN0Un7PxZFozfChUYMCA98T4BRZfXYCO6J1FUHEiOGP2BObYlIbA8RRApXSQZvn8L 8A== 
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB0ZXN0IGlzIGZsaXBwZWQgYXJvdW5kIHNvIGl0IGVpdGhlciBsZWFkcyB0byBhIG1lbW9y
eSBsZWFrIG9yIGEKTlVMTCBkZXJlZmVyZW5jZS4KCkZpeGVzOiAxNDUyYzI1YjBlNjAgKCJkcm06
IEFkZCBoZWxwZXJzIHRvIGtpY2sgb2ZmIHNlbGYgcmVmcmVzaCBtb2RlIGluIGRyaXZlcnMiKQpT
aWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Ci0t
LQpJJ20gbm90IHRvdGFsbHkgc3VyZSB3aGF0IHRoZSBwcmVmZXJlZCBwYXRjaCBwcmVmaXggZm9y
IHRoaXMgY29kZS4gIE9uZQp0aGluZyB0aGF0IHdvdWxkIGhlbHAgaXMgd2hlbiB3ZSdyZSBhZGRp
bmcgbmV3IGZpbGVzIHdlIHNob3VsZCBzcGVjaWZ5CnRoZSBwcmVmaXggdGhhdCB0aGV5J3JlIGdv
aW5nIHRvIHVzZToKCi0gZHJtOiBBZGQgaGVscGVycyB0byBraWNrIG9mZiBzZWxmIHJlZnJlc2gg
bW9kZSBpbiBkcml2ZXJzCisgZHJtOiByZWZyZXNoIG1vZGU6IEFkZCBoZWxwZXJzIHRvIGtpY2sg
b2ZmIHNlbGYgcmVmcmVzaCBtb2RlIGluIGRyaXZlcnMKCkl0J3MgYSBzbWFsbCB0aGluZyBhbmQg
ZW1haWwgYWx3YXlzIHNvdW5kcyB3aGlueSBidXQgSSdtIHNlbmRpbmcgdGhpcwpzdWdnZXN0aW9u
IHRvIGV2ZXJ5b25lIHRvZGF5IHNvLi4uCgogZHJpdmVycy9ncHUvZHJtL2RybV9zZWxmX3JlZnJl
c2hfaGVscGVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9o
ZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZyZXNoX2hlbHBlci5jCmluZGV4
IDJiM2RhYWY3Nzg0MS4uZTBkMmFkMWYwNzBjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZf
cmVmcmVzaF9oZWxwZXIuYwpAQCAtMjA1LDcgKzIwNSw3IEBAIHZvaWQgZHJtX3NlbGZfcmVmcmVz
aF9oZWxwZXJfY2xlYW51cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJc3RydWN0IGRybV9zZWxm
X3JlZnJlc2hfZGF0YSAqc3JfZGF0YSA9IGNydGMtPnNlbGZfcmVmcmVzaF9kYXRhOwogCiAJLyog
SGVscGVyIGlzIGFscmVhZHkgdW5pbml0aWFsaXplZCAqLwotCWlmIChzcl9kYXRhKQorCWlmICgh
c3JfZGF0YSkKIAkJcmV0dXJuOwogCiAJY3J0Yy0+c2VsZl9yZWZyZXNoX2RhdGEgPSBOVUxMOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
