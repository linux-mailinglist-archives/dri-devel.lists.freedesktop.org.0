Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927687B7865
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 09:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A60210E098;
	Wed,  4 Oct 2023 07:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6A410E098
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 07:08:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E1E3C1F74C;
 Wed,  4 Oct 2023 07:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696403336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FtZviwuU00lF5KyeMpnJBIyNz06P1Dbj5Ya6wZSbQlI=;
 b=pxWRgzpXuHEG5FxR2s4lbbkscaQIRYqTBxMnexO363gJ634TkKXKon7j2Uhwnpq5H6aR9q
 qYo3OmL7X8USnaFq55+R+K7pp4C+4akVkcKRMP7S54R2MbopDs5b7wNulwxLoHHT5fo8PI
 8O7kjtCa5abu+abURI51jF4oW1fkd4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696403336;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FtZviwuU00lF5KyeMpnJBIyNz06P1Dbj5Ya6wZSbQlI=;
 b=GovvjD+2MO2+PLM7UIFck5WLcUvrWk+uvI7CN4dpmnSpVQHrIO7dk3yVI4GNbwZDxOLMgl
 s7/VzYjw0GU3fECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8F8D139F9;
 Wed,  4 Oct 2023 07:08:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MOtkKIgPHWWidQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Oct 2023 07:08:56 +0000
Message-ID: <779d4fea-fb56-4e8d-8b01-34e13c027d30@suse.de>
Date: Wed, 4 Oct 2023 09:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/format-helper: Add struct drm_xfrm_buf to
 cache format conversion
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <20230920142535.19321-2-tzimmermann@suse.de>
 <87jzs94c64.fsf@minerva.mail-host-address-is-not-set>
Content-Language: en-US
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
In-Reply-To: <87jzs94c64.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0aLHCbLrKz5BsaYJ1ENfS0yS"
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
--------------0aLHCbLrKz5BsaYJ1ENfS0yS
Content-Type: multipart/mixed; boundary="------------llKolP6WL7zhDywan18uiXcx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <779d4fea-fb56-4e8d-8b01-34e13c027d30@suse.de>
Subject: Re: [PATCH v2 1/5] drm/format-helper: Add struct drm_xfrm_buf to
 cache format conversion
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <20230920142535.19321-2-tzimmermann@suse.de>
 <87jzs94c64.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87jzs94c64.fsf@minerva.mail-host-address-is-not-set>

--------------llKolP6WL7zhDywan18uiXcx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDI5LjA5LjIzIHVtIDEwOjI3IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4+IEhvbGQgdGVtcG9yYXJ5IG1lbW9yeSBmb3IgZm9ybWF0IGNv
bnZlcnNpb24gaW4gYW4gaW5zdGFuY2Ugb2Ygc3RydWN0DQo+PiBkcm1feGZybV9idWYuIFVw
ZGF0ZSBpbnRlcm5hbCBoZWxwZXJzIG9mIERSTSdzIGZvcm1hdC1jb252ZXJzaW9uIGNvZGUN
Cj4+IGFjY29yZGluZ2x5LiBEcml2ZXJzIHdpbGwgbGF0ZXIgYmUgYWJsZSB0byBrZWVwIHRo
aXMgY2FjaGUgYWNyb3NzDQo+PiBkaXNwbGF5IHVwZGF0ZXMuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0N
Cj4gDQo+IFsuLi5dDQo+IA0KPj4gK2ludCBkcm1tX3hmcm1fYnVmX2luaXQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV94ZnJtX2J1ZiAqYnVmKQ0KPj4gK3sNCj4+ICsJ
YnVmLT5tZW0gPSBOVUxMOw0KPj4gKwlidWYtPnNpemUgPSAwOw0KPj4gKwlidWYtPnByZWFs
bG9jYXRlZCA9IGZhbHNlOw0KPj4gKw0KPj4gKwlyZXR1cm4gZHJtbV9hZGRfYWN0aW9uX29y
X3Jlc2V0KGRldiwgZHJtX3hmcm1fYnVmX2luaXRfcmVsZWFzZSwgYnVmKTsNCj4+ICt9DQo+
PiArRVhQT1JUX1NZTUJPTChkcm1tX3hmcm1fYnVmX2luaXQpOw0KPj4gKw0KPiANCj4gQ2Fu
IHdlIGZpbmQgYSBiZXR0ZXIgbmFtZSB0aGFuIHhmcm0/IEkga25vdyB0aGF0IHRoaXMgaXMg
d2hhdCdzIHVzZWQgaW4NCj4gdGhlIGludGVybmFsIGRybV9mb3JtYXRfaGVscGVyLmMgaGVs
cGVycyBidXQgaWYgd2UgYXJlIGV4cG9zaW5nIHRoaXMgdG8NCj4gZHJpdmVycywgdGhlbiBJ
IHRoaW5rIHRoYXQgdGhlIG5hbWluZyBpcyBub3Qgc2VsZiBleHBsYW5hdG9yeS4NCj4gDQo+
PiArLyoqDQo+PiArICogZHJtX3hmcm1fYnVmX3Jlc2VydmUgLSBBbGxvY2F0ZXMgc3RvcmFn
ZSBpbiBhbiB4ZnJtIGJ1ZmZlcg0KPj4gKyAqIEBidWY6IFRoZSB4ZnJtIGJ1ZmZlcg0KPiAN
Cj4gQXQgbGVhc3QgaW4gdGhlIGtlcm5lbC1kb2Mgd2UgY2FuIHNheSAiVGhlIGJ1ZmZlciB1
c2VkIGZvciBwaXhlbCBmb3JtYXQNCj4gY29udmVyc2lvbiIgb3Igc29tZXRoaW5nIGFsb25n
IHRob3NlIGxpbmVzLg0KPiANCj4gWy4uLl0NCj4gDQo+PiArLyoqDQo+PiArICogc3RydWN0
IGRybV94ZnJtX2J1ZiAtIFN0b3JlcyB0cmFuc2Zvcm1hdGlvbiBhbmQgY29udmVyc2lvbiBz
dGF0ZQ0KPj4gKyAqDQo+PiArICogRFJNIGhlbHBlcnMgZm9yIGZvcm1hdCBjb252ZXJzaW9u
IHN0b3JlIHRlbXBvcmFyeSBzdGF0ZSBpbg0KPj4gKyAqIHN0cnVjdCBkcm1feGZybV9idWYu
IFRoZSBidWZmZXIncyByZXNvdXJjZXMgY2FuIGJlIHJldXNlZA0KPiANCj4gQW5kIHNhbWUg
aGVyZS4gTWF5YmUgc3RydWN0IGRybV9mbXRfY29udmVyc2lvbl9idWYgPw0KDQpJIGZpbmQg
dGhpcyBuYW1lIHRvIGJlIHVucGxlYXNhbnQgdG8gcmVhZC4gQ2FuIHdlIHVzZSANCmRybV9m
b3JtYXRfY29udl9zdGF0ZSBvciBkcm1fZm10Y252X3N0YXRlPw0KDQpJbiB0aGUgZGlzY3Vz
c2lvbiBhYm91dCB0aGUgcGFuaWMgaGFuZGxlciwgSSBtZW50aW9uZWQgdGhhdCB0aGUgc3Ry
dWN0IA0KY2FuIGJlIHVzZWQgdG8gc3RvcmUgbW9yZSBpbmZvcmFtdGlvbiwgc3VjaCBhcyBw
YWxldHRlIGVudHJpZXMgb3IgZmcvYmcgDQpjb2xvcnMuIFRoYXQgd291bGQgZW5hYmxlIHN1
cHBvcnQgZm9yIGNvbnZlcnRpbmcgaW5kZXhlZCBmb3JtYXRzLCBoZW5jZSANCnRoZSBfc3Rh
dGUgcG9zdGZpeC4NCg0KSW4gdGhlIGxvbmdlciB0ZXJtLCBJJ2QgYWxzbyBsaWtlIHRvIHJl
cGxhY2UgdGhlIGRybV9mcmFtZWJ1ZmZlciBmcm9tIA0KdGhlIEFQSSBhbmQgdGhlbiByZW5h
bWUgdGhlIGZ1bmN0aW9ucyB0byBzb21ldGhpbmcgbGlrZSANCmRybV9mbXRjbnZfPHg+X3Rv
Xzx5PigpLiBUaGUgZnJhbWVidWZmZXIgcmVhbGx5IGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNl
IA0KYW55IGxvbmdlci4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gT3RoZXIg
dGhhbiB0aGlzIG5pdCwgdGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuDQo+IA0KPiBSZXZp
ZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+
DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJh
c3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRy
ZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkg
KEFHIE51ZXJuYmVyZykNCg==

--------------llKolP6WL7zhDywan18uiXcx--

--------------0aLHCbLrKz5BsaYJ1ENfS0yS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUdD4gFAwAAAAAACgkQlh/E3EQov+CY
wA//T5yN/YJYmYYHfKmmC35w9fmTeUbMEUnuyDD1wLwS5o/N7oJSrc/gFuE6gETGNLxd3DiwlzqZ
/JWjzuiMl6fW5tCmP7NXp2niYViVnqYCbKvhw0zevulSUKoD42T7NkiGU4gUmP5sQQJG8HE3MEfq
jK2hGqTkTDxAxngTe0KPwMskVYTPSaisxzIuBQRKLHG6Qr3sDAf0ZQwpcqjNEc701LQQLQw0e422
PRkcJ3G6PY2G7bC1XzRY4FUiqafwmtWrHJLDblulO2V/3mJ7haNjNPx8iKs4/zqTbsThb6An4Er0
191/Tfoq+GIc2h76YLkhcsyJfOZ437f/EGaf8vvx8Gkl3NEqKKDjOAx/NnF2BGuWHuA2KJdLJXX9
kHludG2NAn1/mhIOVe44MIu/Eq2BBOQl1i2qUVXPmGvbDBlLebuWC3qzMytQoq5wOM5CW8jUAG6c
J9YOZgR4qyhgOI9MNZJilpDuVttXehHajoejXgArK493eIPWLuhx9oEIq1wCZ+2Pt8j9aAIIMAx1
M80SBV4ci7xO9jh1yYoQVqT5MCJu/bdbEipSBGtaIMAvpVkK8+IRKBPDtrUufFWiFp5R53Rgl/yJ
ccwRdqxB27H94ziTAGJRkO6ph2MCa4N08RTDlcO47c0e6HUjI3yQ/+1OXSTHLQWNvjODAGlFzPUW
hUk=
=78gh
-----END PGP SIGNATURE-----

--------------0aLHCbLrKz5BsaYJ1ENfS0yS--
