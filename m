Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4276B910
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 17:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7526310E40E;
	Tue,  1 Aug 2023 15:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151F710E40E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 15:50:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C0A7E1FD76;
 Tue,  1 Aug 2023 15:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690905041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ybs4dp+WNJH2R1akxvqYICjvky4XMDO0cQX0C7R63Gs=;
 b=XvTPf8ZLk0+qHwq5gzJXAfOQ7yadVTU0C63HZ3kdBOjeDN6k/a++iNL0YIJAcKZnULBMi/
 XA2ETRmDdkCjFtfbr91jj5kQMkpQ5LOhHFV3T3MOb2sQhmI71vioda7K27TCD6BldYKUmE
 6s9mojOPnI+60VE3AEVm3OqbzFrXtYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690905041;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ybs4dp+WNJH2R1akxvqYICjvky4XMDO0cQX0C7R63Gs=;
 b=0Geo06QnPVRGPFznEG399/+tylCA8gX3DT6glp896k7306nJcbgk+WquEWs1GisZ6sjF7K
 91+7Snz1CyuhOGCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A1D1C13919;
 Tue,  1 Aug 2023 15:50:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2MiOJtEpyWSJEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 15:50:41 +0000
Message-ID: <bb3bb89b-0c53-905f-1459-56eff142599f@suse.de>
Date: Tue, 1 Aug 2023 17:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Roger Sewell <roger.sewell@cantab.net>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
 <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
 <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
 <20230728131253.5411@revelation.broadband>
 <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
 <d473e398-37cc-429f-c77a-f3c060d90198@suse.de>
 <05fe2668-7b25-7b68-2a8a-61d06a926599@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <05fe2668-7b25-7b68-2a8a-61d06a926599@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RGrmuvhg90WX7FvpEY0j050r"
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RGrmuvhg90WX7FvpEY0j050r
Content-Type: multipart/mixed; boundary="------------qiW4NPra1MyAtFHLuc0W6CZo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Roger Sewell <roger.sewell@cantab.net>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <bb3bb89b-0c53-905f-1459-56eff142599f@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
 <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
 <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
 <20230728131253.5411@revelation.broadband>
 <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
 <d473e398-37cc-429f-c77a-f3c060d90198@suse.de>
 <05fe2668-7b25-7b68-2a8a-61d06a926599@redhat.com>
In-Reply-To: <05fe2668-7b25-7b68-2a8a-61d06a926599@redhat.com>

--------------qiW4NPra1MyAtFHLuc0W6CZo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDguMjMgdW0gMTY6MjQgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDAxLzA4LzIwMjMgMTI6MjUsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkN
Cj4+DQo+PiBBbSAwMS4wOC4yMyB1bSAxMjoxMSBzY2hyaWViIEpvY2VseW4gRmFsZW1wZToN
Cj4+PiBPbiAyOC8wNy8yMDIzIDE0OjEyLCBSb2dlciBTZXdlbGwgd3JvdGU6DQo+Pj4+DQo+
Pj4+IFRob21hcywgSm9jZWx5biwNCj4+Pj4NCj4+Pj4gSkY+IEkgdGhpbmsgdGhlIGN1bHBy
aXQgaXMgcHJvYmFibHkgdGhpcyBwYXRjaDoNCj4+Pj4gSkY+IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC80ODYyNDIvDQo+Pj4+IEpGPg0KPj4+PiBKRj4gYmVm
b3JlIHRoaXMgcGF0Y2gsDQo+Pj4+IEpGPiBtZ2FnMjAwX3NpbXBsZV9kaXNwbGF5X3BpcGVf
bW9kZV92YWxpZCgpIGFsd2F5cyByZXR1cm4gTU9ERV9PSw0KPj4+PiBKRj4NCj4+Pj4gSkY+
IGFmdGVyIHRoaXMgcGF0Y2gsIGl0IGNoZWNrcyB0aGUgYmFuZHdpZHRoIGxpbWl0IHRvby4N
Cj4+Pj4NCj4+Pj4gSXQgdHVybnMgb3V0IHRvIGJlIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiB0
aGF0IC0gYW5kIEkgc3RpbGwgdGhpbmsgaXQgaXMNCj4+Pj4gc29tZXRoaW5nIHRvIGRvIHdp
dGggaG93IHRoZSB0d28gZnVuY3Rpb25zDQo+Pj4+IG1nYWcyMDBfc2ltcGxlX2Rpc3BsYXlf
cGlwZV9tb2RlX3ZhbGlkIGFuZA0KPj4+PiBtZ2FnMjAwX21vZGVfY29uZmlnX21vZGVfdmFs
aWQgYXJlIG1hZGUga25vd24gdG8gdGhlIHJlc3Qgb2YgdGhlIGRybQ0KPj4+PiBzeXN0ZW0s
IGkuZS4gd2hpY2ggc2xvdHMgaW4gdGhlIHZhcmlvdXMgZnVuY3Rpb24gc3RydWN0dXJlcyB0
aGV5IGFyZSANCj4+Pj4gcHV0DQo+Pj4+IGluLg0KPj4+Pg0KPj4+PiBJIGF0dGFjaCBhIGNv
bnRpZ3VvdXMgZXhjZXJwdCBmcm9tIC92YXIvbG9nL21lc3NhZ2VzLCByZWNvcmRpbmcgd2hh
dA0KPj4+PiBoYXBwZW5lZCB3aGVuIEkgZGlkIHRoZSBmb2xsb3dpbmcuDQo+Pj4+DQo+Pj4+
IDEuIEkgaW5zdHJ1bWVudGVkIHRoZSBvbGQgbWdhZzIwMCBtb2R1bGUgd2l0aCBwcmludGsg
c3RhdGVtZW50cyBpbg0KPj4+PiDCoMKgwqAgbWdhZzIwMF9zaW1wbGVfZGlzcGxheV9waXBl
X21vZGVfdmFsaWQgYW5kIG1nYV92Z2FfbW9kZV92YWxpZCBhbmQNCj4+Pj4gwqDCoMKgIG1n
YV92Z2FfY2FsY3VsYXRlX21vZGVfYmFuZHdpZHRoLCBhbmQgYWxzbyBwdXQgaW4gYSBjYWxs
IHRvIHRoZQ0KPj4+PiDCoMKgwqAgbGF0dGVyIGluIG1nYWcyMDBfc2ltcGxlX2Rpc3BsYXlf
cGlwZV9tb2RlX3ZhbGlkIHNvIHRoYXQgSSBjb3VsZCANCj4+Pj4gc2VlDQo+Pj4+IMKgwqDC
oCB3aGF0IHBhcmFtZXRlcnMgaXQgaGFkIGJlZW4gY2FsbGVkIHdpdGguIEkgdGhlbiByZWJv
b3RlZCB0aGUgDQo+Pj4+IHN5c3RlbSwNCj4+Pj4gwqDCoMKgIGdldHRpbmcgdGhlIG1lc3Nh
Z2VzIHN0YXJ0aW5nIGF0IEp1bCAyOCAxMDo0Mjo0NSAuIEFzIHlvdSB3aWxsIHNlZSwNCj4+
Pj4gwqDCoMKgIGFsbW9zdCBldmVyeSB0aW1lIG1nYWcyMDBfc2ltcGxlX2Rpc3BsYXlfcGlw
ZV9tb2RlX3ZhbGlkIGlzIA0KPj4+PiBjYWxsZWQgaXQNCj4+Pj4gwqDCoMKgIGlzIGltbWVk
aWF0ZWx5IGZvbGxvd2luZyBhIHJldHVybiBvZiBNT0RFX09LIGZyb20gDQo+Pj4+IG1nYV92
Z2FfbW9kZV92YWxpZA0KPj4+PiDCoMKgwqAgd2l0aCB0aGUgc2FtZSBkaXNwbGF5IHBhcmFt
ZXRlcnMgLSB0aGUgdHdvIGV4Y2VwdGlvbnMgYXJlOg0KPj4+Pg0KPj4+PiDCoMKgwqAgYSkg
YXQgbGluZSAxMTU2IGlzIHdoZW4gaXQgaXMgY2FsbGVkIGFmdGVyICJmYmNvbjogbWdhZzIw
MGRybWZiIA0KPj4+PiAoZmIwKQ0KPj4+PiDCoMKgwqDCoMKgwqAgaXMgcHJpbWFyeSBkZXZp
Y2UiLCBhbmQNCj4+Pj4NCj4+Pj4gwqDCoMKgIGIpIHdpdGggdGhlIG1vZGUgYWN0dWFsbHkg
YmVpbmcgc2V0ICgxNDQweDkwMCkgYXQgbGluZSAyNjgxIHdoZW4gaXQNCj4+Pj4gwqDCoMKg
wqDCoMKgIG9mIGNvdXJzZSByZXR1cm5zIE1PREVfT0sgKGFzIHRoYXQgaXMgd2hhdCBpdCBh
bHdheXMgcmV0dXJucywgYXMNCj4+Pj4gwqDCoMKgwqDCoMKgIHlvdSBzYXkpLg0KPj4+Pg0K
Pj4+PiAyLiBJIHRoZW4gc3dpdGNoZWQgdG8gdGhlIG5ldyBtZ2FnMjAwIG1vZHVsZSBzaW1p
bGFybHkgaW5zdHJ1bWVudGVkLCANCj4+Pj4gYnV0DQo+Pj4+IMKgwqDCoCB3aXRoIHRoZSB1
bmlxdWVfcmV2X2lkIGluY3JlYXNlZCBieSAxIHRvIGdldCBzdWZmaWNpZW50IA0KPj4+PiBi
YW5kd2lkdGggdG8NCj4+Pj4gwqDCoMKgIG1ha2UgMTQ0MHg5MDAgdXNhYmxlLiBJIHRoZW4g
cmVib290ZWQgdGhlIHN5c3RlbSwgZ2V0dGluZyB0aGUNCj4+Pj4gwqDCoMKgIG1lc3NhZ2Vz
IHN0YXJ0aW5nIGF0IEp1bCAyOCAxMTo0Njo1MyAuIEFnYWluLCBhbG1vc3QgZXZlcnkgdGlt
ZQ0KPj4+PiDCoMKgwqAgbWdhZzIwMF9zaW1wbGVfZGlzcGxheV9waXBlX21vZGVfdmFsaWQg
aXMgY2FsbGVkIGl0IGlzIGltbWVkaWF0ZWx5DQo+Pj4+IMKgwqDCoCBhZnRlciBhIHJldHVy
biBvZiBNT0RFX09LIGZyb20gbWdhZzIwMF9tb2RlX2NvbmZpZ19tb2RlX3ZhbGlkLCANCj4+
Pj4gYW5kIHdlDQo+Pj4+IMKgwqDCoCBzdGlsbCBoYXZlIGV4Y2VwdGlvbiB0eXBlIChhKSBh
dCBsaW5lIDU2NzIuIEhvd2V2ZXIsIHRoZSBleGNlcHRpb24NCj4+Pj4gwqDCoMKgIHR5cGUg
KGIpIGlzIG5vIGxvbmdlciBwcmVzZW50LCBhcyBhdCBsaW5lIDY1OTAsIG9uIHNldHRpbmcg
dGhlDQo+Pj4+IMKgwqDCoCAxNDQweDkwMCBtb2RlLCB0aGVyZSBpcyBub3cgYSBjYWxsIG9m
IA0KPj4+PiBtZ2FnMjAwX21vZGVfY29uZmlnX21vZGVfdmFsaWQNCj4+Pj4gwqDCoMKgIHBy
ZWNlZGluZyB0aGUgY2FsbCBvZiBtZ2FnMjAwX3NpbXBsZV9kaXNwbGF5X3BpcGVfbW9kZV92
YWxpZC4NCj4+Pj4NCj4+Pj4gMy4gSSB0aGVuIG1vZGlmaWVkIHRoYXQgbWdhZzIwMCBtb2R1
bGUgYnkgZm9yY2luZyBhIHJldHVybiBvZiBNT0RFX09LDQo+Pj4+IMKgwqDCoCBmcm9tIG1n
YWcyMDBfc2ltcGxlX2Rpc3BsYXlfcGlwZV9tb2RlX3ZhbGlkIGFuZCByZW1vdmluZyB0aGUN
Cj4+Pj4gwqDCoMKgIGluY3JlbWVudCB0byB1bmlxdWVfcmV2X2lkLCBzbyB0aGF0IDE0NDB4
OTAwIGlzIG5vIGxvbmdlciAidmFsaWQiDQo+Pj4+IMKgwqDCoCBhY2NvcmRpbmcgdG8gdGhl
IGNyaXRlcmlhIGJlaW5nIHVzZWQuIEkgcmVib290ZWQsIGdldHRpbmcgdGhlDQo+Pj4+IMKg
wqDCoCBtZXNzYWdlcyBzdGFydGluZyBhdCBKdWwgMjggMTI6MTI6MzQgLiBOb3cgYXQgbGlu
ZSAxMTAwNCB3ZSBoYXZlIGENCj4+Pj4gwqDCoMKgIGZhaWx1cmUgdG8gc2V0IG1vZGUgaW1t
ZWRpYXRlbHkgZm9sbG93ZWQgYnkgYSByZXR1cm4gb2YgDQo+Pj4+IE1PREVfQkFELCBub3QN
Cj4+Pj4gwqDCoMKgIGZyb20gbWdhZzIwMF9zaW1wbGVfZGlzcGxheV9waXBlX21vZGVfdmFs
aWQgYnV0IGZyb20NCj4+Pj4gwqDCoMKgIG1nYWcyMDBfbW9kZV9jb25maWdfbW9kZV92YWxp
ZC4NCj4+Pj4NCj4+Pj4gVGh1cyBiZXR3ZWVuIHRoZSBvbGQgbWdhZzIwMCBtb2R1bGUgYW5k
IHRoZSBuZXcgb25lLCB0aGVyZSBpcyBhIGNoYW5nZQ0KPj4+PiBpbiB3aGVuIHRoZSBtb2Rl
X2NvbmZpZ19tb2RlX3ZhbGlkIGZ1bmN0aW9uIGdldHMgY2FsbGVkIC0gdGhlcmUgYmVpbmcN
Cj4+Pj4gb25lIGV4dHJhIGNhbGwuIFNvIGV2ZW4gaWYgb25lIHdlcmUgdG8gcmV2ZXJ0IHRv
DQo+Pj4+IG1nYWcyMDBfc2ltcGxlX2Rpc3BsYXlfcGlwZV9tb2RlX3ZhbGlkIGp1c3QgYWx3
YXlzIHJldHVybmluZyBNT0RFX09LIGl0DQo+Pj4+IHdvdWxkbid0IGZpeCB0aGUgcHJvYmxl
bS4NCj4+Pj4NCj4+Pj4gQXQgcHJlc2VudCBJIGRvbid0IHNlZSBob3cgdGhlIGNoYW5nZSBv
ZiBiZWhhdmlvdXIgY2FuIGJlIGFueXRoaW5nIA0KPj4+PiBvdGhlcg0KPj4+PiB0aGFuIHRv
IGRvIHdpdGggdGhlIHdheSB0aGVzZSBmdW5jdGlvbiBuYW1lcyBhcmUgcGFzc2VkIHRvIHRo
ZSByZXN0IG9mDQo+Pj4+IHRoZSBkcm0gc3lzdGVtICh0aG91Z2ggb2YgY291cnNlIGV2ZW4g
aWYgdGhhdCB3ZXJlIHJldmVydGVkLCB0aGUgZmFjdA0KPj4+PiB0aGF0IG1nYWcyMDBfc2lt
cGxlX2Rpc3BsYXlfcGlwZV9tb2RlX3ZhbGlkIG5vdyB0ZXN0cyBiYW5kd2lkdGggd291bGQN
Cj4+Pj4gc3RpbGwgY2F1c2Ugd2hhdCBJIHdhbnQgdG8gZG8gdG8gZmFpbCkuDQo+Pj4+DQo+
Pj4+IFNhZGx5IEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgdGhlIGRybSBzeXN0ZW0gd29ya3Ms
IHNvIEknbSBub3Qgc3VyZSB0aGF0DQo+Pj4+IEkgY2FuIHNoZWQgYW55IG1vcmUgbGlnaHQg
LSBidXQgaWYgdGhlcmUgYXJlIGFueSBtb3JlIGV4cGVyaW1lbnRzIHRoYXQNCj4+Pj4gd291
bGQgaGVscCwgcGxlYXNlIGRvIGxldCBtZSBrbm93Lg0KPj4+DQo+Pj4gSSB0aGluayB0aGUg
aXNzdWUgaXMgdGhhdCBpbiB2NS4xOCwgdGhlIG1lbW9yeSBjaGVjayB3YXMgZG9uZSBvbiB0
aGUgDQo+Pj4gY29ubmVjdG9yIG1vZGVfdmFsaWQoKSBjYWxsYmFjaywgYW5kIGluIHY2LjAs
IGl0J3MgZG9uZSBpbiB0aGUgDQo+Pj4gbW9kZV9jb25maWcgbW9kZV92YWxpZCgpIGNhbGxi
YWNrLg0KPj4+DQo+Pj4gQ2FuIHlvdSBwbGVhc2UgdHJ5IHRoZSBwYXRjaCBhdHRhY2hlZCwg
SSBtb3ZlZCB0aGUgYmFuZHdpZHRoIGNoZWNrIA0KPj4+IGJhY2sgdG8gdGhlIGNvbm5lY3Rv
ciBjYWxsYmFjay4NCj4+DQo+PiBJdCBzaG91bGQgbm90IG1ha2UgZGlmZmVyZW5jZS4gSSdk
IGJlIHN1cnByaXNlZCBpZiBpdCBkb2VzLiBBbmQgaW4gYW55IA0KPj4gY2FzZSwgdGhlIGJh
bmR3aWR0aCBjaGVjayBiZWxvbmdzIGluIHRvIHRoZSBtb2RlX2NvbmZpZyB0ZXN0LCBhcyBp
dCBpcyANCj4+IGEgZGV2aWNlLXdpZGUgbGltaXQuDQo+Pg0KPiBJdCBkb2VzLCBhbmQgaXQg
Z29lcyBiYWNrIHRvIHRoZSB2NS4xOCBiZWhhdmlvciwgd2hlcmUgdGhlICJvdXQgb2Ygc3Bl
YyIgDQo+IHJlc29sdXRpb25zIGFyZSBub3QgcHJvcG9zZWQsIGJ1dCB5b3UgY2FuIHN0aWxs
IGZvcmNlIHRoZW0gZnJvbSB1c2Vyc3BhY2UuDQo+IEFsc28gdGhpcyBjbGFpbXMgdG8gYmUg
YSAiYmFuZHdpZHRoIiBsaW1pdCwgYnV0IGFsbCBtZ2FnMjAwIGFyZSB1c2luZyANCj4gdGhl
IFBDSSBidXMgZm9yIHRoZSBtZW1vcnkgY2xvY2ssIHNvIGhhdmUgdGhlIHNhbWUgYmFuZHdp
ZHRoLiBUaGUgbGltaXQgDQo+IGlzIG9uIHRoZSBwaXhlbCBjbG9jaywgd2hpY2ggaXMgdXNl
ZCBvbmx5IGZvciB0aGUgVkdBIERBQywgc28gaXQncyANCj4gcHJvYmFibHkgZmluZSB0byBh
dHRhY2ggdGhpcyBsaW1pdCB0byB0aGUgVkdBIGNvbm5lY3Rvci4gT2YgY291cnNlIA0KPiBt
Z2FnMjAwIG9ubHkgaGF2ZSBWR0EgY29ubmVjdG9yLCBzbyBpdCBkb2Vzbid0IG1hdHRlciBp
biBwcmFjdGljZS4NCj4gDQo+IA0KPj4gRllJIEkgaW50ZW5kIHRvIGNsb3NlIHRoaXMgYnVn
IHJlcG9ydCBhcyBJTlZBTElELiBUaGUgaGFyZHdhcmUgYW5kIA0KPj4gZHJpdmVyIHdvcmsg
YWNjb3JkaW5nIHRvIHRoZSBrbm93biBzcGVjcywgc28gdGhlcmUncyBubyBidWcgaGVyZS4N
Cj4gDQo+IEkgc3RpbGwgdGhpbmsgaXQncyBhIGtlcm5lbCByZWdyZXNzaW9uLCBiZWNhdXNl
IGEgdXNlcnNwYWNlIA0KPiBjb25maWd1cmF0aW9uIHRoYXQgdXNlZCB0byB3b3JrIGlzIG5v
dyBicm9rZW4uDQoNCk5vIGl0J3Mgbm90LiBUaGUga2VybmVsIGRpZG4ndCB2YWxpZGF0ZSB0
aGUgZ2l2ZW4gc3RhdGUgY29ycmVjdGx5LiANCkhlbmNlLCB0aGUgdXNlcidzIGhhcmR3YXJl
IGFjY2lkZW50YWxseSBnb3Qgb3ZlcmNsb2NrZWQsIHdoaWNoIHRoZSANCmtlcm5lbCBkcml2
ZXIgaXMgcmVhbGx5IGV4cGVjdGVkIHRvIHByZXZlbnQuIFRoYXQgd2FzIHRoZSBrZXJuZWwg
YnVnIA0KdGhhdCBoYXMgYmVlbiBmaXhlZCBhIHdoaWxlIGFnby4NCg0KSWYgYW55dGhpbmcs
IHRoZSBrZXJuZWwgZHJpdmVyIGNvdWxkIHN1cHBvcnQgc2V2ZXJhbCBtb2RlcyBvbmx5IGZv
ciANCjE2LWJpdCBjb2xvcnMgKGlmZiB1c2Vyc3BhY2UgY2FuIGhhbmRsZSB0aGF0KS4NCg0K
QmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkw
NDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBB
bmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJl
cmcpDQo=

--------------qiW4NPra1MyAtFHLuc0W6CZo--

--------------RGrmuvhg90WX7FvpEY0j050r
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTJKdAFAwAAAAAACgkQlh/E3EQov+D8
zQ//SaJcI1DXSAO2d8Z6is1YTJBN/4JjzPY73Ao34D7fLGkOOmQsuQXINgWbgimn7PBXwmGNG+uE
L71ErAH0VuNXXJiNhd3JEs+YqDT7S/HMts9WYxIGgNerzJ5XPo3QwiE6V40xfeHZQwzrTwaxQWAr
RtQ44VFoP8etc6wcB345Tein3hoVEr8Aaeh9dHZF3E0OGicg5pBwJKOkzqV6wm/7b82oYoeB9oL4
J1/8mlXM2BAr4nAorWYGxC+UmW36B9iaPE7gKUrszrHdvJt3TFr0SHr1Is44dilcnVfCuWExNMY5
f//QOxfRLmFTcB/9QAoBCr2HKfuYmufnRmR5UVostgRolKQi2+me59MK12aaGIKLv8Y5gxsKmfkw
6Cx9V9p9jYmnBTqsMqsD6NkyzbGNKdzm0j1TBHkEB04yNtAE7gI5AQU4bpzW5prwYjsDu0nUKmXr
YbWInfP4kTGrXYwJ+D3/JCetpAClh+TROc3jmIl4AeTk/0diG68qspZKolXJ1BGcQs2t0nFL140d
QGXz/6vR65lk0O9bOBmWUGpMpDnwldxBXPbYAB3XY9iMeZJOPNCDOPKBHjsJJgkpAae/ComeLyO2
YVtobKx4FaEdcwjme8IsotDp4sUVYSC6E4mo11eisWzH/hbx6+KU+We/Qry4e4PRlYi6/r/YFlHE
xqw=
=zAWA
-----END PGP SIGNATURE-----

--------------RGrmuvhg90WX7FvpEY0j050r--
