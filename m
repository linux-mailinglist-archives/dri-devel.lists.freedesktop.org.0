Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E434D67D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 20:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1BA6E4AF;
	Mon, 29 Mar 2021 18:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2E86E4AE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 18:01:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 8E10D8014E;
 Mon, 29 Mar 2021 20:01:30 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/gud: Free buffers on device removal
Date: Mon, 29 Mar 2021 20:01:19 +0200
Message-Id: <20210329180120.27380-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=PJ4hB8iC c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=HTPZWQiB1uwTuIkOn24A:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: peter@stuge.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJlZSB0cmFuc2ZlciBhbmQgY29tcHJlc3Npb24gYnVmZmVycyBvbiBkZXZpY2UgcmVtb3ZhbCBp
bnN0ZWFkIG9mIGF0CkRSTSBkZXZpY2UgcmVtb3ZhbCB0aW1lLiBUaGlzIGVuc3VyZXMgdGhhdCB0
aGUgdXN1YWwgMng4TUIgYnVmZmVycyBhcmUKcmVsZWFzZWQgd2hlbiB0aGUgZGV2aWNlIGlzIHVu
cGx1Z2dlZCBhbmQgbm90IGtlcHQgYXJvdW5kIHNob3VsZAp1c2Vyc3BhY2Uga2VlcCB0aGUgRFJN
IGRldmljZSBmZCBvcGVuLgoKQXQgbGVhc3QgVWJ1bnR1IDIwLjA0IGRvZXNuJ3QgcmVsZWFzZSB0
aGUgRFJNIGRldmljZSBvbiB1bnBsdWcuCgpTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMg
PG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9kcnYuYyB8
IDggKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZ3VkL2d1ZF9kcnYuYwppbmRleCBlOGI2NzJkYzk4MzIuLjgyMGM3MzMxYjNiMyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfZHJ2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2d1ZC9ndWRfZHJ2LmMKQEAgLTM5NCwxMiArMzk0LDE0IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2RyaXZlciBndWRfZHJtX2RyaXZlciA9IHsKIAkubWlub3IJCQk9IDAsCiB9Owog
Ci1zdGF0aWMgdm9pZCBndWRfZnJlZV9idWZmZXJzX2FuZF9tdXRleChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtLCB2b2lkICp1bnVzZWQpCitzdGF0aWMgdm9pZCBndWRfZnJlZV9idWZmZXJzX2FuZF9t
dXRleCh2b2lkICpkYXRhKQogewotCXN0cnVjdCBndWRfZGV2aWNlICpnZHJtID0gdG9fZ3VkX2Rl
dmljZShkcm0pOworCXN0cnVjdCBndWRfZGV2aWNlICpnZHJtID0gZGF0YTsKIAogCXZmcmVlKGdk
cm0tPmNvbXByZXNzX2J1Zik7CisJZ2RybS0+Y29tcHJlc3NfYnVmID0gTlVMTDsKIAlrZnJlZShn
ZHJtLT5idWxrX2J1Zik7CisJZ2RybS0+YnVsa19idWYgPSBOVUxMOwogCW11dGV4X2Rlc3Ryb3ko
Jmdkcm0tPmN0cmxfbG9jayk7CiAJbXV0ZXhfZGVzdHJveSgmZ2RybS0+ZGFtYWdlX2xvY2spOwog
fQpAQCAtNDU1LDcgKzQ1Nyw3IEBAIHN0YXRpYyBpbnQgZ3VkX3Byb2JlKHN0cnVjdCB1c2JfaW50
ZXJmYWNlICppbnRmLCBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCAqaWQpCiAJSU5JVF9XT1JL
KCZnZHJtLT53b3JrLCBndWRfZmx1c2hfd29yayk7CiAJZ3VkX2NsZWFyX2RhbWFnZShnZHJtKTsK
IAotCXJldCA9IGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldChkcm0sIGd1ZF9mcmVlX2J1ZmZlcnNf
YW5kX211dGV4LCBOVUxMKTsKKwlyZXQgPSBkZXZtX2FkZF9hY3Rpb24oZGV2LCBndWRfZnJlZV9i
dWZmZXJzX2FuZF9tdXRleCwgZ2RybSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
