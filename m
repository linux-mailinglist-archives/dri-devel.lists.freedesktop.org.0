Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895DD7BFD4D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50B810E368;
	Tue, 10 Oct 2023 13:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBAA10E368
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:24:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 451481F38A;
 Tue, 10 Oct 2023 13:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696944253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0ReSU4zz4ETtXAtDoTgBbukVXswgJQLcYfyT6GvGrPw=;
 b=g42RhVQZ2L1g7IePPiS62zrHAQza5VTYSSlMeWzTULmfPXmQr3miAAAqJGoktJA625Raiu
 Am4CJ6VWriuJfCgLGCYU+KVK/LN1F/7hKy+L0MOml4WE3wlAxx38/1Tk50dPQ7bxMfQ1sv
 8LFdNovc9SqAUX2t3fSNd+gedHmMogM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696944253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0ReSU4zz4ETtXAtDoTgBbukVXswgJQLcYfyT6GvGrPw=;
 b=aQyu6zpXtxtFqeVH9nCjyvEbZroMAWQWEJTNmghm+6BxQBxJlXNa1npsNcFvlmj9KsLnlM
 QRoj3XvRhDITWMAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1507C1358F;
 Tue, 10 Oct 2023 13:24:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DOwmBH1QJWUbZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Oct 2023 13:24:13 +0000
Message-ID: <12123e98-6c33-4444-9ff1-473a27580d4f@suse.de>
Date: Tue, 10 Oct 2023 15:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
References: <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <cd54b5ab-5ac8-4569-991c-bf6e062e6400@suse.de>
 <63wdz6ns6wsu3avztqebmeo4aa4ltwmmmywlam3xe6fmftcf3p@5icc2cvy6xvh>
 <0a6c2a07-bf44-409a-8a09-827410f011a6@tronnes.org>
 <5l4wotvmflkl42ms2wbw6mcz7bevk246abouj33fjn5wzfh72i@3vhxratfu3xi>
 <ZSVKtbkm6Sq_kkk7@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <ZSVKtbkm6Sq_kkk7@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------narAWzlWjWnXm9xyvvG4fE78"
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------narAWzlWjWnXm9xyvvG4fE78
Content-Type: multipart/mixed; boundary="------------EF0gDM9Avvs94sDlD0aBzxYH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
Cc: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 airlied@redhat.com
Message-ID: <12123e98-6c33-4444-9ff1-473a27580d4f@suse.de>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
References: <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <cd54b5ab-5ac8-4569-991c-bf6e062e6400@suse.de>
 <63wdz6ns6wsu3avztqebmeo4aa4ltwmmmywlam3xe6fmftcf3p@5icc2cvy6xvh>
 <0a6c2a07-bf44-409a-8a09-827410f011a6@tronnes.org>
 <5l4wotvmflkl42ms2wbw6mcz7bevk246abouj33fjn5wzfh72i@3vhxratfu3xi>
 <ZSVKtbkm6Sq_kkk7@phenom.ffwll.local>
In-Reply-To: <ZSVKtbkm6Sq_kkk7@phenom.ffwll.local>

--------------EF0gDM9Avvs94sDlD0aBzxYH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMTAuMjMgdW0gMTQ6NTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KWy4u
Ll0NCj4+Pj4NCj4+Pg0KPj4+IFdoeSBjYW4ndCB3ZSB1c2UgdGhlIG1vZGVsWzFdIHN1Z2dl
c3RlZCBieSBEYW5pZWwgdXNpbmcgYSBkcmF3X3BpeGVsDQo+Pj4gY2FsbGJhY2sgZ2l2aW5n
IGRyaXZlcnMgZnVsbCBjb250cm9sIG9uIGhvdyB0aGV5IGNhbiBwdXQgYSBwaXhlbCBvbiB0
aGUNCj4+PiBkaXNwbGF5Pw0KPj4NCj4+IEkgc2hhcmUga2luZCBvZiB0aGUgc2FtZSBnZW5l
cmFsIGlkZWFzL2NvbmNsdXNpb25zOiAicXRoZSBpZGVhIGlzIHRoYXQNCj4+IGFsbCB0aGUg
ZmIgc2VsZWN0aW9uIGFuZCBsb29rdXAgaXMgaGFuZGxlZCBpbiBzaGFyZWQgY29kZSAoYW5k
IHdpdGgNCj4+IHByb3BlciBsb2NraW5nLCBidXQgb25seSBmb3IgYXRvbWljIGRyaXZlcnMp
LiINCj4+DQo+PiAyMDE2IGlzIGEgYml0IG9sZCB0aG91Z2ggYW5kIG11bHRpcGxlIGRldmVs
b3BtZW50cyBoYXBwZW5lZCBzaW5jZQ0KPj4gKHNlY3VyZSBwbGF5YmFjayBpcyBhIHRoaW5n
IG5vdywgZnJhbWVidWZmZXIgY29tcHJlc3Npb24gdG9vKSwgc28gSQ0KPj4gc3RpbGwgdGhp
bmsgdGhhdCB0aGVpciBleHBlY3RhdGlvbiB0aGF0IHRoZSBmcmFtZWJ1ZmZlciBpcyBhY2Nl
c3NpYmxlIHRvDQo+PiAvIHdyaXRhYmxlIGJ5IHRoZSBDUFUgbm8gbG9uZ2VyIGhvbGRzIHRy
dWUuDQo+IA0KPiBJIHRoaW5rIGxhcmdlbHkgaXQgc2hvdWxkIHN0aWxsIGJlIG9rLCBiZWNh
dXNlIHRoZSBpZGVhIGJlaGluZCB0aGUgZHJhd194eQ0KPiBjYWxsYmFjayB3YXMgdGhhdCB0
aGUgZHJpdmVyIGNvdWxkIHRha2UgY2FyZSBvZiBhbnl0aGluZyBzcGVjaWFsLCBsaWtlDQo+
IC0gdGlsaW5nDQo+IC0gY2xlYXJpbmcgY29tcHJlc3Npb24gYml0cyBzbyB0aGF0IGp1c3Qg
d3JpdGluZyB0aGUgcmF3IHBpeGVscyB3b3JrcyAoaWYNCj4gICAgeW91ciBjb21wcmVzc2lv
biBmb3JtYXQgYWxsb3dzIGZvciB0aGF0KQ0KPiAtIGhhbmRsaW5nIGFueSBkaWZmZXJlbmNl
cyBpbiBob3cgdGhlIHBpeGVscyBuZWVkIHRvIGJlIHdyaXR0ZW4sIGxpa2UNCj4gICAgY2Fj
aGUgZmx1c2hpbmcsIG1taW9fd3JpdGUgdnMgbm9ybWFsIG1lbW9yeSwgYW1kIGFsc28gaGFz
IHBlZWsvcG9rZQ0KPiAgICByZWdpc3RlcnMgdG8gYmUgYWJsZSB0byB3cml0ZSBldmVuIGlu
dG8gdW5tYXBwYWJsZSBtZW1vcnkNCj4gDQo+IFdoYXQgd291bGQgcHJvYmFibHkgYmUgYSBn
b29kIGlkZWEgaXMgdG8gZG8gYW4gcy92b2lkICovdWlucHRyX3QvIG92ZXIgbXkNCj4gaW50
ZXJmYWNlIHByb3Bvc2FsLCBvciBtYXliZSBhbiBldmVuIG1vcmUgb3BhcXVlIGNvb2tpZSBz
aW5jZSByZWFsbHkgdGhlDQo+IG9ubHkgdGhpbmcgeW91IGNhbiBkbyBpcyBnZXQgdGhlIHZv
aWQgKiB0aGF0IC0+cGFuaWNfdm1hcCByZXR1cm5zIGFuZCBwYXNzDQo+IGl0IGludG8gLT5w
YW5pY19kcmF3X3h5Lg0KPiANCj4gSSB0aG91Z2h0IChidXQgSSBkaWRuJ3QgZGlnIHRocm91
Z2ggZGV0YWlscykgdGhhdCB0aGUgcGFuaWMgZmIgc3RydWN0IGlzDQo+IGVzc2VudGlhbGx5
IG1lYW50IHRvIHNlcnZlIHRoaXMgcHVycG9zZSBpbiB0aGUgY3VycmVudCBzZXJpZXM/DQoN
CkkgaGF2ZSBvbmUgZGV0YWlsIGFib3V0IHRoZSBjb2RlOiBXaGlsZSB3b3JraW5nIG9uIHRo
ZSBmb3JtYXQtY29udmVyc2lvbiANCmNvZGUsIEkndmUgYWx3YXlzIGZvdW5kIHN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgdG8gYmUgY2x1bmt5IHRvIHdvcmsgDQp3aXRoLiBJdCdzIGJ1aWxk
IGFyb3VuZCB0aGUgaWRlYSBvZiBtYW5hZ2luZyBHRU0gYnVmZmVycywgYnV0IG5vdCANCmFj
Y2Vzc2luZyB0aGVtLg0KDQpTbyBJJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgc29tZXRoaW5n
IGxpa2UgYSBkcm1fcGl4bWFwIHRoYXQgY29udGFpbnMgDQpzaXplLCBjb2xvciBmb3JtYXQg
YW5kIGRhdGEgcG9pbnRlcnMgaW4gb25lIHBsYWNlLiBSZWFkcyBhbmQgd3JpdGVzIA0Kd291
bGQgYmUgY2FsbGJhY2tzLiBJdCBjb3VsZCBhYnN0cmFjdCBhY2Nlc3MgdG8gYW55IGtpbmQg
b2YgYnVmZmVyLiANCklJUkMgSm9jZWx5biBoYWQgc29tZXRoaW5nIGxpa2UgdGhhdCBpbiB0
aGUgdmVyeSBmaXJzdCBwYXRjaHNldC4gb3IgDQptYXliZSBmYl9waXhtYXAgY291bGQgYmUg
cmVwdXJwb3NlZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+PiBUaGlzIHdp
bGwgZXZlbiB3b3JrIGZvciB0aGUgQU1EIGRlYnVnIGludGVyZmFjZS4NCj4+PiBJbiB0aGUg
bGluZWFyIENQVSBhY2Nlc3NpYmxlIGJ1ZmZlciBjYXNlLCB3ZSBjYW4gcHJvdmlkZSBhIGhl
bHBlciBmb3INCj4+PiB0aGF0LCBtYXliZSB3ZSBjYW4gZG8gaGVscGVycyBmb3Igb3RoZXIg
Y29tbW9uIGNhc2VzIGFzIHdlbGwuDQo+Pg0KPj4gWWVhaCwgdGhlaXIgaWRlYSBvZiBhIHBh
bmljX2RyYXcgd291bGQgd29yayBncmVhdCBmb3IgdGhhdC4NCj4+DQo+Pj4gQWRkaW5nIHRv
IHRoYXQgd2Ugd291bGQgbmVlZCBhIHBhbmljX3NldHVwL2VudGVyIGFuZCBwYW5pY190ZWFy
ZG93bi9leGl0DQo+Pj4gY2FsbGJhY2suDQo+Pg0KPj4gV2hhdCBmb3I/DQo+IA0KPiBTbyBw
YW5pYyB0ZWFyZG93biB3b3VsZCBiZSBmb3IgdGVzdGluZyBpbiBDSSwgdG8gbWFrZSBpdCBu
b24tZGVzdHJ1Y3RpdmUNCj4gYW5kIGNsZWFuIHVwIGFueXRoaW5nIHBhbmljX3ZtYXAgKG9y
IF9lbnRlciBvciB3aGF0ZXZlciB5b3UgY2FsbCBpdCkgaGFzDQo+IGRvbmUuIEkgdGhvdWdo
dCBKb2huIE9nZ25lc3Mgd2FzIGFsc28gbG9va2luZyBpbnRvIGhvdyB0aGUgbmV3IHBhbmlj
DQo+IGhhbmRsZXJzL2NvbnNvbGVzIGNvdWxkIGJlIG1hZGUgdGVzdGFibGUgaW4gdGhlIHBh
bmljIHBhdGhzLCBpbmNsdWRpbmcNCj4gbG9jayBzdGVhbGluZyBhbmQgZ2V0dGluZyBjYWxs
ZWQgZnJvbSBubWkuDQo+IC1TaW1hDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdG
OiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1v
ZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------EF0gDM9Avvs94sDlD0aBzxYH--

--------------narAWzlWjWnXm9xyvvG4fE78
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUlUHwFAwAAAAAACgkQlh/E3EQov+Dj
jg//VDA3HXLZZvTDsTUIDR6q9FtJFKX1J/L6xK0i8rXd8G6YOOMDGDYClWRt/D9xwH36+ObafyKF
5mb7Ku/k4MjXAj3YvHg3C7CLzDi16vX/3geh4+PAXnFaibvyytST2u1Kr+2xl3GSBjAeE/9eWO4a
+nCE/gEH1BsCO+or/HfSoVztKIqdYm/jznqwN+0o4rhEcdIU7ktZXd+Bymdb+kWtaMZwItJEPChX
+6MiJq7AT4zU72iJdDxnJhjru4c+IX6UONzzlc2j5n82Btx6V30BDxHuReNtJxHq9aI6jMokonTc
twlvRV0tnNDdXNA380FsUolrZdBX8Ra2R6fOe8g2jOdVJoRX0lZsgaJUaMhoOGxkv53EsVMegytm
yMSmmK8g/iOsraylP9Z2Zbt8F5vFrfjCCGPFcaAQbcLVGIIQyvBXLg/1fhz49Cb0VVMea383x24e
7RFKwmZoP04was30RZsiujTmWZuIMgpT8l2OwsgDKoz60iWbapWy3ZmCe6Nsy775miRu7t2nAFqF
GKzqhuHSRWIEWkcKF/2HvkN8rGZhJctrHxIOPvgxswtQTUZXvY5XVXL49ts1Zk92WCRvje4l/G8q
fvB7IZY96J8F+Fq5uNczBHQ36FtIyYcgwo2c2WgU4WWWHXO2Y2T9uXrApSoSPPfAlIbAM/+GKoHk
aGM=
=+X3t
-----END PGP SIGNATURE-----

--------------narAWzlWjWnXm9xyvvG4fE78--
