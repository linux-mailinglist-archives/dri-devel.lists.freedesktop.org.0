Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FCF1CB932
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 22:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D9F6EB67;
	Fri,  8 May 2020 20:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C357D6EB64
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 20:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588970918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QheNznjVPmakQiU+O7e0zvxyU/NmorAuqat6FWMl4Ds=;
 b=MjomNuJoMONOBtQj71veoAbb2fhXdAZZDIMR2gD1ejRJPevLyPuU8vWnBQshq35NOkcdLe
 vbTcsRHVEYmZRO9bBjolXQ8KknS0CWY0VPMTur0dnhNKhDCLPKN1QIAvSvjhoKnz35a2BN
 znb4wLhv9hpyEJG1JbomrN2qKTY2CEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-u4tyqxqjM3mP7LzECjmJAg-1; Fri, 08 May 2020 16:48:36 -0400
X-MC-Unique: u4tyqxqjM3mP7LzECjmJAg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20B871005510;
 Fri,  8 May 2020 20:48:34 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-118-29.rdu2.redhat.com [10.10.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B942E5D9CA;
 Fri,  8 May 2020 20:48:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC v4 02/12] kthread: Add kthread_(un)block_work_queuing() and
 kthread_work_queuable()
Date: Fri,  8 May 2020 16:46:52 -0400
Message-Id: <20200508204751.155488-3-lyude@redhat.com>
In-Reply-To: <20200508204751.155488-1-lyude@redhat.com>
References: <20200508204751.155488-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Petr Mladek <pmladek@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Liang Chen <cl@rock-chips.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHNvbWUgc2ltcGxlIHdyYXBwZXJzIGFyb3VuZCBpbmNyZW1lbnRpbmcvZGVjcmVtZW50aW5n
Cmt0aHJlYWRfd29yay5jYW5jZWxsaW5nIHVuZGVyIGxvY2ssIGFsb25nIHdpdGggY2hlY2tpbmcg
d2hldGhlciBxdWV1aW5nCmlzIGN1cnJlbnRseSBhbGxvd2VkIG9uIGEgZ2l2ZW4ga3RocmVhZF93
b3JrLCB3aGljaCB3ZSdsbCB1c2Ugd2FudCB0bwppbXBsZW1lbnQgd29yayBjYW5jZWxsaW5nIHdp
dGggRFJNJ3MgdmJsYW5rIHdvcmsgaGVscGVycy4KCkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+CkNjOiBUZWp1biBIZW8gPHRqQGtlcm5lbC5vcmc+CkNjOiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9m
Zi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2t0
aHJlYWQuaCB8IDE5ICsrKysrKysrKysrKysrKysrCiBrZXJuZWwva3RocmVhZC5jICAgICAgICB8
IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDY1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t0aHJl
YWQuaCBiL2luY2x1ZGUvbGludXgva3RocmVhZC5oCmluZGV4IDAwMDY1NDBjZTdmOS4uYzZmZWUy
MDBmY2VkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t0aHJlYWQuaAorKysgYi9pbmNsdWRl
L2xpbnV4L2t0aHJlYWQuaApAQCAtMjExLDkgKzIxMSwyOCBAQCB2b2lkIGt0aHJlYWRfZmx1c2hf
d29ya2VyKHN0cnVjdCBrdGhyZWFkX3dvcmtlciAqd29ya2VyKTsKIAogYm9vbCBrdGhyZWFkX2Nh
bmNlbF93b3JrX3N5bmMoc3RydWN0IGt0aHJlYWRfd29yayAqd29yayk7CiBib29sIGt0aHJlYWRf
Y2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKHN0cnVjdCBrdGhyZWFkX2RlbGF5ZWRfd29yayAqd29y
ayk7Cit2b2lkIGt0aHJlYWRfYmxvY2tfd29ya19xdWV1aW5nKHN0cnVjdCBrdGhyZWFkX3dvcmtl
ciAqd29ya2VyLAorCQkJCXN0cnVjdCBrdGhyZWFkX3dvcmsgKndvcmspOwordm9pZCBrdGhyZWFk
X3VuYmxvY2tfd29ya19xdWV1aW5nKHN0cnVjdCBrdGhyZWFkX3dvcmtlciAqd29ya2VyLAorCQkJ
CSAgc3RydWN0IGt0aHJlYWRfd29yayAqd29yayk7CiAKIHZvaWQga3RocmVhZF9kZXN0cm95X3dv
cmtlcihzdHJ1Y3Qga3RocmVhZF93b3JrZXIgKndvcmtlcik7CiAKKy8qKgorICoga3RocmVhZF93
b3JrX3F1ZXVhYmxlIC0gd2hldGhlciBvciBub3QgYSBrdGhyZWFkIHdvcmsgY2FuIGJlIHF1ZXVl
ZAorICogQHdvcms6IFRoZSBrdGhyZWFkIHdvcmsgdG8gY2hlY2sKKyAqCisgKiBDaGVja3Mgd2hl
dGhlciBvciBub3QgcXVldWluZyBAd29yayBpcyBjdXJyZW50bHkgYmxvY2tlZCBmcm9tIHF1ZXVp
bmcsCisgKiBlaXRoZXIgYnkga3RocmVhZF9jYW5jZWxfd29ya19zeW5jKCkgYW5kIGZyaWVuZHMg
b3IKKyAqIGt0aHJlYWRfYmxvY2tfd29ya19xdWV1aW5nKCkuCisgKgorICogUmV0dXJuczogd2hl
dGhlciBvciBub3QgdGhlIEB3b3JrIG1heSBiZSBxdWV1ZWQuCisgKi8KK3N0YXRpYyBpbmxpbmUg
Ym9vbCBrdGhyZWFkX3dvcmtfcXVldWFibGUoc3RydWN0IGt0aHJlYWRfd29yayAqd29yaykKK3sK
KwlyZXR1cm4gUkVBRF9PTkNFKHdvcmstPmNhbmNlbGluZykgPT0gMDsKK30KKwogc3RydWN0IGNn
cm91cF9zdWJzeXNfc3RhdGU7CiAKICNpZmRlZiBDT05GSUdfQkxLX0NHUk9VUApkaWZmIC0tZ2l0
IGEva2VybmVsL2t0aHJlYWQuYyBiL2tlcm5lbC9rdGhyZWFkLmMKaW5kZXggYzFmOGVjOWQ1ODM2
Li5mOGE1YzVhODdjYzYgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9rdGhyZWFkLmMKKysrIGIva2VybmVs
L2t0aHJlYWQuYwpAQCAtMTE4Nyw2ICsxMTg3LDUyIEBAIGJvb2wga3RocmVhZF9jYW5jZWxfZGVs
YXllZF93b3JrX3N5bmMoc3RydWN0IGt0aHJlYWRfZGVsYXllZF93b3JrICpkd29yaykKIH0KIEVY
UE9SVF9TWU1CT0xfR1BMKGt0aHJlYWRfY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKTsKIAorLyoq
CisgKiBrdGhyZWFkX2Jsb2NrX3dvcmtfcXVldWluZyAtIHByZXZlbnQgYSBrdGhyZWFkX3dvcmsg
ZnJvbSBiZWluZyBxdWV1ZWQKKyAqIHdpdGhvdXQgYWN0dWFsbHkgY2FuY2VsbGluZyBpdAorICog
QHdvcmtlcjoga3RocmVhZCB3b3JrZXIgdG8gdXNlCisgKiBAd29yazogd29yayB0byBibG9jayBx
dWV1aW5nIG9uCisgKgorICogUHJldmVudHMgQHdvcmsgZnJvbSBiZWluZyBxdWV1ZWQgdXNpbmcg
a3RocmVhZF9xdWV1ZV93b3JrKCkgYW5kIGZyaWVuZHMsCisgKiBidXQgZG9lc24ndCBhdHRlbXB0
IHRvIGNhbmNlbCBhbnkgcHJldmlvdXMgcXVldWluZy4gVGhlIGNhbGxlciBtdXN0IHVuYmxvY2sK
KyAqIHF1ZXVpbmcgbGF0ZXIgYnkgY2FsbGluZyBrdGhyZWFkX3VuYmxvY2tfd29ya19xdWV1aW5n
KCkuIFRoaXMgY2FsbCBjYW4gYmUKKyAqIGNhbGxlZCBtdWx0aXBsZSB0aW1lcy4KKyAqCisgKiBT
ZWUgYWxzbzoga3RocmVhZF93b3JrX3F1ZXVhYmxlKCkKKyAqLwordm9pZCBrdGhyZWFkX2Jsb2Nr
X3dvcmtfcXVldWluZyhzdHJ1Y3Qga3RocmVhZF93b3JrZXIgKndvcmtlciwKKwkJCQlzdHJ1Y3Qg
a3RocmVhZF93b3JrICp3b3JrKQoreworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CisKKwlyYXdfc3Bp
bl9sb2NrX2lycXNhdmUoJndvcmtlci0+bG9jaywgZmxhZ3MpOworCXdvcmstPmNhbmNlbGluZysr
OworCXJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZ3b3JrZXItPmxvY2ssIGZsYWdzKTsKK30K
K0VYUE9SVF9TWU1CT0xfR1BMKGt0aHJlYWRfYmxvY2tfd29ya19xdWV1aW5nKTsKKworLyoqCisg
KiBrdGhyZWFkX3VuYmxvY2tfd29ya19xdWV1aW5nIC0gdW5ibG9jayBxdWV1aW5nIG9uIGEga3Ro
cmVhZF93b3JrCisgKiBAd29ya2VyOiBrdGhyZWFkIHdvcmtlciB0byB1c2UKKyAqIEB3b3JrOiB3
b3JrIHRvIHVuYmxvY2sgcXVldWluZyBvbgorICoKKyAqIFJlbW92ZXMgYSByZXF1ZXN0IHRvIHBy
ZXZlbnQgQHdvcmsgZnJvbSBiZWluZyBxdWV1ZWQgd2l0aAorICoga3RocmVhZF9xdWV1ZV93b3Jr
KCkgYW5kIGZyaWVuZHMsIHNvIHRoYXQgaXQgbWF5IHBvdGVudGlhbGx5IGJlIHF1ZXVlZAorICog
YWdhaW4uCisgKgorICogU2VlIGFsc286IGt0aHJlYWRfd29ya19xdWV1YWJsZSgpCisgKi8KK3Zv
aWQga3RocmVhZF91bmJsb2NrX3dvcmtfcXVldWluZyhzdHJ1Y3Qga3RocmVhZF93b3JrZXIgKndv
cmtlciwKKwkJCQkgIHN0cnVjdCBrdGhyZWFkX3dvcmsgKndvcmspCit7CisJdW5zaWduZWQgbG9u
ZyBmbGFnczsKKworCXJhd19zcGluX2xvY2tfaXJxc2F2ZSgmd29ya2VyLT5sb2NrLCBmbGFncyk7
CisJV0FSTl9PTl9PTkNFKC0td29yay0+Y2FuY2VsaW5nIDwgMCk7CisJcmF3X3NwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJndvcmtlci0+bG9jaywgZmxhZ3MpOworfQorRVhQT1JUX1NZTUJPTF9HUEwo
a3RocmVhZF91bmJsb2NrX3dvcmtfcXVldWluZyk7CisKIC8qKgogICoga3RocmVhZF9mbHVzaF93
b3JrZXIgLSBmbHVzaCBhbGwgY3VycmVudCB3b3JrcyBvbiBhIGt0aHJlYWRfd29ya2VyCiAgKiBA
d29ya2VyOiB3b3JrZXIgdG8gZmx1c2gKLS0gCjIuMjUuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
