Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA6261FD2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 15:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA46889C94;
	Mon,  8 Jul 2019 13:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC72B89C94;
 Mon,  8 Jul 2019 13:51:43 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MVaQW-1huLvS0AkO-00RbTc; Mon, 08 Jul 2019 15:51:38 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu: fix building without CONFIG_HMM_MIRROR
Date: Mon,  8 Jul 2019 15:51:24 +0200
Message-Id: <20190708135135.610355-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Try8nevSfQ6LJLOsIb7LCr5neA+PjlmdVukydwRVE7Gsov5fADa
 rW7QTzw6r1z5vpwJBY1rwNpqk5oevj8duGKPxzodhe7pnj94XxCMw8VtkWCHXQ8AeQo4cw+
 jGQLE+Qin3wqheYAl5VpnCH6JOMHyE21JSOrSco7yP/tUhiWrOgJz5dcHHWu1dYyV5Kxvmv
 iCd3NniMc510079Mss/Vw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LWYpwebFz1I=:G1x40m2rbJewCi8eDhXMRA
 TCM8b4h0pb+bOFNOYud9CwhQSArN3pKViWO3/FomWzVjqvf66+dEfBq5SAyKrFdJ4FALT1Nz9
 NHuKQFQTz8+XPMZjAkXpILgIPXkfWLk2MF3XEHnTfJQTGDbFfqNG+kKB6Ix4ZMORaBPXE2hQZ
 iPEDQp9r8aD6qvzFTXky2wIdUOP4hHHb65rJIO9+79etNmX7ItGOhHI/wB0MxyHsnCC6ng0dZ
 N+A5Cx/wuikkXyaDuzHrpMnG6gy9bnmjtsi+S8ubc0Z7CGl6YKizQpo5a8bax+YJooCoo9pWV
 ye+5nIom0Ckx/y3tsGSI973jBPtMkMg7Zzjg7kjlX0jmXiXV7QAXNn7lGY0XyIfZm8ssUaspa
 0WEX45aYFYqpod6YXeGBZop3+n2xIV6zNtVPofhp7ut5KD/eXUBi37Xy9Wvi7sQmSsolABjhG
 pq54VzAAlmrg8Q3I+Cd/l/y+2nd65CWBvmN8na3oxfd1by/BjjQISuWqZiVjNwknDIMu0Ulfm
 W8yrdIMOp3ub8pOwIpjrP25tm6MjO9rShUeLYul2v3nTcxI47ihp5YoQNDIandjoKk43Mf2Zn
 nNlxJThDHIoe6La8U3ay+g8KZS5HKHqervgh/UFvLY7LsSFVtafLjA1RrBmfMymu3wKvePT2k
 L92VYYRTamBbfwNSb9W0S2h2khRtGQpFnqVlkHuJbWuV310w0+KCX6cBTzbdpLlpnIkHqr+2i
 LtO/MZt6THXQPsYCU1K+9VxOizsIZPPo1jLTtg==
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
Cc: Philip Yang <Philip.Yang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

J3N0cnVjdCBobW1fbWlycm9yJyBpcyBub3QgZGVmaW5lZCB3aXRob3V0IHRoZSBLY29uZmlnIG9w
dGlvbiBzZXQsCnNvIHdlIGNhbm5vdCBpbmNsdWRlIGl0IHdpdGhpbiBhbm90aGVyIHN0cnVjdDoK
CkluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRn
cHUvYW1kZ3B1Lmg6NzI6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2FtZGdwdS9hbWRn
cHVfbW4uaDo2OToyMDogZXJyb3I6IGZpZWxkIGhhcyBpbmNvbXBsZXRlIHR5cGUgJ3N0cnVjdCBo
bW1fbWlycm9yJwogICAgICAgIHN0cnVjdCBobW1fbWlycm9yICAgICAgIG1pcnJvcjsKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2FtZGdwdS9hbWRncHVfbW4uaDo2OTo5OiBub3RlOiBmb3J3YXJkIGRlY2xhcmF0aW9uIG9mICdz
dHJ1Y3QgaG1tX21pcnJvcicKICAgICAgICBzdHJ1Y3QgaG1tX21pcnJvciAgICAgICBtaXJyb3I7
CgpBZGQgdGhlICNpZmRlZiBhcm91bmQgaXQgdGhhdCBpcyBhbHNvIHVzZWQgZm9yIGFsbCBmdW5j
dGlvbnMgb3BlcmF0aW5nCm9uIGl0LgoKRml4ZXM6IDc1OTBmNmQyMTFlYyAoImRybS9hbWRncHU6
IFByZXBhcmUgZm9yIGhtbV9yYW5nZV9yZWdpc3RlciBBUEkgY2hhbmdlIikKU2lnbmVkLW9mZi1i
eTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfbW4uaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5oCmluZGV4IDI4MWZkOWZlZjY2
Mi4uYjhlZDY4OTQzNjI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfbW4uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaApA
QCAtNjUsOCArNjUsMTAgQEAgc3RydWN0IGFtZGdwdV9tbiB7CiAJc3RydWN0IHJ3X3NlbWFwaG9y
ZQlsb2NrOwogCXN0cnVjdCByYl9yb290X2NhY2hlZAlvYmplY3RzOwogCisjaWZkZWYgQ09ORklH
X0hNTV9NSVJST1IKIAkvKiBITU0gbWlycm9yICovCiAJc3RydWN0IGhtbV9taXJyb3IJbWlycm9y
OworI2VuZGlmCiB9OwogCiAjaWYgZGVmaW5lZChDT05GSUdfSE1NX01JUlJPUikKLS0gCjIuMjAu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
