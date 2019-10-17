Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323D8DCE5F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795406EBB9;
	Fri, 18 Oct 2019 18:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC1B6E9FB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 07:28:48 +0000 (UTC)
Received: from tschai.fritz.box ([46.9.232.237])
 by smtp-cloud8.xs4all.net with ESMTPA
 id L0DCiNIhkPduvL0DGitUVv; Thu, 17 Oct 2019 09:28:46 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv9 1/2] drm: tda998x: use cec_notifier_conn_(un)register
Date: Thu, 17 Oct 2019 09:28:41 +0200
Message-Id: <20191017072842.16793-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017072842.16793-1-hverkuil-cisco@xs4all.nl>
References: <20191017072842.16793-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGFAX9zU26r6wlHNsYbLI+OSAqNLGbGKkUn9xVdyWxOVKD4TD5psA+QsWHW2HCyNizsE4ILeAgH+Y4I5r7hgR9GYDZk7ZrgQoAgTHN+rxRqAilBBB2cJ
 EUHnL9WnsYDfBQgTsVuPB5CWz5wgByOXOl/Zv9wDADavWaMMTh5YuHxHOBGVmyAlIKBHulPs5v1uUjC9lDXau7B7vsO0r/kzOu9+yHPQl6bSa8JCLKEpfVAw
 zNxbxzWCUAS7Db/0cQKbboZqTvkn4EgffAC/oHxtZPwHZ00H2baENo1/ZWCxS3fbrSl1ciS1hL0i/PDN7j08Hk2zzYhKDDfx8NSc3DIo2Oa1Ol6SLUji7rJv
 ek3zhsJ9kMjfX2VzJJZortT1g2qbXVPD1cR51HrWd7YoZBIEvu8=
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
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
Cc: Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxkYXJla21AZ29vZ2xlLmNvbT4KClVzZSB0aGUg
bmV3IGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3RlcigpIGZ1bmN0aW9ucyB0bwoodW4pcmVn
aXN0ZXIgdGhlIG5vdGlmaWVyIGZvciB0aGUgSERNSSBjb25uZWN0b3IuCgpTaWduZWQtb2ZmLWJ5
OiBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogPGRhcmVrbUBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5
OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTJjL3RkYTk5OHhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMK
aW5kZXggODRjNmQ0YzkxYzY1Li5kZGU4ZGVjYjUyYTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pMmMvdGRhOTk4eF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhf
ZHJ2LmMKQEAgLTgwNSw4ICs4MDUsOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgdGRhOTk4eF9pcnFf
dGhyZWFkKGludCBpcnEsIHZvaWQgKmRhdGEpCiAJCQkJdGRhOTk4eF9lZGlkX2RlbGF5X3N0YXJ0
KHByaXYpOwogCQkJfSBlbHNlIHsKIAkJCQlzY2hlZHVsZV93b3JrKCZwcml2LT5kZXRlY3Rfd29y
ayk7Ci0JCQkJY2VjX25vdGlmaWVyX3NldF9waHlzX2FkZHIocHJpdi0+Y2VjX25vdGlmeSwKLQkJ
CQkJCSAgIENFQ19QSFlTX0FERFJfSU5WQUxJRCk7CisJCQkJY2VjX25vdGlmaWVyX3BoeXNfYWRk
cl9pbnZhbGlkYXRlKAorCQkJCQkJcHJpdi0+Y2VjX25vdGlmeSk7CiAJCQl9CiAKIAkJCWhhbmRs
ZWQgPSB0cnVlOwpAQCAtMTc5MCw4ICsxNzkwLDcgQEAgc3RhdGljIHZvaWQgdGRhOTk4eF9kZXN0
cm95KHN0cnVjdCBkZXZpY2UgKmRldikKIAogCWkyY191bnJlZ2lzdGVyX2RldmljZShwcml2LT5j
ZWMpOwogCi0JaWYgKHByaXYtPmNlY19ub3RpZnkpCi0JCWNlY19ub3RpZmllcl9wdXQocHJpdi0+
Y2VjX25vdGlmeSk7CisJY2VjX25vdGlmaWVyX2Nvbm5fdW5yZWdpc3Rlcihwcml2LT5jZWNfbm90
aWZ5KTsKIH0KIAogc3RhdGljIGludCB0ZGE5OTh4X2NyZWF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CkBAIC0xOTE2LDcgKzE5MTUsNyBAQCBzdGF0aWMgaW50IHRkYTk5OHhfY3JlYXRlKHN0cnVjdCBk
ZXZpY2UgKmRldikKIAkJY2VjX3dyaXRlKHByaXYsIFJFR19DRUNfUlhTSFBESU5URU5BLCBDRUNf
UlhTSFBETEVWX0hQRCk7CiAJfQogCi0JcHJpdi0+Y2VjX25vdGlmeSA9IGNlY19ub3RpZmllcl9n
ZXQoZGV2KTsKKwlwcml2LT5jZWNfbm90aWZ5ID0gY2VjX25vdGlmaWVyX2Nvbm5fcmVnaXN0ZXIo
ZGV2LCBOVUxMLCBOVUxMKTsKIAlpZiAoIXByaXYtPmNlY19ub3RpZnkpIHsKIAkJcmV0ID0gLUVO
T01FTTsKIAkJZ290byBmYWlsOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
