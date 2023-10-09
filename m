Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954FB7BD68E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEE810E24E;
	Mon,  9 Oct 2023 09:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C1E10E24C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:16:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 085D42185F;
 Mon,  9 Oct 2023 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696842979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q4d3wViWxrfL0ebeQfO9XmGrQod9H9e6JJVeprt3snA=;
 b=BdR/V7S6eL2sKg3vIEH8uuxIh2tmR35A4838juNYShu9eP8bxKIjVGtYQ5u9GkNcs/ZCFl
 uxzsIYZzUpopusP68Tu12tEw6M2aKX69oH0CSb+x+BEFfzo9zzfgwc/q5ARLgFh491btCn
 +H6orHvwj1szXQOkREx1kxfyHnBQ6Qw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696842979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q4d3wViWxrfL0ebeQfO9XmGrQod9H9e6JJVeprt3snA=;
 b=R0hjQdW6gVDcNyP19wsScjZUkcxiYQrIGRlNLdk0nhOSxUmmtHikz7AONA6c/TqP+4LjB6
 X/rVq5iLs68lGwCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCD1213586;
 Mon,  9 Oct 2023 09:16:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fM8gLeLEI2ViWwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Oct 2023 09:16:18 +0000
Message-ID: <8f501b5f-9541-425c-86b0-f3f267af6e6e@suse.de>
Date: Mon, 9 Oct 2023 11:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] drm/simpledrm: Preallocate format-conversion
 buffer in atomic_check
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-6-tzimmermann@suse.de>
 <87zg0xyysa.fsf@minerva.mail-host-address-is-not-set>
 <ae863124-17a9-44a7-9565-f8248e5d4317@suse.de>
 <874jj0rx3c.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <874jj0rx3c.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CLRkd5Jv5YJLAOzv8bkfcI0g"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CLRkd5Jv5YJLAOzv8bkfcI0g
Content-Type: multipart/mixed; boundary="------------xvKHfMDF8yI0leOKLwHjEaQ2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <8f501b5f-9541-425c-86b0-f3f267af6e6e@suse.de>
Subject: Re: [PATCH v4 5/7] drm/simpledrm: Preallocate format-conversion
 buffer in atomic_check
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-6-tzimmermann@suse.de>
 <87zg0xyysa.fsf@minerva.mail-host-address-is-not-set>
 <ae863124-17a9-44a7-9565-f8248e5d4317@suse.de>
 <874jj0rx3c.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <874jj0rx3c.fsf@minerva.mail-host-address-is-not-set>

--------------xvKHfMDF8yI0leOKLwHjEaQ2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA5LjEwLjIzIHVtIDEwOjU4IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4gSGVsbG8gVGhvbWFzLA0KPiANCj4+IEhpIEphdmllcg0KPj4N
Cj4+IEFtIDA1LjEwLjIzIHVtIDE1OjM4IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPj4+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBbLi4uXQ0KPiANCj4+Pj4gK3N0YXRpYyBpbnQgc2ltcGxlZHJtX3ByaW1h
cnlfcGxhbmVfaGVscGVyX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwN
Cj4+Pj4gKwkJCQkJCSAgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpDQo+
Pj4+ICt7DQo+Pj4+ICsJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqbmV3X3BsYW5lX3N0YXRl
ID0gZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7DQo+Pj4+
ICsJc3RydWN0IGRybV9zaGFkb3dfcGxhbmVfc3RhdGUgKm5ld19zaGFkb3dfcGxhbmVfc3Rh
dGUgPQ0KPj4+PiArCQl0b19kcm1fc2hhZG93X3BsYW5lX3N0YXRlKG5ld19wbGFuZV9zdGF0
ZSk7DQo+Pj4+ICsJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqbmV3X2ZiID0gbmV3X3BsYW5l
X3N0YXRlLT5mYjsNCj4+Pj4gKwlzdHJ1Y3QgZHJtX2NydGMgKm5ld19jcnRjID0gbmV3X3Bs
YW5lX3N0YXRlLT5jcnRjOw0KPj4+PiArCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X2Ny
dGNfc3RhdGUgPSBOVUxMOw0KPj4+PiArCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwbGFu
ZS0+ZGV2Ow0KPj4+PiArCXN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzZGV2ID0gc2ltcGxl
ZHJtX2RldmljZV9vZl9kZXYoZGV2KTsNCj4+Pj4gKwlpbnQgcmV0Ow0KPj4+PiArDQo+Pj4+
ICsJaWYgKG5ld19jcnRjKQ0KPj4+PiArCQluZXdfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNf
Z2V0X25ld19jcnRjX3N0YXRlKHN0YXRlLCBuZXdfY3J0Yyk7DQo+Pj4+ICsNCj4+Pj4gKwly
ZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19wbGFuZV9zdGF0ZShuZXdfcGxhbmVfc3Rh
dGUsIG5ld19jcnRjX3N0YXRlLA0KPj4+PiArCQkJCQkJICBEUk1fUExBTkVfTk9fU0NBTElO
RywNCj4+Pj4gKwkJCQkJCSAgRFJNX1BMQU5FX05PX1NDQUxJTkcsDQo+Pj4+ICsJCQkJCQkg
IGZhbHNlLCBmYWxzZSk7DQo+Pj4NCj4+PiBTYW1lIGNvbW1lbnQgdGhhdCB3aXRoIHRoZSBz
c2QxMzB4IGRyaXZlci4gSSB0aGluayB0aGF0IHdlIHNob3VsZCB1c2UgdGhlDQo+Pj4gZHJt
X3BsYW5lX2hlbHBlcl9hdG9taWNfY2hlY2soKSBoZWxwZXIgaW5zdGVhZCBvZiBvcGVuIGNv
ZGluZyBpdCBpbiBlYWNoDQo+Pg0KPj4gSSdtIGdvaW5nIHRvIHJlcGxhY2UgdGhlIGNhbGwg
aW4gc2ltcGxlZHJtLg0KPj4gZHJtX3BsYW5lX2hlbHBlcl9hdG9taWNfY2hlY2soKSBpcyB1
c2VmdWwgdG8gcmVtb3ZlIHRoZSBlbnRpcmUNCj4+IGF0b21pY19jaGVjayBmdW5jdGlvbiBm
cm9tIHRoZSBkcml2ZXI7IGl0IGRvZXMgbm90aGluZyBhcGFydCBmcm9tIHRoYXQuDQo+PiBJ
J3ZlIGJlZW4gY2FsbGVkIG91dCBiZWZvcmUgZm9yIHN1Y2ggZG8tbm90aGluZyBoZWxwZXJz
OyBkZXNlcnZlZGx5IHNvLiBbMV0NCj4+DQo+IA0KPiBUaGUgYXJndW1lbnQgdGhlbiBpcyB0
aGF0IGRyaXZlcnMgc2hvdWxkIG9wZW4gY29kZSAqZXhhY3RseSogdGhlIHNhbWUgY29kZQ0K
PiB0aGF0IHRoZSBoZWxwZXIgZnVuY3Rpb24gYWxyZWFkeSBoYXMganVzdCBiZWNhdXNlIHRo
ZXkgaW1wbGVtZW50IHRoZWlyIG93bg0KPiAuYXRvbWljX2NoZWNrIGNhbGxiYWNrPw0KPiAN
Cj4gQW5kIHRoYXQgdGhlIGhlbHBlciBzaG91bGQgb25seSBiZSB1c2VkIHdoZW4gaXMgdGhl
IC5hdG9taWNfY2hlY2sgY2FsbGJhY2sNCj4gYnV0IG5vdCBhcyBhIGhlbHBlciBmdW5jdGlv
bj8NCg0KTXkgcG9pbnQgKGFuZCBJIHRoaW5rIHRoYXQncyB3aGF0IENocmlzdGlhbiB3YXMg
YWxzbyByZWZlcnJpbmcgdG8pIGlzIA0KdGhhdCBkcm1fcGxhbmVfaGVscGVyX2F0b21pY19j
aGVjaygpIGRvZXMgbGl0dGxlIG1vcmUgdGhhbiBwaWNrIGEgZmV3IA0KZGVmYXVsdCB2YWx1
ZXMgZm9yIHRoZSBwYXJhbWV0ZXJzLiBJdCBkb2Vzbid0IGRvIGFueXRoaW5nIGluIHRlcm1z
IG9mIA0KYWxnb3JpdGhtcy4gSGVuY2UgdGhlcmUncyBubyBzYXZpbmcgaGVyZSB0aGF0IG91
dHdlaWdocyB0aGUgY29zdCBvZiANCnVzaW5nIHRoaXMgaGVscGVyLg0KDQo+IA0KPiBJIGRv
bid0IHVuZGVyc3RhbmQgdGhhdCByYXRpb25hbGUgdG8gYmUgaG9uZXN0LCBidXQgaWYgdGhl
cmUgaXMgb25lIHRoZW4NCj4gaXQgc2hvdWxkIGJlIHZlcnkgY2xlYXIgaW4gdGhlIGtlcm5l
bC1kb2Mgd2hhdCBmdW5jdGlvbnMgYXJlIHN1cHBvc2VkIHRvDQo+IGJlIHVzZWQgb25seSBh
cyBjYWxsYmFja3MgYW5kIHdoYXQgZnVuY3Rpb25zIGNhbiBhbHNvIGJlIHVzZWQgYXMgaGVs
cGVycy4NCg0KVGhlcmUncyBubyBjbGVhciBydWxlIEFGQUlLLiBXZSBoYXZlIHRvIGRlY2lk
ZSBjYXNlIGJ5IGNhc2UuIFRCSCBJIGRvbid0IA0KbWluZCByZS1ldmFsdWF0aW5nIGNhc2Vz
IGZyb20gdGltZSB0byB0aW1lLiBBdCBsZWFzdCwgSSdtIGdvaW5nIHRvIA0KcmV2ZXJ0IHRo
ZSBvcGVuLWNvZGVkIGhlbHBlciBpbiBzc2QxMzB4LCBhcyB5b3UgYXNrZWQgbWUgdG8uDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KPiANCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhv
bWFzDQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rl
diwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJC
IDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------xvKHfMDF8yI0leOKLwHjEaQ2--

--------------CLRkd5Jv5YJLAOzv8bkfcI0g
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUjxOIFAwAAAAAACgkQlh/E3EQov+CG
+Q//WuX1KHUN2VYmjH6do1jYpgxBjOPBgZJVOW8Ihp+XKMNHYCmlrKZg9Hv++/HsQDBKZdqcpYDj
BgtEmsz7W7DLrUdYOTznT+ZKzUslMZ4Gu8MTWaHy2V4mVDf51KnpVSbe6K3D9AR3jliBb4SVd8SM
JNINtMV5zPpcVSty67EtreGiuj2Wwf/ObuLPpZLXXStkURnOtechAH9OCSF4+7OsQozSAOXJTDpY
y3owKq0gI5IhqXG5gNOAYVLB00qthdeR60LNtRCPuOAGGp8Z6vo+z2kcujboQ5ov4ZFncA3i9LgW
BJ8UNh2JFSgU9nsaIRBmlD+novmSiOInhd962UmCHsgtk7d6/AAT3ZMc8G/TRwFxiRMPBpPX+IX+
hSBzCp22zgh5zi2ohXkyOnEsTt/a0S0+MDL71zZNhPtxXY1nqoXPOEtDNqpQhqVN5ZkfSE8P3E/C
l75xvmM71F9g2kcTUAKU2Et1EupSv75OZseD6EosXr7S3OaqEeolhycA0XGC2OoLKq/oQkCefjur
RDAg9bsnVcVbi1rNFxcsRelR/O/q07s6iMSqmczoaniUoZuH5B9DYt+1eTrb7xwJ5tN5lQdMH+lV
IrPpkGghTR2jpuey/BWp8nbMIQ6cX7Zb+B0/OzErYsM6FhFg36pZQPwtLu6bldDeWyrUfnVTakb6
698=
=CtNU
-----END PGP SIGNATURE-----

--------------CLRkd5Jv5YJLAOzv8bkfcI0g--
