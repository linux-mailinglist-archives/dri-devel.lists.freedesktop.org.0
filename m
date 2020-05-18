Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA69F1D7B09
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100D089C55;
	Mon, 18 May 2020 14:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E451F89C21
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:22:37 +0000 (UTC)
Date: Mon, 18 May 2020 14:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1589811754;
 bh=3E2hv7XkQV9OwtTqNeduXHbnXB8vfeIJ/7T9iSRmOYQ=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=RxxHvkShbSN8hYbI2poZsf589KacJGyPPDKOodpPHknuHr3juaCx3rPV060aMpP9P
 k2Lc/E7v7sjAOeI908rRLg46XBZZcI4tkEs0GGRETv727FFrrOdiMil8T+CmSOXlJn
 rZZ4lBhVC0ABB2zoqYS14k3jxF8k9bI9s9QDnLqA=
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/2] drm: DPMS is no longer the only mutable connector prop
Message-ID: <vrfq3PQ_YaPv75xE6-4QeyyLkevKNLpQo8JgnX6EnEcYaFRXxSg98QECUOmHe_eMirwPB0qNRXHE_jzEkXDb3J3YS2OuZXAZgJFnNMLm6W4=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIGEgYnVuY2ggb2Ygb3RoZXIgd3JpdGFibGUgY29ubmVjdG9yIHByb3BlcnRpZXMg
bm93LgoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPgpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqYWxh
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IFBla2thIFBhYWxhbmVuIDxwZWtr
YS5wYWFsYW5lbkBjb2xsYWJvcmEuY28udWs+CkNjOiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCAzICstLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2Nvbm5lY3Rvci5jCmluZGV4IGIxMDk5ZTEyNTFhMi4uZjJiMjBmZDY2MzE5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fY29ubmVjdG9yLmMKQEAgLTk0OCw4ICs5NDgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9wcm9wX2VudW1fbGlzdCBkcF9jb2xvcnNwYWNlc1tdID0gewogICogCWNvbm5lY3RvciBpcyBs
aW5rZWQgdG8uIERyaXZlcnMgc2hvdWxkIG5ldmVyIHNldCB0aGlzIHByb3BlcnR5IGRpcmVjdGx5
LAogICogCWl0IGlzIGhhbmRsZWQgYnkgdGhlIERSTSBjb3JlIGJ5IGNhbGxpbmcgdGhlICZkcm1f
Y29ubmVjdG9yX2Z1bmNzLmRwbXMKICAqIAljYWxsYmFjay4gRm9yIGF0b21pYyBkcml2ZXJzIHRo
ZSByZW1hcHBpbmcgdG8gdGhlICJBQ1RJVkUiIHByb3BlcnR5IGlzCi0gKiAJaW1wbGVtZW50ZWQg
aW4gdGhlIERSTSBjb3JlLiAgVGhpcyBpcyB0aGUgb25seSBzdGFuZGFyZCBjb25uZWN0b3IKLSAq
IAlwcm9wZXJ0eSB0aGF0IHVzZXJzcGFjZSBjYW4gY2hhbmdlLgorICogCWltcGxlbWVudGVkIGlu
IHRoZSBEUk0gY29yZS4KICAqCiAgKiAJTm90ZSB0aGF0IHRoaXMgcHJvcGVydHkgY2Fubm90IGJl
IHNldCB0aHJvdWdoIHRoZSBNT0RFX0FUT01JQyBpb2N0bCwKICAqIAl1c2Vyc3BhY2UgbXVzdCB1
c2UgIkFDVElWRSIgb24gdGhlIENSVEMgaW5zdGVhZC4KLS0gCjIuMjYuMgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
