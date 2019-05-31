Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 228F130F7D
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 16:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F4B894C5;
	Fri, 31 May 2019 14:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E84893D5;
 Fri, 31 May 2019 14:01:58 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52318
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hWi6W-0002XY-AI; Fri, 31 May 2019 16:01:56 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/8] drm/fb-helper: Move modesetting code to drm_client
Date: Fri, 31 May 2019 16:01:09 +0200
Message-Id: <20190531140117.37751-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=mwC5HMZvrHctXfyhjgStqbZ7qZ/hvFZh7Ms7oSTtNhM=; 
 b=e5veHtB/U+JUOOqJicuRomYLc9RvXHyVsOSTwrqxyS1Rk3PAbfU//SrNdLFhC64gAPPBzGmyagFX3yFV7s7DdKTz0tA1vtshCJ9lWiJ4Fa50iv9iF7wIsp3zr7yjkEQKG5yzggarktCxHY6hTCxGXIDlDwA1JTXPWGL01lremepTG/sp8RpODtcg1pfi4gQWLVJx9UHSEcLn7HZ1ULNat0EpF/94SrFBIc48kJvQkFBPDLZQB0q7r1ozqRRUrGj77m+nwSmvcuU1DLOsqbT4uGbSYN1NZR9bAjsixYtMVbLUzRABnPoj0NbNQNRqsppV6ZP6NoqUEdae63vl3Z73bA==;
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
Cc: intel-gfx@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtb3ZlcyB0aGUgbW9kZXNldHRpbmcgY29kZSBmcm9tIGRybV9mYl9oZWxwZXIgdG8gZHJt
X2NsaWVudCBzbyBpdApjYW4gYmUgc2hhcmVkIGJ5IGFsbCBpbnRlcm5hbCBjbGllbnRzLgoKQ2hh
bmdlcyB0aGlzIHRpbWU6Ci0gRGVjbGFyZSBkcm1fbW9kZV9zZXQgYW5kIGRybV9wbGFuZV9zdGF0
ZSBpbiBwYXRjaCAxCi0gRXhwb3J0IGRybV9jbGllbnRfcGFuZWxfcm90YXRpb24oKSAoR2VyZCBI
b2ZmbWFubikKLSBSZWJhc2UKCk5vcmFsZi4KCkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4KCk5vcmFsZiBUcsO4bm5lcyAoOCk6CiAgZHJtL2F0b21pYzogTW92ZSBfX2RybV9h
dG9taWNfaGVscGVyX2Rpc2FibGVfcGxhbmUvc2V0X2NvbmZpZygpCiAgZHJtL2ZiLWhlbHBlcjog
UmVtb3ZlIGRybV9mYl9oZWxwZXJfY3J0YwogIGRybS9mYi1oZWxwZXI6IFByZXBhcmUgdG8gbW92
ZSBvdXQgY29tbWl0IGNvZGUKICBkcm0vZmItaGVscGVyOiBNb3ZlIG91dCBjb21taXQgY29kZQog
IGRybS9mYi1oZWxwZXI6IFJlbW92ZSBkcm1fZmJfaGVscGVyX2Nvbm5lY3RvcgogIGRybS9mYi1o
ZWxwZXI6IFByZXBhcmUgdG8gbW92ZSBvdXQgbW9kZXNldCBjb25maWcgY29kZQogIGRybS9mYi1o
ZWxwZXI6IE1vdmUgb3V0IG1vZGVzZXQgY29uZmlnIGNvZGUKICBkcm0vY2xpZW50OiBIYWNrOiBB
ZGQgYm9vdHNwbGFzaCBleGFtcGxlCgogRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWNsaWVudC5yc3Qg
ICAgIHwgICAgMyArCiBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCAgICAgICAgICAgfCAgICA3
ICsKIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAgICB8ICAgIDUgKwogZHJpdmVy
cy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAgIHwgICAgMyArLQogZHJpdmVycy9ncHUvZHJt
L2RybV9hdG9taWMuYyAgICAgICAgIHwgIDE2OCArKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0
b21pY19oZWxwZXIuYyAgfCAgMTY0IC0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYm9vdHNwbGFz
aC5jICAgICB8ICAzNTggKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYyAgICAg
ICAgIHwgICAxNyArLQogZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jIHwgMTA4
NyArKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19pbnRlcm5h
bC5oICB8ICAgIDcgKwogZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYyAgICAgICAgICAgIHwgICAg
NCArCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jICAgICAgfCAxMzA1ICsrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fYXRvbWljX2hlbHBlci5oICAgICAg
fCAgICA0IC0KIGluY2x1ZGUvZHJtL2RybV9jbGllbnQuaCAgICAgICAgICAgICB8ICAgNDkgKwog
aW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oICAgICAgICAgIHwgICA5MiArLQogMTUgZmlsZXMg
Y2hhbmdlZCwgMTgwMyBpbnNlcnRpb25zKCspLCAxNDcwIGRlbGV0aW9ucygtKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fYm9vdHNwbGFzaC5jCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
