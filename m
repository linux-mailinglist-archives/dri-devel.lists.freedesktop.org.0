Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7CC1A01FB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 02:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ED089B42;
	Tue,  7 Apr 2020 00:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2EF89B42
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 00:01:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FDEA2082D;
 Tue,  7 Apr 2020 00:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586217698;
 bh=Tn71Trm0DME8p2CUNER4Dh2CEke6Q6TIQHnRwW+It9Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nzXtFBNR6t5AOE07gzlad/jyb7SqJtGTtTka+MFHFmppQN4mIrirUzaXGyf0jHQzl
 dUbyGMV0EPviGcLtvn05MU9mia4yKlz8cxdDd1uecd4j3ywF6oY4WjuWtbEICTJU5T
 XX7bApYOKSXANNMvzJVzFLQ/Zj36oBqInNpztuN0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 31/35] drm/scheduler: fix rare NULL ptr race
Date: Mon,  6 Apr 2020 20:00:53 -0400
Message-Id: <20200407000058.16423-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200407000058.16423-1-sashal@kernel.org>
References: <20200407000058.16423-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alex Deucher <alexander.deucher@amd.com>,
 Yintian Tao <yttao@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWWludGlhbiBUYW8gPHl0dGFvQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCAzYzBm
ZGYzMzAyY2I0ZjE4NmM4NzE2ODRlYWM1YzQwN2ExMDdlNDgwIF0KClRoZXJlIGlzIG9uZSBvbmUg
Y29ybmVyIGNhc2UgYXQgZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQKd2hpY2ggd2lsbCByYWlzZSB0
aGUgTlVMTCBwb2ludGVyIHByb2JsZW0ganVzdCBsaWtlIGJlbG93LgotPmRtYV9mZW5jZV9zaWdu
YWwKICAgIC0+ZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQKCS0+dGVzdF9hbmRfc2V0X2JpdApoZXJl
IHRyaWdnZXIgZG1hX2ZlbmNlX3JlbGVhc2UgaGFwcGVuIGR1ZSB0byB0aGUgemVybyBvZiBmZW5j
ZSByZWZjb3VudC4KCi0+ZG1hX2ZlbmNlX3B1dAogICAgLT5kbWFfZmVuY2VfcmVsZWFzZQoJLT5k
cm1fc2NoZWRfZmVuY2VfcmVsZWFzZV9zY2hlZHVsZWQKCSAgICAtPmNhbGxfcmN1CmhlcmUgbWFr
ZSB0aGUgdW5pb24gZmxlZCDigJxjYl9saXN04oCdIGF0IGZpbmlzaGVkIGZlbmNlCnRvIE5VTEwg
YmVjYXVzZSBzdHJ1Y3QgcmN1X2hlYWQgY29udGFpbnMgdHdvIHBvaW50ZXIKd2hpY2ggaXMgc2Ft
ZSBhcyBzdHJ1Y3QgbGlzdF9oZWFkIGNiX2xpc3QKClRoZXJlZm9yZSwgdG8gaG9sZCB0aGUgcmVm
ZXJlbmNlIG9mIGZpbmlzaGVkIGZlbmNlIGF0IGRybV9zY2hlZF9wcm9jZXNzX2pvYgp0byBwcmV2
ZW50IHRoZSBudWxsIHBvaW50ZXIgZHVyaW5nIGZpbmlzaGVkIGZlbmNlIGRtYV9mZW5jZV9zaWdu
YWwKClsgIDczMi45MTI4NjddIEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwg
YWRkcmVzczogMDAwMDAwMDAwMDAwMDAwOApbICA3MzIuOTE0ODE1XSAjUEY6IHN1cGVydmlzb3Ig
d3JpdGUgYWNjZXNzIGluIGtlcm5lbCBtb2RlClsgIDczMi45MTU3MzFdICNQRjogZXJyb3JfY29k
ZSgweDAwMDIpIC0gbm90LXByZXNlbnQgcGFnZQpbICA3MzIuOTE2NjIxXSBQR0QgMCBQNEQgMApb
ICA3MzIuOTE3MDcyXSBPb3BzOiAwMDAyIFsjMV0gU01QIFBUSQpbICA3MzIuOTE3NjgyXSBDUFU6
IDcgUElEOiAwIENvbW06IHN3YXBwZXIvNyBUYWludGVkOiBHICAgICAgICAgICBPRSAgICAgNS40
LjAtcmM3ICMxClsgIDczMi45MTg5ODBdIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMg
KGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TIHJlbC0xLjguMi0wLWczM2ZiZTEzIGJ5IHFlbXUt
cHJvamVjdC5vcmcgMDQvMDEvMjAxNApbICA3MzIuOTIwOTA2XSBSSVA6IDAwMTA6ZG1hX2ZlbmNl
X3NpZ25hbF9sb2NrZWQrMHgzZS8weDEwMApbICA3MzIuOTM4NTY5XSBDYWxsIFRyYWNlOgpbICA3
MzIuOTM5MDAzXSAgPElSUT4KWyAgNzMyLjkzOTM2NF0gIGRtYV9mZW5jZV9zaWduYWwrMHgyOS8w
eDUwClsgIDczMi45NDAwMzZdICBkcm1fc2NoZWRfZmVuY2VfZmluaXNoZWQrMHgxMi8weDIwIFtn
cHVfc2NoZWRdClsgIDczMi45NDA5OTZdICBkcm1fc2NoZWRfcHJvY2Vzc19qb2IrMHgzNC8weGEw
IFtncHVfc2NoZWRdClsgIDczMi45NDE5MTBdICBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZCsweDg1
LzB4MTAwClsgIDczMi45NDI2OTJdICBkbWFfZmVuY2Vfc2lnbmFsKzB4MjkvMHg1MApbICA3MzIu
OTQzNDU3XSAgYW1kZ3B1X2ZlbmNlX3Byb2Nlc3MrMHg5OS8weDEyMCBbYW1kZ3B1XQpbICA3MzIu
OTQ0MzkzXSAgc2RtYV92NF8wX3Byb2Nlc3NfdHJhcF9pcnErMHg4MS8weGEwIFthbWRncHVdCgp2
MjogaG9sZCB0aGUgZmluaXNoZWQgZmVuY2UgYXQgZHJtX3NjaGVkX3Byb2Nlc3Nfam9iIGluc3Rl
YWQgb2YKICAgIGFtZGdwdV9mZW5jZV9wcm9jZXNzCnYzOiByZXN1bWUgdGhlIGJsYW5rIGxpbmUK
ClNpZ25lZC1vZmYtYnk6IFlpbnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPgpSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBi
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCmluZGV4IDNjNTdlODQyMjJj
YTkuLjViYjlmZWRkYmZkNmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
CkBAIC02MzIsNyArNjMyLDkgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX3Byb2Nlc3Nfam9iKHN0
cnVjdCBkbWFfZmVuY2UgKmYsIHN0cnVjdCBkbWFfZmVuY2VfY2IgKmNiKQogCiAJdHJhY2VfZHJt
X3NjaGVkX3Byb2Nlc3Nfam9iKHNfZmVuY2UpOwogCisJZG1hX2ZlbmNlX2dldCgmc19mZW5jZS0+
ZmluaXNoZWQpOwogCWRybV9zY2hlZF9mZW5jZV9maW5pc2hlZChzX2ZlbmNlKTsKKwlkbWFfZmVu
Y2VfcHV0KCZzX2ZlbmNlLT5maW5pc2hlZCk7CiAJd2FrZV91cF9pbnRlcnJ1cHRpYmxlKCZzY2hl
ZC0+d2FrZV91cF93b3JrZXIpOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
