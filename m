Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074583461B8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 15:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166936E906;
	Tue, 23 Mar 2021 14:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6DA6E8FD;
 Tue, 23 Mar 2021 14:45:43 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id f9so17260544oiw.5;
 Tue, 23 Mar 2021 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ot2VgT3jS1mJCKLMJwUsvVHjYoW0mNerejw5COyXqTQ=;
 b=EFm7H+qo+cSFqvwSwjlazg8pGbQ8pMT2IKzgMKHkP0J6vL9fj6dV975WB6xO0CvlaS
 vHD41m+HrRdVjXBf3BM794Jh0Jilxdbw+3chbj0ImAfrw+QBNmAed96dvYT+AI+UnB16
 61dp8tvaR/C4RP0k0A2QPwgt7Ds/Y/5HLD7r0doY84uFZWNHNLawtd5bziC8cBLVYqzG
 sv81bsudTnTpV9d/zVqbE+V9vU69jMCxPWU6sHfFC4QjMULQR/lQzzOiKcb25KI/8MgK
 HW6y3HQyZgslBWaD+h+QTjoC657TTk4FN/Ay0S9ppVUGX3OhQvaYkHAlTWFt6rANAp/i
 208A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ot2VgT3jS1mJCKLMJwUsvVHjYoW0mNerejw5COyXqTQ=;
 b=SZwKNxs31QJ5eg5hWl/rZTEq5+aHaRVyXGB/x5C/HfGzgFswG3U56rNBUXIZ80eGcN
 bLtWZrT6UdpHpVsh01ghpUwwSoVjkv/Gugd4rPtS5+oQ8K+Yh3npBaRPZbyKfSsJey3c
 /KXJVrW0H91QGWkPgSkgu/b1dZQEaTlwXeYdhas1wmzIaOA+GbwU+iP+mcq25aL1+JNZ
 d8fKKtR+q+oD/OtbxnAfeyHWsacD/z9Zn2ADgsMN0rPtVMTI09EjMIynMYclywmcGPNi
 cCQ1t3EBy2CR/ujVtHm7fym/GMID5IUlYFOJVYOSiSF0AJr6ptSgPu+U64LGSiAOelIk
 hMLg==
X-Gm-Message-State: AOAM533qURbdMEL95b66R35ExavNUoBAHQYbe0QDcyf6sN0Jga59AJaC
 6KIllYGNrGaXFjtGZ0B4WkzKE+QFiMWeAa029wM=
X-Google-Smtp-Source: ABdhPJwMSL/FjLLqaSjPX0XwgrVcownXwcjvWEdZfgbYV4mn6WnQoBpWSRX+78RnOomObI0IhxFr2gWFQbeWc05L10g=
X-Received: by 2002:aca:af10:: with SMTP id y16mr3576679oie.120.1616510743152; 
 Tue, 23 Mar 2021 07:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210321151907.367586-1-ztong0001@gmail.com>
 <259c234f-ca6a-7f9a-8df1-69055f2fc1b6@amd.com>
In-Reply-To: <259c234f-ca6a-7f9a-8df1-69055f2fc1b6@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Mar 2021 10:45:31 -0400
Message-ID: <CADnq5_Njn4SxzhLOc6rUwFv1b0AsSmP7-KWONBuxiGMaQ-FpLg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/radeon: don't evict if not initialized
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Tong Zhang <ztong0001@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgTWFyIDIyLCAyMDIxIGF0IDM6NDAgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDIxLjAzLjIxIHVtIDE2OjE5IHNjaHJpZWIgVG9uZyBaaGFuZzoKPiA+IFRUTV9QTF9WUkFNIG1h
eSBub3QgaW5pdGlhbGl6ZWQgYXQgYWxsIHdoZW4gY2FsbGluZwo+ID4gcmFkZW9uX2JvX2V2aWN0
X3ZyYW0oKS4gV2UgbmVlZCB0byBjaGVjayBiZWZvcmUgZG9pbmcgZXZpY3Rpb24uCj4gPgo+ID4g
WyAgICAyLjE2MDgzN10gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRy
ZXNzOiAwMDAwMDAwMDAwMDAwMDIwCj4gPiBbICAgIDIuMTYxMjEyXSAjUEY6IHN1cGVydmlzb3Ig
cmVhZCBhY2Nlc3MgaW4ga2VybmVsIG1vZGUKPiA+IFsgICAgMi4xNjE0OTBdICNQRjogZXJyb3Jf
Y29kZSgweDAwMDApIC0gbm90LXByZXNlbnQgcGFnZQo+ID4gWyAgICAyLjE2MTc2N10gUEdEIDAg
UDREIDAKPiA+IFsgICAgMi4xNjMwODhdIFJJUDogMDAxMDp0dG1fcmVzb3VyY2VfbWFuYWdlcl9l
dmljdF9hbGwrMHg3MC8weDFjMCBbdHRtXQo+ID4gWyAgICAyLjE2ODUwNl0gQ2FsbCBUcmFjZToK
PiA+IFsgICAgMi4xNjg2NDFdICByYWRlb25fYm9fZXZpY3RfdnJhbSsweDFjLzB4MjAgW3JhZGVv
bl0KPiA+IFsgICAgMi4xNjg5MzZdICByYWRlb25fZGV2aWNlX2ZpbmkrMHgyOC8weGY5IFtyYWRl
b25dCj4gPiBbICAgIDIuMTY5MjI0XSAgcmFkZW9uX2RyaXZlcl91bmxvYWRfa21zKzB4NDQvMHhh
MCBbcmFkZW9uXQo+ID4gWyAgICAyLjE2OTUzNF0gIHJhZGVvbl9kcml2ZXJfbG9hZF9rbXMrMHgx
NzQvMHgyMTAgW3JhZGVvbl0KPiA+IFsgICAgMi4xNjk4NDNdICBkcm1fZGV2X3JlZ2lzdGVyKzB4
ZDkvMHgxYzAgW2RybV0KPiA+IFsgICAgMi4xNzAxMDRdICByYWRlb25fcGNpX3Byb2JlKzB4MTE3
LzB4MWEwIFtyYWRlb25dCj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUb25nIFpoYW5nIDx6
dG9uZzAwMDFAZ21haWwuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+ID4gLS0tCj4gPiB2MjogY29kaW5nIHN0eWxlIGZp
eAo+ID4KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMgfCAyICsr
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYwo+ID4gaW5kZXggOWI4MTc4Njc4MmRlLi40OTljZTU1
ZTM0Y2MgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmpl
Y3QuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMKPiA+
IEBAIC0zODQsNiArMzg0LDggQEAgaW50IHJhZGVvbl9ib19ldmljdF92cmFtKHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2KQo+ID4gICAgICAgfQo+ID4gICAjZW5kaWYKPiA+ICAgICAgIG1hbiA9
IHR0bV9tYW5hZ2VyX3R5cGUoYmRldiwgVFRNX1BMX1ZSQU0pOwo+ID4gKyAgICAgaWYgKCFtYW4p
Cj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gICAgICAgcmV0dXJuIHR0bV9yZXNvdXJj
ZV9tYW5hZ2VyX2V2aWN0X2FsbChiZGV2LCBtYW4pOwo+ID4gICB9Cj4gPgo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcg
bGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
