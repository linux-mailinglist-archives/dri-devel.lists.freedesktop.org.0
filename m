Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FA64AAA7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484EA6E21F;
	Tue, 18 Jun 2019 19:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1D16E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:05:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80B6320863;
 Tue, 18 Jun 2019 19:05:49 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [RFT 02/10] clk: samsung: Add bus clock for GPU/G3D on Exynos4412
Date: Tue, 18 Jun 2019 21:05:26 +0200
Message-Id: <20190618190534.4951-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884754;
 bh=jXXvRsijbHdSjSp46+Gnvv9t0hiH6dZfxuMdrgfPP4s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kdKwCHQUekeguYgskUHWlqZI387UPs/rDnQ++hEuIb/RZ0SAIcp1KCiVR1w1pA3Df
 gExJXnw7TirweJC2pIbed4utGYBVQRdlTWk8cNaqnvu7mDOpPqpWaJ7FG8te0lY5Fk
 oAbz/68kBa/rXtsrkw+qx4RwNxAbnbF8PikOriDc=
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIElEIGFuZCBnYXRlIGZvciBidXMgY2xvY2sgZm9yIEdQVSAoTWFsaSA0MDApIG9uIEV4eW5v
czQ0MTIuCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5v
cmc+Ci0tLQogZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstZXh5bm9zNC5jICAgfCAxICsKIGluY2x1
ZGUvZHQtYmluZGluZ3MvY2xvY2svZXh5bm9zNC5oIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NhbXN1bmcvY2xrLWV4eW5v
czQuYyBiL2RyaXZlcnMvY2xrL3NhbXN1bmcvY2xrLWV4eW5vczQuYwppbmRleCBkMmE2OGE3OTJh
MjEuLmVkNGFmN2RhOWM0ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstZXh5
bm9zNC5jCisrKyBiL2RyaXZlcnMvY2xrL3NhbXN1bmcvY2xrLWV4eW5vczQuYwpAQCAtOTYxLDYg
Kzk2MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2Ftc3VuZ19nYXRlX2Nsb2NrIGV4eW5vczQy
MTBfZ2F0ZV9jbGtzW10gX19pbml0Y29uc3QgPSB7CiAKIC8qIGxpc3Qgb2YgZ2F0ZSBjbG9ja3Mg
c3VwcG9ydGVkIGluIGV4eW5vczR4MTIgc29jICovCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNhbXN1
bmdfZ2F0ZV9jbG9jayBleHlub3M0eDEyX2dhdGVfY2xrc1tdIF9faW5pdGNvbnN0ID0geworCUdB
VEUoQ0xLX0FTWU5DX0czRCwgImFzeW5jX2czZCIsICJhY2xrMjAwIiwgR0FURV9JUF9MRUZUQlVT
LCA2LCAwLCAwKSwKIAlHQVRFKENMS19BVURTUywgImF1ZHNzIiwgInNjbGtfZXBsbCIsIEU0WDEy
X0dBVEVfSVBfTUFVRElPLCAwLCAwLCAwKSwKIAlHQVRFKENMS19NRE5JRTAsICJtZG5pZTAiLCAi
YWNsazE2MCIsIEdBVEVfSVBfTENEMCwgMiwgMCwgMCksCiAJR0FURShDTEtfUk9UQVRPUiwgInJv
dGF0b3IiLCAiYWNsazIwMCIsIEU0WDEyX0dBVEVfSVBfSU1BR0UsIDEsIDAsIDApLApkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9leHlub3M0LmggYi9pbmNsdWRlL2R0LWJp
bmRpbmdzL2Nsb2NrL2V4eW5vczQuaAppbmRleCBhMDQzOWNlOGU4ZDMuLjg4ZWMzOTY4YjkwYSAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9leHlub3M0LmgKKysrIGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9jbG9jay9leHlub3M0LmgKQEAgLTE4Nyw2ICsxODcsNyBAQAogI2Rl
ZmluZSBDTEtfTUlQSV9IU0kJCTM0OSAvKiBFeHlub3M0MjEwIG9ubHkgKi8KICNkZWZpbmUgQ0xL
X1BJWEVMQVNZTkNNMAkzNTEKICNkZWZpbmUgQ0xLX1BJWEVMQVNZTkNNMQkzNTIKKyNkZWZpbmUg
Q0xLX0FTWU5DX0czRAkJMzUzIC8qIEV4eW5vczR4MTIgb25seSAqLwogI2RlZmluZSBDTEtfUFdN
X0lTUF9TQ0xLCTM3OSAvKiBFeHlub3M0eDEyIG9ubHkgKi8KICNkZWZpbmUgQ0xLX1NQSTBfSVNQ
X1NDTEsJMzgwIC8qIEV4eW5vczR4MTIgb25seSAqLwogI2RlZmluZSBDTEtfU1BJMV9JU1BfU0NM
SwkzODEgLyogRXh5bm9zNHgxMiBvbmx5ICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
