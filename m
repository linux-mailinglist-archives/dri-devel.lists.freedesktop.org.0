Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F908E066
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 00:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E4E6E866;
	Wed, 14 Aug 2019 22:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4E66E866
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 22:13:21 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id m9so224205pls.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 15:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3iTgpB3GXZ+kQcPnDKxJUeeBPOFZQS1HDP+dtSl8iI=;
 b=J8Ef3cH6UBAs/pZ2FHYq3cuWdwzZKDQt9uTrsbZAKyjZXSzopr+fOi7vhVGspJTftN
 gHdng9e0RX6V1jAID5HbjHVGZW+KNX62R+sEYqgoKdLRGHD6t9QvCBPO48/KhdEHGBG+
 mjGa0KxXQT9BvOe9mtdZIttA3U3gcPuqI4sB+PA0ZxAKDwNOPxBBzP22V5Uh3MFRfCBS
 CU2NLeImLLsm9ibLB7sv5e92VM+3dbHvg6jw8O7W8rbfCrI3+LrkyHXG8FFHy1IP+XBl
 rn32x3DMz29FdKekZHQ/0E/W5YdkTAJJgeo8RPIwehOCR7B/zg9f/wimN1cAiDLXubGo
 +Mgw==
X-Gm-Message-State: APjAAAXG8OZJDnPH5XEQwz6g3aHylFyyak7pO6Wt0hwp12Vr8geRek22
 kdojtapP8LyD5xQyuixgcWZbh58v7uNPsg==
X-Google-Smtp-Source: APXvYqyti+vq96Q0pE8Yd5FkzLw83ZjuNfSd6SNA8pgDAWZgNSvONObYFjog77tG3BgdbQT4MUollQ==
X-Received: by 2002:a17:902:ac87:: with SMTP id
 h7mr1561600plr.36.1565820800768; 
 Wed, 14 Aug 2019 15:13:20 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id g1sm633892pgg.27.2019.08.14.15.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 15:13:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] arm: add arch_sync_dma_for_*()
Date: Wed, 14 Aug 2019 14:59:59 -0700
Message-Id: <20190814220011.26934-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814220011.26934-1-robdclark@gmail.com>
References: <20190814220011.26934-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o3iTgpB3GXZ+kQcPnDKxJUeeBPOFZQS1HDP+dtSl8iI=;
 b=HEFmOTX7vqz6H06xnoRwJnyjwS4ngqlcblSxxBe9uJf91C2C3l3H3afY81WwkxEetJ
 EbUuQcyViX1xj4UfRyAAAdKQkMJMp+A+qWSGvq1zWUQw8DQ77jCsLpCgcMhfLo6nNVda
 wPT3QzNUctnrmjktXM3EnsOkJ9WFmmfmF6P3JP5768lVtArSlAJdr5XkaQydkdBmUDdH
 uDi58nt19hPwUpCeJaQPKGXa/z2gZnqlXC+ryopFfLScSWgENEVIXSevTZyjazE3ppis
 zLF2GWdAmdB59Sq/EJsbTmRz5IiKtqn37DU/qrZVhnWBWkDLht8AheY3rvNIjk4LdN7S
 2yNQ==
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Wolfram Sang <wsa@the-dreams.de>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Rob Clark <robdclark@chromium.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 linux-arm-kernel@lists.infradead.org,
 Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Doug Anderson <armlinux@m.disordat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGFyY2gvYXJtL0tjb25maWcg
ICAgICAgICAgICAgICAgfCAgMiArKwogYXJjaC9hcm0vbW0vZG1hLW1hcHBpbmctbm9tbXUuYyB8
IDE0ICsrKysrKysrKysrKysrCiBhcmNoL2FybS9tbS9kbWEtbWFwcGluZy5jICAgICAgIHwgMjgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vS2NvbmZpZyBiL2FyY2gvYXJtL0tjb25maWcK
aW5kZXggMzNiMDA1NzliZWZmLi5hNDhhNzI2M2EyYzEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL0tj
b25maWcKKysrIGIvYXJjaC9hcm0vS2NvbmZpZwpAQCAtMTgsNiArMTgsOCBAQCBjb25maWcgQVJN
CiAJc2VsZWN0IEFSQ0hfSEFTX1NFVF9NRU1PUlkKIAlzZWxlY3QgQVJDSF9IQVNfU1RSSUNUX0tF
Uk5FTF9SV1ggaWYgTU1VICYmICFYSVBfS0VSTkVMCiAJc2VsZWN0IEFSQ0hfSEFTX1NUUklDVF9N
T0RVTEVfUldYIGlmIE1NVQorCXNlbGVjdCBBUkNIX0hBU19TWU5DX0RNQV9GT1JfREVWSUNFCisJ
c2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9DUFUKIAlzZWxlY3QgQVJDSF9IQVNfVEVBUkRP
V05fRE1BX09QUyBpZiBNTVUKIAlzZWxlY3QgQVJDSF9IQVNfVElDS19CUk9BRENBU1QgaWYgR0VO
RVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QKIAlzZWxlY3QgQVJDSF9IQVZFX0NVU1RPTV9HUElP
X0gKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21tL2RtYS1tYXBwaW5nLW5vbW11LmMgYi9hcmNoL2Fy
bS9tbS9kbWEtbWFwcGluZy1ub21tdS5jCmluZGV4IDUyYjgyNTU5ZDk5Yi4uNGEzZGY5NTIxNTFm
IDEwMDY0NAotLS0gYS9hcmNoL2FybS9tbS9kbWEtbWFwcGluZy1ub21tdS5jCisrKyBiL2FyY2gv
YXJtL21tL2RtYS1tYXBwaW5nLW5vbW11LmMKQEAgLTg0LDYgKzg0LDEzIEBAIHN0YXRpYyB2b2lk
IF9fZG1hX3BhZ2VfY3B1X3RvX2RldihwaHlzX2FkZHJfdCBwYWRkciwgc2l6ZV90IHNpemUsCiAJ
CW91dGVyX2NsZWFuX3JhbmdlKHBhZGRyLCBwYWRkciArIHNpemUpOwogfQogCit2b2lkIGFyY2hf
c3luY19kbWFfZm9yX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHBoeXNfYWRkcl90IHBhZGRy
LAorCQlzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQoreworCV9fZG1h
X3BhZ2VfY3B1X3RvX2RldihwYWRkciwgc2l6ZSwgZGlyKTsKK30KK0VYUE9SVF9TWU1CT0xfR1BM
KGFyY2hfc3luY19kbWFfZm9yX2RldmljZSk7CisKIHN0YXRpYyB2b2lkIF9fZG1hX3BhZ2VfZGV2
X3RvX2NwdShwaHlzX2FkZHJfdCBwYWRkciwgc2l6ZV90IHNpemUsCiAJCQkJICBlbnVtIGRtYV9k
YXRhX2RpcmVjdGlvbiBkaXIpCiB7CkBAIC05Myw2ICsxMDAsMTMgQEAgc3RhdGljIHZvaWQgX19k
bWFfcGFnZV9kZXZfdG9fY3B1KHBoeXNfYWRkcl90IHBhZGRyLCBzaXplX3Qgc2l6ZSwKIAl9CiB9
CiAKK3ZvaWQgYXJjaF9zeW5jX2RtYV9mb3JfY3B1KHN0cnVjdCBkZXZpY2UgKmRldiwgcGh5c19h
ZGRyX3QgcGFkZHIsCisJCXNpemVfdCBzaXplLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIp
Cit7CisJX19kbWFfcGFnZV9kZXZfdG9fY3B1KHBhZGRyLCBzaXplLCBkaXIpOworfQorRVhQT1JU
X1NZTUJPTF9HUEwoYXJjaF9zeW5jX2RtYV9mb3JfY3B1KTsKKwogc3RhdGljIGRtYV9hZGRyX3Qg
YXJtX25vbW11X2RtYV9tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwYWdlICpw
YWdlLAogCQkJCQkgdW5zaWduZWQgbG9uZyBvZmZzZXQsIHNpemVfdCBzaXplLAogCQkJCQkgZW51
bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyLApkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0vZG1hLW1h
cHBpbmcuYyBiL2FyY2gvYXJtL21tL2RtYS1tYXBwaW5nLmMKaW5kZXggNjc3NGIwM2FhNDA1Li44
ZWFkOTMxOTYxOTQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21tL2RtYS1tYXBwaW5nLmMKKysrIGIv
YXJjaC9hcm0vbW0vZG1hLW1hcHBpbmcuYwpAQCAtOTc5LDYgKzk3OSwxMyBAQCBzdGF0aWMgdm9p
ZCBfX2RtYV9wYWdlX2NwdV90b19kZXYoc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGxvbmcg
b2ZmLAogCS8qIEZJWE1FOiBub24tc3BlY3VsYXRpbmc6IGZsdXNoIG9uIGJpZGlyZWN0aW9uYWwg
bWFwcGluZ3M/ICovCiB9CiAKK3ZvaWQgYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKHN0cnVjdCBk
ZXZpY2UgKmRldiwgcGh5c19hZGRyX3QgcGFkZHIsCisJCXNpemVfdCBzaXplLCBlbnVtIGRtYV9k
YXRhX2RpcmVjdGlvbiBkaXIpCit7CisJX19kbWFfcGFnZV9jcHVfdG9fZGV2KHBoeXNfdG9fcGFn
ZShwYWRkciksIHBhZGRyICUgUEFHRV9TSVpFLCBzaXplLCBkaXIpOworfQorRVhQT1JUX1NZTUJP
TF9HUEwoYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKTsKKwogc3RhdGljIHZvaWQgX19kbWFfcGFn
ZV9kZXZfdG9fY3B1KHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBsb25nIG9mZiwKIAlzaXpl
X3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQogewpAQCAtMTAxMyw2ICsxMDIw
LDI3IEBAIHN0YXRpYyB2b2lkIF9fZG1hX3BhZ2VfZGV2X3RvX2NwdShzdHJ1Y3QgcGFnZSAqcGFn
ZSwgdW5zaWduZWQgbG9uZyBvZmYsCiAJfQogfQogCit2b2lkIGFyY2hfc3luY19kbWFfZm9yX2Nw
dShzdHJ1Y3QgZGV2aWNlICpkZXYsIHBoeXNfYWRkcl90IHBhZGRyLAorCQlzaXplX3Qgc2l6ZSwg
ZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQoreworCV9fZG1hX3BhZ2VfZGV2X3RvX2NwdShw
aHlzX3RvX3BhZ2UocGFkZHIpLCBwYWRkciAlIFBBR0VfU0laRSwgc2l6ZSwgZGlyKTsKK30KK0VY
UE9SVF9TWU1CT0xfR1BMKGFyY2hfc3luY19kbWFfZm9yX2NwdSk7CisKKy8qCisgKiBhcmNoX2Rt
YV97YWxsb2MsZnJlZX0gZmFpbC1zdHVicyBuZWVkZWQgdG8gYXZvaWQgbGluay1lcnJvcnMgaW4g
ZG1hL2RpcmVjdC5jCisgKiAod2hpY2ggaXMgbm90IGFjdHVhbGx5IHVzZWQgb24gYXJjaC9hcm0p
CisgKi8KK3ZvaWQgKmFyY2hfZG1hX2FsbG9jKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNp
emUsIGRtYV9hZGRyX3QgKmRtYV9oYW5kbGUsCisJCWdmcF90IGZsYWdzLCB1bnNpZ25lZCBsb25n
IGF0dHJzKQoreworCXJldHVybiBOVUxMOworfQordm9pZCBhcmNoX2RtYV9mcmVlKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsIHZvaWQgKnZhZGRyLAorCQlkbWFfYWRkcl90IGRtYV9o
YW5kbGUsIHVuc2lnbmVkIGxvbmcgYXR0cnMpCit7Cit9CisKIC8qKgogICogYXJtX2RtYV9tYXBf
c2cgLSBtYXAgYSBzZXQgb2YgU0cgYnVmZmVycyBmb3Igc3RyZWFtaW5nIG1vZGUgRE1BCiAgKiBA
ZGV2OiB2YWxpZCBzdHJ1Y3QgZGV2aWNlIHBvaW50ZXIsIG9yIE5VTEwgZm9yIElTQSBhbmQgRUlT
QS1saWtlIGRldmljZXMKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
