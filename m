Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A91242FA370
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 15:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4506F6E2F2;
	Mon, 18 Jan 2021 14:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDE56E2E6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 14:46:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F40A1ABDA;
 Mon, 18 Jan 2021 14:46:44 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel.vetter@ffwll.ch, airlied@linux.ie, christian.koenig@amd.com,
 elic@nvidia.com
Subject: [PATCH] drm/vram-helper: Reuse existing page mappings in vmap
Date: Mon, 18 Jan 2021 15:46:39 +0100
Message-Id: <20210118144639.27307-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHBlcmZvcm1hbmNlLCBCTyBwYWdlIG1hcHBpbmdzIGNhbiBzdGF5IGluIHBsYWNlIGV2ZW4g
aWYgdGhlCm1hcCBjb3VudGVyIGhhcyByZXR1cm5lZCB0byAwLiBJbiB0aGVzZSBjYXNlcywgdGhl
IGV4aXN0aW5nIHBhZ2UKbWFwcGluZyBoYXMgdG8gYmUgcmV1c2VkIGJ5IHRoZSBuZXh0IHZtYXAg
b3BlcmF0aW9uLiBPdGhlcndpc2UKYSBuZXcgbWFwcGluZyB3b3VsZCBiZSBpbnN0YWxsZWQgYW5k
IHRoZSBvbGQgbWFwcGluZydzIHBhZ2VzIGxlYWsuCgpGaXggdGhlIGlzc3VlIGJ5IHJldXNpbmcg
ZXhpc3RpbmcgcGFnZSBtYXBwaW5ncyBmb3Igdm1hcCBvcGVyYXRpb25zLgoKU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkZpeGVzOiAxMDg2ZGI3
MWExZGIgKCJkcm0vdnJhbS1oZWxwZXI6IFJlbW92ZSBpbnZhcmlhbnQgcGFyYW1ldGVycyBmcm9t
IGludGVybmFsIGttYXAgZnVuY3Rpb24iKQpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpUZXN0ZWQtYnk6IEVsaSBDb2hlbiA8ZWxpY0BudmlkaWEu
Y29tPgpSZXBvcnRlZC1ieTogRWxpIENvaGVuIDxlbGljQG52aWRpYS5jb20+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVs
Lm9yZz4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMTQgKysrKysrKysr
KystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCmluZGV4IDAyY2EyMmU5MDI5MC4uMGIy
MzJhNzNjMWI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBl
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTM4Nyw5
ICszODcsMTYgQEAgc3RhdGljIGludCBkcm1fZ2VtX3ZyYW1fa21hcF9sb2NrZWQoc3RydWN0IGRy
bV9nZW1fdnJhbV9vYmplY3QgKmdibywKIAlpZiAoZ2JvLT52bWFwX3VzZV9jb3VudCA+IDApCiAJ
CWdvdG8gb3V0OwogCi0JcmV0ID0gdHRtX2JvX3ZtYXAoJmdiby0+Ym8sICZnYm8tPm1hcCk7Ci0J
aWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwkvKgorCSAqIFZSQU0gaGVscGVycyB1bm1hcCB0aGUg
Qk8gb25seSBvbiBkZW1hbmQuIFNvIHRoZSBwcmV2aW91cworCSAqIHBhZ2UgbWFwcGluZyBtaWdo
dCBzdGlsbCBiZSBhcm91bmQuIE9ubHkgdm1hcCBpZiB0aGUgdGhlcmUncworCSAqIG5vIG1hcHBp
bmcgcHJlc2VudC4KKwkgKi8KKwlpZiAoZG1hX2J1Zl9tYXBfaXNfbnVsbCgmZ2JvLT5tYXApKSB7
CisJCXJldCA9IHR0bV9ib192bWFwKCZnYm8tPmJvLCAmZ2JvLT5tYXApOworCQlpZiAocmV0KQor
CQkJcmV0dXJuIHJldDsKKwl9CiAKIG91dDoKIAkrK2diby0+dm1hcF91c2VfY291bnQ7CkBAIC01
NzcsNiArNTg0LDcgQEAgc3RhdGljIHZvaWQgZHJtX2dlbV92cmFtX2JvX2RyaXZlcl9tb3ZlX25v
dGlmeShzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAqZ2JvLAogCQlyZXR1cm47CiAKIAl0dG1f
Ym9fdnVubWFwKGJvLCAmZ2JvLT5tYXApOworCWRtYV9idWZfbWFwX2NsZWFyKCZnYm8tPm1hcCk7
IC8qIGV4cGxpY2l0bHkgY2xlYXIgbWFwcGluZyBmb3IgbmV4dCB2bWFwIGNhbGwgKi8KIH0KIAog
c3RhdGljIGludCBkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX21vdmUoc3RydWN0IGRybV9nZW1fdnJh
bV9vYmplY3QgKmdibywKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
