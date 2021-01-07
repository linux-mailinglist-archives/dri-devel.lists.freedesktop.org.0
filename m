Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5182ECC06
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C83D6E439;
	Thu,  7 Jan 2021 08:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 420 seconds by postgrey-1.36 at gabe;
 Thu, 07 Jan 2021 02:37:40 UTC
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by gabe.freedesktop.org (Postfix) with ESMTP id D10946E3DA
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 02:37:40 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.198.163])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xL4LkiX9OkRIKxL4PkeM1d; Thu, 07 Jan 2021 03:30:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1609986637; bh=TsdBOWdkASmq0ug4ZNOIO/B3vCFbiRe6dDUb+k/UQ4E=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=mBzxjfQ2sku8+pC+vRYFNCnlDuKEX6L0W8ywr4Je/g3x17XR0tttSskK7ZBp1kCq6
 CgjVsGHs4SLLXdgjxRuBpLvVF7mQAGCyryzuH4HZ1QCMi3obxbiiAkd36l0sWSF+Hr
 Ulc3WfKZv1/xz+aNru8Oa7ttmBievwGle9YdsVDAQhIW3fE+AQVG4spJ5cxAGYnxpJ
 dq48yBq9Zb4ywoaZiMqbxSEdBDyErbK2HPxMu1IW2NHchjNH/POyZt/o0+hE6Kiwr1
 YcKLSUpAWZMoPTevdbimvG13iDbR9j/995Gl1n9L05sGRoBWCGY3ny1WKqgEUR7fvk
 ETHLZFan0AGxg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 2/2] drm/sun4i: tcon: improve DCLK polarity handling
Date: Thu,  7 Jan 2021 03:30:32 +0100
Message-Id: <20210107023032.560182-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107023032.560182-1-giulio.benetti@benettiengineering.com>
References: <3685133.SLcexNTYsu@kista>
 <20210107023032.560182-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAiJ3v+tQqxZQm2L6MNuPUOmMXkyJgh41Q4J9f+nBGG2LDgpAgSXBGMzr/p67u+hk99UQ0KVAMFRmU2+lQK+F9LAuUjNqX725Tk2dJvTsix5pYBTFRFf
 To80IhdgB2N9FkcNVVTJiuJdzT/hTMScgbVaJkXY2NKXERyqzRDy6Q/7s+tfpVlPiZOflTVlnGJlgiCK19eBHsV7aIUw/zEk+/ICmSx3lkxE6cWUKawo/4Eo
 NhkbfK39gAjs8kyxhc5HwkiK06fXqu6j6mHV2qCJNwosXad3+/qscyiSh3xk7XC6zQjNRJ0591VK6S9YZWwVZ0dq4D7mW2zgNmXdcthqwuTUey8/r7sreux1
 +hvCRL3YyrM7bGGve480+86qMVPZe1s0aYQnUwuN7ySo9jbYUgZTsJESRn5qREVS66SxM4En5p/xyIrUE3pxhcQw5J+Hvo3ebH6HyPcptyH/Jew+xeq+BT/C
 yFhYF0nIqMkxO1xi2V4rVadpJFMN/h44qf+mPpPo97B6dE5+TX7r4RL/MewgeSCRgSxQSou+pPzr7EY8nRMgq0MNERn+qoUFsd6BEQ==
X-Mailman-Approved-At: Thu, 07 Jan 2021 08:53:13 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQG1pY3Jvbm92YXNybC5jb20+CgpJ
dCB0dXJuZWQgb3V0KE1heGltZSBzdWdnZXN0aW9uKSB0aGF0IGJpdCAyNiBvZiBTVU40SV9UQ09O
MF9JT19QT0xfUkVHIGlzCmRlZGljYXRlZCB0byBpbnZlcnQgRENMSyBwb2xhcml0eSBhbmQgdGhp
cyBtYWtlcyB0aGluZyByZWFsbHkgZWFzaWVyIHRoYW4KYmVmb3JlLiBTbyBsZXQncyBoYW5kbGUg
RENMSyBwb2xhcml0eSBieSBhZGRpbmcKU1VONElfVENPTjBfSU9fUE9MX0RDTEtfUE9TSVRJVkUg
YXMgYml0IDI2IGFuZCBhY3RpdmF0aW5nIGFjY29yZGluZyB0bwpidXNfZmxhZ3MgdGhlIHNhbWUg
d2F5IGlzIGRvbmUgZm9yIGFsbCB0aGUgb3RoZXIgc2lnbmFscy4KCkNjOiBNYXhpbWUgUmlwYXJk
IDxtYXhpbWVAY2Vybm8udGVjaD4KU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxp
by5iZW5ldHRpQG1pY3Jvbm92YXNybC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1
bjRpX3Rjb24uYyB8IDIwICstLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuNGlfdGNvbi5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40
aV90Y29uLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCmluZGV4IDUyNTk4
YmIwZmIwYi4uMzAxNzFjY2Q4N2U1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfdGNvbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKQEAg
LTU2OSwyNiArNTY5LDggQEAgc3RhdGljIHZvaWQgc3VuNGlfdGNvbjBfbW9kZV9zZXRfcmdiKHN0
cnVjdCBzdW40aV90Y29uICp0Y29uLAogCWlmIChpbmZvLT5idXNfZmxhZ3MgJiBEUk1fQlVTX0ZM
QUdfREVfTE9XKQogCQl2YWwgfD0gU1VONElfVENPTjBfSU9fUE9MX0RFX05FR0FUSVZFOwogCi0J
LyoKLQkgKiBPbiBBMjAgYW5kIHNpbWlsYXIgU29DcywgdGhlIG9ubHkgd2F5IHRvIGFjaGlldmUg
UG9zaXRpdmUgRWRnZQotCSAqIChSaXNpbmcgRWRnZSksIGlzIHNldHRpbmcgZGNsayBjbG9jayBw
aGFzZSB0byAyLzMoMjQwwrApLgotCSAqIEJ5IGRlZmF1bHQgVENPTiB3b3JrcyBpbiBOZWdhdGl2
ZSBFZGdlKEZhbGxpbmcgRWRnZSksCi0JICogdGhpcyBpcyB3aHkgcGhhc2UgaXMgc2V0IHRvIDAg
aW4gdGhhdCBjYXNlLgotCSAqIFVuZm9ydHVuYXRlbHkgdGhlcmUncyBubyB3YXkgdG8gbG9naWNh
bGx5IGludmVydCBkY2xrIHRocm91Z2gKLQkgKiBJT19QT0wgcmVnaXN0ZXIuCi0JICogVGhlIG9u
bHkgYWNjZXB0YWJsZSB3YXkgdG8gd29yaywgdHJpcGxlIGNoZWNrZWQgd2l0aCBzY29wZSwKLQkg
KiBpcyB1c2luZyBjbG9jayBwaGFzZSBzZXQgdG8gMMKwIGZvciBOZWdhdGl2ZSBFZGdlIGFuZCBz
ZXQgdG8gMjQwwrAKLQkgKiBmb3IgUG9zaXRpdmUgRWRnZS4KLQkgKiBPbiBBMzMgYW5kIHNpbWls
YXIgU29DcyB0aGVyZSB3b3VsZCBiZSBhIDkwwrAgcGhhc2Ugb3B0aW9uLAotCSAqIGJ1dCBpdCBk
aXZpZGVzIGFsc28gZGNsayBieSAyLgotCSAqIEZvbGxvd2luZyBjb2RlIGlzIGEgd2F5IHRvIGF2
b2lkIHF1aXJrcyBhbGwgYXJvdW5kIFRDT04KLQkgKiBhbmQgRE9UQ0xPQ0sgZHJpdmVycy4KLQkg
Ki8KIAlpZiAoaW5mby0+YnVzX2ZsYWdzICYgRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVfUE9T
RURHRSkKLQkJY2xrX3NldF9waGFzZSh0Y29uLT5kY2xrLCAwKTsKLQotCWlmIChpbmZvLT5idXNf
ZmxhZ3MgJiBEUk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV9ORUdFREdFKQotCQljbGtfc2V0X3Bo
YXNlKHRjb24tPmRjbGssIDI0MCk7CisJCXZhbCB8PSBTVU40SV9UQ09OMF9JT19QT0xfRENMS19Q
T1NJVElWRTsKIAogCXJlZ21hcF91cGRhdGVfYml0cyh0Y29uLT5yZWdzLCBTVU40SV9UQ09OMF9J
T19QT0xfUkVHLAogCQkJICAgU1VONElfVENPTjBfSU9fUE9MX0hTWU5DX1BPU0lUSVZFIHwKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmggYi9kcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5oCmluZGV4IGNmYmY0ZTZjMTY3OS4uMGNlNzFkMTBhMzFi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmgKQEAgLTExMyw2ICsxMTMsNyBAQAogI2Rl
ZmluZSBTVU40SV9UQ09OMF9JT19QT0xfUkVHCQkJMHg4OAogI2RlZmluZSBTVU40SV9UQ09OMF9J
T19QT0xfRENMS19QSEFTRShwaGFzZSkJCSgocGhhc2UgJiAzKSA8PCAyOCkKICNkZWZpbmUgU1VO
NElfVENPTjBfSU9fUE9MX0RFX05FR0FUSVZFCQkJQklUKDI3KQorI2RlZmluZSBTVU40SV9UQ09O
MF9JT19QT0xfRENMS19QT1NJVElWRQkJQklUKDI2KQogI2RlZmluZSBTVU40SV9UQ09OMF9JT19Q
T0xfSFNZTkNfUE9TSVRJVkUJCUJJVCgyNSkKICNkZWZpbmUgU1VONElfVENPTjBfSU9fUE9MX1ZT
WU5DX1BPU0lUSVZFCQlCSVQoMjQpCiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
