Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B5E982E7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 20:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5ADD6E998;
	Wed, 21 Aug 2019 18:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EC46E998
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 18:32:37 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2587A33D;
 Wed, 21 Aug 2019 20:32:35 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/omap: Fix port lookup for SDI output
Date: Wed, 21 Aug 2019 21:32:26 +0300
Message-Id: <20190821183226.13784-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818140838.GC30291@darkstar.musicnaut.iki.fi>
References: <20190818140838.GC30291@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566412355;
 bh=1CpOgUYHrJRfBozPVXl/7EZvS4mtEeLjGf1qdU0cC0g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QDEq92k4A82nDHTLPZlT89HjhWsOtvMy31oTH0mAEqn/bK+/f9JWEuz6A52y5vueD
 46g77Vy2uFH9R58yojBAlrr7H3AikuRTAGYCBeDW7FQ8EOBoqbBsbS2epVBe+JkykG
 y2Fy0imuPZunPKgmhu5bTx83EqfnBnNQrClJyEJs=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiByZWZhY3RvcmluZyBwb3J0IGxvb2t1cCBmb3IgRFNTIG91dHB1dHMsIGNvbW1pdCBkMTdl
YjQ1MzdhN2UKKCJkcm0vb21hcDogRmFjdG9yIG91dCBjb21tb24gaW5pdC9jbGVhbnVwIGNvZGUg
Zm9yIG91dHB1dCBkZXZpY2VzIikKaW5jb3JyZWN0bHkgaGFyZGNvZGVkIHVzYWdlIG9mIERUIHBv
cnQgMC4gVGhpcyBicmVha3Mgb3BlcmF0aW9uIGZvciBTREkKKHdoaWNoIHVzZXMgdGhlIERUIHBv
cnQgMSkgYW5kIERQSSBvdXRwdXRzIG90aGVyIHRoYW4gRFBJMCAod2hpY2ggYXJlCm5vdCB1c2Vk
IGluIG1haW5saW5lIERUIHNvdXJjZXMpLgoKRml4IHRoaXMgYnkgdXNpbmcgdGhlIHBvcnQgbnVt
YmVyIGZyb20gdGhlIG91dHB1dCBvbWFwX2Rzc19kZXZpY2UKb2ZfcG9ydHMgZmllbGQuCgpGaXhl
czogZDE3ZWI0NTM3YTdlICgiZHJtL29tYXA6IEZhY3RvciBvdXQgY29tbW9uIGluaXQvY2xlYW51
cCBjb2RlIGZvciBvdXRwdXQgZGV2aWNlcyIpClNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9kc3Mvb3V0cHV0LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3Mvb3V0cHV0LmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb3V0cHV0LmMK
aW5kZXggZGUwZjg4MmYwZjdiLi4xNGI0MWRlNDRlYmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL2Rzcy9vdXRwdXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9k
c3Mvb3V0cHV0LmMKQEAgLTQsNiArNCw3IEBACiAgKiBBdXRob3I6IEFyY2hpdCBUYW5lamEgPGFy
Y2hpdEB0aS5jb20+CiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5oPgogI2luY2x1ZGUg
PGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxp
bnV4L3BsYXRmb3JtX2RldmljZS5oPgpAQCAtMjAsNyArMjEsOCBAQCBpbnQgb21hcGRzc19kZXZp
Y2VfaW5pdF9vdXRwdXQoc3RydWN0IG9tYXBfZHNzX2RldmljZSAqb3V0KQogewogCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqcmVtb3RlX25vZGU7CiAKLQlyZW1vdGVfbm9kZSA9IG9mX2dyYXBoX2dldF9y
ZW1vdGVfbm9kZShvdXQtPmRldi0+b2Zfbm9kZSwgMCwgMCk7CisJcmVtb3RlX25vZGUgPSBvZl9n
cmFwaF9nZXRfcmVtb3RlX25vZGUob3V0LT5kZXYtPm9mX25vZGUsCisJCQkJCSAgICAgICBmZnMo
b3V0LT5vZl9wb3J0cykgLSAxLCAwKTsKIAlpZiAoIXJlbW90ZV9ub2RlKSB7CiAJCWRldl9kYmco
b3V0LT5kZXYsICJmYWlsZWQgdG8gZmluZCB2aWRlbyBzaW5rXG4iKTsKIAkJcmV0dXJuIDA7Ci0t
IApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
