Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287A141CEC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FAD890C9;
	Wed, 12 Jun 2019 06:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464EA89179
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:09:50 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:35966 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1haeXF-0004lM-Co; Tue, 11 Jun 2019 12:01:49 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1haeXD-0001xs-Na; Tue, 11 Jun 2019 12:01:47 +0100
In-Reply-To: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: [PATCH 03/13] drm/i2c: tda998x: improve programming of audio divisor
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1haeXD-0001xs-Na@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Jun 2019 12:01:47 +0100
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WR91tiW/bVB/vxrCK7rW2nB+E5chQ3VcvRcBmB2vQ6E=; b=T/nZhsSlR2skO9FSViAsfBhFjp
 f1DAMF1567H5GqJmZwSymJRXFJeKgAe4iaUpIgUzNAE0EoBBwFf2R4bU9fsBcLzYdPfdsc12D4IiH
 epCmS08BY/vdsNjjvgUkme3R2SiQ+YUuvwUascvoSgfmj3wkuYgSw2+RIJHRaXuRtpavHxNh4bhVY
 JA1gSLTCRaOkswbLHzK9ElJuzI1kSMGL1W5x0KqiNB9d6MKvF9/oKVynWVtJL7NGb+LQS1zvout02
 1QMSDREFYOJkEyA4TK1vYR1SZHjAF5l2QXNuQNp/CnvH6wajlQXgynAJeWsWR3Iz7FLIDk5yTnpMM
 3zRkxQmA==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW1wcm92ZSB0aGUgc2VsZWN0aW9uIG9mIHRoZSBhdWRpbyBjbG9jayBkaXZpc29yIHNvIHRoYXQg
bW9yZSBtb2RlcwphbmQgc2FtcGxlIHJhdGVzIHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBSdXNzZWxs
IEtpbmcgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9p
MmMvdGRhOTk4eF9kcnYuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwppbmRleCBlMjExY2JlNDQ1ODAuLjc4YTJiODE1YThk
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYwpAQCAtODY1LDYgKzg2NSwzMiBAQCB0ZGE5
OTh4X3dyaXRlX2F2aShzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2LCBjb25zdCBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfbW9kZSAqbW9kZQogCiAvKiBBdWRpbyBzdXBwb3J0ICovCiAKKy8qCisgKiBUaGUg
YXVkaW8gY2xvY2sgZGl2aXNvciByZWdpc3RlciBjb250cm9scyBhIGRpdmlkZXIgcHJvZHVjaW5n
IEF1ZGlvX0Nsa19PdXQKKyAqIGZyb20gU0VSY2xrIGJ5IGRpdmlkaW5nIGl0IGJ5IDJebiB3aGVy
ZSAwIDw9IG4gPD0gNS4gIFdlIGRvbid0IGtub3cgd2hhdAorICogQXVkaW9fQ2xrX091dCBvciBT
RVJjbGsgYXJlLiBXZSBndWVzcyBTRVJjbGsgaXMgdGhlIHNhbWUgYXMgVE1EUyBjbG9jay4KKyAq
CisgKiBJdCBzZWVtcyB0aGF0IEF1ZGlvX0Nsa19PdXQgbXVzdCBiZSB0aGUgc21hbGxlc3QgdmFs
dWUgdGhhdCBpcyBncmVhdGVyCisgKiB0aGFuIDEyOCpmcywgb3RoZXJ3aXNlIGF1ZGlvIGRvZXMg
bm90IGZ1bmN0aW9uLiBUaGVyZSBpcyBzb21lIHN1Z2dlc3Rpb24KKyAqIHRoYXQgMTI2KmZzIGlz
IGEgYmV0dGVyIHZhbHVlLgorICovCitzdGF0aWMgdTggdGRhOTk4eF9nZXRfYWRpdihzdHJ1Y3Qg
dGRhOTk4eF9wcml2ICpwcml2LCB1bnNpZ25lZCBpbnQgZnMpCit7CisJdW5zaWduZWQgbG9uZyBt
aW5fYXVkaW9fY2xrID0gZnMgKiAxMjg7CisJdW5zaWduZWQgbG9uZyBzZXJfY2xrID0gcHJpdi0+
dG1kc19jbG9jayAqIDEwMDA7CisJdTggYWRpdjsKKworCWZvciAoYWRpdiA9IEFVRElPX0RJVl9T
RVJDTEtfMzI7IGFkaXYgIT0gQVVESU9fRElWX1NFUkNMS18xOyBhZGl2LS0pCisJCWlmIChzZXJf
Y2xrID4gbWluX2F1ZGlvX2NsayA8PCBhZGl2KQorCQkJYnJlYWs7CisKKwlkZXZfZGJnKCZwcml2
LT5oZG1pLT5kZXYsCisJCSJzZXJfY2xrPSVsdUh6IGZzPSV1SHogbWluX2FjbGs9JWx1SHogYWRp
dj0lZFxuIiwKKwkJc2VyX2NsaywgZnMsIG1pbl9hdWRpb19jbGssIGFkaXYpOworCisJcmV0dXJu
IGFkaXY7Cit9CisKIHN0YXRpYyB2b2lkIHRkYTk5OHhfYXVkaW9fbXV0ZShzdHJ1Y3QgdGRhOTk4
eF9wcml2ICpwcml2LCBib29sIG9uKQogewogCWlmIChvbikgewpAQCAtODgyLDYgKzkwOCw4IEBA
IHN0YXRpYyBpbnQgdGRhOTk4eF9jb25maWd1cmVfYXVkaW8oc3RydWN0IHRkYTk5OHhfcHJpdiAq
cHJpdiwKIAl1OCBidWZbNl0sIGNsa3NlbF9haXAsIGNsa3NlbF9mcywgY3RzX24sIGFkaXY7CiAJ
dTMyIG47CiAKKwlhZGl2ID0gdGRhOTk4eF9nZXRfYWRpdihwcml2LCBzZXR0aW5ncy0+cGFyYW1z
LnNhbXBsZV9yYXRlKTsKKwogCS8qIEVuYWJsZSBhdWRpbyBwb3J0cyAqLwogCXJlZ193cml0ZShw
cml2LCBSRUdfRU5BX0FQLCBzZXR0aW5ncy0+cGFyYW1zLmNvbmZpZyk7CiAKQEAgLTkyNiwyMiAr
OTU0LDYgQEAgc3RhdGljIGludCB0ZGE5OTh4X2NvbmZpZ3VyZV9hdWRpbyhzdHJ1Y3QgdGRhOTk4
eF9wcml2ICpwcml2LAogCXJlZ19jbGVhcihwcml2LCBSRUdfQUlQX0NOVFJMXzAsIEFJUF9DTlRS
TF8wX0xBWU9VVCB8CiAJCQkJCUFJUF9DTlRSTF8wX0FDUl9NQU4pOwkvKiBhdXRvIENUUyAqLwog
CXJlZ193cml0ZShwcml2LCBSRUdfQ1RTX04sIGN0c19uKTsKLQotCS8qCi0JICogQXVkaW8gaW5w
dXQgc29tZWhvdyBkZXBlbmRzIG9uIEhETUkgbGluZSByYXRlIHdoaWNoIGlzCi0JICogcmVsYXRl
ZCB0byBwaXhjbGsuIFRlc3Rpbmcgc2hvd2VkIHRoYXQgbW9kZXMgd2l0aCBwaXhjbGsKLQkgKiA+
MTAwTUh6IG5lZWQgYSBsYXJnZXIgZGl2aWRlciB3aGlsZSA8NDBNSHogbmVlZCB0aGUgZGVmYXVs
dC4KLQkgKiBUaGVyZSBpcyBubyBkZXRhaWxlZCBpbmZvIGluIHRoZSBkYXRhc2hlZXQsIHNvIHdl
IGp1c3QKLQkgKiBhc3N1bWUgMTAwTUh6IHJlcXVpcmVzIGxhcmdlciBkaXZpZGVyLgotCSAqLwot
CWFkaXYgPSBBVURJT19ESVZfU0VSQ0xLXzg7Ci0JaWYgKHByaXYtPnRtZHNfY2xvY2sgPiAxMDAw
MDApCi0JCWFkaXYrKzsJCQkvKiBBVURJT19ESVZfU0VSQ0xLXzE2ICovCi0KLQkvKiBTL1BESUYg
YXNrcyBmb3IgYSBsYXJnZXIgZGl2aWRlciAqLwotCWlmIChzZXR0aW5ncy0+cGFyYW1zLmZvcm1h
dCA9PSBBRk1UX1NQRElGKQotCQlhZGl2Kys7CQkJLyogQVVESU9fRElWX1NFUkNMS18xNiBvciBf
MzIgKi8KLQogCXJlZ193cml0ZShwcml2LCBSRUdfQVVESU9fRElWLCBhZGl2KTsKIAogCS8qCi0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
