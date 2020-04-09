Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5571A3032
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9CB6EB7A;
	Thu,  9 Apr 2020 07:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FED26EB4F;
 Thu,  9 Apr 2020 06:52:55 +0000 (UTC)
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Apr 2020 23:52:54 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
 by ironmsg01-sd.qualcomm.com with ESMTP; 08 Apr 2020 23:52:53 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
 id F24854BF6; Wed,  8 Apr 2020 23:52:53 -0700 (PDT)
From: Guru Das Srinagesh <gurus@codeaurora.org>
To: linux-pwm@vger.kernel.org
Subject: [PATCH v12 01/11] drm/i915: Use 64-bit division macro
Date: Wed,  8 Apr 2020 23:52:30 -0700
Message-Id: <13845382bcb686ec707f7d3ab2e05a2aabde4e33.1586414867.git.gurus@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1586414867.git.gurus@codeaurora.org>
References: <cover.1586414867.git.gurus@codeaurora.org>
In-Reply-To: <cover.1586414867.git.gurus@codeaurora.org>
References: <cover.1586414867.git.gurus@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
 David Collins <collinsd@codeaurora.org>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKClNp
Z25lZC1vZmYtYnk6IEd1cnUgRGFzIFNyaW5hZ2VzaCA8Z3VydXNAY29kZWF1cm9yYS5vcmc+ClJl
dmlld2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYwppbmRleCA3YjNlYzZlYi4uYjQ1ZWFiZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wYW5lbC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYwpAQCAtMTg3Nyw3ICsxODc3LDcg
QEAgc3RhdGljIGludCBwd21fc2V0dXBfYmFja2xpZ2h0KHN0cnVjdCBpbnRlbF9jb25uZWN0b3Ig
KmNvbm5lY3RvciwKIAogCXBhbmVsLT5iYWNrbGlnaHQubWluID0gMDsgLyogMCUgKi8KIAlwYW5l
bC0+YmFja2xpZ2h0Lm1heCA9IDEwMDsgLyogMTAwJSAqLwotCXBhbmVsLT5iYWNrbGlnaHQubGV2
ZWwgPSBESVZfUk9VTkRfVVAoCisJcGFuZWwtPmJhY2tsaWdodC5sZXZlbCA9IERJVl9ST1VORF9V
UF9VTEwoCiAJCQkJIHB3bV9nZXRfZHV0eV9jeWNsZShwYW5lbC0+YmFja2xpZ2h0LnB3bSkgKiAx
MDAsCiAJCQkJIENSQ19QTUlDX1BXTV9QRVJJT0RfTlMpOwogCXBhbmVsLT5iYWNrbGlnaHQuZW5h
YmxlZCA9IHBhbmVsLT5iYWNrbGlnaHQubGV2ZWwgIT0gMDsKLS0gClRoZSBRdWFsY29tbSBJbm5v
dmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiB0aGUgQ29kZSBBdXJvcmEgRm9ydW0s
CmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
