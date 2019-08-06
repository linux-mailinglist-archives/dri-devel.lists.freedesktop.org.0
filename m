Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46721831B3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 14:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B351D88C3D;
	Tue,  6 Aug 2019 12:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20B9788C3D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 12:46:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B942028;
 Tue,  6 Aug 2019 05:46:29 -0700 (PDT)
Received: from DESKTOP-E1NTVVP.cambridge.arm.com (unknown [10.1.25.192])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90B9B3F694;
 Tue,  6 Aug 2019 05:46:28 -0700 (PDT)
From: Brian Starkey <brian.starkey@arm.com>
To: dri-devel@lists.freedesktop.org,
	nd@arm.com
Subject: [PATCH v3] drm/crc-debugfs: Add notes about CRC<->commit interactions
Date: Tue,  6 Aug 2019 13:46:22 +0100
Message-Id: <20190806124622.28399-1-brian.starkey@arm.com>
X-Mailer: git-send-email 2.17.1
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
Cc: "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 ayan.halder@arm.com, Liviu Dudau <Liviu.Dudau@arm.com>,
 LKML <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q1JDIGdlbmVyYXRpb24gY2FuIGJlIGltcGFjdGVkIGJ5IGNvbW1pdHMgY29taW5nIGZyb20gdXNl
cnNwYWNlLCBhbmQKZW5hYmxpbmcgQ1JDIGdlbmVyYXRpb24gbWF5IGl0c2VsZiB0cmlnZ2VyIGEg
Y29tbWl0LiBBZGQgbm90ZXMgYWJvdXQKdGhpcyB0byB0aGUga2VybmVsZG9jLgoKQ2hhbmdlcyBz
aW5jZSB2MToKIC0gQ2xhcmlmaWVkIHRoYXQgYW55dGhpbmcgdGhhdCB3b3VsZCBkaXNhYmxlIENS
Q3MgY291bnRzIGFzIGEgZnVsbAogICBtb2Rlc2V0LCBhbmQgc28gdXNlcnNwYWNlIG5lZWRzIHRv
IHJlY29uZmlndXJlIGFmdGVyIGZ1bGwgbW9kZXNldHMKCkNoYW5nZXMgc2luY2UgdjI6CiAtIEFk
ZCB0aGVzZSBub3RlcwogLSBSZWJhc2Ugb250byBkcm0tbWlzYy1uZXh0ICh0cml2aWFsIGNvbmZs
aWN0IGluIGNvbW1lbnQpCgpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFy
a2V5QGFybS5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDkgKysrKysr
KysrCiBpbmNsdWRlL2RybS9kcm1fY3J0Yy5oICAgICAgICAgICAgfCA0ICsrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZGVidWdmc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwppbmRl
eCA2NjA0ZWQyMjMxNjAuLmJlMWI3YmE5MmZmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9kZWJ1Z2ZzX2NyYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMu
YwpAQCAtNjksNiArNjksMTUgQEAKICAqIGltcGxlbWVudCAmZHJtX2NydGNfZnVuY3Muc2V0X2Ny
Y19zb3VyY2UgYW5kICZkcm1fY3J0Y19mdW5jcy52ZXJpZnlfY3JjX3NvdXJjZS4KICAqIFRoZSBk
ZWJ1Z2ZzIGZpbGVzIGFyZSBhdXRvbWF0aWNhbGx5IHNldCB1cCBpZiB0aG9zZSB2ZnVuY3MgYXJl
IHNldC4gQ1JDIHNhbXBsZXMKICAqIG5lZWQgdG8gYmUgY2FwdHVyZWQgaW4gdGhlIGRyaXZlciBi
eSBjYWxsaW5nIGRybV9jcnRjX2FkZF9jcmNfZW50cnkoKS4KKyAqIERlcGVuZGluZyBvbiB0aGUg
ZHJpdmVyIGFuZCBIVyByZXF1aXJlbWVudHMsICZkcm1fY3J0Y19mdW5jcy5zZXRfY3JjX3NvdXJj
ZQorICogbWF5IHJlc3VsdCBpbiBhIGNvbW1pdCAoZXZlbiBhIGZ1bGwgbW9kZXNldCkuCisgKgor
ICogQ1JDIHJlc3VsdHMgbXVzdCBiZSByZWxpYWJsZSBhY3Jvc3Mgbm9uLWZ1bGwtbW9kZXNldCBh
dG9taWMgY29tbWl0cywgc28gaWYgYQorICogY29tbWl0IHZpYSBEUk1fSU9DVExfTU9ERV9BVE9N
SUMgd291bGQgZGlzYWJsZSBvciBvdGhlcndpc2UgaW50ZXJmZXJlIHdpdGgKKyAqIENSQyBnZW5l
cmF0aW9uLCB0aGVuIHRoZSBkcml2ZXIgbXVzdCBtYXJrIHRoYXQgY29tbWl0IGFzIGEgZnVsbCBt
b2Rlc2V0CisgKiAoZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQoKSBzaG91bGQgcmV0dXJu
IHRydWUpLiBBcyBhIHJlc3VsdCwgdG8gZW5zdXJlCisgKiBjb25zaXN0ZW50IHJlc3VsdHMsIGdl
bmVyaWMgdXNlcnNwYWNlIG11c3QgcmUtc2V0dXAgQ1JDIGdlbmVyYXRpb24gYWZ0ZXIgYQorICog
bGVnYWN5IFNFVENSVEMgb3IgYW4gYXRvbWljIGNvbW1pdCB3aXRoIERSTV9NT0RFX0FUT01JQ19B
TExPV19NT0RFU0VULgogICovCiAKIHN0YXRpYyBpbnQgY3JjX2NvbnRyb2xfc2hvdyhzdHJ1Y3Qg
c2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY3J0
Yy5oIGIvaW5jbHVkZS9kcm0vZHJtX2NydGMuaAppbmRleCAxMjhkOGIyMTA2MjEuLjdkMTRjMTFi
ZGMwYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NydGMuaAorKysgYi9pbmNsdWRlL2Ry
bS9kcm1fY3J0Yy5oCkBAIC03NTYsNiArNzU2LDkgQEAgc3RydWN0IGRybV9jcnRjX2Z1bmNzIHsK
IAkgKiBwcm92aWRlZCBmcm9tIHRoZSBjb25maWd1cmVkIHNvdXJjZS4gRHJpdmVycyBtdXN0IGFj
Y2VwdCBhbiAiYXV0byIKIAkgKiBzb3VyY2UgbmFtZSB0aGF0IHdpbGwgc2VsZWN0IGEgZGVmYXVs
dCBzb3VyY2UgZm9yIHRoaXMgQ1JUQy4KIAkgKgorCSAqIFRoaXMgbWF5IHRyaWdnZXIgYW4gYXRv
bWljIG1vZGVzZXQgY29tbWl0IGlmIG5lY2Vzc2FyeSwgdG8gZW5hYmxlIENSQworCSAqIGdlbmVy
YXRpb24uCisJICoKIAkgKiBOb3RlIHRoYXQgImF1dG8iIGNhbiBkZXBlbmQgdXBvbiB0aGUgY3Vy
cmVudCBtb2Rlc2V0IGNvbmZpZ3VyYXRpb24sCiAJICogZS5nLiBpdCBjb3VsZCBwaWNrIGFuIGVu
Y29kZXIgb3Igb3V0cHV0IHNwZWNpZmljIENSQyBzYW1wbGluZyBwb2ludC4KIAkgKgpAQCAtNzY3
LDYgKzc3MCw3IEBAIHN0cnVjdCBkcm1fY3J0Y19mdW5jcyB7CiAJICogMCBvbiBzdWNjZXNzIG9y
IGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgogCSAqLwogCWludCAoKnNldF9jcmNf
c291cmNlKShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGNvbnN0IGNoYXIgKnNvdXJjZSk7CisKIAkv
KioKIAkgKiBAdmVyaWZ5X2NyY19zb3VyY2U6CiAJICoKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
