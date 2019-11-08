Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F8F5295
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 18:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6886FA32;
	Fri,  8 Nov 2019 17:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7A76FA32
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 17:32:15 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iT87F-0007oJ-Uh; Fri, 08 Nov 2019 17:32:09 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 10EAA2741460; Fri,  8 Nov 2019 17:32:08 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: thc63lvd1024: Fix regulator_get_optional() misuse
Date: Fri,  8 Nov 2019 17:32:08 +0000
Message-Id: <20191108173208.51677-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ug+z///iKC7pDH1D8YK19B14EWxH0/NrfuQ1THLJhuA=; b=j+A4pncisltcBkNli/kYXdmCS
 tslIBNQ+ghnEJloFUKb+JMybCH+LLw0otmopQCWWeTgsIOAPvdCCRfhMHqLiBeuw2HxIkp1Abn4/i
 jAiR7wgGP1UFhfGC0YsA2FhPcE8TRprEWSFcy23u1SIZK7p8TATveW80GsESAgBNImPdY=;
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
Cc: Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHRoYzYzbHZkMTAyNCBkcml2ZXIgcmVxdWVzdHMgYSBzdXBwbHkgdXNpbmcgcmVndWxhdG9y
X2dldF9vcHRpb25hbCgpCmJ1dCBib3RoIHRoZSBuYW1lIG9mIHRoZSBzdXBwbHkgYW5kIHRoZSB1
c2FnZSBwYXR0ZXJuIHN1Z2dlc3QgdGhhdCBpdCBpcwpiZWluZyB1c2VkIGZvciB0aGUgbWFpbiBw
b3dlciBmb3IgdGhlIGRldmljZSBhbmQgaXMgbm90IGF0IGFsbCBvcHRpb25hbApmb3IgdGhlIGRl
dmljZSBmb3IgZnVuY3Rpb24sIHRoZXJlIGlzIG5vIGhhbmRsaW5nIGF0IGFsbCBmb3IgYWJzZW50
CnN1cHBsaWVzLiAgU3VjaCByZWd1bGF0b3JzIHNob3VsZCB1c2UgdGhlIHZhbmlsbGEgcmVndWxh
dG9yX2dldCgpCmludGVyZmFjZSwgaXQgd2lsbCBlbnN1cmUgdGhhdCBldmVuIGlmIGEgc3VwcGx5
IGlzIG5vdCBkZXNjcmliZWQgaW4gdGhlCnN5c3RlbSBpbnRlZ3JhdGlvbiBvbmUgd2lsbCBiZSBw
cm92aWRlZCBpbiBzb2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVA
a2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoYzYzbHZkMTAyNC5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQuYyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGhjNjNsdmQxMDI0LmMKaW5kZXggM2Q3NDEyOWIyOTk1Li5mZmNhMjhj
Y2MyYzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGhjNjNsdmQxMDI0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQuYwpAQCAtMjAwLDcgKzIw
MCw3IEBAIHN0YXRpYyBpbnQgdGhjNjNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAl0aGM2My0+ZGV2ID0gJnBkZXYtPmRldjsKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2
LCB0aGM2Myk7CiAKLQl0aGM2My0+dmNjID0gZGV2bV9yZWd1bGF0b3JfZ2V0X29wdGlvbmFsKHRo
YzYzLT5kZXYsICJ2Y2MiKTsKKwl0aGM2My0+dmNjID0gZGV2bV9yZWd1bGF0b3JfZ2V0KHRoYzYz
LT5kZXYsICJ2Y2MiKTsKIAlpZiAoSVNfRVJSKHRoYzYzLT52Y2MpKSB7CiAJCWlmIChQVFJfRVJS
KHRoYzYzLT52Y2MpID09IC1FUFJPQkVfREVGRVIpCiAJCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
