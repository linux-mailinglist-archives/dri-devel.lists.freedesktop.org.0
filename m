Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA745371B20
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1196E9C7;
	Mon,  3 May 2021 16:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E156E9C5;
 Mon,  3 May 2021 16:42:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE02161951;
 Mon,  3 May 2021 16:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620060167;
 bh=n609f3gMSJRljYhN1/ve688WgsyGXq4QRIENlWuUpFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hDavrWVHbPz+bjDyJSfCqKX1PAplA0wMmh+S6nWCWymXq0RrF1VSgvf+qOS/908Ax
 9ANT7fvKSz54RbwxZiavgb5+OrmdeZY0gBXcnCUHx1rJ7KyPKXtzs4uG2odgv8vnG0
 Smw2YDhjYmIJ8x278shcsY/DAKJjXqRZVXSmleDTqtmgNJK/F95y+BTx3OJkjkRMKZ
 u0FNdrGV6HqUTooxV+k4HF35pUXBezbb0Kt0Upe0ZRrCn1nsrxyqe5pnyPKbNotjav
 ZLYpUq1eN+H7Dqhmw+n6JtGHnUDwIuGbWPycO+BBkKR+249eQFbbzVk7d+Rbm5yljN
 60vFrtVYjD4pg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 28/31] drm/amdgpu: fix NULL pointer dereference
Date: Mon,  3 May 2021 12:42:01 -0400
Message-Id: <20210503164204.2854178-28-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503164204.2854178-1-sashal@kernel.org>
References: <20210503164204.2854178-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Guchun Chen <guchun.chen@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCAzYzNkYzY1NDMzM2Y2Mzg5ODAzY2RjYWYwMzkxMmU5NDE3M2FlNTEwIF0KCnR0bS0+c2cgbmVl
ZHMgdG8gYmUgY2hlY2tlZCBiZWZvcmUgYWNjZXNzaW5nIGl0cyBjaGlsZCBtZW1iZXIuCgpDYWxs
IFRyYWNlOgogYW1kZ3B1X3R0bV9iYWNrZW5kX2Rlc3Ryb3krMHgxMi8weDcwIFthbWRncHVdCiB0
dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZSsweDNhLzB4NjAgW3R0bV0KIHR0bV9ib19yZWxlYXNl
KzB4MTdkLzB4MzAwIFt0dG1dCiBhbWRncHVfYm9fdW5yZWYrMHgxYS8weDMwIFthbWRncHVdCiBh
bWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9ncHUrMHg3OGIvMHg4YjAgW2FtZGdw
dV0KIGtmZF9pb2N0bF9hbGxvY19tZW1vcnlfb2ZfZ3B1KzB4MTE4LzB4MjIwIFthbWRncHVdCiBr
ZmRfaW9jdGwrMHgyMjIvMHg0MDAgW2FtZGdwdV0KID8ga2ZkX2Rldl9pc19sYXJnZV9iYXIrMHg5
MC8weDkwIFthbWRncHVdCiBfX3g2NF9zeXNfaW9jdGwrMHg4ZS8weGQwCiA/IF9fY29udGV4dF90
cmFja2luZ19leGl0KzB4NTIvMHg5MAogZG9fc3lzY2FsbF82NCsweDMzLzB4ODAKIGVudHJ5X1NZ
U0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKUklQOiAwMDMzOjB4N2Y5N2YyNjRkMzE3
CkNvZGU6IGIzIDY2IDkwIDQ4IDhiIDA1IDcxIDRiIDJkIDAwIDY0IGM3IDAwIDI2IDAwIDAwIDAw
IDQ4IGM3IGMwIGZmIGZmIGZmIGZmIGMzIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIGI4
IDEwIDAwIDAwIDAwIDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggOGIgMGQg
NDEgNGIgMmQgMDAgZjcgZDggNjQgODkgMDEgNDgKUlNQOiAwMDJiOjAwMDA3ZmZkYjQwMmMzMzgg
RUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDAxMApSQVg6IGZmZmZmZmZm
ZmZmZmZmZGEgUkJYOiAwMDAwN2Y5N2YzY2M2M2EwIFJDWDogMDAwMDdmOTdmMjY0ZDMxNwpSRFg6
IDAwMDA3ZmZkYjQwMmMzODAgUlNJOiAwMDAwMDAwMGMwMjg0YjE2IFJESTogMDAwMDAwMDAwMDAw
MDAwMwpSQlA6IDAwMDA3ZmZkYjQwMmMzODAgUjA4OiAwMDAwN2ZmZGI0MDJjNDI4IFIwOTogMDAw
MDAwMDBjNDAwMDAwNApSMTA6IDAwMDAwMDAwYzQwMDAwMDQgUjExOiAwMDAwMDAwMDAwMDAwMjQ2
IFIxMjogMDAwMDAwMDBjMDI4NGIxNgpSMTM6IDAwMDAwMDAwMDAwMDAwMDMgUjE0OiAwMDAwN2Y5
N2YzY2M2M2EwIFIxNTogMDAwMDdmODgzNjIwMDAwMAoKU2lnbmVkLW9mZi1ieTogR3VjaHVuIENo
ZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBr
ZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRleCBhZTcwMGU0NDVmYmMuLmQw
NTdiYzI5YmY0YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwpAQCAt
NzQyLDcgKzc0Miw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV90dG1fdHRfdW5waW5fdXNlcnB0cihz
dHJ1Y3QgdHRtX3R0ICp0dG0pCiAJCURNQV9CSURJUkVDVElPTkFMIDogRE1BX1RPX0RFVklDRTsK
IAogCS8qIGRvdWJsZSBjaGVjayB0aGF0IHdlIGRvbid0IGZyZWUgdGhlIHRhYmxlIHR3aWNlICov
Ci0JaWYgKCF0dG0tPnNnLT5zZ2wpCisJaWYgKCF0dG0tPnNnIHx8ICF0dG0tPnNnLT5zZ2wpCiAJ
CXJldHVybjsKIAogCS8qIGZyZWUgdGhlIHNnIHRhYmxlIGFuZCBwYWdlcyBhZ2FpbiAqLwotLSAK
Mi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
