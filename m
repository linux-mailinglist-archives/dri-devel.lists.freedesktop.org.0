Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB96647E71
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 11:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DC088FFE;
	Mon, 17 Jun 2019 09:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542F588FFE;
 Mon, 17 Jun 2019 09:30:50 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c6so8308025wml.0;
 Mon, 17 Jun 2019 02:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=hGy+FSJRzToSeoyUsvQaQYFoLBq93m5qcKw5Lz5P/as=;
 b=rluOm+0T7pyF0lUcCUnS9IiXXBnuTMea8cukVyuAmW0nkAMEjZuYghopCkxD/lNM5P
 qMXXAfpuGT12S+T0qTxVV31nWMhCW7nzGyK8hw5PXqED7/3N6oz+mFhTlQb46WgSyz6c
 j3ZeqiN0bjmVw5QAsTpJZeZNQ6VVHaFm+Rt36DgiwPdEmf8dqv5lcY24Xr41wRG4eEig
 gQYzsFUZl96qyaorhrekmDJ5HkeuZsCLR1x6b4hGQvFL9+o7q/bGFuqeXFcsDSHINae1
 Tc8bVDnqs/ua6Yq/XR2XcdhuG1LKWgRW82Jf8Ni3nJ2/RnwieO45PIN9f8YjApVUPqfQ
 32PA==
X-Gm-Message-State: APjAAAU7fjvhnUyPnBy1t39XdJpcQytA7nOf1Hs99nDt+tXVWWt4uIxP
 qBU85VfOKZ2A3OJ5oMOPLAQ=
X-Google-Smtp-Source: APXvYqwdhcc9M07F72k/LDIugLL1XTkyPT3qTKjPffVGpz59oqzpHW73M+4cmRAMD4p6XlvT7Ussqw==
X-Received: by 2002:a1c:2dc2:: with SMTP id t185mr18175091wmt.52.1560763849022; 
 Mon, 17 Jun 2019 02:30:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z5sm9895972wrh.16.2019.06.17.02.30.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 02:30:48 -0700 (PDT)
Subject: Re: [PATCH 3/6] drm/gem: use new ww_mutex_(un)lock_for_each macros
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20190614124125.124181-1-christian.koenig@amd.com>
 <20190614124125.124181-4-christian.koenig@amd.com>
 <20190614131916.GQ3436@hirez.programming.kicks-ass.net>
 <20190614152242.GC23020@phenom.ffwll.local>
 <094da0f7-a0f0-9ed4-d2da-8c6e6d165380@gmail.com>
 <CAKMK7uFcDCJ9sozny1RqqRATwcK39doZNq+NZekvrzuO63ap-Q@mail.gmail.com>
 <d97212dc-367c-28e9-6961-9b99110a4d2e@gmail.com>
 <20190614203040.GE23020@phenom.ffwll.local>
 <CAKMK7uFzg+e315h2e5SmDTQwYTAbgAsxB_pc09ztwA1Wa-mzxw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <16adcdac-b3e7-02f1-e56b-9b4ad68e146e@gmail.com>
Date: Mon, 17 Jun 2019 11:30:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFzg+e315h2e5SmDTQwYTAbgAsxB_pc09ztwA1Wa-mzxw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=hGy+FSJRzToSeoyUsvQaQYFoLBq93m5qcKw5Lz5P/as=;
 b=F60ERVd/hdyLx8RkvS+tUuVoOJCT4bbcqGeQftgadh71HU605jvy7+avRbGBSrNhoJ
 1keSHnOnl1ku6hUHqHp8Yox/P3ICEsxA7UPoWoo1f9WHKWLkV/RwfycdjI4kOzml8fQf
 5mylKL44bJ1IW0AxZ/6GNbuXkVv1WuGyoQySInYmoX141ojNSY9KSOEgJevGuL3grgY+
 bhF6o5VqoOVwA1i+XBT0tVEOOqElJwyCeeHUqyr1K+1l7DGf0VF8/RPloApCnkLXhEdU
 wUIRpnGvue7vKNzG4hqCItM5q8GYfUGHaQQs3DmutNABXH2anO0k3MpuopjZqm02RWLb
 GzMw==
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
Reply-To: christian.koenig@amd.com
Cc: Thomas Hellstrom <thellstrom@vmware.com>, lima@lists.freedesktop.org,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Qiang Yu <yuq825@gmail.com>, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDYuMTkgdW0gMTU6NTYgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgSnVu
IDE0LCAyMDE5IGF0IDEwOjMwIFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3Jv
dGU6Cj4+IE9uIEZyaSwgSnVuIDE0LCAyMDE5IGF0IDA4OjUxOjExUE0gKzAyMDAsIENocmlzdGlh
biBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAxNC4wNi4xOSB1bSAyMDoyNCBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4+Pj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgODoxMCBQTSBDaHJpc3RpYW4gS8O2
bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4+IFtTTklQ
XQo+Pj4+PiBXV19NVVRFWF9MT0NLX0JFR0lOKCkKPj4+Pj4KPj4+Pj4gbG9jayhscnVfbG9jayk7
Cj4+Pj4+Cj4+Pj4+IHdoaWxlIChibyA9IGxpc3RfZmlyc3QobHJ1KSkgewo+Pj4+PiAgICBpZiAo
a3JlZl9nZXRfdW5sZXNzX3plcm8oYm8pKSB7Cj4+Pj4+ICAgICAgICAgICAgdW5sb2NrKGxydV9s
b2NrKTsKPj4+Pj4gICAgICAgICAgICBXV19NVVRFWF9MT0NLKGJvLT53d19tdXRleCk7Cj4+Pj4+
ICAgICAgICAgICAgbG9jayhscnVfbG9jayk7Cj4+Pj4+ICAgIH0gZWxzZSB7Cj4+Pj4+ICAgICAg
ICAgICAgLyogYm8gaXMgZ2V0dGluZyBmcmVlZCwgc3RlYWwgaXQgZnJvbSB0aGUgZnJlZWluZyBw
cm9jZXNzCj4+Pj4+ICAgICAgICAgICAgICogb3IganVzdCBpZ25vcmUgKi8KPj4+Pj4gICAgfQo+
Pj4+PiB9Cj4+Pj4+IHVubG9jayhscnVfbG9jaykKPj4+Pj4KPj4+Pj4gV1dfTVVURVhfTE9DS19F
TkQ7Cj4+PiBBaCwgbm93IEkga25vdyB3aGF0IHlvdSBtZWFuLiBBbmQgTk8sIHRoYXQgYXBwcm9h
Y2ggZG9lc24ndCB3b3JrLgo+Pj4KPj4+IFNlZSBmb3IgdGhlIGNvcnJlY3Qgd3dfbXV0ZXggZGFu
Y2Ugd2UgbmVlZCB0byB1c2UgdGhlIGl0ZXJhdG9yIG11bHRpcGxlCj4+PiB0aW1lcy4KPj4+Cj4+
PiBPbmNlIHRvIGdpdmUgdXMgdGhlIEJPcyB3aGljaCBuZWVkcyB0byBiZSBsb2NrZWQgYW5kIGFu
b3RoZXIgdGltZSB0byBnaXZlIHVzCj4+PiB0aGUgQk9zIHdoaWNoIG5lZWRzIHRvIGJlIHVubG9j
a2VkIGluIGNhc2Ugb2YgYSBjb250ZW50aW9uLgo+Pj4KPj4+IFRoYXQgd29uJ3Qgd29yayB3aXRo
IHRoZSBhcHByb2FjaCB5b3Ugc3VnZ2VzdCBoZXJlLgo+PiBBIHJpZ2h0LCBkcmF0Lgo+Pgo+PiBN
YXliZSBnaXZlIHVwIG9uIHRoZSBpZGVhIHRvIG1ha2UgdGhpcyB3b3JrIGZvciB3d19tdXRleCBp
biBnZW5lcmFsLCBhbmQKPj4ganVzdCBmb3IgZHJtX2dlbV9idWZmZXJfb2JqZWN0PyBJJ20ganVz
dCBhYm91dCB0byBzZW5kIG91dCBhIHBhdGNoIHNlcmllcwo+PiB3aGljaCBtYWtlcyBzdXJlIHRo
YXQgYSBsb3QgbW9yZSBkcml2ZXJzIHNldCBnZW1fYm8ucmVzdiBjb3JyZWN0bHkgKGl0Cj4+IHdp
bGwgYWxpYXMgd2l0aCB0dG1fYm8ucmVzdiBmb3IgdHRtIGRyaXZlcnMgb2ZjKS4gVGhlbiB3ZSBj
b3VsZCBhZGQgYQo+PiBsaXN0X2hlYWQgdG8gZ2VtX2JvICh3b24ndCByZWFsbHkgbWF0dGVyLCBi
dXQgbm90IHNvbWV0aGluZyB3ZSBjYW4gZG8gd2l0aAo+PiB3d19tdXRleCByZWFsbHkpLCBzbyB0
aGF0IHRoZSB1bmxvY2sgd2Fsa2luZyBkb2Vzbid0IG5lZWQgdG8gcmV1c2UgdGhlCj4+IHNhbWUg
aXRlcmF0b3IuIFRoYXQgc2hvdWxkIHdvcmsgSSB0aGluayAuLi4KPj4KPj4gQWxzbywgaXQgd291
bGQgYWxtb3N0IGNvdmVyIGV2ZXJ5dGhpbmcgeW91IHdhbnQgdG8gZG8uIEZvciB0dG0gd2UnZCBu
ZWVkCj4+IHRvIG1ha2UgdHRtX2JvIGEgc3ViY2xhc3Mgb2YgZ2VtX2JvIChhbmQgbWF5YmUgbm90
IGluaXRpYWxpemUgdGhhdAo+PiBlbWJlZGRlZCBnZW1fYm8gZm9yIHZtd2dmeCBhbmQgc2hhZG93
IGJvIGFuZCBkcml2ZXIgaW50ZXJuYWwgc3R1ZmYpLgo+Pgo+PiBKdXN0IHNvbWUgaWRlYXMsIHNp
bmNlIGNvcHlwYXN0aW5nIHRoZSB3d19tdXRleCBkYW5jZSBpbnRvIGFsbCBkcml2ZXJzIGlzCj4+
IGluZGVlZCBub3QgZ3JlYXQuCj4gRXZlbiBiZXR0ZXIgd2UgZG9uJ3QgbmVlZCB0byBmb3JjZSBl
dmVyeW9uZSB0byB1c2UgZHJtX2dlbV9vYmplY3QsIHRoZQo+IGhhcmQgd29yayBpcyBhbHJlYWR5
IGRvbmUgd2l0aCB0aGUgcmVzZXJ2YXRpb25fb2JqZWN0LiBXZSBjb3VsZCBhZGQgYQo+IGxpc3Rf
aGVhZCB0aGVyZSBmb3IgdW53aW5kaW5nLCBhbmQgdGhlbiB0aGUgbG9ja2luZyBoZWxwZXJzIHdv
dWxkIGxvb2sKPiBhIGxvdCBjbGVhbmVyIGFuZCBzaW1wbGVyIGltby4gcmVzZXJ2YXRpb25fdW5s
b2NrX2FsbCgpIHdvdWxkIGV2ZW4gYmUKPiBhIHJlYWwgZnVuY3Rpb24hIEFuZCBpZiB3ZSBkbyB0
aGlzIHRoZW4gSSB0aGluayB3ZSBzaG91bGQgYWxzbyBoYXZlIGEKPiByZXNlcnZhdGlvbl9hY3F1
aXJlX2N0eCwgdG8gc3RvcmUgdGhlIGxpc3RfaGVhZCBhbmQgbWF5YmUgYW55dGhpbmcKPiBlbHNl
Lgo+Cj4gUGx1cyBhbGwgdGhlIGNvZGUgeW91IHdhbnQgdG8gdG91Y2ggaXMgZGVhbGluZyB3aXRo
Cj4gcmVzZXJ2YXRpb25fb2JqZWN0LCBzbyB0aGF0J3MgYWxsIGNvdmVyZWQuIEFuZCBpdCBtaXJy
b3MgcXVpdGUgYSBiaXQKPiB3aGF0IHdlJ3ZlIGRvbmUgd2l0aCBzdHJ1Y3QgZHJtX21vZGVzZXRf
bG9jaywgdG8gd3JhcCB3d19tdXRleCBpcwo+IHNvbWV0aGluZyBlYXNpZXIgdG8gZGVhbCB3aXRo
IGZvciBrbXMuCgpUaGF0J3MgYSByYXRoZXIgaW50ZXJlc3RpbmcgaWRlYS4KCkkgd291bGRuJ3Qg
dXNlIGEgbGlzdF9oZWFkIGNhdXNlIHRoYXQgaGFzIGEgcmF0aGVyIGhvcnJpYmxlIGNhY2hpbmcg
CmZvb3RwcmludCBmb3Igc29tZXRoaW5nIHlvdSB3YW50IHRvIHVzZSBkdXJpbmcgQ1MsIGJ1dCBh
cGFydCBmcm9tIHRoYXQgCnRoZSBpZGVhIHNvdW5kcyBsaWtlIGl0IHdvdWxkIGFsc28gc29sdmUg
YSBidW5jaCBvZiBwcm9ibGVtIGR1cmluZyBldmljdGlvbi4KCkdvaW5nIHRvIGdpdmUgdGhhdCBh
IHRyeSwKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
