Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1557D2A93
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4664B6EB30;
	Thu, 10 Oct 2019 13:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ACD6EB2A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:13:24 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id s7so1910746ybq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 06:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lPUoYQxZyPgy6cMBZcypdWlf69r2dSAMQKiUwUDOqmg=;
 b=V7RWiA+VOWxWdHwt/D3amCibmPPBeHlenOZMMQbj4xO7L9iJnE/fAKc6+Dv/EBMhNM
 WuHbKQ0J4WLGZTZ1/Z1pV9TrNQS6KEZ5PlFwm2Mcn+FW2cv3xMCDjPUn59Y6vDwQ+NBL
 jL3rVrT2Q7bFVTKLekn+hqvgk4pmyK39PYqF6YANF6u1+TBNiayGnpol6z+R/Qj/5jI2
 CGc91tIiY+ArkaExwP21AY3/87PYAOTLDhoUGy6O+XFlXzjsMzjHP7bJ3gauKBGfO1l/
 WwVs/OG8I578AjjIFUuM/Od5616lSSZsFPiftpIJi74PB95rLfOSj5MINw0vlm5u8Uoc
 YjiQ==
X-Gm-Message-State: APjAAAXBrRtnggNAnEkhQlaB4CxXkvu0kczKXFhlMgjYNeMKXk5jKNC8
 AMbZGYZlHwbse4/Qj5LPEp00Yg==
X-Google-Smtp-Source: APXvYqw6lNLeKIG/QVCUCrhOe+WUcZLbsbst+nyYSND8iMRRXvFEdh9N3i1diRKJKHEyCQjbJtRHSA==
X-Received: by 2002:a25:7a47:: with SMTP id v68mr6211821ybc.438.1570713203791; 
 Thu, 10 Oct 2019 06:13:23 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v40sm1302001ywh.109.2019.10.10.06.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 06:13:23 -0700 (PDT)
Date: Thu, 10 Oct 2019 09:13:22 -0400
From: Sean Paul <sean@poorly.run>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 16/24] drm/msm: dpu: Add modeset lock checks where
 applicable
Message-ID: <20191010131322.GI85762@art_vandelay>
References: <20181116184238.170034-1-sean@poorly.run>
 <20181116184238.170034-17-sean@poorly.run>
 <CAKMK7uEx2fL69jPGXVpQhhcj8Q8zEzb3ogCv-uVyGrX3QYFeWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEx2fL69jPGXVpQhhcj8Q8zEzb3ogCv-uVyGrX3QYFeWQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lPUoYQxZyPgy6cMBZcypdWlf69r2dSAMQKiUwUDOqmg=;
 b=CyaD597+jmcwXVaBYnS6aJwAwm/fMZz40b01867553jRikQDWPoHVhMEe9mkbqWB7Q
 gYOXPUHIt8H5m20xFl2lBrRoFtaRk1qPC7guMRYHx/8+n2mNXrA0uTEq/xgHb0rVu54R
 GbQWLrEw/BFA+XKQznEBIFLBrl5KnUpffHjF2FYW+p+jaB0zD44/SbfTTA0+hjDJdD4u
 9ufRMYMnXjUINM00BVWl8xzIxLM4wEDwRTstlS6MvALTzR6PHCLT6jI53LiAtvjMzM38
 VCAFDLFxahRyNnULFwVvijtTmLyzvUkNzNNUaVffFKJziiV7dXVSbFAEeSkIPUTnL9gb
 /Pxg==
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
Cc: Sean Paul <seanpaul@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTI6MjA6NTZBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE5vdiAxNiwgMjAxOCBhdCA3OjQ0IFBNIFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9t
aXVtLm9yZz4KPiA+Cj4gPiBBZGQgbW9kZXNldCBsb2NrIGNoZWNrcyB0byBmdW5jdGlvbnMgdGhh
dCBjb3VsZCBiZSBjYWxsZWQgb3V0c2lkZSB0aGUKPiA+IGNvcmUgYXRvbWljIHN0YWNrLgo+ID4K
PiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAtIE5vbmUKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTZWFu
IFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMgfCAyICsrCj4gPiAgZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2ttcy5jICB8IDEgKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5j
Cj4gPiBpbmRleCBhMDA4YTg3YTgxMTMuLmNkMGEwYmVhNDMzNSAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMKPiA+IEBAIC0yODQsNiArMjg0LDggQEAg
ZW51bSBkcHVfaW50Zl9tb2RlIGRwdV9jcnRjX2dldF9pbnRmX21vZGUoc3RydWN0IGRybV9jcnRj
ICpjcnRjKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBJTlRGX01PREVfTk9ORTsKPiA+ICAg
ICAgICAgfQo+ID4KPiA+ICsgICAgICAgV0FSTl9PTighZHJtX21vZGVzZXRfaXNfbG9ja2VkKCZj
cnRjLT5tdXRleCkpOwo+ID4gKwo+ID4gICAgICAgICAvKiBUT0RPOiBSZXR1cm5zIHRoZSBmaXJz
dCBJTlRGX01PREUsIGNvdWxkIHRoZXJlIGJlIG11bHRpcGxlIHZhbHVlcz8gKi8KPiA+ICAgICAg
ICAgZHJtX2Zvcl9lYWNoX2VuY29kZXJfbWFzayhlbmNvZGVyLCBjcnRjLT5kZXYsIGNydGMtPnN0
YXRlLT5lbmNvZGVyX21hc2spCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGRwdV9lbmNvZGVy
X2dldF9pbnRmX21vZGUoZW5jb2Rlcik7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2ttcy5jCj4gPiBpbmRleCA2NDEzNGQ2MTk3NDguLjUxMDRmYzAxMTQ3ZSAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCj4gPiBAQCAtMzU4LDYgKzM1
OCw3IEBAIHZvaWQgZHB1X2ttc19lbmNvZGVyX2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIpCj4gPiAgICAgICAgIGlmIChmdW5jcyAmJiBmdW5jcy0+Y29tbWl0KQo+ID4gICAgICAg
ICAgICAgICAgIGZ1bmNzLT5jb21taXQoZW5jb2Rlcik7Cj4gPgo+ID4gKyAgICAgICBXQVJOX09O
KCFkcm1fbW9kZXNldF9pc19sb2NrZWQoJmRldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRl
eCkpOwo+ID4gICAgICAgICBkcm1fZm9yX2VhY2hfY3J0YyhjcnRjLCBkZXYpIHsKPiA+ICAgICAg
ICAgICAgICAgICBpZiAoIShjcnRjLT5zdGF0ZS0+ZW5jb2Rlcl9tYXNrICYgZHJtX2VuY29kZXJf
bWFzayhlbmNvZGVyKSkpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAK
PiBJJ20gZmFpcmx5IHN1cmUgdGhpcyBpcyBjYWxsZWQgaW4gdGhlIGF0b21pY19jb21taXQgcGF0
aCwgYW5kIGluIHRoZXJlCj4geW91IG1pZ2h0IG5vdCBhY3R1YWxseSBob2xkIHRoZXNlIGxvY2tz
IChpZiB5b3UgZG8gYSBub25ibG9ja2luZwo+IG1vZGVzZXQpLgoKSW5kZWVkLiBJJ20gbm90IHN1
cmUgd2hhdCBteSB0aGlua2luZyB3YXMgd2hlbiBzdWJtaXR0aW5nIHRoaXMsIEkgdGhpbmsgc29t
ZSBvZgp0aGUgY2FsbHNpdGVzIG1heSBoYXZlIGNoYW5nZWQgc2luY2UgdGhpcyB3YXMgcG9zdGVk
ICh3aXRoIHRoZSBlbmFibGUvcHJvYmUKcmVmYWN0b3JzIGZyb20gYSBmZXcgbW9udGhzIGFnbyku
IEF0IGFueSByYXRlLCBkb2Vzbid0IG1hdHRlciBub3csIEknbGwgcG9zdCB0aGUKcmV2ZXJ0IDot
KQoKPiAKPiBUaGUgbG9ja2luZyBydWxlcyBmb3IgLT5zdGF0ZSBhcmUgcHJldHR5IGZ1bjogRWl0
aGVyIGhvbGQgdGhlIGxvY2ssIG9yCj4gYmUgaW4gYXRvbWljIGNvbW1pdC4gSW4gdGhlIGxhdGVy
IGNhc2UgYXRvbWljIGhlbHBlcnMnIGNvbW1pdCBvcmRlcmluZwo+IGd1YXJhbnRlZXMgdGhhdCB5
b3UgY2FuIHNhZmVseSBhY2Nlc3MgLT5zdGF0ZSAoYnV0IHJlYWQtb25seSBvbmx5KQo+IHdpdGhv
dXQgaG9kbGluZyBhbnkgbG9ja3MuIFlvdSBtaWdodCB3YW50IHRvIHJldmVydC4KPiAKPiBEb24n
dCBhc2sgd2h5IEkgc3R1bWJsZWQgb3ZlciB0aGlzLgoKT2ssIEknbGwganVzdCBhc3N1bWUgdGhh
dCB5b3UgcmVhZCBzZWFucGF1bCdzIDExLW1vbnRoIG9sZCByZXZpZXdzIGJlZm9yZSBiZWQgdG8K
cmVsYXggOy0pCgpTZWFuCgoKPiAtRGFuaWVsCj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ICs0MSAoMCkgNzkgMzY1IDU3IDQ4IC0g
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
