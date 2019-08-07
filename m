Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4872085136
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 18:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397696E741;
	Wed,  7 Aug 2019 16:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1499 seconds by postgrey-1.36 at gabe;
 Wed, 07 Aug 2019 16:38:49 UTC
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
 [192.185.152.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08996E741
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 16:38:49 +0000 (UTC)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 08D4878956
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 10:50:07 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id vOCUh7YuV4FKpvOCUhFg30; Wed, 07 Aug 2019 10:50:07 -0500
X-Authority-Reason: nr=8
Received: from 187-162-252-62.static.axtel.net ([187.162.252.62]:45282
 helo=embeddedor) by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hvOCT-000Og7-9Q; Wed, 07 Aug 2019 10:50:05 -0500
Date: Wed, 7 Aug 2019 10:50:02 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/nouveau/nvif/mmu: Use struct_size() helper
Message-ID: <20190807155002.GA25502@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.252.62
X-Source-L: No
X-Exim-ID: 1hvOCT-000Og7-9Q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-252-62.static.axtel.net (embeddedor)
 [187.162.252.62]:45282
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 13
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tGMQ51Rv13b6vHV2oX8Kb0ED7YORM826dwEjbUekOns=; b=LNwTSjV8My84CdgkaXczARzvrX
 UHAo3XaZryYeWhTPD7qQLqrPm/zUzk5NJ8hESaNYsGKe9v8Non74I1z9UW9YBBmVe9/swYSBzeUzt
 NtWiiAVMXZiwTR6aGfeFgQmp07LMpibLgqHIgTOwghKDLZzabbqhR9J+dtN+MnvDu86vDqPzh2u8i
 WB/5imINiv3daPFrCToZcg3TPtRj6FZUtVKB2tNDzIKLAiZrlO0oOlCOPkFIL2TsQ5fUczGeJGT0s
 CAdWltZNS7YRL026+eRGnVGFTewIQ2hw1fbctkZgAcm/kzt4CdAhYZqZvJ8BiatnLuKLXJQjKL2dS
 80bBHKvg==;
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25lIG9mIHRoZSBtb3JlIGNvbW1vbiBjYXNlcyBvZiBhbGxvY2F0aW9uIHNpemUgY2FsY3VsYXRp
b25zIGlzIGZpbmRpbmcKdGhlIHNpemUgb2YgYSBzdHJ1Y3R1cmUgdGhhdCBoYXMgYSB6ZXJvLXNp
emVkIGFycmF5IGF0IHRoZSBlbmQsIGFsb25nCndpdGggbWVtb3J5IGZvciBzb21lIG51bWJlciBv
ZiBlbGVtZW50cyBmb3IgdGhhdCBhcnJheS4gRm9yIGV4YW1wbGU6CgpzdHJ1Y3QgbnZpZl9tbXVf
a2luZF92MCB7CgkuLi4KICAgICAgICBfX3U4ICBkYXRhW107Cn07CgoKTWFrZSB1c2Ugb2YgdGhl
IHN0cnVjdF9zaXplKCkgaGVscGVyIGluc3RlYWQgb2YgYW4gb3Blbi1jb2RlZCB2ZXJzaW9uCmlu
IG9yZGVyIHRvIGF2b2lkIGFueSBwb3RlbnRpYWwgdHlwZSBtaXN0YWtlcy4KClNvLCByZXBsYWNl
IHRoZSBmb2xsb3dpbmcgZm9ybToKCnNpemVvZigqa2luZCkgKyBzaXplb2YoKmtpbmQtPmRhdGEp
ICogbW11LT5raW5kX25yCgp3aXRoOgoKc3RydWN0X3NpemUoa2luZCwgZGF0YSwgbW11LT5raW5k
X25yKQoKVGhpcyBjb2RlIHdhcyBkZXRlY3RlZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGUu
CgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3Iu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252aWYvbW11LmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmlmL21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZpZi9tbXUuYwppbmRleCBhZTA4YTFjYTgwNDQuLjU2NDFiZGEyMDQ2ZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZpZi9tbXUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmlmL21tdS5jCkBAIC0xMTAsNyArMTEwLDcgQEAgbnZpZl9tbXVfaW5pdChz
dHJ1Y3QgbnZpZl9vYmplY3QgKnBhcmVudCwgczMyIG9jbGFzcywgc3RydWN0IG52aWZfbW11ICpt
bXUpCiAKIAlpZiAobW11LT5raW5kX25yKSB7CiAJCXN0cnVjdCBudmlmX21tdV9raW5kX3YwICpr
aW5kOwotCQl1MzIgYXJnYyA9IHNpemVvZigqa2luZCkgKyBzaXplb2YoKmtpbmQtPmRhdGEpICog
bW11LT5raW5kX25yOworCQlzaXplX3QgYXJnYyA9IHN0cnVjdF9zaXplKGtpbmQsIGRhdGEsIG1t
dS0+a2luZF9ucik7CiAKIAkJaWYgKHJldCA9IC1FTk9NRU0sICEoa2luZCA9IGttYWxsb2MoYXJn
YywgR0ZQX0tFUk5FTCkpKQogCQkJZ290byBkb25lOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
