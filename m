Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC08E65A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C1C6E28E;
	Thu, 15 Aug 2019 08:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370446E28E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 08:31:09 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7F8TBQx020959;
 Thu, 15 Aug 2019 08:31:04 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2u9nvphqkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 08:31:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7F8Rhr9030338;
 Thu, 15 Aug 2019 08:31:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2ucpys55a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 08:31:04 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7F8UvRg010467;
 Thu, 15 Aug 2019 08:30:58 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Aug 2019 01:30:57 -0700
Date: Thu, 15 Aug 2019 11:30:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: [PATCH] drm/vmwgfx: Fix double free in vmw_recv_msg()
Message-ID: <20190815083050.GC27238@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9349
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908150090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9349
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908150090
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=O+FokAWjhc+SD6T9nhAi78pTurLwDooPTqZWvPAkhdU=;
 b=Rguid/CDCd8P9Ka9TG9Ypz7zZuEtQ2wB/3r5XbAODziM7gISBDmyz5dVZkCNggXT/SuO
 j3flnBNVj3dccblHRa4Ynter++3FqwvMdDzZ7AKlGXk/oaJ3Ad6Vy4M8frECUxdJWGx1
 Z2E6AV28Jva5375z6L39ohIQ6W9iiY/MuiYCbgfP1ZccRe/PObkvDqsvH/9+xdaboZk1
 NYgcPjEt4MNNNOMbb3fi4MzyiVg5Cj5eAUK5EUhiUI6Vpk79H+d5M3hNhxyqzoUv6YMw
 bGuTtqQFj7P+BxMtkU7c++Gb1/QynZwPwgbZ44DuPIUi/Q59J54WVyBJPVEdM6ufN0eT fg== 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgcmVjZW50bHkgYWRkZWQgYSBrZnJlZSgpIGFmdGVyIHRoZSBlbmQgb2YgdGhlIGxvb3A6CgoJ
aWYgKHJldHJpZXMgPT0gUkVUUklFUykgewoJCWtmcmVlKHJlcGx5KTsKCQlyZXR1cm4gLUVJTlZB
TDsKCX0KClRoZXJlIGFyZSB0d28gcHJvYmxlbXMuICBGaXJzdCB0aGUgdGVzdCBpcyB3cm9uZyBh
bmQgYmVjYXVzZSByZXRyaWVzCmVxdWFscyBSRVRSSUVTIGlmIHdlIHN1Y2NlZWQgb24gdGhlIGxh
c3QgaXRlcmF0aW9uIHRocm91Z2ggdGhlIGxvb3AuClNlY29uZCBpZiB3ZSBmYWlsIG9uIHRoZSBs
YXN0IGl0ZXJhdGlvbiB0aHJvdWdoIHRoZSBsb29wIHRoZW4gdGhlIGtmcmVlCmlzIGEgZG91Ymxl
IGZyZWUuCgpXaGVuIHlvdSdyZSByZWFkaW5nIHRoaXMgY29kZSwgcGxlYXNlIG5vdGUgdGhlIGJy
ZWFrIHN0YXRlbWVudCBhdCB0aGUKZW5kIG9mIHRoZSB3aGlsZSBsb29wLiAgVGhpcyBwYXRjaCBj
aGFuZ2VzIHRoZSBsb29wIHNvIHRoYXQgaWYgaXQncyBub3QKc3VjY2Vzc2Z1bCB0aGVuICJyZXBs
eSIgaXMgTlVMTCBhbmQgd2UgY2FuIHRlc3QgZm9yIHRoYXQgYWZ0ZXJ3YXJkLgoKRml4ZXM6IDZi
N2MzYjg2ZjBiNiAoImRybS92bXdnZng6IGZpeCBtZW1vcnkgbGVhayB3aGVuIHRvbyBtYW55IHJl
dHJpZXMgaGF2ZSBvY2N1cnJlZCIpClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5j
YXJwZW50ZXJAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9t
c2cuYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfbXNn
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9tc2cuYwppbmRleCA1OWU5ZDA1YWI5
MjguLjBhZjA0OGQxYTgxNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfbXNnLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfbXNnLmMKQEAgLTM1
Myw3ICszNTMsNyBAQCBzdGF0aWMgaW50IHZtd19yZWN2X21zZyhzdHJ1Y3QgcnBjX2NoYW5uZWwg
KmNoYW5uZWwsIHZvaWQgKiptc2csCiAJCQkJICAgICAhIShISUdIX1dPUkQoZWN4KSAmIE1FU1NB
R0VfU1RBVFVTX0hCKSk7CiAJCWlmICgoSElHSF9XT1JEKGVieCkgJiBNRVNTQUdFX1NUQVRVU19T
VUNDRVNTKSA9PSAwKSB7CiAJCQlrZnJlZShyZXBseSk7Ci0KKwkJCXJlcGx5ID0gTlVMTDsKIAkJ
CWlmICgoSElHSF9XT1JEKGVieCkgJiBNRVNTQUdFX1NUQVRVU19DUFQpICE9IDApIHsKIAkJCQkv
KiBBIGNoZWNrcG9pbnQgb2NjdXJyZWQuIFJldHJ5LiAqLwogCQkJCWNvbnRpbnVlOwpAQCAtMzc3
LDcgKzM3Nyw3IEBAIHN0YXRpYyBpbnQgdm13X3JlY3ZfbXNnKHN0cnVjdCBycGNfY2hhbm5lbCAq
Y2hhbm5lbCwgdm9pZCAqKm1zZywKIAogCQlpZiAoKEhJR0hfV09SRChlY3gpICYgTUVTU0FHRV9T
VEFUVVNfU1VDQ0VTUykgPT0gMCkgewogCQkJa2ZyZWUocmVwbHkpOwotCisJCQlyZXBseSA9IE5V
TEw7CiAJCQlpZiAoKEhJR0hfV09SRChlY3gpICYgTUVTU0FHRV9TVEFUVVNfQ1BUKSAhPSAwKSB7
CiAJCQkJLyogQSBjaGVja3BvaW50IG9jY3VycmVkLiBSZXRyeS4gKi8KIAkJCQljb250aW51ZTsK
QEAgLTM4OSwxMCArMzg5LDggQEAgc3RhdGljIGludCB2bXdfcmVjdl9tc2coc3RydWN0IHJwY19j
aGFubmVsICpjaGFubmVsLCB2b2lkICoqbXNnLAogCQlicmVhazsKIAl9CiAKLQlpZiAocmV0cmll
cyA9PSBSRVRSSUVTKSB7Ci0JCWtmcmVlKHJlcGx5KTsKKwlpZiAoIXJlcGx5KQogCQlyZXR1cm4g
LUVJTlZBTDsKLQl9CiAKIAkqbXNnX2xlbiA9IHJlcGx5X2xlbjsKIAkqbXNnICAgICA9IHJlcGx5
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
