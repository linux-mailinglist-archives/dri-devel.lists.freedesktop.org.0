Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83E26D99A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662346E4A3;
	Fri, 19 Jul 2019 03:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5C16E49F;
 Fri, 19 Jul 2019 03:57:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8EE921852;
 Fri, 19 Jul 2019 03:57:29 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 019/171] drm/amd/display: fix multi display
 seamless boot case
Date: Thu, 18 Jul 2019 23:54:10 -0400
Message-Id: <20190719035643.14300-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508650;
 bh=oZq74vOU69k95kJgkuxq8/TZXIrComA3tcoACkgcGz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ovkiMuWlOdx5taxJj1PjkknHXxKMKOTShefC/J+8Mua4jfONv4lTcyAPDJiliyB4W
 zm4XpktlqWDPZ5+6KCNlMKTriBLaWGv8/w+mMG16h2+XHAQxLChys5DhCXSlGUa7es
 zdJKDnKWu6BWvRct4g0AyfH0p8+rkmoOjQLQmN1Q=
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
Cc: Sasha Levin <sashal@kernel.org>, Anthony Koo <anthony.koo@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPGFudGhvbnkua29vQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCA0Y2Q3NWZmMDk2ZjRlZjQ5YzM0MzA5M2I1MmE5NTJmMjdhYmE3Nzk2IF0KCltXaHldClRoZXJl
IGlzIGEgc2NlbmFyaW8gdGhhdCBjYXVzZXMgZURQIHRvIGJlY29tZSBibGFuayBpZgp0aGVyZSBh
cmUgbXVsdGlwbGUgZGlzcGxheXMgY29ubmVjdGVkLCBhbmQgdGhlIGV4dGVybmFsCmRpc3BsYXkg
aXMgc2V0IGFzIHRoZSBwcmltYXJ5IGRpc3BsYXkgc3VjaCB0aGF0IHRoZSBmaXJzdApmbGlwIGNv
bWVzIHRvIHRoZSBleHRlcm5hbCBkaXNwbGF5LgoKSW4gdGhpcyBzY2VuYXJpbywgd2UgY2FsbCBv
dXIgb3B0aW1pemUgZnVuY3Rpb24gYmVmb3JlCnRoZSBlRFAgZXZlbiBoYXMgYSBjaGFuY2UgdG8g
ZmxpcC4KCltIb3ddClRoZXJlIGlzIGEgY2hlY2sgdGhhdCBwcmV2ZW50cyBiYW5kd2lkdGggb3B0
aW1pemUgZnJvbQpvY2N1cnJpbmcgYmVmb3JlIGZpcnN0IGZsaXAgaXMgY29tcGxldGUgb24gdGhl
IHNlYW1sZXNzIGJvb3QKZGlzcGxheS4KQnV0IGFjdHVhbGx5IGl0IGFzc3VtZWQgdGhlIHNlYW1s
ZXNzIGJvb3QgZGlzcGxheSBpcyB0aGUKZmlyc3Qgb25lIHRvIGZsaXAuIEJ1dCBpbiB0aGlzIHNj
ZW5hcmlvIGl0IGlzIG5vdC4KTW9kaWZ5IHRoZSBjaGVjayB0byBlbnN1cmUgdGhlIHN0ZWFtIHdp
dGggdGhlIHNlYW1sZXNzCmJvb3QgZmxhZyBzZXQgaXMgdGhlIG9uZSB0aGF0IGhhcyBjb21wbGV0
ZWQgdGhlIGZpcnN0IGZsaXAuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IEtvbyA8YW50aG9ueS5r
b29AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQuY29tPgpBY2tl
ZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCAxNCArKysrKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwppbmRleCAxOGM3NzVhOTUwY2MuLmVlNmI2NDYxODBi
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCkBAIC0xMTM4LDkg
KzExMzgsNiBAQCBzdGF0aWMgZW51bSBkY19zdGF0dXMgZGNfY29tbWl0X3N0YXRlX25vX2NoZWNr
KHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdGF0ZSAqYwogCQljb25zdCBzdHJ1Y3QgZGNfbGlu
ayAqbGluayA9IGNvbnRleHQtPnN0cmVhbXNbaV0tPmxpbms7CiAJCXN0cnVjdCBkY19zdHJlYW1f
c3RhdHVzICpzdGF0dXM7CiAKLQkJaWYgKGNvbnRleHQtPnN0cmVhbXNbaV0tPmFwcGx5X3NlYW1s
ZXNzX2Jvb3Rfb3B0aW1pemF0aW9uKQotCQkJY29udGV4dC0+c3RyZWFtc1tpXS0+YXBwbHlfc2Vh
bWxlc3NfYm9vdF9vcHRpbWl6YXRpb24gPSBmYWxzZTsKLQogCQlpZiAoIWNvbnRleHQtPnN0cmVh
bXNbaV0tPm1vZGVfY2hhbmdlZCkKIAkJCWNvbnRpbnVlOwogCkBAIC0xNzkyLDEwICsxNzg5LDE1
IEBAIHN0YXRpYyB2b2lkIGNvbW1pdF9wbGFuZXNfZm9yX3N0cmVhbShzdHJ1Y3QgZGMgKmRjLAog
CWlmIChkYy0+b3B0aW1pemVfc2VhbWxlc3NfYm9vdCAmJiBzdXJmYWNlX2NvdW50ID4gMCkgewog
CQkvKiBPcHRpbWl6ZSBzZWFtbGVzcyBib290IGZsYWcga2VlcHMgY2xvY2tzIGFuZCB3YXRlcm1h
cmtzIGhpZ2ggdW50aWwKIAkJICogZmlyc3QgZmxpcC4gQWZ0ZXIgZmlyc3QgZmxpcCwgb3B0aW1p
emF0aW9uIGlzIHJlcXVpcmVkIHRvIGxvd2VyCi0JCSAqIGJhbmR3aWR0aC4KKwkJICogYmFuZHdp
ZHRoLiBJbXBvcnRhbnQgdG8gbm90ZSB0aGF0IGl0IGlzIGV4cGVjdGVkIFVFRkkgd2lsbAorCQkg
KiBvbmx5IGxpZ2h0IHVwIGEgc2luZ2xlIGRpc3BsYXkgb24gUE9TVCwgdGhlcmVmb3JlIHdlIG9u
bHkgZXhwZWN0CisJCSAqIG9uZSBzdHJlYW0gd2l0aCBzZWFtbGVzcyBib290IGZsYWcgc2V0Lgog
CQkgKi8KLQkJZGMtPm9wdGltaXplX3NlYW1sZXNzX2Jvb3QgPSBmYWxzZTsKLQkJZGMtPm9wdGlt
aXplZF9yZXF1aXJlZCA9IHRydWU7CisJCWlmIChzdHJlYW0tPmFwcGx5X3NlYW1sZXNzX2Jvb3Rf
b3B0aW1pemF0aW9uKSB7CisJCQlzdHJlYW0tPmFwcGx5X3NlYW1sZXNzX2Jvb3Rfb3B0aW1pemF0
aW9uID0gZmFsc2U7CisJCQlkYy0+b3B0aW1pemVfc2VhbWxlc3NfYm9vdCA9IGZhbHNlOworCQkJ
ZGMtPm9wdGltaXplZF9yZXF1aXJlZCA9IHRydWU7CisJCX0KIAl9CiAKIAlpZiAodXBkYXRlX3R5
cGUgPT0gVVBEQVRFX1RZUEVfRlVMTCAmJiAhZGMtPm9wdGltaXplX3NlYW1sZXNzX2Jvb3QpIHsK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
