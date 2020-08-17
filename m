Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAC7246B3B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 17:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5915C89D84;
	Mon, 17 Aug 2020 15:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FBD89D84
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 15:51:08 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7400208B3;
 Mon, 17 Aug 2020 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597679468;
 bh=G1OvFEXrou1OJyh/zOo3R3BvFhcRVwtwoYVL1FhzfHs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DnX9422z/TZdcNBww480J/8EQgWZ+feQJVs+RTiFrYaLToarJusoeLPH3BzNsFCeX
 /ehlCdrXvxDBj8w7vQ6xT1xWcJVX32DOv8cJ6CpFHyGLM7cLL7h5foH/YbTz2h4pFp
 2+y+1EQoWHD5KTa+BwCwbI/yP85ZcTDUFEnL6M9k=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5.7 192/393] drm/stm: repair runtime power management
Date: Mon, 17 Aug 2020 17:14:02 +0200
Message-Id: <20200817143828.935241948@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817143819.579311991@linuxfoundation.org>
References: <20200817143819.579311991@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philippe Cornu <philippe.cornu@st.com>, stable@vger.kernel.org,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+CgpbIFVwc3RyZWFtIGNvbW1pdCBlYmQy
NjdiMmUzYzI1ZDVmOTNhMDg1MjhiNDdjMDM2NTY5ZWI4NzQ0IF0KCkFkZCBtaXNzaW5nIHBtX3J1
bnRpbWVfZ2V0X3N5bmMoKSBpbnRvIGx0ZGNfY3J0Y19hdG9taWNfZW5hYmxlKCkgdG8KbWF0Y2gg
cG1fcnVudGltZV9wdXRfc3luYygpIGluIGx0ZGNfY3J0Y19hdG9taWNfZGlzYWJsZSgpLCBvdGhl
cndpc2UKdGhlIExUREMgbWlnaHQgc3VzcGVuZCB2aWEgcnVudGltZSBQTSwgZGlzYWJsZSBjbG9j
aywgYW5kIHRoZW4gZmFpbAp0byByZXN1bWUgbGF0ZXIgb24uCgpUaGUgdGVzdCB3aGljaCB0cmln
Z2VycyBpdCBpcyByb3VnaGx5IC0tIHJ1biBxdDUgYXBwbGljYXRpb24gd2hpY2gKdXNlcyBlZ2xm
cyBwbGF0Zm9ybSBhbmQgZXRuYXZpdiwgc3RvcCB0aGUgYXBwbGljYXRpb24sIHNsZWVwIGZvciAx
NQptaW51dGVzLCBydW4gdGhlIGFwcGxpY2F0aW9uIGFnYWluLiBUaGlzIGxlYWRzIHRvIGEgdGlt
ZW91dCB3YWl0aW5nCmZvciB2c3luYywgYmVjYXVzZSB0aGUgTFREQyBoYXMgc3VzcGVuZGVkLCBi
dXQgZGlkIG5vdCByZXN1bWUuCgpGaXhlczogMzVhYjZjZmJmMjExICgiZHJtL3N0bTogc3VwcG9y
dCBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQiKQpTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8
bWFyZXhAZGVueC5kZT4KQ2M6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29t
PgpDYzogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4KQ2M6IEJlbmphbWlu
IEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgpDYzogVmluY2VudCBBYnJp
b3UgPHZpbmNlbnQuYWJyaW91QHN0LmNvbT4KQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGlu
LnN0bTMyQGdtYWlsLmNvbT4KQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVA
c3QuY29tPgpUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCkFja2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVA
c3QuY29tPgpUZXN0ZWQtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+
ClNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5j
b20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8y
MDIwMDIyOTIyMTY0OS45MDgxMy0xLW1hcmV4QGRlbnguZGUKU2lnbmVkLW9mZi1ieTogU2FzaGEg
TGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5j
IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCmlu
ZGV4IGRmNTg1ZmU2NGY2MTQuLjYwZmZlNWJiYzEyOTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9zdG0vbHRkYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCkBAIC00MjUs
OSArNDI1LDEyIEBAIHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywKIAkJCQkgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfc3RhdGUp
CiB7CiAJc3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gY3J0Y190b19sdGRjKGNydGMpOworCXN0
cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gY3J0Yy0+ZGV2OwogCiAJRFJNX0RFQlVHX0RSSVZFUigi
XG4iKTsKIAorCXBtX3J1bnRpbWVfZ2V0X3N5bmMoZGRldi0+ZGV2KTsKKwogCS8qIFNldHMgdGhl
IGJhY2tncm91bmQgY29sb3IgdmFsdWUgKi8KIAlyZWdfd3JpdGUobGRldi0+cmVncywgTFREQ19C
Q0NSLCBCQ0NSX0JDQkxBQ0spOwogCi0tIAoyLjI1LjEKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
