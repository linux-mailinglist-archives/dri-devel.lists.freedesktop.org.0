Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09233642B8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 15:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61BB6E30D;
	Mon, 19 Apr 2021 13:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15936E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 13:12:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D5C461246;
 Mon, 19 Apr 2021 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618837925;
 bh=uGEXhgoiB83cl9XIBBwWbh5Xu/ZBnSdjsQ3ORwcGSgc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h5gpfl3tqTtL00EaSTuAUP2ux1ZQL7xkQ9MsOkRKwxBob8/fzFL7HxxlBKgopMMkW
 hrPW2h21YccvNugU2meAJBT44iZoNem3OmWtyTRSEeYbfu/ckNxyG9btxIGnPh4Gkr
 pVjt/yVhHRIX60/9uNE6QgLDGTF1cRgbKTKvyoms=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.11 068/122] drm/vmwgfx: Make sure we unpin no longer needed
 buffers
Date: Mon, 19 Apr 2021 15:05:48 +0200
Message-Id: <20210419130532.496009143@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419130530.166331793@linuxfoundation.org>
References: <20210419130530.166331793@linuxfoundation.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Roland Scheidegger <sroland@vmware.com>, stable@vger.kernel.org,
 Martin Krastev <krastevm@vmware.com>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4KCmNvbW1pdCBhYjRkOTkxMzYzMmIx
ZTVmZmNmMzM2NTc4M2U5ODcxOGIzYzgzYzdmIHVwc3RyZWFtLgoKV2Ugd2VyZSBub3QgY29ycmVj
dGx5IHVucGlubmluZyBubyBsb25nZXIgbmVlZGVkIGJ1ZmZlcnMuIEluIHBhcnRpY3VsYXIKdm13
X2J1ZmZlcl9vYmplY3QsIHdoaWNoIGlzIGludGVybmFsbHkgb2Z0ZW4gcGlubmVkIG9uIGNyZWF0
aW9uIHdhc24ndAp1bnBpbm5lZCBvbiBkZXN0cnVjdGlvbiBhbmQgbm9uZSBvZiB0aGUgaW50ZXJu
YWwgTU9CIGJ1ZmZlcnMgd2VyZQp1bnBpbm5lZCBiZWZvcmUgYmVpbmcgcHV0IGJhY2suIFRlY2hu
aWNhbGx5IHRoaXMgZXhpc3RlZCBmb3IgYQpsb25nIHRpbWUgYnV0IGNvbW1pdCA1N2ZjZDU1MGVi
MTUgKCJkcm0vdHRtOiBXYXJuIG9uIHBpbm5pbmcgd2l0aG91dApob2xkaW5nIGEgcmVmZXJlbmNl
IikgaW50cm9kdWNlZCBhIFdBUk5fT04gd2hpY2ggd2FzIGZpbGxpbmcgdXAgdGhlCmtlcm5lbCBs
b2dzIHJhdGhlciBxdWlja2x5LgoKUXVpdGUgZnJhbmtseSBpbnRlcm5hbCB1c2FnZSBvZiB2bXdf
YnVmZmVyX29iamVjdCBhbmQgaW4gZ2VuZXJhbApwaW5uaW5nIG5lZWRzIHRvIGJlIHJlZmFjdG9y
ZWQgaW4gdm13Z2Z4IGJ1dCBmb3Igbm93IHRoaXMgbWFrZXMKaXQgd29yay4KClNpZ25lZC1vZmYt
Ynk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gS3Jh
c3RldiA8a3Jhc3Rldm1Adm13YXJlLmNvbT4KUmV2aWV3ZWQtYnk6IFJvbGFuZCBTY2hlaWRlZ2dl
ciA8c3JvbGFuZEB2bXdhcmUuY29tPgpGaXhlczogNTdmY2Q1NTBlYjE1ICgiZHJtL3R0bTogV2Fy
biBvbiBwaW5uaW5nIHdpdGhvdXQgaG9sZGluZyBhIHJlZmVyZW5jZSIpCkxpbms6IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC80MTQ5ODQvP3Nlcmllcz04NjA1MiZyZXY9
MQpDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgpDYzogQ2hyaXN0aWFuIEtvZW5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oIHwgICAgMiArKwogZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfbW9iLmMgfCAgICA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspCgotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaApAQCAtMTU1NCw2ICsxNTU0LDgg
QEAgc3RhdGljIGlubGluZSB2b2lkIHZtd19ib191bnJlZmVyZW5jZShzdAogCiAJKmJ1ZiA9IE5V
TEw7CiAJaWYgKHRtcF9idWYgIT0gTlVMTCkgeworCQlpZiAodG1wX2J1Zi0+YmFzZS5waW5fY291
bnQgPiAwKQorCQkJdHRtX2JvX3VucGluKCZ0bXBfYnVmLT5iYXNlKTsKIAkJdHRtX2JvX3B1dCgm
dG1wX2J1Zi0+YmFzZSk7CiAJfQogfQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9tb2IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9tb2IuYwpAQCAtMjc3
LDYgKzI3Nyw3IEBAIG91dF9ub19zZXR1cDoKIAkJCQkJCSAmYmF0Y2gtPm90YWJsZXNbaV0pOwog
CX0KIAorCXR0bV9ib191bnBpbihiYXRjaC0+b3RhYmxlX2JvKTsKIAl0dG1fYm9fcHV0KGJhdGNo
LT5vdGFibGVfYm8pOwogCWJhdGNoLT5vdGFibGVfYm8gPSBOVUxMOwogCXJldHVybiByZXQ7CkBA
IC0zNDIsNiArMzQzLDcgQEAgc3RhdGljIHZvaWQgdm13X290YWJsZV9iYXRjaF90YWtlZG93bihz
dAogCXZtd19ib19mZW5jZV9zaW5nbGUoYm8sIE5VTEwpOwogCXR0bV9ib191bnJlc2VydmUoYm8p
OwogCisJdHRtX2JvX3VucGluKGJhdGNoLT5vdGFibGVfYm8pOwogCXR0bV9ib19wdXQoYmF0Y2gt
Pm90YWJsZV9ibyk7CiAJYmF0Y2gtPm90YWJsZV9ibyA9IE5VTEw7CiB9CkBAIC01MjgsNiArNTMw
LDcgQEAgc3RhdGljIHZvaWQgdm13X21vYl9wdF9zZXR1cChzdHJ1Y3Qgdm13Xwogdm9pZCB2bXdf
bW9iX2Rlc3Ryb3koc3RydWN0IHZtd19tb2IgKm1vYikKIHsKIAlpZiAobW9iLT5wdF9ibykgewor
CQl0dG1fYm9fdW5waW4obW9iLT5wdF9ibyk7CiAJCXR0bV9ib19wdXQobW9iLT5wdF9ibyk7CiAJ
CW1vYi0+cHRfYm8gPSBOVUxMOwogCX0KQEAgLTY0Myw2ICs2NDYsNyBAQCBpbnQgdm13X21vYl9i
aW5kKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2CiBvdXRfbm9fY21kX3NwYWNlOgogCXZtd19maWZv
X3Jlc291cmNlX2RlYyhkZXZfcHJpdik7CiAJaWYgKHB0X3NldF91cCkgeworCQl0dG1fYm9fdW5w
aW4obW9iLT5wdF9ibyk7CiAJCXR0bV9ib19wdXQobW9iLT5wdF9ibyk7CiAJCW1vYi0+cHRfYm8g
PSBOVUxMOwogCX0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
