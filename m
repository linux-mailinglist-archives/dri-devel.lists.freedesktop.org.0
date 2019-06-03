Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E209329D9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E1889700;
	Mon,  3 Jun 2019 07:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8299898BF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 04:33:44 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id h2so4277522pgg.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2019 21:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MaZJTXi3Kb+zP1LdC2+ckQjoA/4H+fjgGV1LvJAeRMw=;
 b=HJcX8p18t69fO+TyN6NB3itqQqbzV2MK3GX5moGUS8vpQVGwNTF9KaGYmMC9jzfabo
 saWdCuYK6rMX9b8wG9SnSQuCCnDk4+Dy9wVNv+4Ib+QywEKXUpx/FuSLilMym2V0yWQs
 cR/+9PmLfGN40l2kwvQLlveRTdFmnKq8JHb0gQsP2pDsLqh0JZrSFLm0J5KuzO8MWz2A
 cizrIWo4q/8vnf6KtIig/TTNQu+CPTraMbDPIlp4Gga/OKnuipCuZiT+FAWJAxB/eev8
 UV5VDslZH3f7GaNTsEIbbAHRG713cRpJBZtTRfsVOl4KLbe8xKwxLVhQfwUEfk1s1B01
 KrVA==
X-Gm-Message-State: APjAAAUR8fvlr+kI+8+PQI3VAHvWKXpZBDLlzDf47f9GXWq3L0yo8VkO
 hDLlAJR/dbqWSmR0VmMv3Q+4+Q==
X-Google-Smtp-Source: APXvYqwQPHtm3t6nVseAhWV9BUbWtxWUQBMFPxBiyn3rh2KIclbVwhWbmFhQyEfEQ9mmHbprMFiaUg==
X-Received: by 2002:a17:90a:a789:: with SMTP id
 f9mr27039120pjq.20.1559536424466; 
 Sun, 02 Jun 2019 21:33:44 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id m11sm10827627pjv.21.2019.06.02.21.33.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 21:33:43 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] drm/bridge/synopsys: dw-hdmi: Add HDMI notifier support
Date: Mon,  3 Jun 2019 12:32:47 +0800
Message-Id: <20190603043251.226549-4-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603043251.226549-1-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Jun 2019 07:40:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MaZJTXi3Kb+zP1LdC2+ckQjoA/4H+fjgGV1LvJAeRMw=;
 b=kedjugWkJGjbZv4u3cVdp4XDkL/2UujV324hi4xDMTOTYbHYPbUnOtVV/E696ygI4t
 cYwfGz01X+eBCKlr5xigVC+q17FBxGkqMRIQmN2Tb9LkEM0x9vaOqC8GKJiYJv2aslY2
 TItexnk2xcMcs/1c/Ex771hoN5UH0dq13eh48=
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
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGhkbWktbm90aWZpZXIgdG8gbm90aWZ5IGNvZGVjIGRyaXZlciB0aGF0IHRoZXJlIGlzIEhE
TUkgcGx1Zy91bnBsdWcKZXZlbnQuCgpTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZaSBDaGlhbmcgPGN5
Y2hpYW5nQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L0tjb25maWcgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L0tjb25maWcKaW5kZXggM2NjNTNiNDQxODZlLi40MzE5MmQ5ZDczNTcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL0tjb25maWcKQEAgLTMsNiArMyw3IEBAIGNvbmZpZyBEUk1fRFdf
SERNSQogCXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCXNlbGVjdCBSRUdNQVBfTU1JTwogCXNlbGVj
dCBDRUNfQ09SRSBpZiBDRUNfTk9USUZJRVIKKwlzZWxlY3QgSERNSV9OT1RJRklFUlMKIAogY29u
ZmlnIERSTV9EV19IRE1JX0FIQl9BVURJTwogCXRyaXN0YXRlICJTeW5vcHN5cyBEZXNpZ253YXJl
IEFIQiBBdWRpbyBpbnRlcmZhY2UiCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jCmluZGV4IGFiNzk2OGM4ZjZhMi4uNTM3MDE5MjFlYjFmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMTcsNiArMTcsNyBAQAogI2luY2x1ZGUg
PGxpbnV4L2Vyci5oPgogI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgogI2luY2x1ZGUgPGxpbnV4L2hk
bWkuaD4KKyNpbmNsdWRlIDxsaW51eC9oZG1pLW5vdGlmaWVyLmg+CiAjaW5jbHVkZSA8bGludXgv
bXV0ZXguaD4KICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9y
ZWdtYXAuaD4KQEAgLTE5MCw2ICsxOTEsNyBAQCBzdHJ1Y3QgZHdfaGRtaSB7CiAJdm9pZCAoKmRp
c2FibGVfYXVkaW8pKHN0cnVjdCBkd19oZG1pICpoZG1pKTsKIAogCXN0cnVjdCBjZWNfbm90aWZp
ZXIgKmNlY19ub3RpZmllcjsKKwlzdHJ1Y3QgaGRtaV9ub3RpZmllciAqaGRtaV9ub3RpZmllcjsK
IH07CiAKICNkZWZpbmUgSERNSV9JSF9QSFlfU1RBVDBfUlhfU0VOU0UgXApAQCAtMjMwMSw4ICsy
MzAzLDE1IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkd19oZG1pX2lycShpbnQgaXJxLCB2b2lkICpk
ZXZfaWQpCiAJfQogCiAJaWYgKGludHJfc3RhdCAmIEhETUlfSUhfUEhZX1NUQVQwX0hQRCkgewot
CQlkZXZfZGJnKGhkbWktPmRldiwgIkVWRU5UPSVzXG4iLAotCQkJcGh5X2ludF9wb2wgJiBIRE1J
X1BIWV9IUEQgPyAicGx1Z2luIiA6ICJwbHVnb3V0Iik7CisJCWlmIChwaHlfaW50X3BvbCAmIEhE
TUlfUEhZX0hQRCkgeworCQkJZGV2X2RiZyhoZG1pLT5kZXYsICJFVkVOVD1wbHVnaW5cbiIpOwor
CQkJaWYgKGhkbWktPmhkbWlfbm90aWZpZXIpCisJCQkJaGRtaV9ldmVudF9jb25uZWN0KGhkbWkt
PmhkbWlfbm90aWZpZXIpOworCQl9IGVsc2UgeworCQkJZGV2X2RiZyhoZG1pLT5kZXYsICJFVkVO
VD1wbHVnb3V0XG4iKTsKKwkJCWlmIChoZG1pLT5oZG1pX25vdGlmaWVyKQorCQkJCWhkbWlfZXZl
bnRfZGlzY29ubmVjdChoZG1pLT5oZG1pX25vdGlmaWVyKTsKKwkJfQogCQlpZiAoaGRtaS0+YnJp
ZGdlLmRldikKIAkJCWRybV9oZWxwZXJfaHBkX2lycV9ldmVudChoZG1pLT5icmlkZ2UuZGV2KTsK
IAl9CkBAIC0yNjA2LDYgKzI2MTUsMTIgQEAgX19kd19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYsCiAJCWdvdG8gZXJyX2lhaGI7CiAJfQogCisJaGRtaS0+aGRtaV9ub3Rp
ZmllciA9IGhkbWlfbm90aWZpZXJfZ2V0KGRldik7CisJaWYgKCFoZG1pLT5oZG1pX25vdGlmaWVy
KSB7CisJCXJldCA9IC1FTk9NRU07CisJCWdvdG8gZXJyX2lhaGI7CisJfQorCiAJLyoKIAkgKiBU
byBwcmV2ZW50IG92ZXJmbG93cyBpbiBIRE1JX0lIX0ZDX1NUQVQyLCBzZXQgdGhlIGNsayByZWdl
bmVyYXRvcgogCSAqIE4gYW5kIGN0cyB2YWx1ZXMgYmVmb3JlIGVuYWJsaW5nIHBoeQpAQCAtMjY5
Niw2ICsyNzExLDkgQEAgX19kd19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYsCiAJaWYgKGhkbWktPmNlY19ub3RpZmllcikKIAkJY2VjX25vdGlmaWVyX3B1dChoZG1pLT5j
ZWNfbm90aWZpZXIpOwogCisJaWYgKGhkbWktPmhkbWlfbm90aWZpZXIpCisJCWhkbWlfbm90aWZp
ZXJfcHV0KGhkbWktPmhkbWlfbm90aWZpZXIpOworCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhk
bWktPmlhaGJfY2xrKTsKIAlpZiAoaGRtaS0+Y2VjX2NsaykKIAkJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGhkbWktPmNlY19jbGspOwpAQCAtMjcwOSw2ICsyNzI3LDkgQEAgX19kd19oZG1pX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAKIHN0YXRpYyB2b2lkIF9fZHdfaGRtaV9y
ZW1vdmUoc3RydWN0IGR3X2hkbWkgKmhkbWkpCiB7CisJaWYgKGhkbWktPmhkbWlfbm90aWZpZXIp
CisJCWhkbWlfZXZlbnRfZGlzY29ubmVjdChoZG1pLT5oZG1pX25vdGlmaWVyKTsKKwogCWlmICho
ZG1pLT5hdWRpbyAmJiAhSVNfRVJSKGhkbWktPmF1ZGlvKSkKIAkJcGxhdGZvcm1fZGV2aWNlX3Vu
cmVnaXN0ZXIoaGRtaS0+YXVkaW8pOwogCWlmICghSVNfRVJSKGhkbWktPmNlYykpCkBAIC0yNzIw
LDYgKzI3NDEsOSBAQCBzdGF0aWMgdm9pZCBfX2R3X2hkbWlfcmVtb3ZlKHN0cnVjdCBkd19oZG1p
ICpoZG1pKQogCWlmIChoZG1pLT5jZWNfbm90aWZpZXIpCiAJCWNlY19ub3RpZmllcl9wdXQoaGRt
aS0+Y2VjX25vdGlmaWVyKTsKIAorCWlmIChoZG1pLT5oZG1pX25vdGlmaWVyKQorCQloZG1pX25v
dGlmaWVyX3B1dChoZG1pLT5oZG1pX25vdGlmaWVyKTsKKwogCWNsa19kaXNhYmxlX3VucHJlcGFy
ZShoZG1pLT5pYWhiX2Nsayk7CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhkbWktPmlzZnJfY2xr
KTsKIAlpZiAoaGRtaS0+Y2VjX2NsaykKLS0gCjIuMjIuMC5yYzEuMjU3LmczMTIwYTE4MjQ0LWdv
b2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
