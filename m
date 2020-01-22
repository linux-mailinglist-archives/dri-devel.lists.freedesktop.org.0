Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C69BD14571B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 14:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202D26F51A;
	Wed, 22 Jan 2020 13:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEECB6F4E0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 12:20:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BB71328;
 Wed, 22 Jan 2020 04:20:03 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com
 [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5EA33F52E;
 Wed, 22 Jan 2020 04:20:01 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jonathanh@nvidia.com
Subject: [PATCH] drm: tegra: Fix warning in PM ops
Date: Wed, 22 Jan 2020 12:19:51 +0000
Message-Id: <20200122121951.52639-1-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 13:52:23 +0000
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
Cc: linux-tegra@vger.kernel.org, vincenzo.frascino@arm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHRlZ3JhIGRyaXZlciBjYW4gYmUgY29tcGlsZWQgd2l0aG91dCBDT05GSUdfUE1fU0xFRVAg
ZW5hYmxlZC4KSW4gdGhpcyBjYXNlIHRoZSBjb21waWxhdGlvbiB0cmlnZ2VycyB0aGUgd2Fybmlu
ZyBiZWxvdzoKCmRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYzozOTg0OjEyOiB3YXJuaW5nOiDi
gJh0ZWdyYV9zb3JfcmVzdW1l4oCZCmRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5j
dGlvbl0KIDM5ODQgfCBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KQogICAgICB8ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL2dwdS9kcm0v
dGVncmEvc29yLmM6Mzk3MDoxMjogd2FybmluZzog4oCYdGVncmFfc29yX3N1c3BlbmTigJkKZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWZ1bmN0aW9uXQogMzk3MCB8IHN0YXRpYyBpbnQg
dGVncmFfc29yX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogICAgICB8ICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn4KCkZpeCB0aGUgd2FybmluZyBhZGRpbmcgX19tYXliZV91bnVzZWQg
dG8gdGhlIFBNIGZ1bmN0aW9ucy4KCkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhA
bnZpZGlhLmNvbT4KU2lnbmVkLW9mZi1ieTogVmluY2Vuem8gRnJhc2Npbm8gPHZpbmNlbnpvLmZy
YXNjaW5vQGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jIHwgOCArKysr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvc29yLmMKaW5kZXggYTY4ZDNiMzZiOTcyLi42OWI5ZWJlZTc0ODYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
c29yLmMKQEAgLTM5MTIsNyArMzkxMiw3IEBAIHN0YXRpYyBpbnQgdGVncmFfc29yX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50
IHRlZ3JhX3Nvcl9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGljIGlu
dCBfX21heWJlX3VudXNlZCB0ZWdyYV9zb3JfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikKIHsKIAlzdHJ1Y3QgdGVncmFfc29yICpzb3IgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsK
IAlpbnQgZXJyOwpAQCAtMzkzNCw3ICszOTM0LDcgQEAgc3RhdGljIGludCB0ZWdyYV9zb3JfcnVu
dGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGlj
IGludCB0ZWdyYV9zb3JfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGlj
IGludCBfX21heWJlX3VudXNlZCB0ZWdyYV9zb3JfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmlj
ZSAqZGV2KQogewogCXN0cnVjdCB0ZWdyYV9zb3IgKnNvciA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
OwogCWludCBlcnI7CkBAIC0zOTY3LDcgKzM5NjcsNyBAQCBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9y
dW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRp
YyBpbnQgdGVncmFfc29yX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGljIGludCBf
X21heWJlX3VudXNlZCB0ZWdyYV9zb3Jfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJ
c3RydWN0IHRlZ3JhX3NvciAqc29yID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJaW50IGVycjsK
QEAgLTM5ODEsNyArMzk4MSw3IEBAIHN0YXRpYyBpbnQgdGVncmFfc29yX3N1c3BlbmQoc3RydWN0
IGRldmljZSAqZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IHRlZ3JhX3Nvcl9yZXN1
bWUoc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGljIGludCBfX21heWJlX3VudXNlZCB0ZWdyYV9z
b3JfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgdGVncmFfc29yICpzb3Ig
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAlpbnQgZXJyOwotLSAKMi4yNS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
