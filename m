Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3AD286F2B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558826EA31;
	Thu,  8 Oct 2020 07:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5487E6E902
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:27:49 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 10so2584317qtx.12
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 10:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XbSoU+/at8nS4vwGrWdy12hS6b+RYvRwUOTYRSNB06Q=;
 b=mSF3jlLKHl2GcWOtjisnFuOxmsafdLuRV7HNQszKRHTbX7yrWh+1uuimlnTVBDf88S
 7CDIDMQGVG9iRv64l0dGVTOGsF3HhoVCmCeCFmDoV09KS3pUl6DC8vC3fTvvt2cweotS
 YfhKySivQyKZUy5Qq80V3s1ZqG50WhxQuoVnwHYZe7OK1Xk2CZbcO9rDgpzCxYLE695p
 iM3zaabJqTXzIZDyKFOBFSJJu8gE182ca6m7suRvcG0u6/EkdQ4bhJV4U+DEo5V7zW7u
 S96CIynxOtOJjWv1pdwcNaqEUxAlUPVqbissjAJxdOugEaGgQF1dKaRPG7Vtfa/bgluo
 JjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XbSoU+/at8nS4vwGrWdy12hS6b+RYvRwUOTYRSNB06Q=;
 b=OR8ZatE16ZU4eegBtpS5DNPl6ztz96xnz16QGfBMh+gL/jTyZG0VgFVCODd/kE9+5N
 JCX8EHoZjU2z4pVKAcsJo1ZQvSTVrfC+xMcXAS+lX6SlUaatlPj2+cJwuK8qlMvgtiOM
 yJYtenHdO8IPi/JgEv1vpySVS5RZS9OO+c0qJttV+5MRwgqwek+x7lvOqOeqhSCxnfwW
 pmvB8s7l0P0VsBT9mIasdtyAKUoR87GOGfqmKWM2/nNyP6LG7DHZpo5CyYHEJmltuWvQ
 I2pIXaBrZXNJEeHiWwLUYpcdqwClH3SsFc9lvhKWezrOM5q0wBFEBayM5pc0gHj16EW4
 F8ag==
X-Gm-Message-State: AOAM53038hXHZ/Aymq88lNOdOjdEHquu/5B/gcgD99JTOu3sDRxKYKf0
 mIdYqO8agZ0zhTc13EyOkR7tCg==
X-Google-Smtp-Source: ABdhPJzBzIEuFCTfuv3ULvENiYmE1q5S6ZKvaoPSvLERT9h4HN4R+RXmtJoeCi0hQLY2ayjG0AcA6w==
X-Received: by 2002:ac8:37ef:: with SMTP id e44mr4247866qtc.342.1602091668463; 
 Wed, 07 Oct 2020 10:27:48 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id t10sm1904322qkt.55.2020.10.07.10.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 10:27:47 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQDEA-0010sP-Uz; Wed, 07 Oct 2020 14:27:46 -0300
Date: Wed, 7 Oct 2020 14:27:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 07/13] mm: close race in generic_access_phys
Message-ID: <20201007172746.GU5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-8-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007164426.1812530-8-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Thu, 08 Oct 2020 07:20:54 +0000
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
Cc: linux-s390@vger.kernel.org, Rik van Riel <riel@redhat.com>,
 linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, John Hubbard <jhubbard@nvidia.com>,
 Hugh Dickins <hugh@veritas.com>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDcsIDIwMjAgYXQgMDY6NDQ6MjBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXYXkgYmFjayBpdCB3YXMgYSByZWFzb25hYmxlIGFzc3VtcHRpb25zIHRoYXQgaW9t
ZW0gbWFwcGluZ3MgbmV2ZXIKPiBjaGFuZ2UgdGhlIHBmbiByYW5nZSB0aGV5IHBvaW50IGF0LiBC
dXQgdGhpcyBoYXMgY2hhbmdlZDoKPiAKPiAtIGdwdSBkcml2ZXJzIGR5bmFtaWNhbGx5IG1hbmFn
ZSB0aGVpciBtZW1vcnkgbm93YWRheXMsIGludmFsaWRhdGluZwo+ICAgcHRlcyB3aXRoIHVubWFw
X21hcHBpbmdfcmFuZ2Ugd2hlbiBidWZmZXJzIGdldCBtb3ZlZAo+IAo+IC0gY29udGlndW91cyBk
bWEgYWxsb2NhdGlvbnMgaGF2ZSBtb3ZlZCBmcm9tIGRlZGljYXRlZCBjYXJ2ZXRvdXRzIHRvCj4g
ICBjbWEgcmVnaW9ucy4gVGhpcyBtZWFucyBpZiB3ZSBtaXNzIHRoZSB1bm1hcCB0aGUgcGZuIG1p
Z2h0IGNvbnRhaW4KPiAgIHBhZ2VjYWNoZSBvciBhbm9uIG1lbW9yeSAod2VsbCBhbnl0aGluZyBh
bGxvY2F0ZWQgd2l0aCBHRlBfTU9WRUFCTEUpCj4gCj4gLSBldmVuIC9kZXYvbWVtIG5vdyBpbnZh
bGlkYXRlcyBtYXBwaW5ncyB3aGVuIHRoZSBrZXJuZWwgcmVxdWVzdHMgdGhhdAo+ICAgaW9tZW0g
cmVnaW9uIHdoZW4gQ09ORklHX0lPX1NUUklDVF9ERVZNRU0gaXMgc2V0LCBzZWUgMzIzNGFjNjY0
YTg3Cj4gICAoIi9kZXYvbWVtOiBSZXZva2UgbWFwcGluZ3Mgd2hlbiBhIGRyaXZlciBjbGFpbXMg
dGhlIHJlZ2lvbiIpCj4gCj4gQWNjZXNzaW5nIHBmbnMgb2J0YWluZWQgZnJvbSBwdGVzIHdpdGhv
dXQgaG9sZGluZyBhbGwgdGhlIGxvY2tzIGlzCj4gdGhlcmVmb3JlIG5vIGxvbmdlciBhIGdvb2Qg
aWRlYS4gRml4IHRoaXMuCj4gCj4gU2luY2UgaW9yZW1hcCBtaWdodCBuZWVkIHRvIG1hbmlwdWxh
dGUgcGFnZXRhYmxlcyB0b28gd2UgbmVlZCB0byBkcm9wCj4gdGhlIHB0IGxvY2sgYW5kIGhhdmUg
YSByZXRyeSBsb29wIGlmIHdlIHJhY2VkLgo+IAo+IFdoaWxlIGF0IGl0LCBhbHNvIGFkZCBrZXJu
ZWxkb2MgYW5kIGltcHJvdmUgdGhlIGNvbW1lbnQgZm9yIHRoZQo+IHZtYV9vcHMtPmFjY2VzcyBm
dW5jdGlvbi4gSXQncyBmb3IgYWNjZXNzaW5nLCBub3QgZm9yIG1vdmluZyB0aGUKPiBtZW1vcnkg
ZnJvbSBpb21lbSB0byBzeXN0ZW0gbWVtb3J5LCBhcyB0aGUgb2xkIGNvbW1lbnQgc2VlbWVkIHRv
Cj4gc3VnZ2VzdC4KPiAKPiBSZWZlcmVuY2VzOiAyOGIyZWUyMGM3Y2IgKCJhY2Nlc3NfcHJvY2Vz
c192bSBkZXZpY2UgbWVtb3J5IGluZnJhc3RydWN0dXJlIikKPiBDYzogSmFzb24gR3VudGhvcnBl
IDxqZ2dAemllcGUuY2E+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwu
Y29tPgo+IENjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBDYzogUmlrIHZh
biBSaWVsIDxyaWVsQHJlZGhhdC5jb20+Cj4gQ2M6IEJlbmphbWluIEhlcnJlbnNtaWR0IDxiZW5o
QGtlcm5lbC5jcmFzaGluZy5vcmc+Cj4gQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBIdWdoIERpY2tpbnMgPGh1Z2hAdmVyaXRhcy5jb20+Cj4gQ2M6IEFuZHJldyBNb3J0
b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJh
cmRAbnZpZGlhLmNvbT4KPiBDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+
Cj4gQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmou
d2lsbGlhbXNAaW50ZWwuY29tPgo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiBDYzogbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZn
ZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAg
aW5jbHVkZS9saW51eC9tbS5oIHwgIDMgKystCj4gIG1tL21lbW9yeS5jICAgICAgICB8IDQ0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIDIgZmlsZXMgY2hh
bmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKClRoaXMgZG9lcyBzZWVtIHRv
IHNvbHZlIHRoZSByYWNlIHdpdGggcmV2b2tlX2Rldm1lbSgpLCBidXQgaXQgaXMgcmVhbGx5IHVn
bHkuCgpJdCB3b3VsZCBiZSBtdWNoIG5pY2VyIHRvIHdyYXAgYSByd3NlbSBhcm91bmQgdGhpcyBh
Y2Nlc3MgYW5kIHRoZSB1bm1hcC4KCkFueSBwbGFjZSB1c2luZyBpdCBoYXMgYSBuaWNlIGxpbmVh
ciB0cmFuc2xhdGlvbiBmcm9tIHZtX29mZiB0byBwZm4sCnNvIEkgZG9uJ3QgdGhpbmsgdGhlcmUg
aXMgYSBzdWNoIGEgZ29vZCByZWFzb24gdG8gdXNlIGZvbGxvd19wdGUgaW4KdGhlIGZpcnN0IHBs
YWNlLgoKaWUgd2h5IG5vdCB0aGUgaGVscGVyIGJlIHRoaXM6CgogaW50IGdlbmVyaWNfYWNjZXNz
X3BoeXModW5zaWduZWQgbG9uZyBwZm4sIHVuc2lnbmVkIGxvbmcgcGdwcm90LAogICAgICB2b2lk
ICpidWYsIHNpemVfdCBsZW4sIGJvb2wgd3JpdGUpCgpUaGVuIHNvbWV0aGluZyBsaWtlIGRldi9t
ZW0gd291bGQgY29tcHV0ZSBwZm4gYW5kIG9idGFpbiB0aGUgbG9jazoKCmRldl9hY2Nlc3Moc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwgdm9pZCAqYnVmLCBp
bnQgbGVuLCBpbnQgd3JpdGUpCnsKICAgICBjcHVfYWRkciA9IHZtYS0+dm1fcGdvZmYqUEFHRV9T
SVpFICsgKGFkZHIgLSB2bWEtPnZtX3N0YXJ0KSk7CgogICAgIC8qIEZJWE1FOiBIYXMgdG8gYmUg
b3ZlciBlYWNoIHBhZ2Ugb2YgbGVuICovCiAgICAgaWYgKCFkZXZtZW1faXNfYWxsb3dlZF9hY2Nl
c3MoUEhZU19QRk4oY3B1X2FkZHIvNDA5NikpKQogICAgICAgICAgIHJldHVybiAtRVBFUk07Cgog
ICAgIGRvd25fcmVhZCgmbWVtX3NlbSk7CiAgICAgZ2VuZXJpY19hY2Nlc3NfcGh5cyhjcHVfYWRk
ci80MDk2LCBwZ3Byb3RfdmFsKHZtYS0+dm1fcGFnZV9wcm90KSwKICAgICAgICAgICAgICAgICAg
ICAgICAgIGJ1ZiwgbGVuLCB3cml0ZSk7CiAgICAgdXBfcmVhZCgmbWVtX3NlbSk7Cn0KClRoZSBv
dGhlciBjYXNlcyBsb29rZWQgc2ltcGxlciBiZWNhdXNlIHRoZXkgZG9uJ3QgcmV2b2tlLCBoZXJl
IHRoZQptbWFwX3NlbSBhbG9uZSBzaG91bGQgYmUgZW5vdWdoIHByb3RlY3Rpb24sIHRoZXkgd291
bGQganVzdCBuZWVkIHRvCnByb3ZpZGUgdGhlIGxpbmVhciB0cmFuc2xhdGlvbiB0byBwZm4uCgpX
aGF0IGRvIHlvdSB0aGluaz8KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
