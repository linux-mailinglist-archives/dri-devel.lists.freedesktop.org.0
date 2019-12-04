Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC13112DA3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 15:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B64F6E06E;
	Wed,  4 Dec 2019 14:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85BD6E06E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 14:42:51 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f129so8235903wmf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 06:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fmkqNOaDxlFa9adJqpXSMGLRx9tYqe3bfVnOjKiJBj8=;
 b=T/hHQWM6Bl0J3JVLUSxRBsrIY4cPa6Yl4+7qj++gZVuqbXkJK9MChTI/4ADOqG2ib3
 PNwYWRfVv5hzE/b+4JumuBAf3dXe3ylrCEt0RnR5bqoU5aBNcx2NMtF7Yrvf37KJXnoe
 UtMHmkJNVJ3N6ASR+sXCPHB7Bk4LFLx6F90u9qDz5kHqh/22a+oXqd0ljoMJqn9Ichbm
 JkEC0OhPh9KmsO088ss3rjUZfaXIJ2P+vaFpln1mAZgMJZ7Vw5sgki+IhDlgP0tWBz3l
 OB7iwPK0oU99f9UuG3LKndN/RhskuUE60hrRa2oIENzeKszuqEyztBg0rG1ucx1baRWv
 zg8w==
X-Gm-Message-State: APjAAAUk+hNIlvv8wa786JLyLIXtA/PorEiCdpB3ltOVibmKkRayvL0u
 IKTwtOJ/1CmsKgCFC2v5F8w=
X-Google-Smtp-Source: APXvYqwSz66IR1bxVLLt9RZ38byrmQYX+FmrPmMpaXVz8Iv/tsYjvmFVCkFgMd/eEe+TtTuCDncVdA==
X-Received: by 2002:a1c:9958:: with SMTP id b85mr33323811wme.63.1575470570528; 
 Wed, 04 Dec 2019 06:42:50 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id e16sm6724403wme.35.2019.12.04.06.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 06:42:49 -0800 (PST)
Date: Wed, 4 Dec 2019 15:42:48 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2 2/2] drm/ttm: Fix vm page protection handling
Message-ID: <20191204144248.GK25242@dhcp22.suse.cz>
References: <20191203104853.4378-1-thomas_os@shipmail.org>
 <20191203104853.4378-3-thomas_os@shipmail.org>
 <20191204135219.GH25242@dhcp22.suse.cz>
 <b29b166c-e9fe-f829-f533-b39f98b334a9@shipmail.org>
 <20191204143521.GJ25242@dhcp22.suse.cz>
 <5c2658b6-b5ec-5747-c360-fada54d759ed@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c2658b6-b5ec-5747-c360-fada54d759ed@shipmail.org>
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

T24gV2VkIDA0LTEyLTE5IDE1OjM2OjU4LCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90
ZToKPiBPbiAxMi80LzE5IDM6MzUgUE0sIE1pY2hhbCBIb2NrbyB3cm90ZToKPiA+IE9uIFdlZCAw
NC0xMi0xOSAxNToxNjowOSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4gPiA+
IE9uIDEyLzQvMTkgMjo1MiBQTSwgTWljaGFsIEhvY2tvIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSAw
My0xMi0xOSAxMTo0ODo1MywgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4gPiA+
ID4gPiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gPiA+
ID4gPiAKPiA+ID4gPiA+IFRUTSBncmFwaGljcyBidWZmZXIgb2JqZWN0cyBtYXksIHRyYW5zcGFy
ZW50bHkgdG8gdXNlci1zcGFjZSwgIG1vdmUKPiA+ID4gPiA+IGJldHdlZW4gSU8gYW5kIHN5c3Rl
bSBtZW1vcnkuIFdoZW4gdGhhdCBoYXBwZW5zLCBhbGwgUFRFcyBwb2ludGluZyB0byB0aGUKPiA+
ID4gPiA+IG9sZCBsb2NhdGlvbiBhcmUgemFwcGVkIGJlZm9yZSB0aGUgbW92ZSBhbmQgdGhlbiBm
YXVsdGVkIGluIGFnYWluIGlmCj4gPiA+ID4gPiBuZWVkZWQuIFdoZW4gdGhhdCBoYXBwZW5zLCB0
aGUgcGFnZSBwcm90ZWN0aW9uIGNhY2hpbmcgbW9kZS0gYW5kCj4gPiA+ID4gPiBlbmNyeXB0aW9u
IGJpdHMgbWF5IGNoYW5nZSBhbmQgYmUgZGlmZmVyZW50IGZyb20gdGhvc2Ugb2YKPiA+ID4gPiA+
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdDo6dm1fcGFnZV9wcm90Lgo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBXZSB3ZXJlIHVzaW5nIGFuIHVnbHkgaGFjayB0byBzZXQgdGhlIHBhZ2UgcHJvdGVjdGlvbiBj
b3JyZWN0bHkuCj4gPiA+ID4gPiBGaXggdGhhdCBhbmQgaW5zdGVhZCB1c2Ugdm1mX2luc2VydF9t
aXhlZF9wcm90KCkgYW5kIC8gb3IKPiA+ID4gPiA+IHZtZl9pbnNlcnRfcGZuX3Byb3QoKS4KPiA+
ID4gPiA+IEFsc28gZ2V0IHRoZSBkZWZhdWx0IHBhZ2UgcHJvdGVjdGlvbiBmcm9tCj4gPiA+ID4g
PiBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Q6OnZtX3BhZ2VfcHJvdCByYXRoZXIgdGhhbiB1c2luZyB2
bV9nZXRfcGFnZV9wcm90KCkuCj4gPiA+ID4gPiBUaGlzIHdheSB3ZSBjYXRjaCBtb2RpZmljYXRp
b25zIGRvbmUgYnkgdGhlIHZtIHN5c3RlbSBmb3IgZHJpdmVycyB0aGF0Cj4gPiA+ID4gPiB3YW50
IHdyaXRlLW5vdGlmaWNhdGlvbi4KPiA+ID4gPiBTbyBlc3NlbnRpYWxseSB0aGlzIHNob3VsZCBo
YXZlIGFueSBuZXcgc2lkZSBlZmZlY3Qgb24gZnVuY3Rpb25hbGl0eSBpdAo+ID4gPiA+IGlzIGp1
c3QgbWFraW5nIGEgaGFja3kvdWdseSBjb2RlIGxlc3Mgc28/Cj4gPiA+IEZ1bmN0aW9uYWxpdHkg
aXMgdW5jaGFuZ2VkLiBUaGUgdXNlIG9mIGEgb24tc3RhY2sgdm1hIGNvcHkgd2FzIHNldmVyZWx5
Cj4gPiA+IGZyb3duZWQgdXBvbiBpbiBhbiBlYXJsaWVyIHRocmVhZCwgd2hpY2ggYWxzbyBwb2lu
dHMgdG8gYW5vdGhlciBzaW1pbGFyCj4gPiA+IGV4YW1wbGUgdXNpbmcgdm1mX2luc2VydF9wZm5f
cHJvdCgpLgo+ID4gPiAKPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDkw
NTEwMzU0MS40MTYxLTItdGhvbWFzX29zQHNoaXBtYWlsLm9yZy8KPiA+ID4gCj4gPiA+ID4gSW4g
b3RoZXIgd29yZHMgd2hhdCBhcmUgdGhlCj4gPiA+ID4gY29uc2VxdWVuY2VzIG9mIGhhdmluZyBw
YWdlIHByb3RlY3Rpb24gaW5jb25zaXN0ZW50IGZyb20gdm1hJ3M/Cj4gPiA+IER1cmluZyB0aGUg
eWVhcnMsIGl0IGxvb2tzIGxpa2UgdGhlIGNhY2hpbmctIGFuZCBlbmNyeXB0aW9uIGZsYWdzIG9m
Cj4gPiA+IHZtYTo6dm1fcGFnZV9wcm90IGhhdmUgYmVlbiBsYXJnZWx5IHJlbW92ZWQgZnJvbSB1
c2FnZS4gRnJvbSB3aGF0IEkgY2FuCj4gPiA+IHRlbGwsIHRoZXJlIGFyZSBubyBtb3JlIHBsYWNl
cyBsZWZ0IHRoYXQgY2FuIGFmZmVjdCBUVE0uIFdlIGRpc2N1c3NlZAo+ID4gPiBfX3NwbGl0X2h1
Z2VfcG1kX2xvY2tlZCgpIHRvd2FyZHMgdGhlIGVuZCBvZiB0aGF0IHRocmVhZCwgYnV0IHRoYXQg
ZG9lc24ndAo+ID4gPiBhZmZlY3QgVFRNIGV2ZW4gd2l0aCBodWdlIHBhZ2UtdGFibGUgZW50cmll
cy4KPiA+IFBsZWFzZSBzdGF0ZSBhbGwgdGhvc2UgZGV0YWlscy9hc3N1bXB0aW9ucyB5b3UgYXJl
IG9wZXJhdGluZyBvbiBpbiB0aGUKPiA+IGNoYW5nZWxvZy4KPiAKPiBUaGFua3MuIEknbGwgdXBk
YXRlIHRoZSBwYXRjaHNldCBhbmQgYWRkIHRoYXQuCgpBbmQgdGhpbmtpbmcgYWJvdXQgdGhhdCB0
aGlzIGFsc28gYmVncyBmb3IgYSBjb21tZW50IGluIHRoZSBjb2RlIHRvCmV4cGxhaW4gdGhhdCBz
b21lICh3aGljaD8pIG1hcHBpbmdzIG1pZ2h0IGhhdmUgYSBtaXNtYXRjaCBhbmQgdGhlCmdlbmVy
aWMgY29kZSBoYXZlIHRvIGJlIGNhcmVmdWwuIEJlY2F1c2UgYXMgdGhpbmdzIHN0YW5kIG5vdyB0
aGlzIHNlZW1zCnRvIGJlIHJlYWxseSBzdWJ0bGUgYW5kIGhhcHBlbiB0byB3b3JrIF9ub3dfIGFu
ZCBtaWdodCBicmVhayBpbiB0aGUgZnV0dXJlLgpPciB3aGF0IGRvZXMgcHJldmVudCBhIGdlbmVy
aWMgY29kZSB0byBzdHVtYmxlIG92ZXIgdGhpcyBkaXNjcmVwYW5jeT8KLS0gCk1pY2hhbCBIb2Nr
bwpTVVNFIExhYnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
