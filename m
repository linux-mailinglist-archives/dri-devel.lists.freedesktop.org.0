Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0CD4D0AE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608C66E420;
	Thu, 20 Jun 2019 14:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4571C6E420
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 14:47:43 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id p15so3459743qtl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 07:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=78dXNWAh0b4n7bf9SgMxZuEKyay2GprMCd+VXx1nTcU=;
 b=ZboH6QQ0Z0CAVWi16JYxqGyjHBeIRhQA390kSnppYiLp1WN8ktS+dyBsQpUnMQ6hKd
 Zhu3/N2lPP/+1hKq6szrnQLXqKrhHAjZJU6KSkAXSTOkwnttlJJHM/Q2LR9C/cxS4gZo
 De6D+nxTfzmiR7G6TzBqdInTokJxHoYDGwwZ/ZF7LLnvhZ5R3E+FWajNXwsHdAdsyTYh
 7vPh/xgv9645uTxlUbGklmTnZYvkndh9v3DZPtmF+e8HTnAhTPGwgYRTH89qJ0/MUUtk
 KqWbO9dLb58AroXwUNJc2HYb1Zey3OeschBh8DtVMpgciB90pNEAJJ2fCGSyt8kRtCYU
 vwLw==
X-Gm-Message-State: APjAAAWe9ia0O8hX2bLtiTVwbSSuxmjJw6D1/RNORfUsY72fC120dkcu
 2yLXMB1q/cvP+L8JH030y3RSNw==
X-Google-Smtp-Source: APXvYqxDVgFcavWNjb9RdzAUeCAXCqCGUSOHL28ebI/2KSstsJfP+PinIKg9HRlzcNeetcXlXwb2Kg==
X-Received: by 2002:a0c:b4ae:: with SMTP id c46mr40308582qve.230.1561042062296; 
 Thu, 20 Jun 2019 07:47:42 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id o33sm12587288qtk.67.2019.06.20.07.47.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 07:47:41 -0700 (PDT)
Date: Thu, 20 Jun 2019 10:47:41 -0400
From: Sean Paul <sean@poorly.run>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/self_refresh: Fix possible NULL deref in failure path
Message-ID: <20190620144741.GH25413@art_vandelay>
References: <20190619094151.GI18776@kadam>
 <20190619181951.192305-1-sean@poorly.run>
 <20190620112855.GQ12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620112855.GQ12905@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=78dXNWAh0b4n7bf9SgMxZuEKyay2GprMCd+VXx1nTcU=;
 b=Ld2YoSQTnfTObEtP7B5qIqX/0WxId/lnita4Azfcv+tLWO1jcvaOQsPOlC/QgbqR71
 45d4Q1AbvEgD7b03boPBf/wTr/MimoMGJPjqTZK22rgVua/n4Ajkz49vaaEzy9eFGkRA
 HMBxtADrDjGq75DDxgHPHC7MfUL1jGgjrJ1XXwXc9Bt0J5yLs2A6TAdUXuHWNoqMNih2
 3SvGVxpuW6SIOvHTQ3gokvsC4QvFLGG8A2nvhZBNi4gMl7JbpGObLGfG3GJR908bln/T
 dT9+QNb944Y6jNDtyb5gGQihMyQJNQh85ZJ4v2dArFG1GmzF6JwXyXLcZ7/QDnW0xaam
 vzdg==
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
Cc: Zain Wang <wzz@rock-chips.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jose Souza <jose.souza@intel.com>,
 Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMDE6Mjg6NTVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAwMjoxOTo0N1BNIC0wNDAwLCBTZWFuIFBh
dWwgd3JvdGU6Cj4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiA+
IAo+ID4gSWYgc3RhdGUgYWxsb2NhdGlvbiBmYWlscywgd2Ugc3RpbGwgdHJ5IHRvIGdpdmUgYmFj
ayB0aGUgcmVmZXJlbmNlIG9uCj4gPiBpdC4gQWxzbyBpbml0aWFsaXplIHJldCBpbiBjYXNlIHRo
ZSBjcnRjIGlzIG5vdCBlbmFibGVkIGFuZCB3ZSBoaXQgdGhlCj4gPiBlamVjdCBidXR0b24uCj4g
PiAKPiA+IEZpeGVzOiAxNDUyYzI1YjBlNjAgKCJkcm06IEFkZCBoZWxwZXJzIHRvIGtpY2sgb2Zm
IHNlbGYgcmVmcmVzaCBtb2RlIGluIGRyaXZlcnMiKQo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiA+IENjOiBKb3NlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4K
PiA+IENjOiBaYWluIFdhbmcgPHd6ekByb2NrLWNoaXBzLmNvbT4KPiA+IENjOiBUb21hc3ogRmln
YSA8dGZpZ2FAY2hyb21pdW0ub3JnPgo+ID4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgo+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4gQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiBD
YzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiA+IENjOiBTZWFu
IFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gUmVwb3J0
ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IFJldmlld2Vk
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IAoKQXBwbGllZCB0
byAtbWlzYy1uZXh0LCB0aGFua3MhCgpTZWFuCgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9zZWxmX3JlZnJlc2hfaGVscGVyLmMgfCA2ICsrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fc2VsZl9yZWZyZXNoX2hlbHBlci5jCj4gPiBpbmRleCBlMGQyYWQxZjA3MGNiLi40Yjk0
MjRhOGYxZjFjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zZWxmX3JlZnJl
c2hfaGVscGVyLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZyZXNoX2hl
bHBlci5jCj4gPiBAQCAtNjksMTQgKzY5LDE0IEBAIHN0YXRpYyB2b2lkIGRybV9zZWxmX3JlZnJl
c2hfaGVscGVyX2VudHJ5X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ID4gIAlzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubjsKPiA+ICAJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUg
KmNvbm5fc3RhdGU7Cj4gPiAgCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZTsKPiA+
IC0JaW50IGksIHJldDsKPiA+ICsJaW50IGksIHJldCA9IDA7Cj4gPiAgCj4gPiAgCWRybV9tb2Rl
c2V0X2FjcXVpcmVfaW5pdCgmY3R4LCAwKTsKPiA+ICAKPiA+ICAJc3RhdGUgPSBkcm1fYXRvbWlj
X3N0YXRlX2FsbG9jKGRldik7Cj4gPiAgCWlmICghc3RhdGUpIHsKPiA+ICAJCXJldCA9IC1FTk9N
RU07Cj4gPiAtCQlnb3RvIG91dDsKPiA+ICsJCWdvdG8gb3V0X2Ryb3BfbG9ja3M7Cj4gPiAgCX0K
PiA+ICAKPiA+ICByZXRyeToKPiA+IEBAIC0xMTYsNiArMTE2LDggQEAgc3RhdGljIHZvaWQgZHJt
X3NlbGZfcmVmcmVzaF9oZWxwZXJfZW50cnlfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsp
Cj4gPiAgCX0KPiA+ICAKPiA+ICAJZHJtX2F0b21pY19zdGF0ZV9wdXQoc3RhdGUpOwo+ID4gKwo+
ID4gK291dF9kcm9wX2xvY2tzOgo+ID4gIAlkcm1fbW9kZXNldF9kcm9wX2xvY2tzKCZjdHgpOwo+
ID4gIAlkcm1fbW9kZXNldF9hY3F1aXJlX2ZpbmkoJmN0eCk7Cj4gPiAgfQo+ID4gLS0gCj4gPiBT
ZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+ID4gCj4g
Cj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdp
bmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
