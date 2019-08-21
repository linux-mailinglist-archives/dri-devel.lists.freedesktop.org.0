Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E7497390
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3754B6E924;
	Wed, 21 Aug 2019 07:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887976E8F8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 04:13:13 +0000 (UTC)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x7L4CeQD002060;
 Wed, 21 Aug 2019 13:12:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L4CeQD002060
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 3/4] video/logo: simplify cmd_logo
Date: Wed, 21 Aug 2019 13:12:36 +0900
Message-Id: <20190821041237.23197-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821041237.23197-1-yamada.masahiro@socionext.com>
References: <20190821041237.23197-1-yamada.masahiro@socionext.com>
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1566360763;
 bh=Ffstt/8PGJwwxtxBre1W6DSDJ2YVkbwk2UqRJAoaJEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OR1LHhnA+Er5vOgGTRCZgC6jIKc4dC9Cg8YnqwHrVxpuDe1cNnaqI+14NwtxYfVRM
 sXbQVJgkzv+jrrZWYk5cwFWdJnrFLYbiKlbcRVlGB4OU2sASwY/0aC4spw1ahBK3aB
 e5zW3Y8TYY/PBBBGydwMY5kGdhT0Ow/lQ3l7p/+x80OGDAFNPMkssOAb2O35zeG7f8
 WacOTdhvNMquR4qzPDRi5Nu6/9ZR3MnMC7lp1gjAm5EWlTpFRdf+81xf9jVNMwFt/5
 GsFcVcsNDNWllRzXFsknLgQPhPatzS5EOUyKz3XDlw3QX1EAq7vPFn5/VLv48xHoM+
 xD48ux/rBy3kQ==
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2hvcnRlbiB0aGUgY29kZS4gSXQgc3RpbGwgd29ya3MgaW4gdGhlIHNhbWUgd2F5LgoKU2lnbmVk
LW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4K
LS0tCgpDaGFuZ2VzIGluIHYyOiBOb25lCgogZHJpdmVycy92aWRlby9sb2dvL01ha2VmaWxlIHwg
MTMgKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2xvZ28vTWFrZWZpbGUgYi9kcml2
ZXJzL3ZpZGVvL2xvZ28vTWFrZWZpbGUKaW5kZXggMTZmNjBjMWUxNzY2Li43ZDY3MmQ0MGJmMDEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vbG9nby9NYWtlZmlsZQorKysgYi9kcml2ZXJzL3Zp
ZGVvL2xvZ28vTWFrZWZpbGUKQEAgLTIyLDIwICsyMiwxNSBAQCBwbm10b2xvZ28gOj0gc2NyaXB0
cy9wbm10b2xvZ28KIAogIyBDcmVhdGUgY29tbWFuZHMgbGlrZSAicG5tdG9sb2dvIC10IG1vbm8g
LW4gbG9nb19tYWNfbW9ubyAtbyAuLi4iCiBxdWlldF9jbWRfbG9nbyA9IExPR08gICAgJEAKLQlj
bWRfbG9nbyA9ICQocG5tdG9sb2dvKSBcCi0JCQktdCAkKHBhdHN1YnN0ICQqXyUsJSwkKG5vdGRp
ciAkKGJhc2VuYW1lICQ8KSkpIFwKLQkJCS1uICQobm90ZGlyICQoYmFzZW5hbWUgJDwpKSAtbyAk
QCAkPAorICAgICAgY21kX2xvZ28gPSAkKHBubXRvbG9nbykgLXQgJChsYXN0d29yZCAkKHN1YnN0
IF8sICwkKikpIC1uICQqIC1vICRAICQ8CiAKLSQob2JqKS8lX21vbm8uYzogJChzcmMpLyVfbW9u
by5wYm0gJChwbm10b2xvZ28pIEZPUkNFCiskKG9iaikvJS5jOiAkKHNyYykvJS5wYm0gJChwbm10
b2xvZ28pIEZPUkNFCiAJJChjYWxsIGlmX2NoYW5nZWQsbG9nbykKIAotJChvYmopLyVfdmdhMTYu
YzogJChzcmMpLyVfdmdhMTYucHBtICQocG5tdG9sb2dvKSBGT1JDRQorJChvYmopLyUuYzogJChz
cmMpLyUucHBtICQocG5tdG9sb2dvKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLGxvZ28pCiAK
LSQob2JqKS8lX2NsdXQyMjQuYzogJChzcmMpLyVfY2x1dDIyNC5wcG0gJChwbm10b2xvZ28pIEZP
UkNFCi0JJChjYWxsIGlmX2NoYW5nZWQsbG9nbykKLQotJChvYmopLyVfZ3JheTI1Ni5jOiAkKHNy
YykvJV9ncmF5MjU2LnBnbSAkKHBubXRvbG9nbykgRk9SQ0UKKyQob2JqKS8lLmM6ICQoc3JjKS8l
LnBnbSAkKHBubXRvbG9nbykgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZCxsb2dvKQogCiAjIGdl
bmVyYXRlZCBDIGZpbGVzCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
