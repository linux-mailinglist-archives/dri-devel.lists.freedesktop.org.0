Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A4349132
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 12:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201776ED0E;
	Thu, 25 Mar 2021 11:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC246ED10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616672915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dqqAoAaF7t4uki/qmDOLK+maxgb2dagmvhik6yTw1EA=;
 b=e2j3WTr4tvspx5PNQYLnlXOUANpAZSTM33genQxiuYtIT3ABh2tvEg5Qw4ci+Nvol/z/CF
 rWbajsNJm71zBZz3SiseyfJWalM+9NKBfspf9m7RBae80TDP2bS+imqwVA7PmEElRf5I4m
 WYVpigGcQ2FMvqcGOyH9fi/qf+nBU6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-zobh-ZT1MAy4Jxsb7yqUBw-1; Thu, 25 Mar 2021 07:48:31 -0400
X-MC-Unique: zobh-ZT1MAy4Jxsb7yqUBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5BBD87A83A;
 Thu, 25 Mar 2021 11:48:29 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33C9C5D9D0;
 Thu, 25 Mar 2021 11:48:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/i915/display/vlv_dsi: Move panel_pwr_cycle_delay to
 next panel-on
Date: Thu, 25 Mar 2021 12:48:23 +0100
Message-Id: <20210325114823.44922-2-hdegoede@redhat.com>
In-Reply-To: <20210325114823.44922-1-hdegoede@redhat.com>
References: <20210325114823.44922-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBzbGVlcGluZyBwYW5lbF9wd3JfY3ljbGVfZGVsYXkgbXMgd2hlbiB0dXJuaW5n
IHRoZSBwYW5lbCBvZmYsCnJlY29yZCB0aGUgdGltZSBpdCBpcyB0dXJuZWQgb2ZmIGFuZCBpZiBu
ZWNlc3Nhcnkgd2FpdCBhbnkgKHJlbWFpbmluZykKdGltZSB3aGVuIHRoZSBwYW5lbCBpcyB0dXJu
ZWQgb24gYWdhaW4uCgpBbHNvIHNsZWVwIHRoZSByZW1haW5pbmcgdGltZSBvbiBzaHV0ZG93biwg
YmVjYXVzZSBvbiByZWJvb3QgdGhlCkdPUCB3aWxsIGltbWVkaWF0ZWx5IHR1cm4gb24gdGhlIHBh
bmVsIGFnYWluLgoKQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+ClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kc2kuaCB8ICAxICsKIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvdmx2X2RzaS5jICAgfCAyNSArKysrKysrKysrKysr
KysrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rz
aS5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kc2kuaAppbmRleCA2MjVm
MmYxYWUwNjEuLjUwZDZkYTBiMjQxOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kc2kuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RzaS5oCkBAIC0xMjQsNiArMTI0LDcgQEAgc3RydWN0IGludGVsX2RzaSB7CiAJdTE2IHBh
bmVsX29uX2RlbGF5OwogCXUxNiBwYW5lbF9vZmZfZGVsYXk7CiAJdTE2IHBhbmVsX3B3cl9jeWNs
ZV9kZWxheTsKKwlrdGltZV90IHBhbmVsX3Bvd2VyX29mZl90aW1lOwogfTsKIAogc3RydWN0IGlu
dGVsX2RzaV9ob3N0IHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
dmx2X2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS92bHZfZHNpLmMKaW5kZXgg
MzhkNWExZjNkZWQ1Li4zZWRlNTVjYjNmNDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvdmx2X2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
dmx2X2RzaS5jCkBAIC03MTcsNiArNzE3LDE5IEBAIHN0YXRpYyB2b2lkIGludGVsX2RzaV9wb3J0
X2Rpc2FibGUoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIpCiAJfQogfQogCitzdGF0aWMg
dm9pZCBpbnRlbF9kc2lfd2FpdF9wYW5lbF9wb3dlcl9jeWNsZShzdHJ1Y3QgaW50ZWxfZHNpICpp
bnRlbF9kc2kpCit7CisJa3RpbWVfdCBwYW5lbF9wb3dlcl9vbl90aW1lOworCXM2NCBwYW5lbF9w
b3dlcl9vZmZfZHVyYXRpb247CisKKwlwYW5lbF9wb3dlcl9vbl90aW1lID0ga3RpbWVfZ2V0X2Jv
b3R0aW1lKCk7CisJcGFuZWxfcG93ZXJfb2ZmX2R1cmF0aW9uID0ga3RpbWVfbXNfZGVsdGEocGFu
ZWxfcG93ZXJfb25fdGltZSwKKwkJCQkJCSAgaW50ZWxfZHNpLT5wYW5lbF9wb3dlcl9vZmZfdGlt
ZSk7CisKKwlpZiAocGFuZWxfcG93ZXJfb2ZmX2R1cmF0aW9uIDwgKHM2NClpbnRlbF9kc2ktPnBh
bmVsX3B3cl9jeWNsZV9kZWxheSkKKwkJbXNsZWVwKGludGVsX2RzaS0+cGFuZWxfcHdyX2N5Y2xl
X2RlbGF5IC0gcGFuZWxfcG93ZXJfb2ZmX2R1cmF0aW9uKTsKK30KKwogc3RhdGljIHZvaWQgaW50
ZWxfZHNpX3ByZXBhcmUoc3RydWN0IGludGVsX2VuY29kZXIgKmludGVsX2VuY29kZXIsCiAJCQkg
ICAgICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqcGlwZV9jb25maWcpOwogc3RhdGlj
IHZvaWQgaW50ZWxfZHNpX3VucHJlcGFyZShzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2Rlcik7
CkBAIC03NzgsNiArNzkxLDggQEAgc3RhdGljIHZvaWQgaW50ZWxfZHNpX3ByZV9lbmFibGUoc3Ry
dWN0IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsCiAKIAlkcm1fZGJnX2ttcygmZGV2X3ByaXYt
PmRybSwgIlxuIik7CiAKKwlpbnRlbF9kc2lfd2FpdF9wYW5lbF9wb3dlcl9jeWNsZShpbnRlbF9k
c2kpOworCiAJaW50ZWxfc2V0X2NwdV9maWZvX3VuZGVycnVuX3JlcG9ydGluZyhkZXZfcHJpdiwg
cGlwZSwgdHJ1ZSk7CiAKIAkvKgpAQCAtOTkyLDE4ICsxMDA3LDE0IEBAIHN0YXRpYyB2b2lkIGlu
dGVsX2RzaV9wb3N0X2Rpc2FibGUoc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsCiAJ
aW50ZWxfZHNpX21zbGVlcChpbnRlbF9kc2ksIGludGVsX2RzaS0+cGFuZWxfb2ZmX2RlbGF5KTsK
IAlpbnRlbF9kc2lfdmJ0X2V4ZWNfc2VxdWVuY2UoaW50ZWxfZHNpLCBNSVBJX1NFUV9QT1dFUl9P
RkYpOwogCi0JLyoKLQkgKiBGSVhNRSBBcyB3ZSBkbyB3aXRoIGVEUCwganVzdCBtYWtlIGEgbm90
ZSBvZiB0aGUgdGltZSBoZXJlCi0JICogYW5kIHBlcmZvcm0gdGhlIHdhaXQgYmVmb3JlIHRoZSBu
ZXh0IHBhbmVsIHBvd2VyIG9uLgotCSAqLwotCW1zbGVlcChpbnRlbF9kc2ktPnBhbmVsX3B3cl9j
eWNsZV9kZWxheSk7CisJaW50ZWxfZHNpLT5wYW5lbF9wb3dlcl9vZmZfdGltZSA9IGt0aW1lX2dl
dF9ib290dGltZSgpOwogfQogCiBzdGF0aWMgdm9pZCBpbnRlbF9kc2lfc2h1dGRvd24oc3RydWN0
IGludGVsX2VuY29kZXIgKmVuY29kZXIpCiB7CiAJc3RydWN0IGludGVsX2RzaSAqaW50ZWxfZHNp
ID0gZW5jX3RvX2ludGVsX2RzaShlbmNvZGVyKTsKIAotCW1zbGVlcChpbnRlbF9kc2ktPnBhbmVs
X3B3cl9jeWNsZV9kZWxheSk7CisJaW50ZWxfZHNpX3dhaXRfcGFuZWxfcG93ZXJfY3ljbGUoaW50
ZWxfZHNpKTsKIH0KIAogc3RhdGljIGJvb2wgaW50ZWxfZHNpX2dldF9od19zdGF0ZShzdHJ1Y3Qg
aW50ZWxfZW5jb2RlciAqZW5jb2RlciwKQEAgLTE4ODQsNiArMTg5NSw4IEBAIHZvaWQgdmx2X2Rz
aV9pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKIAllbHNlCiAJCWludGVs
X2VuY29kZXItPnBpcGVfbWFzayA9IEJJVChQSVBFX0IpOwogCisJaW50ZWxfZHNpLT5wYW5lbF9w
b3dlcl9vZmZfdGltZSA9IGt0aW1lX2dldF9ib290dGltZSgpOworCiAJaWYgKGRldl9wcml2LT52
YnQuZHNpLmNvbmZpZy0+ZHVhbF9saW5rKQogCQlpbnRlbF9kc2ktPnBvcnRzID0gQklUKFBPUlRf
QSkgfCBCSVQoUE9SVF9DKTsKIAllbHNlCi0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
