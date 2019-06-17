Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65EC482FD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 14:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62278923C;
	Mon, 17 Jun 2019 12:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091728923C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 12:51:27 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mae7u-1iDYhN3MgU-00cAt7; Mon, 17 Jun 2019 14:51:23 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: "James (Qian) Wang" <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/komeda: fix 32-bit komeda_crtc_update_clock_ratio
Date: Mon, 17 Jun 2019 14:51:04 +0200
Message-Id: <20190617125121.1414507-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:YNZWWtAS0xzrrfM3pjl8AX7tgKroNKj7VFYbWmDIWP/c+QDu9S7
 gDzeeip7x3tIK53FmtWpRwGHG5N939FLMnzAsoVcZaSW6/75zGoPpl5A3CoovOmO27pN0bu
 +st/zT8a1j8o/NkZMy9MfDYpsgyizzJO+Zecj5us03TSbd2deNIluDsQ0DA0iiCQE4u6SJz
 5dh87wbTaBXhC9/NXsyfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PW9GCohIInk=:aQ0AToBxA4KMITMsE6cbZd
 juUFYtzR/V0Dv2gTDcYLEKSU9/lX85CRt9wTtq9n2K0GuoDniFeKoMSv3kH9wQsYyBSl1GOT+
 Hxc2TIgRvv2yxH80NHgQ19qoblsq+tlaPGedNOsisEoFymDHTOj1qJ4ojrTJ53Ss826ZH0MRd
 sDIyFNlw8Z3P0XU0qu7hDEqdY+Nu+pcACQwG3t+ywZyEcMzUoyQ4h/6DxGXUsqafWvTQSk5Bg
 AT6JNPDPoxwlWvFbrnY9JkNyY7dg/5J5jT8i5Wu8dA8EFKBmMxoTUyG7mJZneJHTVR25U7J8r
 6NNgyAifw76O4YbYvkeMLGAV2MGjytvaKLDMI46qMwwy4wnF8ExI7ZEQoQdbnNjKIh/glQtQi
 n9E47x1U/LYi/9LLltQZ9QJjlYb90ntJVC0j7GfroYkHKG+dYuClIJm7rUswXLPV4INl9mTky
 zwMsdvJjxnkia4JBdDQjkcWNRaPXujcRI+TABRKxmt0GBRlqaKeOZ0bVC3+cUjSM0Vnpif//Z
 xj8WVCPbVZ6mzuNoIA3aTVTq/uUn1g7FIqF97AKKiH176ZBXmPm/YRhFh6N5qrY5focL6IMQH
 K8V9R7FwTpU+NQtAsoUOw0DbO4JXvdcof5aJdABDJl2e5l/Qa0DJarsKjVxmkDzKerCNBx/yo
 I8cY6vMFjuZOtV+DKIjXufoz25+pUl4RkYQWVEBrVzwx9ckEoPO7C9jjOORUJb2BX74ud2lMz
 oD0NTcn6AeHkjHNkWQEDtEUlePIiIhqs+nkvmA==
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y2xhbmcgcG9pbnRzIG91dCBhIGJ1ZyBpbiB0aGUgY2xvY2sgY2FsY3VsYXRpb24gb24gMzItYml0
LCB0aGF0IGxlYWRzCnRvIHRoZSBjbG9ja19yYXRpbyBhbHdheXMgYmVpbmcgemVybzoKCmRyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYzozMTozNjogZXJyb3I6
IHNoaWZ0IGNvdW50ID49IHdpZHRoIG9mIHR5cGUgWy1XZXJyb3IsLVdzaGlmdC1jb3VudC1vdmVy
Zmxvd10KICAgICAgICBhY2xrID0ga29tZWRhX2NhbGNfYWNsayhrY3J0Y19zdCkgPDwgMzI7CgpN
b3ZlIHRoZSBzaGlmdCBpbnRvIHRoZSBkaXZpc2lvbiB0byBtYWtlIGl0IGFwcGx5IG9uIGEgNjQt
Yml0CnZhcmlhYmxlLiBBbHNvIHVzZSB0aGUgbW9yZSBleHBlbnNpdmUgZGl2NjRfdTY0KCkgaW5z
dGVhZCBvZiBkaXZfdTY0KCkKdG8gYWNjb3VudCBmb3IgcHhsY2xrIGJlaW5nIGEgNjQtYml0IGlu
dGVnZXIuCgpGaXhlczogYTk2MjA5MTIyN2VkICgiZHJtL2tvbWVkYTogQWRkIGVuZ2luZSBjbG9j
ayByZXF1aXJlbWVudCBjaGVjayBmb3IgdGhlIGRvd25zY2FsaW5nIikKU2lnbmVkLW9mZi1ieTog
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwppbmRleCBjYWZiNDQ1N2UxODcuLjNmMjIyZjQ2
NGViMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NydGMuYwpAQCAtMjgsMTAgKzI4LDkgQEAgc3RhdGljIHZvaWQga29tZWRhX2NydGNfdXBkYXRl
X2Nsb2NrX3JhdGlvKHN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QpCiAJfQogCiAJ
cHhsY2xrID0ga2NydGNfc3QtPmJhc2UuYWRqdXN0ZWRfbW9kZS5jbG9jayAqIDEwMDA7Ci0JYWNs
ayA9IGtvbWVkYV9jYWxjX2FjbGsoa2NydGNfc3QpIDw8IDMyOworCWFjbGsgPSBrb21lZGFfY2Fs
Y19hY2xrKGtjcnRjX3N0KTsKIAotCWRvX2RpdihhY2xrLCBweGxjbGspOwotCWtjcnRjX3N0LT5j
bG9ja19yYXRpbyA9IGFjbGs7CisJa2NydGNfc3QtPmNsb2NrX3JhdGlvID0gZGl2NjRfdTY0KGFj
bGsgPDwgMzIsIHB4bGNsayk7CiB9CiAKIC8qKgotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
