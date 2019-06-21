Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA54EC69
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F3B6E8E2;
	Fri, 21 Jun 2019 15:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF8D6E8E2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 15:44:24 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w13so10750551eds.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 08:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Dl3gx65xn10TpgpezfXO23JkPNGGWF3yzdcq9uF3Z7o=;
 b=oELFMTUrFNmykSC9CX2cqTTZwgKYhfPJzNNc+J3VMDpCDCiDF2cv5maGtJmymK01vF
 quCfLyWoO5pUX9C57mob0SoGKuy3LrbUPQE5M+V+IUIUZWB0cr0NeB6s120vjPt5M/VU
 jfxIW6xgns79oJ1RtBq2ZlYkn6ULk8spa5Y3OFyG32a8Odqfj6gjBR8NToQSkph0D4T8
 yUHEBkuoLSRyrvSpegu8Cjv0wjyt+1VhH4NCHwXZUggqy7vCDjTGCIQWa6Djb6naS/0W
 e2yFHCKKl3YprlkohGVzdsYnzCq1Mf+KLQ83Y8ttgWIO7L2x5WqtvyqZznNPnAfbtW7G
 KH3Q==
X-Gm-Message-State: APjAAAWwkf6W4d6pXLfuruoqlxM0DbV5hb4UIUPYHvOF1HCPBlgHr4NT
 gnuvebKbCyIYS2F0H1WqclQK3g==
X-Google-Smtp-Source: APXvYqzrAMTwnfOJt1frKBSFIi5YN/m3xLR2QiGT5pxUQRUmJYy5OI7ZKhSsust9AhwXUClH/PPEmw==
X-Received: by 2002:a17:906:7541:: with SMTP id
 a1mr116963838ejn.50.1561131863468; 
 Fri, 21 Jun 2019 08:44:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id bq8sm484574ejb.42.2019.06.21.08.44.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 08:44:22 -0700 (PDT)
Date: Fri, 21 Jun 2019 17:44:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190621154416.GE12905@phenom.ffwll.local>
References: <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <CAKMK7uEVziNZJES9=JFBUu=LpmubS8=-A654cMN+QqhEmc8Fvw@mail.gmail.com>
 <c92dc683-6815-dc5a-dc2b-54517cc027de@gmail.com>
 <CAKMK7uHsv3HOXOQq=GGRkx6f+ssRg7dO7qEoBqRS9V_KiTN3Hg@mail.gmail.com>
 <b182c8e3-c060-71f0-2b3b-62600d825c9f@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b182c8e3-c060-71f0-2b3b-62600d825c9f@daenzer.net>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Dl3gx65xn10TpgpezfXO23JkPNGGWF3yzdcq9uF3Z7o=;
 b=ULU3fQC2qfZWw2Kx2+5ooGZIr2Azykn+BslBEPHjZoBYuilO8b0VVAa34XaXZoSPlC
 H6AMYYU7PZyRF1Lb/GqTapvSiN748iEM/fut0Rr8jXgSLE7RCS6YG4lywu00tCUSfELq
 ekhJ6c3Fw07erjqKAL3EiC/SRL2k9ONP3NjTU=
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
Cc: David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDU6MTU6MjJQTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj4gT24gMjAxOS0wNi0yMSAxOjUwIHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4g
PiBPbiBGcmksIEp1biAyMSwgMjAxOSBhdCAxOjM3IFBNIENocmlzdGlhbiBLw7ZuaWcKPiA+IDxj
a29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4gQW0gMjEuMDYuMTkg
dW0gMTM6MDMgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+ID4+PiBTbyBpZiB5b3Ugd2FudCB0byBk
ZXByYWNhdGUgcmVuZGVyIGZ1bmN0aW9uYWxpdHkgb24gcHJpbWFyeSBub2RlcywgeW91Cj4gPj4+
IF9oYXZlXyB0byBkbyB0aGF0IGhpZGluZyBpbiB1c2Vyc3BhY2UuIE9yIHlvdSdsbCBicmVhayBh
IGxvdCBvZgo+ID4+PiBjb21wb3NpdG9ycyBldmVyeXdoZXJlLiBKdXN0IHRlc3RpbmcgLWFtZGdw
dSBkb2Vzbid0IHJlYWxseSBwcm92ZQo+ID4+PiBhbnl0aGluZyBoZXJlLiBTbyB5b3Ugd29uJ3Qg
bW92ZSB0aGUgbGFyZ2VyIGVjb3N5c3RlbSB3aXRoIHRoaXMgYXQKPiA+Pj4gYWxsLCB0aGF0IHNo
aXAgc2FpbGVkLgo+ID4+Cj4gPj4gU28gd2hhdCBlbHNlIGNhbiB3ZSBkbz8gVGhhdCBzb3VuZHMg
bGlrZSB5b3Ugc3VnZ2VzdCB3ZSBzaG91bGQKPiA+PiBjb21wbGV0ZWx5IGRyb3AgcmVuZGVyIG5v
ZGUgZnVuY3Rpb25hbGl0eS4KPiA+Pgo+ID4+IEkgbWVhbiBpdCdzIG5vdCBteSBwcmVmZXJyZWQg
b3B0aW9uLCBidXQgY2VydGFpbmx5IHNvbWV0aGluZyB0aGF0Cj4gPj4gZXZlcnlib2R5IGNvdWxk
IGRvLgo+ID4+Cj4gPj4gTXkgcHJpbWFyeSBjb25jZXJuIGlzIHRoYXQgd2Ugc29tZWhvdyBuZWVk
IHRvIGdldCByaWQgb2YgdGhpbmtzIGxpa2UgR0VNCj4gPj4gZmxpbmsgYW5kIGFsbCB0aGF0IG90
aGVyIGNydWZ0eSBzdHVmZiB3ZSBzdGlsbCBoYXZlIGFyb3VuZCBvbiB0aGUKPiA+PiBwcmltYXJ5
IG5vZGUgKHdlIHNob3VsZCBwcm9iYWJseSBtYWtlIGEgbGlzdCBvZiB0aGF0KS4KPiA+Pgo+ID4+
IFN3aXRjaGluZyBldmVyeXRoaW5nIG92ZXIgdG8gcmVuZGVyIG5vZGVzIGp1c3Qgc291bmRlZCBs
aWtlIHRoZSBiZXN0Cj4gPj4gYWx0ZXJuYXRpdmUgc28gZmFyIHRvIGFyY2hpdmUgdGhhdC4KPiA+
IAo+ID4gdGJoIEkgZG8gbGlrZSB0aGF0IHBsYW4gdG9vLCBidXQgaXQncyBhIGxvdCBtb3JlIHdv
cmsuIEFuZCBJIHRoaW5rIHRvCj4gPiBoYXZlIGFueSBwdXNoIHdoYXRzb2V2ZXIgd2UgcHJvYmFi
bHkgbmVlZCB0byByb2xsIGl0IG91dCBpbiBnYm0gYXMgYQo+ID4gaGFjayB0byBrZWVwIHRoaW5n
cyBnb2luZy4gQnV0IHByb2JhYmx5IG5vdCBlbm91Z2guCj4gPiAKPiA+IEkgYWxzbyB0aGluayB0
aGF0IGF0IGxlYXN0IHNvbWUgY29tcG9zaXRvcnMgd2lsbCBib3RoZXIgdG8gZG8gdGhlCj4gPiBy
aWdodCB0aGluZywgYW5kIGFjdHVhbGx5IGJvdGhlciB3aXRoIHJlbmRlciBub2RlcyBhbmQgYWxs
IHRoYXQKPiA+IGNvcnJlY3RseS4gSXQncyBqdXN0IHRoYXQgdGhlcmUncyB3YXkgbW9yZSB3aGlj
aCBkb250Lgo+IAo+IFdpdGggYW1kZ3B1LCB3ZSBjYW4gbWFrZSB1c2Vyc3BhY2UgYWx3YXlzIHVz
ZSByZW5kZXIgbm9kZXMgZm9yIHJlbmRlcmluZwo+IHdpdGggY2hhbmdlcyB0byBsaWJkcm1fYW1k
Z3B1L3JhZGVvbnNpL3hmODYtdmlkZW8tYW1kZ3B1IChhbmQgbWF5YmUgc29tZQo+IGFtZGdwdS1w
cm8gY29tcG9uZW50cykgb25seS4gTm8gR0JNL2NvbXBvc2l0b3IgY2hhbmdlcyBuZWVkZWQuCgpU
aGlzIGlzIGEgdmVyeSBub24tZXhoYXVzdGl2ZSBsaXN0IG9mIHVzZXJzcGFjZSB0aGF0IHJ1bnMg
b24geW91ciBkcml2ZXIKLi4uIFRoaXMgd2F5bGFuZCBjb21wb3NpdG9yIHRoaW5nLCBhY3R1YWxs
eSBzaGlwcGluZyBub3csIGFuZCB0aGVyZSdzIG1hbnkgOi0pCgo+ID4+PiBBdCB0aGF0IHBvaW50
IHRoaXMgYWxsIGZlZWxzIGxpa2UgYSBiaWtlc2hlZCwgYW5kIGZvciBhIGJpa2VzaGVkIEkKPiA+
Pj4gZG9uJ3QgY2FyZSB3aGF0IHRoZSBjb2xvciBpcyB3ZSBwaWNrLCBhcyBsb25nIGFzIHRoZXkn
cmUgYWxsIHBhaW50ZWQKPiA+Pj4gdGhlIHNhbWUuCj4gCj4gVGhlbiBzb21lIHNoZWRzIHNob3Vs
ZG4ndCBoYXZlIGJlZW4gcmUtcGFpbnRlZCB3aXRob3V0IERSTV9BVVRIIGFscmVhZHkuLi4KCkNo
cmlzdGlhbiBwcm9wb3NlZCB0aGF0IGFuZCB0aGVuIGRpZG4ndCBmZWVsIGxpa2UgcmV2ZXJ0aW5n
IGl0LCBwbHVzIHZjNCwKYW5kIHRlZ3JhIG5ldmVyIGJvdGhlcmVkIHdpdGggaXQuIFRoZXJlJ3Mg
cXVpdGUgYSBiaXQgbW9yZSB0aGFuIHRoZSB0YWlsCm91dCBvZiB0aGlzIHBhcnRpY3VsYXIgYmFn
IGFscmVhZHkuCgo+ID4+PiBPbmNlIHdlIHBpY2tlZCBhIGNvbG9yIGl0J3MgYSBzaW1wbGUgdGVj
aG5pY2FsIG1hdHRlciBvZiBob3cgdG8gcm9sbAo+ID4+PiBpdCBvdXQsIHVzaW5nIEtjb25maWcg
b3B0aW9ucywgb3Igb25seSBlbmFibGluZyBvbiBuZXcgaHcsIG9yICJtZXJnZQo+ID4+PiBhbmQg
Zml4IHRoZSByZWdyZXNzaW9ucyBhcyB0aGV5IGNvbWUiIG9yIGFueSBvZiB0aGUgb3RoZXIgd2Vs
bCBwcm92ZW4KPiA+Pj4gcGF0aHMgZm9yd2FyZC4KPiA+Pgo+ID4+IFllYWgsIHRoZSBwcm9ibGVt
IGlzIEkgZG9uJ3Qgc2VlIGFuIG9wdGlvbiB3aGljaCBjdXJyZW50bHkgd29ya3MgZm9yCj4gPj4g
ZXZlcnlvbmUuCj4gPj4KPiA+PiBJIGFic29sdXRlbHkgbmVlZCBhIGdyYWNlIHRpbWUgb2YgbXVs
dGlwbGUgeWVhcnMgdW50aWwgd2UgY2FuIGFwcGx5IHRoaXMKPiA+PiB0byBhbWRncHUvcmFkZW9u
Lgo+ID4gCj4gPiBZZWFoIHRoYXQncyB3aGF0IEkgbWVhbnQgd2l0aCAicGljayBhIGNvbG9yLCBw
aWNrIGEgd2F5IHRvIHJvbGwgaXQKPiA+IG91dCIuICJlbmFibGUgZm9yIG5ldyBodywgcm9sbCBv
dXQgeWVhcnMgYW5kIHllYXJzIGxhdGVyIiBpcyBvbmUgb2YKPiA+IHRoZSBvcHRpb25zIGZvciBy
b2xsIG91dC4KPiAKPiBPbmUgZ290Y2hhIGJlaW5nIHRoYXQgZ2VuZXJpYyB1c2Vyc3BhY2Ugc3Vj
aCBhcyB0aGUgWG9yZyBtb2Rlc2V0dGluZwo+IGRyaXZlciBtYXkgc3RpbGwgdHJ5IHRvIHVzZSBw
aGFzZWQgb3V0IGZ1bmN0aW9uYWxpdHkgc3VjaCBhcyBEUkkyIHdpdGgKPiBuZXcgaGFyZHdhcmUu
CgpUaGVyZSdzIGEgbG90IG1vcmUgZ2VuZXJpYyB1c2Vyc3BhY2UgdGhhbiAtbW9kZXNldHRpbmcu
IFRoYXQgd2FzIHRoZQplbnRpcmUgcG9pbnQgb2Yga21zLCBhbmQgaXQgc3VjY2VlZCByZWFsbHkg
d2VsbC4gVGhhdCdzIHdoeSBJIGRvbid0IHRoaW5rCmFtZGdwdSBkb2luZyB0aGVpciBvd24gZmxh
dm91ciBwaWNrIGlzIGdvaW5nIHRvIGhlbHAgYW55b25lIGhlcmUsIGV4Y2VwdAptYXliZSBpZiBh
bGwgeW91IGNhcmUgYWJvdXQgaXMgdGhlIGFtZCBzdGFuZC1hbG9uZSBzdGFjayBvbmx5LiBCdXQg
dGhlbgp3aHkgZG8geW91IGJvdGhlciB3aXRoIHRoaXMgdXBzdHJlYW0gc3R1ZmYgYXQgYWxsIC4u
LgoKPiA+PiBIb3cgYWJvdXQgdGhpczoKPiA+PiAxLiBXZSBrZWVwIERSTV9BVVRIIGFyb3VuZCBm
b3IgYW1kZ3B1L3JhZGVvbiBmb3Igbm93Lgo+ID4+IDIuIFdlIGFkZCBhIEtjb25maWcgb3B0aW9u
IHRvIGlnbm9yZSBEUk1fQVVUSCwgY3VycmVudGx5IGRlZmF1bHQgdG8gTi4KPiA+PiBUaGlzIGFs
c28gd29ya3MgYXMgYSB3b3JrYXJvdW5kIGZvciBvbGQgUkFEVi4KPiA+PiAzLiBXZSBzdGFydCB0
byB3b3JrIG9uIGZ1cnRoZXIgcmVtb3Zpbmcgb2xkIGNydWZ0IGZyb20gdGhlIHByaW1hcnkgbm9k
ZS4KPiA+PiBQb3NzaWJsZSB0aGUgS2NvbmZpZyBvcHRpb24gSSBzdWdnZXN0ZWQgdG8gZGlzYWJs
ZSBHRU0gZmxpbmsuCj4gPiAKPiA+IEhtIEknbSBub3Qgd29ycmllZCBhYm91dCBmbGluayByZWFs
bHkuIEl0J3MgZ2VtX29wZW4gd2hpY2ggaXMgdGhlCj4gPiBzZWN1cml0eSBnYXAsIGFuZCB0aGF0
IG9uZSBoYXMgdG8gc3RheSBtYXN0ZXItb25seSBmb3JldmVyLgo+IAo+IEdFTV9PUEVOIGlzIHVz
ZWQgYnkgRFJJMiBjbGllbnRzLCBpdCBjYW4ndCBiZSBtYXN0ZXItb25seS4gSXQncyBwcm9iYWJs
eQo+IG9uZSBvZiB0aGUgbWFpbiByZWFzb25zIGZvciB0aGUgZXhpc3RlbmNlIG9mIERSTV9BVVRI
LgoKT2ggc3dlZXQgSSBmb3Jnb3Qgd2UncmUgYWxsb3dpbmcgdGhpcyBib3RoIHdheXMgOi0vIFdl
bGwgZG9lc24ndCBjaGFuZ2UgdGhhdAptdWNoIHJlYWxseSwgb25jZSB3ZSBicmVhayBvbmUgb2Yg
dGhlc2UgdGhlIG90aGVyIGlzbid0IHVzZWZ1bCBhbnltb3JlCmVpdGhlci4KLURhbmllbAotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
