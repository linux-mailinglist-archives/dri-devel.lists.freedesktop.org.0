Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A3274AA9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 23:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5016E334;
	Tue, 22 Sep 2020 21:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144B46E33F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 21:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600808780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sr3T0ukk/W15C/CAPmiVoDX0sWYPsfGDtdGAlrgJm+c=;
 b=avh1bC7QujYvVsuf6piGAUgO+JMfbtj3hvKv1zmvzvry8I5zVfZSGmh+ZGO4M89b04ID+x
 c1FpGVKAgtKL3XMZbbA4q2ec6MpptNiJCN5UiwoMGTNGh9V0lYihb726FLZPMkoP8rULqg
 pJDBC91xU1ZNbd/V/+zX8NdbFCsi9JY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-owTXjB_mP5WW8xca94WYQQ-1; Tue, 22 Sep 2020 17:06:16 -0400
X-MC-Unique: owTXjB_mP5WW8xca94WYQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6351C1007464;
 Tue, 22 Sep 2020 21:06:15 +0000 (UTC)
Received: from Ruby.redhat.com (unknown [10.10.115.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 777FA5DE50;
 Tue, 22 Sep 2020 21:06:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/kms/nv50-: Fix clock checking algorithm in
 nv50_dp_mode_valid()
Date: Tue, 22 Sep 2020 17:05:10 -0400
Message-Id: <20200922210510.156220-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpbGUgSSB0aG91Z2h0IEkgaGFkIHRoaXMgY29ycmVjdCAoc2luY2UgaXQgYWN0dWFsbHkgZGlk
IHJlamVjdCBtb2RlcwpsaWtlIEkgZXhwZWN0ZWQgZHVyaW5nIHRlc3RpbmcpLCBWaWxsZSBTeXJq
YWxhIGZyb20gSW50ZWwgcG9pbnRlZCBvdXQKdGhhdCB0aGUgbG9naWMgaGVyZSBpc24ndCBjb3Jy
ZWN0LiBtYXhfY2xvY2sgcmVmZXJzIHRvIHRoZSBtYXggc3ltYm9sCnJhdGUgc3VwcG9ydGVkIGJ5
IHRoZSBlbmNvZGVyLCBzbyBsaW1pdGluZyBjbG9jayB0byBkc19jbG9jayB1c2luZyBtYXgoKQpk
b2Vzbid0IG1ha2Ugc2Vuc2UuIEFkZGl0aW9uYWxseSwgd2Ugd2FudCB0byBjaGVjayBhZ2FpbnN0
IDZicGMgZm9yIHRoZQp0aW1lIGJlaW5nIHNpbmNlIHRoYXQncyB0aGUgbWluaW11bSBwb3NzaWJs
ZSBicGMgaGVyZSwgbm90IHRoZSByZXBvcnRlZApicGMgZnJvbSB0aGUgY29ubmVjdG9yLiBTZWU6
CgpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyMC1T
ZXB0ZW1iZXIvMjgwMjc2Lmh0bWwKCkZvciBtb3JlIGluZm8uCgpTbywgbGV0J3MgcmV3cml0ZSB0
aGlzIHVzaW5nIFZpbGxlJ3MgYWR2aWNlLgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1
ZGVAcmVkaGF0LmNvbT4KRml4ZXM6IDQwOWQzODEzOWI0MiAoImRybS9ub3V2ZWF1L2ttcy9udjUw
LTogVXNlIGRvd25zdHJlYW0gRFAgY2xvY2sgbGltaXRzIGZvciBtb2RlIHZhbGlkYXRpb24iKQpD
YzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEx5
dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkNjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhh
dC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jIHwgMjMgKysr
KysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMKaW5kZXggN2I2
NDBlMDViZDRjZC4uMjRjODFlNDIzZDM0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
ZHAuYwpAQCAtMjMxLDIzICsyMzEsMjYgQEAgbnY1MF9kcF9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IsCiAJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICptb2RlLAogCQkgICB1bnNpZ25lZCAqb3V0X2Nsb2NrKQogewotCWNvbnN0IHVuc2lnbmVkIG1p
bl9jbG9jayA9IDI1MDAwOwotCXVuc2lnbmVkIG1heF9jbG9jaywgZHNfY2xvY2ssIGNsb2NrOwor
CWNvbnN0IHVuc2lnbmVkIGludCBtaW5fY2xvY2sgPSAyNTAwMDsKKwl1bnNpZ25lZCBpbnQgbWF4
X2Nsb2NrLCBkc19jbG9jaywgY2xvY2s7CisJY29uc3QgdTggYnBwID0gMTg7IC8qIDYgYnBjICov
CiAJZW51bSBkcm1fbW9kZV9zdGF0dXMgcmV0OwogCiAJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01P
REVfRkxBR19JTlRFUkxBQ0UgJiYgIW91dHAtPmNhcHMuZHBfaW50ZXJsYWNlKQogCQlyZXR1cm4g
TU9ERV9OT19JTlRFUkxBQ0U7CiAKIAltYXhfY2xvY2sgPSBvdXRwLT5kcC5saW5rX25yICogb3V0
cC0+ZHAubGlua19idzsKLQlkc19jbG9jayA9IGRybV9kcF9kb3duc3RyZWFtX21heF9kb3RjbG9j
ayhvdXRwLT5kcC5kcGNkLAotCQkJCQkJICBvdXRwLT5kcC5kb3duc3RyZWFtX3BvcnRzKTsKLQlp
ZiAoZHNfY2xvY2spCi0JCW1heF9jbG9jayA9IG1pbihtYXhfY2xvY2ssIGRzX2Nsb2NrKTsKLQot
CWNsb2NrID0gbW9kZS0+Y2xvY2sgKiAoY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uYnBjICogMykg
LyAxMDsKLQlyZXQgPSBub3V2ZWF1X2Nvbm5fbW9kZV9jbG9ja192YWxpZChtb2RlLCBtaW5fY2xv
Y2ssIG1heF9jbG9jaywKLQkJCQkJICAgICZjbG9jayk7CisJY2xvY2sgPSBtb2RlLT5jbG9jayAq
IGJwcCAvIDg7CisJaWYgKGNsb2NrID4gbWF4X2Nsb2NrKQorCQlyZXR1cm4gTU9ERV9DTE9DS19I
SUdIOworCisJZHNfY2xvY2sgPSBkcm1fZHBfZG93bnN0cmVhbV9tYXhfZG90Y2xvY2sob3V0cC0+
ZHAuZHBjZCwgb3V0cC0+ZHAuZG93bnN0cmVhbV9wb3J0cyk7CisJaWYgKGRzX2Nsb2NrICYmIG1v
ZGUtPmNsb2NrID4gZHNfY2xvY2spCisJCXJldHVybiBNT0RFX0NMT0NLX0hJR0g7CisKKwlyZXQg
PSBub3V2ZWF1X2Nvbm5fbW9kZV9jbG9ja192YWxpZChtb2RlLCBtaW5fY2xvY2ssIG1heF9jbG9j
aywgJmNsb2NrKTsKIAlpZiAob3V0X2Nsb2NrKQogCQkqb3V0X2Nsb2NrID0gY2xvY2s7CisKIAly
ZXR1cm4gcmV0OwogfQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
