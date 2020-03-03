Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF07177407
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 11:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281266E9C9;
	Tue,  3 Mar 2020 10:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D0F6E9C9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 10:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 9E08A3F528;
 Tue,  3 Mar 2020 11:23:16 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=QTe1Bv5P; 
 dkim-atps=neutral
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
 with ESMTP id zGAmtE0m4Q6X; Tue,  3 Mar 2020 11:23:05 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 3E5BC3F5BF;
 Tue,  3 Mar 2020 11:23:05 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 44329362F4B;
 Tue,  3 Mar 2020 11:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1583230980; bh=Z6Gh5jLS9TIwKYVRPd0K9d2V9En4SeczebRtqfG0Dm4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QTe1Bv5Px1HbbvWiF9zvyv3K8ffUfe7GvLHyyjL4OfvwANaaqirWAZN56gjgO8j0H
 C5oGRCAoJ5XVqKRBxB7BgbyRgOSiII2mtLKwOfwmy9LXXmYsgxcUkooDTCMNKpdWyR
 +8vsugHKbBc3VEjwNh93twHBbnj3610X8V5RkhpI=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 9/9] drm/vmwgfx: Hook up the helpers to align buffer objects
Date: Tue,  3 Mar 2020 11:22:47 +0100
Message-Id: <20200303102247.4635-10-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200303102247.4635-1-thomas_os@shipmail.org>
References: <20200303102247.4635-1-thomas_os@shipmail.org>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 Dan Williams <dan.j.williams@intel.com>, Ralph Campbell <rcampbell@nvidia.com>,
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

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKU3RhcnQgdXNp
bmcgdGhlIGhlbHBlcnMgdGhhdCBhbGlnbiBidWZmZXIgb2JqZWN0IHVzZXItc3BhY2UgYWRkcmVz
c2VzIGFuZApidWZmZXIgb2JqZWN0IHZyYW0gYWRkcmVzc2VzIHRvIGh1Z2UgcGFnZSBib3VuZGFy
aWVzLgpUaGlzIGlzIHRvIGltcHJvdmUgdGhlIGNoYW5jZXMgb2YgYWxsb3dpbmcgaHVnZSBwYWdl
LXRhYmxlIGVudHJpZXMuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9u
Lm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzogIk1hdHRoZXcgV2ls
Y294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVt
b3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgpDYzogUmFscGggQ2FtcGJlbGwg
PHJjYW1wYmVsbEBudmlkaWEuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVk
aGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KUmV2aWV3ZWQtYnk6
IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgpBY2tlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmlsZS5jICAgICAgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2Rydi5jICAgICAgICB8IDEzICsrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2Rydi5oICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X3R0bV9idWZmZXIuYyB8ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZpbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCmluZGV4IDQwZmFlMzU2ZDIwMi4u
MWRmMmZjYTYwOGMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwpAQCAtOTMyLDMgKzkzMiw0IEBAIHVuc2lnbmVk
IGxvbmcgZHJtX2dldF91bm1hcHBlZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxlLAogCXJldHVybiBj
dXJyZW50LT5tbS0+Z2V0X3VubWFwcGVkX2FyZWEoZmlsZSwgdWFkZHIsIGxlbiwgcGdvZmYsIGZs
YWdzKTsKIH0KICNlbmRpZiAvKiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgKi8KK0VYUE9S
VF9TWU1CT0xfR1BMKGRybV9nZXRfdW5tYXBwZWRfYXJlYSk7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2Rydi5jCmluZGV4IDgyNzQ1OGY0OTExMi4uNzdkODViYzU0ZWYwIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9kcnYuYwpAQCAtMTIyMyw2ICsxMjIzLDE4IEBAIHN0YXRpYyB2b2lkIHZt
d19yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiAJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYp
OwogfQogCitzdGF0aWMgdW5zaWduZWQgbG9uZwordm13X2dldF91bm1hcHBlZF9hcmVhKHN0cnVj
dCBmaWxlICpmaWxlLCB1bnNpZ25lZCBsb25nIHVhZGRyLAorCQkgICAgICB1bnNpZ25lZCBsb25n
IGxlbiwgdW5zaWduZWQgbG9uZyBwZ29mZiwKKwkJICAgICAgdW5zaWduZWQgbG9uZyBmbGFncykK
K3sKKwlzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiA9IGZpbGUtPnByaXZhdGVfZGF0YTsKKwlz
dHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2ID0gdm13X3ByaXYoZmlsZV9wcml2LT5taW5vci0+
ZGV2KTsKKworCXJldHVybiBkcm1fZ2V0X3VubWFwcGVkX2FyZWEoZmlsZSwgdWFkZHIsIGxlbiwg
cGdvZmYsIGZsYWdzLAorCQkJCSAgICAgJmRldl9wcml2LT52bWFfbWFuYWdlcik7Cit9CisKIHN0
YXRpYyBpbnQgdm13Z2Z4X3BtX25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsIHVu
c2lnbmVkIGxvbmcgdmFsLAogCQkJICAgICAgdm9pZCAqcHRyKQogewpAQCAtMTM5NCw2ICsxNDA2
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgdm13Z2Z4X2RyaXZlcl9m
b3BzID0gewogCS5jb21wYXRfaW9jdGwgPSB2bXdfY29tcGF0X2lvY3RsLAogI2VuZGlmCiAJLmxs
c2VlayA9IG5vb3BfbGxzZWVrLAorCS5nZXRfdW5tYXBwZWRfYXJlYSA9IHZtd19nZXRfdW5tYXBw
ZWRfYXJlYSwKIH07CiAKIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXIgPSB7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaCBiL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oCmluZGV4IGZlNWI3MjkzYjhkMS4uNDg1M2JkOTViZjU0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaApAQCAtOTI5LDYgKzkyOSw3IEBAIGV4
dGVybiBpbnQgdm13X21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKTsKIAogZXh0ZXJuIHZvaWQgdm13X3ZhbGlkYXRpb25fbWVtX2luaXRfdHRtKHN0cnVj
dCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYsCiAJCQkJCXNpemVfdCBncmFuKTsKKwogLyoqCiAgKiBU
VE0gYnVmZmVyIG9iamVjdCBkcml2ZXIgLSB2bXdnZnhfdHRtX2J1ZmZlci5jCiAgKi8KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYwppbmRleCBkOGVhM2RkMTBhZjAu
LjM0YzcyMWFiM2ZmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
dHRtX2J1ZmZlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZm
ZXIuYwpAQCAtNzU0LDcgKzc1NCw3IEBAIHN0YXRpYyBpbnQgdm13X2luaXRfbWVtX3R5cGUoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJCWJyZWFrOwogCWNhc2Ug
VFRNX1BMX1ZSQU06CiAJCS8qICJPbi1jYXJkIiB2aWRlbyByYW0gKi8KLQkJbWFuLT5mdW5jID0g
JnR0bV9ib19tYW5hZ2VyX2Z1bmM7CisJCW1hbi0+ZnVuYyA9ICZ2bXdfdGhwX2Z1bmM7CiAJCW1h
bi0+Z3B1X29mZnNldCA9IDA7CiAJCW1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVE
IHwgVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9
IFRUTV9QTF9GTEFHX0NBQ0hFRDsKLS0gCjIuMjEuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
