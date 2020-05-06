Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB831C8308
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1446E925;
	Thu,  7 May 2020 07:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D6E6E856
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 11:03:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x17so1677082wrt.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rtEuo5nw1S4kpIcS9rhXRJzeE3BjOFfaGFCUT/CfmF4=;
 b=bWfkT4qj3YVYiyTtnBDKzxtH9al8EGIDGEVKQrpkztLlbkCNThDFEuVDTozdfgIzLY
 N4yivpD0Oc9GWBeufPce8cOQgY2lkiqdBkgWTYq4TICJSiiEqMDBnABEBibaWujH6AxN
 v+CfVF7IFDnhjFiERJNR4nbL0mGShNasZXkJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rtEuo5nw1S4kpIcS9rhXRJzeE3BjOFfaGFCUT/CfmF4=;
 b=ZIZ2leA24hycPzOv9uehrNCZsb1Qd9kOh3uBPUj8MVNvvyynf9z/NlmmbGLfaMsiTd
 fz4FagyEQy/N0Av00MFvTpPPngLUPKEEUm1m6Cy6dELHGBuy+Pz1Sx58xo2YKhHIxxah
 aTo1Y8fWg4PKP4Id6W3Nz5v0uQ6plwQgG60dCvJO9O4YZ+s1vzYS7GeqXWrvOV1z49GR
 CEhO63sFcfIEN1PA1gtQ9WsUmGXphXlIPohf4RCYCJxp93OH1zlAl8h9WSgITaAczFBe
 S823Xtlh94gUMhrOU60UzebETHC9Z+HYMXbgg9zyl+FU29Uj+4gLWm5ZfICKXG5Y3QD2
 ojRA==
X-Gm-Message-State: AGi0PuZtCuPNV5G84tfdtrThdWNeM/3Az7rrvwxDd1SVzfSTTKbXj5gV
 oC0HAYb+PiTrc4W3ZOPXXYaocbXr0EOkMEAP7ASQ/w==
X-Google-Smtp-Source: APiQypIGj98l9hllH+9ph6fwT8VKRh/Pv4h2UW1ktSL1V2RKXFelTBD7bNCFAlCYli6PKV2AO+prMw92x7qUiOe3LRk=
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr8407525wrp.427.1588763027630; 
 Wed, 06 May 2020 04:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
 <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
 <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
 <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
 <CAAOTY_9+s8EknSFLyYHNDfJuxERTuubBXaQ41Y3J+DeuDMFGqA@mail.gmail.com>
In-Reply-To: <CAAOTY_9+s8EknSFLyYHNDfJuxERTuubBXaQ41Y3J+DeuDMFGqA@mail.gmail.com>
From: Anand Mistry <amistry@chromium.org>
Date: Wed, 6 May 2020 21:03:36 +1000
Message-ID: <CAECpkiM5ez8=iEe=fYKiDf5Pb6AHrTyt5uXqJQtQpQJHotupWA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: Anand K Mistry <amistry@google.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgNiwgMjAyMCBhdCAxMDoyNSBBTSBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSwgQW5hbmQsCj4KPiBDaHVuLUt1YW5nIEh1IDxj
aHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQ05pyIMjnml6Ug6YCx5LiJIOS4iuWN
iDEyOjM35a+r6YGT77yaCj4gPgo+ID4gSGksIEFuYW5kLAo+ID4KPiA+IEFuYW5kIEsuIE1pc3Ry
eSA8YW1pc3RyeUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIw5bm0NOaciDI45pelIOmAseS6jCDkuIrl
jYg5OjU05a+r6YGT77yaCj4gPiA+Cj4gPiA+IE9uIFN1biwgMjYgQXByIDIwMjAgYXQgMTg6MDQs
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+
ID4gPiA+IEhpLCBBbmFuZDoKPiA+ID4gPgo+ID4gPiA+IEFuYW5kIEsgTWlzdHJ5IDxhbWlzdHJ5
QGNocm9taXVtLm9yZz4g5pa8IDIwMjDlubQ05pyIMjDml6Ug6YCx5LiAIOS4i+WNiDI6MDnlr6vp
gZPvvJoKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJZiBkbWFfbWFwX3NnKCkgbWVyZ2VzIHBhZ2VzIHdo
ZW4gY3JlYXRpbmcgdGhlIG1hcHBpbmcsIG9ubHkgdGhlIGZpcnN0Cj4gPiA+ID4gPiBlbnRyaWVz
IHdpbGwgaGF2ZSBhIHZhbGlkIHNnX2RtYV9hZGRyZXNzKCkgYW5kIHNnX2RtYV9sZW4oKSwgZm9s
bG93ZWQgYnkKPiA+ID4gPiA+IGVudHJpZXMgd2l0aCBzZ19kbWFfbGVuKCkgPT0gMC4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmFuZCBLIE1pc3RyeSA8YW1pc3RyeUBnb29n
bGUuY29tPgo+Cj4gQXV0aG9yIHNob3VsZCBzaWduIG9mZiB0aGlzIHBhdGNoLCBwbGVhc2UgZ2l2
ZSBhIHNpZ24gb2ZmIHRhZyBieSBhdXRob3IuCgpTb3JyeSwgZW1haWwgaXNzdWVzIG1lYW50IGkg
c2VudCB0aGUgcGF0Y2ggZnJvbSBhIGRpZmZlcmVudCBhY2NvdW50LgpTaG91bGQgSSByZS1zZW5k
IHRoZQpwYXRjaCBmcm9tIHRoZSBzYW1lIGFjY291bnQgYXMgdGhlIHNpZ24tb2ZmIGxpbmU/IEkn
bSBzdGlsbCB3b3JraW5nIG15CndheSB0aHJvdWdoIHRoZSBrZXJuZWwgcGF0Y2ggcHJvY2Vzcy4K
Cj4KPiBSZWdhcmRzLAo+IENodW4tS3VhbmcuCj4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIHwgMyArKysKPiA+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiA+ID4gPiA+IGluZGV4IGIwNGEzYzJiMTEx
ZTA5Li5mOGZkOGI5OGMzMGUzZCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4gPiA+ID4gQEAgLTIyNCw2ICsyMjQsOSBAQCBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm10a19nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICBleHBlY3RlZCA9IHNn
X2RtYV9hZGRyZXNzKHNnLT5zZ2wpOwo+ID4gPiA+ID4gICAgICAgICBmb3JfZWFjaF9zZyhzZy0+
c2dsLCBzLCBzZy0+bmVudHMsIGkpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIXNn
X2RtYV9sZW4ocykpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+
ID4gPgo+ID4gPiA+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgJ2NvbnRpbnVlJwo+ID4gPgo+ID4g
PiBzY2F0dGVybGlzdC5oIGhhcyB0aGUgY29tbWVudDoKPiA+ID4gLyoKPiA+ID4gICogVGhlc2Ug
bWFjcm9zIHNob3VsZCBiZSB1c2VkIGFmdGVyIGEgZG1hX21hcF9zZyBjYWxsIGhhcyBiZWVuIGRv
bmUKPiA+ID4gICogdG8gZ2V0IGJ1cyBhZGRyZXNzZXMgb2YgZWFjaCBvZiB0aGUgU0cgZW50cmll
cyBhbmQgdGhlaXIgbGVuZ3Rocy4KPiA+ID4gICogWW91IHNob3VsZCBvbmx5IHdvcmsgd2l0aCB0
aGUgbnVtYmVyIG9mIHNnIGVudHJpZXMgZG1hX21hcF9zZwo+ID4gPiAgKiByZXR1cm5zLCBvciBh
bHRlcm5hdGl2ZWx5IHN0b3Agb24gdGhlIGZpcnN0IHNnX2RtYV9sZW4oc2cpIHdoaWNoCj4gPiA+
ICAqIGlzIDAuCj4gPiA+ICAqLwo+ID4gPgo+ID4gPiBTbyBicmVha2luZyBvbiB0aGUgZmlyc3Qg
c2dfZG1hX2xlbihzZykgPT0gMCBhcHBlYXJzIHRvIGJlIChvbmUgb2YpCj4gPiA+IHRoZSBkb2N1
bWVudGVkIGFwcHJvYWNoLgo+ID4gPgo+ID4KPiA+IE9rYXksIHlvdSdyZSByaWdodC4gU28KPiA+
Cj4gPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+
Cj4gPgo+ID4gPiA+Cj4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiBDaHVuLUt1YW5nLgo+ID4gPiA+
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKHNnX2RtYV9hZGRyZXNz
KHMpICE9IGV4cGVjdGVkKSB7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBEUk1f
RVJST1IoInNnX3RhYmxlIGlzIG5vdCBjb250aWd1b3VzIik7Cj4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuMjYu
MS4zMDEuZzU1YmMzZWI3Y2I5LWdvb2cKPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiA+IExp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+ID4gPiA+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+ID4gPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
