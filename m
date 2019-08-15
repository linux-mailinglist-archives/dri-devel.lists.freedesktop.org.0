Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3398E53A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 09:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D7F6E8AC;
	Thu, 15 Aug 2019 07:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE426E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 07:10:19 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h8so1333892edv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 00:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=MDJNuF+hut+3YRzITm+axnt/d3tCzk1EPMOdFx9+DEE=;
 b=N+HroFXKwhGEsOxWxTHIZ4ovfZo/QFhW6i6BVvRrb8d+dxjbwVB8JhAXDm4QbkV+R5
 001s/61bHKCRM1AAGk4W2f6qksMwtKi94uZSbMeXmAt6QP0YKYyo45y0sXqSdW4/7joL
 DUWH4F8ack79lFrr0RNgT3hhdljObl4jbNZFF+0wx5W6IQ/L2q4TtjN2rlG2LE6dSOpT
 6q8JwGjQpzxa6XOkitsKU87ZWLV6hZ+ri5g7r47CCTadRndXGuwLAoa9toWsYW5pW9pG
 JTBx3HUHS/xRA+PEUZCZ+uamUfCi2WTqRER6Plpk1DdcozXsAZ9EbImTqBnOVtzZMa44
 CFWQ==
X-Gm-Message-State: APjAAAVny5RB2mwSjflYBkefc/MfTqq/a3j//xZi65VP5C2hmFw+/pGj
 L8dW9NHAuO+BJpWt9423XyI0dg==
X-Google-Smtp-Source: APXvYqzeqsYGya7a5gyG8JjAs2HpNqhI6YY0zlDjUM0vg0ax5p423oBpWZJFMYcam0b+ez79KuLR5w==
X-Received: by 2002:a50:c101:: with SMTP id l1mr854278edf.157.1565853017629;
 Thu, 15 Aug 2019 00:10:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q21sm257841ejo.76.2019.08.15.00.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 00:10:16 -0700 (PDT)
Date: Thu, 15 Aug 2019 09:10:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 4/5] mm, notifier: Add a lockdep map for
 invalidate_range_start
Message-ID: <20190815071014.GC7444@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Rientjes <rientjes@google.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-5-daniel.vetter@ffwll.ch>
 <20190815000959.GD11200@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815000959.GD11200@ziepe.ca>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=MDJNuF+hut+3YRzITm+axnt/d3tCzk1EPMOdFx9+DEE=;
 b=ChRXyIAYC7Rv8Y/vZMRO+O0Vlh5DAbIO5arU41q9pJ83DPuxW7q/ClkJgPqFUTZdkI
 RFRAoqFle60uB8sY67kiMD84/VinSId3gTA/SLZHu2D0j6h0ZI94eO3b9q/2tAqdpX+c
 FhwIh8fhcacKOZx661IGz8Odmwog/6hD0LIYg=
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
Cc: Michal Hocko <mhocko@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, David Rientjes <rientjes@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6MDk6NTlQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDEwOjIwOjI2UE0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBUaGlzIGlzIGEgc2ltaWxhciBpZGVhIHRvIHRoZSBmc19yZWNs
YWltIGZha2UgbG9ja2RlcCBsb2NrLiBJdCdzCj4gPiBmYWlybHkgZWFzeSB0byBwcm92b2tlIGEg
c3BlY2lmaWMgbm90aWZpZXIgdG8gYmUgcnVuIG9uIGEgc3BlY2lmaWMKPiA+IHJhbmdlOiBKdXN0
IHByZXAgaXQsIGFuZCB0aGVuIG11bm1hcCgpIGl0Lgo+ID4gCj4gPiBBIGJpdCBoYXJkZXIsIGJ1
dCBzdGlsbCBkb2FibGUsIGlzIHRvIHByb3Zva2UgdGhlIG1tdSBub3RpZmllcnMgZm9yCj4gPiBh
bGwgdGhlIHZhcmlvdXMgY2FsbGNoYWlucyB0aGF0IG1pZ2h0IGxlYWQgdG8gdGhlbS4gQnV0IGJv
dGggYXQgdGhlCj4gPiBzYW1lIHRpbWUgaXMgcmVhbGx5IGhhcmQgdG8gcmVsaWFibGUgaGl0LCBl
c3BlY2lhbGx5IHdoZW4geW91IHdhbnQgdG8KPiA+IGV4ZXJjaXNlIHBhdGhzIGxpa2UgZGlyZWN0
IHJlY2xhaW0gb3IgY29tcGFjdGlvbiwgd2hlcmUgaXQncyBub3QKPiA+IGVhc3kgdG8gY29udHJv
bCB3aGF0IGV4YWN0bHkgd2lsbCBiZSB1bm1hcHBlZC4KPiA+IAo+ID4gQnkgaW50cm9kdWNpbmcg
YSBsb2NrZGVwIG1hcCB0byB0aWUgdGhlbSBhbGwgdG9nZXRoZXIgd2UgYWxsb3cgbG9ja2RlcAo+
ID4gdG8gc2VlIGEgbG90IG1vcmUgZGVwZW5kZW5jaWVzLCB3aXRob3V0IGhhdmluZyB0byBhY3R1
YWxseSBoaXQgdGhlbQo+ID4gaW4gYSBzaW5nbGUgY2hhbGxjaGFpbiB3aGlsZSB0ZXN0aW5nLgo+
ID4gCj4gPiBBc2lkZTogU2luY2UgSSB0eXBlZCB0aGlzIHRvIHRlc3QgaTkxNSBtbXUgbm90aWZp
ZXJzIEkndmUgb25seSByb2xsZWQKPiA+IHRoaXMgb3V0IGZvciB0aGUgaW52YWxpYXRlX3Jhbmdl
X3N0YXJ0IGNhbGxiYWNrLiBJZiB0aGVyZSdzCj4gPiBpbnRlcmVzdCwgd2Ugc2hvdWxkIHByb2Jh
Ymx5IHJvbGwgdGhpcyBvdXQgdG8gYWxsIG9mIHRoZW0uIEJ1dCBteQo+ID4gdW5kZXN0YW5kaW5n
IG9mIGNvcmUgbW0gaXMgc2VyaW91c2x5IGxhY2tpbmcsIGFuZCBJJ20gbm90IGNsZWFyIG9uCj4g
PiB3aGV0aGVyIHdlIG5lZWQgYSBsb2NrZGVwIG1hcCBmb3IgZWFjaCBjYWxsYmFjaywgb3Igd2hl
dGhlciBzb21lIGNhbgo+ID4gYmUgc2hhcmVkLgo+IAo+IEkgd2FzIHRoaW5raW5nIGFib3V0IGRv
aW5nIHNvbWV0aGluZyBsaWtlIHRoaXMuLgo+IAo+IElNSE8gb25seSByYW5nZV9lbmQgbmVlZHMg
YW5ub3RhdGlvbiwgdGhlIG90aGVyIG9wcyBhcmUgZWl0aGVyIGFscmVhZHkKPiBub24tc2xlZXBp
bmcgb3Igb25seSB1c2VkIGJ5IEtWTS4KClRoaXMgaXNudCcgYWJvdXQgc2xlZXBpbmcsIHRoaXMg
aXMgYWJvdXQgbG9ja2luZyBsb29wcy4gQW5kIHRoZSBiaWdnZXN0CnJpc2sgZm9yIHRoYXQgaXMg
ZnJvbSBkcml2ZXIgY29kZSwgYW5kIGF0IGxlYXN0IGhtbV9taXJyb3Igb25seSBoYXMgdGhlCmRy
aXZlciBjb2RlIGNhbGxiYWNrIG9uIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQuIE9uY2UgdGhpbmcg
SSBkaXNjb3ZlcmVkCnVzaW5nIHRoaXMgKGFuZCBpdCB3b3VsZCBiZSByZWFsbHkgaGFyZCB0byBz
cG90LCBpdCdzIGRlZXBseSBuZWVzdGVkKSBpcwp0aGF0IGk5MTUgdXNlcnB0ci4KCkV2ZW4gaWYg
aTkxNSB1c2VycHRyIHdvdWxkIHVzZSBobW1fbWlycm9yICh0byBmaXggdGhlIGlzc3VlIHlvdSBt
ZW50aW9uCmJlbG93KSwgaWYgd2UgdGhlbiBzd2l0Y2ggdGhlIGFubm90YXRpb24gdG8gaW52YWxp
ZGF0ZV9yYW5nZV9lbmQgbm90aGluZwppbnRlcmVzdGluZyB3b3VsZCBldmVyIGNvbWUgZnJvbSB0
aGlzLiBXZWxsLCB0aGUgb25seSB0aGluZyBpdCdkIGNhdGNoIGlzCmlzc3VlcyBpbiBobW1fbWly
cm9yLCBidXQgSSB0aGluayBjb3JlIG1tIHJldmlldyB3aWxsIGNhdGNoIHRoYXQgYmVmb3JlIGl0
CnJlYWNoZXMgdXMgOi0pCgo+IEJUVywgSSBoYXZlIGZvdW5kIGl0IHN0cmFuZ2UgdGhhdCBpOTE1
IG9ubHkgdXNlcwo+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQuIE5vdCByZWFsbHkgc3VyZSBob3cg
aXQgaXMgYWJsZSB0byBkbwo+IHRoYXQuIFdvdWxkIGxvdmUgdG8ga25vdyB0aGUgYW5zd2VyIDop
CgpJIHN1c3BlY3QgaXQncyBicm9rZW4gOi0vIE91ciB1c2VycHRyIGlzIC4uLiBub3QgdGhlIGJl
c3QuIFBhcnQgb2YgdGhlCm1vdGl2YXRpb24gaGVyZS4KCj4gPiBSZXZpZXdlZC1ieTogSsOpcsO0
bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+ICBpbmNsdWRlL2xpbnV4L21tdV9u
b3RpZmllci5oIHwgNiArKysrKysKPiA+ICBtbS9tbXVfbm90aWZpZXIuYyAgICAgICAgICAgIHwg
NyArKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oIGIvaW5jbHVkZS9saW51
eC9tbXVfbm90aWZpZXIuaAo+ID4gaW5kZXggYjZjMDA0YmQ5ZjZhLi45ZGQzOGMzMmZjNTMgMTAw
NjQ0Cj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCj4gPiBAQCAtNDIsNiAr
NDIsMTAgQEAgZW51bSBtbXVfbm90aWZpZXJfZXZlbnQgewo+ID4gIAo+ID4gICNpZmRlZiBDT05G
SUdfTU1VX05PVElGSUVSCj4gPiAgCj4gPiArI2lmZGVmIENPTkZJR19MT0NLREVQCj4gPiArZXh0
ZXJuIHN0cnVjdCBsb2NrZGVwX21hcCBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0
YXJ0X21hcDsKPiA+ICsjZW5kaWYKPiAKPiBJIHdvbmRlciB3aGF0IHRoZSB0cmFkZSBvZmYgaXMg
aGF2aW5nIGEgZ2xvYmFsIG1hcCB2cyBhIG1hcCBpbiBlYWNoCj4gbW11X25vdGlmaWVyX21tID8K
Ckxlc3MgcmVwb3J0cywgc3BlY2lmaWNhbGx5IG5vIHJlcG9ydHMgaW52b2x2aW5nIG11bHRpcGxl
IGRpZmZlcmVudCBtbXUKbm90aWZpZXJzIHRvIGJ1aWxkIHRoZSBlbnRpcmUgY2hhaW4uIEJ1dCBJ
J20gYXNzdW1pbmcgaXQncyBwb3NzaWJsZSB0bwpjb21iaW5lIHRoZW0gaW4gb25lIG1tIChrdm0r
Z3B1K2luZmluaWJhbmQgaW4gb25lIHByb2Nlc3Mgc291bmRzIGxpa2UKc29tZXRoaW5nIHNvbWVv
bmUgY291bGQgcmVhc29uYWJseSBkbyksIGFuZCBpdCB3aWxsIGhlbHAgdG8gbWFrZSBzdXJlCmV2
ZXJ5b25lIGZvbGxvd3MgdGhlIHNhbWUgcnVsZXMuCj4gCj4gPiAgLyoKPiA+ICAgKiBUaGUgbW11
IG5vdGlmaWVyX21tIHN0cnVjdHVyZSBpcyBhbGxvY2F0ZWQgYW5kIGluc3RhbGxlZCBpbgo+ID4g
ICAqIG1tLT5tbXVfbm90aWZpZXJfbW0gaW5zaWRlIHRoZSBtbV90YWtlX2FsbF9sb2NrcygpIHBy
b3RlY3RlZAo+ID4gQEAgLTMxMCwxMCArMzE0LDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtbXVf
bm90aWZpZXJfY2hhbmdlX3B0ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiA+ICBzdGF0aWMgaW5s
aW5lIHZvaWQKPiA+ICBtbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydChzdHJ1Y3Qg
bW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPiA+ICB7Cj4gPiArCWxvY2tfbWFwX2FjcXVpcmUo
Jl9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwKTsKPiA+ICAJaWYgKG1t
X2hhc19ub3RpZmllcnMocmFuZ2UtPm1tKSkgewo+ID4gIAkJcmFuZ2UtPmZsYWdzIHw9IE1NVV9O
T1RJRklFUl9SQU5HRV9CTE9DS0FCTEU7Cj4gPiAgCQlfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRl
X3JhbmdlX3N0YXJ0KHJhbmdlKTsKPiA+ICAJfQo+ID4gKwlsb2NrX21hcF9yZWxlYXNlKCZfX21t
dV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcCk7Cj4gPiAgfQo+IAo+IEFsc28g
cmFuZ2VfZW5kIHNob3VsZCBoYXZlIHRoaXMgdG9vIC0gaXQgaGFzIGFsbCB0aGUgc2FtZQo+IGNv
bnN0cmFpbnRzLiBJIHRoaW5rIGl0IGNhbiBzaGFyZSB0aGUgbWFwLiBTbyAncmFuZ2Vfc3RhcnRf
bWFwJyBpcwo+IHByb2JhYmx5IG5vdCB0aGUgcmlnaHQgbmFtZS4KPiAKPiBJdCBtYXkgYWxzbyBt
YWtlIHNvbWUgc2Vuc2UgdG8gZG8gYSBkdW1teSBhY3F1aXJlL3JlbGVhc2UgdW5kZXIgdGhlCj4g
bW1fdGFrZV9hbGxfbG9ja3MoKSB0byBmb3JjaWJseSBpbmNyZWFzZSBtYXAgY292ZXJhZ2UgYW5k
IHJlZHVjZSB0aGUKPiBzY2VuYXJpbyBjb21wbGV4aXR5IHJlcXVpcmVkIHRvIGhpdCBidWdzLgo+
IAo+IEFuZCBpZiB3ZSBkbyBkZWNpZGUgb24gdGhlIHJlY2xhaW0gdGhpbmcgaW4gbXkgb3RoZXIg
ZW1haWwgdGhlbiB0aGUKPiByZWNsYWltIGRlcGVuZGVuY3kgY2FuIGJlIHJlbGlhYmx5IGluamVj
dGVkIGJ5IGRvaW5nOgo+IAo+ICBmc19yZWNsYWltX2FjcXVpcmUoKTsKPiAgbG9ja19tYXBfYWNx
dWlyZSgmX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXApOwo+ICBsb2Nr
X21hcF9yZWxlYXNlKCZfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcCk7
Cj4gIGZzX3JlY2xhaW1fcmVsZWFzZSgpOwo+IAo+IElmIEkgdW5kZXJzdGFuZCBsb2NrZGVwIHBy
b3Blcmx5Li4KCkltZSBmc19yZWNsYWltIGluamVjdHMgdGhlIG1tdV9ub3RpZmllciBtYXAgaGVy
ZSByZWxpYWJseSBhcyBzb29uIGFzCnlvdSd2ZSB0aHJvd24gb3V0IHRoZSBmaXJzdCBwYWdlY2Fj
aGUgbW1hcCBvbiBhbnkgcHJvY2Vzcy4gVGhhdCAibWFrZSBzdXJlCndlIGluamVjdCBpdCBxdWlj
a2x5IiBpcyB3aHkgdGhlIGxvY2tkZXAgaXMgX291dHNpZGVfIG9mIHRoZQptbV9oYXNfbm90aWZp
ZXJzKCkgY2hlY2suIFNvIG5vIGZ1cnRoZXIgaW5qZWN0aW9uIG5lZWRlZCBpbW8uCi1EYW5pZWwK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
