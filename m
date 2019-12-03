Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0340F111C4D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 23:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7F06E9DA;
	Tue,  3 Dec 2019 22:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95A66E9DA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 22:42:51 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-4k8qimMGOBeQPasm2opFyw-1; Tue, 03 Dec 2019 17:42:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 411EA800D54;
 Tue,  3 Dec 2019 22:42:47 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-90.bss.redhat.com
 [10.20.1.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6637F5DA32;
 Tue,  3 Dec 2019 22:42:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Assume 100% brightness when not in DPCD control
 mode
Date: Tue,  3 Dec 2019 17:42:35 -0500
Message-Id: <20191203224236.230930-1-lyude@redhat.com>
In-Reply-To: <87tv6hinv1.fsf@intel.com>
References: <87tv6hinv1.fsf@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 4k8qimMGOBeQPasm2opFyw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575412970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sDgbMqjO9PDnPDuImNP6HXuoqamT1anUKE/7ClETRA=;
 b=X+aA1rBTY+q2Jy+07ak2Fz1rKtZA7h/F/ulyQxVdO2wXNEoS/gv2WFTau2n2tlu0s4dOuK
 6GUzweMwmDHRC62i64oM9BQncJzVe55dlqE+bTJwZE1IJm+WFNCJGJ2mAwtpVZO80sG8o6
 N4QumWRd+pcvxp+jcCIukrDOOwjnGbQ=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IHdlIGFsd2F5cyBkZXRlcm1pbmUgdGhlIGluaXRpYWwgcGFuZWwgYnJpZ2h0bmVz
cyBsZXZlbCBieQpzaW1wbHkgcmVhZGluZyB0aGUgdmFsdWUgZnJvbSBEUF9FRFBfQkFDS0xJR0hU
X0JSSUdIVE5FU1NfTVNCL0xTQi4gVGhpcwpzZWVtcyB3cm9uZyB0aG91Z2gsIGJlY2F1c2UgaWYg
dGhlIHBhbmVsIGlzIG5vdCBjdXJyZW50bHkgaW4gRFBDRApjb250cm9sIG1vZGUgdGhlcmUncyBu
b3QgcmVhbGx5IGFueSByZWFzb24gd2h5IHRoZXJlIHdvdWxkIGJlIGFueQpicmlnaHRuZXNzIHZh
bHVlIHByb2dyYW1tZWQgaW4gdGhlIGZpcnN0IHBsYWNlLgoKVGhpcyBhcHBlYXJzIHRvIGJlIHRo
ZSBjYXNlIG9uIHRoZSBMZW5vdm8gVGhpbmtQYWQgWDEgRXh0cmVtZSAybmQKR2VuZXJhdGlvbiwg
d2hlcmUgdGhlIGRlZmF1bHQgdmFsdWUgaW4gdGhlc2UgcmVnaXN0ZXJzIGlzIGFsd2F5cyAwIG9u
CmJvb3QgZGVzcGl0ZSB0aGUgZmFjdCB0aGUgcGFuZWwgcnVucyBhdCBtYXggYnJpZ2h0bmVzcyBi
eSBkZWZhdWx0LgpHZXR0aW5nIHRoZSBpbml0aWFsIGJyaWdodG5lc3MgdmFsdWUgY29ycmVjdCBo
ZXJlIGlzIGltcG9ydGFudCBhcyB3ZWxsLApzaW5jZSB0aGUgcGFuZWwgb24gdGhpcyBsYXB0b3Ag
ZG9lc24ndCBiZWhhdmUgd2VsbCBpZiBpdCdzIGV2ZXIgcHV0IGludG8KRFBDRCBjb250cm9sIG1v
ZGUgd2hpbGUgdGhlIGJyaWdodG5lc3MgbGV2ZWwgaXMgcHJvZ3JhbW1lZCB0byAwLgoKU28sIGxl
dCdzIGZpeCB0aGlzIGJ5IGNoZWNraW5nIHdoYXQgdGhlIGN1cnJlbnQgYmFja2xpZ2h0IGNvbnRy
b2wgbW9kZQppcyBiZWZvcmUgcmVhZGluZyB0aGUgYnJpZ2h0bmVzcyBsZXZlbC4gSWYgaXQncyBp
biBEUENEIGNvbnRyb2wgbW9kZSwgd2UKcmV0dXJuIHRoZSBwcm9ncmFtbWVkIGJyaWdodG5lc3Mg
bGV2ZWwuIE90aGVyd2lzZSB3ZSBhc3N1bWUgMTAwJQpicmlnaHRuZXNzIGFuZCByZXR1cm4gdGhl
IGhpZ2hlc3QgcG9zc2libGUgYnJpZ2h0bmVzcyBsZXZlbC4gVGhpcyBhbHNvCnByZXZlbnRzIHVz
IGZyb20gYWNjaWRlbnRhbGx5IHByb2dyYW1taW5nIGEgYnJpZ2h0bmVzcyBsZXZlbCBvZiAwLgoK
VGhpcyBpcyBvbmUgb2YgdGhlIG1hbnkgZml4ZXMgdGhhdCBnZXRzIGJhY2tsaWdodCBjb250cm9s
cyB3b3JraW5nIG9uCnRoZSBUaGlua1BhZCBYMSBFeHRyZW1lIDJuZCBHZW5lcmF0aW9uIHdpdGgg
b3B0aW9uYWwgNEsgQU1PTEVEIHNjcmVlbi4KCkNoYW5nZXMgc2luY2UgdjE6Ciogcy9EUF9FRFBf
RElTUExBWV9DT05UUk9MX1JFR0lTVEVSL0RQX0VEUF9CQUNLTElHSFRfTU9ERV9TRVRfUkVHSVNU
RVIvCiAgLSBKYW5pCgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PgotLS0KIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eF9iYWNrbGlnaHQuYyAgIHwg
MTcgKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9hdXhfYmFj
a2xpZ2h0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eF9iYWNr
bGlnaHQuYwppbmRleCBmYWQ0NzA1NTNjZjkuLjRkNDY3ZTdkMjllYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9hdXhfYmFja2xpZ2h0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9hdXhfYmFja2xpZ2h0LmMKQEAg
LTU5LDggKzU5LDI1IEBAIHN0YXRpYyB1MzIgaW50ZWxfZHBfYXV4X2dldF9iYWNrbGlnaHQoc3Ry
dWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCXN0cnVjdCBpbnRlbF9kcCAqaW50
ZWxfZHAgPSBlbmNfdG9faW50ZWxfZHAoJmNvbm5lY3Rvci0+ZW5jb2Rlci0+YmFzZSk7CiAJdTgg
cmVhZF92YWxbMl0gPSB7IDB4MCB9OworCXU4IG1vZGVfcmVnOwogCXUxNiBsZXZlbCA9IDA7CiAK
KwlpZiAoZHJtX2RwX2RwY2RfcmVhZGIoJmludGVsX2RwLT5hdXgsCisJCQkgICAgICBEUF9FRFBf
QkFDS0xJR0hUX01PREVfU0VUX1JFR0lTVEVSLAorCQkJICAgICAgJm1vZGVfcmVnKSAhPSAxKSB7
CisJCURSTV9ERUJVR19LTVMoIkZhaWxlZCB0byByZWFkIHRoZSBEUENEIHJlZ2lzdGVyIDB4JXhc
biIsCisJCQkgICAgICBEUF9FRFBfQkFDS0xJR0hUX01PREVfU0VUX1JFR0lTVEVSKTsKKwkJcmV0
dXJuIDA7CisJfQorCisJLyoKKwkgKiBJZiB3ZSdyZSBub3QgaW4gRFBDRCBjb250cm9sIG1vZGUg
eWV0LCB0aGUgcHJvZ3JhbW1lZCBicmlnaHRuZXNzCisJICogdmFsdWUgaXMgbWVhbmluZ2xlc3Mg
YW5kIHdlIHNob3VsZCBhc3N1bWUgbWF4IGJyaWdodG5lc3MKKwkgKi8KKwlpZiAoKG1vZGVfcmVn
ICYgRFBfRURQX0JBQ0tMSUdIVF9DT05UUk9MX01PREVfTUFTSykgIT0KKwkgICAgRFBfRURQX0JB
Q0tMSUdIVF9DT05UUk9MX01PREVfRFBDRCkKKwkJcmV0dXJuIGNvbm5lY3Rvci0+cGFuZWwuYmFj
a2xpZ2h0Lm1heDsKKwogCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZpbnRlbF9kcC0+YXV4LCBEUF9F
RFBfQkFDS0xJR0hUX0JSSUdIVE5FU1NfTVNCLAogCQkJICAgICAmcmVhZF92YWwsIHNpemVvZihy
ZWFkX3ZhbCkpIDwgMCkgewogCQlEUk1fREVCVUdfS01TKCJGYWlsZWQgdG8gcmVhZCBEUENEIHJl
Z2lzdGVyIDB4JXhcbiIsCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
