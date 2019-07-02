Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5BE5D05C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 15:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0418089BBE;
	Tue,  2 Jul 2019 13:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7368A89BBE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 13:17:01 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so27245652eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 06:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=GjTPDe0xOLXCQ42kjksJhMQtbr7e/gOnvxffBVj5VYM=;
 b=DJinvojqhyntnxeaUBM1W2Ebehnj8IPbekuBH8LoDq2/EpzYdqu9kpjVM1ooA+qD8R
 xW8qPjDoCtE7LoacoOnE49OJUkG4JUvXeSm2A40djDhc5bJS4ij+qMQeYN97FEJw5pB/
 96byNWktf6Z7UEGp9WJXVMYRPtikxj43QDXKEstcUtOokjEMP3vIXXtIcceAibjXSdZt
 tQrLiX6/Yx84dAp/khhSCus6V7YiC1XI9Xyb/zV9+MCJBMicgDdFP7k8JXEm9IOi93Cz
 vGRg8Z5RbKUQdBjCsdEDlXT22lITdcTX7QIe8cCDzsS5ZKKDHokHDe8xu39ixNI38odj
 JsaQ==
X-Gm-Message-State: APjAAAVlkeby0Q2xTQDF6qA3bIoG27X167i2EbNwR9PymvRfvTmMVlWU
 it2cqRLwhUsvbPMd4LaFZXun+Q==
X-Google-Smtp-Source: APXvYqwROZlY4NhAUER24ig3V40kY5agwqbJ1sX3D63fvIeUb5fnhe+PrRVXP4NrOQjSehPxanpEtg==
X-Received: by 2002:a50:9157:: with SMTP id f23mr34902455eda.79.1562073420063; 
 Tue, 02 Jul 2019 06:17:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a3sm2736724ejn.64.2019.07.02.06.16.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 06:16:58 -0700 (PDT)
Date: Tue, 2 Jul 2019 15:16:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC PATCH v3 04/11] drm, cgroup: Add total GEM buffer
 allocation limit
Message-ID: <20190702131651.GA15868@phenom.ffwll.local>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-5-Kenny.Ho@amd.com>
 <20190626160553.GR12905@phenom.ffwll.local>
 <CAOWid-eurCMx1F7ciUwx0e+p=s=NP8=UxQUhhF-hdK-iAna+fA@mail.gmail.com>
 <20190626214113.GA12905@phenom.ffwll.local>
 <CAOWid-egYGijS0a6uuG4mPUmOWaPwF-EKokR=LFNJ=5M+akVZw@mail.gmail.com>
 <20190627054320.GB12905@phenom.ffwll.local>
 <CAOWid-cT4TQ7HGzcSWjmLGjAW_D1hRrkNguEiV8N+baNiKQm_A@mail.gmail.com>
 <20190627212401.GO12905@phenom.ffwll.local>
 <CAOWid-dZQhpKHxYEFn+X+WSep+B66M_LtN6v0=4-uO3ecZ0pcg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-dZQhpKHxYEFn+X+WSep+B66M_LtN6v0=4-uO3ecZ0pcg@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GjTPDe0xOLXCQ42kjksJhMQtbr7e/gOnvxffBVj5VYM=;
 b=SfkZ75kt4gYBpIqvUdeGKW/La+OD9o3pkBi2szmvwtNdrpFbBFUsOCFi3juAg1Bkqd
 nLpqW5wngRazdSCLVAeSksqThkNT5+8quj2tXn9MCNAPe1roBunYJLBd2mbzkjs7AYwk
 5wrZG2AG5O69LENVr18Ynb/lTPygEBYUM3gcA=
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
Cc: joseph.greathouse@amd.com, Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDI6NDM6MThQTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgNToyNCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDI6NDI6NDNQTSAt
MDQwMCwgS2VubnkgSG8gd3JvdGU6Cj4gPiA+IFVtLi4uIEkgYW0gZ29pbmcgdG8gZ2V0IGEgYml0
IHBoaWxvc29waGljYWwgaGVyZSBhbmQgc3VnZ2VzdCB0aGF0IHRoZQo+ID4gPiBpZGVhIG9mIHNo
YXJpbmcgKGVzcGVjaWFsbHkgdW5jb250cm9sbGVkIHNoYXJpbmcpIGlzIGluaGVyZW50bHkgYXQg
b2RkCj4gPiA+IHdpdGggY29udGFpbm1lbnQuICBJdCdzIGxpa2UsIGlmIGV2ZXJ5Ym9keSBpcyBz
cGVjaWFsLCBubyBvbmUgaXMKPiA+ID4gc3BlY2lhbC4gIFBlcmhhcHMgYW4gYWx0ZXJuYXRpdmUg
aXMgdG8gbWFrZSB0aGlzIGNvbmZpZ3VyYWJsZSBzbyB0aGF0Cj4gPiA+IHBlb3BsZSBjYW4gYWxs
b3cgc2hhcmluZyBrbm93aW5nIHRoZSBjYXZlYXQ/ICBBbmQganVzdCB0byBiZSBjbGVhciwKPiA+
ID4gdGhlIGN1cnJlbnQgc29sdXRpb24gYWxsb3dzIGZvciBzaGFyaW5nLCBldmVuIGJldHdlZW4g
Y2dyb3VwLgo+ID4KPiA+IFRoZSB0aGluZyBpcywgd2h5IHNob3VsZG4ndCB3ZSBqdXN0IGFsbG93
IGl0ICh3aXRoIHNvbWUgZG9jdW1lbnRlZAo+ID4gY2F2ZWF0KT8KPiA+Cj4gPiBJIG1lYW4gaWYg
YWxsIHBlb3BsZSBkbyBpcyBzaGFyZSBpdCBhcyB5b3VyIGN1cnJlbnQgcGF0Y2hlcyBhbGxvdywg
dGhlbgo+ID4gdGhlcmUncyBub3RoaW5nIGZ1bm55IGdvaW5nIG9uIChhdCBsZWFzdCBpZiB3ZSBn
byB3aXRoIGp1c3QgbGVha2luZyB0aGUKPiA+IGFsbG9jYXRpb25zKS4gSWYgd2UgYWxsb3cgYWRk
aXRpb25hbCBzaGFyaW5nLCB0aGVuIHRoYXQncyBhIHBsdXMuCj4gVW0uLi4gcGVyaGFwcyBJIHdh
cyBiZWluZyBvdmVybHkgY29uc2VydmF0aXZlIDopLiAgU28gbGV0IG1lCj4gaWxsdXN0cmF0ZSB3
aXRoIGFuIGV4YW1wbGUgdG8gYWRkIG1vcmUgY2xhcml0eSBhbmQgZ2V0IG1vcmUgY29tbWVudHMK
PiBvbiBpdC4KPiAKPiBMZXQgc2F5IHdlIGhhdmUgdGhlIGZvbGxvd2luZyBjZ3JvdXAgaGllcmFy
Y2h5IChUaGUgbGV0dGVycyBhcmUKPiBjZ3JvdXBzIHdpdGggUiBiZWluZyB0aGUgcm9vdCBjZ3Jv
dXAuICBUaGUgbnVtYmVycyBpbiBicmFja2V0cyBhcmUKPiBwcm9jZXNzZXMuICBUaGUgcHJvY2Vz
c2VzIGFyZSBwbGFjZWQgd2l0aCB0aGUgJ05vIEludGVybmFsIFByb2Nlc3MKPiBDb25zdHJhaW50
JyBpbiBtaW5kLikKPiBSICg0LCA1KSAtLS0tLS0gQSAoNikKPiAgIFwKPiAgICAgQiAtLS0tIEMg
KDcsOCkKPiAgICAgIFwKPiAgICAgICAgRCAoOSkKPiAKPiBIZXJlIGlzIGEgbGlzdCBvZiBvcGVy
YXRpb24gYW5kIHRoZSBhc3NvY2lhdGVkIGVmZmVjdCBvbiB0aGUgc2l6ZQo+IHRyYWNrIGJ5IHRo
ZSBjZ3JvdXBzIChmb3Igc2ltcGxpY2l0eSwgZWFjaCBidWZmZXIgaXMgMSB1bml0IGluIHNpemUu
KQo+IFdpdGggY3VycmVudCBpbXBsZW1lbnRhdGlvbiAoY2hhcmdlIG9uIGJ1ZmZlciBjcmVhdGlv
biB3aXRoCj4gcmVzdHJpY3Rpb24gb24gc2hhcmluZy4pCj4gUiAgIEEgICBCICAgQyAgIEQgICB8
T3BzCj4gPT09PT09PT09PT09PT09PQo+IDEgICAwICAgMCAgIDAgICAwICAgfDQgYWxsb2NhdGVk
IGEgYnVmZmVyCj4gMSAgIDAgICAwICAgMCAgIDAgICB8NCBzaGFyZWQgYSBidWZmZXIgd2l0aCA1
Cj4gMSAgIDAgICAwICAgMCAgIDAgICB8NCBzaGFyZWQgYSBidWZmZXIgd2l0aCA5Cj4gMiAgIDAg
ICAxICAgMCAgIDEgICB8OSBhbGxvY2F0ZWQgYSBidWZmZXIKPiAzICAgMCAgIDIgICAxICAgMSAg
IHw3IGFsbG9jYXRlZCBhIGJ1ZmZlcgo+IDMgICAwICAgMiAgIDEgICAxICAgfDcgc2hhcmVkIGEg
YnVmZmVyIHdpdGggOAo+IDMgICAwICAgMiAgIDEgICAxICAgfDcgc2hhcmluZyB3aXRoIDkgKG5v
dCBhbGxvd2VkKQo+IDMgICAwICAgMiAgIDEgICAxICAgfDcgc2hhcmluZyB3aXRoIDQgKG5vdCBh
bGxvd2VkKQo+IDMgICAwICAgMiAgIDEgICAxICAgfDcgcmVsZWFzZSBhIGJ1ZmZlcgo+IDIgICAw
ICAgMSAgIDAgICAxICAgfDggcmVsZWFzZSBhIGJ1ZmZlciBmcm9tIDcKClRoaXMgaXMgeW91ciBj
dXJyZW50IGltcGxlbWVudGF0aW9uLCByaWdodD8gTGV0J3MgY2FsbCBpdCBBLgoKPiBUaGUgc3Vn
Z2VzdGlvbiBhcyBJIHVuZGVyc3RhbmQgaXQgKGNoYXJnZSBwZXIgYnVmZmVyIHJlZmVyZW5jZSB3
aXRoCj4gdW5yZXN0cmljdGVkIHNoYXJpbmcuKQo+IFIgICBBICAgQiAgIEMgICBEICAgfE9wcwo+
ID09PT09PT09PT09PT09PT0KPiAxICAgMCAgIDAgICAwICAgMCAgIHw0IGFsbG9jYXRlZCBhIGJ1
ZmZlcgo+IDIgICAwICAgMCAgIDAgICAwICAgfDQgc2hhcmVkIGEgYnVmZmVyIHdpdGggNQo+IDMg
ICAwICAgMCAgIDAgICAxICAgfDQgc2hhcmVkIGEgYnVmZmVyIHdpdGggOQo+IDQgICAwICAgMSAg
IDAgICAyICAgfDkgYWxsb2NhdGVkIGEgYnVmZmVyCj4gNSAgIDAgICAyICAgMSAgIDEgICB8NyBh
bGxvY2F0ZWQgYSBidWZmZXIKPiA2ICAgMCAgIDMgICAyICAgMSAgIHw3IHNoYXJlZCBhIGJ1ZmZl
ciB3aXRoIDgKPiA3ICAgMCAgIDQgICAyICAgMiAgIHw3IHNoYXJpbmcgd2l0aCA5Cj4gOCAgIDAg
ICA0ICAgMiAgIDIgICB8NyBzaGFyaW5nIHdpdGggNAo+IDcgICAwICAgMyAgIDEgICAyICAgfDcg
cmVsZWFzZSBhIGJ1ZmZlcgo+IDYgICAwICAgMiAgIDAgICAyICAgfDggcmVsZWFzZSBhIGJ1ZmZl
ciBmcm9tIDcKPiAKPiBJcyB0aGlzIGEgY29ycmVjdCB1bmRlcnN0YW5kaW5nIG9mIHRoZSBzdWdn
ZXN0aW9uPwoKWXVwIHRoYXQncyBvbmUgb3B0aW9uIEkgdGhpbmsuIFRoZSBvdGhlciBvcHRpb24g
KGFuZCBpdCdzIHByb2JhYmx5CnNpbXBsZXIpLCBpcyB0byBnbyB3aXRoIHlvdXIgY3VycmVudCBh
Y2NvdW50aW5nLCBidXQgZHJvcCB0aGUgc2hhcmluZwpyZXN0cmljdGlvbi4gSS5lLiBidWZmZXJz
IGFyZSBhY2NvdW50aW5nIHRvIHdob21ldmVyIGFsbG9jYXRlcyB0aGVtIGZpcnN0LApub3Qgd2hv
J3MgYWxsIHVzaW5nIHRoZW0uIEZvciBtZW1jZyB0aGlzIGhhcyBzb21lIHNlcmlvdXMgdHJvdWJs
ZSB3aXRoCmNncm91cHMgbm90IGdldHRpbmcgY2xlYW5lZCB1cCBkdWUgdG8gbGVha2VkIHJlZnJl
bmNlcy4gQnV0IGZvciBnZW0gYm8gd2UKc3ByZWFkIHRoZSByZWZlcmVuY2VzIGluIGEgbG90IG1v
cmUgY29udHJvbGxlZCBtYW5uZXIsIGFuZCBhbGwgdGhlCmxvbmctbGl2ZWQgcmVmZXJlbmNlcyBh
cmUgdW5kZXIgY29udHJvbCBvZiB1c2Vyc3BhY2UuCgpFLmcuIGlmIFhvcmcgZmFpbHMgdG8gY2xl
YW4gdXAgYm8gcmVmZXJlbmNlcyBvZiBjbGllbnRzIHRoYXQgZGVhZCwgdGhhdCdzCmNsZWFybHkg
YW4gWG9yZyBidWcgYW5kIG5lZWRzIHRvIGJlIGZpeGVkIHRoZXJlLiBCdXQgbm90IHNvbWV0aGlu
ZyB3ZSBuZWVkCnRvIGFsbG93IGFzIGEgdmFsaWQgdXNlLWNhc2VzLiBGb3IgcGFnZSByZWZlcmVu
Y2VzL2FjY291bnRpbmcgaW4gbWVtY2cKdGhpcyBpcyB0b3RhbGx5IGRpZmZlcmVudCwgc2luY2Ug
cGFnZXMgY2FuIHN1cnZpdmUgaW4gdGhlIHBhZ2VjYWNoZQpmb3JldmVyLiBObyBzdWNoIGJvLWNh
Y2hlIG9yIGFueXRoaW5nIHNpbWlsYXIgZXhpc3RzIGZvciBnZW1fYm8uCgpQZXJzb25hbGx5IEkg
cHJlZmVyIG9wdGlvbiBBLCBidXQgb24gc2hhcmluZyByZXN0cmljdGlvbi4gSWYgeW91IHdhbnQg
dGhhdApzaGFyaW5nIHJlc3RyaWN0aW9uLCB3ZSBuZWVkIHRvIGZpZ3VyZSBvdXQgaG93IHRvIGlt
cGxlbWVudCBpdCB1c2luZwpzb21ldGhpbmcgZWxzZS4gUGx1cyB3ZSBuZWVkIHRvIG1ha2Ugc3Vy
ZSBhbGwgcG9zc2libGUgd2F5cyB0byBzaGFyZSBhIGJvCmFyZSBjb3ZlcmVkIChhbmQgdGhlcmUg
YXJlIG1hbnkpLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
