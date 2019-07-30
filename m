Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234717B3CB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 22:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3FA89D30;
	Tue, 30 Jul 2019 20:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AF289D30
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 20:00:28 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MLAF0-1hbZdd1VJq-00IAlM; Tue, 30 Jul 2019 22:00:15 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v5 16/29] compat_ioctl: move ATYFB_CLK handling to atyfb driver
Date: Tue, 30 Jul 2019 21:55:32 +0200
Message-Id: <20190730195819.901457-4-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190730195819.901457-1-arnd@arndb.de>
References: <20190730192552.4014288-1-arnd@arndb.de>
 <20190730195819.901457-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0ZxSBrz/L44EWNzbRv73eLZ9rL3i0WOjEqW3ByO+yWHlG5mb1W7
 uZYyt/mHnDhNF5/3cHikieXcTxoRI9SKCP3A6kV/mnrd3IZNBwdIIPy5ag5HJSr5fmja9AP
 ngK564Niy37kfuJ33rToKE5tPXHU8NZustU3CCj6664tSYM2jhcIpvCic+w3qXngEh036DL
 3Q9yzWdV07Rb2faSlGosA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9fZ+4C+PBKw=:dsFl5vdmzgFilRAMPDWfF8
 n1bCvRStU4hPhqCc9cfPEQEwarWf8HuJUn5UZqPeQUVRZUSvzeoa0e/b/Bsdr6kPYtLQKDl86
 hT0/hqP4pYp89gNPZqPYDKtqfDKRGn8FwLqHG3d0b/6kCiUetQ79BjTleg50jEeJz4CwzczDP
 JCscKWrDAXqGeqY9ir13K18HEIbm9ZCC2jja+6XO2UuVrcNWbxyZOVA0mpW1TDcAouEAAODx6
 FGzi5u2ASC6nj3JWICwb7QbXkXIABd/zYsxjRWyiXvckzthwJmC+0xCYYWDpEy22z/qaJ5HLR
 pzbkaCrc97F5plaH+udhDlF1ev7aIpuh+guFDlq+k9be8Wdy3HZcmWQdbTNrhK+5Hrf1CpKXK
 yDvyHEwWnRgXoTtKRIg3s+do7xpeNgpsYH7pg42vb29baat8FJHwRVJgyQJAwx6dehVRECiD0
 M1JwtDP78bzH0wITzb79yHNP9ldb3jOEgSljUAOl1GSLReyTZqs8CnI0I/WswLpKdi3ontffL
 W/zpL4zEinmxkerkcEg9r68QlJXVFC35/Qz27JPLg2fBd5rClltlnZR/l/lDbvUumzfLHevLV
 jWoWTj8c5+cTswTNznndye5ftcUhx7F0e5Zh9kj2acOdhrSqbOaEGIZxiosbuziS4ZaB6Y31D
 iTj6VRNq5x2O/ACd1YiEDpugSWVpPRY+fdQOmx7Bxy/Te+e15vcQbVWUN0sQWnT4M98daRpks
 5SrWZpLrM0rNjYM8gtXpWszwMTjxd512fD0deQ==
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikulas Patocka <mpatocka@redhat.com>, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIHR3byBvYnNjdXJlIGlvY3RsIGNvbW1hbmRzLCBpbiBhIGRyaXZlciB0aGF0IG9u
bHkKaGFzIGNvbXBhdGlibGUgY29tbWFuZHMsIHNvIGp1c3QgbGV0IHRoZSBkcml2ZXIgaGFuZGxl
IHRoaXMKaXRzZWxmLgoKQWNrZWQtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9s
bmllcmtpZUBzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBh
cm5kYi5kZT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9iYXNlLmMgfCAxMiAr
KysrKysrKysrKy0KIGZzL2NvbXBhdF9pb2N0bC5jICAgICAgICAgICAgICAgICAgICB8ICAyIC0t
CiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jIGIvZHJpdmVycy92
aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jCmluZGV4IDcyYmNmYmU0MmU0OS4uNjNiYzc2YTFi
MmY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9iYXNlLmMKKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jCkBAIC00OCw3ICs0OCw3IEBA
CiAKICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKi8KIAotCisjaW5jbHVkZSA8bGludXgvY29tcGF0Lmg+
CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlcGFyYW0u
aD4KICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KQEAgLTIzNSw2ICsyMzUsMTMgQEAgc3RhdGlj
IGludCBhdHlmYl9wYW5fZGlzcGxheShzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZhciwKIAkJ
CSAgICAgc3RydWN0IGZiX2luZm8gKmluZm8pOwogc3RhdGljIGludCBhdHlmYl9ibGFuayhpbnQg
YmxhbmssIHN0cnVjdCBmYl9pbmZvICppbmZvKTsKIHN0YXRpYyBpbnQgYXR5ZmJfaW9jdGwoc3Ry
dWN0IGZiX2luZm8gKmluZm8sIHVfaW50IGNtZCwgdV9sb25nIGFyZyk7CisjaWZkZWYgQ09ORklH
X0NPTVBBVAorc3RhdGljIGludCBhdHlmYl9jb21wYXRfaW9jdGwoc3RydWN0IGZiX2luZm8gKmlu
Zm8sIHVfaW50IGNtZCwgdV9sb25nIGFyZykKK3sKKwlyZXR1cm4gYXR5ZmJfaW9jdGwoaW5mbywg
Y21kLCAodV9sb25nKWNvbXBhdF9wdHIoYXJnKSk7Cit9CisjZW5kaWYKKwogI2lmZGVmIF9fc3Bh
cmNfXwogc3RhdGljIGludCBhdHlmYl9tbWFwKHN0cnVjdCBmYl9pbmZvICppbmZvLCBzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSk7CiAjZW5kaWYKQEAgLTI5MCw2ICsyOTcsOSBAQCBzdGF0aWMg
c3RydWN0IGZiX29wcyBhdHlmYl9vcHMgPSB7CiAJLmZiX3Bhbl9kaXNwbGF5CT0gYXR5ZmJfcGFu
X2Rpc3BsYXksCiAJLmZiX2JsYW5rCT0gYXR5ZmJfYmxhbmssCiAJLmZiX2lvY3RsCT0gYXR5ZmJf
aW9jdGwsCisjaWZkZWYgQ09ORklHX0NPTVBBVAorCS5mYl9jb21wYXRfaW9jdGwgPSBhdHlmYl9j
b21wYXRfaW9jdGwsCisjZW5kaWYKIAkuZmJfZmlsbHJlY3QJPSBhdHlmYl9maWxscmVjdCwKIAku
ZmJfY29weWFyZWEJPSBhdHlmYl9jb3B5YXJlYSwKIAkuZmJfaW1hZ2VibGl0CT0gYXR5ZmJfaW1h
Z2VibGl0LApkaWZmIC0tZ2l0IGEvZnMvY29tcGF0X2lvY3RsLmMgYi9mcy9jb21wYXRfaW9jdGwu
YwppbmRleCBiNjVlZWYzZDQ3ODcuLmE0ZThmYjdkYTk2OCAxMDA2NDQKLS0tIGEvZnMvY29tcGF0
X2lvY3RsLmMKKysrIGIvZnMvY29tcGF0X2lvY3RsLmMKQEAgLTY5Niw4ICs2OTYsNiBAQCBDT01Q
QVRJQkxFX0lPQ1RMKENBUElfQ0xSX0ZMQUdTKQogQ09NUEFUSUJMRV9JT0NUTChDQVBJX05DQ0lf
T1BFTkNPVU5UKQogQ09NUEFUSUJMRV9JT0NUTChDQVBJX05DQ0lfR0VUVU5JVCkKIC8qIE1pc2Mu
ICovCi1DT01QQVRJQkxFX0lPQ1RMKDB4NDE1NDU5MDApCQkvKiBBVFlJT19DTEtSICovCi1DT01Q
QVRJQkxFX0lPQ1RMKDB4NDE1NDU5MDEpCQkvKiBBVFlJT19DTEtXICovCiBDT01QQVRJQkxFX0lP
Q1RMKFBDSUlPQ19DT05UUk9MTEVSKQogQ09NUEFUSUJMRV9JT0NUTChQQ0lJT0NfTU1BUF9JU19J
TykKIENPTVBBVElCTEVfSU9DVEwoUENJSU9DX01NQVBfSVNfTUVNKQotLSAKMi4yMC4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
