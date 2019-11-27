Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261B810ABCE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3746E4CB;
	Wed, 27 Nov 2019 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BA66E25E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 08:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 572F03F5E0;
 Wed, 27 Nov 2019 09:32:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHNccKRAXQug; Wed, 27 Nov 2019 09:32:05 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 4340D3F5BF;
 Wed, 27 Nov 2019 09:32:05 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0C26436060F;
 Wed, 27 Nov 2019 09:32:03 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com
Subject: [RFC PATCH 6/7] drm/ttm: Introduce a huge page aligning TTM range
 manager.
Date: Wed, 27 Nov 2019 09:31:19 +0100
Message-Id: <20191127083120.34611-7-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191127083120.34611-1-thomas_os@shipmail.org>
References: <20191127083120.34611-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1574843523; bh=yW4Kv+tDJBfAXwh/Zhx3QElV1XLWl/OFJo8EITEcphM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I1TSdGL39WpjjsQ2vSeU9iiNq16d55INmsc+XWaIEanIkMa6S+WwcROTsKAJiRiVr
 h7J04Wum3zSasmPtK2kGe8rGzik5iBffxWJWaoGfbvhuRIUzfweRmjRoKzd/FaaItI
 FkY5sYwAlCsxxOaGRz1nLUbwSDOZe8fLn8494EKY=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=I1TSdGL3; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVXNpbmcgaHVn
ZSBwYWdlLXRhYmxlIGVudHJpZXMgcmVxdWlyZSB0aGF0IHRoZSBzdGFydCBvZiBhIGJ1ZmZlciBv
YmplY3QKaXMgaHVnZSBwYWdlIHNpemUgYWxpZ25lZC4gU28gaW50cm9kdWNlIGEgdHRtX2JvX21h
bl9nZXRfbm9kZV9odWdlKCkKZnVuY3Rpb24gdGhhdCBhdHRlbXB0cyB0byBhY2NvbXBsaXNoIHRo
aXMgZm9yIGFsbG9jYXRpb25zIHRoYXQgYXJlIGxhcmdlcgp0aGFuIHRoZSBodWdlIHBhZ2Ugc2l6
ZSwgYW5kIHByb3ZpZGUgYSBuZXcgcmFuZ2UtbWFuYWdlciBpbnN0YW5jZSB0aGF0CnVzZXMgdGhh
dCBmdW5jdGlvbi4KCkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3Jn
PgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNjOiAiTWF0dGhldyBXaWxjb3gg
KE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzogIktpcmlsbCBBLiBTaHV0ZW1vdiIg
PGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+CkNjOiBSYWxwaCBDYW1wYmVsbCA8cmNh
bXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQu
Y29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib19tYW5hZ2VyLmMgfCA5MiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oICAgICAgfCAg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDkzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib19tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9ib19tYW5hZ2VyLmMKaW5kZXggMThkM2RlYmNjOTQ5Li4yNmFhMWEyYWU3ZjEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX21hbmFnZXIuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib19tYW5hZ2VyLmMKQEAgLTg5LDYgKzg5LDg5IEBAIHN0YXRpYyBpbnQg
dHRtX2JvX21hbl9nZXRfbm9kZShzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKIAly
ZXR1cm4gMDsKIH0KIAorI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQorc3RhdGlj
IGludCB0dG1fYm9faW5zZXJ0X2FsaWduZWQoc3RydWN0IGRybV9tbSAqbW0sIHN0cnVjdCBkcm1f
bW1fbm9kZSAqbm9kZSwKKwkJCQkgdW5zaWduZWQgbG9uZyBhbGlnbl9wYWdlcywKKwkJCQkgY29u
c3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2UsCisJCQkJIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVt
LAorCQkJCSB1bnNpZ25lZCBsb25nIGxwZm4sCisJCQkJIGVudW0gZHJtX21tX2luc2VydF9tb2Rl
IG1vZGUpCit7CisJaWYgKGFsaWduX3BhZ2VzID49IG1lbS0+cGFnZV9hbGlnbm1lbnQgJiYKKwkg
ICAgKCFtZW0tPnBhZ2VfYWxpZ25tZW50IHx8IGFsaWduX3BhZ2VzICUgbWVtLT5wYWdlX2FsaWdu
bWVudCA9PSAwKSkgeworCQlyZXR1cm4gZHJtX21tX2luc2VydF9ub2RlX2luX3JhbmdlKG1tLCBu
b2RlLAorCQkJCQkJICAgbWVtLT5udW1fcGFnZXMsCisJCQkJCQkgICBhbGlnbl9wYWdlcywgMCwK
KwkJCQkJCSAgIHBsYWNlLT5mcGZuLCBscGZuLCBtb2RlKTsKKwl9CisKKwlyZXR1cm4gLUVOT1NQ
QzsKK30KKworc3RhdGljIGludCB0dG1fYm9fbWFuX2dldF9ub2RlX2h1Z2Uoc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyICptYW4sCisJCQkJICAgIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sCisJCQkJICAgIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgKnBsYWNlLAorCQkJCSAgICBzdHJ1
Y3QgdHRtX21lbV9yZWcgKm1lbSkKK3sKKwlzdHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgKnJtYW4g
PSAoc3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyICopIG1hbi0+cHJpdjsKKwlzdHJ1Y3QgZHJtX21t
ICptbSA9ICZybWFuLT5tbTsKKwlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGU7CisJdW5zaWduZWQg
bG9uZyBhbGlnbl9wYWdlczsKKwl1bnNpZ25lZCBsb25nIGxwZm47CisJZW51bSBkcm1fbW1faW5z
ZXJ0X21vZGUgbW9kZSA9IERSTV9NTV9JTlNFUlRfQkVTVDsKKwlpbnQgcmV0OworCisJbm9kZSA9
IGt6YWxsb2Moc2l6ZW9mKCpub2RlKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFub2RlKQorCQlyZXR1
cm4gLUVOT01FTTsKKworCWxwZm4gPSBwbGFjZS0+bHBmbjsKKwlpZiAoIWxwZm4pCisJCWxwZm4g
PSBtYW4tPnNpemU7CisKKwltb2RlID0gRFJNX01NX0lOU0VSVF9CRVNUOworCWlmIChwbGFjZS0+
ZmxhZ3MgJiBUVE1fUExfRkxBR19UT1BET1dOKQorCQltb2RlID0gRFJNX01NX0lOU0VSVF9ISUdI
OworCisJc3Bpbl9sb2NrKCZybWFuLT5sb2NrKTsKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfSEFW
RV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRCkpIHsKKwkJYWxpZ25fcGFnZXMgPSAoSFBB
R0VfUFVEX1NJWkUgPj4gUEFHRV9TSElGVCk7CisJCWlmIChtZW0tPm51bV9wYWdlcyA+PSBhbGln
bl9wYWdlcykgeworCQkJcmV0ID0gdHRtX2JvX2luc2VydF9hbGlnbmVkKG1tLCBub2RlLCBhbGln
bl9wYWdlcywKKwkJCQkJCSAgICBwbGFjZSwgbWVtLCBscGZuLCBtb2RlKTsKKwkJCWlmICghcmV0
KQorCQkJCWdvdG8gZm91bmRfdW5sb2NrOworCQl9CisJfQorCisJYWxpZ25fcGFnZXMgPSAoSFBB
R0VfUE1EX1NJWkUgPj4gUEFHRV9TSElGVCk7CisJaWYgKG1lbS0+bnVtX3BhZ2VzID49IGFsaWdu
X3BhZ2VzKSB7CisJCXJldCA9IHR0bV9ib19pbnNlcnRfYWxpZ25lZChtbSwgbm9kZSwgYWxpZ25f
cGFnZXMsIHBsYWNlLCBtZW0sCisJCQkJCSAgICBscGZuLCBtb2RlKTsKKwkJaWYgKCFyZXQpCisJ
CQlnb3RvIGZvdW5kX3VubG9jazsKKwl9CisKKwlyZXQgPSBkcm1fbW1faW5zZXJ0X25vZGVfaW5f
cmFuZ2UobW0sIG5vZGUsIG1lbS0+bnVtX3BhZ2VzLAorCQkJCQkgIG1lbS0+cGFnZV9hbGlnbm1l
bnQsIDAsCisJCQkJCSAgcGxhY2UtPmZwZm4sIGxwZm4sIG1vZGUpOworZm91bmRfdW5sb2NrOgor
CXNwaW5fdW5sb2NrKCZybWFuLT5sb2NrKTsKKworCWlmICh1bmxpa2VseShyZXQpKSB7CisJCWtm
cmVlKG5vZGUpOworCX0gZWxzZSB7CisJCW1lbS0+bW1fbm9kZSA9IG5vZGU7CisJCW1lbS0+c3Rh
cnQgPSBub2RlLT5zdGFydDsKKwl9CisKKwlyZXR1cm4gMDsKK30KKyNlbHNlCisjZGVmaW5lIHR0
bV9ib19tYW5fZ2V0X25vZGVfaHVnZSB0dG1fYm9fbWFuX2dldF9ub2RlCisjZW5kaWYKKworCiBz
dGF0aWMgdm9pZCB0dG1fYm9fbWFuX3B1dF9ub2RlKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdl
ciAqbWFuLAogCQkJCXN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQogewpAQCAtMTU0LDMgKzIzNywx
MiBAQCBjb25zdCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXJfZnVuYyB0dG1fYm9fbWFuYWdl
cl9mdW5jID0gewogCS5kZWJ1ZyA9IHR0bV9ib19tYW5fZGVidWcKIH07CiBFWFBPUlRfU1lNQk9M
KHR0bV9ib19tYW5hZ2VyX2Z1bmMpOworCitjb25zdCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFn
ZXJfZnVuYyB0dG1fYm9fbWFuYWdlcl9odWdlX2Z1bmMgPSB7CisJLmluaXQgPSB0dG1fYm9fbWFu
X2luaXQsCisJLnRha2Vkb3duID0gdHRtX2JvX21hbl90YWtlZG93biwKKwkuZ2V0X25vZGUgPSB0
dG1fYm9fbWFuX2dldF9ub2RlX2h1Z2UsCisJLnB1dF9ub2RlID0gdHRtX2JvX21hbl9wdXRfbm9k
ZSwKKwkuZGVidWcgPSB0dG1fYm9fbWFuX2RlYnVnCit9OworRVhQT1JUX1NZTUJPTCh0dG1fYm9f
bWFuYWdlcl9odWdlX2Z1bmMpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19k
cml2ZXIuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKaW5kZXggY2FjN2E4YTA4
MjVhLi44NjhiZDBkNGJlNmEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJp
dmVyLmgKKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaApAQCAtODg4LDUgKzg4
OCw2IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvKTsKIHBncHJvdF90IHR0bV9pb19wcm90KHVpbnQzMl90IGNhY2hpbmdfZmxhZ3MsIHBn
cHJvdF90IHRtcCk7CiAKIGV4dGVybiBjb25zdCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXJf
ZnVuYyB0dG1fYm9fbWFuYWdlcl9mdW5jOworZXh0ZXJuIGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5
cGVfbWFuYWdlcl9mdW5jIHR0bV9ib19tYW5hZ2VyX2h1Z2VfZnVuYzsKIAogI2VuZGlmCi0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
