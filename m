Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32577174629
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374086E2FF;
	Sat, 29 Feb 2020 10:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6A06F4AD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 18:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582913983;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=xsODhkpVGkDQnLLErU6wOpwUWKFJnPJTBh47MaWfiIU=;
 b=RcyNuDMDU0Y2P9M6J0vd/NNWCROAyHAE13ZqF1fPi7yUoe9SZtuuy8y+mAyP8Co7b8
 Usl3YVLnJU+mZ4XiejYko8OZrMDlIqoXNOdldQ+o2DTSXDcsYsmidJDNJMUvhjK+KLTb
 awOfjiUQLF2OHw1arh7oThrEuEAPmAftU6N+fFxA/b4zrjPEERAaY015QLIqlbE3vpgo
 ztIiDXHNLnBZM636Um/0dmdVXnLI3DLW709GqZGH3/YCrt3xaBwQnONehbAt4t3GyAvE
 y4xk0TyygK8Gp70togWfbiAhfjHYg2VFCvPwV7X0vshwT6WmYsmvxo88SEDmP2mKUebU
 qzfQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw1SIJc2Lr
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 28 Feb 2020 19:19:38 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC v2 5/8] pinctrl: ingenic: add hdmi-ddc pin control group
Date: Fri, 28 Feb 2020 19:19:30 +0100
Message-Id: <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-gpio@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGF1bCBCb2RkaWUgPHBhdWxAYm9kZGllLm9yZy51az4KClNpZ25lZC1vZmYtYnk6IFBh
dWwgQm9kZGllIDxwYXVsQGJvZGRpZS5vcmcudWs+ClNpZ25lZC1vZmYtYnk6IEguIE5pa29sYXVz
IFNjaGFsbGVyIDxobnNAZ29sZGVsaWNvLmNvbT4KLS0tCiBkcml2ZXJzL3BpbmN0cmwvcGluY3Ry
bC1pbmdlbmljLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1pbmdlbmljLmMgYi9kcml2ZXJz
L3BpbmN0cmwvcGluY3RybC1pbmdlbmljLmMKaW5kZXggOTZmMDRkMTIxZWJkLi4xNTk5YTAwM2Mz
MWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLWluZ2VuaWMuYworKysgYi9k
cml2ZXJzL3BpbmN0cmwvcGluY3RybC1pbmdlbmljLmMKQEAgLTQsNiArNCw3IEBACiAgKgogICog
Q29weXJpZ2h0IChjKSAyMDE3IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgog
ICogQ29weXJpZ2h0IChjKSAyMDE5IOWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIDx6aG91eWFuamll
QHdhbnllZXRlY2guY29tPgorICogQ29weXJpZ2h0IChjKSAyMDE3LCAyMDE5IFBhdWwgQm9kZGll
IDxwYXVsQGJvZGRpZS5vcmcudWs+CiAgKi8KIAogI2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+
CkBAIC05MDAsNiArOTAxLDcgQEAgc3RhdGljIGludCBqejQ3ODBfbW1jMF84Yml0X2FfcGluc1td
ID0geyAweDA0LCAweDA1LCAweDA2LCAweDA3LCAweDE4LCB9Owogc3RhdGljIGludCBqejQ3ODBf
aTJjM19waW5zW10gPSB7IDB4NmEsIDB4NmIsIH07CiBzdGF0aWMgaW50IGp6NDc4MF9pMmM0X2Vf
cGluc1tdID0geyAweDhjLCAweDhkLCB9Owogc3RhdGljIGludCBqejQ3ODBfaTJjNF9mX3BpbnNb
XSA9IHsgMHhiOSwgMHhiOCwgfTsKK3N0YXRpYyBpbnQgano0NzgwX2hkbWlfZGRjX3BpbnNbXSA9
IHsgMHhiOSwgMHhiOCwgfTsKIAogc3RhdGljIGludCBqejQ3ODBfdWFydDJfZGF0YV9mdW5jc1td
ID0geyAxLCAxLCB9Owogc3RhdGljIGludCBqejQ3ODBfdWFydDJfaHdmbG93X2Z1bmNzW10gPSB7
IDEsIDEsIH07CkBAIC05MDgsNiArOTEwLDcgQEAgc3RhdGljIGludCBqejQ3ODBfbW1jMF84Yml0
X2FfZnVuY3NbXSA9IHsgMSwgMSwgMSwgMSwgMSwgfTsKIHN0YXRpYyBpbnQgano0NzgwX2kyYzNf
ZnVuY3NbXSA9IHsgMSwgMSwgfTsKIHN0YXRpYyBpbnQgano0NzgwX2kyYzRfZV9mdW5jc1tdID0g
eyAxLCAxLCB9Owogc3RhdGljIGludCBqejQ3ODBfaTJjNF9mX2Z1bmNzW10gPSB7IDEsIDEsIH07
CitzdGF0aWMgaW50IGp6NDc4MF9oZG1pX2RkY19mdW5jc1tdID0geyAwLCAwLCB9OwogCiBzdGF0
aWMgY29uc3Qgc3RydWN0IGdyb3VwX2Rlc2Mgano0NzgwX2dyb3Vwc1tdID0gewogCUlOR0VOSUNf
UElOX0dST1VQKCJ1YXJ0MC1kYXRhIiwgano0NzcwX3VhcnQwX2RhdGEpLApAQCAtOTUwLDYgKzk1
Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZ3JvdXBfZGVzYyBqejQ3ODBfZ3JvdXBzW10gPSB7
CiAJSU5HRU5JQ19QSU5fR1JPVVAoImkyYzMtZGF0YSIsIGp6NDc4MF9pMmMzKSwKIAlJTkdFTklD
X1BJTl9HUk9VUCgiaTJjNC1kYXRhLWUiLCBqejQ3ODBfaTJjNF9lKSwKIAlJTkdFTklDX1BJTl9H
Uk9VUCgiaTJjNC1kYXRhLWYiLCBqejQ3ODBfaTJjNF9mKSwKKwlJTkdFTklDX1BJTl9HUk9VUCgi
aGRtaS1kZGMiLCBqejQ3ODBfaGRtaV9kZGMpLAogCUlOR0VOSUNfUElOX0dST1VQKCJjaW0tZGF0
YSIsIGp6NDc3MF9jaW1fOGJpdCksCiAJSU5HRU5JQ19QSU5fR1JPVVAoImxjZC0yNGJpdCIsIGp6
NDc3MF9sY2RfMjRiaXQpLAogCXsgImxjZC1uby1waW5zIiwgfSwKQEAgLTk4Miw2ICs5ODYsNyBA
QCBzdGF0aWMgY29uc3QgY2hhciAqano0NzgwX25lbWNfZ3JvdXBzW10gPSB7CiBzdGF0aWMgY29u
c3QgY2hhciAqano0NzgwX2kyYzNfZ3JvdXBzW10gPSB7ICJpMmMzLWRhdGEiLCB9Owogc3RhdGlj
IGNvbnN0IGNoYXIgKmp6NDc4MF9pMmM0X2dyb3Vwc1tdID0geyAiaTJjNC1kYXRhLWUiLCAiaTJj
NC1kYXRhLWYiLCB9Owogc3RhdGljIGNvbnN0IGNoYXIgKmp6NDc4MF9jaW1fZ3JvdXBzW10gPSB7
ICJjaW0tZGF0YSIsIH07CitzdGF0aWMgY29uc3QgY2hhciAqano0NzgwX2hkbWlfZGRjX2dyb3Vw
c1tdID0geyAiaGRtaS1kZGMiLCB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGZ1bmN0aW9uX2Rl
c2Mgano0NzgwX2Z1bmN0aW9uc1tdID0gewogCXsgInVhcnQwIiwgano0NzcwX3VhcnQwX2dyb3Vw
cywgQVJSQVlfU0laRShqejQ3NzBfdWFydDBfZ3JvdXBzKSwgfSwKQEAgLTEwMTQsNiArMTAxOSw4
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZnVuY3Rpb25fZGVzYyBqejQ3ODBfZnVuY3Rpb25zW10g
PSB7CiAJeyAicHdtNSIsIGp6NDc3MF9wd201X2dyb3VwcywgQVJSQVlfU0laRShqejQ3NzBfcHdt
NV9ncm91cHMpLCB9LAogCXsgInB3bTYiLCBqejQ3NzBfcHdtNl9ncm91cHMsIEFSUkFZX1NJWkUo
ano0NzcwX3B3bTZfZ3JvdXBzKSwgfSwKIAl7ICJwd203Iiwgano0NzcwX3B3bTdfZ3JvdXBzLCBB
UlJBWV9TSVpFKGp6NDc3MF9wd203X2dyb3VwcyksIH0sCisJeyAiaGRtaS1kZGMiLCBqejQ3ODBf
aGRtaV9kZGNfZ3JvdXBzLAorCQkgICAgICBBUlJBWV9TSVpFKGp6NDc4MF9oZG1pX2RkY19ncm91
cHMpLCB9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBpbmdlbmljX2NoaXBfaW5mbyBqejQ3
ODBfY2hpcF9pbmZvID0gewotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
