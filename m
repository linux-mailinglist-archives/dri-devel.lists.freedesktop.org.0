Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8A1A8640
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 17:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B2189BFF;
	Wed,  4 Sep 2019 15:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC9989BFF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 15:58:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D5DF2339D;
 Wed,  4 Sep 2019 15:58:29 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 35/94] drm/omap: Fix port lookup for SDI output
Date: Wed,  4 Sep 2019 11:56:40 -0400
Message-Id: <20190904155739.2816-35-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904155739.2816-1-sashal@kernel.org>
References: <20190904155739.2816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567612710;
 bh=5NRVbviL4hGRRTEFYHM8bP08XnwcxyDGbBIrfHxPVpM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VStP4nskP7Fs+K+7OzavMEnevfPEdbIbflvMJ/r3I5PvfvM9wcEDhhSvfmUovNwfd
 5LJEs5g1fOSZaQ4L9lkT89prqMxBfbkuqC9fBqw8ZhJxVR3FTQj9pCQNdxjaqZvqdt
 feCWIMOTZMEtZkkL9+Sk4Tniooe9AVxkyJJle9Bc=
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
Cc: Sasha Levin <sashal@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
PgoKWyBVcHN0cmVhbSBjb21taXQgODA5MGY3ZWIzMThkNDI0MTYyNTQ0OTI1MmRiMjc0MWU3NzAz
ZTAyNyBdCgpXaGVuIHJlZmFjdG9yaW5nIHBvcnQgbG9va3VwIGZvciBEU1Mgb3V0cHV0cywgY29t
bWl0IGQxN2ViNDUzN2E3ZQooImRybS9vbWFwOiBGYWN0b3Igb3V0IGNvbW1vbiBpbml0L2NsZWFu
dXAgY29kZSBmb3Igb3V0cHV0IGRldmljZXMiKQppbmNvcnJlY3RseSBoYXJkY29kZWQgdXNhZ2Ug
b2YgRFQgcG9ydCAwLiBUaGlzIGJyZWFrcyBvcGVyYXRpb24gZm9yIFNESQood2hpY2ggdXNlcyB0
aGUgRFQgcG9ydCAxKSBhbmQgRFBJIG91dHB1dHMgb3RoZXIgdGhhbiBEUEkwICh3aGljaCBhcmUK
bm90IHVzZWQgaW4gbWFpbmxpbmUgRFQgc291cmNlcykuCgpGaXggdGhpcyBieSB1c2luZyB0aGUg
cG9ydCBudW1iZXIgZnJvbSB0aGUgb3V0cHV0IG9tYXBfZHNzX2RldmljZQpvZl9wb3J0cyBmaWVs
ZC4KCkZpeGVzOiBkMTdlYjQ1MzdhN2UgKCJkcm0vb21hcDogRmFjdG9yIG91dCBjb21tb24gaW5p
dC9jbGVhbnVwIGNvZGUgZm9yIG91dHB1dCBkZXZpY2VzIikKU2lnbmVkLW9mZi1ieTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpMaW5rOiBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA4MjExODMyMjYuMTM3
ODQtMS1sYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20KVGVzdGVkLWJ5OiBBYXJvIEtv
c2tpbmVuIDxhYXJvLmtvc2tpbmVuQGlraS5maT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4g
PHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vdXRw
dXQuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vdXRwdXQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vdXRwdXQuYwppbmRleCBkZTBmODgyZjBmN2Iw
Li4xNGI0MWRlNDRlYmNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mv
b3V0cHV0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL291dHB1dC5jCkBAIC00
LDYgKzQsNyBAQAogICogQXV0aG9yOiBBcmNoaXQgVGFuZWphIDxhcmNoaXRAdGkuY29tPgogICov
CiAKKyNpbmNsdWRlIDxsaW51eC9iaXRvcHMuaD4KICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4K
ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4KQEAgLTIwLDcgKzIxLDggQEAgaW50IG9tYXBkc3NfZGV2aWNlX2luaXRfb3V0cHV0KHN0
cnVjdCBvbWFwX2Rzc19kZXZpY2UgKm91dCkKIHsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKnJlbW90
ZV9ub2RlOwogCi0JcmVtb3RlX25vZGUgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX25vZGUob3V0LT5k
ZXYtPm9mX25vZGUsIDAsIDApOworCXJlbW90ZV9ub2RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9u
b2RlKG91dC0+ZGV2LT5vZl9ub2RlLAorCQkJCQkgICAgICAgZmZzKG91dC0+b2ZfcG9ydHMpIC0g
MSwgMCk7CiAJaWYgKCFyZW1vdGVfbm9kZSkgewogCQlkZXZfZGJnKG91dC0+ZGV2LCAiZmFpbGVk
IHRvIGZpbmQgdmlkZW8gc2lua1xuIik7CiAJCXJldHVybiAwOwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
