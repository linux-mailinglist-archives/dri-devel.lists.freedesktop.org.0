Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1EE1893BF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 02:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DB66E859;
	Wed, 18 Mar 2020 01:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AA26E821;
 Tue, 17 Mar 2020 20:05:36 +0000 (UTC)
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Mar 2020 13:05:35 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
 by ironmsg02-sd.qualcomm.com with ESMTP; 17 Mar 2020 13:05:34 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
 id AA68F4BA7; Tue, 17 Mar 2020 13:05:34 -0700 (PDT)
From: Guru Das Srinagesh <gurus@codeaurora.org>
To: linux-pwm@vger.kernel.org
Subject: [PATCH v9 01/11] drm/i915: Use 64-bit division macro
Date: Tue, 17 Mar 2020 13:05:16 -0700
Message-Id: <19661821c8eb32291e72ec091c267f915c365c52.1584473399.git.gurus@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1584473399.git.gurus@codeaurora.org>
References: <cover.1584473399.git.gurus@codeaurora.org>
In-Reply-To: <cover.1584473399.git.gurus@codeaurora.org>
References: <cover.1584473399.git.gurus@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Mar 2020 01:38:24 +0000
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgdGhlIFBXTSBmcmFtZXdvcmsgaXMgc3dpdGNoaW5nIHN0cnVjdCBwd21fc3RhdGUuZHV0
eV9jeWNsZSdzCmRhdGF0eXBlIHRvIHU2NCwgcHJlcGFyZSBmb3IgdGhpcyB0cmFuc2l0aW9uIGJ5
IHVzaW5nIERJVl9ST1VORF9VUF9VTEwKdG8gaGFuZGxlIGEgNjQtYml0IGRpdmlkZW5kLgoKQ2M6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBKb29uYXMgTGFo
dGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+CkNjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNj
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6ICJWaWxsZSBTeXJq
w6Rsw6QiIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IGludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBH
dXJ1IERhcyBTcmluYWdlc2ggPGd1cnVzQGNvZGVhdXJvcmEub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfcGFuZWwuYwppbmRleCBiYzE0ZTljLi44NDNjYWMxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3BhbmVsLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wYW5lbC5jCkBAIC0xODY4LDcgKzE4NjgsNyBAQCBzdGF0
aWMgaW50IHB3bV9zZXR1cF9iYWNrbGlnaHQoc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVj
dG9yLAogCiAJcGFuZWwtPmJhY2tsaWdodC5taW4gPSAwOyAvKiAwJSAqLwogCXBhbmVsLT5iYWNr
bGlnaHQubWF4ID0gMTAwOyAvKiAxMDAlICovCi0JcGFuZWwtPmJhY2tsaWdodC5sZXZlbCA9IERJ
Vl9ST1VORF9VUCgKKwlwYW5lbC0+YmFja2xpZ2h0LmxldmVsID0gRElWX1JPVU5EX1VQX1VMTCgK
IAkJCQkgcHdtX2dldF9kdXR5X2N5Y2xlKHBhbmVsLT5iYWNrbGlnaHQucHdtKSAqIDEwMCwKIAkJ
CQkgQ1JDX1BNSUNfUFdNX1BFUklPRF9OUyk7CiAJcGFuZWwtPmJhY2tsaWdodC5lbmFibGVkID0g
cGFuZWwtPmJhY2tsaWdodC5sZXZlbCAhPSAwOwotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24g
Q2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51
eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
