Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B771604FE
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 18:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7EB6E44E;
	Sun, 16 Feb 2020 17:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057C06E44E
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 17:27:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id D80AD200EE;
 Sun, 16 Feb 2020 18:21:40 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: broonie@kernel.org,
	balbi@kernel.org,
	lee.jones@linaro.org
Subject: [RFC 6/9] regmap: Speed up _regmap_raw_write_impl() for large buffers
Date: Sun, 16 Feb 2020 18:21:14 +0100
Message-Id: <20200216172117.49832-7-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200216172117.49832-1-noralf@tronnes.org>
References: <20200216172117.49832-1-noralf@tronnes.org>
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ZvHD1ezG c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10
 a=SJz97ENfAAAA:8 a=b2nCpQa9nUX8Wd5tZLcA:9 a=QEXdDO2ut3YA:10
 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB3cml0aW5nIGEgM01CIGJ1ZmZlciB0aGUgdW53cml0YWJsZSBjaGVjayBpbiBfcmVnbWFw
X3Jhd193cml0ZV9pbXBsKCkKYWRkcyBhIH4yMG1zIG92ZXJoZWFkIG9uIGEgUmFzcGJlcnJ5IFBp
IDQuCkFtZW5kIHRoaXMgYnkgYXZvaWRpbmcgdGhlIGNoZWNrIGlmIGl0J3Mgbm90IG5lY2Vzc2Fy
eS4KClNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgot
LS0KIGRyaXZlcnMvYmFzZS9yZWdtYXAvcmVnbWFwLmMgfCAxMCArKysrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYmFzZS9yZWdtYXAvcmVnbWFwLmMgYi9kcml2ZXJzL2Jhc2UvcmVnbWFwL3JlZ21hcC5j
CmluZGV4IDE5ZjU3Y2NmYmUxZC4uY2Q4NzYzMDlhNzRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jh
c2UvcmVnbWFwL3JlZ21hcC5jCisrKyBiL2RyaXZlcnMvYmFzZS9yZWdtYXAvcmVnbWFwLmMKQEAg
LTE0ODksMTAgKzE0ODksMTIgQEAgc3RhdGljIGludCBfcmVnbWFwX3Jhd193cml0ZV9pbXBsKHN0
cnVjdCByZWdtYXAgKm1hcCwgdW5zaWduZWQgaW50IHJlZywKIAlXQVJOX09OKCFtYXAtPmJ1cyk7
CiAKIAkvKiBDaGVjayBmb3IgdW53cml0YWJsZSByZWdpc3RlcnMgYmVmb3JlIHdlIHN0YXJ0ICov
Ci0JZm9yIChpID0gMDsgaSA8IHZhbF9sZW4gLyBtYXAtPmZvcm1hdC52YWxfYnl0ZXM7IGkrKykK
LQkJaWYgKCFyZWdtYXBfd3JpdGVhYmxlKG1hcCwKLQkJCQkgICAgIHJlZyArIHJlZ21hcF9nZXRf
b2Zmc2V0KG1hcCwgaSkpKQotCQkJcmV0dXJuIC1FSU5WQUw7CisJaWYgKG1hcC0+bWF4X3JlZ2lz
dGVyIHx8IG1hcC0+d3JpdGVhYmxlX3JlZyB8fCBtYXAtPndyX3RhYmxlKSB7CisJCWZvciAoaSA9
IDA7IGkgPCB2YWxfbGVuIC8gbWFwLT5mb3JtYXQudmFsX2J5dGVzOyBpKyspCisJCQlpZiAoIXJl
Z21hcF93cml0ZWFibGUobWFwLAorCQkJCQkgICAgICByZWcgKyByZWdtYXBfZ2V0X29mZnNldCht
YXAsIGkpKSkKKwkJCQlyZXR1cm4gLUVJTlZBTDsKKwl9CiAKIAlpZiAoIW1hcC0+Y2FjaGVfYnlw
YXNzICYmIG1hcC0+Zm9ybWF0LnBhcnNlX3ZhbCkgewogCQl1bnNpZ25lZCBpbnQgaXZhbDsKLS0g
CjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
