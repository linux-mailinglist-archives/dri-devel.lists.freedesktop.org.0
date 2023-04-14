Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 481026E1D27
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 09:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D868410E04F;
	Fri, 14 Apr 2023 07:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5211710E05E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 07:29:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9003C21116;
 Fri, 14 Apr 2023 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681457335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0zP51UY+fOf6gAmW+I5A2PvdKkX246+o2tJSjCTWQUQ=;
 b=vnBBpxW3yDTifAg2bVrerKjQdzhoXi0hh3/WZ4m+sgwdinBlgL/eNPylwt/NimR4BKsTFY
 oOLNH0IArda+x+T2kRhUL3nTI4NZYj5ImBc/JjZS5Al0fn6UO/lH1peSgSqRCPwwa0Ta+m
 7GVa0IZbbuOTipEODDcZg2Llvlk8vI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681457335;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0zP51UY+fOf6gAmW+I5A2PvdKkX246+o2tJSjCTWQUQ=;
 b=KRxsUIVIUJMYlCo4JdOJJMV5it0V79jk83M+y+iUpVSVxoARBiDWf1u57NYt/mCMgb84SE
 HeEaphwbquEQw8Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D34613498;
 Fri, 14 Apr 2023 07:28:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aB6dDbcAOWRkTAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Apr 2023 07:28:55 +0000
Message-ID: <b99efcc6-1fdf-2f51-0f65-0bd1cfa2fa90@suse.de>
Date: Fri, 14 Apr 2023 09:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
References: <20230409132110.494630-1-15330273260@189.cn>
 <ZDV0Te65tSh4Q/vc@phenom.ffwll.local>
 <42f16d0d-4e1a-a016-f4cc-af24efa75f1c@189.cn>
 <ZDbuCWKfFlWyiOGp@phenom.ffwll.local>
 <dbac96b2-0fea-591b-517d-2a23cc36b8de@189.cn>
 <CAKMK7uG_h7htCDARudZpHOOMG4iOOLZmz0_WskvWGf+DKGwU1w@mail.gmail.com>
 <531f0bdf-2ae8-0361-183b-57b40df6345f@189.cn>
 <ZDhQW6El6ztyHK4M@phenom.ffwll.local>
 <1bbc7228-c2fe-0af0-c15c-b378bc4d111c@suse.de>
 <ZDhfkq92hbGc630z@phenom.ffwll.local>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ZDhfkq92hbGc630z@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SLLMbNX0pV34UUWknj6mKLwO"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SLLMbNX0pV34UUWknj6mKLwO
Content-Type: multipart/mixed; boundary="------------jNtpzqSLr8Zjut6npS1i8Gn7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
Message-ID: <b99efcc6-1fdf-2f51-0f65-0bd1cfa2fa90@suse.de>
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
References: <20230409132110.494630-1-15330273260@189.cn>
 <ZDV0Te65tSh4Q/vc@phenom.ffwll.local>
 <42f16d0d-4e1a-a016-f4cc-af24efa75f1c@189.cn>
 <ZDbuCWKfFlWyiOGp@phenom.ffwll.local>
 <dbac96b2-0fea-591b-517d-2a23cc36b8de@189.cn>
 <CAKMK7uG_h7htCDARudZpHOOMG4iOOLZmz0_WskvWGf+DKGwU1w@mail.gmail.com>
 <531f0bdf-2ae8-0361-183b-57b40df6345f@189.cn>
 <ZDhQW6El6ztyHK4M@phenom.ffwll.local>
 <1bbc7228-c2fe-0af0-c15c-b378bc4d111c@suse.de>
 <ZDhfkq92hbGc630z@phenom.ffwll.local>
In-Reply-To: <ZDhfkq92hbGc630z@phenom.ffwll.local>

--------------jNtpzqSLr8Zjut6npS1i8Gn7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDQuMjMgdW0gMjI6MDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIEFwciAxMywgMjAyMyBhdCAwOToyMDoyM1BNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMTMuMDQuMjMgdW0gMjA6NTYgc2Nocmll
YiBEYW5pZWwgVmV0dGVyOg0KPj4gWy4uLl0NCj4+Pg0KPj4+IFRoaXMgc2hvdWxkIHN3aXRj
aCB0aGUgZXhpc3RpbmcgY29kZSBvdmVyIHRvIHVzaW5nIGRybV9mcmFtZWJ1ZmZlciBpbnN0
ZWFkDQo+Pj4gb2YgZmJkZXY6DQo+Pj4NCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxw
ZXIuYw0KPj4+IGluZGV4IGVmNGViOGIxMjc2Ni4uOTljYTY5ZGQ0MzJmIDEwMDY0NA0KPj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+Pj4gQEAgLTY0NywyMiArNjQ3LDI2IEBA
IHN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZGFtYWdlKHN0cnVjdCBkcm1fZmJfaGVscGVy
ICpoZWxwZXIsIHUzMiB4LCB1MzIgeSwNCj4+PiAgICBzdGF0aWMgdm9pZCBkcm1fZmJfaGVs
cGVyX21lbW9yeV9yYW5nZV90b19jbGlwKHN0cnVjdCBmYl9pbmZvICppbmZvLCBvZmZfdCBv
ZmYsIHNpemVfdCBsZW4sDQo+Pj4gICAgCQkJCQkgICAgICAgc3RydWN0IGRybV9yZWN0ICpj
bGlwKQ0KPj4+ICAgIHsNCj4+PiArCXN0cnVjdCBkcm1fZmJfaGVscGVyICpoZWxwZXIgPSBp
bmZvLT5wYXI7DQo+Pj4gKw0KPj4+ICAgIAlvZmZfdCBlbmQgPSBvZmYgKyBsZW47DQo+Pj4g
ICAgCXUzMiB4MSA9IDA7DQo+Pj4gICAgCXUzMiB5MSA9IG9mZiAvIGluZm8tPmZpeC5saW5l
X2xlbmd0aDsNCj4+PiAtCXUzMiB4MiA9IGluZm8tPnZhci54cmVzOw0KPj4+IC0JdTMyIHky
ID0gRElWX1JPVU5EX1VQKGVuZCwgaW5mby0+Zml4LmxpbmVfbGVuZ3RoKTsNCj4+PiArCXUz
MiB4MiA9IGhlbHBlci0+ZmItPmhlaWdodDsNCj4+PiArCXVuc2lnbmVkIHN0cmlkZSA9IGhl
bHBlci0+ZmItPnBpdGNoZXNbMF07DQo+Pj4gKwl1MzIgeTIgPSBESVZfUk9VTkRfVVAoZW5k
LCBzdHJpZGUpOw0KPj4+ICsJaW50IGJwcCA9IGRybV9mb3JtYXRfaW5mb19icHAoaGVscGVy
LT5mYi0+Zm9ybWF0LCAwKTsNCj4+DQo+PiBQbGVhc2UgRE9OVCBkbyB0aGF0LiBUaGUgY29k
ZSBoZXJlIGlzIGZiZGV2IGNvZGUgYW5kIHNob3VsZG4ndCBib3RoZXIgYWJvdXQNCj4+IERS
TSBkYXRhIHN0cnVjdHVyZXMuIEFjdHVhbGx5LCBpdCBzaG91bGRuJ3QgYmUgaGVyZTogYSBu
dW1iZXIgb2YgZmJkZXYNCj4+IGRyaXZlcnMgd2l0aCBkZWZlcnJlZCBJL08gY29udGFpbiBz
aW1pbGFyIGNvZGUgYW5kIHRoZSBmYmRldiBtb2R1bGUgc2hvdWxkDQo+PiBwcm92aWRlIHVz
IHdpdGggYSBoZWxwZXIuIChJIHRoaW5rIEkgZXZlbiBoYWQgc29tZSBwYXRjaGVzIHNvbWV3
aGVyZS4pDQo+IA0KPiBXZWxsIG15IHRoaW5raW5nIGlzIHRoYXQgaXQncyBhIGRybSBkcml2
ZXIsIHNvIGlmIHdlIGhhdmUgaXNzdWUgd2l0aCBsaW1pdA0KDQpUZWNobmljYWxseSwgaXQn
cyBub3QgYSBkcml2ZXIsIGJ1dCBhIGNsaWVudC4NCg0KPiBjaGVja3MgYmxvd2luZyB1cCBp
dCBtYWtlcyBtb3JlIHNlbnNlIHRvIGNoZWNrIHRoZW0gYWdhaW5zdCBkcm0gbGltaXRzLg0K
DQpZb3UgY2FuIHN0aWxsIGRvIHRoaXMgaW4gZmJfZGlydHkgZHVyaW5nIHRoZSBhY3R1YWwg
dXBkYXRlLg0KDQo+IFBsdXMgYSBsb3QgbW9yZSBwZW9wbGUgdW5kZXJzdGFuZCB0aG9zZSB0
aGFuIGZiZGV2LiBUaGV5IHNob3VsZCBhbGwgbWF0Y2gNCj4gYW55d2F5LCBvciBpZiB0aGV5
IGRvbnQsIHdlIGhhdmUgYSBidWcuIFRoZSB0aGluZyBpcywgaWYgeW91IGNoYW5nZSB0aGlz
DQo+IGZ1cnRoZXIgdG8ganVzdCBwYXNzIHRoZSBkcm1fZnJhbWVidWZmZXIsIHRoZW4gdGhp
cyAxMDAlIGJlY29tZXMgYSBkcm0NCj4gZnVuY3Rpb24sIHdoaWNoIGNvdWxkIGJlIHVzZWQg
YnkgYW55dGhpbmcgaW4gZHJtIHJlYWxseS4NCg0KVGhlIGNvZGUgaXMgb25seSB1c2VmdWwg
dG8gZmJkZXYtZ2VuZXJpYyBhbmQgYSBudW1iZXIgb2xkZXIgb2YgZmJkZXYgDQpkcml2ZXJz
LiBOb3RoaW5nIGVsc2UgdXNlcyBkZWZlcnJlZCBJL08gYW5kIHRoZSByc3AgZGFtYWdlIGhh
bmRsaW5nLiANCkFueXRoaW5nIGVsc2Ugb3BlcmF0ZXMgZGlyZWN0bHkgb24gbWVtb3J5IGJ1
ZmZlcnMuIChpOTE1IGlzIGEgYml0IA0Kc3BlY2lhbCwgYnV0IGRvZXNuJ3QgdXNlIHRoaXMg
ZGFtYWdlIGhhbmRsaW5nLikgIFRoZSBmdW5jdGlvbiByZWFsbHkgDQpzaG91bGQgbm90IGJl
IGhlcmUuDQoNCkknZCBwdXNoIGJhY2sgb24gYWRkaXRpb25hbCBEUk0gY29kZSB3aXRoIGZi
ZGV2IGRlZmVycmVkIEkvTy4gRHJpdmVycycgDQpmYmRldiBzaG91bGQgZWl0aGVyIG9wZXJh
dGUgZGlyZWN0bHkgb24gR0VNIGJ1ZmZlcnM7IG9yIHRoZSBkcml2ZXIgDQpzaG91bGQgZW1w
bG95IGZiZGV2LWdlbmVyaWMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEJ1
dCBhbHNvICpzaHJ1ZyouDQo+IC1EYW5pZWwNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------jNtpzqSLr8Zjut6npS1i8Gn7--

--------------SLLMbNX0pV34UUWknj6mKLwO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ5ALYFAwAAAAAACgkQlh/E3EQov+B3
sg//cQx876aOejVGp8xtzsCzYoIXn0YKbCR0nJPlIu1mO9jjPHuWt1nJXoK15BT7IWkX+REK6iIv
psX9tGmSjglWQqfpes3gFre7vfc4ZbQlYhjrPTOJ66Nn5kc9YZ0wkodD5cWma4HWTTTSJJJo6RLM
xDOqtoem8VQHBm9ds8nWGIrxc8fjixfrZyiFeHKldcbx4w/SfnjZVMtiPz9ASdnwSYuSCcGPiDk9
ZYovB0JV8rcDRFXoa0BfwdyFcbhbOPvEJLb5CKwat3cvOVvfVpnDgQPRbIIwSiwNPkEawpSQn05P
PI+3kAdfGsAI0JALgdRmqC/JFxsAGSb5m89dQP4hBsdzQPWt5LCdwGux9zbaNJd3YKnt4nOyPIRl
DGBE2f8Fpq6CwHYQFvgnyDmeOWPOEKCrZgdlUgEoIHIIurzjW+P1Vm2JNnnP5sVTZewetEJoNRm4
apAfpe9w+6XLJAH1smKDzo1zCMQm28uGzGV0wwr8GsPjUoaNVeSE4e/aYTwhJ0lTHSIq0CqwKUJX
W2axBGgLihPp15UynrPuzYKUYiqR8h4noomEGjnEFxmwWYUeMeay8J66udNXNzc3yXToq3u64S7Z
Wyz4m1u43cqwMJt0RePLNYpoWfiDxWZhSrbuu081F6WHSIOerWd2RYoujZSYjbf51NOxYk4pjpvb
WyE=
=+hWa
-----END PGP SIGNATURE-----

--------------SLLMbNX0pV34UUWknj6mKLwO--
