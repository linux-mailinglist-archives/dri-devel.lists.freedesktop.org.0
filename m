Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59F5B264
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 03:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E32289296;
	Sat, 27 Apr 2019 01:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD74D8929B
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 01:41:51 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05561216B7;
 Sat, 27 Apr 2019 01:41:50 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 36/53] drm/sun4i: tcon top: Fix NULL/invalid
 pointer dereference in sun8i_tcon_top_un/bind
Date: Fri, 26 Apr 2019 21:40:33 -0400
Message-Id: <20190427014051.7522-36-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427014051.7522-1-sashal@kernel.org>
References: <20190427014051.7522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556329311;
 bh=8AgzaH6M226APsNZiWmQf5E8EhUV1ApwFuYJyhlrJC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y4WRDWPBwAY+e5zl1AE3KlY1clcOuaPBhf3Aa4+nmQDECcWXG2lMUVdRDlR/RbXa1
 YUj21iCoAYJixgOzupoCw/RWDrrS6ZpssnvALe5ODbg7pcg6rqEkW4hcONYilQ9bP8
 cTIXKUyT8kIg7+cbhJ+C6zrIXCV+22h5iZYtV5s0=
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
Cc: Ondrej Jirman <megous@megous.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCAxYTA3YTk0YjQ3YjFmNTI4ZjM5YzNlNjE4N2I1ZWFmMDJlZmU0NGVhIF0KClRoZXJlIGFyZSB0
d28gcHJvYmxlbXMgaGVyZToKCjEuIE5vdCBhbGwgY2xrX2RhdGEtPmh3c1tdIG5lZWQgdG8gYmUg
aW5pdGlhbGl6ZWQsIGRlcGVuZGluZyBvbiB2YXJpb3VzCiAgIGNvbmZpZ3VyZWQgcXVpcmtzLiBU
aGlzIGxlYWRzIHRvIE5VTEwgcHRyIGRlcmVmIGluCiAgIGNsa19od191bnJlZ2lzdGVyX2dhdGUo
KSBpbiBzdW44aV90Y29uX3RvcF91bmJpbmQoKQoyLiBJZiB0aGVyZSBpcyBlcnJvciB3aGVuIHJl
Z2lzdGVyaW5nIHRoZSBjbGtfZGF0YS0+aHdzW10sCiAgIGVycl91bnJlZ2lzdGVyX2dhdGVzIGVy
cm9yIHBhdGggd2lsbCB0cnkgdG8gdW5yZWdpc3RlcgogICBJU19FUlIoKT10cnVlIChpbnZhbGlk
KSBwb2ludGVyLgoKRm9yIHByb2JsZW0gKDEpIEkgaGF2ZSB0aGlzIHN0YWNrIHRyYWNlOgoKVW5h
YmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwK
ICBhZGRyZXNzIDAwMDAwMDAwMDAwMDAwMDgKQ2FsbCB0cmFjZToKIGNsa19od191bnJlZ2lzdGVy
KzB4OC8weDE4CiBjbGtfaHdfdW5yZWdpc3Rlcl9nYXRlKzB4MTQvMHgyOAogc3VuOGlfdGNvbl90
b3BfdW5iaW5kKzB4MmMvMHg2MAogY29tcG9uZW50X3VuYmluZC5pc3JhLjQrMHgyYy8weDUwCiBj
b21wb25lbnRfYmluZF9hbGwrMHgxZDQvMHgyMzAKIHN1bjRpX2Rydl9iaW5kKzB4YzQvMHgxYTAK
IHRyeV90b19icmluZ191cF9tYXN0ZXIrMHgxNjQvMHgxYzAKIF9fY29tcG9uZW50X2FkZCsweGEw
LzB4MTY4CiBjb21wb25lbnRfYWRkKzB4MTAvMHgxOAogc3VuOGlfZHdfaGRtaV9wcm9iZSsweDE4
LzB4MjAKIHBsYXRmb3JtX2Rydl9wcm9iZSsweDNjLzB4NzAKIHJlYWxseV9wcm9iZSsweGNjLzB4
Mjc4CiBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4MzQvMHhhOAoKUHJvYmxlbSAoMikgd2FzIGlkZW50
aWZpZWQgYnkgaGVhZCBzY3JhdGNoaW5nLgoKU2lnbmVkLW9mZi1ieTogT25kcmVqIEppcm1hbiA8
bWVnb3VzQG1lZ291cy5jb20+ClNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5y
aXBhcmRAYm9vdGxpbi5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9wYXRjaC9tc2dpZC8yMDE5MDQwNTIzMzA0OC4zODIzLTEtbWVnb3VzQG1lZ291cy5jb20KU2ln
bmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW44aV90Y29uX3RvcC5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44
aV90Y29uX3RvcC5jCmluZGV4IGFkY2RmOTQ2YzM2NS4uZGZiY2QxYWQ4MWE1IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYwpAQCAtMjE3LDcgKzIxNyw3IEBAIHN0YXRpYyBp
bnQgc3VuOGlfdGNvbl90b3BfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Ug
Km1hc3RlciwKIAogZXJyX3VucmVnaXN0ZXJfZ2F0ZXM6CiAJZm9yIChpID0gMDsgaSA8IENMS19O
VU07IGkrKykKLQkJaWYgKGNsa19kYXRhLT5od3NbaV0pCisJCWlmICghSVNfRVJSX09SX05VTEwo
Y2xrX2RhdGEtPmh3c1tpXSkpCiAJCQljbGtfaHdfdW5yZWdpc3Rlcl9nYXRlKGNsa19kYXRhLT5o
d3NbaV0pOwogCWNsa19kaXNhYmxlX3VucHJlcGFyZSh0Y29uX3RvcC0+YnVzKTsKIGVycl9hc3Nl
cnRfcmVzZXQ6CkBAIC0yMzUsNyArMjM1LDggQEAgc3RhdGljIHZvaWQgc3VuOGlfdGNvbl90b3Bf
dW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCiAJb2Zf
Y2xrX2RlbF9wcm92aWRlcihkZXYtPm9mX25vZGUpOwogCWZvciAoaSA9IDA7IGkgPCBDTEtfTlVN
OyBpKyspCi0JCWNsa19od191bnJlZ2lzdGVyX2dhdGUoY2xrX2RhdGEtPmh3c1tpXSk7CisJCWlm
IChjbGtfZGF0YS0+aHdzW2ldKQorCQkJY2xrX2h3X3VucmVnaXN0ZXJfZ2F0ZShjbGtfZGF0YS0+
aHdzW2ldKTsKIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZSh0Y29uX3RvcC0+YnVzKTsKIAlyZXNl
dF9jb250cm9sX2Fzc2VydCh0Y29uX3RvcC0+cnN0KTsKLS0gCjIuMTkuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
