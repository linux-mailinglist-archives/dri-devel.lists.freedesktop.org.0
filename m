Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 172C4114F12
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 11:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB476F9BF;
	Fri,  6 Dec 2019 10:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8A86F9BF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 10:30:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a15so7145089wrf.9
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 02:30:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mhXoMaU1UVBlyQ18j97xc9RF9JW9UYyQB2n+rphqqfo=;
 b=gSJ6oV3R4BAvUANJfnRgrjJI4FgdoPgxPthUHekXo3rDhtq4GAw9QznuLSEB4aQd9U
 YcTdEDRd+oMF+fm+bLERycGTtb3Pr3sTSDT14bphiF87N2vufHpr17kgRxPR00elq7tN
 fRZ0fqKOrJhsZsgS8868hvktcmX0L62r1eZ1gd8D4iL+YCo0iWWMgf56aX5vJx4ejInY
 MqbnoGqlB08KhRGZ+8WrcG1AujIhS2q5N3TzgI0BPDvvxbWIg2InfFp2z3Mdisjkom1O
 /2Z6SdBA/PeB5moqHFzajFQgLXYjTSiSssZ7FtWRXALBjJIDFn/xmXGNca55yyETaUUf
 ZxOA==
X-Gm-Message-State: APjAAAX/HDsjeQHYXfniyurxzR6SVDMb8xgvtuuouqs1MlDxZ1wl4wms
 PK6JynbsVZntEfQafdzLe8E=
X-Google-Smtp-Source: APXvYqzrDFccK7X9H1o6iY59fBFIiglCFoyDGEbEf2g1TDhd0HxoZ/ezkIG+sW98yOq/zRmldKE/BA==
X-Received: by 2002:adf:83c7:: with SMTP id 65mr14202364wre.368.1575628256938; 
 Fri, 06 Dec 2019 02:30:56 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id z13sm2983280wmi.18.2019.12.06.02.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 02:30:56 -0800 (PST)
Date: Fri, 6 Dec 2019 11:30:55 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v3 2/2] mm, drm/ttm: Fix vm page protection handling
Message-ID: <20191206103055.GO28317@dhcp22.suse.cz>
References: <20191206082426.2958-1-thomas_os@shipmail.org>
 <20191206082426.2958-3-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191206082426.2958-3-thomas_os@shipmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpIDA2LTEyLTE5IDA5OjI0OjI2LCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90
ZToKWy4uLl0KPiBAQCAtMjgzLDExICsyODIsMjYgQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1
bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCj4gIAkJCXBmbiA9IHBhZ2VfdG9fcGZu
KHBhZ2UpOwo+ICAJCX0KPiAgCj4gKwkJLyoKPiArCQkgKiBOb3RlIHRoYXQgdGhlIHZhbHVlIG9m
IEBwcm90IGF0IHRoaXMgcG9pbnQgbWF5IGRpZmZlciBmcm9tCj4gKwkJICogdGhlIHZhbHVlIG9m
IEB2bWEtPnZtX3BhZ2VfcHJvdCBpbiB0aGUgY2FjaGluZy0gYW5kCj4gKwkJICogZW5jcnlwdGlv
biBiaXRzLiBUaGlzIGlzIGJlY2F1c2UgdGhlIGV4YWN0IGxvY2F0aW9uIG9mIHRoZQo+ICsJCSAq
IGRhdGEgbWF5IG5vdCBiZSBrbm93biBhdCBtbWFwKCkgdGltZSBhbmQgbWF5IGFsc28gY2hhbmdl
Cj4gKwkJICogYXQgYXJiaXRyYXJ5IHRpbWVzIHdoaWxlIHRoZSBkYXRhIGlzIG1tYXAnZWQuCj4g
KwkJICogVGhpcyBpcyBvayBhcyBsb25nIGFzIEB2bWEtPnZtX3BhZ2VfcHJvdCBpcyBub3QgdXNl
ZCBieQo+ICsJCSAqIHRoZSBjb3JlIHZtIHRvIHNldCBjYWNoaW5nLSBhbmQgZW5jcnlwdGlvbiBi
aXRzLgo+ICsJCSAqIFRoaXMgaXMgZW5zdXJlZCBieSBjb3JlIHZtIHVzaW5nIHB0ZV9tb2RpZnko
KSB0byBtb2RpZnkKPiArCQkgKiBwYWdlIHRhYmxlIGVudHJ5IHByb3RlY3Rpb24gYml0cyAodGhh
dCBmdW5jdGlvbiBwcmVzZXJ2ZXMKPiArCQkgKiBvbGQgY2FjaGluZy0gYW5kIGVuY3J5cHRpb24g
Yml0cyksIGFuZCB0aGUgQGZhdWx0Cj4gKwkJICogY2FsbGJhY2sgYmVpbmcgdGhlIG9ubHkgZnVu
Y3Rpb24gdGhhdCBjcmVhdGVzIG5ldwo+ICsJCSAqIHBhZ2UgdGFibGUgZW50cmllcy4KPiArCQkg
Ki8KCldoaWxlIHRoaXMgaXMgYSB2ZXJ5IHZhbHVhYmxlIHBpZWNlIG9mIGluZm9ybWF0aW9uIEkg
YmVsaWV2ZSB3ZSBuZWVkIHRvCmRvY3VtZW50IHRoaXMgaW4gdGhlIGdlbmVyaWMgY29kZSB3aGVy
ZSBldmVyeWJvZHkgd2lsbCBmaW5kIGl0Lgp2bWZfaW5zZXJ0X21peGVkX3Byb3Qgc291bmRzIGxp
a2UgYSBnb29kIHBsYWNlIHRvIG1lLiBTbyBiZWluZyBleHBsaWNpdAphYm91dCBWTV9NSVhFRE1B
UC4gQWxzbyBhIHJlZmVyZW5jZSBmcm9tIHZtX3BhZ2VfcHJvdCB0byB0aGlzIGZ1bmN0aW9uCndv
dWxkIGJlIHJlYWxseSBoZWxwZWZ1bC4KClRoYW5rcyEKCi0tIApNaWNoYWwgSG9ja28KU1VTRSBM
YWJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
