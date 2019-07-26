Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9C476707
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D836ED45;
	Fri, 26 Jul 2019 13:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EC26ED41
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D2B1FFB04;
 Fri, 26 Jul 2019 15:14:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yg1X5hpL5aQt; Fri, 26 Jul 2019 15:14:44 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 3374D46AA4; Fri, 26 Jul 2019 15:14:40 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm/panel: jh057n00900: Use drm_panel_{unprepare,
 disable} consistently
Date: Fri, 26 Jul 2019 15:14:39 +0200
Message-Id: <a37dd5083462064f437ff62fd84e6576d8a7c8dc.1564146727.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1564146727.git.agx@sigxcpu.org>
References: <cover.1564146727.git.agx@sigxcpu.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugd2VyZSBhbHJlYWR5IHVzaW5nIHRoZSBnZW5lcmljIGZ1bmN0aW9ucyBpbiBvdXIgZGVidWdm
cyBjb2RlLCBkbyB0aGUKc2FtZSBpbiBqaDA1N25fc2h1dGRvd24uIFRoaXMgd2FzIHN1Z2dlc3Rl
ZCBieSBTYW0gUmF2bmJvcmcuCgpTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNp
Z3hjcHUub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1
N24wMDkwMC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2Nr
dGVjaC1qaDA1N24wMDkwMC5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNo
LWpoMDU3bjAwOTAwLmMKaW5kZXggMTAzN2EyMDFiNGJiLi5iOTEwOTkyMjM5N2YgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCkBA
IC0zNzIsMTIgKzM3MiwxMiBAQCBzdGF0aWMgdm9pZCBqaDA1N25fc2h1dGRvd24oc3RydWN0IG1p
cGlfZHNpX2RldmljZSAqZHNpKQogCXN0cnVjdCBqaDA1N24gKmN0eCA9IG1pcGlfZHNpX2dldF9k
cnZkYXRhKGRzaSk7CiAJaW50IHJldDsKIAotCXJldCA9IGpoMDU3bl91bnByZXBhcmUoJmN0eC0+
cGFuZWwpOworCXJldCA9IGRybV9wYW5lbF91bnByZXBhcmUoJmN0eC0+cGFuZWwpOwogCWlmIChy
ZXQgPCAwKQogCQlEUk1fREVWX0VSUk9SKCZkc2ktPmRldiwgIkZhaWxlZCB0byB1bnByZXBhcmUg
cGFuZWw6ICVkXG4iLAogCQkJICAgICAgcmV0KTsKIAotCXJldCA9IGpoMDU3bl9kaXNhYmxlKCZj
dHgtPnBhbmVsKTsKKwlyZXQgPSBkcm1fcGFuZWxfZGlzYWJsZSgmY3R4LT5wYW5lbCk7CiAJaWYg
KHJldCA8IDApCiAJCURSTV9ERVZfRVJST1IoJmRzaS0+ZGV2LCAiRmFpbGVkIHRvIGRpc2FibGUg
cGFuZWw6ICVkXG4iLAogCQkJICAgICAgcmV0KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
