Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA810617F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 06:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85536E1CF;
	Fri, 22 Nov 2019 05:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6116E1CF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 05:57:43 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1914A2072D;
 Fri, 22 Nov 2019 05:57:43 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 104/127] gpu: ipu-v3: pre: don't trigger update
 if buffer address doesn't change
Date: Fri, 22 Nov 2019 00:55:22 -0500
Message-Id: <20191122055544.3299-103-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122055544.3299-1-sashal@kernel.org>
References: <20191122055544.3299-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574402263;
 bh=m46hbcDViVWHgP9ujJrVxd/nsrnZXJ5GEUJVDJ3t0e8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KK0bZ9fhzzjjm2U7Lwq8YxByOBPdC43Zs+++Z6dS7OKKNXoVdoWQlhbweok5tRZF/
 6K9kp8Ry1e9lEGMVlTa0o4BppzRMAH/v6aClI/3fVmBOnr0gnods8mBmJal6VLSA9P
 /mO1ncDnqXfMebJ/K7JdNgOu5wHGmfepoKRMtDew=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpbIFVwc3RyZWFtIGNv
bW1pdCBlYjAyMDBhNDM1N2RhMTAwMDY0OTcxNjg5ZDNhMGU5ZTNjZjU3ZjMzIF0KCk9uIGEgTk9Q
IGRvdWJsZSBidWZmZXIgdXBkYXRlIHdoZXJlIGN1cnJlbnQgYnVmZmVyIGFkZHJlc3MgaXMgdGhl
IHNhbWUKYXMgdGhlIG5leHQgYnVmZmVyIGFkZHJlc3MsIHRoZSBTRFdfVVBEQVRFIGJpdCBjbGVh
cnMgdG9vIGxhdGUuIEFzIHdlCmFyZSBub3cgdXNpbmcgdGhpcyBiaXQgdG8gZGV0ZXJtaW5lIHdo
ZW4gaXQgaXMgc2FmZSB0byBzaWduYWwgZmxpcApjb21wbGV0aW9uIHRvIHVzZXJzcGFjZSB0aGlz
IHdpbGwgZGVsYXkgY29tcGxldGlvbiBvZiBhdG9taWMgY29tbWl0cwp3aGVyZSBvbmUgcGxhbmUg
ZG9lc24ndCBjaGFuZ2UgdGhlIGJ1ZmZlciBieSBhIHdob2xlIGZyYW1lIHBlcmlvZC4KCkZpeCB0
aGlzIGJ5IHJlbWVtYmVyaW5nIHRoZSBsYXN0IGJ1ZmZlciBhZGRyZXNzIGFuZCBqdXN0IHNraXAg
dGhlCmRvdWJsZSBidWZmZXIgdXBkYXRlIGlmIGl0IHdvdWxkIG5vdCBjaGFuZ2UgdGhlIGJ1ZmZl
ciBhZGRyZXNzLgoKU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9u
aXguZGU+CltwLnphYmVsQHBlbmd1dHJvbml4LmRlOiBpbml0aWFsaXplIGxhc3RfYnVmYWRkciBp
biBpcHVfcHJlX2NvbmZpZ3VyZV0KU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJl
bEBwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJu
ZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2lwdS12My9pcHUtcHJlLmMgfCA2ICsrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2lw
dS12My9pcHUtcHJlLmMgYi9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LXByZS5jCmluZGV4IDFkMTYx
MmUyODg1NGIuLjZmZDRhZjY0N2Y1OTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2lwdS12My9p
cHUtcHJlLmMKKysrIGIvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1wcmUuYwpAQCAtMTAyLDYgKzEw
Miw3IEBAIHN0cnVjdCBpcHVfcHJlIHsKIAl2b2lkCQkJKmJ1ZmZlcl92aXJ0OwogCWJvb2wJCQlp
bl91c2U7CiAJdW5zaWduZWQgaW50CQlzYWZlX3dpbmRvd19lbmQ7CisJdW5zaWduZWQgaW50CQls
YXN0X2J1ZmFkZHI7CiB9OwogCiBzdGF0aWMgREVGSU5FX01VVEVYKGlwdV9wcmVfbGlzdF9tdXRl
eCk7CkBAIC0xNzcsNiArMTc4LDcgQEAgdm9pZCBpcHVfcHJlX2NvbmZpZ3VyZShzdHJ1Y3QgaXB1
X3ByZSAqcHJlLCB1bnNpZ25lZCBpbnQgd2lkdGgsCiAKIAl3cml0ZWwoYnVmYWRkciwgcHJlLT5y
ZWdzICsgSVBVX1BSRV9DVVJfQlVGKTsKIAl3cml0ZWwoYnVmYWRkciwgcHJlLT5yZWdzICsgSVBV
X1BSRV9ORVhUX0JVRik7CisJcHJlLT5sYXN0X2J1ZmFkZHIgPSBidWZhZGRyOwogCiAJdmFsID0g
SVBVX1BSRV9QUkVGX0VOR19DVFJMX0lOUFVUX1BJWEVMX0ZPUk1BVCgwKSB8CiAJICAgICAgSVBV
X1BSRV9QUkVGX0VOR19DVFJMX0lOUFVUX0FDVElWRV9CUFAoYWN0aXZlX2JwcCkgfApAQCAtMjE4
LDcgKzIyMCwxMSBAQCB2b2lkIGlwdV9wcmVfdXBkYXRlKHN0cnVjdCBpcHVfcHJlICpwcmUsIHVu
c2lnbmVkIGludCBidWZhZGRyKQogCXVuc2lnbmVkIHNob3J0IGN1cnJlbnRfeWJsb2NrOwogCXUz
MiB2YWw7CiAKKwlpZiAoYnVmYWRkciA9PSBwcmUtPmxhc3RfYnVmYWRkcikKKwkJcmV0dXJuOwor
CiAJd3JpdGVsKGJ1ZmFkZHIsIHByZS0+cmVncyArIElQVV9QUkVfTkVYVF9CVUYpOworCXByZS0+
bGFzdF9idWZhZGRyID0gYnVmYWRkcjsKIAogCWRvIHsKIAkJaWYgKHRpbWVfYWZ0ZXIoamlmZmll
cywgdGltZW91dCkpIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
