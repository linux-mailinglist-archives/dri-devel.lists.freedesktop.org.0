Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A5187954
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A52894E7;
	Fri,  9 Aug 2019 12:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91566EDF3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 12:05:17 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hw3dy-0005YA-2N; Fri, 09 Aug 2019 14:05:14 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/etnaviv: skip command stream validation on PPAS
 capable GPUs
Date: Fri,  9 Aug 2019 14:05:12 +0200
Message-Id: <20190809120514.5157-1-l.stach@pengutronix.de>
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

V2l0aCBwZXItcHJvY2VzcyBhZGRyZXNzIHNwYWNlcyBpbiBwbGFjZSwgYSByb2d1ZSBwcm9jZXNz
IHN1Ym1pdHRpbmcKYm9ndXMgY29tbWFuZCBzdHJlYW1zIGNhbiBvbmx5IGh1cnQgaXRzZWxmLiBU
aGVyZSBpcyBubyBuZWVkIHRvCnZhbGlkYXRlIHRoZSBjb21tYW5kIHN0cmVhbSBiZWZvcmUgZXhl
Y3V0aW9uIGFueW1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5n
dXRyb25peC5kZT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fc3VibWl0LmMg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtX3N1Ym1pdC5j
IGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fc3VibWl0LmMKaW5kZXggMTZl
N2QzNzFhN2VmLi42M2ExMjA2NDkyZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5h
dml2L2V0bmF2aXZfZ2VtX3N1Ym1pdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0
bmF2aXZfZ2VtX3N1Ym1pdC5jCkBAIC01MTcsNyArNTE3LDggQEAgaW50IGV0bmF2aXZfaW9jdGxf
Z2VtX3N1Ym1pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCWlmIChyZXQp
CiAJCWdvdG8gZXJyX3N1Ym1pdF9vYmplY3RzOwogCi0JaWYgKCFldG5hdml2X2NtZF92YWxpZGF0
ZV9vbmUoZ3B1LCBzdHJlYW0sIGFyZ3MtPnN0cmVhbV9zaXplIC8gNCwKKwlpZiAoKHByaXYtPm1t
dV9nbG9iYWwtPnZlcnNpb24gIT0gRVROQVZJVl9JT01NVV9WMikgJiYKKwkgICAgIWV0bmF2aXZf
Y21kX3ZhbGlkYXRlX29uZShncHUsIHN0cmVhbSwgYXJncy0+c3RyZWFtX3NpemUgLyA0LAogCQkJ
CSAgICAgIHJlbG9jcywgYXJncy0+bnJfcmVsb2NzKSkgewogCQlyZXQgPSAtRUlOVkFMOwogCQln
b3RvIGVycl9zdWJtaXRfb2JqZWN0czsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
