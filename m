Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A524D93D1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 16:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FBA6E995;
	Wed, 16 Oct 2019 14:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A866E6E995
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 14:27:20 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1iKkGi-0002DO-Hj; Wed, 16 Oct 2019 16:27:16 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 1/2] drm/etnaviv: fix deadlock in GPU coredump
Date: Wed, 16 Oct 2019 16:27:15 +0200
Message-Id: <20191016142716.10168-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdQVSBjb3JlZHVtcCBmdW5jdGlvbiB2aW9sYXRlcyB0aGUgbG9ja2luZyBvcmRlciBieSBo
b2xkaW5nIHRoZSBNTVUKY29udGV4dCBsb2NrIHdoaWxlIHRyeWluZyB0byBhY3F1aXJlIHRoZSBl
dG5hdml2X2dlbV9vYmplY3QgbG9jay4gVGhpcwpyZXN1bHRzIGluIGEgcG9zc2libGUgQUJCQSBk
ZWFkbG9jayB3aXRoIG90aGVyIGNvZGVwYXRocyB3aGljaCBmb2xsb3cKdGhlIGVzdGFibGlzaGVk
IGxvY2tpbmcgb3JkZXIuCkZvcnR1bmF0ZWx5IHRoaXMgaXMgZWFzeSB0byBmaXggYnkgZHJvcHBp
bmcgdGhlIE1NVSBjb250ZXh0IGxvY2sKZWFybGllciwgYXMgdGhlIEJPIGR1bXBpbmcgZG9lc24n
dCBuZWVkIHRoZSBNTVUgY29udGV4dCB0byBiZSBzdGFibGUuClRoZSBvbmx5IHRoaW5nIHRoZSBC
TyBkdW1waW5nIGNhcmVzIGFib3V0IGFyZSB0aGUgQk8gbWFwcGluZ3MsIHdoaWNoCmFyZSBzdGFi
bGUgYWNyb3NzIHRoZSBsaWZldGltZSBvZiB0aGUgam9iLgoKRml4ZXM6IDI3YjY3Mjc4ZTAwNyAo
ZHJtL2V0bmF2aXY6IHJld29yayBNTVUgaGFuZGxpbmcpClsgTm90IHJlYWxseSB0aGUgZmlyc3Qg
YmFkIGNvbW1pdCwgYnV0IHRoZSBvbmUgd2hlcmUgdGhpcyBmaXggYXBwbGllcwogIGNsZWFubHku
IFN0YWJsZSBrZXJuZWxzIG5lZWQgYSBtYW51YWwgYmFja3BvcnQuIF0KUmVwb3J0ZWQtYnk6IENo
cmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZp
dl9kdW1wLmMKaW5kZXggNjk4ZGI1NDA5NzJjLi42NDhjZjAyMDczMDkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZHVtcC5jCkBAIC0xODAsNiArMTgwLDggQEAgdm9pZCBldG5hdml2
X2NvcmVfZHVtcChzdHJ1Y3QgZXRuYXZpdl9nZW1fc3VibWl0ICpzdWJtaXQpCiAJCQkgICAgICBl
dG5hdml2X2NtZGJ1Zl9nZXRfdmEoJnN1Ym1pdC0+Y21kYnVmLAogCQkJCQkmZ3B1LT5tbXVfY29u
dGV4dC0+Y21kYnVmX21hcHBpbmcpKTsKIAorCW11dGV4X3VubG9jaygmZ3B1LT5tbXVfY29udGV4
dC0+bG9jayk7CisKIAkvKiBSZXNlcnZlIHNwYWNlIGZvciB0aGUgYm9tYXAgKi8KIAlpZiAobl9i
b21hcF9wYWdlcykgewogCQlib21hcF9zdGFydCA9IGJvbWFwID0gaXRlci5kYXRhOwpAQCAtMjIx
LDggKzIyMyw2IEBAIHZvaWQgZXRuYXZpdl9jb3JlX2R1bXAoc3RydWN0IGV0bmF2aXZfZ2VtX3N1
Ym1pdCAqc3VibWl0KQogCQkJCQkgb2JqLT5iYXNlLnNpemUpOwogCX0KIAotCW11dGV4X3VubG9j
aygmZ3B1LT5tbXVfY29udGV4dC0+bG9jayk7Ci0KIAlldG5hdml2X2NvcmVfZHVtcF9oZWFkZXIo
Jml0ZXIsIEVURFVNUF9CVUZfRU5ELCBpdGVyLmRhdGEpOwogCiAJZGV2X2NvcmVkdW1wdihncHUt
PmRldiwgaXRlci5zdGFydCwgaXRlci5kYXRhIC0gaXRlci5zdGFydCwgR0ZQX0tFUk5FTCk7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
