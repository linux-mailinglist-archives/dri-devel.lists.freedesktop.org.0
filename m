Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E96C1F3D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1346E249;
	Mon, 30 Sep 2019 10:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B1D6E249
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 10:38:53 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UAcoGQ100893;
 Mon, 30 Sep 2019 05:38:50 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UAcoYW071803
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Sep 2019 05:38:50 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 05:38:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 05:38:50 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UAck1v011864;
 Mon, 30 Sep 2019 05:38:48 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv2 1/7] drm/omap: drop unneeded locking from mgr_fld_write()
Date: Mon, 30 Sep 2019 13:38:34 +0300
Message-ID: <20190930103840.18970-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930103840.18970-1-tomi.valkeinen@ti.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569839930;
 bh=z9Nx8hggaGT6yjBiZCp7WJTLUAWWUkid7h0rKpTd0sU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=quj+LqiXnhVpvXKfRGOKZ4Oa1Dtt8LW9wdnY48EyTlvBWdm7h3RGZvu3GBCswqtYf
 q2jPRemN94nUhc5fZ6H5Geanf9mrUSFKW1UuVDQOTt5IYYR/ws4b5pGvXzbrzXBzoS
 vuWni002Eza3GIstPUsPER5XqtOjh568TYBDfHXs=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IGQ0OWNkMTU1NTBkOWQ0NDk1ZjYxODc0MjUzMThjMjQ1ZDU4Y2I2M2YgKCJPTUFQRFNT
OiBESVNQQzogbG9jawphY2Nlc3MgdG8gRElTUENfQ09OVFJPTCAmIERJU1BDX0NPTkZJRyIpIGFk
ZGVkIGxvY2tpbmcgdG8KbWdyX2ZsZF93cml0ZSgpLiBUaGlzIHdhcyBuZWVkZWQgaW4gb21hcGZi
IHRpbWVzIGR1ZSB0byBsYWNrIG9mIGdvb2QKbG9ja2luZywgZXNwZWNpYWxseSBpbiB0aGUgY2Fz
ZSBvZiBib3RoIFY0TDIgYW5kIGZiZGV2IGxheWVycyB1c2luZyB0aGUKRFNTIGRyaXZlci4KClRo
aXMgaXMgbm90IG5lZWRlZCBmb3Igb21hcGRybSwgc28gd2UgY2FuIHJlbW92ZSB0aGUgbG9ja2lu
Zy4KClNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+
ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rpc3BjLmMgfCAxNSAr
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rpc3BjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZGlzcGMuYwppbmRleCA3ODVjNTU0NjA2N2Eu
LjBkYzAyNzI1NjlmNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rp
c3BjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rpc3BjLmMKQEAgLTE4NCw5
ICsxODQsNiBAQCBzdHJ1Y3QgZGlzcGNfZGV2aWNlIHsKIAogCXN0cnVjdCByZWdtYXAgKnN5c2Nv
bl9wb2w7CiAJdTMyIHN5c2Nvbl9wb2xfb2Zmc2V0OwotCi0JLyogRElTUENfQ09OVFJPTCAmIERJ
U1BDX0NPTkZJRyBsb2NrKi8KLQlzcGlubG9ja190IGNvbnRyb2xfbG9jazsKIH07CiAKIGVudW0g
b21hcF9jb2xvcl9jb21wb25lbnQgewpAQCAtMzc3LDE2ICszNzQsOCBAQCBzdGF0aWMgdm9pZCBt
Z3JfZmxkX3dyaXRlKHN0cnVjdCBkaXNwY19kZXZpY2UgKmRpc3BjLCBlbnVtIG9tYXBfY2hhbm5l
bCBjaGFubmVsLAogCQkJICBlbnVtIG1ncl9yZWdfZmllbGRzIHJlZ2ZsZCwgaW50IHZhbCkKIHsK
IAljb25zdCBzdHJ1Y3QgZGlzcGNfcmVnX2ZpZWxkIHJmbGQgPSBtZ3JfZGVzY1tjaGFubmVsXS5y
ZWdfZGVzY1tyZWdmbGRdOwotCWNvbnN0IGJvb2wgbmVlZF9sb2NrID0gcmZsZC5yZWcgPT0gRElT
UENfQ09OVFJPTCB8fCByZmxkLnJlZyA9PSBESVNQQ19DT05GSUc7Ci0JdW5zaWduZWQgbG9uZyBm
bGFnczsKIAotCWlmIChuZWVkX2xvY2spIHsKLQkJc3Bpbl9sb2NrX2lycXNhdmUoJmRpc3BjLT5j
b250cm9sX2xvY2ssIGZsYWdzKTsKLQkJUkVHX0ZMRF9NT0QoZGlzcGMsIHJmbGQucmVnLCB2YWws
IHJmbGQuaGlnaCwgcmZsZC5sb3cpOwotCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkaXNwYy0+
Y29udHJvbF9sb2NrLCBmbGFncyk7Ci0JfSBlbHNlIHsKLQkJUkVHX0ZMRF9NT0QoZGlzcGMsIHJm
bGQucmVnLCB2YWwsIHJmbGQuaGlnaCwgcmZsZC5sb3cpOwotCX0KKwlSRUdfRkxEX01PRChkaXNw
YywgcmZsZC5yZWcsIHZhbCwgcmZsZC5oaWdoLCByZmxkLmxvdyk7CiB9CiAKIHN0YXRpYyBpbnQg
ZGlzcGNfZ2V0X251bV9vdmxzKHN0cnVjdCBkaXNwY19kZXZpY2UgKmRpc3BjKQpAQCAtNDc2OSw4
ICs0NzU4LDYgQEAgc3RhdGljIGludCBkaXNwY19iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQogCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBk
ZXYsIGRpc3BjKTsKIAlkaXNwYy0+ZHNzID0gZHNzOwogCi0Jc3Bpbl9sb2NrX2luaXQoJmRpc3Bj
LT5jb250cm9sX2xvY2spOwotCiAJLyoKIAkgKiBUaGUgT01BUDMtYmFzZWQgbW9kZWxzIGNhbid0
IGJlIHRvbGQgYXBhcnQgdXNpbmcgdGhlIGNvbXBhdGlibGUKIAkgKiBzdHJpbmcsIHVzZSBTb0Mg
ZGV2aWNlIG1hdGNoaW5nLgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2th
bGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIx
LTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
