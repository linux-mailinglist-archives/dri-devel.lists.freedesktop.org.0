Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A107462016
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 16:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BB389D81;
	Mon,  8 Jul 2019 14:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC9689D81
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 14:08:33 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M89P3-1ho4wp0FFr-005MGd; Mon, 08 Jul 2019 16:08:28 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/amd/powerplay: vega20: fix uninitialized variable use
Date: Mon,  8 Jul 2019 16:07:59 +0200
Message-Id: <20190708140816.1334640-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190708140816.1334640-1-arnd@arndb.de>
References: <20190708140816.1334640-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:NyfhK5Y4jz7Zauo0keyLsO1GaKfDaYS9PZtk4wBhZX4qB8ZPG7o
 XAcUVBB10BKXLj+ZVSeTI0D/l0efVGJTE5jS5oIEgaFpES91kHGCZp7xFl+VVFnyf2qjvYb
 2fB+TOUjE1u/eR4fhGyZ2JdQcYLO2UnbqY0jmhrnxJuGyQOSHKgFFx/hNbUk/9FeK4dtLtA
 Oxe6uhkvKx0J1PnP+d+xQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ricJjI9sTU0=:jjXRZ80JOXKSZPGfAGrxJK
 5MnloyJFczjlnFDwjZoAv0fwMyEViU4SCNoRSWVfTEh0vtq9rHrXy8+CvjNqjl+T61doObwix
 m3B5FUdbFLzwvqBot8udnBzZkUd7bTCsEPcWYm4kyB5GZCG9FMddxefo+Be04RtMXrb/Ym2Y+
 PKpfcLUjN85jnj5vmcw0EJZ7GHa44LWiwS3HJFinSQZDng4N9nH10YapicmaHhS62nJy+s+R8
 bL33CgjW9z0+yon2t3LZe9udh3ZRcKpjSKYOUY55qU8wDLQcW8dK4rqdbwqJ2r2/g6HtEoY/v
 RuIHTcSjnKd+YeMHG2h2DC/OvaABlVnlTBWcyT3p2vfs+Ow+cEZFJUXVg603RYF4EJ5e/dNeu
 c71aMaqg57jo/MLiiygnDKvAMvOHL2rEnX9nlZFTc22jLWmgaB52K5De7HPIL8evckboAMlec
 xMRIyvSKQvWuxoRpvFUzRrcNKdl6qwqnG/O7R1Ul+0sAKP+HKT4mfU5HIisPTI69bLKUUWV2K
 rd7gHOFQSW0dNEOw/wY4Rq/HDso6zIOiQsKwCDWehWy91e1zYwgmdbsDswzQllLmh9xNuDZ38
 uwKA6AIUJQs1k1botxu8ysfXcNj3p9ZyAkUMfBjrPTx05zryPWmzNg/x2c4AcK7T1SIfWj9P9
 JO9rk5eSeyYbi5CApjYKkYGASvXiEYCdPTRCIGr8wbUgOFSJTSlqaUqAftcbnNAyP+Zx8cf0w
 5bTezfc2UNfDfzWUxTUVcMij5exbEFDN9pIcAg==
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
Cc: Chengming Gui <Jack.Gui@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Kevin Wang <kevin1.wang@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Likun Gao <Likun.Gao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgc211X2dldF9jdXJyZW50X3JwbSgpIGZhaWxzLCB3ZSBjYW4ndCB1c2UgdGhlIG91dHB1dCwK
YXMgdGhhdCBtYXkgYmUgdW5pbml0aWFsaXplZDoKCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL3Bvd2VycGxheS92ZWdhMjBfcHB0LmM6MzAyMzo4OiBlcnJvcjogdmFyaWFibGUgJ2N1cnJl
bnRfcnBtJyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgd2hlbmV2ZXIgJz86JyBjb25kaXRpb24gaXMg
ZmFsc2UgWy1XZXJyb3IsLVdzb21ldGltZXMtdW5pbml0aWFsaXplZF0KICAgICAgICByZXQgPSBz
bXVfZ2V0X2N1cnJlbnRfcnBtKHNtdSwgJmN1cnJlbnRfcnBtKTsKICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaDo3MzU6Mzogbm90ZTogZXhwYW5kZWQg
ZnJvbSBtYWNybyAnc211X2dldF9jdXJyZW50X3JwbScKICAgICAgICAoKHNtdSktPmZ1bmNzLT5n
ZXRfY3VycmVudF9ycG0gPyAoc211KS0+ZnVuY3MtPmdldF9jdXJyZW50X3JwbSgoc211KSwgKHNw
ZWVkKSkgOiAwKQogICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jOjMwMjQ6MTI6IG5v
dGU6IHVuaW5pdGlhbGl6ZWQgdXNlIG9jY3VycyBoZXJlCiAgICAgICAgcGVyY2VudCA9IGN1cnJl
bnRfcnBtICogMTAwIC8gcHB0YWJsZS0+RmFuTWF4aW11bVJwbTsKICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn4KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3ZlZ2Ey
MF9wcHQuYzozMDIzOjg6IG5vdGU6IHJlbW92ZSB0aGUgJz86JyBpZiBpdHMgY29uZGl0aW9uIGlz
IGFsd2F5cyB0cnVlCiAgICAgICAgcmV0ID0gc211X2dldF9jdXJyZW50X3JwbShzbXUsICZjdXJy
ZW50X3JwbSk7CiAgICAgICAgICAgICAgXgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9w
b3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaDo3MzU6Mzogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNy
byAnc211X2dldF9jdXJyZW50X3JwbScKICAgICAgICAoKHNtdSktPmZ1bmNzLT5nZXRfY3VycmVu
dF9ycG0gPyAoc211KS0+ZnVuY3MtPmdldF9jdXJyZW50X3JwbSgoc211KSwgKHNwZWVkKSkgOiAw
KQogICAgICAgICBeCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS92ZWdh
MjBfcHB0LmM6MzAyMDoyMjogbm90ZTogaW5pdGlhbGl6ZSB0aGUgdmFyaWFibGUgJ2N1cnJlbnRf
cnBtJyB0byBzaWxlbmNlIHRoaXMgd2FybmluZwogICAgICAgIHVpbnQzMl90IGN1cnJlbnRfcnBt
OwoKUHJvcGFnYXRlIHRoZSBlcnJvciBjb2RlIGluIHRoYXQgY2FzZS4KCkZpeGVzOiBlZTBkYjgy
MDI3ZWUgKCJkcm0vYW1kL3Bvd2VycGxheTogbW92ZSBQUFRhYmxlX3QgdXNlcyBpbnRvIGFzaWMg
bGV2ZWwiKQpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyB8IDUgKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXggOWNlM2YxYzhhZTBmLi4yMGQ0
NzdmOGRjODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2Ey
MF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMK
QEAgLTMwMjEsMTAgKzMwMjEsMTMgQEAgc3RhdGljIGludCB2ZWdhMjBfZ2V0X2Zhbl9zcGVlZF9w
ZXJjZW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCVBQVGFibGVfdCAqcHB0YWJsZSA9IHNt
dS0+c211X3RhYmxlLmRyaXZlcl9wcHRhYmxlOwogCiAJcmV0ID0gc211X2dldF9jdXJyZW50X3Jw
bShzbXUsICZjdXJyZW50X3JwbSk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwogCXBlcmNl
bnQgPSBjdXJyZW50X3JwbSAqIDEwMCAvIHBwdGFibGUtPkZhbk1heGltdW1ScG07CiAJKnNwZWVk
ID0gcGVyY2VudCA+IDEwMCA/IDEwMCA6IHBlcmNlbnQ7CiAKLQlyZXR1cm4gcmV0OworCXJldHVy
biAwOwogfQogCiBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfZ3B1X3Bvd2VyKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LCB1aW50MzJfdCAqdmFsdWUpCi0tIAoyLjIwLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
