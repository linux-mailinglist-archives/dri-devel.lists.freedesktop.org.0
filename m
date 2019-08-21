Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD5F97399
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86276E930;
	Wed, 21 Aug 2019 07:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9E76E8F1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 03:55:46 +0000 (UTC)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x7L3tQp4016439;
 Wed, 21 Aug 2019 12:55:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7L3tQp4016439
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 3/4] video/logo: simplify cmd_logo
Date: Wed, 21 Aug 2019 12:55:15 +0900
Message-Id: <20190821035517.21671-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821035517.21671-1-yamada.masahiro@socionext.com>
References: <20190821035517.21671-1-yamada.masahiro@socionext.com>
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1566359729;
 bh=6fHkMxqT3+v0CE4zyYlxI6pTvIRPi8TKT8Z20L42FeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CGTM9Ip8o61zeqHGDHeQK9RgclVA0dIXBS0WTjDmQzDmdx6VqjNALxNsUNKVlLh/s
 wQHaHeqEOTciWRofraKElz+DdJTipiVlPP50NKlLPgWLJrV9ny/9Ja7dAh5XudxAIS
 JLi3xQG00ucSqQwts31QadViT0zDqYJoUWEohMiDxynNpGmKR8ybqAmOOwlpnnFvQC
 cNe0MQsqEvIXeRP6yD7BTt+VM0yh9xgK6hIwDAyMoW8BmLBaKBw82B//jbgKYBBBTw
 oqx7PkXwOM93RByfRyHrPGHjRcRq4aEkjc7IKp0K7zrqekUX9s7dPUUr1Nga8nMRc1
 9Hr24AH+ql5mQ==
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
LS0tCgogZHJpdmVycy92aWRlby9sb2dvL01ha2VmaWxlIHwgMTMgKysrKy0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2xvZ28vTWFrZWZpbGUgYi9kcml2ZXJzL3ZpZGVvL2xvZ28vTWFrZWZp
bGUKaW5kZXggMTZmNjBjMWUxNzY2Li43ZDY3MmQ0MGJmMDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlkZW8vbG9nby9NYWtlZmlsZQorKysgYi9kcml2ZXJzL3ZpZGVvL2xvZ28vTWFrZWZpbGUKQEAg
LTIyLDIwICsyMiwxNSBAQCBwbm10b2xvZ28gOj0gc2NyaXB0cy9wbm10b2xvZ28KIAogIyBDcmVh
dGUgY29tbWFuZHMgbGlrZSAicG5tdG9sb2dvIC10IG1vbm8gLW4gbG9nb19tYWNfbW9ubyAtbyAu
Li4iCiBxdWlldF9jbWRfbG9nbyA9IExPR08gICAgJEAKLQljbWRfbG9nbyA9ICQocG5tdG9sb2dv
KSBcCi0JCQktdCAkKHBhdHN1YnN0ICQqXyUsJSwkKG5vdGRpciAkKGJhc2VuYW1lICQ8KSkpIFwK
LQkJCS1uICQobm90ZGlyICQoYmFzZW5hbWUgJDwpKSAtbyAkQCAkPAorICAgICAgY21kX2xvZ28g
PSAkKHBubXRvbG9nbykgLXQgJChsYXN0d29yZCAkKHN1YnN0IF8sICwkKikpIC1uICQqIC1vICRA
ICQ8CiAKLSQob2JqKS8lX21vbm8uYzogJChzcmMpLyVfbW9uby5wYm0gJChwbm10b2xvZ28pIEZP
UkNFCiskKG9iaikvJS5jOiAkKHNyYykvJS5wYm0gJChwbm10b2xvZ28pIEZPUkNFCiAJJChjYWxs
IGlmX2NoYW5nZWQsbG9nbykKIAotJChvYmopLyVfdmdhMTYuYzogJChzcmMpLyVfdmdhMTYucHBt
ICQocG5tdG9sb2dvKSBGT1JDRQorJChvYmopLyUuYzogJChzcmMpLyUucHBtICQocG5tdG9sb2dv
KSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2VkLGxvZ28pCiAKLSQob2JqKS8lX2NsdXQyMjQuYzog
JChzcmMpLyVfY2x1dDIyNC5wcG0gJChwbm10b2xvZ28pIEZPUkNFCi0JJChjYWxsIGlmX2NoYW5n
ZWQsbG9nbykKLQotJChvYmopLyVfZ3JheTI1Ni5jOiAkKHNyYykvJV9ncmF5MjU2LnBnbSAkKHBu
bXRvbG9nbykgRk9SQ0UKKyQob2JqKS8lLmM6ICQoc3JjKS8lLnBnbSAkKHBubXRvbG9nbykgRk9S
Q0UKIAkkKGNhbGwgaWZfY2hhbmdlZCxsb2dvKQogCiAjIGdlbmVyYXRlZCBDIGZpbGVzCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
