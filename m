Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3024A140
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 14:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE21D6E157;
	Tue, 18 Jun 2019 12:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D676E157
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 12:58:44 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5ICwcCV017719;
 Tue, 18 Jun 2019 12:58:38 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2t4r3tmcgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 12:58:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5ICuRgp090773;
 Tue, 18 Jun 2019 12:56:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2t5mgbxb29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 12:56:36 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5ICuWbl031932;
 Tue, 18 Jun 2019 12:56:32 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 18 Jun 2019 05:56:32 -0700
Date: Tue, 18 Jun 2019 15:56:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH] drm: return -EFAULT if copy_one_buf() fails
Message-ID: <20190618125623.GA24896@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906180106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906180107
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=VN1nlMuLCcvI+mqE18BsBbvixn8Eid8foVg4TrsGDOU=;
 b=Jw1oD4jYzSIQ/3hgo/6oZt6Rlx7VNXOMTIpAmMDTdVZIoIEODjjTskwOO6NQ0PxhpFcA
 tEG4wowNMlAPi6z0eSLjGJjfwAsuXjjKgEr6tptuYpoywTcd9Xd+RvuLMpS1Rq3mCiKe
 DqJvM/SAr/tx65B32Q8LZFoRNWq1H/BwtXszFbLmrfVDLUX+DlcTzrQXr/0cQe9XAY8u
 wMMTvfSbcPlYPnSiOSPxHG/pvJVIyDySqgKgfDaQtcngHk2mDcsPix+2MeOhn8dJjo86
 89d/TWMRXsgdVF3RrH9kpUAlzXZeDJyKkbJSdzUod27WW41aD3ICj8VCmnSRpJp9nyQJ Ug== 
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvcHlfdG9fdXNlcigpIGZ1bmN0aW9uIHJldHVybnMgdGhlIG51bWJlciBvZiBieXRlcyBy
ZW1haW5pbmcgdG8gYmUKY29waWVkLCBidXQgd2Ugd2FudCB0byByZXR1cm4gLUVGQVVMVC4gIFRo
aXMgZnVuY3Rpb24gaXMgY2FsbGVkIGZyb20KX19kcm1fbGVnYWN5X2luZm9idWZzKCkgd2hpY2gg
ZXhwZWN0cyBuZWdhdGl2ZSBlcnJvciBjb2Rlcy4KCkZpeGVzOiA1Yzc2NDBhYjYyNTggKCJzd2l0
Y2ggY29tcGF0X2RybV9pbmZvYnVmcygpIHRvIGRybV9pb2N0bF9rZXJuZWwoKSIpClNpZ25lZC1v
ZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KLS0tClRoaXMg
Z29lcyB0aHJvdWdoIEFsJ3MgdHJlZSBhbmQgbm90IHRocm91Z2ggZHJtLiAgUHJlc3VtYWJseSB0
aGlzIHBhdGNoCndpbGwganVzdCBnZXQgZm9sZGVkIGludG8gdGhlIG9yaWdpbmFsLgoKIGRyaXZl
cnMvZ3B1L2RybS9kcm1fYnVmcy5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
YnVmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9idWZzLmMKaW5kZXggNjhkYWNmODQyMmM2Li44
Y2U5ZDczZmFiNGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnVmcy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fYnVmcy5jCkBAIC0xMzUxLDcgKzEzNTEsMTAgQEAgc3RhdGlj
IGludCBjb3B5X29uZV9idWYodm9pZCAqZGF0YSwgaW50IGNvdW50LCBzdHJ1Y3QgZHJtX2J1Zl9l
bnRyeSAqZnJvbSkKIAkJCQkgLnNpemUgPSBmcm9tLT5idWZfc2l6ZSwKIAkJCQkgLmxvd19tYXJr
ID0gZnJvbS0+bG93X21hcmssCiAJCQkJIC5oaWdoX21hcmsgPSBmcm9tLT5oaWdoX21hcmt9Owot
CXJldHVybiBjb3B5X3RvX3VzZXIodG8sICZ2LCBvZmZzZXRvZihzdHJ1Y3QgZHJtX2J1Zl9kZXNj
LCBmbGFncykpOworCisJaWYgKGNvcHlfdG9fdXNlcih0bywgJnYsIG9mZnNldG9mKHN0cnVjdCBk
cm1fYnVmX2Rlc2MsIGZsYWdzKSkpCisJCXJldHVybiAtRUZBVUxUOworCXJldHVybiAwOwogfQog
CiBpbnQgZHJtX2xlZ2FjeV9pbmZvYnVmcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
