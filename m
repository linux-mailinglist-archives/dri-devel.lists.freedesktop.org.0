Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 814C2114D84
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676876E1B7;
	Fri,  6 Dec 2019 08:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4394E6E1A4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 08:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0C2833F26D;
 Fri,  6 Dec 2019 09:24:40 +0100 (CET)
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
 with ESMTP id gHg2CEyS_O6z; Fri,  6 Dec 2019 09:24:39 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 1E7FB3F260;
 Fri,  6 Dec 2019 09:24:35 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 5C95436248A;
 Fri,  6 Dec 2019 09:24:35 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] mm: Add a vmf_insert_mixed_prot() function
Date: Fri,  6 Dec 2019 09:24:25 +0100
Message-Id: <20191206082426.2958-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206082426.2958-1-thomas_os@shipmail.org>
References: <20191206082426.2958-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575620675; bh=vaz4Fv+7GImw8+vcszuFMdA6P2YC6/2kJMWKMuBG2ZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YkhtrX0cdlFY/uXQGbmu6FwDrUf+pkXZee5ibUPmYxgy5YNt6UnC9GobHSO2Vv0Tu
 vx0rm/fpXq9Ulzsv0ZzUlS0n7s4xXoJ26AafBEHiBtDsLi6bgADq0Kn9nJt2q30T06
 e8Jx5Nwta7vsEMfqqRXkNr+fqJIS6sauiGmHEmCo=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=YkhtrX0c; 
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
 pv-drivers@vmware.com, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIFRUTSBt
b2R1bGUgdG9kYXkgdXNlcyBhIGhhY2sgdG8gYmUgYWJsZSB0byBzZXQgYSBkaWZmZXJlbnQgcGFn
ZQpwcm90ZWN0aW9uIHRoYW4gc3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2bV9wYWdlX3Byb3QuIFRv
IGJlIGFibGUgdG8gZG8KdGhpcyBwcm9wZXJseSwgYWRkIHRoZSBuZWVkZWQgdm0gZnVuY3Rpb25h
bGl0eSBhcyB2bWZfaW5zZXJ0X21peGVkX3Byb3QoKS4KCkNjOiBBbmRyZXcgTW9ydG9uIDxha3Bt
QGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+
CkNjOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzog
IktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+CkNj
OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOpcsO0bWUgR2xp
c3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxs
c3Ryb21Adm13YXJlLmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L21tLmggfCAgMiArKwogbW0vbWVtb3J5
LmMgICAgICAgIHwgMTQgKysrKysrKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmgg
Yi9pbmNsdWRlL2xpbnV4L21tLmgKaW5kZXggY2MyOTIyNzNlNmJhLi4yOTU3NWQzYzFlNDcgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKQEAg
LTI1NDgsNiArMjU0OCw4IEBAIHZtX2ZhdWx0X3Qgdm1mX2luc2VydF9wZm5fcHJvdChzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkJdW5zaWduZWQgbG9u
ZyBwZm4sIHBncHJvdF90IHBncHJvdCk7CiB2bV9mYXVsdF90IHZtZl9pbnNlcnRfbWl4ZWQoc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJCXBmbl90IHBm
bik7Cit2bV9mYXVsdF90IHZtZl9pbnNlcnRfbWl4ZWRfcHJvdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAorCQkJcGZuX3QgcGZuLCBwZ3Byb3RfdCBwZ3By
b3QpOwogdm1fZmF1bHRfdCB2bWZfaW5zZXJ0X21peGVkX21rd3JpdGUoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsCiAJCXVuc2lnbmVkIGxvbmcgYWRkciwgcGZuX3QgcGZuKTsKIGludCB2bV9p
b21hcF9tZW1vcnkoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHBoeXNfYWRkcl90IHN0YXJ0
LCB1bnNpZ25lZCBsb25nIGxlbik7CmRpZmYgLS1naXQgYS9tbS9tZW1vcnkuYyBiL21tL21lbW9y
eS5jCmluZGV4IGIxY2E1MWEwNzlmMi4uYjllN2YxZDU2YjFjIDEwMDY0NAotLS0gYS9tbS9tZW1v
cnkuYworKysgYi9tbS9tZW1vcnkuYwpAQCAtMTcxOSw5ICsxNzE5LDkgQEAgc3RhdGljIGJvb2wg
dm1fbWl4ZWRfb2soc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHBmbl90IHBmbikKIH0KIAog
c3RhdGljIHZtX2ZhdWx0X3QgX192bV9pbnNlcnRfbWl4ZWQoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsCi0JCXVuc2lnbmVkIGxvbmcgYWRkciwgcGZuX3QgcGZuLCBib29sIG1rd3JpdGUpCisJ
CXVuc2lnbmVkIGxvbmcgYWRkciwgcGZuX3QgcGZuLCBwZ3Byb3RfdCBwZ3Byb3QsCisJCWJvb2wg
bWt3cml0ZSkKIHsKLQlwZ3Byb3RfdCBwZ3Byb3QgPSB2bWEtPnZtX3BhZ2VfcHJvdDsKIAlpbnQg
ZXJyOwogCiAJQlVHX09OKCF2bV9taXhlZF9vayh2bWEsIHBmbikpOwpAQCAtMTc2NCwxMCArMTc2
NCwxNiBAQCBzdGF0aWMgdm1fZmF1bHRfdCBfX3ZtX2luc2VydF9taXhlZChzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwKIAlyZXR1cm4gVk1fRkFVTFRfTk9QQUdFOwogfQogCit2bV9mYXVsdF90
IHZtZl9pbnNlcnRfbWl4ZWRfcHJvdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAorCQkJCSBwZm5fdCBwZm4sIHBncHJvdF90IHBncHJvdCkKK3sKKwlyZXR1
cm4gX192bV9pbnNlcnRfbWl4ZWQodm1hLCBhZGRyLCBwZm4sIHBncHJvdCwgZmFsc2UpOworfQor
CiB2bV9mYXVsdF90IHZtZl9pbnNlcnRfbWl4ZWQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
IHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJcGZuX3QgcGZuKQogewotCXJldHVybiBfX3ZtX2luc2Vy
dF9taXhlZCh2bWEsIGFkZHIsIHBmbiwgZmFsc2UpOworCXJldHVybiBfX3ZtX2luc2VydF9taXhl
ZCh2bWEsIGFkZHIsIHBmbiwgdm1hLT52bV9wYWdlX3Byb3QsIGZhbHNlKTsKIH0KIEVYUE9SVF9T
WU1CT0wodm1mX2luc2VydF9taXhlZCk7CiAKQEAgLTE3NzksNyArMTc4NSw3IEBAIEVYUE9SVF9T
WU1CT0wodm1mX2luc2VydF9taXhlZCk7CiB2bV9mYXVsdF90IHZtZl9pbnNlcnRfbWl4ZWRfbWt3
cml0ZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkJdW5zaWduZWQgbG9uZyBhZGRyLCBw
Zm5fdCBwZm4pCiB7Ci0JcmV0dXJuIF9fdm1faW5zZXJ0X21peGVkKHZtYSwgYWRkciwgcGZuLCB0
cnVlKTsKKwlyZXR1cm4gX192bV9pbnNlcnRfbWl4ZWQodm1hLCBhZGRyLCBwZm4sIHZtYS0+dm1f
cGFnZV9wcm90LCB0cnVlKTsKIH0KIEVYUE9SVF9TWU1CT0wodm1mX2luc2VydF9taXhlZF9ta3dy
aXRlKTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
