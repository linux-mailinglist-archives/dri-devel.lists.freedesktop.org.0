Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCDB47A8E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19660891AF;
	Mon, 17 Jun 2019 07:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F3289154
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 03:43:04 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 196so4972914pgc.6
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 20:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=taZZTmqZDJ/thPE/pxrihvxmQccJO4Nc9IvueiEvDBc=;
 b=Q7l3KVhDRF/Dbf1kzAacU5FWy69OED6zoMt9cI1kP7lz3o1/2Ozksp+EBmqhrhGAFD
 L4HyoQZpzdvFnEfcPprt+lOWGQ2f9FJitsINh+m43xdPRZ8M7dm1bkmuGbn4Mg0t4j41
 d7uGAHoVn325YipZCDGc7HVTiq0sj4cyOzAzGMVNDSZfJc/7rw+B7IVKP0P6aXPhuO7H
 miaJUtvmC9AXQ3nSLZtCaBMKLdkObUW6183bpTNDnOaBlG/kbvGGLztcpUt0GWlJhBvn
 E/dUHqtUUhcntVehBzP2mUn6C8oVqRXxSriLZFQF8hwwil7CiNscDDBPWL8X8zDkqn49
 j+sg==
X-Gm-Message-State: APjAAAU7YBskNHYse8YR2OO5c7uuonuA/y/v9lUhj6jfylj+A/HqgSYa
 y3AW/zUyozL/bswZ0d8hgtooBw==
X-Google-Smtp-Source: APXvYqxi14hXWZ21/68Cghl+12pHyJ8hnJvsh96H3bdcGwm+nFCpyQijLNQF3h2LfUM4gAlDChUV4A==
X-Received: by 2002:aa7:9ad2:: with SMTP id x18mr31710822pfp.192.1560742983352; 
 Sun, 16 Jun 2019 20:43:03 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id f7sm8791031pfd.43.2019.06.16.20.43.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 20:43:02 -0700 (PDT)
Date: Sun, 16 Jun 2019 20:43:51 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 6/6] drm/msm/gpu: add ocmem init/cleanup functions
Message-ID: <20190617034351.GA750@tuxbook-pro>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-7-masneyb@onstation.org>
 <20190616180633.GS22737@tuxbook-pro>
 <20190617001851.GA19038@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617001851.GA19038@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 17 Jun 2019 07:13:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=taZZTmqZDJ/thPE/pxrihvxmQccJO4Nc9IvueiEvDBc=;
 b=LizGSr8PfLFiYmns24CLOA6uq9rPTN5J9LMubsnAbQe9RV6tkwJrBNTXdptYXq5mw6
 2vnAvivFmjogvwYbXezf+fKUXJcvI0ecCe2WwoN+nfbyRhMIXvBOmBsgZXZt3TBt/2fj
 2bHdNuQrZjAK3MXJeXs7UjYdTfWqIl3/vAdFohqW2i07pgBld5KNgDuU+Y7o/0NxgqMZ
 7Oh3ewUcSgElC1cHriL60uKCNP919CvPmoBjHYgMoQydxVUWR5Og1bbD6uU7nkS8isH4
 /0119BZ4/nBZy7YDTKG+phwyoX7Ze8Npbz4FRbVFGK964mxOh8Yds774GqIya6KgN5uK
 zQsg==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, david.brown@linaro.org,
 agross@kernel.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuIDE2IEp1biAxNzoxOCBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgoKPiBIaSBC
am9ybiwKPiAKPiBPbiBTdW4sIEp1biAxNiwgMjAxOSBhdCAxMTowNjozM0FNIC0wNzAwLCBCam9y
biBBbmRlcnNzb24gd3JvdGU6Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2FkcmVuby9hZHJlbm9fZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9f
Z3B1LmMKPiA+ID4gaW5kZXggNmY3ZjQxMTRhZmNmLi5lMGE5NDA5YzhhMzIgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYwo+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMKPiA+ID4gQEAgLTI5LDYg
KzI5LDEwIEBACj4gPiA+ICAjaW5jbHVkZSAibXNtX2dlbS5oIgo+ID4gPiAgI2luY2x1ZGUgIm1z
bV9tbXUuaCIKPiA+ID4gIAo+ID4gPiArI2lmZGVmIENPTkZJR19RQ09NX09DTUVNCj4gPiA+ICsj
ICBpbmNsdWRlIDxzb2MvcWNvbS9vY21lbS5oPgo+ID4gPiArI2VuZGlmCj4gPiAKPiA+IFRoaXMg
ZmlsZSBleGlzdHMgKGFmdGVyIHRoZSBwcmV2aW91cyBwYXRjaCksIHNvIG5vIG5lZWQgdG8gbWFr
ZSBpdHMKPiA+IGluY2x1c2lvbiBjb25kaXRpb25hbC4KPiA+IAo+ID4gPiArCj4gPiA+ICBzdGF0
aWMgYm9vbCB6YXBfYXZhaWxhYmxlID0gdHJ1ZTsKPiA+ID4gIAo+ID4gPiAgc3RhdGljIGludCB6
YXBfc2hhZGVyX2xvYWRfbWR0KHN0cnVjdCBtc21fZ3B1ICpncHUsIGNvbnN0IGNoYXIgKmZ3bmFt
ZSwKPiA+ID4gQEAgLTg5Nyw2ICs5MDEsNDMgQEAgc3RhdGljIGludCBhZHJlbm9fZ2V0X3B3cmxl
dmVscyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+ICAJcmV0dXJuIDA7Cj4gPiA+ICB9Cj4gPiA+
ICAKPiA+ID4gK2ludCBhZHJlbm9fZ3B1X29jbWVtX2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgYWRyZW5vX2dwdSAqYWRyZW5vX2dwdSwKPiA+ID4gKwkJCSAgc3RydWN0IGFkcmVub19v
Y21lbSAqYWRyZW5vX29jbWVtKQo+ID4gPiArewo+ID4gPiArI2lmZGVmIENPTkZJR19RQ09NX09D
TUVNCj4gPiAKPiA+IE5vIG5lZWQgdG8gbWFrZSB0aGlzIGNvbmRpdGlvbmFsLgo+IAo+IEkgaGF2
ZSB0aGVzZSAjaWZkZWZzIGZvciB0aGUgYTV4eCBhbmQgYTZ4eCBHUFVzIHRoYXQgZG9uJ3QgaGF2
ZSBvY21lbQo+IGluIHRoZSBTb0MuIFdpdGhvdXQgdGhlICNpZmRlZnMsIHRob3NlIHN5c3RlbXMg
d291bGQgbmVlZCB0byBoYXZlIHRoZQo+IG9jbWVtIGRyaXZlciBpbiB0aGVpciBrZXJuZWwuCj4g
CgpJbiBvcmRlciB0byBwcm92aWRlIHRoZSBtZWFucyBmb3IgY29tcGlsaW5nIGEga2VybmVsIGZv
ciBhWzU2XXh4IHdpdGhvdXQKaGF2aW5nIHRvIGNvbXBpbGUgb2NtZW0geW91IHNob3VsZCBtb3Zl
IHRoZXNlICNpZmRlZiB0byB0aGUgb2NtZW0KaGVhZGVyIGZpbGUgYW5kIHByb3ZpZGUgc3RhdGlj
IGlubGluZSBkdW1taWVzIGZvciB0aGUgY2FzZSB3aGVuIGl0J3MKbm90LgoKKGFuZCB1c2UgI2lm
IElTX0VOQUJMRUQoQ09ORklHX0ZPTykpCgpEb24ndCBmb3JnZXQgdG8gYWRkCglkZXBlbmRzIG9u
IFFDT01fT0NNRU0gfHwgUUNPTV9PQ01FTT1uCgp0byB0aGUgRFJNX01TTSBjb25maWcgb3B0aW9u
LCB0byBhbGxvdyB0aGUgZHJpdmVyIHBhaXIgdG8gYmUgc2VsZWN0ZWQgaW4KYWxsIHBvc3NpYmxl
IHdheXMuCgo+IFRoYW5rcyBmb3IgdGhlIHF1aWNrIHJldmlldyBvbiB0aGUgcGF0Y2ggc2V0IQo+
IAoKUmVnYXJkcywKQmpvcm4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
