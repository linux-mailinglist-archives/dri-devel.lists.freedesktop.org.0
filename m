Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDBB164BEA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 18:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9346E830;
	Wed, 19 Feb 2020 17:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A246E830
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YxLL5TWX8Y9LgJH8bKr3WDXG9i1RC2MzvXOGvoUMUH8=; b=gtSe865+AvCCU77WtyWj8X2h42
 69ssJob0n71JhQNpgVbF4fNpOyPaBL2P2zbhEUVkikvcfTNFFWGIXTDWXXlXtCiVDwdbA+4O5WNOS
 PwPH1TbJXuIRA3JFhbx5kVbOctrBCBqBZbCOOSb1EzhvAsswy+ioWwpCxavu7FwkWpKYaqap/0OBD
 Z62mJC+2JeuBy440PbToJe61utgCqPexSpXGFBMcC2TkSh/uFZysZ7uTf8sMQyH3XwyZ1NXXdl5Y3
 EGUbB5C/c9i4gj9pRbE5Ek3tK/edLjufyt9JRUAzu+RaWC1S6Y8rtHWsGn0ZELzLRPhuoO1uUJA1u
 xjuGb/AQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61164
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j4TAt-0004Um-6v; Wed, 19 Feb 2020 18:30:15 +0100
Subject: Re: [PATCH 27/52] drm: Manage drm_mode_config_init with drmm_
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-28-daniel.vetter@ffwll.ch>
 <20200219134956.GG5070@pendragon.ideasonboard.com>
 <CAKMK7uEn6WobnrLf9AeqVgMjbtKExsHt64yvaQ_RtBSpk7h2gw@mail.gmail.com>
 <20200219160756.GZ5070@pendragon.ideasonboard.com>
 <CAKMK7uFjHCi=NnejipMM9t0daTa58r6JwvCLfOqpPs=rM8YRWg@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <4779be42-3386-3e0b-e9df-bf6d982496c1@tronnes.org>
Date: Wed, 19 Feb 2020 18:30:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFjHCi=NnejipMM9t0daTa58r6JwvCLfOqpPs=rM8YRWg@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTkuMDIuMjAyMCAxNy4yMywgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBXZWQsIEZl
YiAxOSwgMjAyMCBhdCA1OjA4IFBNIExhdXJlbnQgUGluY2hhcnQKPiA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPj4KPj4gSGkgRGFuaWVsLAo+Pgo+PiBPbiBXZWQs
IEZlYiAxOSwgMjAyMCBhdCAwNDo0Nzo1NVBNICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
Pj4gT24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMjo1MCBQTSBMYXVyZW50IFBpbmNoYXJ0IHdyb3Rl
Ogo+Pj4+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDExOjIwOjU3QU0gKzAxMDAsIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4+Pj4+IGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwIGlzIGlkZW1wb3RlbnQs
IHNvIG5vIGhhcm0gaW4gY2FsbGluZyB0aGlzCj4+Pj4+IHR3aWNlLiBUaGlzIGFsbG93cyB1cyB0
byBncmFkdWFsbHkgc3dpdGNoIGRyaXZlcnMgb3ZlciBieSByZW1vdmluZwo+Pj4+PiBleHBsaWNp
dCBkcm1fbW9kZV9jb25maWdfY2xlYW51cCBjYWxscy4KPj4+Pj4KPj4+Pj4gV2l0aCB0aGlzIHN0
ZXAgaXQncyBub3QgYWxzbyBwb3NzaWJsZSB0aGF0IChhdCBsZWFzdCBmb3Igc2ltcGxlCj4+Pj4+
IGRyaXZlcnMpIGF1dG9tYXRpYyByZXNvdXJjZSBjbGVhbnVwIGNhbiBiZSBkb25lIGNvcnJlY3Rs
eSB3aXRob3V0IGEKPj4+Pj4gZHJtX2RyaXZlci0+cmVsZWFzZSBob29rLiBUaGVyZWZvcmUgYWxs
b3cgdGhpcyBub3cgaW4KPj4+Pj4gZGV2bV9kcm1fZGV2X2luaXQoKS4KPj4+Pj4KPj4+Pj4gQWxz
byB3aXRoIGRybW1fIGV4cGxpY2l0IGRybV9kcml2ZXItPnJlbGVhc2UgaG9va3MgYXJlIGtpbmRh
IG5vdCB0aGUKPj4+Pj4gYmVzdCBvcHRpb24sIHNvIGRlcHJlY2F0ZSB0aGF0IGhvb2sgdG8gZGlz
Y291cmFnZSBmdXR1cmUgdXNlcnMuCj4+Pj4+Cj4+Pj4+IHYyOiBGaXh1cCB0aGUgZXhhbXBsZSBp
biB0aGUga2VybmVsZG9jIHRvby4KPj4+Pj4KPj4+Pj4gQ2M6ICJOb3JhbGYgVHLDuG5uZXMiIDxu
b3JhbGZAdHJvbm5lcy5vcmc+Cj4+Pj4+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+Cj4+Pj4+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj4+
Pj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Cj4+Pj4+IC0tLQoKPHNuaXA+Cgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2RlX2NvbmZpZy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jCj4+Pj4+
IGluZGV4IDA4ZTZlZmY2YTE3OS4uOTU3ZGIxZWRiYTBjIDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMKPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9tb2RlX2NvbmZpZy5jCj4+Pj4+IEBAIC0yNSw2ICsyNSw3IEBACj4+Pj4+ICAjaW5jbHVk
ZSA8ZHJtL2RybV9kcnYuaD4KPj4+Pj4gICNpbmNsdWRlIDxkcm0vZHJtX2VuY29kZXIuaD4KPj4+
Pj4gICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KPj4+Pj4gKyNpbmNsdWRlIDxkcm0vZHJtX21h
bmFnZWQuaD4KPj4+Pj4gICNpbmNsdWRlIDxkcm0vZHJtX21vZGVfY29uZmlnLmg+Cj4+Pj4+ICAj
aW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgo+Pj4+PiAgI2luY2x1ZGUgPGxpbnV4L2RtYS1yZXN2
Lmg+Cj4+Pj4+IEBAIC0zNzMsNiArMzc0LDExIEBAIHN0YXRpYyBpbnQgZHJtX21vZGVfY3JlYXRl
X3N0YW5kYXJkX3Byb3BlcnRpZXMoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPj4+Pj4gICAgICAg
cmV0dXJuIDA7Cj4+Pj4+ICB9Cj4+Pj4+Cj4+Pj4+ICtzdGF0aWMgdm9pZCBkcm1fbW9kZV9jb25m
aWdfaW5pdF9yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKnB0cikKPj4+Pj4g
K3sKPj4+Pj4gKyAgICAgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsKPj4+Pj4gK30KPj4+
Pj4gKwo+Pj4+PiAgLyoqCj4+Pj4+ICAgKiBkcm1fbW9kZV9jb25maWdfaW5pdCAtIGluaXRpYWxp
emUgRFJNIG1vZGVfY29uZmlndXJhdGlvbiBzdHJ1Y3R1cmUKPj4+Pj4gICAqIEBkZXY6IERSTSBk
ZXZpY2UKPj4+Pj4gQEAgLTM4NCw4ICszOTAsMTAgQEAgc3RhdGljIGludCBkcm1fbW9kZV9jcmVh
dGVfc3RhbmRhcmRfcHJvcGVydGllcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+Pj4+PiAgICog
cHJvYmxlbSwgc2luY2UgdGhpcyBzaG91bGQgaGFwcGVuIHNpbmdsZSB0aHJlYWRlZCBhdCBpbml0
IHRpbWUuIEl0IGlzIHRoZQo+Pj4+PiAgICogZHJpdmVyJ3MgcHJvYmxlbSB0byBlbnN1cmUgdGhp
cyBndWFyYW50ZWUuCj4+Pj4+ICAgKgo+Pj4+PiArICogQ2xlYW51cCBpcyBhdXRvbWF0aWNhbGx5
IGhhbmRsZWQgdGhyb3VnaCByZWdpc3RlcmluZyBkcm1fbW9kZV9jb25maWdfY2xlYW51cAo+Pj4+
PiArICogd2l0aCBkcm1tX2FkZF9hY3Rpb24oKS4KPj4+Pj4gICAqLwo+Pj4+PiAtdm9pZCBkcm1f
bW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+Pj4+PiAraW50IGRybV9t
b2RlX2NvbmZpZ19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4+Pj4+ICB7Cj4+Pj4+ICAg
ICAgIG11dGV4X2luaXQoJmRldi0+bW9kZV9jb25maWcubXV0ZXgpOwo+Pj4+PiAgICAgICBkcm1f
bW9kZXNldF9sb2NrX2luaXQoJmRldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCk7Cj4+
Pj4+IEBAIC00NDMsNiArNDUxLDggQEAgdm9pZCBkcm1fbW9kZV9jb25maWdfaW5pdChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQo+Pj4+PiAgICAgICAgICAgICAgIGRybV9tb2Rlc2V0X2FjcXVpcmVf
ZmluaSgmbW9kZXNldF9jdHgpOwo+Pj4+PiAgICAgICAgICAgICAgIGRtYV9yZXN2X2ZpbmkoJnJl
c3YpOwo+Pj4+PiAgICAgICB9Cj4+Pj4+ICsKPj4+Pj4gKyAgICAgcmV0dXJuIGRybW1fYWRkX2Fj
dGlvbihkZXYsIGRybV9tb2RlX2NvbmZpZ19pbml0X3JlbGVhc2UsIE5VTEwpOwo+Pj4+Cj4+Pj4g
SWYgdGhpcyBmYWlscywgc2hvdWxkbid0IGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKCkgYmUgY2Fs
bGVkIGhlcmUgPwo+Pj4KPj4+IE1heWJlIGZvciBvY2QgcmVhc29ucywgYnV0IG5vdCBmb3IgYWN0
dWFsbHkgY2xlYW5pbmcgdXAgYW55dGhpbmcuIEl0J3MKPj4+IGp1c3QgYSBidW5jaCBvZiBlbXB0
eSBsaXN0cyB0aGF0IGRybV9tb2RlX2NvbmZpZ19jbGVhbnVwIHdpbGwgd2FsayBhbmQKPj4+IGRv
IG5vdGhpbmcgYWJvdXQuIE5vdCBzdXJlIEkgc2hvdWxkIGFkZCB0aGF0IC4uLgo+Pgo+PiBIb3cg
YWJvdXQgdGhlIGlkYSBpbml0LCBhbmQgdGhlIG11dGV4X2luaXQoKSB0aGF0IGlzbid0IGEgbm8t
b3Agd2hlbgo+PiBsb2NrIGRlYnVnZ2luZyBpcyBlbmFibGVkID8KPiAKPiBIbSByaWdodCwgSSds
bCBmaXggdGhpcy4KPiAKCllvdSBjb3VsZCBtYWtlIGEgZHJtbV8gdmVyc2lvbiBvZiBkZXZtX2Fk
ZF9hY3Rpb25fb3JfcmVzZXQoKSBmb3IgdGhpcy4KCk5vcmFsZi4KCj4gRnVuIHRoaW5nIGlzIHRo
YXQgSSd2ZSBmb3VuZCBhIHBpbGUgb2YgbWlzc2luZyBtdXRleF9kZXN0cm95IGFuZAo+IGlkYV9j
bGVhbnVwKCkgd2hpbGUgcmV2aWV3aW5nIGFsbCB0aGUgY29kZSBJJ3ZlIHJlYWQuIE5vdCBzdXJl
IEkndmUKPiBmaXhlZCB0aGVtIGFsbCB1cCAuLi4KPiAtRGFuaWVsCj4gCj4+Cj4+Pj4+ICB9Cj4+
Pj4+ICBFWFBPUlRfU1lNQk9MKGRybV9tb2RlX2NvbmZpZ19pbml0KTsKPj4+Pj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
