Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA31F435B6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 13:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998AF8995F;
	Thu, 13 Jun 2019 11:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25658995F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:57:51 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 452DC21721;
 Thu, 13 Jun 2019 11:57:51 +0000 (UTC)
Date: Thu, 13 Jun 2019 13:57:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jyri Sarha <jsarha@ti.com>, Tony Lindgren <tony@atomide.com>,
 zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH] omapdrm: no need to check return value of debugfs_create
 functions
Message-ID: <20190613115749.GC26335@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560427071;
 bh=w/r7WOBHj5X+iBWEMDrwT+jmlzaJD2skMPzdAmR2/Dc=;
 h=Date:From:To:Cc:Subject:From;
 b=OkvQledR9uX7qfZPX7eKLyg+LkSvwDjYobyYedEX3tI83txOq+QxBXpxgGG4W2Ol0
 /vdz6FA0ArcpX82pvCXp6ZFb6Jmu+RjTnq4i1EwTFJlpfhGp8cZiEhgIZ0q0pEQEVP
 juKfRCauWybgjMFQz1byCdwVMSwcrDaeMyr19g+o=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIg
Y2hlY2sgdGhlCnJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1
dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNl
ZCBvbiB0aGlzLgoKQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CkNj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+CkNjOiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29s
bGFib3JhLmNvbT4KQ2M6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+CkNjOiBUb255IExpbmRn
cmVuIDx0b255QGF0b21pZGUuY29tPgpDYzogemhvbmcgamlhbmcgPHpob25namlhbmdAaHVhd2Vp
LmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMgfCAxMSArKy0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9k
c3MvZHNzLmMKaW5kZXggNTVlNjg4NjNlZjE1Li44M2I5NzM4MTMzOTQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvZHNzLmMKQEAgLTkzNCw3ICs5MzQsNiBAQCBkc3NfZGVidWdmc19jcmVhdGVfZmls
ZShzdHJ1Y3QgZHNzX2RldmljZSAqZHNzLCBjb25zdCBjaGFyICpuYW1lLAogCQkJdm9pZCAqZGF0
YSkKIHsKIAlzdHJ1Y3QgZHNzX2RlYnVnZnNfZW50cnkgKmVudHJ5OwotCXN0cnVjdCBkZW50cnkg
KmQ7CiAKIAllbnRyeSA9IGt6YWxsb2Moc2l6ZW9mKCplbnRyeSksIEdGUF9LRVJORUwpOwogCWlm
ICghZW50cnkpCkBAIC05NDIsMTUgKzk0MSw5IEBAIGRzc19kZWJ1Z2ZzX2NyZWF0ZV9maWxlKHN0
cnVjdCBkc3NfZGV2aWNlICpkc3MsIGNvbnN0IGNoYXIgKm5hbWUsCiAKIAllbnRyeS0+c2hvd19m
biA9IHNob3dfZm47CiAJZW50cnktPmRhdGEgPSBkYXRhOworCWVudHJ5LT5kZW50cnkgPSBkZWJ1
Z2ZzX2NyZWF0ZV9maWxlKG5hbWUsIDA0NDQsIGRzcy0+ZGVidWdmcy5yb290LAorCQkJCQkgICAg
ZW50cnksICZkc3NfZGVidWdfZm9wcyk7CiAKLQlkID0gZGVidWdmc19jcmVhdGVfZmlsZShuYW1l
LCAwNDQ0LCBkc3MtPmRlYnVnZnMucm9vdCwgZW50cnksCi0JCQkJJmRzc19kZWJ1Z19mb3BzKTsK
LQlpZiAoSVNfRVJSKGQpKSB7Ci0JCWtmcmVlKGVudHJ5KTsKLQkJcmV0dXJuIEVSUl9DQVNUKGQp
OwotCX0KLQotCWVudHJ5LT5kZW50cnkgPSBkOwogCXJldHVybiBlbnRyeTsKIH0KIAotLSAKMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
