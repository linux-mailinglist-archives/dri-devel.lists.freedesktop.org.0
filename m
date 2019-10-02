Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A39BC9293
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 21:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05D86E19B;
	Wed,  2 Oct 2019 19:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8416E19B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 19:44:14 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id c17so141171pgg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 12:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5RG+TGpIbWGK66ii3aX/c/mLwtrL9t7Co+9YPIDroe0=;
 b=H6hg9gfkZH7u0+tyeKLXRcdUQBnT19xA5J2FNUGgkvdF+N64OuZE8wjK9ADk8Hebus
 Tc0paYFCYDwNIYGh7lUPuExVX08kXe3U8RpsWJOCD1viIpbx3Ir/ChtfsmALZDEwzw4p
 jdkAzxgDg7rv4LAlYn/Vd39bWwYfdO7XFXQ3kzYMGIPaJRe6092kN9VqjR6u5d87RElW
 ZFuvZfGegjVbNGSUKqR1DPyuBgVjzo3BXRSs4mr54AX6c1Fh67uHhoRtIM/amnmow5y5
 tYKa0kOZEzCCBpnYC7X1ItkVnM6Cer4ZuQLSDzw/jH7AFNg3G01NRNWi3bE4FCun339D
 91xA==
X-Gm-Message-State: APjAAAXtEnxANu0F9GQgLCD4Xo4sApcSjQkzfxCTyO/McAyXzZgLwpDR
 ruM86WPqa5HmeVuAIbXJE4mkQQ==
X-Google-Smtp-Source: APXvYqwCRR5aDz75Ce/P5Hmy07jPu4Aqvt3K38tktyiDQ8tJemrn+5jUTMbbw8q6Rh4bGgQCLaXTIw==
X-Received: by 2002:a63:6803:: with SMTP id d3mr5361330pgc.183.1570045453990; 
 Wed, 02 Oct 2019 12:44:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id b4sm68127pju.16.2019.10.02.12.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 12:44:13 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Archit Taneja <architt@codeaurora.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v2] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
Date: Wed,  2 Oct 2019 12:44:06 -0700
Message-Id: <20191002124354.v2.1.I709dfec496f5f0b44a7b61dcd4937924da8d8382@changeid>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5RG+TGpIbWGK66ii3aX/c/mLwtrL9t7Co+9YPIDroe0=;
 b=BDeT9Q2rS460oUk++puZT/bURg9A9s+tehyWG6BTR4fBXjpn6dnc+y/qwlxbuUmlDM
 EXy+7jMvhu5+8Eg5lHgfSj6UqA8SYT8vNKZQLBcRyAfLAJN6KXBB3/xFFn4vg88dzkEa
 7hB0jLtDHVB7YYKgwEl5/peZADD5F5ENUBB5k=
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
 Tzung-Bi Shih <tzungbi@chromium.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Sean Paul <sean@poorly.run>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Kaehlcke <mka@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Yakir Yang <kuankuan.y@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEREQy9DSSBwcm90b2NvbCBpbnZvbHZlcyBzZW5kaW5nIGEgbXVsdGktYnl0ZSByZXF1ZXN0
IHRvIHRoZQpkaXNwbGF5IHZpYSBJMkMsIHdoaWNoIGlzIHR5cGljYWxseSBmb2xsb3dlZCBieSBh
IG11bHRpLWJ5dGUKcmVzcG9uc2UuIFRoZSBpbnRlcm5hbCBJMkMgY29udHJvbGxlciBvbmx5IGFs
bG93cyBzaW5nbGUgYnl0ZQpyZWFkcy93cml0ZXMgb3IgcmVhZHMgb2YgOCBzZXF1ZW50aWFsIGJ5
dGVzLCBoZW5jZSBEREMvQ0kgaXMgbm90CnN1cHBvcnRlZCB3aGVuIHRoZSBpbnRlcm5hbCBJMkMg
Y29udHJvbGxlciBpcyB1c2VkLiBUaGUgSTJDCnRyYW5zZmVycyBjb21wbGV0ZSB3aXRob3V0IGVy
cm9ycywgaG93ZXZlciB0aGUgZGF0YSBpbiB0aGUgcmVzcG9uc2UKaXMgZ2FyYmFnZS4gQWJvcnQg
dHJhbnNmZXJzIHRvL2Zyb20gc2xhdmUgYWRkcmVzcyAweDM3IChEREMpIHdpdGgKLUVPUE5PVFNV
UFAsIHRvIG1ha2UgaXQgZXZpZGVudCB0aGF0IHRoZSBjb21tdW5pY2F0aW9uIGlzIGZhaWxpbmcu
CgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KUmV2
aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KUmV2aWV3
ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpBY2tlZC1ieTogTmVpbCBBcm1zdHJv
bmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgotLS0KU29ycnkgZm9yIHRoZSBkZWxheSB3aXRo
IHNlbmRpbmcgdjIsIEkgY29tcGxldGVseSBmb3Jnb3QgYWJvdXQgdGhpcyBwYXRjaCAuLi4KCkNo
YW5nZXMgaW4gdjI6Ci0gdXBkYXRlZCBjb21tZW50IHdpdGggJ1RPRklYJyBlbnRyeSBhcyByZXF1
ZXN0ZWQgYnkgTmVpbAotIGFkZGVkIE5laWwncyAnQWNrZWQtYnknIHRhZwoKIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMv
ZHctaGRtaS5jCmluZGV4IDUyZDIyMGE3MDM2Mi4uYWMyNGJjZWFmNDE1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtNDEsNiArNDEsNyBAQAogCiAjaW5j
bHVkZSA8bWVkaWEvY2VjLW5vdGlmaWVyLmg+CiAKKyNkZWZpbmUgRERDX0NJX0FERFIJCTB4MzcK
ICNkZWZpbmUgRERDX1NFR01FTlRfQUREUgkweDMwCiAKICNkZWZpbmUgSERNSV9FRElEX0xFTgkJ
NTEyCkBAIC00MzksNiArNDQwLDE1IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9pMmNfeGZlcihzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsCiAJdTggYWRkciA9IG1zZ3NbMF0uYWRkcjsKIAlpbnQgaSwg
cmV0ID0gMDsKIAorCWlmIChhZGRyID09IEREQ19DSV9BRERSKQorCQkvKgorCQkgKiBUaGUgaW50
ZXJuYWwgSTJDIGNvbnRyb2xsZXIgZG9lcyBub3Qgc3VwcG9ydCB0aGUgbXVsdGktYnl0ZQorCQkg
KiByZWFkIGFuZCB3cml0ZSBvcGVyYXRpb25zIG5lZWRlZCBmb3IgRERDL0NJLgorCQkgKiBUT0ZJ
WDogQmxhY2tsaXN0IHRoZSBEREMvQ0kgYWRkcmVzcyB1bnRpbCB3ZSBmaWx0ZXIgb3V0CisJCSAq
IHVuc3VwcG9ydGVkIEkyQyBvcGVyYXRpb25zLgorCQkgKi8KKwkJcmV0dXJuIC1FT1BOT1RTVVBQ
OworCiAJZGV2X2RiZyhoZG1pLT5kZXYsICJ4ZmVyOiBudW06ICVkLCBhZGRyOiAlI3hcbiIsIG51
bSwgYWRkcik7CiAKIAlmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspIHsKLS0gCjIuMjMuMC40NDQu
ZzE4ZWViNWEyNjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
