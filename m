Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277EDBB438
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C596B6E8B2;
	Mon, 23 Sep 2019 12:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FD56E8B2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:49:43 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.175])
 by regular1.263xmail.com (Postfix) with ESMTP id E437338F;
 Mon, 23 Sep 2019 20:49:40 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P28975T139999806740224S1569242970112868_; 
 Mon, 23 Sep 2019 20:49:40 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8fdb7c89ba2b5939547ac04f09273619>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, "Y.C. Chen" <yc_chen@aspeedtech.com>,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 20/36] drm/ast: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:49:12 +0800
Message-Id: <1569242968-183093-5-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242968-183093-1-git-send-email-hjc@rock-chips.com>
References: <1569242968-183093-1-git-send-email-hjc@rock-chips.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCmluZGV4IGMx
OTFlOGUuLjQzOWQwYjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKQEAgLTkzLDcgKzkzLDcgQEAg
c3RhdGljIGJvb2wgYXN0X2dldF92Ymlvc19tb2RlX2luZm8oc3RydWN0IGRybV9jcnRjICpjcnRj
LCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW8KIAl1MzIgaGJvcmRlciwgdmJvcmRlcjsKIAlib29sIGNo
ZWNrX3N5bmM7CiAKLQlzd2l0Y2ggKGZiLT5mb3JtYXQtPmNwcFswXSAqIDgpIHsKKwlzd2l0Y2gg
KGZiLT5mb3JtYXQtPmJwcFswXSkgewogCWNhc2UgODoKIAkJdmJpb3NfbW9kZS0+c3RkX3RhYmxl
ID0gJnZiaW9zX3N0ZHRhYmxlW1ZHQU1vZGVJbmRleF07CiAJCWNvbG9yX2luZGV4ID0gVkdBTW9k
ZUluZGV4IC0gMTsKQEAgLTIxNyw3ICsyMTcsNyBAQCBzdGF0aWMgYm9vbCBhc3RfZ2V0X3ZiaW9z
X21vZGVfaW5mbyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fZGlzcGxheV9tbwog
CQlpZiAodmJpb3NfbW9kZS0+ZW5oX3RhYmxlLT5mbGFncyAmIE5ld01vZGVJbmZvKSB7CiAJCQlh
c3Rfc2V0X2luZGV4X3JlZyhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIDB4OTEsIDB4YTgpOwogCQkJ
YXN0X3NldF9pbmRleF9yZWcoYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCAweDkyLAotCQkJCQkgIGZi
LT5mb3JtYXQtPmNwcFswXSAqIDgpOworCQkJCQkgIGZiLT5mb3JtYXQtPmJwcFswXSk7CiAJCQlh
c3Rfc2V0X2luZGV4X3JlZyhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIDB4OTMsIGFkanVzdGVkX21v
ZGUtPmNsb2NrIC8gMTAwMCk7CiAJCQlhc3Rfc2V0X2luZGV4X3JlZyhhc3QsIEFTVF9JT19DUlRD
X1BPUlQsIDB4OTQsIGFkanVzdGVkX21vZGUtPmNydGNfaGRpc3BsYXkpOwogCQkJYXN0X3NldF9p
bmRleF9yZWcoYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCAweDk1LCBhZGp1c3RlZF9tb2RlLT5jcnRj
X2hkaXNwbGF5ID4+IDgpOwpAQCAtNDIyLDcgKzQyMiw3IEBAIHN0YXRpYyB2b2lkIGFzdF9zZXRf
ZXh0X3JlZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpt
b2RlCiAJY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBjcnRjLT5wcmltYXJ5LT5m
YjsKIAl1OCBqcmVnQTAgPSAwLCBqcmVnQTMgPSAwLCBqcmVnQTggPSAwOwogCi0Jc3dpdGNoIChm
Yi0+Zm9ybWF0LT5jcHBbMF0gKiA4KSB7CisJc3dpdGNoIChmYi0+Zm9ybWF0LT5icHBbMF0pIHsK
IAljYXNlIDg6CiAJCWpyZWdBMCA9IDB4NzA7CiAJCWpyZWdBMyA9IDB4MDE7CkBAIC00ODAsNyAr
NDgwLDcgQEAgc3RhdGljIGJvb2wgYXN0X3NldF9kYWNfcmVnKHN0cnVjdCBkcm1fY3J0YyAqY3J0
Yywgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUKIHsKIAljb25zdCBzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYiA9IGNydGMtPnByaW1hcnktPmZiOwogCi0Jc3dpdGNoIChmYi0+Zm9ybWF0
LT5jcHBbMF0gKiA4KSB7CisJc3dpdGNoIChmYi0+Zm9ybWF0LT5icHBbMF0pIHsKIAljYXNlIDg6
CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0tIAoyLjcuNAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
