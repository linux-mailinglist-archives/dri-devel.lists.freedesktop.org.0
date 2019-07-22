Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F84E7088B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3996C89DD2;
	Mon, 22 Jul 2019 18:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A107A89DD2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:28:16 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id d9so8870313ybf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JgX5jzOgMJw/JhraYqndXZDyUDmBsXfnBjRFxsDkMjY=;
 b=inMpc0D00JPD9ROIXx046JvFOYGiKFT27VcTEppFBfW7Rvsha+DK6n4EmUk+86rMxA
 nUcDKUhUjNNwmEaIx3DMKCFbWFzVm91N+fF0RL1+bPVY/ADy8dnwvREddqyweGwUYOA6
 MF6S8MmnufAcr4yxjmjbsn6+DJxZGhJAGcWe1SDJnevHeSqcehwPJ9zVbuwOS3BpK4xA
 I3aD+y8nGNk1yCejAjfkKaJYhJzrsFO8jKMi6bKTHV1gwUVZang4H3RQNwon2jgqdpQi
 nujJiNXZ9M2S6Eph9CR1P75IbypoRc4y9kpDg0tYRBe4IdSDEXAaF2OA/X8Dvt+LMPRJ
 Ei4A==
X-Gm-Message-State: APjAAAUglzWBrLkopsTAtO1luGhm2w+5bTIZs0fWkQHLkpybu2NGgbFl
 yVOFVThvQDizg1Z+oa6dmM+sLg==
X-Google-Smtp-Source: APXvYqwIuwkvZN1yqCqUBIeW01ebe9YTxeI3by2ceKMw9JOIq4GBgWXaq4ck9oGGZQwkkhBbSQl9dg==
X-Received: by 2002:a25:bcc3:: with SMTP id l3mr33669445ybm.399.1563820095809; 
 Mon, 22 Jul 2019 11:28:15 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id z6sm9485273ywj.97.2019.07.22.11.28.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 11:28:15 -0700 (PDT)
Date: Mon, 22 Jul 2019 14:28:14 -0400
From: Sean Paul <sean@poorly.run>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: fix out-of-bounds access with short VSDB blocks
Message-ID: <20190722182814.GH104440@art_vandelay>
References: <I1AvHeOKt0LxZk5YfvzAd_iDpe5NWuhHNYueQ3Ubp3ilF-69Q8u5Nn_I-mqJt2zPKq1aoy2UsgT5hFUM1KMKVj8qXQHPqlvuVSulRLe1EAI=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <I1AvHeOKt0LxZk5YfvzAd_iDpe5NWuhHNYueQ3Ubp3ilF-69Q8u5Nn_I-mqJt2zPKq1aoy2UsgT5hFUM1KMKVj8qXQHPqlvuVSulRLe1EAI=@emersion.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JgX5jzOgMJw/JhraYqndXZDyUDmBsXfnBjRFxsDkMjY=;
 b=c4kgNzAAOEPhbvq9vpXSpRNvqY2UgZU+l3GxCPqjN7tiS5vaKstJRjnwkpgsgknQ0M
 nEB0W1Y54zrNRr7o7etlBWkpxENThbQ2IQxGtxwghZCQwUBjYlm4OzB1tABu4XksPWJo
 7TfEW4CbQf0BbJierYGxOXNy2nYe5Qmchv3dLHEj8ToR67xzOFZTM4kHR1czfT2xKv1Q
 4lMAovyWzc8CMkhbwvBEKUmRHW8Sj1OvAD3PaoKLw6V44Bt6AUU76qzHaWBT7Spusd0j
 /PWGNyGJtM7srzy/cgFohYHu7EZs6rAYPy5dvG7Wrf5kZ5XstpGufrflFWH195UBQsIC
 tWBw==
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
Cc: Simon Ser <simon.ser@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDI6Mzg6MzRQTSArMDAwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IEZyb206IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KPiAKPiBUaGUgVlNEQiBw
YXJzaW5nIGNvZGUgY29udGFpbnMgYSBmZXcgbGVuID49IE4gY2hlY2tzLCBhY2Nlc3NpbmcgZGJb
Tl0gb24KPiBzdWNjZXNzLiBIb3dldmVyIGlmIGxlbiA9PSBOLCBkYltOXSBpcyBvdXQtb2YtYm91
bmRzLgo+IAo+IFRoaXMgY29tbWl0IGNoYW5nZXMgdGhlIGNoZWNrcyB0byB0ZXN0IGZvciBsZW4g
PiBOLgoKSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoaXMgYXQgYWxsLCBidXQgaXMgZGJbMF0gdGhl
IGhlYWRlciBhbmQgZGJbMV0gdG8gZGJbbGVuXQp0aGUgZGF0YSBibG9jaz8gSW4gdGhhdCBjYXNl
LCBpdCdzIG5vdCBvdXQgb2YgYm91bmRzLgoKSSBsb29rZWQgdXAgdGhlIHNwZWMgYW5kIGl0IHNh
eXM6CiAgICAgICAgIExlbmd0aCBvZiBmb2xsb3dpbmcgZGF0YSBibG9jayAoaW4gYnl0ZXMpICgw
MmgpCgpTZWFuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lv
bi5mcj4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAyNCArKysrKysrKysr
KystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gaW5kZXggODJhNGNlZWQzZmNmLi4xM2Q2MzJm
MTQxNzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IEBAIC0zNTY5LDcgKzM1NjksNyBAQCBkb19oZG1p
X3ZzZGJfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgY29uc3QgdTggKmRi
LCB1OCBsZW4sCj4gIAl2aWNfbGVuID0gZGJbOCArIG9mZnNldF0gPj4gNTsKPiAgCWhkbWlfM2Rf
bGVuID0gZGJbOCArIG9mZnNldF0gJiAweDFmOwo+IAo+IC0JZm9yIChpID0gMDsgaSA8IHZpY19s
ZW4gJiYgbGVuID49ICg5ICsgb2Zmc2V0ICsgaSk7IGkrKykgewo+ICsJZm9yIChpID0gMDsgaSA8
IHZpY19sZW4gJiYgbGVuID4gKDkgKyBvZmZzZXQgKyBpKTsgaSsrKSB7Cj4gIAkJdTggdmljOwo+
IAo+ICAJCXZpYyA9IGRiWzkgKyBvZmZzZXQgKyBpXTsKPiBAQCAtMzk3MSwxMSArMzk3MSwxMSBA
QCBkcm1fcGFyc2VfaGRyX21ldGFkYXRhX2Jsb2NrKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IsIGNvbnN0IHU4ICpkYikKPiAgCWNvbm5lY3Rvci0+aGRyX3NpbmtfbWV0YWRhdGEuaGRt
aV90eXBlMS5tZXRhZGF0YV90eXBlID0KPiAgCQkJCQkJaGRyX21ldGFkYXRhX3R5cGUoZGIpOwo+
IAo+IC0JaWYgKGxlbiA+PSA0KQo+ICsJaWYgKGxlbiA+IDQpCj4gIAkJY29ubmVjdG9yLT5oZHJf
c2lua19tZXRhZGF0YS5oZG1pX3R5cGUxLm1heF9jbGwgPSBkYls0XTsKPiAtCWlmIChsZW4gPj0g
NSkKPiArCWlmIChsZW4gPiA1KQo+ICAJCWNvbm5lY3Rvci0+aGRyX3NpbmtfbWV0YWRhdGEuaGRt
aV90eXBlMS5tYXhfZmFsbCA9IGRiWzVdOwo+IC0JaWYgKGxlbiA+PSA2KQo+ICsJaWYgKGxlbiA+
IDYpCj4gIAkJY29ubmVjdG9yLT5oZHJfc2lua19tZXRhZGF0YS5oZG1pX3R5cGUxLm1pbl9jbGwg
PSBkYls2XTsKPiAgfQo+IAo+IEBAIC0zOTg0LDE5ICszOTg0LDE5IEBAIGRybV9wYXJzZV9oZG1p
X3ZzZGJfYXVkaW8oc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgY29uc3QgdTggKmRi
KQo+ICB7Cj4gIAl1OCBsZW4gPSBjZWFfZGJfcGF5bG9hZF9sZW4oZGIpOwo+IAo+IC0JaWYgKGxl
biA+PSA2ICYmIChkYls2XSAmICgxIDw8IDcpKSkKPiArCWlmIChsZW4gPiA2ICYmIChkYls2XSAm
ICgxIDw8IDcpKSkKPiAgCQljb25uZWN0b3ItPmVsZFtEUk1fRUxEX1NBRF9DT1VOVF9DT05OX1RZ
UEVdIHw9IERSTV9FTERfU1VQUE9SVFNfQUk7Cj4gLQlpZiAobGVuID49IDgpIHsKPiArCWlmIChs
ZW4gPiA4KSB7Cj4gIAkJY29ubmVjdG9yLT5sYXRlbmN5X3ByZXNlbnRbMF0gPSBkYls4XSA+PiA3
Owo+ICAJCWNvbm5lY3Rvci0+bGF0ZW5jeV9wcmVzZW50WzFdID0gKGRiWzhdID4+IDYpICYgMTsK
PiAgCX0KPiAtCWlmIChsZW4gPj0gOSkKPiArCWlmIChsZW4gPiA5KQo+ICAJCWNvbm5lY3Rvci0+
dmlkZW9fbGF0ZW5jeVswXSA9IGRiWzldOwo+IC0JaWYgKGxlbiA+PSAxMCkKPiArCWlmIChsZW4g
PiAxMCkKPiAgCQljb25uZWN0b3ItPmF1ZGlvX2xhdGVuY3lbMF0gPSBkYlsxMF07Cj4gLQlpZiAo
bGVuID49IDExKQo+ICsJaWYgKGxlbiA+IDExKQo+ICAJCWNvbm5lY3Rvci0+dmlkZW9fbGF0ZW5j
eVsxXSA9IGRiWzExXTsKPiAtCWlmIChsZW4gPj0gMTIpCj4gKwlpZiAobGVuID4gMTIpCj4gIAkJ
Y29ubmVjdG9yLT5hdWRpb19sYXRlbmN5WzFdID0gZGJbMTJdOwo+IAo+ICAJRFJNX0RFQlVHX0tN
UygiSERNSTogbGF0ZW5jeSBwcmVzZW50ICVkICVkLCAiCj4gQEAgLTQ1NTksOSArNDU1OSw5IEBA
IGRybV9wYXJzZV9oZG1pX3ZzZGJfdmlkZW8oc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciwgY29uc3QgdTggKmRiKQo+ICAJc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm8gPSAmY29u
bmVjdG9yLT5kaXNwbGF5X2luZm87Cj4gIAl1OCBsZW4gPSBjZWFfZGJfcGF5bG9hZF9sZW4oZGIp
Owo+IAo+IC0JaWYgKGxlbiA+PSA2KQo+ICsJaWYgKGxlbiA+IDYpCj4gIAkJaW5mby0+ZHZpX2R1
YWwgPSBkYls2XSAmIDE7Cj4gLQlpZiAobGVuID49IDcpCj4gKwlpZiAobGVuID4gNykKPiAgCQlp
bmZvLT5tYXhfdG1kc19jbG9jayA9IGRiWzddICogNTAwMDsKPiAKPiAgCURSTV9ERUJVR19LTVMo
IkhETUk6IERWSSBkdWFsICVkLCAiCj4gLS0KPiAyLjIyLjAKPiAKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApTZWFuIFBhdWwsIFNv
ZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
