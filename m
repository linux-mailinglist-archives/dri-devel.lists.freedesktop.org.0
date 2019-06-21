Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC54E856
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 14:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F75D6E8A5;
	Fri, 21 Jun 2019 12:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C24C6E8A5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 12:55:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z23so6506265wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 05:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M5roWua+sE0QDauEpfxqdxQ5SjcRxbCv1Yw8mVidcLA=;
 b=povlLFFegr/HPZpDcL0myXQZcjewByEEuJxBFzSZsDVUbHDWDF4zZnONp6L+aotWHX
 rx8W7W+zIgmil7RMmIzKtSMp0ntN+YkAgVFcwRn2HIWqFRk+qx7kDEii4ybYEEXO4its
 ykidTyusewyVHIVH1Kb2NlyDPE/atz6Dp1f+FQ+9Mp2iDR1ncs4CpP61pyQrtdbcI3D9
 qvy03NLJPYdRTe2cRZsZNkG9jYVr2cadIHwMg13uyQGaWJz334kDNGfty1G+mIbEOEbR
 5rolhI6eLWggGACaWjLxq3HQoR311XnW/ljgUf7/aM0hIS0VUe/e1xVVREuZdJGbbVYf
 wEuQ==
X-Gm-Message-State: APjAAAVReAmlXOtaIHFX0xZNCTRLJpHWg27tSVbl0NDZNGU0yLriJ2G/
 BW07nZt9eux87PZiaOgQinc3yg==
X-Google-Smtp-Source: APXvYqxZcpKELGpSFn7MYSlxt7hDPB3jHlFtAG02JXWV4XcyKO8TczsGU/6Wz4PKdda3LT09prXOdg==
X-Received: by 2002:a1c:b6d4:: with SMTP id g203mr4059348wmf.19.1561121751770; 
 Fri, 21 Jun 2019 05:55:51 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id l12sm1761640wmj.22.2019.06.21.05.55.50
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 05:55:51 -0700 (PDT)
Subject: Re: [PATCH 3/4] backlight: pwm_bl: Set scale type for CIE 1931 curves
To: Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20190613194326.180889-1-mka@chromium.org>
 <20190613194326.180889-4-mka@chromium.org>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <61ed137c-31bb-c695-4174-0484fe667d6c@linaro.org>
Date: Fri, 21 Jun 2019 13:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613194326.180889-4-mka@chromium.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M5roWua+sE0QDauEpfxqdxQ5SjcRxbCv1Yw8mVidcLA=;
 b=aywzB083QiInYx90tUDlA2Hh05BuCQgZDjn3VehTjpIgCX6kvyryZZZgNltfKT70sB
 F3qwGoFmp+QHwoMASFBpXOXmDA1u8gDTK8lhy4rcKYOkH7C3zw31pA4Ry0alSD12QyUw
 sWCXF3q9POBLF4MF+qFQ7/lvznPucP59jYYrGzeHgpdAlrGWmBxYIA6VyiIu5uYy19OG
 cqp9xLMBxKSPdhdf1Rs3tLUMePHQS2EbUa5SEHdfEbu/x8gfulc3C2LuFmzcw/qoZx2A
 Cs10u5TDbwS8zfZG6G2laGy/B7THSa1636OwpHdLnAel6mH+6kdo1gA6nnE3ZMK0ftSS
 KTHg==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMDYvMjAxOSAyMDo0MywgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cj4gRm9yIGJhY2ts
aWdodCBjdXJ2ZXMgY2FsY3VsYXRlZCB3aXRoIHRoZSBDSUUgMTkzMSBhbGdvcml0aG0gc2V0Cj4g
dGhlIGJyaWdodG5lc3Mgc2NhbGUgdHlwZSBwcm9wZXJ0eSBhY2NvcmRpbmdseS4gVGhpcyBtYWtl
cyB0aGUKPiBzY2FsZSB0eXBlIGF2YWlsYWJsZSB0byB1c2Vyc3BhY2UgdmlhIHRoZSAnc2NhbGUn
IHN5c2ZzIGF0dHJpYnV0ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8
bWthQGNocm9taXVtLm9yZz4KCkknZCBsaWtlIHRvIGtlZXAgZGlzY3Vzc2lvbiBvbiBwYXRjaCAy
IG9wZW4gYSBiaXQgbG9uZ2VyIChpdCdzIG5vdCBwYXJ0IApvZiB0aGUgdGhyZWFkIGJlbG93IHBh
dGNoIDIgYnV0IFBhdmVsIGhhZCBjb25jZXJucyBhYm91dCB0aGUgc3lzZnMgCmludGVyZmFjZSkg
c28gdGhpcyBhY2sgd29uJ3QgcmVhbGx5IHB1c2ggdGhpbmdzIGZvcndhcmQgYnV0IEZXSVc6CgpB
Y2tlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KCgo+
IC0tLQo+ICAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgfCA1ICsrKystCj4gICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIGIvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvcHdtX2JsLmMKPiBpbmRleCBmYjQ1Zjg2NmI5MjMuLmYwNjdmZTdhYTM1ZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+ICsrKyBiL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gQEAgLTU1Myw2ICs1NTMsOCBAQCBzdGF0aWMg
aW50IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
IAkJZ290byBlcnJfYWxsb2M7Cj4gICAJfQo+ICAgCj4gKwltZW1zZXQoJnByb3BzLCAwLCBzaXpl
b2Yoc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzKSk7Cj4gKwo+ICAgCWlmIChkYXRhLT5sZXZl
bHMpIHsKPiAgIAkJLyoKPiAgIAkJICogRm9yIHRoZSBEVCBjYXNlLCBvbmx5IHdoZW4gYnJpZ2h0
bmVzcyBsZXZlbHMgaXMgZGVmaW5lZAo+IEBAIC01OTEsNiArNTkzLDggQEAgc3RhdGljIGludCBw
d21fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAKPiAg
IAkJCXBiLT5sZXZlbHMgPSBkYXRhLT5sZXZlbHM7Cj4gICAJCX0KPiArCj4gKwkJcHJvcHMuc2Nh
bGUgPSBCQUNLTElHSFRfU0NBTEVfQ0lFMTkzMTsKPiAgIAl9IGVsc2Ugewo+ICAgCQkvKgo+ICAg
CQkgKiBUaGF0IG9ubHkgaGFwcGVucyBmb3IgdGhlIG5vbi1EVCBjYXNlLCB3aGVyZSBwbGF0Zm9y
bSBkYXRhCj4gQEAgLTYwMSw3ICs2MDUsNiBAQCBzdGF0aWMgaW50IHB3bV9iYWNrbGlnaHRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAo+ICAgCXBiLT5sdGhfYnJpZ2h0
bmVzcyA9IGRhdGEtPmx0aF9icmlnaHRuZXNzICogKHN0YXRlLnBlcmlvZCAvIHBiLT5zY2FsZSk7
Cj4gICAKPiAtCW1lbXNldCgmcHJvcHMsIDAsIHNpemVvZihzdHJ1Y3QgYmFja2xpZ2h0X3Byb3Bl
cnRpZXMpKTsKPiAgIAlwcm9wcy50eXBlID0gQkFDS0xJR0hUX1JBVzsKPiAgIAlwcm9wcy5tYXhf
YnJpZ2h0bmVzcyA9IGRhdGEtPm1heF9icmlnaHRuZXNzOwo+ICAgCWJsID0gYmFja2xpZ2h0X2Rl
dmljZV9yZWdpc3RlcihkZXZfbmFtZSgmcGRldi0+ZGV2KSwgJnBkZXYtPmRldiwgcGIsCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
