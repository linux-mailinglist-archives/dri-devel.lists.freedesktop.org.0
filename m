Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953F325A88
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 01:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3876E069;
	Fri, 26 Feb 2021 00:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789936E069
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 00:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=24dyXhbUb6BL7Gvc/cK7SPB9p+BywOZYcYYdftrrIeU=; b=fRv0oPAPX5XbjEKm5/EQWt1L+A
 U5Lr/DpfM3BaNtbQPUMjeNsLZFBoggvQzn4Ry00EMtcjAY7ouP0dqwIGapb70DNkhOtjMOpeSCM0X
 q3xoXoDecVJcjJiHimtshgtcPMTE6gns2PHaKI+4YSvO8jEOGEi2lcfbIpL9aTQ2xE2PY62SUcI0f
 Yh8VPvCejcEAiMmTw42bYisAMa6r+PNKO3Wa/PJBGH8oiB1RPbeXvXP3IWs5sWIBh1pGxCVaIEHgQ
 yZv+oyydwkCfo4rPtb1q5W8U4Hv0GvFmAS7Ol0xvE4j2KrQP5hTaa3EaNvol9DzOikGWhcOZkxYQQ
 c/oXIatA==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=merlin.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFQdc-0006Ha-H8; Fri, 26 Feb 2021 00:05:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] fbdev: atyfb: use LCD management functions for PPC_PMAC
 also
Date: Thu, 25 Feb 2021 16:05:37 -0800
Message-Id: <20210226000537.8674-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jbHVkZSBQUENfUE1BQyBpbiB0aGUgY29uZmlncyB0aGF0IHVzZSBhdHlfbGRfbGNkKCkgYW5k
CmF0eV9zdF9sY2QoKSBpbXBsZW1lbnRhdGlvbnMgc28gdGhhdCB0aGUgUE0gY29kZSBtYXkgd29y
awpjb3JyZWN0bHkgZm9yIFBQQ19QTUFDLgoKU3VnZ2VzdGVkLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5s
YXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+CkNjOiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNv
bT4KQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2ll
QHNhbXN1bmcuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4KLS0tCkRhbmllbC0gV2UgYWxzbyBuZWVkIHRoaXMgcGF0Y2g6Cmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIxMDIyNDIxNTUyOC44MjItMS1yZHVu
bGFwQGluZnJhZGVhZC5vcmcvCnRvIGZpeCBhIGtlcm5lbCB0ZXN0IHJvYm90IGJ1aWxkIGVycm9y
LgoKIGRyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0eWZiX2Jhc2UuYyB8ICAgIDggKysrLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgotLS0gbGlu
dXgtbmV4dC0yMDIxMDIxOS5vcmlnL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0eWZiX2Jhc2Uu
YworKysgbGludXgtbmV4dC0yMDIxMDIxOS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9i
YXNlLmMKQEAgLTEzMiw4ICsxMzIsNyBAQAogI2RlZmluZSBQUklOVEtJKGZtdCwgYXJncy4uLikJ
cHJpbnRrKEtFUk5fSU5GTyAiYXR5ZmI6ICIgZm10LCAjIyBhcmdzKQogI2RlZmluZSBQUklOVEtF
KGZtdCwgYXJncy4uLikJcHJpbnRrKEtFUk5fRVJSICJhdHlmYjogIiBmbXQsICMjIGFyZ3MpCiAK
LSNpZiBkZWZpbmVkKENPTkZJR19QTUFDX0JBQ0tMSUdIVCkgfHwgZGVmaW5lZChDT05GSUdfRkJf
QVRZX0dFTkVSSUNfTENEKSB8fCBcCi1kZWZpbmVkKENPTkZJR19GQl9BVFlfQkFDS0xJR0hUKQor
I2lmIGRlZmluZWQoQ09ORklHX1BQQ19QTUFDKQogc3RhdGljIGNvbnN0IHUzMiBsdF9sY2RfcmVn
c1tdID0gewogCUNORkdfUEFORUxfTEcsCiAJTENEX0dFTl9DTlRMX0xHLApAQCAtMTc1LDggKzE3
NCw3IEBAIHUzMiBhdHlfbGRfbGNkKGludCBpbmRleCwgY29uc3Qgc3RydWN0IGEKIAkJcmV0dXJu
IGF0eV9sZF9sZTMyKExDRF9EQVRBLCBwYXIpOwogCX0KIH0KLSNlbHNlIC8qIGRlZmluZWQoQ09O
RklHX1BNQUNfQkFDS0xJR0hUKSB8fCBkZWZpbmVkKENPTkZJR19GQl9BVFlfQkFDS0xJR0hUKSBc
Ci0JIGRlZmluZWQoQ09ORklHX0ZCX0FUWV9HRU5FUklDX0xDRCkgKi8KKyNlbHNlIC8qIGRlZmlu
ZWQoQ09ORklHX1BQQ19QTUFDKSAqLwogdm9pZCBhdHlfc3RfbGNkKGludCBpbmRleCwgdTMyIHZh
bCwgY29uc3Qgc3RydWN0IGF0eWZiX3BhciAqcGFyKQogeyB9CiAKQEAgLTE4NCw3ICsxODIsNyBA
QCB1MzIgYXR5X2xkX2xjZChpbnQgaW5kZXgsIGNvbnN0IHN0cnVjdCBhCiB7CiAJcmV0dXJuIDA7
CiB9Ci0jZW5kaWYgLyogZGVmaW5lZChDT05GSUdfUE1BQ19CQUNLTElHSFQpIHx8IGRlZmluZWQg
KENPTkZJR19GQl9BVFlfR0VORVJJQ19MQ0QpICovCisjZW5kaWYgLyogZGVmaW5lZChDT05GSUdf
UFBDX1BNQUMpICovCiAKICNpZmRlZiBDT05GSUdfRkJfQVRZX0dFTkVSSUNfTENECiAvKgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
