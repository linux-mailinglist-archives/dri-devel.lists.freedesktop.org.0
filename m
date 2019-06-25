Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4A65556D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 19:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7836E1B3;
	Tue, 25 Jun 2019 17:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DCB6E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 17:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6D9A8FB03;
 Tue, 25 Jun 2019 19:05:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQAMMWVAO5To; Tue, 25 Jun 2019 19:05:19 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 48F9B48E30; Tue, 25 Jun 2019 19:05:19 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH 0/4] drm/panel: jh057n0090: Add regulators and drop magic
 value in init
Date: Tue, 25 Jun 2019 19:05:15 +0200
Message-Id: <cover.1561482165.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBvbWlzc2lvbiBvZiByZWd1bGF0b3JzIGZvciB0aGUgcmVjZW50bHkgYWRkZWQgcGFu
ZWwgYW5kIG1ha2UKc3VyZSBhbGwgZHNpIGNvbW1hbmRzIHN0YXJ0IHdpdGggYSBjb21tYW5kIGlu
c3RlYWQgb2Ygb25lIGhhdmluZyBhIG1hZ2ljCmNvbnN0YW50ICh3aGljaCBhbHJlYWR5IGNhdXNl
ZCBjb25mdXNpb24pLgoKQWxzbyBhZGRzIGEgbWFpbCBhbGlhcyB0byB0aGUgcGFuZWwncyBNQUlO
VEFJTkVSIGVudHJ5IHRvIHJlZHVjZSB0aGUgYnVzCmZhY3Rvci4KClRvOiBUaGllcnJ5IFJlZGlu
ZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPixTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+LERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4sRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPixSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPixNYXJrIFJ1dGxhbmQg
PG1hcmsucnV0bGFuZEBhcm0uY29tPixNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ft
c3VuZ0BrZXJuZWwub3JnPiwiRGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4s
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4sTmljb2xhcyBG
ZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPiwiUGF1bCBFLiBNY0tlbm5leSIgPHBh
dWxtY2tAbGludXguaWJtLmNvbT4sZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyxkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZyxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLFB1cmlz
bSBLZXJuZWwgVGVhbSA8a2VybmVsQHB1cmkuc20+CgoKR3VpZG8gR8O8bnRoZXIgKDQpOgogIE1B
SU5UQUlORVJTOiBBZGQgUHVyaXNtIG1haWwgYWxpYXMgYXMgcmV2aWV3ZXIgZm9yIHRoZWlyIGRl
dmtpdCdzCiAgICBwYW5lbAogIGRybS9wYW5lbDogamgwNTduMDA5MDogRG9uJ3QgdXNlIG1hZ2lj
IGNvbnN0YW50CiAgZHQtYmluZGluZ3M6IGRpc3BsYXkvcGFuZWw6IGpoMDU3bjAwOTA6IERvY3Vt
ZW50IHBvd2VyIHN1cHBseQogICAgcHJvcGVydGllcwogIGRybS9wYW5lbDogamgwNTduMDA5MDog
QWRkIHJlZ3VsYXRvciBzdXBwb3J0CgogLi4uL2Rpc3BsYXkvcGFuZWwvcm9ja3RlY2gsamgwNTdu
MDA5MDAudHh0ICAgIHwgIDUgKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKIC4uLi9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTdu
MDA5MDAuYyAgICB8IDIyICsrKysrKysrKysrKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMjcg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
