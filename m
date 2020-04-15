Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496831A9D44
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 13:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686FC6E999;
	Wed, 15 Apr 2020 11:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FA46E999
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:44:44 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25334206A2;
 Wed, 15 Apr 2020 11:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586951083;
 bh=5awcBRC1vnFsSufAGrSrHlTj08tl0RW0fzavbHxoj8o=;
 h=From:To:Cc:Subject:Date:From;
 b=hfbfNGOtui5TfQ0KAnEDcZWrDcHpB14TSOadzAIVmkDpUyN9+Dzj+qd++OAjCS3Jo
 ozL4enx4HsVUVoLNxyHEpc8zT3dt/X2PgB901FidvwdeLhqIIrQ985c3IEYlNAvxEv
 C1Y+SlyTA4+MVcDwZ/hA4hwIHRnzJuBjEzrPbays=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 01/84] drm/ttm: flush the fence on the bo after we
 individualize the reservation object
Date: Wed, 15 Apr 2020 07:43:18 -0400
Message-Id: <20200415114442.14166-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Sasha Levin <sashal@kernel.org>, xinhui pan <xinhui.pan@amd.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogeGluaHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
MWJiY2Y2OWU0MmZlN2ZkNDliNmY0MzM5Yzk3MDcyOWQwZTM0Mzc1MyBdCgpBcyB3ZSBtb3ZlIHRo
ZSB0dG1fYm9faW5kaXZpZHVhbGl6ZV9yZXN2KCkgdXB3YXJkcywgd2UgbmVlZCBmbHVzaCB0aGUK
Y29waWVkIGZlbmNlIHRvby4gT3RoZXJ3aXNlIHRoZSBkcml2ZXIga2VlcHMgd2FpdGluZyBmb3Ig
ZmVuY2UuCgpydW4mS2lsbCBrZmR0ZXN0LCB0aGVuIHBlcmYgdG9wLgoKICAyNS41MyUgIFt0dG1d
ICAgICAgICAgICAgICAgICAgICAgW2tdIHR0bV9ib19kZWxheWVkX2RlbGV0ZQogIDI0LjI5JSAg
W2tlcm5lbF0gICAgICAgICAgICAgICAgICBba10gZG1hX3Jlc3ZfdGVzdF9zaWduYWxlZF9yY3UK
ICAxOS43MiUgIFtrZXJuZWxdICAgICAgICAgICAgICAgICAgW2tdIHd3X211dGV4X2xvY2sKCkZp
eDogMzc4ZTJkNWIoImRybS90dG06IGZpeCB0dG1fYm9fY2xlYW51cF9yZWZzX29yX3F1ZXVlIG9u
Y2UgbW9yZSIpClNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhpbmh1aS5wYW5AYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
TGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy83MjMzOS8KU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCmluZGV4IGYwNzgwMzY5OTgw
OTIuLmFiZjE2NWIyZjY0ZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpAQCAtNTE3LDggKzUxNywxMCBA
QCBzdGF0aWMgdm9pZCB0dG1fYm9fY2xlYW51cF9yZWZzX29yX3F1ZXVlKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8pCiAKIAkJZG1hX3Jlc3ZfdW5sb2NrKGJvLT5iYXNlLnJlc3YpOwogCX0K
LQlpZiAoYm8tPmJhc2UucmVzdiAhPSAmYm8tPmJhc2UuX3Jlc3YpCisJaWYgKGJvLT5iYXNlLnJl
c3YgIT0gJmJvLT5iYXNlLl9yZXN2KSB7CisJCXR0bV9ib19mbHVzaF9hbGxfZmVuY2VzKGJvKTsK
IAkJZG1hX3Jlc3ZfdW5sb2NrKCZiby0+YmFzZS5fcmVzdik7CisJfQogCiBlcnJvcjoKIAlrcmVm
X2dldCgmYm8tPmxpc3Rfa3JlZik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
