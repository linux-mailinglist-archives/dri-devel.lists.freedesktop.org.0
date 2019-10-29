Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49BDE8F31
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 19:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C1B6E50B;
	Tue, 29 Oct 2019 18:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EE46E50B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 18:24:55 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TI5FDj175951;
 Tue, 29 Oct 2019 18:23:40 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2vvdjub9ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 18:23:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TI8BBK179764;
 Tue, 29 Oct 2019 18:23:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2vxpfdgt2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 18:23:39 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9TINU14011472;
 Tue, 29 Oct 2019 18:23:30 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 29 Oct 2019 11:23:30 -0700
Date: Tue, 29 Oct 2019 21:23:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Andrea Righi <righi.andrea@gmail.com>
Subject: [PATCH] fbdev: potential information leak in do_fb_ioctl()
Message-ID: <20191029182320.GA17569@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290160
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290160
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=pvaGyOZDLlNqbGIv4aiDa+8jV2u8TRmd0Sg/3CdaYfQ=;
 b=GayfmIV97A/7KomJSAsydyBuszzE+3RDo1LCbszbUU03PKeOPpUsle4oX8Bz1eM7+QTg
 w17fUSx26ItlguIpsL8eUG0ZQzM19hMSpsyOjpclWpMjsMwnIU1OJ0G/0HZ9jt9TcWPu
 nc2WRwGPQVL9Ox2RSIbuHMSbPWSSss3mVfWN2ZOT14JMBpQIsvN3gB/FH1OC1i7XgMgI
 pKVgT+27FvJ6I9IkQhR7tVJmBVx3R9ZIPK8kaaHl/VEpXSNaajWQENUJs13sEKJacAWV
 fQuop4wCqvSb1Q1wLkFTAlw40mAmIgY55WNYNdaRCm4j8RVgdThKmUpTxLYJCbEjnlRz Jw== 
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
Cc: linux-fbdev@vger.kernel.org, security@kernel.org,
 Kees Cook <keescook@chromium.org>, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Julia Lawall <Julia.Lawall@lip6.fr>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJmaXgiIHN0cnVjdCBoYXMgYSAyIGJ5dGUgaG9sZSBhZnRlciAtPnl3cmFwc3RlcCBhbmQg
dGhlCiJmaXggPSBpbmZvLT5maXg7IiBhc3NpZ25tZW50IGRvZXNuJ3QgbmVjZXNzYXJpbHkgY2xl
YXIgaXQuICBJdCBkZXBlbmRzCm9uIHRoZSBjb21waWxlci4KCkZpeGVzOiAxZjVlMzFkN2U1NWEg
KCJmYm1lbTogZG9uJ3QgY2FsbCBjb3B5X2Zyb20vdG9fdXNlcigpIHdpdGggbXV0ZXggaGVsZCIp
ClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4K
LS0tCkkgaGF2ZSAxMyBtb3JlIHNpbWlsYXIgcGxhY2VzIHRvIHBhdGNoLi4uICBJJ20gbm90IHRv
dGFsbHkgc3VyZSBJCnVuZGVyc3RhbmQgYWxsIHRoZSBpc3N1ZXMgaW52b2x2ZWQuCgogZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIGIv
ZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKaW5kZXggNmY2ZmM3ODViNTQ1Li5iNGNl
NmEyOGFlZDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCisr
KyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCkBAIC0xMTA5LDYgKzExMDksNyBA
QCBzdGF0aWMgbG9uZyBkb19mYl9pb2N0bChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgdW5zaWduZWQg
aW50IGNtZCwKIAkJCXJldCA9IC1FRkFVTFQ7CiAJCWJyZWFrOwogCWNhc2UgRkJJT0dFVF9GU0NS
RUVOSU5GTzoKKwkJbWVtc2V0KCZmaXgsIDAsIHNpemVvZihmaXgpKTsKIAkJbG9ja19mYl9pbmZv
KGluZm8pOwogCQlmaXggPSBpbmZvLT5maXg7CiAJCWlmIChpbmZvLT5mbGFncyAmIEZCSU5GT19I
SURFX1NNRU1fU1RBUlQpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
