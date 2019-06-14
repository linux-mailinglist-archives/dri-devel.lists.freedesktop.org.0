Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF402474E9
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D82891B7;
	Sun, 16 Jun 2019 14:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 534B089A9A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 17:54:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEF05346;
 Fri, 14 Jun 2019 10:54:57 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 EF5FE3F718; Fri, 14 Jun 2019 10:54:53 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/28] drivers: Add generic helper to match by of_node
Date: Fri, 14 Jun 2019 18:54:01 +0100
Message-Id: <1560534863-15115-7-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Thor Thayer <thor.thayer@linux.intel.com>,
 rafael@kernel.org, David Airlie <airlied@linux.ie>, linux-fpga@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Peter Rosin <peda@axentia.se>,
 Frank Rowand <frowand.list@gmail.com>, Alan Tull <atull@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Wolfram Sang <wsa@the-dreams.de>,
 Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org,
 suzuki.poulose@arm.com, Mark Brown <broonie@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 gregkh@linuxfoundation.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Joe Perches <joe@perches.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgaGVscGVyIHRvIG1hdGNoIGRldmljZSBieSB0aGUgb2Zfbm9kZS4gVGhpcyB3aWxsIGJl
IGxhdGVyIHVzZWQKdG8gcHJvdmlkZSB3cmFwcGVycyB0byB0aGUgZGV2aWNlIGl0ZXJhdG9ycyBm
b3Ige2J1cy9jbGFzcy9kcml2ZXJ9X2ZpbmRfZGV2aWNlKCkuCkNvbnZlcnQgb3RoZXIgdXNlcnMg
dG8gcmV1c2UgdGhpcyBuZXcgaGVscGVyLgoKQ2M6IEFsYW4gVHVsbCA8YXR1bGxAa2VybmVsLm9y
Zz4KQ2M6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6ICJE
YXZpZCBTLiBNaWxsZXIiIDxkYXZlbUBkYXZlbWxvZnQubmV0PgpDYzogZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IEZsb3Jp
YW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgpDYzogRnJhbmsgUm93YW5kIDxmcm93
YW5kLmxpc3RAZ21haWwuY29tPgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4KQ2M6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+
CkNjOiBKaXJpIFNsYWJ5IDxqc2xhYnlAc3VzZS5jb20+CkNjOiBKb25hdGhhbiBIdW50ZXIgPGpv
bmF0aGFuaEBudmlkaWEuY29tPgpDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
Q2M6IExpYW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+CkNjOiBsaW51eC1mcGdhQHZn
ZXIua2VybmVsLm9yZwpDYzogbGludXgtaTJjQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtc3Bp
QHZnZXIua2VybmVsLm9yZwpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KQ2M6
IE1hdGhpZXUgUG9pcmllciA8bWF0aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+CkNjOiBNYXhpbWUg
UmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogTW9yaXR6IEZpc2NoZXIgPG1k
ZkBrZXJuZWwub3JnPgpDYzogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KQ2M6IFJvYiBI
ZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+CkNjOiBTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmlu
aXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPgpDYzogVGhvciBUaGF5ZXIgPHRob3IudGhheWVyQGxpbnV4LmludGVs
LmNvbT4KQ2M6IFdvbGZyYW0gU2FuZyA8d3NhQHRoZS1kcmVhbXMuZGU+CkNjOiAiUmFmYWVsIEou
IFd5c29ja2kiIDxyYWZhZWxAa2VybmVsLm9yZz4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGlu
YXJvLm9yZz4KQ2M6IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+ClNpZ25lZC1vZmYtYnk6
IFN1enVraSBLIFBvdWxvc2UgPHN1enVraS5wb3Vsb3NlQGFybS5jb20+Ci0tLQogZHJpdmVycy9i
YXNlL2NvcmUuYyAgICAgICAgICAgfCA2ICsrKysrKwogZHJpdmVycy9mcGdhL29mLWZwZ2EtcmVn
aW9uLmMgfCA3ICstLS0tLS0KIGluY2x1ZGUvbGludXgvZGV2aWNlLmggICAgICAgIHwgMiArKwog
MyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9iYXNlL2NvcmUuYyBiL2RyaXZlcnMvYmFzZS9jb3JlLmMKaW5kZXggZmQ3
NTExZS4uOTIxMTkwOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9iYXNlL2NvcmUuYworKysgYi9kcml2
ZXJzL2Jhc2UvY29yZS5jCkBAIC0zMzI4LDMgKzMzMjgsOSBAQCB2b2lkIGRldmljZV9zZXRfb2Zf
bm9kZV9mcm9tX2RldihzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHN0cnVjdCBkZXZpY2UgKmRl
djIpCiAJZGV2LT5vZl9ub2RlX3JldXNlZCA9IHRydWU7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChk
ZXZpY2Vfc2V0X29mX25vZGVfZnJvbV9kZXYpOworCitpbnQgZGV2aWNlX21hdGNoX29mX25vZGUo
c3RydWN0IGRldmljZSAqZGV2LCBjb25zdCB2b2lkICpucCkKK3sKKwlyZXR1cm4gZGV2LT5vZl9u
b2RlID09IG5wOworfQorRVhQT1JUX1NZTUJPTF9HUEwoZGV2aWNlX21hdGNoX29mX25vZGUpOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9mcGdhL29mLWZwZ2EtcmVnaW9uLmMgYi9kcml2ZXJzL2ZwZ2Ev
b2YtZnBnYS1yZWdpb24uYwppbmRleCA3NWY2NGFiLi5lNDA1MzA5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2ZwZ2Evb2YtZnBnYS1yZWdpb24uYworKysgYi9kcml2ZXJzL2ZwZ2Evb2YtZnBnYS1yZWdp
b24uYwpAQCAtMjIsMTEgKzIyLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
ZnBnYV9yZWdpb25fb2ZfbWF0Y2hbXSA9IHsKIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBm
cGdhX3JlZ2lvbl9vZl9tYXRjaCk7CiAKLXN0YXRpYyBpbnQgZnBnYV9yZWdpb25fb2Zfbm9kZV9t
YXRjaChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHZvaWQgKmRhdGEpCi17Ci0JcmV0dXJuIGRl
di0+b2Zfbm9kZSA9PSBkYXRhOwotfQotCiAvKioKICAqIG9mX2ZwZ2FfcmVnaW9uX2ZpbmQgLSBm
aW5kIEZQR0EgcmVnaW9uCiAgKiBAbnA6IGRldmljZSBub2RlIG9mIEZQR0EgUmVnaW9uCkBAIC0z
Nyw3ICszMiw3IEBAIHN0YXRpYyBpbnQgZnBnYV9yZWdpb25fb2Zfbm9kZV9tYXRjaChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIGNvbnN0IHZvaWQgKmRhdGEpCiAgKi8KIHN0YXRpYyBzdHJ1Y3QgZnBnYV9y
ZWdpb24gKm9mX2ZwZ2FfcmVnaW9uX2ZpbmQoc3RydWN0IGRldmljZV9ub2RlICpucCkKIHsKLQly
ZXR1cm4gZnBnYV9yZWdpb25fY2xhc3NfZmluZChOVUxMLCBucCwgZnBnYV9yZWdpb25fb2Zfbm9k
ZV9tYXRjaCk7CisJcmV0dXJuIGZwZ2FfcmVnaW9uX2NsYXNzX2ZpbmQoTlVMTCwgbnAsIGRldmlj
ZV9tYXRjaF9vZl9ub2RlKTsKIH0KIAogLyoqCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Rl
dmljZS5oIGIvaW5jbHVkZS9saW51eC9kZXZpY2UuaAppbmRleCA0ZDdjODgxLi43MDkzMDg1IDEw
MDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2RldmljZS5oCisrKyBiL2luY2x1ZGUvbGludXgvZGV2
aWNlLmgKQEAgLTE2Myw2ICsxNjMsOCBAQCB2b2lkIHN1YnN5c19kZXZfaXRlcl9pbml0KHN0cnVj
dCBzdWJzeXNfZGV2X2l0ZXIgKml0ZXIsCiBzdHJ1Y3QgZGV2aWNlICpzdWJzeXNfZGV2X2l0ZXJf
bmV4dChzdHJ1Y3Qgc3Vic3lzX2Rldl9pdGVyICppdGVyKTsKIHZvaWQgc3Vic3lzX2Rldl9pdGVy
X2V4aXQoc3RydWN0IHN1YnN5c19kZXZfaXRlciAqaXRlcik7CiAKK2ludCBkZXZpY2VfbWF0Y2hf
b2Zfbm9kZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHZvaWQgKm5wKTsKKwogaW50IGJ1c19m
b3JfZWFjaF9kZXYoc3RydWN0IGJ1c190eXBlICpidXMsIHN0cnVjdCBkZXZpY2UgKnN0YXJ0LCB2
b2lkICpkYXRhLAogCQkgICAgIGludCAoKmZuKShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEpKTsKIHN0cnVjdCBkZXZpY2UgKmJ1c19maW5kX2RldmljZShzdHJ1Y3QgYnVzX3R5cGUgKmJ1
cywgc3RydWN0IGRldmljZSAqc3RhcnQsCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
