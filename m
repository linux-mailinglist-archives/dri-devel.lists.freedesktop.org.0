Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF5AC87C5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 14:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434B089826;
	Wed,  2 Oct 2019 12:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966DE89826;
 Wed,  2 Oct 2019 12:03:32 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mzhar-1htpHS1ojh-00vhrB; Wed, 02 Oct 2019 14:03:27 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 6/6] [RESEND] drm/amdgpu: work around llvm bug #42576
Date: Wed,  2 Oct 2019 14:01:27 +0200
Message-Id: <20191002120136.1777161-7-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191002120136.1777161-1-arnd@arndb.de>
References: <20191002120136.1777161-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YNsgZzHNCw392v1rgjHTUEZ8pz20uykSXH754RL9iIOb5deh2YJ
 VniPYenT1ADFLCFsCzgfROvSsNEN3OnGKEcwzAbZX+eQqWv1FYpwjvY8qgQaQWagz6gA/Hj
 n50Orae4/jwItelwmwUM+w8MCNKZ1bodhPFaG7DBNsILr42QtEuWuTsTPF+I9vNTWhFwdKi
 AC2C3ZG7mUNQXMnuZ9GNg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4D48kbU58hA=:M0Ukpx58xOP2bgAOCbesZg
 Ll3K2WKrJMuAIV0rQMg3YrjRgy0vn19WxNhnTpIkrflyRiZWcJOM0wBeRuWKJeyvUs0Rmo5L2
 WT/4Q04J4mCDT0lGHrQHxf0CSt7FRwbIaoymM8ll6+AnjlipM3gBW2vuD399wywXHODhQH/Jj
 kmmHm0vPKelSxnjmyF5QKhW2vPKNuNrxHXBAuShJhblFiaT4Tpite+9Tpqz5t78Mv1d0c4+St
 IPO467Ji+f+nalLEiSfYfSOueaNIp0Zh2ECvF8gYGuCtq4mQgaFQma45iRPDMa0dLQp2LPHv5
 s3HOgLJcrW3+YLL3OgrgSAIqY/JojFmQs6jVGI3Y/iaIHFpiWRvNCCVqhadcZDljlJ6/isT3C
 cWMwh3wga4zB1HZAibk87TdIUOsEWosHOOSejWot8HMi7thZpGsmWSYlpaZpcggNF8Y5ef5cx
 S+AFB9lJCv6tLjnDzT5CItgHD9CSDilvn5DV5AQ2CSUe7CMLtj7FRRuRtxGnzKXWHsDiqUK2X
 dLpSNCwET1M9ENlBeQ5D+BhxBx37HFEUhCYKyJqFJoQbTkGvZkwazmwaChizrxq1gbyD4vDeD
 GqCyA1nhBCBAM2hW+2uyIFVsDMDpeg/OoBtcZMPB8aPwvr2q464wcpu+nmB0VWQnFJx8hRRKp
 kx+eBUDSoB7gkuurGSeum9uDonECxoSFhh//75/Bmdr0Te33FTyRIMUwkUlAfiVlOVC5ga602
 HNuDLNkHHth6E821u1odV2gGvJVg9mgsLl5k0rHpfHXjU15zA2Ww4I8gM2c4ZgC5ypKzC/eg5
 iac5xdsyiVk9Kf4KiWNLvvcteewurG0ZAiyq3Yo5GGXvCGBgLkIfnziVSp+lP21xvwWwPUCJr
 pxfok2TuNB12F2uGor0g==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Le Ma <le.ma@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, Huang Rui <ray.huang@amd.com>,
 amd-gfx@lists.freedesktop.org, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29kZSBpbiB0aGUgYW1kZ3B1IGRyaXZlciB0cmlnZ2VycyBhIGJ1ZyB3aGVuIHVzaW5nIGNsYW5n
IHRvIGJ1aWxkCmFuIGFybTY0IGtlcm5lbDoKCi90bXAvc2RtYV92NF8wLWY5NWZkMy5zOiBBc3Nl
bWJsZXIgbWVzc2FnZXM6Ci90bXAvc2RtYV92NF8wLWY5NWZkMy5zOjQ0OiBFcnJvcjogc2VsZWN0
ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGJmYyB3MCwjMSwjNScKCkkgZXhwZWN0IHRo
aXMgdG8gYmUgZml4ZWQgaW4gbGx2bSBzb29uLCBidXQgd2UgY2FuIGFsc28gd29yayBhcm91bmQK
aXQgYnkgaW5zZXJ0aW5nIGEgYmFycmllcigpIHRoYXQgcHJldmVudHMgdGhlIG9wdGltaXphdGlv
bi4KCkxpbms6IGh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NDI1NzYKU2ln
bmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCkFwcGFyZW50bHkg
dGhpcyBidWcgaXMgc3RpbGwgcHJlc2VudCBpbiBib3RoIHRoZSByZWxlYXNlZCBjbGFuZy05CmFu
ZCB0aGUgY3VycmVudCBkZXZlbG9wbWVudCB2ZXJzaW9uIG9mIGNsYW5nLTEwLgpJIHdhcyBob3Bp
bmcgd2Ugd291bGQgbm90IG5lZWQgYSB3b3JrYXJvdW5kIGluIGNsYW5nLTkrLCBidXQKaXQgc2Vl
bXMgdGhhdCB3ZSBkby4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAu
YyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zZG1hX3Y0XzAuYwppbmRleCA3ODQ1MmNmMDExNWQuLjM5NDU5Y2Q4ZGRlZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAgLTk2MSw2ICs5NjEsNyBAQCBz
dGF0aWMgdWludDMyX3Qgc2RtYV92NF8wX3JiX2NudGwoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
LCB1aW50MzJfdCByYl9jbnRsKQogCS8qIFNldCByaW5nIGJ1ZmZlciBzaXplIGluIGR3b3JkcyAq
LwogCXVpbnQzMl90IHJiX2J1ZnN6ID0gb3JkZXJfYmFzZV8yKHJpbmctPnJpbmdfc2l6ZSAvIDQp
OwogCisJYmFycmllcigpOyAvKiB3b3JrIGFyb3VuZCBodHRwczovL2J1Z3MubGx2bS5vcmcvc2hv
d19idWcuY2dpP2lkPTQyNTc2ICovCiAJcmJfY250bCA9IFJFR19TRVRfRklFTEQocmJfY250bCwg
U0RNQTBfR0ZYX1JCX0NOVEwsIFJCX1NJWkUsIHJiX2J1ZnN6KTsKICNpZmRlZiBfX0JJR19FTkRJ
QU4KIAlyYl9jbnRsID0gUkVHX1NFVF9GSUVMRChyYl9jbnRsLCBTRE1BMF9HRlhfUkJfQ05UTCwg
UkJfU1dBUF9FTkFCTEUsIDEpOwotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
