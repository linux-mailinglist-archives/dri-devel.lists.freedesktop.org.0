Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 457521812FF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 09:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249B16E931;
	Wed, 11 Mar 2020 08:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E0B89F82;
 Wed, 11 Mar 2020 01:41:25 +0000 (UTC)
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Mar 2020 18:41:24 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
 by ironmsg03-sd.qualcomm.com with ESMTP; 10 Mar 2020 18:41:23 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
 id DAD954559; Tue, 10 Mar 2020 18:41:23 -0700 (PDT)
From: Guru Das Srinagesh <gurus@codeaurora.org>
To: linux-pwm@vger.kernel.org
Subject: [PATCH v8 02/12] drm/i915: Use 64-bit division macro
Date: Tue, 10 Mar 2020 18:41:11 -0700
Message-Id: <2287dc418793b74c3fe97ed328980e9d62ee9b83.1583889178.git.gurus@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1583889178.git.gurus@codeaurora.org>
References: <cover.1583889178.git.gurus@codeaurora.org>
In-Reply-To: <cover.1583889178.git.gurus@codeaurora.org>
References: <cover.1583889178.git.gurus@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Mar 2020 08:32:41 +0000
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
 dri-devel@lists.freedesktop.org,
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
Z25lZC1vZmYtYnk6IEd1cnUgRGFzIFNyaW5hZ2VzaCA8Z3VydXNAY29kZWF1cm9yYS5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wYW5lbC5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wYW5lbC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wYW5lbC5jCmluZGV4IGJjMTRlOWMuLjg0M2NhYzEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3BhbmVsLmMKQEAgLTE4NjgsNyAr
MTg2OCw3IEBAIHN0YXRpYyBpbnQgcHdtX3NldHVwX2JhY2tsaWdodChzdHJ1Y3QgaW50ZWxfY29u
bmVjdG9yICpjb25uZWN0b3IsCiAKIAlwYW5lbC0+YmFja2xpZ2h0Lm1pbiA9IDA7IC8qIDAlICov
CiAJcGFuZWwtPmJhY2tsaWdodC5tYXggPSAxMDA7IC8qIDEwMCUgKi8KLQlwYW5lbC0+YmFja2xp
Z2h0LmxldmVsID0gRElWX1JPVU5EX1VQKAorCXBhbmVsLT5iYWNrbGlnaHQubGV2ZWwgPSBESVZf
Uk9VTkRfVVBfVUxMKAogCQkJCSBwd21fZ2V0X2R1dHlfY3ljbGUocGFuZWwtPmJhY2tsaWdodC5w
d20pICogMTAwLAogCQkJCSBDUkNfUE1JQ19QV01fUEVSSU9EX05TKTsKIAlwYW5lbC0+YmFja2xp
Z2h0LmVuYWJsZWQgPSBwYW5lbC0+YmFja2xpZ2h0LmxldmVsICE9IDA7Ci0tIApUaGUgUXVhbGNv
bW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgdGhlIENvZGUgQXVyb3Jh
IEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
