Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E009112E48
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 16:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68B26E915;
	Wed,  4 Dec 2019 15:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B703E6E915
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 15:26:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f4so5095655wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 07:26:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=6KFJXpSjk2QbKXOKeYkEGlVAuJTKJ9X2wspCF7AiQVk=;
 b=o1H2qngsXAAbgTvSJlovnIQdCo8fcwsaWUHhWvNhg6y4VpCS4mEx5Ry8owiZc1mad/
 rbhy7u5hslvEFDx1O0Yd1s3B8kykWJf4jDD3YfJDnG0pnsV6vNHEANrGwC8Di2YHL9cn
 FAleUofTJxdy8M14bc3x9R2tYS0Hswzu2Adp05+pC++UTw61FBqWhF3YXD6g1uhtIkui
 5jWI71kvYMwWUrk5T8KwRi4KDsELLU0njh7OvFp95q2z/7s27b1PWR23s0iJAAxGsH7M
 UeHdBBbIPAXLgx4yU2N1epdt01hFeWON9DyAFRoihCtSH/kLzEHMa37XB+9tSww0GoBp
 /LHA==
X-Gm-Message-State: APjAAAUpLbZQMeC0pF2D7Bw4Wmw/qCVXq21upygyzzw/VDTGRwZ0DNyC
 P0IG+h+zAwy+96TmjuJkFEI=
X-Google-Smtp-Source: APXvYqxkvyNs0giQOgDDIyCpxleWqDCEQnJO3Cr+vGWYu5oEaWn1ij1PW1TJG8ulikMieYCHh+fAPg==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr36232wmj.168.1575473206330;
 Wed, 04 Dec 2019 07:26:46 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id n188sm8207781wme.14.2019.12.04.07.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 07:26:45 -0800 (PST)
Date: Wed, 4 Dec 2019 16:26:44 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2 2/2] drm/ttm: Fix vm page protection handling
Message-ID: <20191204152644.GL25242@dhcp22.suse.cz>
References: <20191203104853.4378-1-thomas_os@shipmail.org>
 <20191203104853.4378-3-thomas_os@shipmail.org>
 <20191204135219.GH25242@dhcp22.suse.cz>
 <b29b166c-e9fe-f829-f533-b39f98b334a9@shipmail.org>
 <20191204143521.GJ25242@dhcp22.suse.cz>
 <5c2658b6-b5ec-5747-c360-fada54d759ed@shipmail.org>
 <20191204144248.GK25242@dhcp22.suse.cz>
 <b7b3ba5a-f625-36bc-d9cf-d537ec60e592@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7b3ba5a-f625-36bc-d9cf-d537ec60e592@shipmail.org>
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

T24gV2VkIDA0LTEyLTE5IDE2OjE5OjI3LCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90
ZToKPiBPbiAxMi80LzE5IDM6NDIgUE0sIE1pY2hhbCBIb2NrbyB3cm90ZToKPiA+IE9uIFdlZCAw
NC0xMi0xOSAxNTozNjo1OCwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4gPiA+
IE9uIDEyLzQvMTkgMzozNSBQTSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCAw
NC0xMi0xOSAxNToxNjowOSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4gPiA+
ID4gPiBPbiAxMi80LzE5IDI6NTIgUE0sIE1pY2hhbCBIb2NrbyB3cm90ZToKPiA+ID4gPiA+ID4g
T24gVHVlIDAzLTEyLTE5IDExOjQ4OjUzLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90
ZToKPiA+ID4gPiA+ID4gPiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2Fy
ZS5jb20+Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVFRNIGdyYXBoaWNzIGJ1ZmZlciBv
YmplY3RzIG1heSwgdHJhbnNwYXJlbnRseSB0byB1c2VyLXNwYWNlLCAgbW92ZQo+ID4gPiA+ID4g
PiA+IGJldHdlZW4gSU8gYW5kIHN5c3RlbSBtZW1vcnkuIFdoZW4gdGhhdCBoYXBwZW5zLCBhbGwg
UFRFcyBwb2ludGluZyB0byB0aGUKPiA+ID4gPiA+ID4gPiBvbGQgbG9jYXRpb24gYXJlIHphcHBl
ZCBiZWZvcmUgdGhlIG1vdmUgYW5kIHRoZW4gZmF1bHRlZCBpbiBhZ2FpbiBpZgo+ID4gPiA+ID4g
PiA+IG5lZWRlZC4gV2hlbiB0aGF0IGhhcHBlbnMsIHRoZSBwYWdlIHByb3RlY3Rpb24gY2FjaGlu
ZyBtb2RlLSBhbmQKPiA+ID4gPiA+ID4gPiBlbmNyeXB0aW9uIGJpdHMgbWF5IGNoYW5nZSBhbmQg
YmUgZGlmZmVyZW50IGZyb20gdGhvc2Ugb2YKPiA+ID4gPiA+ID4gPiBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3Q6OnZtX3BhZ2VfcHJvdC4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBXZSB3ZXJl
IHVzaW5nIGFuIHVnbHkgaGFjayB0byBzZXQgdGhlIHBhZ2UgcHJvdGVjdGlvbiBjb3JyZWN0bHku
Cj4gPiA+ID4gPiA+ID4gRml4IHRoYXQgYW5kIGluc3RlYWQgdXNlIHZtZl9pbnNlcnRfbWl4ZWRf
cHJvdCgpIGFuZCAvIG9yCj4gPiA+ID4gPiA+ID4gdm1mX2luc2VydF9wZm5fcHJvdCgpLgo+ID4g
PiA+ID4gPiA+IEFsc28gZ2V0IHRoZSBkZWZhdWx0IHBhZ2UgcHJvdGVjdGlvbiBmcm9tCj4gPiA+
ID4gPiA+ID4gc3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2bV9wYWdlX3Byb3QgcmF0aGVyIHRoYW4g
dXNpbmcgdm1fZ2V0X3BhZ2VfcHJvdCgpLgo+ID4gPiA+ID4gPiA+IFRoaXMgd2F5IHdlIGNhdGNo
IG1vZGlmaWNhdGlvbnMgZG9uZSBieSB0aGUgdm0gc3lzdGVtIGZvciBkcml2ZXJzIHRoYXQKPiA+
ID4gPiA+ID4gPiB3YW50IHdyaXRlLW5vdGlmaWNhdGlvbi4KPiA+ID4gPiA+ID4gU28gZXNzZW50
aWFsbHkgdGhpcyBzaG91bGQgaGF2ZSBhbnkgbmV3IHNpZGUgZWZmZWN0IG9uIGZ1bmN0aW9uYWxp
dHkgaXQKPiA+ID4gPiA+ID4gaXMganVzdCBtYWtpbmcgYSBoYWNreS91Z2x5IGNvZGUgbGVzcyBz
bz8KPiA+ID4gPiA+IEZ1bmN0aW9uYWxpdHkgaXMgdW5jaGFuZ2VkLiBUaGUgdXNlIG9mIGEgb24t
c3RhY2sgdm1hIGNvcHkgd2FzIHNldmVyZWx5Cj4gPiA+ID4gPiBmcm93bmVkIHVwb24gaW4gYW4g
ZWFybGllciB0aHJlYWQsIHdoaWNoIGFsc28gcG9pbnRzIHRvIGFub3RoZXIgc2ltaWxhcgo+ID4g
PiA+ID4gZXhhbXBsZSB1c2luZyB2bWZfaW5zZXJ0X3Bmbl9wcm90KCkuCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA5MDUxMDM1NDEuNDE2MS0y
LXRob21hc19vc0BzaGlwbWFpbC5vcmcvCj4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSW4gb3RoZXIg
d29yZHMgd2hhdCBhcmUgdGhlCj4gPiA+ID4gPiA+IGNvbnNlcXVlbmNlcyBvZiBoYXZpbmcgcGFn
ZSBwcm90ZWN0aW9uIGluY29uc2lzdGVudCBmcm9tIHZtYSdzPwo+ID4gPiA+ID4gRHVyaW5nIHRo
ZSB5ZWFycywgaXQgbG9va3MgbGlrZSB0aGUgY2FjaGluZy0gYW5kIGVuY3J5cHRpb24gZmxhZ3Mg
b2YKPiA+ID4gPiA+IHZtYTo6dm1fcGFnZV9wcm90IGhhdmUgYmVlbiBsYXJnZWx5IHJlbW92ZWQg
ZnJvbSB1c2FnZS4gRnJvbSB3aGF0IEkgY2FuCj4gPiA+ID4gPiB0ZWxsLCB0aGVyZSBhcmUgbm8g
bW9yZSBwbGFjZXMgbGVmdCB0aGF0IGNhbiBhZmZlY3QgVFRNLiBXZSBkaXNjdXNzZWQKPiA+ID4g
PiA+IF9fc3BsaXRfaHVnZV9wbWRfbG9ja2VkKCkgdG93YXJkcyB0aGUgZW5kIG9mIHRoYXQgdGhy
ZWFkLCBidXQgdGhhdCBkb2Vzbid0Cj4gPiA+ID4gPiBhZmZlY3QgVFRNIGV2ZW4gd2l0aCBodWdl
IHBhZ2UtdGFibGUgZW50cmllcy4KPiA+ID4gPiBQbGVhc2Ugc3RhdGUgYWxsIHRob3NlIGRldGFp
bHMvYXNzdW1wdGlvbnMgeW91IGFyZSBvcGVyYXRpbmcgb24gaW4gdGhlCj4gPiA+ID4gY2hhbmdl
bG9nLgo+ID4gPiBUaGFua3MuIEknbGwgdXBkYXRlIHRoZSBwYXRjaHNldCBhbmQgYWRkIHRoYXQu
Cj4gPiBBbmQgdGhpbmtpbmcgYWJvdXQgdGhhdCB0aGlzIGFsc28gYmVncyBmb3IgYSBjb21tZW50
IGluIHRoZSBjb2RlIHRvCj4gPiBleHBsYWluIHRoYXQgc29tZSAod2hpY2g/KSBtYXBwaW5ncyBt
aWdodCBoYXZlIGEgbWlzbWF0Y2ggYW5kIHRoZQo+ID4gZ2VuZXJpYyBjb2RlIGhhdmUgdG8gYmUg
Y2FyZWZ1bC4gQmVjYXVzZSBhcyB0aGluZ3Mgc3RhbmQgbm93IHRoaXMgc2VlbXMKPiA+IHRvIGJl
IHJlYWxseSBzdWJ0bGUgYW5kIGhhcHBlbiB0byB3b3JrIF9ub3dfIGFuZCBtaWdodCBicmVhayBp
biB0aGUgZnV0dXJlLgo+ID4gT3Igd2hhdCBkb2VzIHByZXZlbnQgYSBnZW5lcmljIGNvZGUgdG8g
c3R1bWJsZSBvdmVyIHRoaXMgZGlzY3JlcGFuY3k/Cj4gCj4gWWVzIHdlIGhhZCB0aGF0IGRpc2N1
c3Npb24gaW4gdGhlIHRocmVhZCBJIHBvaW50ZWQgdG8uIEkgaW5pdGlhbGx5IHN1Z2dlc3RlZAo+
IGFuZCBhcmd1ZWQgZm9yIHVwZGF0aW5nIHRoZSB2bWE6OnZtX3BhZ2VfcHJvdCB1c2luZyBhIFdS
SVRFX09OQ0UoKSAod2Ugb25seQo+IGhhdmUgdGhlIG1tYXBfc2VtIGluIHJlYWQgbW9kZSksIHRo
ZXJlIHNlZW1zIHRvIGJlIG90aGVyIHBsYWNlcyBpbiBnZW5lcmljCj4gY29kZSB0aGF0IGRvZXMg
dGhlIHNhbWUuCj4gCj4gQnV0IEkgd2FzIGNvbnZpbmNlZCBieSBBbmR5IHRoYXQgdGhpcyB3YXMg
dGhlIHJpZ2h0IHdheSBhbmQgYWxzbyB3YXMgdXNlZAo+IGVsc2V3aGVyZS4KPiAKPiAoU2VlIGFs
c28gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL3g4
Ni9lbnRyeS92ZHNvL3ZtYS5jI0wxMTYpCj4gCj4gSSBndWVzcyB0byBoYXZlIHRoaXMgcHJvcGVy
bHkgZm9ybXVsYXRlZCwgd2hhdCdzIHJlcXVpcmVkIGlzIHRoYXQgZ2VuZXJpYwo+IGNvZGUgZG9l
c24ndCBidWlsZCBwYWdlLXRhYmxlIGVudHJpZXMgdXNpbmcgdm1hOjp2bV9wYWdlX3Byb3QgZm9y
IFZNX1BGTk1BUAo+IGFuZCBWTV9NSVhFRE1BUCBvdXRzaWRlIG9mIGRyaXZlciBjb250cm9sLgoK
TGV0IG1lIHJlcGVhdCB0aGF0IHRoaXMgYmVsb25ncyB0byBhIGNvZGUgc29tZXdoZXJlIGV2ZXJ5
Ym9keSBjYW4gc2VlIGl0CnJhdGhlciB0aGFuIGEgInJhbmRvbSIgZGlzY3Vzc2lvbiBhdCBtYWls
aW5nIGxpc3QuCgpUaGFua3MhCi0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
