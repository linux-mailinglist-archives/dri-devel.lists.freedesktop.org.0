Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EAA1249F
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 00:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C661F893D1;
	Thu,  2 May 2019 22:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBD9893D0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 22:38:31 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id v80so1844691pfa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 15:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oGCfMQkKfqkKFZ8erX0b7VyU7ofDCnx2g9X0TKrb/HA=;
 b=DXVL/UIOj3UrgAGFu5AjrWU8A1ipw3OZ5p9dt6pUmTTnw62LuWlaFnp6/NF7EG+LQx
 KVwkCwu8Bq390sudO5d26sQ7WZgwJwEppwEXeVwf2oy1gN9nk4Sl87FADRUTrX7ev3Dt
 OUy0mXRlupxFsLAjPrdu55eLyzi8a+3SyRqf/xtR2CVO6QOcaOitI4XYgnu8UNVrm0F7
 FfjZReHp8Oqm0eKjOfkO13J6E+pOG51kkVG7BDfYV+fZoERP06BdjFOUnBkwJClR6Xgh
 upSzuiM7sCC/uJU2U8buXqqahCsjn8rDQJkejB/XetOkQFb57xpy0xki/pBgFN43PPPi
 X0cQ==
X-Gm-Message-State: APjAAAWSkKWFPECCrWbhz8nAO2Ao7OFdGiVD/2sgybgt8UB9eJBrDY1b
 ow3KaX2TxCtQ2VTXI2mF402pHA==
X-Google-Smtp-Source: APXvYqzegNUKwWVFGK5+OSJGRGvk9lnvVlziVA8BSgZO2xFC57BLteuXPc+lxQ5gyK9oIUqE+P1Q3g==
X-Received: by 2002:a63:cd15:: with SMTP id i21mr6626004pgg.269.1556836711151; 
 Thu, 02 May 2019 15:38:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id k186sm244151pfc.137.2019.05.02.15.38.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 15:38:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/2] drm: bridge: dw-hdmi: Add hooks for suspend/resume
Date: Thu,  2 May 2019 15:38:07 -0700
Message-Id: <20190502223808.185180-1-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oGCfMQkKfqkKFZ8erX0b7VyU7ofDCnx2g9X0TKrb/HA=;
 b=DJKuaiHXmnpN5NHgJx3Ha85ILyIu0e1kfwt5qnKUaJz9o3ZLF8arJytmHtO7FqiFBV
 MBWtO7EXORv02Y2abZgYE36pxCrS+zMp4GRVryBr0oj3TWALLhx8FtS6V3FpEWfVdzdW
 96PKjpxXBqXPpYBCEru2M2NeyILoFnAEQplI8=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 mka@chromium.org, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gUm9ja2NoaXAgcmszMjg4LWJhc2VkIENocm9tZWJvb2tzIHdoZW4geW91IGRvIGEgc3VzcGVu
ZC9yZXN1bWUKY3ljbGU6CgoxLiBZb3UgbG9zZSB0aGUgYWJpbGl0eSB0byBkZXRlY3QgYW4gSERN
SSBkZXZpY2UgYmVpbmcgcGx1Z2dlZCBpbi4KCjIuIElmIHlvdSdyZSB1c2luZyB0aGUgaTJjIGJ1
cyBidWlsdCBpbiB0byBkd19oZG1pIHRoZW4gaXQgc3RvcHMKd29ya2luZy4KCkxldCdzIGFkZCBh
IGhvb2sgdG8gdGhlIGNvcmUgZHctaGRtaSBkcml2ZXIgc28gdGhhdCB3ZSBjYW4gY2FsbCBpdCBp
bgpkd19oZG1pLXJvY2tjaGlwIGluIHRoZSBuZXh0IGNvbW1pdC4KCk5PVEU6IHRoZSBleGFjdCBz
ZXQgb2Ygc3RlcHMgSSd2ZSBkb25lIGhlcmUgaW4gcmVzdW1lIGNvbWUgZnJvbQpsb29raW5nIGF0
IHRoZSBub3JtYWwgZHdfaGRtaSBpbml0IHNlcXVlbmNlIGluIHVwc3RyZWFtIExpbnV4IHBsdXMg
dGhlCnNlcXVlbmNlIHRoYXQgd2UgZGlkIGluIGRvd25zdHJlYW0gQ2hyb21lIE9TIDMuMTQuICBU
ZXN0aW5nIHNob3cgdGhhdAppdCBzZWVtcyB0byB3b3JrLCBidXQgaWYgYW4gZXh0cmEgc3RlcCBp
cyBuZWVkZWQgb3Igc29tZXRoaW5nIGhlcmUgaXMKbm90IG5lZWRlZCB3ZSBjb3VsZCBpbXByb3Zl
IGl0LgoKU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0u
b3JnPgotLS0KCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDIx
ICsrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCAgICAg
ICAgICAgICAgfCAgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKaW5kZXggZGI3NjEzMjlhMWUz
Li40YjM4YmZkNDNlNTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jCkBAIC0yNzgwLDYgKzI3ODAsMjcgQEAgdm9pZCBkd19oZG1pX3VuYmluZChzdHJ1Y3QgZHdf
aGRtaSAqaGRtaSkKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGR3X2hkbWlfdW5iaW5kKTsKIAoraW50
IGR3X2hkbWlfc3VzcGVuZChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKK3sKKwlyZXR1cm4gMDsKK30K
K0VYUE9SVF9TWU1CT0xfR1BMKGR3X2hkbWlfc3VzcGVuZCk7CisKK2ludCBkd19oZG1pX3Jlc3Vt
ZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKK3sKKwlpbml0aWFsaXplX2hkbWlfaWhfbXV0ZXMoaGRt
aSk7CisKKwlkd19oZG1pX3NldHVwX2kyYyhoZG1pKTsKKwlpZiAoaGRtaS0+aTJjKQorCQlkd19o
ZG1pX2kyY19pbml0KGhkbWkpOworCisJaWYgKGhkbWktPnBoeS5vcHMtPnNldHVwX2hwZCkKKwkJ
aGRtaS0+cGh5Lm9wcy0+c2V0dXBfaHBkKGhkbWksIGhkbWktPnBoeS5kYXRhKTsKKworCXJldHVy
biAwOworfQorRVhQT1JUX1NZTUJPTF9HUEwoZHdfaGRtaV9yZXN1bWUpOworCiBNT0RVTEVfQVVU
SE9SKCJTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Iik7CiBNT0RVTEVfQVVU
SE9SKCJBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Iik7CiBNT0RVTEVfQVVUSE9S
KCJZYWtpciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+Iik7CmRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS9icmlkZ2UvZHdfaGRtaS5oIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaAppbmRl
eCA2NmU3MDc3MGNjZTUuLmM0MTMyZTlhNWFlMyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vYnJp
ZGdlL2R3X2hkbWkuaAorKysgYi9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oCkBAIC0xNTQs
NiArMTU0LDkgQEAgc3RydWN0IGR3X2hkbWkgKmR3X2hkbWlfYmluZChzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2LAogCQkJICAgICBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJCQkg
ICAgIGNvbnN0IHN0cnVjdCBkd19oZG1pX3BsYXRfZGF0YSAqcGxhdF9kYXRhKTsKIAoraW50IGR3
X2hkbWlfc3VzcGVuZChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSk7CitpbnQgZHdfaGRtaV9yZXN1bWUo
c3RydWN0IGR3X2hkbWkgKmhkbWkpOworCiB2b2lkIGR3X2hkbWlfc2V0dXBfcnhfc2Vuc2Uoc3Ry
dWN0IGR3X2hkbWkgKmhkbWksIGJvb2wgaHBkLCBib29sIHJ4X3NlbnNlKTsKIAogdm9pZCBkd19o
ZG1pX3NldF9zYW1wbGVfcmF0ZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdW5zaWduZWQgaW50IHJh
dGUpOwotLSAKMi4yMS4wLjEwMjAuZ2YyODIwY2YwMWEtZ29vZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
