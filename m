Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3C7E0C49
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 21:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968156E8DE;
	Tue, 22 Oct 2019 19:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECD66E8DE;
 Tue, 22 Oct 2019 19:12:25 +0000 (UTC)
Received: from localhost.localdomain (rrcs-50-75-166-42.nys.biz.rr.com
 [50.75.166.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD91521929;
 Tue, 22 Oct 2019 19:12:22 +0000 (UTC)
From: paulmck@kernel.org
To: rcu@vger.kernel.org
Subject: [PATCH tip/core/rcu 03/10] drivers/gpu: Replace rcu_swap_protected()
 with rcu_replace()
Date: Tue, 22 Oct 2019 12:12:08 -0700
Message-Id: <20191022191215.25781-3-paulmck@kernel.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20191022191136.GA25627@paulmck-ThinkPad-P72>
References: <20191022191136.GA25627@paulmck-ThinkPad-P72>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571771544;
 bh=inhfkOQ9xIrGDaCXR3ixnBd1vmXaWhpuxLRSRAKlsWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ey3dmNkSSy9+VhZatSefvVHUlOQmRmf4ayTRDRoEl0yBjeL/KIK7JUHddhoroBK62
 ss5alIYeXVCEvv042Mn3H42RH3aZI8KvX3I2u9bcn8Y3VMiNkOpU/HxNz7lLE0keP3
 YgBhVpFNXO8jbnlFi7Ai0xppgCT17WZXccEuJZ5A=
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
Cc: peterz@infradead.org, fweisbec@gmail.com, jiangshanlai@gmail.com,
 dri-devel@lists.freedesktop.org, oleg@redhat.com, dhowells@redhat.com,
 edumazet@google.com, joel@joelfernandes.org, mingo@kernel.org,
 David Airlie <airlied@linux.ie>, dipankar@in.ibm.com,
 "Paul E. McKenney" <paulmck@kernel.org>, intel-gfx@lists.freedesktop.org,
 josh@joshtriplett.org, mathieu.desnoyers@efficios.com, rostedt@goodmis.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, tglx@linutronix.de,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIlBhdWwgRS4gTWNLZW5uZXkiIDxwYXVsbWNrQGtlcm5lbC5vcmc+CgpUaGlzIGNvbW1p
dCByZXBsYWNlcyB0aGUgdXNlIG9mIHJjdV9zd2FwX3Byb3RlY3RlZCgpIHdpdGggdGhlIG1vcmUK
aW50dWl0aXZlbHkgYXBwZWFsaW5nIHJjdV9yZXBsYWNlKCkgYXMgYSBzdGVwIHRvd2FyZHMgcmVt
b3ZpbmcKcmN1X3N3YXBfcHJvdGVjdGVkKCkuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sL0NBSGstPXdpQXNKTHcxZWdGRUU9WjctR0d0TTZ3Y3Z0eXl0WFpBMStCSHF0YTRnZzZI
d0BtYWlsLmdtYWlsLmNvbS8KUmVwb3J0ZWQtYnk6IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0Bs
aW51eC1mb3VuZGF0aW9uLm9yZz4KWyBwYXVsbWNrOiBGcm9tIHJjdV9yZXBsYWNlKCkgdG8gcmN1
X3JlcGxhY2VfcG9pbnRlcigpIHBlciBJbmdvIE1vbG5hci4gXQpTaWduZWQtb2ZmLWJ5OiBQYXVs
IEUuIE1jS2VubmV5IDxwYXVsbWNrQGtlcm5lbC5vcmc+CkNjOiBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAbGludXguaW50ZWwuY29tPgpDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGlu
ZW5AbGludXguaW50ZWwuY29tPgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+CkNjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgpDYzog
PGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+CkNjOiA8ZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fY29u
dGV4dC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NvbnRl
eHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jb250ZXh0LmMKaW5kZXgg
MWNkZmUwNS4uM2YzZTgwMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX2NvbnRleHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
Y29udGV4dC5jCkBAIC0xNjI5LDcgKzE2MjksNyBAQCBzZXRfZW5naW5lcyhzdHJ1Y3QgaTkxNV9n
ZW1fY29udGV4dCAqY3R4LAogCQlpOTE1X2dlbV9jb250ZXh0X3NldF91c2VyX2VuZ2luZXMoY3R4
KTsKIAllbHNlCiAJCWk5MTVfZ2VtX2NvbnRleHRfY2xlYXJfdXNlcl9lbmdpbmVzKGN0eCk7Ci0J
cmN1X3N3YXBfcHJvdGVjdGVkKGN0eC0+ZW5naW5lcywgc2V0LmVuZ2luZXMsIDEpOworCXNldC5l
bmdpbmVzID0gcmN1X3JlcGxhY2VfcG9pbnRlcihjdHgtPmVuZ2luZXMsIHNldC5lbmdpbmVzLCAx
KTsKIAltdXRleF91bmxvY2soJmN0eC0+ZW5naW5lc19tdXRleCk7CiAKIAljYWxsX3JjdSgmc2V0
LmVuZ2luZXMtPnJjdSwgZnJlZV9lbmdpbmVzX3JjdSk7Ci0tIAoyLjkuNQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
