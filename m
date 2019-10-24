Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBDDE3DAE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 22:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F3A6E13C;
	Thu, 24 Oct 2019 20:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353BD6E13C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 20:53:38 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9OKmxts114037;
 Thu, 24 Oct 2019 20:53:21 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2vqu4r61bf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 20:53:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9OKrJWv121105;
 Thu, 24 Oct 2019 20:53:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2vu0fq2cja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 20:53:20 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9OKrGkY009895;
 Thu, 24 Oct 2019 20:53:16 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Oct 2019 13:53:15 -0700
Date: Thu, 24 Oct 2019 23:53:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Eric Anholt <eric@anholt.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Message-ID: <20191024205306.GA14416@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9420
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910240196
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9420
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910240195
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=XzYkpls0mGKqdG0KuT3/x44DM6Nq0EWYShTlbULF7VQ=;
 b=HwvS4QFq5egQPgTBvuA02cbbyTBrC/K2DKEkfnhZlAySXlZLzKRdkU/yYFjDxMvjZYAO
 Nf40ZL+Kfy07xdpYxYwE/igAL96NCojH2gnOuHCIw7OgDIobyIWRWNMd8vn/TJZJtO+x
 QriwM40ddPL/HLeYJe+/mmwL+kQ45evDG+6q+RxyvL6MphcGbMxbSaX5fr3NmEvGc0Wv
 6B2pPwE+Xj5cndo0BDjIsMs60lecEYXMGB5CTqlQROVf56BYruCf98zMhe9jM0EXJZMR
 tM2VxEhrEE6Vf60Gak24m/xUj8sAbUs2TZ3ePyl0+PE6Wr6eA27fF2IiprJO/Dd2jNwR PQ== 
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

T3JpZ2luYWxseSB0aGlzIGVycm9yIHBhdGggdXNlZCB0byBsZWFrICJiaW4iIGJ1dCB0aGVuIHdl
IGFjY2lkZW50YWxseQphcHBsaWVkIHR3byBzZXBhcmF0ZSBjb21taXRzIHRvIGZpeCBpdCBhbmQg
ZW5kZWQgdXAgd2l0aCBhIGRvdWJsZSBmcmVlLgoKU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRl
ciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgotLS0KSGkgU3RlcGhlbiwKCkkgdGhpbmsgdGhp
cyBvbmUgaXMgYWN0dWFsbHkganVzdCBhIGxpbnV4LW5leHQgaXNzdWUgYW5kIHRoZSBGaXhlcyB0
YWcKd291bGQgcG9pbnQgdG8gY29tbWl0IGY4NTkzMzg0ZjgzZiAoIk1lcmdlIHJlbW90ZS10cmFj
a2luZyBicmFuY2gKJ2RybS9kcm0tbmV4dCciKS4KClRoZSBvcmlnaW5hbCBjb21taXRzIGFyZSAw
ZDM1MmEzYThhMWYgKCJkcm0vdjNkOiBkb24ndCBsZWFrIGJpbiBqb2IgaWYKdjNkX2pvYl9pbml0
IGZhaWxzLiIpIGFuZCBjb21taXQgMjljZDEzY2ZkNzYyICgiZHJtL3YzZDogRml4IG1lbW9yeSBs
ZWFrCmluIHYzZF9zdWJtaXRfY2xfaW9jdGwiKS4KCkknbSBub3QgdG90YWxseSBzdXJlIGhvdyB5
b3UgZ3V5cyBhZGRyZXNzIHRoaXMgbm9ybWFsbHkgYnV0IHByZXN1bWFibHkKeW91IGFyZSBleHBl
cnRzIGF0IGRlYWxpbmcgd2l0aCBtZXJnZSBpc3N1ZXMuICA6KQoKIGRyaXZlcnMvZ3B1L2RybS92
M2QvdjNkX2dlbS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3Yz
ZC92M2RfZ2VtLmMKaW5kZXggNTQ5ZGRlODM0MDhiLi4zNzUxNWU0N2I0N2UgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92M2Qv
djNkX2dlbS5jCkBAIC01NjgsNyArNTY4LDYgQEAgdjNkX3N1Ym1pdF9jbF9pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQlyZXQgPSB2M2Rfam9iX2luaXQodjNkLCBm
aWxlX3ByaXYsICZiaW4tPmJhc2UsCiAJCQkJICAgdjNkX2pvYl9mcmVlLCBhcmdzLT5pbl9zeW5j
X2JjbCk7CiAJCWlmIChyZXQpIHsKLQkJCWtmcmVlKGJpbik7CiAJCQl2M2Rfam9iX3B1dCgmcmVu
ZGVyLT5iYXNlKTsKIAkJCWtmcmVlKGJpbik7CiAJCQlyZXR1cm4gcmV0OwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
