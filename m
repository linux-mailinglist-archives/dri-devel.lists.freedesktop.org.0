Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05F7EEEF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9EE6ECED;
	Fri,  2 Aug 2019 08:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D26B6ECE0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:40:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; d="scan'208";a="23151164"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2019 16:34:58 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 72C0840078B4;
 Fri,  2 Aug 2019 16:34:55 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH/RFC 05/12] drm: rcar-du: lvds: Add data swap support
Date: Fri,  2 Aug 2019 08:34:02 +0100
Message-Id: <1564731249-22671-6-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBpbiB2ZXJ0aWNhbCBzdHJpcGUgbW9kZSBvZiBvcGVyYXRpb24sIHRoZXJlIGlzIHRoZSBv
cHRpb24Kb2Ygc3dhcHBpbmcgZXZlbiBkYXRhIGFuZCBvZGQgZGF0YSBvbiB0aGUgdHdvIExWRFMg
aW50ZXJmYWNlcwp1c2VkIHRvIGRyaXZlIHRoZSB2aWRlbyBvdXRwdXQuCkFkZCBkYXRhIHN3YXAg
c3VwcG9ydCBieSBleHBvc2luZyBhIG5ldyBEVCBwcm9wZXJ0eSBuYW1lZAoicmVuZXNhcyxzd2Fw
LWRhdGEiLgoKU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9A
YnAucmVuZXNhcy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMg
fCAyMyArKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwppbmRl
eCAzYWVhZjllLi5jMzA2ZmFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2x2ZHMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwpAQCAt
NjksNiArNjksNyBAQCBzdHJ1Y3QgcmNhcl9sdmRzIHsKIAogCXN0cnVjdCBkcm1fYnJpZGdlICpj
b21wYW5pb247CiAJYm9vbCBkdWFsX2xpbms7CisJYm9vbCBzdHJpcGVfc3dhcF9kYXRhOwogfTsK
IAogI2RlZmluZSBicmlkZ2VfdG9fcmNhcl9sdmRzKGJyaWRnZSkgXApAQCAtNDM5LDEyICs0NDAs
MTYgQEAgc3RhdGljIHZvaWQgcmNhcl9sdmRzX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlKQogCXJjYXJfbHZkc193cml0ZShsdmRzLCBMVkRDSENSLCBsdmRoY3IpOwogCiAJaWYgKGx2
ZHMtPmluZm8tPnF1aXJrcyAmIFJDQVJfTFZEU19RVUlSS19EVUFMX0xJTkspIHsKLQkJLyoKLQkJ
ICogQ29uZmlndXJlIHZlcnRpY2FsIHN0cmlwZSBiYXNlZCBvbiB0aGUgbW9kZSBvZiBvcGVyYXRp
b24gb2YKLQkJICogdGhlIGNvbm5lY3RlZCBkZXZpY2UuCi0JCSAqLwotCQlyY2FyX2x2ZHNfd3Jp
dGUobHZkcywgTFZEU1RSSVBFLAotCQkJCWx2ZHMtPmR1YWxfbGluayA/IExWRFNUUklQRV9TVF9P
TiA6IDApOworCQl1MzIgbHZkc3RyaXBlID0gMDsKKworCQlpZiAobHZkcy0+ZHVhbF9saW5rKQor
CQkJLyoKKwkJCSAqIENvbmZpZ3VyZSB2ZXJ0aWNhbCBzdHJpcGUgYmFzZWQgb24gdGhlIG1vZGUg
b2YKKwkJCSAqIG9wZXJhdGlvbiBvZiB0aGUgY29ubmVjdGVkIGRldmljZS4KKwkJCSAqLworCQkJ
bHZkc3RyaXBlID0gTFZEU1RSSVBFX1NUX09OIHwgKGx2ZHMtPnN0cmlwZV9zd2FwX2RhdGEgPwor
CQkJCQkJICAgICAgIExWRFNUUklQRV9TVF9TV0FQIDogMCk7CisJCXJjYXJfbHZkc193cml0ZShs
dmRzLCBMVkRTVFJJUEUsIGx2ZHN0cmlwZSk7CiAJfQogCiAJLyoKQEAgLTc3MCw4ICs3NzUsMTIg
QEAgc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHQoc3RydWN0IHJjYXJfbHZkcyAqbHZkcykK
IAkJfQogCX0KIAotCWlmIChsdmRzLT5kdWFsX2xpbmspCisJaWYgKGx2ZHMtPmR1YWxfbGluaykg
eworCQlsdmRzLT5zdHJpcGVfc3dhcF9kYXRhID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKAorCQkJ
CQkJbHZkcy0+ZGV2LT5vZl9ub2RlLAorCQkJCQkJInJlbmVzYXMsc3dhcC1kYXRhIik7CiAJCXJl
dCA9IHJjYXJfbHZkc19wYXJzZV9kdF9jb21wYW5pb24obHZkcyk7CisJfQogCiBkb25lOgogCW9m
X25vZGVfcHV0KGxvY2FsX291dHB1dCk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
