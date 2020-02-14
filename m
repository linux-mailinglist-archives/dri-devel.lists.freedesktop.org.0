Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C6C15DE04
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF026FA1C;
	Fri, 14 Feb 2020 16:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7B56FA1C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:02:31 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E8F12067D;
 Fri, 14 Feb 2020 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696151;
 bh=XVGy6iK7CadxPsP1+MFoAhGr6E5YoTKUWdF1RoQobYU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UqmTaKr/UTGz7pKqAeYzoqg+Y922tMLLqhYDwp9I+A+/C4mNYslLifUqfEDNBmucH
 Wtn6uTI1BxI0WlkTPrbYl4b2/hKG7Ft/Xe+ovuUUsbKy0YqO/9ofP6d0MmY7h4KE4N
 gutnu0hEgS1eoswg8h6Zm5K7zbwcWCLXxu9Jl+RQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 031/459] drm/mipi_dbi: Fix off-by-one bugs in
 mipi_dbi_blank()
Date: Fri, 14 Feb 2020 10:54:41 -0500
Message-Id: <20200214160149.11681-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KClsgVXBz
dHJlYW0gY29tbWl0IDJjZTE4MjQ5YWY1YTI4MDMxYjNmOTA5Y2ZhZmNjYzg4ZWE5NjZjOWQgXQoK
V2hlbiBjb25maWd1cmluZyB0aGUgZnJhbWUgbWVtb3J5IHdpbmRvdywgdGhlIGxhc3QgY29sdW1u
IGFuZCByb3cKbnVtYmVycyBhcmUgd3JpdHRlbiB0byB0aGUgY29sdW1uIHJlc3AuIHBhZ2UgYWRk
cmVzcyByZWdpc3RlcnMuICBUaGVzZQpudW1iZXJzIGFyZSB0aHVzIG9uZSBsZXNzIHRoYW4gdGhl
IGFjdHVhbCB3aW5kb3cgd2lkdGggcmVzcC4gaGVpZ2h0LgoKV2hpbGUgdGhpcyBpcyBoYW5kbGVk
IGNvcnJlY3RseSBpbiBtaXBpX2RiaV9mYl9kaXJ0eSgpIHNpbmNlIGNvbW1pdAowM2NlYjFjOGRm
ZDFlMjkzICgiZHJtL3Rpbnlkcm06IEZpeCBzZXR0aW5nIG9mIHRoZSBjb2x1bW4vcGFnZSBlbmQK
YWRkcmVzc2VzLiIpLCBpdCBpcyBub3QgaW4gbWlwaV9kYmlfYmxhbmsoKS4gIFRoZSBsYXR0ZXIg
c3RpbGwgZm9yZ2V0cwp0byBzdWJ0cmFjdCBvbmUgd2hlbiBjYWxjdWxhdGluZyB0aGUgbW9zdCBz
aWduaWZpY2FudCBieXRlcyBvZiB0aGUKY29sdW1uIGFuZCByb3cgbnVtYmVycywgdGh1cyBwcm9n
cmFtbWluZyB3cm9uZyB2YWx1ZXMgd2hlbiB0aGUgZGlzcGxheQp3aWR0aCBvciBoZWlnaHQgaXMg
YSBtdWx0aXBsZSBvZiAyNTYuCgpGaXhlczogMDJkZDk1ZmUzMTY5MzYyNiAoImRybS90aW55ZHJt
OiBBZGQgTUlQSSBEQkkgc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+ClNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5l
cyA8bm9yYWxmQHRyb25uZXMub3JnPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTEyMzAxMzA2MDQuMzEwMDYtMS1nZWVydCtyZW5lc2FzQGds
aWRlci5iZQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fbWlwaV9kYmkuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYwpp
bmRleCBmODE1NDMxNmEzYjBkLi5hMDVlNjRlM2Q4MGJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX21pcGlfZGJpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5j
CkBAIC0zNjcsOSArMzY3LDkgQEAgc3RhdGljIHZvaWQgbWlwaV9kYmlfYmxhbmsoc3RydWN0IG1p
cGlfZGJpX2RldiAqZGJpZGV2KQogCW1lbXNldChkYmlkZXYtPnR4X2J1ZiwgMCwgbGVuKTsKIAog
CW1pcGlfZGJpX2NvbW1hbmQoZGJpLCBNSVBJX0RDU19TRVRfQ09MVU1OX0FERFJFU1MsIDAsIDAs
Ci0JCQkgKHdpZHRoID4+IDgpICYgMHhGRiwgKHdpZHRoIC0gMSkgJiAweEZGKTsKKwkJCSAoKHdp
ZHRoIC0gMSkgPj4gOCkgJiAweEZGLCAod2lkdGggLSAxKSAmIDB4RkYpOwogCW1pcGlfZGJpX2Nv
bW1hbmQoZGJpLCBNSVBJX0RDU19TRVRfUEFHRV9BRERSRVNTLCAwLCAwLAotCQkJIChoZWlnaHQg
Pj4gOCkgJiAweEZGLCAoaGVpZ2h0IC0gMSkgJiAweEZGKTsKKwkJCSAoKGhlaWdodCAtIDEpID4+
IDgpICYgMHhGRiwgKGhlaWdodCAtIDEpICYgMHhGRik7CiAJbWlwaV9kYmlfY29tbWFuZF9idWYo
ZGJpLCBNSVBJX0RDU19XUklURV9NRU1PUllfU1RBUlQsCiAJCQkgICAgICh1OCAqKWRiaWRldi0+
dHhfYnVmLCBsZW4pOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
