Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5D511530F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221786FA29;
	Fri,  6 Dec 2019 14:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB736FA29
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 14:24:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g17so7996208wro.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 06:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vc6cQnfCxKN0uDPrk49B3m1HkxNISZTqI0Pp7rQHqII=;
 b=r5dHwD9SKQ5nMSpwf+Z4kE5nGs6xspMg/9tjos0P5kcNcXVuBJujPB4qEqXzm02isZ
 /fi2pFtXU847/mic2IjHpJrbIusJwuojDvHwHucvyaNewXoRFrnR3QfLCPiVfaRvzuNP
 7J1RKfWpPllWioUZwPi5SAjauAMrr8zuhukQ6FPizI1wzZUbPNk+7nH5iq58a6/lhh33
 M/P2lwHCt0PclvPdedSkB4p99dkkvj7n2LXaoXfVXoCIQ1l3l6Mc1xGehXGbFKno0HrR
 rq57lf/7yKwkFdslRy8KmeCdFH6odpqZPeWh+SGP49N6xEyC861A3OqyYYH6IFWZE7Zb
 ezqg==
X-Gm-Message-State: APjAAAU1Uvgg0vVKqhyhYYihm+VShqDdr7kPRd38N8bnnMSaYIbPHheX
 NJ5A3iVeoOap3TvE2Zsbkw0=
X-Google-Smtp-Source: APXvYqwwmMDnS2FZLfKG16pLce1tzYWbto9tStZ6peuTR2ohVxYhKW7GPLX8eCkxS/T2ph8KLjhUOw==
X-Received: by 2002:adf:82e7:: with SMTP id 94mr16211867wrc.60.1575642260421; 
 Fri, 06 Dec 2019 06:24:20 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id z6sm17140998wrw.36.2019.12.06.06.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 06:24:19 -0800 (PST)
Date: Fri, 6 Dec 2019 15:24:18 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [PATCH v3 2/2] mm, drm/ttm: Fix vm page protection handling
Message-ID: <20191206142418.GP28317@dhcp22.suse.cz>
References: <20191206082426.2958-1-thomas_os@shipmail.org>
 <20191206082426.2958-3-thomas_os@shipmail.org>
 <20191206103055.GO28317@dhcp22.suse.cz>
 <10c4835486275e87334058bc2f406609c55271eb.camel@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10c4835486275e87334058bc2f406609c55271eb.camel@vmware.com>
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 Pv-drivers <Pv-drivers@vmware.com>,
 "thomas_os@shipmail.org" <thomas_os@shipmail.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpIDA2LTEyLTE5IDE0OjE2OjEwLCBUaG9tYXMgSGVsbHN0cm9tIHdyb3RlOgo+IEhpIE1p
Y2hhbCwKPiAKPiBPbiBGcmksIDIwMTktMTItMDYgYXQgMTE6MzAgKzAxMDAsIE1pY2hhbCBIb2Nr
byB3cm90ZToKPiA+IE9uIEZyaSAwNi0xMi0xOSAwOToyNDoyNiwgVGhvbWFzIEhlbGxzdHLDtm0g
KFZNd2FyZSkgd3JvdGU6Cj4gPiBbLi4uXQo+ID4gPiBAQCAtMjgzLDExICsyODIsMjYgQEAgdm1f
ZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0Cj4gPiA+IHZtX2ZhdWx0ICp2
bWYsCj4gPiA+ICAJCQlwZm4gPSBwYWdlX3RvX3BmbihwYWdlKTsKPiA+ID4gIAkJfQo+ID4gPiAg
Cj4gPiA+ICsJCS8qCj4gPiA+ICsJCSAqIE5vdGUgdGhhdCB0aGUgdmFsdWUgb2YgQHByb3QgYXQg
dGhpcyBwb2ludCBtYXkKPiA+ID4gZGlmZmVyIGZyb20KPiA+ID4gKwkJICogdGhlIHZhbHVlIG9m
IEB2bWEtPnZtX3BhZ2VfcHJvdCBpbiB0aGUgY2FjaGluZy0gYW5kCj4gPiA+ICsJCSAqIGVuY3J5
cHRpb24gYml0cy4gVGhpcyBpcyBiZWNhdXNlIHRoZSBleGFjdCBsb2NhdGlvbgo+ID4gPiBvZiB0
aGUKPiA+ID4gKwkJICogZGF0YSBtYXkgbm90IGJlIGtub3duIGF0IG1tYXAoKSB0aW1lIGFuZCBt
YXkgYWxzbwo+ID4gPiBjaGFuZ2UKPiA+ID4gKwkJICogYXQgYXJiaXRyYXJ5IHRpbWVzIHdoaWxl
IHRoZSBkYXRhIGlzIG1tYXAnZWQuCj4gPiA+ICsJCSAqIFRoaXMgaXMgb2sgYXMgbG9uZyBhcyBA
dm1hLT52bV9wYWdlX3Byb3QgaXMgbm90IHVzZWQKPiA+ID4gYnkKPiA+ID4gKwkJICogdGhlIGNv
cmUgdm0gdG8gc2V0IGNhY2hpbmctIGFuZCBlbmNyeXB0aW9uIGJpdHMuCj4gPiA+ICsJCSAqIFRo
aXMgaXMgZW5zdXJlZCBieSBjb3JlIHZtIHVzaW5nIHB0ZV9tb2RpZnkoKSB0bwo+ID4gPiBtb2Rp
ZnkKPiA+ID4gKwkJICogcGFnZSB0YWJsZSBlbnRyeSBwcm90ZWN0aW9uIGJpdHMgKHRoYXQgZnVu
Y3Rpb24KPiA+ID4gcHJlc2VydmVzCj4gPiA+ICsJCSAqIG9sZCBjYWNoaW5nLSBhbmQgZW5jcnlw
dGlvbiBiaXRzKSwgYW5kIHRoZSBAZmF1bHQKPiA+ID4gKwkJICogY2FsbGJhY2sgYmVpbmcgdGhl
IG9ubHkgZnVuY3Rpb24gdGhhdCBjcmVhdGVzIG5ldwo+ID4gPiArCQkgKiBwYWdlIHRhYmxlIGVu
dHJpZXMuCj4gPiA+ICsJCSAqLwo+ID4gCj4gPiBXaGlsZSB0aGlzIGlzIGEgdmVyeSB2YWx1YWJs
ZSBwaWVjZSBvZiBpbmZvcm1hdGlvbiBJIGJlbGlldmUgd2UgbmVlZAo+ID4gdG8KPiA+IGRvY3Vt
ZW50IHRoaXMgaW4gdGhlIGdlbmVyaWMgY29kZSB3aGVyZSBldmVyeWJvZHkgd2lsbCBmaW5kIGl0
Lgo+ID4gdm1mX2luc2VydF9taXhlZF9wcm90IHNvdW5kcyBsaWtlIGEgZ29vZCBwbGFjZSB0byBt
ZS4gU28gYmVpbmcKPiA+IGV4cGxpY2l0Cj4gPiBhYm91dCBWTV9NSVhFRE1BUC4gQWxzbyBhIHJl
ZmVyZW5jZSBmcm9tIHZtX3BhZ2VfcHJvdCB0byB0aGlzCj4gPiBmdW5jdGlvbgo+ID4gd291bGQg
YmUgcmVhbGx5IGhlbHBlZnVsLgo+ID4gCj4gPiBUaGFua3MhCj4gPiAKPiAKPiBKdXN0IHRvIG1h
a2Ugc3VyZSBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LiBZb3UnZCBwcmVmZXIgdGhpcyAob3IKPiBz
aW1pbGFyKSB0ZXh0IHRvIGJlIHByZXNlbnQgYXQgdGhlIHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCgp
IGFuZAo+IHZtZl9pbnNlcnRfcGZuX3Byb3QoKSBkZWZpbml0aW9ucyBmb3IgTUlYRURNQVAgYW5k
IFBGTk1BUCByZXNwZWN0aXZlbHksCj4gYW5kIGEgcG9pbnRlciBmcm9tIHZtX3BhZ2VfcHJvdCB0
byB0aGF0IHRleHQuIElzIHRoYXQgY29ycmVjdD8KClllcy4gWW91IGNhbiBrZWVwIHdoYXRldmVy
IGlzIHNwZWNpZmljIHRvIFRUTSBoZXJlIGJ1dCB0aGUgcmVzdCBzaG91bGQKYmUgc29tZXdoZXJl
IHZpc2libGUgdG8gdXNlcnMgb2YgdGhlIGludGVyZmFjZSBhbmQgYSBub3RlIGF0CnZtX3BhZ2Vf
cHJvdCBzaG91bGQgaGVscCBhbnlib2R5IHRvdWNoaW5nIHRoZSBnZW5lcmljL2NvcmUgY29kZSB0
byBub3QKYnJlYWsgdGhvc2UgZXhwZWN0YXRpb25zLgoKVGhhbmtzIQotLSAKTWljaGFsIEhvY2tv
ClNVU0UgTGFicwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
