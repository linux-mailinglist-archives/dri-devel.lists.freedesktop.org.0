Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BF124E682
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185E06E424;
	Sat, 22 Aug 2020 09:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D3F6E057
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 10:49:21 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BXyty4jRtz9sTF; Fri, 21 Aug 2020 20:49:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598006954;
 bh=JjpyRpHNHrdiIzB9HKYK2tJlfybxA7SBXGzOln4SAMw=;
 h=From:To:Cc:Subject:Date:From;
 b=Ic7CLE8CPil48dGMD59EwPqX1s8aafqB7yJvTRAPHkKoPZ7HLlxoyS0nMl7zdulkj
 ExYnaonEXl3hzV0BTmnOb2Ry5nlfoPtDrmfSFE9RbKjyJBIYcVColR+aOk0UNk9sKG
 b084LseD3EL+ywDMxlZrwJagpafnb3wEguhoBrUcQO4BfdiZXlrQIXCgHlTcV/FSE7
 MjbzyYJgdHhUMwTGK0fuTIKxThwXnKxzPURLTeDp+f0Qdvb7UBF8y+Y8jzlCBc/SNP
 wm4Bsqs7ksBNF7fXmUV3a2bBq6RUUFIbB+s39oMVvjMa2Uu90436E5VCa6JNwOtecE
 BheYKTYIX0DhQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] video: fbdev: controlfb: Fix build for COMPILE_TEST=y &&
 PPC_PMAC=n
Date: Fri, 21 Aug 2020 20:49:10 +1000
Message-Id: <20200821104910.3363818-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGJ1aWxkIGlzIGN1cnJlbnRseSBicm9rZW4sIGlmIENPTVBJTEVfVEVTVD15IGFuZCBQUENf
UE1BQz1uOgoKICBsaW51eC9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvbnRyb2xmYi5jOiBJbiBmdW5j
dGlvbiDigJhjb250cm9sX3NldF9oYXJkd2FyZeKAmToKICBsaW51eC9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvbnRyb2xmYi5jOjI3NjoyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24g4oCYYnRleHRfdXBkYXRlX2Rpc3BsYXnigJkKICAgIDI3NiB8ICBidGV4dF91cGRhdGVf
ZGlzcGxheShwLT5mcmFtZV9idWZmZXJfcGh5cyArIENUUkxGQl9PRkYsCiAgICAgICAgfCAgXn5+
fn5+fn5+fn5+fn5+fn5+fn4KCkZpeCBpdCBieSBpbmNsdWRpbmcgYnRleHQuaCB3aGVuZXZlciBD
T05GSUdfQk9PVFhfVEVYVCBpcyBlbmFibGVkLgoKRml4ZXM6IGEwN2E2M2IwZTI0ZCAoInZpZGVv
OiBmYmRldjogY29udHJvbGZiOiBhZGQgQ09NUElMRV9URVNUIHN1cHBvcnQiKQpTaWduZWQtb2Zm
LWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Ci0tLQogZHJpdmVycy92
aWRlby9mYmRldi9jb250cm9sZmIuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKCkRvZXMgYW55b25lIG1pbmQgaWYgSSBhcHBseSB0aGlzIHZpYSB0aGUgcG93ZXJwYyB0
cmVlIGZvciB2NS45PwoKSXQgd291bGQgYmUgbmljZSB0byBnZXQgdGhlIGJ1aWxkIGNsZWFuLgoK
Y2hlZXJzCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb250cm9sZmIuYyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMKaW5kZXggOWM0ZjFiZTg1NmVjLi41NDdhYmVi
MzlmODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29udHJvbGZiLmMKKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9jb250cm9sZmIuYwpAQCAtNDksNiArNDksOCBAQAogI2luY2x1
ZGUgPGxpbnV4L2N1ZGEuaD4KICNpZmRlZiBDT05GSUdfUFBDX1BNQUMKICNpbmNsdWRlIDxhc20v
cHJvbS5oPgorI2VuZGlmCisjaWZkZWYgQ09ORklHX0JPT1RYX1RFWFQKICNpbmNsdWRlIDxhc20v
YnRleHQuaD4KICNlbmRpZgogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
