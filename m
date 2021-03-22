Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8180344A44
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC336E4FE;
	Mon, 22 Mar 2021 16:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201256E4FE;
 Mon, 22 Mar 2021 16:04:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D63E5619A4;
 Mon, 22 Mar 2021 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429066;
 bh=nkpO3F9iV2LP9C5b1X1yN1ZVysmYmotRTLuBUWIaptM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MU4IL9JNNK+J8U+vvpLpwovR+/suU+W9R4RhhhMaub4p/qt1HSm7/5H/LxJjfRA1v
 f+dccndcC0t+6DndIOBCJbVJvgtAFbUO/Xj+Ad4PAK3HRVGVN0VmdJVzwNG2nWP60W
 yoMi7GzhcMMul2Me0RQEOrAkh9+ikItIp0T7LrmMn4UxhxHfYhCqAAaad++VD478Ly
 WRurbxWp7EoqaQbB5aDSFB4iZyCpOkFivtOdus8BKdINgwMELaIsTcoM1dTXGsBCvO
 NUlZI47cRIaTlBnQpp36y5LIoHJRasVTH3KqfKgtuhF/A3Vph299qnut15q3EDnfE2
 ATElHLu2Uchbw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Anders Larsen <al@alarsen.net>
Subject: [PATCH 05/11] qnx: avoid -Wstringop-overread warning
Date: Mon, 22 Mar 2021 17:02:43 +0100
Message-Id: <20210322160253.4032422-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
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
Cc: linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, x86@kernel.org,
 linux-wireless@vger.kernel.org, James Smart <james.smart@broadcom.com>,
 ath11k@lists.infradead.org, Ning Sun <ning.sun@intel.com>,
 tboot-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 cgroups@vger.kernel.org, linux-scsi@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>, intel-gfx@lists.freedesktop.org,
 Kalle Valo <kvalo@codeaurora.org>, Serge Hallyn <serge@hallyn.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYy0xMSB3YXJucyB0aGF0IHRo
ZSBzaXplIG9mIHRoZSBsaW5rIG5hbWUgaXMgbG9uZ2VyIHRoYW4gdGhlIGRpX2ZuYW1lCmZpZWxk
OgoKZnMvcW54NC9kaXIuYzogSW4gZnVuY3Rpb24g4oCYcW54NF9yZWFkZGly4oCZOgpmcy9xbng0
L2Rpci5jOjUxOjMyOiBlcnJvcjog4oCYc3RybmxlbuKAmSBzcGVjaWZpZWQgYm91bmQgNDggZXhj
ZWVkcyBzb3VyY2Ugc2l6ZSAxNiBbLVdlcnJvcj1zdHJpbmdvcC1vdmVycmVhZF0KICAgNTEgfCAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplID0gc3RybmxlbihkZS0+ZGlfZm5hbWUsIHNpemUp
OwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGZzL3FueDQvcW54NC5oOjMsCiAgICAg
ICAgICAgICAgICAgZnJvbSBmcy9xbng0L2Rpci5jOjE2OgppbmNsdWRlL3VhcGkvbGludXgvcW54
NF9mcy5oOjQ1OjI1OiBub3RlOiBzb3VyY2Ugb2JqZWN0IGRlY2xhcmVkIGhlcmUKICAgNDUgfCAg
ICAgICAgIGNoYXIgICAgICAgICAgICBkaV9mbmFtZVtRTlg0X1NIT1JUX05BTUVfTUFYXTsKClRo
ZSBwcm9ibGVtIGhlcmUgaXMgdGhhdCB3ZSBhY2Nlc3MgdGhlIHNhbWUgcG9pbnRlciB1c2luZyB0
d28gZGlmZmVyZW50CnN0cnVjdHVyZSBsYXlvdXRzLCBidXQgZ2NjIGRldGVybWluZXMgdGhlIG9i
amVjdCBzaXplIGJhc2VkIG9uCndoYXRldmVyIGl0IGVuY291bnRlcnMgZmlyc3QuCgpDaGFuZ2Ug
dGhlIHN0cm5sZW4gdG8gdXNlIHRoZSBjb3JyZWN0IGZpZWxkIHNpemUgaW4gZWFjaCBjYXNlLCBh
bmQKY2hhbmdlIHRoZSBmaXJzdCBhY2Nlc3MgdG8gYmUgb24gdGhlIGxvbmdlciBmaWVsZC4KCkxp
bms6IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTk5NTc4ClNp
Z25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZnMvcW54NC9k
aXIuYyB8IDExICsrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3FueDQvZGlyLmMgYi9mcy9xbng0L2Rpci5j
CmluZGV4IGE2ZWUyM2FhZGQyOC4uNjgwNDY0NTBlNTQzIDEwMDY0NAotLS0gYS9mcy9xbng0L2Rp
ci5jCisrKyBiL2ZzL3FueDQvZGlyLmMKQEAgLTM5LDIxICszOSwyMCBAQCBzdGF0aWMgaW50IHFu
eDRfcmVhZGRpcihzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGRpcl9jb250ZXh0ICpjdHgpCiAJ
CWl4ID0gKGN0eC0+cG9zID4+IFFOWDRfRElSX0VOVFJZX1NJWkVfQklUUykgJSBRTlg0X0lOT0RF
U19QRVJfQkxPQ0s7CiAJCWZvciAoOyBpeCA8IFFOWDRfSU5PREVTX1BFUl9CTE9DSzsgaXgrKywg
Y3R4LT5wb3MgKz0gUU5YNF9ESVJfRU5UUllfU0laRSkgewogCQkJb2Zmc2V0ID0gaXggKiBRTlg0
X0RJUl9FTlRSWV9TSVpFOwotCQkJZGUgPSAoc3RydWN0IHFueDRfaW5vZGVfZW50cnkgKikgKGJo
LT5iX2RhdGEgKyBvZmZzZXQpOwotCQkJaWYgKCFkZS0+ZGlfZm5hbWVbMF0pCisJCQlsZSA9IChz
dHJ1Y3QgcW54NF9saW5rX2luZm8gKikoYmgtPmJfZGF0YSArIG9mZnNldCk7CisJCQlkZSA9IChz
dHJ1Y3QgcW54NF9pbm9kZV9lbnRyeSAqKShiaC0+Yl9kYXRhICsgb2Zmc2V0KTsKKwkJCWlmICgh
bGUtPmRsX2ZuYW1lWzBdKQogCQkJCWNvbnRpbnVlOwogCQkJaWYgKCEoZGUtPmRpX3N0YXR1cyAm
IChRTlg0X0ZJTEVfVVNFRHxRTlg0X0ZJTEVfTElOSykpKQogCQkJCWNvbnRpbnVlOwogCQkJaWYg
KCEoZGUtPmRpX3N0YXR1cyAmIFFOWDRfRklMRV9MSU5LKSkKLQkJCQlzaXplID0gUU5YNF9TSE9S
VF9OQU1FX01BWDsKKwkJCQlzaXplID0gc3RybmxlbihkZS0+ZGlfZm5hbWUsIHNpemVvZihkZS0+
ZGlfZm5hbWUpKTsKIAkJCWVsc2UKLQkJCQlzaXplID0gUU5YNF9OQU1FX01BWDsKLQkJCXNpemUg
PSBzdHJubGVuKGRlLT5kaV9mbmFtZSwgc2l6ZSk7CisJCQkJc2l6ZSA9IHN0cm5sZW4obGUtPmRs
X2ZuYW1lLCBzaXplb2YobGUtPmRsX2ZuYW1lKSk7CiAJCQlRTlg0REVCVUcoKEtFUk5fSU5GTyAi
cW54NF9yZWFkZGlyOiUuKnNcbiIsIHNpemUsIGRlLT5kaV9mbmFtZSkpOwogCQkJaWYgKCEoZGUt
PmRpX3N0YXR1cyAmIFFOWDRfRklMRV9MSU5LKSkKIAkJCQlpbm8gPSBibGtudW0gKiBRTlg0X0lO
T0RFU19QRVJfQkxPQ0sgKyBpeCAtIDE7CiAJCQllbHNlIHsKLQkJCQlsZSAgPSAoc3RydWN0IHFu
eDRfbGlua19pbmZvKilkZTsKIAkJCQlpbm8gPSAoIGxlMzJfdG9fY3B1KGxlLT5kbF9pbm9kZV9i
bGspIC0gMSApICoKIAkJCQkJUU5YNF9JTk9ERVNfUEVSX0JMT0NLICsKIAkJCQkJbGUtPmRsX2lu
b2RlX25keDsKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
