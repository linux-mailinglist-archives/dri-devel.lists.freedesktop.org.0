Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C304289C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 16:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61E2892A4;
	Wed, 12 Jun 2019 14:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFEE892A4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 14:19:28 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x47so18643729qtk.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VBW9vmo77p3uLkUSqiglfgJ/6BFkwzlCcG5DBVSwVk4=;
 b=b3OcRuhCVg7qQ+W4l0f9W5CswlVZEDDLoPgTDN6H+AAjQroaNINMEkgpy0YuiPRiub
 /3LWFr+PQv8wi6hDe2WuP3tnsvDgQJggc0ivNI8Q+fTLjXj6KUvbBt1jTxnfNE2eUdtW
 G2bob7RhkwrYpsIwTbz96CkVGNEzAzSimhrJWIMy3ruv4uiTNEipTf8SCG22wPoyevKC
 QU8lYR7XLN65OXgesAdyaf+BnU7MvmaZbC7NtvSYJ7/jeTdKZqN/x9Nb/j/DaIXwcr6I
 0r+NVEQJ2Oliq31tw07gwlqCj4MhuKKvjx2/zWLBv0vuXUwmnk4CqKzDbe9qLaX7ICI8
 Sy9w==
X-Gm-Message-State: APjAAAWTpUkWQGf7E9T+1zgtUQfPGwu819nI67OokfbKmHqw2NAnn/N5
 /eaEZ/Ia2qeNgKmbCINVlAHhWw==
X-Google-Smtp-Source: APXvYqzmBih8YIGa/FSIbOUZP+1o9aN/lNdBOYnAZ28k9Eh/9q5pvN/EsGR+IygHVljOs9OXqA1Sjw==
X-Received: by 2002:ac8:2edc:: with SMTP id i28mr50486256qta.77.1560349167731; 
 Wed, 12 Jun 2019 07:19:27 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id m21sm7594995qtp.92.2019.06.12.07.19.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 07:19:27 -0700 (PDT)
Date: Wed, 12 Jun 2019 10:19:26 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 05/11] drm: Add helpers to kick off self refresh mode
 in drivers
Message-ID: <20190612141926.GE179831@art_vandelay>
References: <20190611160844.257498-1-sean@poorly.run>
 <20190611160844.257498-6-sean@poorly.run>
 <20190611205645.GB18315@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611205645.GB18315@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VBW9vmo77p3uLkUSqiglfgJ/6BFkwzlCcG5DBVSwVk4=;
 b=NIkqoQMvmm51unkBwbIgwaVH7hKHcigtxEq672vVrHrdNyAMzYxJg6TPMqR8uSeC/h
 Rh+A5o+S1FYGefXStqm4ss5tgeYr9+g0FzBFlmzop3EDlFezfwQbGzEXr9unW+nkwEyQ
 1DzZKJwbCR1nSa1CtFJn+4UyM8OJFepN3kqNWx/ZQe4qP/e2Jfv8eOxcaefLnqiBj5O4
 ho2686264YHBvvEvecVU3JChoRoyyZYIX3ZQkA+CymIS3hVlFWoSxpVBjZVPyTM5Rnz9
 Da+m8UA4qLO4Ycl08IQuJBzFXCmSXXOwnuhr23KapLTOHqffLU1Jsu8uchFU0w57l15S
 3j7w==
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
Cc: Zain Wang <wzz@rock-chips.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>,
 Jose Souza <jose.souza@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTA6NTY6NDVQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIFNlYW4uCj4gCj4gU21hbGwgdGhpbmdzIGhlcmUgYW5kIHRoZXJlLiBEaWQgbm90
IHN0YXJlIGF0IHRoaXMgbG9uZyBlbm91Z2ggdG8KPiB1bmRlcnN0YW5kIHRoZSBjb2RlLCBidXQg
YWRkZWQgc29tZSBmZWVkYmFjayBhbnl3YXkuCgpUaGFua3MgZm9yIHRoZSBjb21tZW50cywgU2Ft
LCBJJ2xsIHNlbmQgYSByZXZpc2lvbiBzaG9ydGx5Cgo+IAo+IAlTYW0KPiA+ICAKCi9zbmlwCgo+
ID4gK3N0YXRpYyB2b2lkIGRybV9zZWxmX3JlZnJlc2hfaGVscGVyX2VudHJ5X3dvcmsoc3RydWN0
IHdvcmtfc3RydWN0ICp3b3JrKQo+ID4gK3sKPiA+ICsJc3RydWN0IGRybV9zZWxmX3JlZnJlc2hf
ZGF0YSAqc3JfZGF0YSA9IGNvbnRhaW5lcl9vZigKPiA+ICsJCQkJdG9fZGVsYXllZF93b3JrKHdv
cmspLAo+ID4gKwkJCQlzdHJ1Y3QgZHJtX3NlbGZfcmVmcmVzaF9kYXRhLCBlbnRyeV93b3JrKTsK
PiA+ICsJc3RydWN0IGRybV9jcnRjICpjcnRjID0gc3JfZGF0YS0+Y3J0YzsKPiA+ICsJc3RydWN0
IGRybV9kZXZpY2UgKmRldiA9IGNydGMtPmRldjsKPiA+ICsJc3RydWN0IGRybV9tb2Rlc2V0X2Fj
cXVpcmVfY3R4IGN0eDsKPiA+ICsJc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlOwo+ID4g
KwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubjsKPiA+ICsJc3RydWN0IGRybV9jb25uZWN0b3Jf
c3RhdGUgKmNvbm5fc3RhdGU7Cj4gPiArCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0
ZTsKPiA+ICsJaW50IGksIHJldDsKPiBUaGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBmcm9tIGEgd29y
a3F1ZXVlLgo+IEp1c3Qgd29uZGVyaW5nIGlmIHRoaXMgcmVxdWlyZSBhbnkgbG9ja2luZz8KClll
cywgaXQgZG9lcy4gVGhlIGxvY2tzIGFyZSBhY3F1aXJlZCBpbiB0aGUgdmFyaW91cyBkcm1fYXRv
bWljX2dldF8qX3N0YXRlKCkKZnVuY3Rpb24gY2FsbHMgYW5kIGRyb3BwZWQgYmVsb3cgaW4gdGhl
IG91dCBsYWJlbCAoZHJtX21vZGVzZXRfZHJvcF9sb2NrcykuCgo+IChNYXliZSBJIG1pc3NlZCBp
dCwgYnJvd3NlZCB0aGUgY29kZSB3aXRob3V0IGEgZGV0YWlsZWQgcmV2aWV3KQo+IAo+ID4gKwo+
ID4gKwlkcm1fbW9kZXNldF9hY3F1aXJlX2luaXQoJmN0eCwgMCk7Cj4gPiArCj4gPiArCXN0YXRl
ID0gZHJtX2F0b21pY19zdGF0ZV9hbGxvYyhkZXYpOwo+ID4gKwlpZiAoIXN0YXRlKSB7Cj4gPiAr
CQlyZXQgPSAtRU5PTUVNOwo+ID4gKwkJZ290byBvdXQ7Cj4gPiArCX0KPiA+ICsKPiA+ICtyZXRy
eToKPiA+ICsJc3RhdGUtPmFjcXVpcmVfY3R4ID0gJmN0eDsKPiA+ICsKPiA+ICsJY3J0Y19zdGF0
ZSA9IGRybV9hdG9taWNfZ2V0X2NydGNfc3RhdGUoc3RhdGUsIGNydGMpOwo+ID4gKwlpZiAoSVNf
RVJSKGNydGNfc3RhdGUpKSB7Cj4gPiArCQlyZXQgPSBQVFJfRVJSKGNydGNfc3RhdGUpOwo+ID4g
KwkJZ290byBvdXQ7Cj4gPiArCX0KPiA+ICsKPiA+ICsJaWYgKCFjcnRjX3N0YXRlLT5lbmFibGUp
Cj4gPiArCQlnb3RvIG91dDsKPiA+ICsKPiA+ICsJcmV0ID0gZHJtX2F0b21pY19hZGRfYWZmZWN0
ZWRfY29ubmVjdG9ycyhzdGF0ZSwgY3J0Yyk7Cj4gPiArCWlmIChyZXQpCj4gPiArCQlnb3RvIG91
dDsKPiA+ICsKPiA+ICsJZm9yX2VhY2hfbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShzdGF0ZSwgY29u
biwgY29ubl9zdGF0ZSwgaSkgewo+ID4gKwkJaWYgKCFjb25uX3N0YXRlLT5zZWxmX3JlZnJlc2hf
YXdhcmUpCj4gPiArCQkJZ290byBvdXQ7Cj4gPiArCX0KPiA+ICsKPiA+ICsJY3J0Y19zdGF0ZS0+
YWN0aXZlID0gZmFsc2U7Cj4gPiArCWNydGNfc3RhdGUtPnNlbGZfcmVmcmVzaF9hY3RpdmUgPSB0
cnVlOwo+ID4gKwo+ID4gKwlyZXQgPSBkcm1fYXRvbWljX2NvbW1pdChzdGF0ZSk7Cj4gPiArCWlm
IChyZXQpCj4gPiArCQlnb3RvIG91dDsKPiA+ICsKPiA+ICtvdXQ6Cj4gPiArCWlmIChyZXQgPT0g
LUVERUFETEspIHsKPiA+ICsJCWRybV9hdG9taWNfc3RhdGVfY2xlYXIoc3RhdGUpOwo+ID4gKwkJ
cmV0ID0gZHJtX21vZGVzZXRfYmFja29mZigmY3R4KTsKPiA+ICsJCWlmICghcmV0KQo+ID4gKwkJ
CWdvdG8gcmV0cnk7Cj4gPiArCX0KPiA+ICsKPiA+ICsJZHJtX2F0b21pY19zdGF0ZV9wdXQoc3Rh
dGUpOwo+ID4gKwlkcm1fbW9kZXNldF9kcm9wX2xvY2tzKCZjdHgpOwo+ID4gKwlkcm1fbW9kZXNl
dF9hY3F1aXJlX2ZpbmkoJmN0eCk7Cj4gPiArfQo+ID4gKwoKL3NuaXAKCi0tIApTZWFuIFBhdWws
IFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
