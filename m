Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F412584B7D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 14:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4EC6E6C2;
	Wed,  7 Aug 2019 12:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0766E6C0;
 Wed,  7 Aug 2019 12:28:58 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x77CJ2Qw002975;
 Wed, 7 Aug 2019 12:28:48 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2u52wrbyxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Aug 2019 12:28:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x77CHtEf159810;
 Wed, 7 Aug 2019 12:28:47 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2u75bwd2q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Aug 2019 12:28:47 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x77CSfHG019271;
 Wed, 7 Aug 2019 12:28:41 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 07 Aug 2019 05:28:40 -0700
Date: Wed, 7 Aug 2019 15:28:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH] drm/i915: Fix some NULL vs IS_ERR() conditions
Message-ID: <20190807122832.GA10517@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9341
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908070137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9341
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908070137
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=skuCuQ4hN4RPMv++ey4fYGda1N9xL/Wcg5MzIe+uAfE=;
 b=4ZJ4+w1r8LbQyQgSg8Zfv9Oyffgz612/+TCaNqaDK8Wc5F+KKZNwUIuoJI+RPJnrlyz4
 xzjQxQjut1SqlUG7DDesFkK3UP5dme0/1LaP7sRxDEnSKkY3ZFAXXfeMtBWj+Dy9560R
 qU2gY2jMHeinUCLibu+q2CStrY10rijQMp815n/btXavrE8Z5WzZIsMjpWdIUqFNiBEb
 I+8GMrDB1tOlwRrstH5aq2OCVcMrQ51s0koA56FcloaHsX8yBS99IQzRog4e3MqyRNBo
 qflQu8WY5dtWO6NCX0Bl1f/c8ZVO/a2NEEZ7+WLUwJGocSjpzfu7H+paqrF5F+bEQkLQ Kg== 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgd2VyZSBzZXZlcmFsIHBsYWNlcyB3aGljaCBjaGVjayBmb3IgTlVMTCB3aGVuIHRoZXkg
c2hvdWxkIGhhdmUKYmVlbiBjaGVja2luZyBmb3IgSVNfRVJSKCkuCgpGaXhlczogZDhhZjA1ZmYz
OGFlICgiZHJtL2k5MTU6IEFsbG93IHNoYXJpbmcgdGhlIGlkbGUtYmFycmllciBmcm9tIG90aGVy
IGtlcm5lbCByZXF1ZXN0cyIpClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF9j
b250ZXh0LmMgfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L3NlbGZ0ZXN0X2NvbnRleHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3Nl
bGZ0ZXN0X2NvbnRleHQuYwppbmRleCBkMzliNTU5NGNiMDIuLjZlN2U5YTZmZDIzNSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfY29udGV4dC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X2NvbnRleHQuYwpAQCAtODYsOCArODYsOCBA
QCBzdGF0aWMgaW50IF9fbGl2ZV9hY3RpdmVfY29udGV4dChzdHJ1Y3QgaW50ZWxfZW5naW5lX2Nz
ICplbmdpbmUsCiAJfQogCiAJY2UgPSBpbnRlbF9jb250ZXh0X2NyZWF0ZShmaXhtZSwgZW5naW5l
KTsKLQlpZiAoIWNlKQotCQlyZXR1cm4gLUVOT01FTTsKKwlpZiAoSVNfRVJSKGNlKSkKKwkJcmV0
dXJuIFBUUl9FUlIoY2UpOwogCiAJZm9yIChwYXNzID0gMDsgcGFzcyA8PSAyOyBwYXNzKyspIHsK
IAkJc3RydWN0IGk5MTVfcmVxdWVzdCAqcnE7CkBAIC0xNjEsOCArMTYxLDggQEAgc3RhdGljIGlu
dCBsaXZlX2FjdGl2ZV9jb250ZXh0KHZvaWQgKmFyZykKIAltdXRleF9sb2NrKCZndC0+aTkxNS0+
ZHJtLnN0cnVjdF9tdXRleCk7CiAKIAlmaXhtZSA9IGxpdmVfY29udGV4dChndC0+aTkxNSwgZmls
ZSk7Ci0JaWYgKCFmaXhtZSkgewotCQllcnIgPSAtRU5PTUVNOworCWlmIChJU19FUlIoZml4bWUp
KSB7CisJCWVyciA9IFBUUl9FUlIoZml4bWUpOwogCQlnb3RvIHVubG9jazsKIAl9CiAKQEAgLTIy
NiwxMiArMjI2LDEyIEBAIHN0YXRpYyBpbnQgX19saXZlX3JlbW90ZV9jb250ZXh0KHN0cnVjdCBp
bnRlbF9lbmdpbmVfY3MgKmVuZ2luZSwKIAkgKi8KIAogCXJlbW90ZSA9IGludGVsX2NvbnRleHRf
Y3JlYXRlKGZpeG1lLCBlbmdpbmUpOwotCWlmICghcmVtb3RlKQotCQlyZXR1cm4gLUVOT01FTTsK
KwlpZiAoSVNfRVJSKHJlbW90ZSkpCisJCXJldHVybiBQVFJfRVJSKHJlbW90ZSk7CiAKIAlsb2Nh
bCA9IGludGVsX2NvbnRleHRfY3JlYXRlKGZpeG1lLCBlbmdpbmUpOwotCWlmICghbG9jYWwpIHsK
LQkJZXJyID0gLUVOT01FTTsKKwlpZiAoSVNfRVJSKGxvY2FsKSkgeworCQllcnIgPSBQVFJfRVJS
KGxvY2FsKTsKIAkJZ290byBlcnJfcmVtb3RlOwogCX0KIApAQCAtMjc0LDggKzI3NCw4IEBAIHN0
YXRpYyBpbnQgbGl2ZV9yZW1vdGVfY29udGV4dCh2b2lkICphcmcpCiAJbXV0ZXhfbG9jaygmZ3Qt
Pmk5MTUtPmRybS5zdHJ1Y3RfbXV0ZXgpOwogCiAJZml4bWUgPSBsaXZlX2NvbnRleHQoZ3QtPmk5
MTUsIGZpbGUpOwotCWlmICghZml4bWUpIHsKLQkJZXJyID0gLUVOT01FTTsKKwlpZiAoSVNfRVJS
KGZpeG1lKSkgeworCQllcnIgPSBQVFJfRVJSKGZpeG1lKTsKIAkJZ290byB1bmxvY2s7CiAJfQog
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
