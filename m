Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258B5A6978
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 15:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682C089548;
	Tue,  3 Sep 2019 13:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7A289548
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 13:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 5CD594041E;
 Tue,  3 Sep 2019 15:15:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HEPT9RSmogm2; Tue,  3 Sep 2019 15:15:19 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 3AAC94047D;
 Tue,  3 Sep 2019 15:15:18 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E453F360330;
 Tue,  3 Sep 2019 15:15:17 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org, pv-drivers@vmware.com,
 linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm/ttm: Cache dma pool decrypted pages when AMD SEV
 is active
Date: Tue,  3 Sep 2019 15:15:04 +0200
Message-Id: <20190903131504.18935-5-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903131504.18935-1-thomas_os@shipmail.org>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567516518; bh=1DziKwTjiIMj17OZYZOeUEJ6CP5BMAzv4f1IdbkdopM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kRDnlGIxm2xAiKU2h+6QgzVP4jgLGi7H7/e3P/PcpWk2QfzaUVu6YHSkh4zYUw4AB
 cUsOOvXQOE0f5q8skRRj2Z6FvIhsATajksRYEOj/SPQmulnssLTAa5DJniDGmjbcbG
 t0Z4hJkPl5N9cWf9aRIhktUPL0iSoqtRb76d20xc=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=kRDnlGIx; 
 dkim-atps=neutral
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIFRUTSBk
bWEgcG9vbCBhbGxvY2F0ZXMgY29oZXJlbnQgcGFnZXMgZm9yIHVzZSB3aXRoIFRUTS4gV2hlbiBm
b3JjaW5nCnVuZW5jcnlwdGVkIERNQSwgc3VjaCBhbGxvY2F0aW9ucyBiZWNvbWUgdmVyeSBleHBl
bnNpdmUgc2luY2UgdGhlIGxpbmVhcgprZXJuZWwgbWFwIGhhcyB0byBiZSBjaGFuZ2VkIHRvIG1h
cmsgdGhlIHBhZ2VzIGRlY3J5cHRlZC4gVG8gYXZvaWQgdG9vIG1hbnkKc3VjaCBhbGxvY2F0aW9u
cyBhbmQgZnJlZXMsIGNhY2hlIHRoZSBkZWNyeXB0ZWQgcGFnZXMgZXZlbiBpZiB0aGV5CmFyZSBp
biB0aGUgbm9ybWFsIGNwdSBjYWNoaW5nIHN0YXRlLCB3aGVyZSBvdGhlcndpc2UgdGhlIHBvb2wg
ZnJlZXMgdGhlbQppbW1lZGlhdGVseSB3aGVuIHVudXNlZC4KClRlc3RlZCB3aXRoIHZtd2dmeCBv
biBTRVYtRVMuCgpDYzogRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT4K
Q2M6IEFuZHkgTHV0b21pcnNraSA8bHV0b0BrZXJuZWwub3JnPgpDYzogUGV0ZXIgWmlqbHN0cmEg
PHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6IEJvcmlzbGF2IFBl
dGtvdiA8YnBAYWxpZW44LmRlPgpDYzogIkguIFBldGVyIEFudmluIiA8aHBhQHp5dG9yLmNvbT4K
Q2M6IEhlaWtvIENhcnN0ZW5zIDxoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tPgpDYzogQ2hyaXN0
aWFuIEJvcm50cmFlZ2VyIDxib3JudHJhZWdlckBkZS5pYm0uY29tPgpDYzogVG9tIExlbmRhY2t5
IDx0aG9tYXMubGVuZGFja3lAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxz
dHJvbUB2bXdhcmUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2Nf
ZG1hLmMgfCAxOSArKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9wYWdlX2FsbG9jX2RtYS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxv
Y19kbWEuYwppbmRleCA5YjE1ZGY4ZWNkNDkuLmEzMjQ3ZjI0ZTEwNiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvY19kbWEuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jCkBAIC0xMDAwLDcgKzEwMDAsNyBAQCB2b2lkIHR0
bV9kbWFfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RtYV90dCAqdHRtX2RtYSwgc3RydWN0IGRldmlj
ZSAqZGV2KQogCXN0cnVjdCBkbWFfcG9vbCAqcG9vbDsKIAlzdHJ1Y3QgZG1hX3BhZ2UgKmRfcGFn
ZSwgKm5leHQ7CiAJZW51bSBwb29sX3R5cGUgdHlwZTsKLQlib29sIGlzX2NhY2hlZCA9IGZhbHNl
OworCWJvb2wgaW1tZWRpYXRlX2ZyZWUgPSBmYWxzZTsKIAl1bnNpZ25lZCBjb3VudCwgaSwgbnBh
Z2VzID0gMDsKIAl1bnNpZ25lZCBsb25nIGlycV9mbGFnczsKIApAQCAtMTAzNSw4ICsxMDM1LDE3
IEBAIHZvaWQgdHRtX2RtYV91bnBvcHVsYXRlKHN0cnVjdCB0dG1fZG1hX3R0ICp0dG1fZG1hLCBz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAJaWYgKCFwb29sKQogCQlyZXR1cm47CiAKLQlpc19jYWNoZWQg
PSAodHRtX2RtYV9maW5kX3Bvb2wocG9vbC0+ZGV2LAotCQkgICAgIHR0bV90b190eXBlKHR0bS0+
cGFnZV9mbGFncywgdHRfY2FjaGVkKSkgPT0gcG9vbCk7CisJLyoKKwkgKiBJZiBtZW1vcnkgaXMg
Y2FjaGVkIGFuZCBzZXYgZW5jcnlwdGlvbiBpcyBub3QgYWN0aXZlLCBhbGxvY2F0aW5nCisJICog
YW5kIGZyZWVpbmcgY29oZXJlbnQgbWVtb3J5IGlzIHJlbGF0aXZlbHkgY2hlYXAsIHNvIHdlIGNh
biBmcmVlCisJICogaXQgaW1tZWRpYXRlbHkuIElmIHNldiBlbmNyeXB0aW9uIGlzIGFjdGl2ZSwg
YWxsb2NhdGluZyBjb2hlcmVudAorCSAqIG1lbW9yeSBpbnZvbHZlcyBhIGNhbGwgdG8gc2V0X21l
bW9yeV9kZWNyeXB0ZWQoKSB3aGljaCBpcyB2ZXJ5CisJICogZXhwZW5zaXZlLCBzbyBjYWNoZSBj
b2hlcmVudCBwYWdlcyBpcyBzZXYgaXMgYWN0aXZlLgorCSAqLworCWltbWVkaWF0ZV9mcmVlID0g
KHR0bV9kbWFfZmluZF9wb29sCisJCQkgIChwb29sLT5kZXYsCisJCQkgICB0dG1fdG9fdHlwZSh0
dG0tPnBhZ2VfZmxhZ3MsIHR0X2NhY2hlZCkpID09IHBvb2wgJiYKKwkJCSAgIWZvcmNlX2RtYV91
bmVuY3J5cHRlZChkZXYpKTsKIAogCS8qIG1ha2Ugc3VyZSBwYWdlcyBhcnJheSBtYXRjaCBsaXN0
IGFuZCBjb3VudCBudW1iZXIgb2YgcGFnZXMgKi8KIAljb3VudCA9IDA7CkBAIC0xMDUxLDEzICsx
MDYwLDEzIEBAIHZvaWQgdHRtX2RtYV91bnBvcHVsYXRlKHN0cnVjdCB0dG1fZG1hX3R0ICp0dG1f
ZG1hLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCQlkX3BhZ2UtPnZhZGRyICY9IH5WQUREUl9GTEFH
X1VQREFURURfQ09VTlQ7CiAJCX0KIAotCQlpZiAoaXNfY2FjaGVkKQorCQlpZiAoaW1tZWRpYXRl
X2ZyZWUpCiAJCQl0dG1fZG1hX3BhZ2VfcHV0KHBvb2wsIGRfcGFnZSk7CiAJfQogCiAJc3Bpbl9s
b2NrX2lycXNhdmUoJnBvb2wtPmxvY2ssIGlycV9mbGFncyk7CiAJcG9vbC0+bnBhZ2VzX2luX3Vz
ZSAtPSBjb3VudDsKLQlpZiAoaXNfY2FjaGVkKSB7CisJaWYgKGltbWVkaWF0ZV9mcmVlKSB7CiAJ
CXBvb2wtPm5mcmVlcyArPSBjb3VudDsKIAl9IGVsc2UgewogCQlwb29sLT5ucGFnZXNfZnJlZSAr
PSBjb3VudDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
