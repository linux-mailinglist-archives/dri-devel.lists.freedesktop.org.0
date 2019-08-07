Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B6E854EE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 23:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED406E64F;
	Wed,  7 Aug 2019 21:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5046E64F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 21:08:57 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k8so87834993edr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 14:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=WpTDnBLeqBpcYNuMO5Xr6VDSfxDLcJKI+RhmNC+qR/Y=;
 b=ZNe+WeA8peHZ1Grouxp/lLzkq5Po3Fa1B4dtFwYmhcoxpfCgE7UoIBKPOETSrqjBTq
 o61TJ0LVIFLvdyPkxgebQKZAqdvVJyughAubplArDZaYMyQIqZLpjb6TmMfHGcZzVV2t
 q4NdGvc4h2n+Aecr9sM5zyvohgNgXMq+QwSxzadJGR4kELtPxgw05SGFiskHPdw6dtf2
 boghGA7vkM2shBCmXz5h2cpbrJnGv6ufWXwWUq9y64XEF7e9Lv4SZQLjf8auACwZHNW/
 rEEYU1UVgwKr27scUMIg1voCwAKxiUGO+W7kW590RGlyYmfT5ZYl1YNY0WdJvqGeKo2A
 pXdg==
X-Gm-Message-State: APjAAAXjklhQunR7kcBmFK/d3eFMYQkqWiaI6aSfgdFg/SRP/ivt5HNZ
 VVnPJ/wm5beRx02j15R7+37uAB7AE5L4HA==
X-Google-Smtp-Source: APXvYqwYhHrKa/ZKokZeoyh60e4i9idWNZLhHZkuYpLqSrcSTTyodDnby+NikOVHFnxDt+H4l3KAlA==
X-Received: by 2002:a50:c94b:: with SMTP id p11mr12117139edh.301.1565212136312; 
 Wed, 07 Aug 2019 14:08:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z24sm29268edc.65.2019.08.07.14.08.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 14:08:55 -0700 (PDT)
Date: Wed, 7 Aug 2019 23:08:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/3] drm: add gem ttm helpers
Message-ID: <20190807210853.GH7444@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20190806133454.8254-1-kraxel@redhat.com>
 <20190806133454.8254-2-kraxel@redhat.com>
 <20190806135426.GA7444@phenom.ffwll.local>
 <20190807072654.arqvx37p4yxhegcu@sirius.home.kraxel.org>
 <CAKMK7uFyKd71w4H8nFk=WPSHL3KMwQ6kLwAMXTd_TAkrkJ++KQ@mail.gmail.com>
 <20190807103649.aedmac63eop6ktlk@sirius.home.kraxel.org>
 <CAKMK7uHNXjSsuUTkxzVbeDNP4ESFBObHZe6xxJYEHE1-QyKqhQ@mail.gmail.com>
 <20190807115133.gkr2svqlvq366mub@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807115133.gkr2svqlvq366mub@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=WpTDnBLeqBpcYNuMO5Xr6VDSfxDLcJKI+RhmNC+qR/Y=;
 b=jhH9sYqXSIeaEgzW9lYzfUAsV3IrDrnPPFjc71xyUEl4quoeszK4MgSZc9aBaWgQDf
 8ghApR686Up9F3+XSDUzxuVAJEdDHE9NGNsNn+Tgx4sP02ojcRfTBLA2jsKD19FSaZCB
 wQRB+UgitG9AcZUeXsclkykHoGQhX2PDe0cIw=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDE6NTE6MzNQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAgIEhpLAo+IAo+ID4gPiA+ID4gSSBkb24ndCB0aGluayBzby4gIGRybV9nZW1fZHVt
Yl9tYXBfb2Zmc2V0KCkgY2FsbHMKPiA+ID4gPiA+IGRybV9nZW1fY3JlYXRlX21tYXBfb2Zmc2V0
KCksIHdoaWNoIEkgdGhpbmsgaXMgbm90IGNvcnJlY3QgZm9yIHR0bQo+ID4gPiA+ID4gb2JqZWN0
cyBiZWNhdXNlIHR0bV9ib19pbml0KCkgaGFuZGxlcyB2bWFfbm9kZSBpbml0aWFsaXphdGlvbi4K
PiAKPiA+IE9rIEkgbG9va2VkIGFnYWluLCBhbmQgeW91ciB0dG0gdmVyc2lvbiBzZWVtcyB0byBl
eGFjdGx5IG1hdGNoCj4gPiBkcm1fZ2VtX2R1bWJfbWFwX29mZnNldCgpLAo+IAo+IE5vLiAgVGhl
IGRpZmZlcmVuY2Ugb3V0bGluZWQgYWJvdmUgaXMgc3RpbGwgdGhlcmUuICBTZWUgYWxzbyB2MiB3
aGljaAo+IGFkZHMgYW4gY29tbWVudCBzYXlpbmcgc28uCgpDcmVhdGluZyBhbiBtbWFwIG9mZnNl
dCBpcyBpZGVtcG90ZW50LiBPdGhlcndpc2UgdGhlIGdlbSB2ZXJzaW9uIHdvdWxkCmFscmVhZHkg
YmxvdyB1cCByZWFsIGJhZCwgc2luY2UgaXQncyBnZXR0aW5nIGNhbGxlZCBtdWx0aXBsZSB0aW1l
cyBieQp1c2Vyc3BhY2UgYWxyZWFkeS4KClNvIEkgc3RpbGwgdGhpbmsgdHRtIGlzbid0IHNwZWNp
YWwgaGVyZSwgaG93IGRpZCB0aGlzIGJsb3cgdXAgd2hlbiB5b3UKdHJpZWQ/Ci1EYW5pZWwKLS0g
CkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
