Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D973BD135D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 17:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B856EA00;
	Wed,  9 Oct 2019 15:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD2F6E30E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 15:59:21 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r16so2479404edq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 08:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=IV9HrkbKViXtX3rAzZSis5mth5mzYLFWk694+Qn/Cms=;
 b=pPupUv+uIJNrBQm3F9jMkrJuMOM6aZQbHnHZ/VyfmKWNWcYP1k8rmzo8nrFSnt8Huh
 QfgYyirUCMvzS9KyqKQ36uH4nlnUxNgTjzP7YtdNvBz9MJAeuZcxR247K0mXabs6X2eq
 ilkapXYSbxVI4SZ958k9mbENlUxo5vysjqAg8XwuRvmn1tCXnXDGSxoV1TPP2NvUgikd
 kM/u31mkoqgfqowcxcCkYbhqkDb1O6HaJYFa5olWvj5N2oCTVhIxIzgG7IP1IPb4ksq1
 2W3VmzSSWlRsodnq4fvTlDFj+y+NNhq2Z/5xjyo/7urZpAHKq/WBgtWRMHnVrH2sl6Qv
 naHA==
X-Gm-Message-State: APjAAAUsvmjd3onae98CPq700G5qnL4U0Wp2WeQthj6sxLyVlGz4DcBy
 EGQTeDMVGZMqXJi0843CmVOElw==
X-Google-Smtp-Source: APXvYqz73y1IjMS9u7+rB3lTL6rHvxvD2Yf3LEg8I2tK5LYMLaKgbIeHBuR0oaIBn0ImkDAogrFxlw==
X-Received: by 2002:a50:d556:: with SMTP id f22mr3622466edj.248.1570636760464; 
 Wed, 09 Oct 2019 08:59:20 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id d13sm410438edb.14.2019.10.09.08.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 08:59:19 -0700 (PDT)
Date: Wed, 9 Oct 2019 17:59:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/mm: Use clear_bit_unlock() for
 releasing the drm_mm_node()
Message-ID: <20191009155917.GN16989@phenom.ffwll.local>
References: <20191003210100.22250-1-chris@chris-wilson.co.uk>
 <20191003210100.22250-5-chris@chris-wilson.co.uk>
 <fc1d813f-5f57-0a5c-a7ff-ba8db1399d32@linux.intel.com>
 <157018723052.12925.12334881894790832202@skylake-alporthouse-com>
 <157018786025.12925.9929624154459883899@skylake-alporthouse-com>
 <0b89ccc5-1b44-121b-4601-f8ae3f67b039@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b89ccc5-1b44-121b-4601-f8ae3f67b039@linux.intel.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IV9HrkbKViXtX3rAzZSis5mth5mzYLFWk694+Qn/Cms=;
 b=SkoFngjJXZ+FTjCkCh6AT145aYRpb4BH9CFaN4Q9UZQwuYEILqSLCDfvkDPC1FlxxX
 1yZtm2/NHN8ZGL6n5J4/4FMZwRm+/+Zuyq9w21oXgAs1mkDrnfNr6HxHrqaoGfvZ54UI
 oEpmH+qP1o1krizFXrEuEEFS6Gg6Ruxk9F+XE=
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDE6MDE6MzZQTSArMDEwMCwgVHZydGtvIFVyc3VsaW4g
d3JvdGU6Cj4gCj4gT24gMDQvMTAvMjAxOSAxMjoxNywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMTAtMDQgMTI6MDc6MTApCj4gPiA+IFF1b3Rpbmcg
VHZydGtvIFVyc3VsaW4gKDIwMTktMTAtMDQgMTA6MTU6MjApCj4gPiA+ID4gCj4gPiA+ID4gT24g
MDMvMTAvMjAxOSAyMjowMSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gPiA+ID4gQSBmZXcgY2Fs
bGVycyBuZWVkIHRvIHNlcmlhbGlzZSB0aGUgZGVzdHJ1Y3Rpb24gb2YgdGhlaXIgZHJtX21tX25v
ZGUgYW5kCj4gPiA+ID4gPiBlbnN1cmUgaXQgaXMgcmVtb3ZlZCBmcm9tIHRoZSBkcm1fbW0gYmVm
b3JlIGZyZWVpbmcuIEhvd2V2ZXIsIHRvIGJlCj4gPiA+ID4gPiBjb21wbGV0ZWx5IHN1cmUgdGhh
dCBhbnkgYWNjZXNzIGZyb20gYW5vdGhlciB0aHJlYWQgaXMgY29tcGxldGUgYmVmb3JlCj4gPiA+
ID4gPiB3ZSBmcmVlIHRoZSBzdHJ1Y3QsIHdlIHJlcXVpcmUgdGhlIFJFTEVBU0Ugc2VtYW50aWNz
IG9mCj4gPiA+ID4gPiBjbGVhcl9iaXRfdW5sb2NrKCkuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRo
aXMgYWxsb3dzIHRoZSBjb25kaXRpb25hbCBsb2NraW5nIHN1Y2ggYXMKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gVGhyZWFkIEEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaHJlYWQgQgo+ID4g
PiA+ID4gICAgICAgbXV0ZXhfbG9jayhtbV9sb2NrKTsgICAgICAgICAgICAgICAgaWYgKGRybV9t
bV9ub2RlX2FsbG9jYXRlZChub2RlKSkgewo+ID4gPiA+ID4gICAgICAgZHJtX21tX25vZGVfcmVt
b3ZlKG5vZGUpOyAgICAgICAgICAgICAgIG11dGV4X2xvY2sobW1fbG9jayk7Cj4gPiA+ID4gPiAg
ICAgICBtdXRleF91bmxvY2sobW1fbG9jayk7ICAgICAgICAgICAgICAgICAgZHJtX21tX25vZGVf
cmVtb3ZlKG5vZGUpOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG11dGV4X3VubG9jayhtbV9sb2NrKTsKPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUobm9kZSk7Cj4gPiA+ID4gCj4gPiA+
ID4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHJlbGVhc2Ugc2VtYW50aWNzIG9uIG5vZGUgYWxs
b2NhdGVkIG1lYW4gMSAtPiAwCj4gPiA+ID4gdHJhbnNpdGlvbiBpcyBndWFyYW50ZWVkIHRvIGJl
IHNlZW4gb25seSB3aGVuIHRocmVhZCBBCj4gPiA+ID4gZHJtX21tX25vZGVfcmVtb3ZlIGlzIGZ1
bGx5IGRvbmUgd2l0aCB0aGUgcmVtb3ZhbC4gQnV0IGlmIGl0IGlzIGluIHRoZQo+ID4gPiA+IG1p
ZGRsZSBvZiByZW1vdmFsLCBub2RlIGlzIHN0aWxsIHNlZW4gYXMgYWxsb2NhdGVkIG91dHNpZGUg
YW5kIHRocmVhZCBCCj4gPiA+ID4gY2FuIGVudGVyIHRoZSBpZi1ib2R5LCB3YWl0IGZvciB0aGUg
bG9jaywgYW5kIHRoZW4gZHJtX21tX25vZGVfcmVtb3ZlCj4gPiA+ID4gd2lsbCBhdHRlbXB0IGEg
ZG91YmxlIHJlbW92YWwuIFNvIEkgdGhpbmsgYW5vdGhlciBkcm1fbW1fbm9kZV9hbGxvY2F0ZWQK
PiA+ID4gPiB1bmRlciB0aGUgbG9jayBpcyBuZWVkZWQuCj4gPiA+IAo+ID4gPiBZZXMuIENoZWNr
IGFmdGVyIHRoZSBsb2NrIGlzIGluZGVlZCByZXF1aXJlZCBpbiB0aGlzIHNjZW5hcmlvLiBBbmQK
PiA+ID4gZHJtX21tX25vZGVfcmVtb3ZlKCkgaW5zaXN0cyB0aGUgY2FsbGVyIGRvZXNuJ3QgdHJ5
IGEgZG91YmxlIHJlbW92ZS4KPiA+IAo+ID4gSSBoYWQgdG8gZ28gYmFjayBhbmQgZG91YmxlIGNo
ZWNrIHRoZSB2bWEgY29kZSwgYW5kIHRoYXQncyBmaW5lLgo+ID4gKFdlIGhpdCB0aGlzIGNhc2Ug
d2hlcmUgb25lIHRocmVhZCBpcyBldmljdGluZyBhbmQgYW5vdGhlciB0aHJlYWQgaXMKPiA+IGRl
c3Ryb3lpbmcgdGhlIG9iamVjdC4gQW5kIGZvciB1cyB3ZSBkbyB0aGUgY2hlY2sgdW5kZXIgdGhl
IGxvY2sgaW5zaWRlCj4gPiBfX2k5MTVfdm1hX3VuYmluZCgpIG9uIHRoZSBkZXN0cm95IHBhdGgu
KQo+IAo+IFNvIEkgdGhpbmsgaWYgeW91IGFtZW5kIHRoZSBjb21taXQgbWVzc2FnZSB0byBjb250
YWluIHRoZSByZXBlYXRlZCBjaGVjawo+IHVuZGVyIHRoZSBsb2NrIHBhdGNoIGxvb2tzIGdvb2Qg
dG8gbWUuIFdpdGggdGhhdDoKPiAKPiBSZXZpZXdlZC1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRr
by51cnN1bGluQGludGVsLmNvbT4KCkkgdGhpbmsgYSBmb2xsb3ctdXAgcGF0Y2ggdG8gdXBkYXRl
IHRoZSBrZXJuZWxkb2MgdG8gbWVudGlvbiB0aGF0IHdlJ3JlCmd1YXJhbnRlZWluZyB0aGlzIG5v
dyBpcyBtaXNzaW5nIGhlcmUgKGJlc3Qgd2l0aCB0aGUgYWJvdmUgZml4ZWQgZXhhbXBsZSkuClBs
dXMgbWF5YmUgYSBvbmVsaW5lIGNvZGUgY29tbWVudCBmb3IgdGhlIEFMTE9DQVRFRF9CSVQuCi1E
YW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
