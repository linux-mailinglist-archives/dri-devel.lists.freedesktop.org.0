Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081B0C965A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 03:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52626E03C;
	Thu,  3 Oct 2019 01:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1016E03C;
 Thu,  3 Oct 2019 01:43:13 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78982222CA;
 Thu,  3 Oct 2019 01:43:12 +0000 (UTC)
From: paulmck@kernel.org
To: rcu@vger.kernel.org
Subject: [PATCH tip/core/rcu 3/9] drivers/gpu: Replace rcu_swap_protected()
 with rcu_replace()
Date: Wed,  2 Oct 2019 18:43:04 -0700
Message-Id: <20191003014310.13262-3-paulmck@kernel.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20191003014153.GA13156@paulmck-ThinkPad-P72>
References: <20191003014153.GA13156@paulmck-ThinkPad-P72>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570066992;
 bh=pecg14+rqKCe9+MU1znEqt1dgbZQC6DApkD13yS7z0k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aR9o0x1NHONIbxPoNOj8+Ux2ZBnn1MPxi/Eaxd2edaSTIw39ipumC3Ndu4BXSFyag
 7fSr1WKYBdYOcypMBAqTPl1y4f/M7W09FmEOoeFeg1kOl/FnKZ/PvU9nzUhm//Smok
 Za9vci8Sk49LJWA2iNQ8Knf/e7tHAtyDSW+QF1uQ=
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
aW51eC1mb3VuZGF0aW9uLm9yZz4KU2lnbmVkLW9mZi1ieTogUGF1bCBFLiBNY0tlbm5leSA8cGF1
bG1ja0BrZXJuZWwub3JnPgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVs
LmNvbT4KQ2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNv
bT4KQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogVHZydGtv
IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KQ2M6IDxpbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPgpDYzogPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NvbnRleHQuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jb250ZXh0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fY29udGV4dC5jCmluZGV4IDFjZGZlMDUuLmM1YzIyYzQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jb250ZXh0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NvbnRleHQuYwpAQCAtMTYy
OSw3ICsxNjI5LDcgQEAgc2V0X2VuZ2luZXMoc3RydWN0IGk5MTVfZ2VtX2NvbnRleHQgKmN0eCwK
IAkJaTkxNV9nZW1fY29udGV4dF9zZXRfdXNlcl9lbmdpbmVzKGN0eCk7CiAJZWxzZQogCQlpOTE1
X2dlbV9jb250ZXh0X2NsZWFyX3VzZXJfZW5naW5lcyhjdHgpOwotCXJjdV9zd2FwX3Byb3RlY3Rl
ZChjdHgtPmVuZ2luZXMsIHNldC5lbmdpbmVzLCAxKTsKKwlzZXQuZW5naW5lcyA9IHJjdV9yZXBs
YWNlKGN0eC0+ZW5naW5lcywgc2V0LmVuZ2luZXMsIDEpOwogCW11dGV4X3VubG9jaygmY3R4LT5l
bmdpbmVzX211dGV4KTsKIAogCWNhbGxfcmN1KCZzZXQuZW5naW5lcy0+cmN1LCBmcmVlX2VuZ2lu
ZXNfcmN1KTsKLS0gCjIuOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
