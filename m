Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2708576D6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 02:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6F06E579;
	Thu, 27 Jun 2019 00:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4832F6E578
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 00:43:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (unknown [107.242.116.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A883620815;
 Thu, 27 Jun 2019 00:33:53 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 62/95] gpu: ipu-v3: image-convert: Fix input
 bytesperline for packed formats
Date: Wed, 26 Jun 2019 20:29:47 -0400
Message-Id: <20190627003021.19867-62-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627003021.19867-1-sashal@kernel.org>
References: <20190627003021.19867-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561595635;
 bh=we131unhgMQ7C3zOh8M9oe4r3AEFYopGa1hNQUNp3kI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oy441cvjLsUXPsV/jrbVyQBGMjzIsg0Joq0BJVsx84+2dTmXacuA4lp/HoMkHRE8D
 mWWAN0q0yo+nKp3RVdWg8q2yW0JT/AOQXOBBv22KhkxG75Q/NBc6JgbL0fGuFibG+F
 P1vJUMVpVcBKwCdQd5+aX25bhHxqV/JGv5byTbd8=
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
Cc: Sasha Levin <sashal@kernel.org>,
 Harsha Manjula Mallikarjun <Harsha.ManjulaMallikarjun@in.bosch.com>,
 dri-devel@lists.freedesktop.org, Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU3RldmUgTG9uZ2VyYmVhbSA8c2xvbmdlcmJlYW1AZ21haWwuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgYmNhNGQ3MGNmMWI4ZjY0NzhhNzExYzQ0OGEzYTFlNDdiNzk0YjE2MiBdCgpUaGUg
aW5wdXQgYnl0ZXNwZXJsaW5lIGNhbGN1bGF0aW9uIGZvciBwYWNrZWQgcGl4ZWwgZm9ybWF0cyB3
YXMKaW5jb3JyZWN0LiBUaGUgbWluL21heCBjbGFtcGluZyB2YWx1ZXMgbXVzdCBiZSBtdWx0aXBs
aWVkIGJ5IHRoZQpwYWNrZWQgYml0cy1wZXItcGl4ZWwuIFRoaXMgd2FzIGNhdXNpbmcgY29ycnVw
dGVkIGNvbnZlcnRlZCBpbWFnZXMKd2hlbiB0aGUgaW5wdXQgZm9ybWF0IHdhcyBSR0I0IChwcm9i
YWJseSBhbHNvIG90aGVyIGlucHV0IHBhY2tlZApmb3JtYXRzKS4KCkZpeGVzOiBkOTY2ZTIzZDYx
YTJjICgiZ3B1OiBpcHUtdjM6IGltYWdlLWNvbnZlcnQ6IGZpeCBieXRlc3BlcmxpbmUKYWRqdXN0
bWVudCIpCgpSZXBvcnRlZC1ieTogSGFyc2hhIE1hbmp1bGEgTWFsbGlrYXJqdW4gPEhhcnNoYS5N
YW5qdWxhTWFsbGlrYXJqdW5AaW4uYm9zY2guY29tPgpTdWdnZXN0ZWQtYnk6IEhhcnNoYSBNYW5q
dWxhIE1hbGxpa2FyanVuIDxIYXJzaGEuTWFuanVsYU1hbGxpa2FyanVuQGluLmJvc2NoLmNvbT4K
U2lnbmVkLW9mZi1ieTogU3RldmUgTG9uZ2VyYmVhbSA8c2xvbmdlcmJlYW1AZ21haWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpTaWdu
ZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvaXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9p
cHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYyBiL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2Ut
Y29udmVydC5jCmluZGV4IDBkOTcxOTg1ZjhjOS4uMTlkM2I4NWUwZTk4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYworKysgYi9kcml2ZXJzL2dwdS9p
cHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYwpAQCAtMTk0Miw3ICsxOTQyLDkgQEAgdm9pZCBpcHVf
aW1hZ2VfY29udmVydF9hZGp1c3Qoc3RydWN0IGlwdV9pbWFnZSAqaW4sIHN0cnVjdCBpcHVfaW1h
Z2UgKm91dCwKIAkJY2xhbXBfYWxpZ24oaW4tPnBpeC53aWR0aCwgMiA8PCB3X2FsaWduX2luLCBN
QVhfVywKIAkJCSAgICB3X2FsaWduX2luKSA6CiAJCWNsYW1wX2FsaWduKChpbi0+cGl4LndpZHRo
ICogaW5mbXQtPmJwcCkgPj4gMywKLQkJCSAgICAyIDw8IHdfYWxpZ25faW4sIE1BWF9XLCB3X2Fs
aWduX2luKTsKKwkJCSAgICAoKDIgPDwgd19hbGlnbl9pbikgKiBpbmZtdC0+YnBwKSA+PiAzLAor
CQkJICAgIChNQVhfVyAqIGluZm10LT5icHApID4+IDMsCisJCQkgICAgd19hbGlnbl9pbik7CiAJ
aW4tPnBpeC5zaXplaW1hZ2UgPSBpbmZtdC0+cGxhbmFyID8KIAkJKGluLT5waXguaGVpZ2h0ICog
aW4tPnBpeC5ieXRlc3BlcmxpbmUgKiBpbmZtdC0+YnBwKSA+PiAzIDoKIAkJaW4tPnBpeC5oZWln
aHQgKiBpbi0+cGl4LmJ5dGVzcGVybGluZTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
