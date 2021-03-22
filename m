Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1582344A51
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10076E508;
	Mon, 22 Mar 2021 16:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37206E508;
 Mon, 22 Mar 2021 16:05:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E526619B3;
 Mon, 22 Mar 2021 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429130;
 bh=Cz6Ib/Jy2MCBRG3RkrW7YxIgzj/6kEv+v4DuuyruVdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YmX1KQkIWDTM9oL9SIaizhQuXBgId2TgjaOHRvpRa8ujB1Hj1aOwCgrCrMNJVi2gq
 P8VgokfOwAmfnYZLX1rsRk4pLvkeDX2bspNuX1VYi25/JXoxXtnn7F2MgFWC0FsAFu
 N+uQuJ3Me21QeU0KrCs4aFbaBIGeJwlctHwPj1pA51MBMY2ra+UvbFh+zl+P+BsSj9
 1ElKemq6Wxa1TUdo/FGf/LywTMYZxZt3573Q+qI3GKdCXVd48krzSZHquQETNI++01
 tCB8r6B7NO2iohCFFlGopnfYJGFYOD5rOpt+nJhCejnPW+cx72ztkTHm7tbHkrEoPf
 S1/KeKBMSo8Ag==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 10/11] drm/i915: avoid stringop-overread warning on pri_latency
Date: Mon, 22 Mar 2021 17:02:48 +0100
Message-Id: <20210322160253.4032422-11-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linux-scsi@vger.kernel.org, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org,
 Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Aditya Swarup <aditya.swarup@intel.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-security-module@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Simon Kelley <simon@thekelleys.org.uk>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYy0xMSB3YXJucyBhYm91dCB3
aGF0IGFwcGVhcnMgdG8gYmUgYW4gb3V0LW9mLXJhbmdlIGFycmF5IGFjY2VzczoKCkluIGZ1bmN0
aW9uIOKAmHNuYl93bV9sYXRlbmN5X3F1aXJr4oCZLAogICAgaW5saW5lZCBmcm9tIOKAmGlsa19z
ZXR1cF93bV9sYXRlbmN54oCZIGF0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmM6MzEw
ODozOgpkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jOjMwNTc6OTogZXJyb3I6IOKAmGlu
dGVsX3ByaW50X3dtX2xhdGVuY3nigJkgcmVhZGluZyAxNiBieXRlcyBmcm9tIGEgcmVnaW9uIG9m
IHNpemUgMTAgWy1XZXJyb3I9c3RyaW5nb3Atb3ZlcnJlYWRdCiAzMDU3IHwgICAgICAgICBpbnRl
bF9wcmludF93bV9sYXRlbmN5KGRldl9wcml2LCAiUHJpbWFyeSIsIGRldl9wcml2LT53bS5wcmlf
bGF0ZW5jeSk7CiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KZHJpdmVycy9ncHUvZHJtL2k5
MTUvaW50ZWxfcG0uYzogSW4gZnVuY3Rpb24g4oCYaWxrX3NldHVwX3dtX2xhdGVuY3nigJk6CmRy
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmM6MzA1Nzo5OiBub3RlOiByZWZlcmVuY2luZyBh
cmd1bWVudCAzIG9mIHR5cGUg4oCYY29uc3QgdTE2ICrigJkge2FrYSDigJhjb25zdCBzaG9ydCB1
bnNpZ25lZCBpbnQgKuKAmX0KZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYzoyOTk0OjEz
OiBub3RlOiBpbiBhIGNhbGwgdG8gZnVuY3Rpb24g4oCYaW50ZWxfcHJpbnRfd21fbGF0ZW5jeeKA
mQogMjk5NCB8IHN0YXRpYyB2b2lkIGludGVsX3ByaW50X3dtX2xhdGVuY3koc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2LAogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KCk15IGd1ZXNzIGlzIHRoYXQgdGhpcyBjb2RlIGlzIGFjdHVhbGx5IHNhZmUgYmVj
YXVzZSB0aGUgc2l6ZSBvZiB0aGUKYXJyYXkgZGVwZW5kcyBvbiB0aGUgaGFyZHdhcmUgZ2VuZXJh
dGlvbiwgYW5kIHRoZSBmdW5jdGlvbiBjaGVja3MgZm9yCnRoYXQsIGJ1dCBhdCB0aGUgc2FtZSB0
aW1lIEkgd291bGQgbm90IGV4cGVjdCB0aGUgY29tcGlsZXIgdG8gd29yayBpdApvdXQgY29ycmVj
dGx5LCBhbmQgdGhlIGNvZGUgc2VlbXMgYSBsaXR0bGUgZnJhZ2lsZSB3aXRoIHJlZ2FyZHMgdG8K
ZnV0dXJlIGNoYW5nZXMuIFNpbXBseSBpbmNyZWFzaW5nIHRoZSBzaXplIG9mIHRoZSBhcnJheSBz
aG91bGQgaGVscC4KClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCB8IDYgKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X2Rydi5oCmluZGV4IDI2ZDY5ZDA2YWE2ZC4uMzU2NzYwMmUwYTM1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfZHJ2LmgKQEAgLTEwOTUsMTEgKzEwOTUsMTEgQEAgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUg
ewogCQkgKiBpbiAwLjV1cyB1bml0cyBmb3IgV00xKy4KIAkJICovCiAJCS8qIHByaW1hcnkgKi8K
LQkJdTE2IHByaV9sYXRlbmN5WzVdOworCQl1MTYgcHJpX2xhdGVuY3lbOF07CiAJCS8qIHNwcml0
ZSAqLwotCQl1MTYgc3ByX2xhdGVuY3lbNV07CisJCXUxNiBzcHJfbGF0ZW5jeVs4XTsKIAkJLyog
Y3Vyc29yICovCi0JCXUxNiBjdXJfbGF0ZW5jeVs1XTsKKwkJdTE2IGN1cl9sYXRlbmN5WzhdOwog
CQkvKgogCQkgKiBSYXcgd2F0ZXJtYXJrIG1lbW9yeSBsYXRlbmN5IHZhbHVlcwogCQkgKiBmb3Ig
U0tMIGZvciBhbGwgOCBsZXZlbHMKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
