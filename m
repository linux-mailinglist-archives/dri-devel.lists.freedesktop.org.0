Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609156E4362
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 11:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6330C10E3B8;
	Mon, 17 Apr 2023 09:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799F910E3B8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 09:15:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F13CA21A55;
 Mon, 17 Apr 2023 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681722953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uVrJFgRq76SXN0mjQwgcRCwNsBmRPfyewXiOhLZvq74=;
 b=j0sXJEQFywmQ/eGhH1C36VKD3kkM1L3q6yTVxal/zazGU+sF+qS+9jt4VFSpqiW72HnVHE
 EdFcukgxd245osOFM7ZKT5hLPzhzJP47z00dxq8jwZZKwJ4d0SqciJoB/oxLopNbEpGG7Z
 9iJy7cY7IZPnwkoUXFzr0Gib8gcNAN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681722953;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uVrJFgRq76SXN0mjQwgcRCwNsBmRPfyewXiOhLZvq74=;
 b=RhsdHZqMNrQWH9jfZtKpud+Lg/QsBLYXL4kw2k24umKZX8fB8WTS7yoKnwoFW747G0FIPE
 c74dm60KdWGu87Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9E1213319;
 Mon, 17 Apr 2023 09:15:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pRNeLEkOPWRQXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 09:15:53 +0000
Message-ID: <60b7cad3-8923-98b1-2c0f-71bfabd0b2e9@suse.de>
Date: Mon, 17 Apr 2023 11:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Pierre Asselin <pa@panix.com>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
 <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
 <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
 <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
 <4PxhQn3zK1zcbc@panix1.panix.com>
 <f3004fccf706fb3cbb7ef6877dcd9168.squirrel@mail.panix.com>
 <23d45518-3565-e915-c6d4-45dabe82ea4c@suse.de>
 <87zg76evh3.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87zg76evh3.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hL513dDKaaB5ApJrzbfMxZty"
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
Cc: jfalempe@redhat.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hL513dDKaaB5ApJrzbfMxZty
Content-Type: multipart/mixed; boundary="------------PaKoyYix1vgdNzCg7Iir6Idq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Pierre Asselin <pa@panix.com>
Cc: jfalempe@redhat.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 hdegoede@redhat.com, ardb@kernel.org
Message-ID: <60b7cad3-8923-98b1-2c0f-71bfabd0b2e9@suse.de>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
 <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
 <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
 <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
 <4PxhQn3zK1zcbc@panix1.panix.com>
 <f3004fccf706fb3cbb7ef6877dcd9168.squirrel@mail.panix.com>
 <23d45518-3565-e915-c6d4-45dabe82ea4c@suse.de>
 <87zg76evh3.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87zg76evh3.fsf@minerva.mail-host-address-is-not-set>

--------------PaKoyYix1vgdNzCg7Iir6Idq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDQuMjMgdW0gMTA6NTggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPj4gSGksDQo+Pg0KPj4gdGhhbmtzIGEgbG90IHRvIGJvdGggb2YgeW91IGZv
ciB0aGlzIGJ1ZyBmaXguDQo+Pg0KPj4gQW0gMTMuMDQuMjMgdW0gMDM6MzQgc2NocmllYiBQ
aWVycmUgQXNzZWxpbjoNCj4+Pj4gKG5vdCB0ZXN0ZWQpDQo+Pj4NCj4+PiBUZXN0ZWQuICBJ
dCBmaXhlcyB0aGUgcmVncmVzc2lvbiBvbiBteSBsYXB0b3AuDQo+Pj4NCj4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvc3lzZmJfc2ltcGxlZmIuYw0KPj4+PiBiL2RyaXZl
cnMvZmlybXdhcmUvc3lzZmJfc2ltcGxlZmIuYw0KPj4+PiBpbmRleCA4MmM2NGNiOWY1MzEu
LjlmNTI5OWQ1NDczMiAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9zeXNm
Yl9zaW1wbGVmYi5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvc3lzZmJfc2ltcGxl
ZmIuYw0KPj4+PiBAQCAtNTYsMTAgKzU2LDExIEBAIF9faW5pdCBib29sIHN5c2ZiX3BhcnNl
X21vZGUoY29uc3Qgc3RydWN0IHNjcmVlbl9pbmZvDQo+Pj4+ICpzaSwNCj4+Pj4gICAgCSAq
IGRvbid0IHNwZWNpZnkgYWxwaGEgY2hhbm5lbHMuDQo+Pj4+ICAgIAkgKi8NCj4+Pj4gICAg
CWlmIChzaS0+bGZiX2RlcHRoID4gOCkgew0KPj4+PiAtCQliaXRzX3Blcl9waXhlbCA9IG1h
eChtYXgzKHNpLT5yZWRfc2l6ZSArIHNpLT5yZWRfcG9zLA0KPj4+PiArCQliaXRzX3Blcl9w
aXhlbCA9IG1heDMobWF4MyhzaS0+cmVkX3NpemUgKyBzaS0+cmVkX3BvcywNCj4+Pj4gICAg
CQkJCQkgIHNpLT5ncmVlbl9zaXplICsgc2ktPmdyZWVuX3BvcywNCj4+Pj4gICAgCQkJCQkg
IHNpLT5ibHVlX3NpemUgKyBzaS0+Ymx1ZV9wb3MpLA0KPj4+PiAtCQkJCSAgICAgc2ktPnJz
dmRfc2l6ZSArIHNpLT5yc3ZkX3Bvcyk7DQo+Pj4+ICsJCQkJICAgICBzaS0+cnN2ZF9zaXpl
ICsgc2ktPnJzdmRfcG9zLA0KPj4+PiArCQkJCSAgICAgc2ktPmxmYl9kZXB0aCk7DQo+Pg0K
Pj4gSSdtIE9LIHdpdGggdGhpcyBjaGFuZ2UuIFRoZXJlJ3MgYSBjb21tZW50DQo+Pg0KPj4g
ICAgIlRoZSBiZXN0IHNvbHV0aW9uIGlzIHRvIGNvbXB1dGUgYml0c19wZXJfcGl4ZWwgaGVy
ZSBhbmQgaWdub3JlDQo+PiBsZmJfZGVwdGguIg0KPj4NCj4+IEknZCBjaGFuZ2UgdGhpcyB0
bw0KPj4NCj4+ICAgICJUaGUgYmVzdCBzb2x1dGlvbiBpcyB0byBjb21wdXRlIGJpdHNfcGVy
X3BpeGVsIGhlcmUgZnJvbSB0aGUgY29sb3INCj4+IGJpdHMsIHRoZSByZXNlcnZlZCBiaXRz
IGFuZCB0aGUgcmVwb3J0ZWQgY29sb3IgZGVwdGg7IHdoYXRldmVyIGlzIGhpZ2hlc3QuIg0K
Pj4NCj4+IFRoYXQgd2lsbCBob3BlZnVsbHkgY2xhcmlmeSB0aGUgbWVhbmluZyBvZiB0aGVz
ZSBtYXgzKCkgc3RhdGVtZW50cy4gVGhleQ0KPj4gYXJlIG5vdCBvYnZpb3VzIGF0IGZpcnN0
Lg0KPj4NCj4gDQo+IEknbSBPSyB3aXRoIHRoaXMgYXMgd2VsbCBidXQgdGhlbiBzaG91bGQg
cHJvYmFibHkgYWxzbyBhcHBseSBteSBwYXRjaCBbMV0NCj4gdGhhdCBjb21wdXRlZCB0aGUg
c3RyaWRlIHRvby4gU2luY2UgaWYgd2UgZG9uJ3QgdHJ1c3QgdGhlIGxmYl9kZXB0aCBhbmQN
Cj4gY2FsY3VsYXRlIHRoZSBCUFAsIHRoZW4gd2Ugc2hvdWxkbid0IHRydXN0IHRoZSByZXBv
cnRlZCBsaW5lIGxlbmd0aCB0b28uDQo+IA0KPiBBcyBQaWVycmUgcmVwb3J0ZWQgaW4gdGhl
IHRocmVhZCBbMl0sIHdoZW4gdGhlIHdyb25nIEJQUCB3YXMgY2FsY3VsYXRlZCAoYW5kDQo+
IHdyb25nIHBpeGVsIGZvcm1hdCBjaG9zZW4pLCB0aGUgbGluZSBsZW5naHQgZGlkbid0IG1h
dGNoIHRoZSBCUFAgKiBsZmJfd2lkdGguDQo+IA0KPiBIZSBtZW50aW9uZWQgdGhhdCBpdCB3
YXMgbGlrZSB0aGlzOg0KPiANCj4gICBmb3JtYXQ9cjhnOGI4LCBtb2RlPTEwMjR4NzY4eDI0
LCBsaW5lbGVuZ3RoPTQwOTYNCj4gDQo+IEluc3RlYWQgb2YgdGhlIGV4cGVjdGVkOg0KPiAN
Cj4gICBmb3JtYXQ9cjhnOGI4LCBtb2RlPTEwMjR4NzY4eDI0LCBsaW5lbGVuZ3RoPTMwNzIN
Cj4gDQo+IE15IHBhdGNoIGluIFsxXSwgZml4ZWQgdGhlIGxpbmVsZW5ndGggY2FsY3VsYXRp
b24gc28gaXQgd2FzIGludGVybmFsbHkNCj4gY29uc2lzdGVudCAoYnV0IHN0aWxsIHdyb25n
IHNpbmNlIHRoZSBwaXhlbCBmb3JtYXQgd2FzIHJlYWxseSB4cjhnOGI4KS4NCj4gDQo+IElu
IG90aGVyIHdvcmRzLCBJIHRoaW5rIHRoYXQgd2Ugc2hvdWxkIGVpdGhlcjoNCj4gDQo+IGEp
IFRydXN0IHRoZSBsZmJfbGluZWxlbmd0aCBhbmQgbGZiX3dpZHRoICh3ZSBhcmUgYWxyZWFk
eSBkb2luZyB0aGF0IHNpbmNlDQo+ICAgICBtb2RlLT5zdHJpZGUgYW5kIG1vZGUtPndpZHRo
IGFyZSBzZXQgdG8gdGhvc2Ugb25jZSB0aGUgZm9ybWF0IG1hdGNoZXMpLg0KPiAgICAgDQo+
ICAgICBJZiB3ZSBkZWNpZGVkIHRvIHRydXN0IHRob3NlLCB0aGVuIHRoZSBiaXRzLXBlci1w
aXhlbCBjb3VsZCBqdXN0IGJlDQo+ICAgICBjYWxjdWxhdGVkIGFzOiBiaXRzX3Blcl9waXhl
bCA9IHNpLT5sZmJfbGluZWxlbmd0aCAqIDggLyBzaS0+bGZiX3dpZHRoDQo+IA0KPiAgICAg
d2hpY2ggaXMgd2hhdCBJIGRvIG9uIG15IHYyIHBhdGNoIFszXS4NCj4gDQo+IGIpIE5vdCB0
cnVzdCBsZmJfbGluZWxlbmd0aCwgc2luY2UgdGhhdCB3b3VsZCBuZWVkIHRvIGJlIHJlY2Fs
Y3VsYXRlZCBhZnRlcg0KPiAgICAgdGhlIEJQUCB3YXMgY2FsY3VhbHRlZC4gVGhhdCdzIHdo
eSBJIG1lbnRpb25lZCB0aGF0IHdlIG5lZWQgUGllcnJlJ3MgZml4ICsNCj4gICAgIG15IHBh
dGNoIFsxXSB0aGF0IGRpZDoNCj4gDQo+ICAgICBzdHJpZGUgPSBESVZfUk9VTkRfVVAoc2kt
PmxmYl93aWR0aCAqIGJpdHNfcGVyX3BpeGVsLCA4KQ0KDQpJJ2QgcmF0aGVyIGtlZXAgdGhl
IGNvZGUgYXMtaXMgdW50aWwgd2UgZ2V0IGFuIGFjdHVhbCBidWcgcmVwb3J0Lg0KDQpGb3Ig
ZXhhbXBsZSwgRFJNIGZyYW1lYnVmZmVyIHNpemVzIGFyZSBvZnRlbiBtdWx0aXBsZXMgb2Yg
NjQuIENyZWF0aW5nIGEgDQpmcmFtZWJ1ZmZlciBvZiA4MDB4NjAwIHdpbGwgY3JlYXRlIGEg
ZnJhbWVidWZmZXIgd2l0aCANCnN0cmlkZS9waXRjaC9saW5lbGVuZ3RoIG9mIDgzMi4gIEkg
Y2FuIGltYWdpbmUgdGhhdCBzb21lIEJJT1NlcyBvdXQgDQp0aGVyZSBkbyBzb21ldGhpbmcg
c2ltaWxhciB3aXRoIHRoZSBzeXN0ZW0gZnJhbWVidWZmZXIuIE1lc3Npbmcgd2l0aCB0aGUg
DQpzdHJpZGUgd291bGQgYnJlYWsgdGhlbS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gQnV0IGNhbGN1bGF0aW5nIGEgQlBQIHlldCBibGluZGx5IHVzaW5nIGxpbmVsZW5n
dGggZG9lbnMndCBtYWtlIHNlbnNlIHRvIG1lLg0KPiANCj4gWzFdOiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyMy1BcHJpbC8zOTk5NjMu
aHRtbA0KPiBbMl06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC9kZmI0ZjI1
Y2E4ZGZiMGQ4MWQ3NzhkNjMxNWYxMDRhZC5zcXVpcnJlbEBtYWlsLnBhbml4LmNvbS8NCj4g
WzNdOiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwv
MjAyMy1BcHJpbC80MDAwODguaHRtbA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------PaKoyYix1vgdNzCg7Iir6Idq--

--------------hL513dDKaaB5ApJrzbfMxZty
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ9DkkFAwAAAAAACgkQlh/E3EQov+DL
fw//RA+9G6SKJk+9AWXuiHX6uaJ63Oa7oAIhOmAFq7+6ilVqzCLAyyplZwUXbS8CK7guWlhfRMDo
VBZjBlnemGc0FxQ/m54UjhQK4c/+FW3o55ggvxY0yea3u9UIMwuI4b+DlMPiC57ZQG6+XO4WdVri
7Gp/X/QRq9U5LSJ9xg2Dn1sjbgB7/DLV8EuDcfhc61aKcDLRC7NOD9E9mESDaj8n87oQfRuQ8Mi/
zIIW4WOTfq2FEBRBLJo+09Pwk+N96WAcN8elGEA5ycl339fXf5Mz29emTlZSK+qiOO+NXqChsgKi
vcegg5FZxGENxsW14uDy3Ji/7sFIAeM3Bu8FgWPoBNZRjinLYqQhXENYH76NanHSmzIqiLGVJJ2G
84mdxQBx38eD+KazMEexOpiiJkmA3hZ+yUfX8ca9b28AhygCIqRBLXsDpLtmMSJ4u7paUSC1FzNS
Cb1G0ZD6Hh8YcnMOM7Fq0w7gu0YP9lPeVbajgYkT/XI3QGbh+QPjgXaJPDVjte8cO3ak6o1twqOs
JfwiGZtGDDRRnSry8NQHHCwY9HBXIrzyJ0+Kfj4UObUjQIEl3f2dNLh51AXytCSVqiBtElTAiyDM
IkYX81MBaThC74DGUjQbEPnx/8o+lwmW/TbMfFXb/LvocjLYkCHiBdn+q8WPD6mJ6+eVNqsJAu9R
ppA=
=ieK9
-----END PGP SIGNATURE-----

--------------hL513dDKaaB5ApJrzbfMxZty--
