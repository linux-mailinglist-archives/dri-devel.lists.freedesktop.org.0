Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0141344A61
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E716F6E507;
	Mon, 22 Mar 2021 16:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4984E6E507;
 Mon, 22 Mar 2021 16:05:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49D21619CF;
 Mon, 22 Mar 2021 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429143;
 bh=ppc9fZupOrjA6hpvzPGCige1HMZi82rKq0OzuPiwp30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KfNQhB8I6TCilI9rWZIUvrD60VxxXK7zzzf2CzYQVcPCX4dTFC+5vrq57/HXue9eN
 7bPBi+K09Uuo8FgLHJN5cLADDDnPtd+D6sEhJhO/VLvKBoLaRa1BESfKHtMpZuvnwh
 D3Vc4uZU9Dcg74j9eeiZa4qkcbeOz2ZvcezhMcicUmJ4FzCGExiFKR4ER32CvaOaWV
 akMTcdJNfGrFGH5JvGZ7qns0oNxpRTzGH0qZ76EqyoQfhjLJvxqyHurET1PBvf6svb
 dBMESSwDo3iJsmPDGBQ1mVtfw03/ahNqDciEznfWOfvZZJNzU8YYxi4I1doMFPdTRo
 oo8eGNoKcMUqQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 11/11] [RFC] drm/i915/dp: fix array overflow warning
Date: Mon, 22 Mar 2021 17:02:49 +0100
Message-Id: <20210322160253.4032422-12-arnd@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 Animesh Manna <animesh.manna@intel.com>, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Uma Shankar <uma.shankar@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, ath11k@lists.infradead.org,
 Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, Sean Paul <seanpaul@chromium.org>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 Manasi Navare <manasi.d.navare@intel.com>,
 linux-security-module@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYy0xMSB3YXJucyB0aGF0IGlu
dGVsX2RwX2NoZWNrX21zdF9zdGF0dXMoKSBoYXMgYSBsb2NhbCBhcnJheSBvZgpmb3VydGVlbiBi
eXRlcyBhbmQgcGFzc2VzIHRoZSBsYXN0IGZvdXIgYnl0ZXMgaW50byBhIGZ1bmN0aW9uIHRoYXQK
ZXhwZWN0cyBhIHNpeC1ieXRlIGFycmF5OgoKZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcC5jOiBJbiBmdW5jdGlvbiDigJhpbnRlbF9kcF9jaGVja19tc3Rfc3RhdHVz4oCZOgpk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmM6NDU1NjoyMjogZXJyb3I6IOKA
mGRybV9kcF9jaGFubmVsX2VxX29r4oCZIHJlYWRpbmcgNiBieXRlcyBmcm9tIGEgcmVnaW9uIG9m
IHNpemUgNCBbLVdlcnJvcj1zdHJpbmdvcC1vdmVycmVhZF0KIDQ1NTYgfCAgICAgICAgICAgICAg
ICAgICAgICFkcm1fZHBfY2hhbm5lbF9lcV9vaygmZXNpWzEwXSwgaW50ZWxfZHAtPmxhbmVfY291
bnQpKSB7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwLmM6NDU1NjoyMjogbm90ZTogcmVmZXJlbmNpbmcgYXJndW1lbnQgMSBvZiB0
eXBlIOKAmGNvbnN0IHU4ICrigJkge2FrYSDigJhjb25zdCB1bnNpZ25lZCBjaGFyICrigJl9Cklu
IGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmM6Mzg6CmluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaDoxNDU5OjY6IG5vdGU6IGluIGEgY2Fs
bCB0byBmdW5jdGlvbiDigJhkcm1fZHBfY2hhbm5lbF9lcV9va+KAmQogMTQ1OSB8IGJvb2wgZHJt
X2RwX2NoYW5uZWxfZXFfb2soY29uc3QgdTggbGlua19zdGF0dXNbRFBfTElOS19TVEFUVVNfU0la
RV0sCiAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fgoKQ2xlYXJseSBzb21ldGhpbmcg
aXMgd3JvbmcgaGVyZSwgYnV0IEkgY2FuJ3QgcXVpdGUgZmlndXJlIG91dCB3aGF0LgpDaGFuZ2lu
ZyB0aGUgYXJyYXkgc2l6ZSB0byAxNiBieXRlcyBhdm9pZHMgdGhlIHdhcm5pbmcsIGJ1dCBpcwpw
cm9iYWJseSB0aGUgd3Jvbmcgc29sdXRpb24gaGVyZS4KClNpZ25lZC1vZmYtYnk6IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCmluZGV4IDhjMTJk
NTM3NTYwNy4uODMwZTI1MTVmMTE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcC5jCkBAIC02NSw3ICs2NSw3IEBACiAjaW5jbHVkZSAiaW50ZWxfdmRzYy5oIgogI2luY2x1
ZGUgImludGVsX3Zyci5oIgogCi0jZGVmaW5lIERQX0RQUlhfRVNJX0xFTiAxNAorI2RlZmluZSBE
UF9EUFJYX0VTSV9MRU4gMTYKIAogLyogRFAgRFNDIHRocm91Z2hwdXQgdmFsdWVzIHVzZWQgZm9y
IHNsaWNlIGNvdW50IGNhbGN1bGF0aW9ucyBLUGl4ZWxzL3MgKi8KICNkZWZpbmUgRFBfRFNDX1BF
QUtfUElYRUxfUkFURQkJCTI3MjAwMDAKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
