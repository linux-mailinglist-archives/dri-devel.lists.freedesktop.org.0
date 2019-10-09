Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3101D1226
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 17:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5414F6E0DC;
	Wed,  9 Oct 2019 15:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8760A6E9DB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 15:11:00 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a15so2363090edt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 08:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=C7vV5Ta7kiN+Jx0dsp84oi99P0gny8OqQ+rZiWxEBQk=;
 b=m6L5x1/+1DVZdsSsLRF0qfo6Ubt06e1V6HB1P+gBZsgRRgPMTNx5YNOx1XzmmquxNW
 6fMwfBpxhIibPaRgDaMXtLnc/o7rT4fxkZu0icnSYOyjzTLTbEGNyB4YQFHFm9DXL+Md
 +VeQ5zpBt7GKv/qN2+0agWPga64H3uk0PJ3UWSBq6ZOXvFkJIIhfq8482s3642AmRW57
 Nnd3S+RpTYL5PooC94DsfANw9Xwsr0OAMAbf9Rs2YrlzCxadvQb4Z/0Uw34npFGELpnf
 mNreNVfyHIeIIVHT/+GMqQCXHISoHkshlr1Dl8G9snVDWAQBuWagZHO9xNPxgVr2ukbj
 9vmg==
X-Gm-Message-State: APjAAAWjHETgaCbOgym1pqHwwmFWa7QKdHthfKAXNUfNQk7EDRniSY1E
 QG2TU/DjkMG5Nw8NjXiiyCadZg==
X-Google-Smtp-Source: APXvYqwTrH8nNXFpjqBvvrCTsz5k53RaNmz8K/Y+gt0Ek91OqtHE2k0ZinvAPu2kUyysshLL7Ub7ZQ==
X-Received: by 2002:a50:955e:: with SMTP id v30mr3455881eda.221.1570633859068; 
 Wed, 09 Oct 2019 08:10:59 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u27sm395824edb.48.2019.10.09.08.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 08:10:43 -0700 (PDT)
Date: Wed, 9 Oct 2019 17:10:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 2/3] drm/komeda: Add drm_ctm_to_coeffs()
Message-ID: <20191009151024.GF16989@phenom.ffwll.local>
Mail-Followup-To: Ilia Mirkin <imirkin@alum.mit.edu>,
 Brian Starkey <Brian.Starkey@arm.com>, nd <nd@arm.com>,
 "Oscar Zhang (Arm Technology China)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 "Channing Chen (Arm Technology China)" <Channing.Chen@arm.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 "Yiqi Kang (Arm Technology China)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
References: <20190930045408.8053-1-james.qian.wang@arm.com>
 <20190930045408.8053-3-james.qian.wang@arm.com>
 <20190930110438.6w7jtw2e5s2ykwnd@DESKTOP-E1NTVVP.localdomain>
 <CAKb7UviDMLLJWZYV_aW2odJBfmSA8pH7TVuU7T9qpuy1713-EA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UviDMLLJWZYV_aW2odJBfmSA8pH7TVuU7T9qpuy1713-EA@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=C7vV5Ta7kiN+Jx0dsp84oi99P0gny8OqQ+rZiWxEBQk=;
 b=hXnr3vL6PO1kH7F2wkslm/RjNKmVZY3XVz7tO/PS0bz12ywGqTlC5upN53sDakhHDT
 sUpY7UqPN9Y3i8wY737vRCcuFbf1YUDlTXhLR8ZFofzKJM3wJVCjWUGUnfWJan8SPniv
 VzpE+kX1ak69oMF6G597TNJCDR99bgGvUhbS0=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDc6NTY6MTNBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gT24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgNzowNSBBTSBCcmlhbiBTdGFya2V5IDxCcmlh
bi5TdGFya2V5QGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEphbWVzLAo+ID4KPiA+IE9uIE1v
biwgU2VwIDMwLCAyMDE5IGF0IDA0OjU0OjQxQU0gKzAwMDAsIGphbWVzIHFpYW4gd2FuZyAoQXJt
IFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiBUaGlzIGZ1bmN0aW9uIGlzIHVzZWQgdG8g
Y29udmVydCBkcm1fY29sb3JfY3RtIFMzMS4zMiBzaWduLW1hZ25pdHVkZQo+ID4gPiB2YWx1ZSB0
byBrb21lZGEgcmVxdWlyZWQgUTIuMTIgMidzIGNvbXBsZW1lbnQKPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFp
YW4ud2FuZ0Bhcm0uY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NvbG9yX21nbXQuYyAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gIC4u
Li9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaCAgICB8ICAxICsKPiA+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5j
Cj4gPiA+IGluZGV4IGMxODBjZTcwYzI2Yy4uYzkyYzgyZWViZGRiIDEwMDY0NAo+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMK
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29s
b3JfbWdtdC5jCj4gPiA+IEBAIC0xMTcsMyArMTE3LDMwIEBAIHZvaWQgZHJtX2x1dF90b19mZ2Ft
bWFfY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZz
KQo+ID4gPiAgewo+ID4gPiAgICAgICBkcm1fbHV0X3RvX2NvZWZmcyhsdXRfYmxvYiwgY29lZmZz
LCBzZWN0b3JfdGJsLCBBUlJBWV9TSVpFKHNlY3Rvcl90YmwpKTsKPiA+ID4gIH0KPiA+ID4gKwo+
ID4gPiArLyogQ29udmVydCBmcm9tIFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBIVyBRMi4xMiAy
J3MgY29tcGxlbWVudCAqLwo+ID4gPiArc3RhdGljIHMzMiBkcm1fY3RtX3MzMV8zMl90b19xMl8x
Mih1NjQgaW5wdXQpCj4gPiA+ICt7Cj4gPiA+ICsgICAgIHU2NCBtYWcgPSAoaW5wdXQgJiB+QklU
X1VMTCg2MykpID4+IDIwOwo+ID4gPiArICAgICBib29sIG5lZ2F0aXZlID0gISEoaW5wdXQgJiBC
SVRfVUxMKDYzKSk7Cj4gPiA+ICsgICAgIHUzMiB2YWw7Cj4gPiA+ICsKPiA+ID4gKyAgICAgLyog
dGhlIHJhbmdlIG9mIHNpZ25lZCAycyBjb21wbGVtZW50IGlzIFstMl5uLCAyXm4gLSAxXSAqLwo+
ID4gPiArICAgICB2YWwgPSBjbGFtcF92YWwobWFnLCAwLCBuZWdhdGl2ZSA/IEJJVCgxNCkgOiBC
SVQoMTQpIC0gMSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgcmV0dXJuIG5lZ2F0aXZlID8gMCAtIHZh
bCA6IHZhbDsKPiA+ID4gK30KPiA+Cj4gPiBUaGlzIGZ1bmN0aW9uIGxvb2tzIGdlbmVyYWxseSB1
c2VmdWwuIFNob3VsZCBpdCBiZSBpbiBEUk0gY29yZQo+ID4gKGFzc3VtaW5nIHRoZXJlIGlzbid0
IGFscmVhZHkgb25lIHRoZXJlKT8KPiA+Cj4gPiBZb3UgY2FuIHVzZSBhIHBhcmFtZXRlciB0byBk
ZXRlcm1pbmUgdGhlIG51bWJlciBvZiBiaXRzIGRlc2lyZWQgaW4gdGhlCj4gPiBvdXRwdXQuCj4g
Cj4gSSBzdXNwZWN0IGV2ZXJ5IGRyaXZlciBuZWVkcyB0byBkbyBzb21ldGhpbmcgc2ltaWxhci4g
WW91IGNhbiBzZWUgd2hhdAo+IEkgZGlkIGZvciBub3V2ZWF1IGhlcmU6Cj4gCj4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L2NvbW1pdC8/aWQ9ODhiNzAzNTI3YmE3MDY1OTM2NWQ5ODlmMjk1NzlmMTI5MmViZjljMwo+IAo+
IChsb29rIGZvciBjc2NfZHJtX3RvX2Jhc2UpCj4gCj4gV291bGQgYmUgZ3JlYXQgdG8gaGF2ZSBh
IGNvbW1vbiBoZWxwZXIgd2hpY2ggY29ycmVjdGx5IGFjY291bnRzIGZvcgo+IGFsbCB0aGUgdmFy
aWFiaWxpdHkuCgpZZWFoIHRoZSBzaWduLWJpdCAzMS4zMiBmaXhlZCBwb2ludCBmb3JtYXQgaXMg
cHJvYmFibHkgdGhlIG1vc3QgbHVkaWNyb3VzCnVhcGkgZnVtYmxlIHdlJ3ZlIGV2ZXIgZG9uZS4g
QSBzaGFyZWQgZnVuY3Rpb24sIHJvbGxlZCBvdXQgdG8gZHJpdmVycywgdG8Kc3dpdGNoIGl0IHRv
IGEgc2lnbmVkIDIgY29tcGxlbWVudHMgaW50ZWdlciBzb3VuZHMgbGlrZSBhIF92ZXJ5XyBnb29k
CmlkZWEuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
