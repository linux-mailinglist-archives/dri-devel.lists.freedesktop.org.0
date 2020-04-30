Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B723A1BF9FE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 15:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543B68973E;
	Thu, 30 Apr 2020 13:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225596E8AD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 13:51:11 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4554621775;
 Thu, 30 Apr 2020 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588254671;
 bh=UUerJjfHpwzmoAU169iQTTzVJIn8QWxF04p5YHMxj/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rnMbCvu/rpeJ4MCupTQyBzL3lUCyoWwOVPRcPRAattMCrzHYPe3kIaxsjR+ZpGDir
 706txQbJ3BYB7GUqSM7pQxrYrj0bugHcqlanWV+7caLwPb1S5Oc0rmz9AaEJadSSHz
 X+uY67Rhgs5qQrA2jVlWtXAqeugVZLC7Dz7ZgHMo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 23/79] drm/scheduler: fix drm_sched_get_cleanup_job
Date: Thu, 30 Apr 2020 09:49:47 -0400
Message-Id: <20200430135043.19851-23-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430135043.19851-1-sashal@kernel.org>
References: <20200430135043.19851-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Kent Russell <kent.russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgODYyM2I1MjU1YWU3Y2NhZjI3NmFhYzM5MjA3ODdiZjU3NWZhNmIzNyBdCgpX
ZSBhcmUgcmFjaW5nIHRvIGluaXRpYWxpemUgc2NoZWQtPnRocmVhZCBoZXJlLCBqdXN0IGFsd2F5
cyBjaGVjayB0aGUKY3VycmVudCB0aHJlYWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbmRyZXkgR3JvZHpv
dnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEtlbnQgUnVzc2Vs
bCA8a2VudC5ydXNzZWxsQGFtZC5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC8zNjEzMDMvClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxA
a2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKaW5kZXggNjBjNGM2YTFhYWM2OC4uNzU3
MzdlYzU5NjE0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKQEAgLTY4
Nyw3ICs2ODcsNyBAQCBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iKHN0cnVjdCBkcm1fZ3B1X3Nj
aGVkdWxlciAqc2NoZWQpCiAJICovCiAJaWYgKChzY2hlZC0+dGltZW91dCAhPSBNQVhfU0NIRURV
TEVfVElNRU9VVCAmJgogCSAgICAhY2FuY2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRy
KSkgfHwKLQkgICAgX19rdGhyZWFkX3Nob3VsZF9wYXJrKHNjaGVkLT50aHJlYWQpKQorCSAgICBr
dGhyZWFkX3Nob3VsZF9wYXJrKCkpCiAJCXJldHVybiBOVUxMOwogCiAJc3Bpbl9sb2NrX2lycXNh
dmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
