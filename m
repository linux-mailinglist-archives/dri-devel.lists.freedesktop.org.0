Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BF462014
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 16:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3EC89D8E;
	Mon,  8 Jul 2019 14:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A5689D8E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 14:08:23 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MMoXC-1i375x3FCu-00Ik9A; Mon, 08 Jul 2019 16:08:17 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/amd/powerplay: smu_v11_0: fix uninitialized variable
 use
Date: Mon,  8 Jul 2019 16:07:58 +0200
Message-Id: <20190708140816.1334640-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:X3J4e80NQyAuaqivhrauUEXEWU7jDdUAqZMBR/kGPcQ7CYCTHSi
 CIzF/Hx8mmfKT7DQSNax0/KaUiiTQnuK2hIJxk0dtFaoEHsVLxWeR+yR3fnKIhqt3Dfg4iP
 PIwtg8WqdZuu0vvm6p03mU3SVAQ/SbVVPQmeuP08r/dD1WfosPTHh5iYGmMh5e0Nlbbcmuq
 /M8IBS2hCeB21b3CZkm/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:14Ii1zw6QsU=:dUxvAlUg7CH/JD12q86ZkC
 NPa53AjNYyMTTFb6PHM3SufF/j4+MnmcH24nLk8u0Hgn3Zjyt5+jIgUAsdj/FId5IDMeL/Liv
 nFyB93a5FGykJUhWnsd4/N7+WiKiZeSeKFiN0Wkl7LFFMw8iFr3+IjVvXXAbkP91ATFF0Ky57
 Sjv+FZ05WJjs5A2oHVCsGp27DI94HU4OVvvM06CjWz+uVWaEXCeM6EYs+NNqDfLi75VqEWFdc
 xJltWBfGrxJgLug9v+coRVT7Min4kP/f1NnvKAuT0TL84cK3VbOCK/N9rwlVCBkSmdQljhiNd
 nzzBabj5pKnYUSWSsjizgTnUGaI7k8AWxy4JePuE0YNpj0iuFkvGMX/A2alZ/pnDBa36RMNp6
 KLTjObokalL6XkDdWgC3m1QyHYwwH/nJke3R/tdvxXI9MeyFxQDjo5Gn/JGtW1TD/3BGVd7Ii
 p+eI9SipxqKZeL8C23nGph/LlsHXy/jHq+HQ8dwOAwjeVJ3IiDQFvGnkib+FZPah4RGd4gHS6
 KetPom7A/2J3Z5F5XDDGeijFvIAYkQYOIBe5/ccHW7XwjieBCWCn0gSq0v8NkVz428AYUCWOP
 f/IYNPZfMsGCYPZHXFMb2OK+ig0J9/NSkIpixzmkcQY/IB/hpqCDMb2NGE/bJGZyPsIzvHsq2
 DwE37KZqnY9akc5gRm42udStAewy3dM3SVFb+Q6RYG6YeSCx/E/OylqA1frsCZe/E1QbFUXJE
 hMQvYzIH57lCSq586//fOLaruyhv252i6sZ/3g==
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

QSBtaXN0YWtlIGluIHRoZSBlcnJvciBoYW5kbGluZyBjYXVzZWQgYW4gdW5pbml0aWFsaXplZAp2
YXJpYWJsZSB0byBiZSB1c2VkOgoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJw
bGF5L3NtdV92MTFfMC5jOjExMDI6MTA6IGVycm9yOiB2YXJpYWJsZSAnZnJlcScgaXMgdXNlZCB1
bmluaXRpYWxpemVkIHdoZW5ldmVyICc/OicgY29uZGl0aW9uIGlzIGZhbHNlIFstV2Vycm9yLC1X
c29tZXRpbWVzLXVuaW5pdGlhbGl6ZWRdCiAgICAgICAgICAgICAgICByZXQgPSAgc211X2dldF9j
dXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlKHNtdSwgY2xrX2lkLCAmZnJlcSk7CiAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L2luYy9hbWRn
cHVfc211Lmg6ODgwOjM6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ3NtdV9nZXRfY3VycmVu
dF9jbGtfZnJlcV9ieV90YWJsZScKICAgICAgICAoKHNtdSktPnBwdF9mdW5jcy0+Z2V0X2N1cnJl
bnRfY2xrX2ZyZXFfYnlfdGFibGUgPyAoc211KS0+cHB0X2Z1bmNzLT5nZXRfY3VycmVudF9jbGtf
ZnJlcV9ieV90YWJsZSgoc211KSwgKGNsa190eXBlKSwgKHZhbHVlKSkgOiAwKQogICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvc211X3YxMV8wLmM6MTExNDoyOiBub3RlOiB1
bmluaXRpYWxpemVkIHVzZSBvY2N1cnMgaGVyZQogICAgICAgIGZyZXEgKj0gMTAwOwogICAgICAg
IF5+fn4KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3NtdV92MTFfMC5j
OjExMDI6MTA6IG5vdGU6IHJlbW92ZSB0aGUgJz86JyBpZiBpdHMgY29uZGl0aW9uIGlzIGFsd2F5
cyB0cnVlCiAgICAgICAgICAgICAgICByZXQgPSAgc211X2dldF9jdXJyZW50X2Nsa19mcmVxX2J5
X3RhYmxlKHNtdSwgY2xrX2lkLCAmZnJlcSk7CiAgICAgICAgICAgICAgICAgICAgICAgXgpkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaDo4ODA6
Mzogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnc211X2dldF9jdXJyZW50X2Nsa19mcmVxX2J5
X3RhYmxlJwogICAgICAgICgoc211KS0+cHB0X2Z1bmNzLT5nZXRfY3VycmVudF9jbGtfZnJlcV9i
eV90YWJsZSA/IChzbXUpLT5wcHRfZnVuY3MtPmdldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxl
KChzbXUpLCAoY2xrX3R5cGUpLCAodmFsdWUpKSA6IDApCiAgICAgICAgIF4KZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3NtdV92MTFfMC5jOjEwOTU6MTU6IG5vdGU6IGlu
aXRpYWxpemUgdGhlIHZhcmlhYmxlICdmcmVxJyB0byBzaWxlbmNlIHRoaXMgd2FybmluZwogICAg
ICAgIHVpbnQzMl90IGZyZXE7CiAgICAgICAgICAgICAgICAgICAgIF4KICAgICAgICAgICAgICAg
ICAgICAgID0gMAoKQmFpbCBvdXQgb2Ygc211X3YxMV8wX2dldF9jdXJyZW50X2Nsa19mcmVxKCkg
YmVmb3JlIHdlIGdldCB0aGVyZS4KCkZpeGVzOiBlMzYxODI0OTBkZWMgKCJkcm0vYW1kL3Bvd2Vy
cGxheTogZml4IGRwbSBmcmVxIHVuaXQgZXJyb3IgKDEwS0h6IC0+IE1oeikiKQpTaWduZWQtb2Zm
LWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjExXzAuYwppbmRleCBjM2Y5NzE0ZTkwNDcuLmJkODlhMTNiNjY3OSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKQEAgLTEwOTksOSArMTA5OSwxMSBA
QCBzdGF0aWMgaW50IHNtdV92MTFfMF9nZXRfY3VycmVudF9jbGtfZnJlcShzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAkvKiBpZiBkb24ndCBoYXMgR2V0RHBt
Q2xvY2tGcmVxIE1lc3NhZ2UsIHRyeSBnZXQgY3VycmVudCBjbG9jayBieSBTbXVNZXRyaWNzX3Qg
Ki8KLQlpZiAoc211X21zZ19nZXRfaW5kZXgoc211LCBTTVVfTVNHX0dldERwbUNsb2NrRnJlcSkg
PT0gMCkKKwlpZiAoc211X21zZ19nZXRfaW5kZXgoc211LCBTTVVfTVNHX0dldERwbUNsb2NrRnJl
cSkgPT0gMCkgewogCQlyZXQgPSAgc211X2dldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlKHNt
dSwgY2xrX2lkLCAmZnJlcSk7Ci0JZWxzZSB7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0Owor
CX0gZWxzZSB7CiAJCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9N
U0dfR2V0RHBtQ2xvY2tGcmVxLAogCQkJCQkJICAoc211X2Nsa19nZXRfaW5kZXgoc211LCBjbGtf
aWQpIDw8IDE2KSk7CiAJCWlmIChyZXQpCi0tIAoyLjIwLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
