Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983E17370E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 13:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CA86E1A3;
	Fri, 28 Feb 2020 12:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D258F6E179
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 12:16:31 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m9so2699579qke.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 04:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jW+oim1VKB75nwiyeU54QJMiA6ZEtr8g9KMSvdI3vz8=;
 b=AykcLh89sWZynHDKkElwfoxjaLKCsJqV1sXME/jD+lPWIn8yQMaVrd05+dRnpy/5is
 PWMq8k5d21GsrzfFNDTWMd9WSK8HXFxKMKCqBe225VEszplUAHOHtC610oFzYAAOrtFl
 hYAHWYGSYsSaGwXKcG9RoBvrDxPfxtXjSUFzz99vzNfuqj6edbpVE9QRu4L8VQPTpzY9
 cXrmtkZrzjcfkrtwHPrJz2J4Ix8KePzJwQ1CpVxrEvYfUR2x5fFrKoUIYNbK+dzAT4Ap
 o7H73mEf8SamKPsHa0GUGbIUfoZUWPrsHcXJCqU72QWv1zhHkizkYuzNfG+BYlymI8dS
 lk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jW+oim1VKB75nwiyeU54QJMiA6ZEtr8g9KMSvdI3vz8=;
 b=D8ktQ++9b4PMQUmIThOF6uoehKnfcs2pnLAhY9fv4uCnVLnGi6xpTWDikUZbgMiM+G
 U0Xn4xuGuLKyHz7UA8/wHiJaICer+aFOE8scstoRvtyqGy94r5WLdPL1NU1EM/0YN+QV
 7G1oatOnNYmQabf/lkY/t1zbIIOTjRSBGGBYF/KpJrKCPrVMMFEc5vSledpUdmDw4suK
 aRcrQwn7i8/LhU4gMOjpTlDiRD37Rk7Pa7MOidj5bjcP7X7NbDs2Y3A6BUMPhsls67zC
 o6BYjBPb67b6YHGQeIS+W2Mts7uvpcQ5cYSUHuy13se1XMAFWUdCHuw005EuysNoCqxY
 yVWQ==
X-Gm-Message-State: APjAAAVhnxNrJZFMF/G8DVGUWMV3dfKJ87t6zrAXOMJStX7TZSbT6gzm
 P0ZcMEQXRoEOKW48CGe0yB1ZVJBuWM3g8/ja2LSB1zhA0HQ=
X-Google-Smtp-Source: APXvYqzMcs4xH83OCydBwkkGvs4VqYu/TjyplsOfHV6hLy/Tvr7wP9fzKzFY0pvTGD1FfhZesOpdLTJ6PMJPcvrLRwE=
X-Received: by 2002:a37:84c6:: with SMTP id g189mr3611903qkd.427.1582892191000; 
 Fri, 28 Feb 2020 04:16:31 -0800 (PST)
MIME-Version: 1.0
References: <20200203121620.9002-1-benjamin.gaignard@st.com>
 <75b302aa739511b3cc2abf4360d5780a08e7c17a.camel@redhat.com>
In-Reply-To: <75b302aa739511b3cc2abf4360d5780a08e7c17a.camel@redhat.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 28 Feb 2020 13:16:20 +0100
Message-ID: <CA+M3ks6xifM2xwx6PR_xuLRYV2GEprtgcM7+_26Z3WbZMRrVeg@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Check crc4 value while building sideband
 message
To: Lyude Paul <lyude@redhat.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWFyLiA0IGbDqXZyLiAyMDIwIMOgIDIwOjAwLCBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPiBhIMOpY3JpdCA6Cj4KPiBSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0
LmNvbT4KPgoKQXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0ClRoYW5rcywKQmVuamFtaW4KCj4gT24g
TW9uLCAyMDIwLTAyLTAzIGF0IDEzOjE2ICswMTAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToK
PiA+IENoZWNrIHRoYXQgY29tcHV0ZWQgY3JjIHZhbHVlIGlzIG1hdGNoaW5nIHRoZSBvbmUgZW5j
b2RlZCBpbiB0aGUgbWVzc2FnZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWln
bmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+ID4gLS0tCj4gPiBDQzogbHl1ZGVAcmVk
aGF0LmNvbQo+ID4gQ0M6IGFpcmxpZWRAbGludXguaWUKPiA+IENDOiBqYW5pLm5pa3VsYUBsaW51
eC5pbnRlbC5jb20KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwg
NCArKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiA+IGluZGV4IDgyMmQyZjE3N2Y5MC4u
ZWVlODk5ZDY3NDJiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
Ywo+ID4gQEAgLTczNiw2ICs3MzYsMTAgQEAgc3RhdGljIGJvb2wgZHJtX2RwX3NpZGViYW5kX21z
Z19idWlsZChzdHJ1Y3QKPiA+IGRybV9kcF9zaWRlYmFuZF9tc2dfcnggKm1zZywKPiA+ICAgICAg
IGlmIChtc2ctPmN1cmNodW5rX2lkeCA+PSBtc2ctPmN1cmNodW5rX2xlbikgewo+ID4gICAgICAg
ICAgICAgICAvKiBkbyBDUkMgKi8KPiA+ICAgICAgICAgICAgICAgY3JjNCA9IGRybV9kcF9tc2df
ZGF0YV9jcmM0KG1zZy0+Y2h1bmssIG1zZy0+Y3VyY2h1bmtfbGVuIC0KPiA+IDEpOwo+ID4gKyAg
ICAgICAgICAgICBpZiAoY3JjNCAhPSBtc2ctPmNodW5rW21zZy0+Y3VyY2h1bmtfbGVuIC0gMV0p
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcHJpbnRfaGV4X2R1bXAoS0VSTl9ERUJVRywgIndy
b25nIGNyYyIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRFVNUF9Q
UkVGSVhfTk9ORSwgMTYsIDEsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbXNnLT5jaHVuaywgIG1zZy0+Y3VyY2h1bmtfbGVuLCBmYWxzZSk7Cj4gPiAgICAgICAgICAg
ICAgIC8qIGNvcHkgY2h1bmsgaW50byBiaWdnZXIgbXNnICovCj4gPiAgICAgICAgICAgICAgIG1l
bWNweSgmbXNnLT5tc2dbbXNnLT5jdXJsZW5dLCBtc2ctPmNodW5rLCBtc2ctPmN1cmNodW5rX2xl
biAtCj4gPiAxKTsKPiA+ICAgICAgICAgICAgICAgbXNnLT5jdXJsZW4gKz0gbXNnLT5jdXJjaHVu
a19sZW4gLSAxOwo+IC0tCj4gQ2hlZXJzLAo+ICAgICAgICAgTHl1ZGUgUGF1bAo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
