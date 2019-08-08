Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDA385FB3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 12:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2824F6E489;
	Thu,  8 Aug 2019 10:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A325E6E489;
 Thu,  8 Aug 2019 10:32:54 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x78ASYqu050949;
 Thu, 8 Aug 2019 10:32:49 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2u8has8afa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Aug 2019 10:32:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x78AWY1E042945;
 Thu, 8 Aug 2019 10:32:48 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2u763k4a6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Aug 2019 10:32:48 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x78AWk2L023433;
 Thu, 8 Aug 2019 10:32:46 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 08 Aug 2019 03:32:45 -0700
Date: Thu, 8 Aug 2019 13:32:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Xiong Zhang <xiong.y.zhang@intel.com>
Subject: [PATCH] drm/i915: Use after free in error path in
 intel_vgpu_create_workload()
Message-ID: <20190808103236.GB30506@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=981
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908080115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908080115
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=U9mddLpT2oUhwBIhERUm/ujj+fo8KPR88Op7z8fL3zg=;
 b=Wh9F6bdu1qu5UBHaCR4GmvIVoL/cPFnP7sfqeOBmGQnat9NUOucR08M6Pvu8VdF464BN
 ZD4+8Eh9cWN8QGmG77SJzS+GnxEE9qAzv7X9z0SnuKPZBwIRY7s9K6xHAhtDqU2vKSXI
 DgNQwNwFi2gRMN8UmFPdB6xGXAblwPKkTG4wzU0NToSyLxCHW6Twe9GlrJhazdTvr6xT
 6iVXe5qncXAa+wqnWQ4rm6c/gPGSr8OyNmhrvX3cXSh9cmpNAoEdvK/zZSEXcIKPdEQ/
 pxAIoMJ34jISq1l9AhNj9B9xbYq+CnBGCfha4VUxbVeDrXq8kbuFPPbM3ZqOXYcDHXH3 4w== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=U9mddLpT2oUhwBIhERUm/ujj+fo8KPR88Op7z8fL3zg=;
 b=x54brwplD4yOwO/nP374W2vXcxn0rUdNTACsLxsWTMMSlm4/NuclMEG4hhd276AQNLux
 /ToFbClkLBibox3uBbSTtIxKszgAcCysR/uQW/fkqfJh5oc47Y5lUiOUehw3pCtAWXuM
 g3Uu1JA2gceg6VCVugbhp1Z0ztVeZdVq09cAjs03r1IYVlVSN+oQIsDvEOucLtByUIT9
 x6LVXNngfzKuttaz71sEKhHUFeNCsu1RwdS5HQlp2JEoyQNF/wTvaGhhnqMHiFuZjhCQ
 Em3WQJ5M7P0ktyQT2OV7i6F4ylpsJTl7g0IpKyPY2L+h+ZXKoJ4infjm/59lYVl6UIxi Lg== 
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuJ3QgZnJlZSAid29ya2xvYWQiIHVudGlsIGFmdGVyIHRoZSBwcmludGsgb3IgaXQncyBh
IHVzZSBhZnRlcgpmcmVlLgoKRml4ZXM6IDIwODlhNzZhZGU5MCAoImRybS9pOTE1L2d2dDogQ2hl
Y2tpbmcgd29ya2xvYWQncyBnbWEgZWFybGllciIpClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50
ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvc2NoZWR1bGVyLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3Nj
aGVkdWxlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCmluZGV4IDMy
YWU2YjViN2UxNi4uYWMxZGJiMTc2ODc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvc2NoZWR1bGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxl
ci5jCkBAIC0xNTI1LDkgKzE1MjUsOSBAQCBpbnRlbF92Z3B1X2NyZWF0ZV93b3JrbG9hZChzdHJ1
Y3QgaW50ZWxfdmdwdSAqdmdwdSwgaW50IHJpbmdfaWQsCiAJCQlpZiAoIWludGVsX2d2dF9nZ3R0
X3ZhbGlkYXRlX3JhbmdlKHZncHUsCiAJCQkJd29ya2xvYWQtPndhX2N0eC5pbmRpcmVjdF9jdHgu
Z3Vlc3RfZ21hLAogCQkJCXdvcmtsb2FkLT53YV9jdHguaW5kaXJlY3RfY3R4LnNpemUpKSB7Ci0J
CQkJa21lbV9jYWNoZV9mcmVlKHMtPndvcmtsb2Fkcywgd29ya2xvYWQpOwogCQkJCWd2dF92Z3B1
X2VycigiaW52YWxpZCB3YV9jdHggYXQ6IDB4JWx4XG4iLAogCQkJCSAgICB3b3JrbG9hZC0+d2Ff
Y3R4LmluZGlyZWN0X2N0eC5ndWVzdF9nbWEpOworCQkJCWttZW1fY2FjaGVfZnJlZShzLT53b3Jr
bG9hZHMsIHdvcmtsb2FkKTsKIAkJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKIAkJCX0KIAkJ
fQpAQCAtMTUzOSw5ICsxNTM5LDkgQEAgaW50ZWxfdmdwdV9jcmVhdGVfd29ya2xvYWQoc3RydWN0
IGludGVsX3ZncHUgKnZncHUsIGludCByaW5nX2lkLAogCQkJaWYgKCFpbnRlbF9ndnRfZ2d0dF92
YWxpZGF0ZV9yYW5nZSh2Z3B1LAogCQkJCXdvcmtsb2FkLT53YV9jdHgucGVyX2N0eC5ndWVzdF9n
bWEsCiAJCQkJQ0FDSEVMSU5FX0JZVEVTKSkgewotCQkJCWttZW1fY2FjaGVfZnJlZShzLT53b3Jr
bG9hZHMsIHdvcmtsb2FkKTsKIAkJCQlndnRfdmdwdV9lcnIoImludmFsaWQgcGVyX2N0eCBhdDog
MHglbHhcbiIsCiAJCQkJCXdvcmtsb2FkLT53YV9jdHgucGVyX2N0eC5ndWVzdF9nbWEpOworCQkJ
CWttZW1fY2FjaGVfZnJlZShzLT53b3JrbG9hZHMsIHdvcmtsb2FkKTsKIAkJCQlyZXR1cm4gRVJS
X1BUUigtRUlOVkFMKTsKIAkJCX0KIAkJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
