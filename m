Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B487DDE75
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DBE10E689;
	Wed,  1 Nov 2023 09:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B104A10E684;
 Wed,  1 Nov 2023 09:32:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 77B3F1F74D;
 Wed,  1 Nov 2023 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698831172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3vmBjwD/d+NxGNhjF9yMG0k2a1MTjcivrW52SpFLZiE=;
 b=G5ijDprP3orDGN4buaWqCgDZTT4fmVIx5UXakMWi3ZDleFjCDvD0GJFNd/a/ESO6SMbEet
 k0u4Untlep1xdQuAPy5o37XjS8Rme5J3A+0rx08SCvKRBMEAuS7+vPOFBopAwrO+MkC+3L
 bmbrG6o0EmS5rM5XNiDCum1dL/gj/qU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698831172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3vmBjwD/d+NxGNhjF9yMG0k2a1MTjcivrW52SpFLZiE=;
 b=88x0v9XCK84p4brBJtfZewlI7nqBuTPLXnmQRPiq9G1TfwOS19FnnxIAoQzq63aAYW+SPv
 gVFsoH46ot5lO+AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C05313460;
 Wed,  1 Nov 2023 09:32:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qrLJDUQbQmVMCAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Nov 2023 09:32:52 +0000
Message-ID: <d3437d51-ee57-4b96-9a08-fd0919b140db@suse.de>
Date: Wed, 1 Nov 2023 10:32:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915: Initialize fbdev DRM client
 with callback functions
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Deak, Imre" <imre.deak@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20230927102808.18650-1-tzimmermann@suse.de>
 <20230927102808.18650-6-tzimmermann@suse.de>
 <62b2e622370df7557ea7d98ea65eaf2c5a09bb6e.camel@intel.com>
 <58a56618-318d-466e-afa0-0c3b1016a3ef@suse.de>
 <3f197071e61c0014b15f2de1a082f0a6d59495ec.camel@intel.com>
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
In-Reply-To: <3f197071e61c0014b15f2de1a082f0a6d59495ec.camel@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2AJi3Bw1dEIeZeeDt3NJfciN"
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2AJi3Bw1dEIeZeeDt3NJfciN
Content-Type: multipart/mixed; boundary="------------rmNgtjOj1AWhQtPWSH1WP0EA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Deak, Imre" <imre.deak@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <d3437d51-ee57-4b96-9a08-fd0919b140db@suse.de>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915: Initialize fbdev DRM client
 with callback functions
References: <20230927102808.18650-1-tzimmermann@suse.de>
 <20230927102808.18650-6-tzimmermann@suse.de>
 <62b2e622370df7557ea7d98ea65eaf2c5a09bb6e.camel@intel.com>
 <58a56618-318d-466e-afa0-0c3b1016a3ef@suse.de>
 <3f197071e61c0014b15f2de1a082f0a6d59495ec.camel@intel.com>
In-Reply-To: <3f197071e61c0014b15f2de1a082f0a6d59495ec.camel@intel.com>

--------------rmNgtjOj1AWhQtPWSH1WP0EA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMTEuMjMgdW0gMTA6MTAgc2NocmllYiBIb2dhbmRlciwgSm91bmk6DQpb
Li4uXQ0KPj4+IFdlIGFyZSBjdXJyZW50bHkgd29ya2luZyBvbiBuZXcgZHJpdmVyIG5hbWVk
IGFzIFhlLiBEdWUgdG8gdGhpcyBpdA0KPj4NCj4+IEkndmUgYWx3YXlzIHRob3VnaHQgdGhh
dCBpdCdzIGFuIGVudGlyZWx5IG5ldyBkcml2ZXIuIEJ1dCBJJ20gbm90DQo+PiByZWFsbHkN
Cj4+IHVwLXRvLWRhdGUuIFNvIHRoZSBYZSBkcml2ZXIgaXMgbG9jYXRlZCB1bmRlciBpOTE1
LyBhbmQgYWxzbyBzaGFyZXMNCj4+IGNvZGUNCj4+IHdpdGggdGhlIGV4aXN0aW5nIGk5MTUg
ZHJpdmVyPw0KPiANCj4gSXQgd2lsbCBtYWlubHkgc2hhcmUgZGlzcGxheSBjb2RlIHdpdGgg
aTkxNS4NCj4gDQo+Pg0KPj4+IG1pZ2h0IGFjdHVhbGx5IG1ha2Ugc2Vuc2UgdG8gdXNlIGlu
dGVsLWZiZGV2IGhlcmUgcmF0aGVyIHRoYW4gaTkxNS0NCj4+PiBmYmRldi4NCj4+DQo+PiBU
aGF0IGNoYW5nZSBjb3VsZCBicmVhayB1c2VyLXNwYWNlIHByb2dyYW1zLiBTZWUgdGhlIGNv
bW1lbnQgYXQgWzFdDQo+PiBhbmQNCj4+IHRoZSBjb21taXQgODQyNDcwYzRlMjExICgiUmV2
ZXJ0ICJkcm0vZmItaGVscGVyOiBpbXByb3ZlIERSTSBmYmRldg0KPj4gZW11bGF0aW9uIGRl
dmljZSBuYW1lcyIiKS7CoCBJJ2QgcmF0aGVyIGxlYXZlIHRoZSBzdHJpbmcgYXMgaXQgaXMu
DQo+IA0KPiBDbGllbnQgbmFtZSBkb2Vzbid0IGFmZmVjdCBuYW1lIHVzZWQgaW4gZmJpbmZv
LiBGb3IgaTkxNSBpdCBpcw0KPiBpOTE1ZHJtZmIgYXMgZWFybGllciBhbmQgZm9yIHhlIGl0
cyB4ZWRybWZiLiBBbHNvIHRoaXMgY2xpZW50IG5hbWUgaXMNCj4gY29tcGxldGVseSBuZXcg
YWRkZWQgYnkgeW91ciBwYXRjaGVzLiBJJ20gbm90IHN1cmUgd2hlcmUgaXQgd2lsbA0KPiB2
aXNpYmxlLiBJIHdhcyBvcmlnaW5hbGx5IHRoaW5raW5nIHVzaW5nIGRyaXZlci0+bmFtZSBh
cyBkb25lIGluDQo+IGRybV9mYl9oZWxwZXJfZmlsbF9pbmZvLCBidXQgSSB0aGluayBjb21t
b24gaW50ZWwtZmJkZXYgaXMganVzdCBmaW5lLg0KDQpSaWdodCwgSSB3YXMgY29uZnVzaW5n
IHRoZSBuYW1lcy4gVGhlIGNsaWVudCBuYW1lIGlzIHRoZSBuYW1lIG9mIHRoZSANCmZyYW1l
YnVmZmVyIGluIHZhcmlvdXMgcGxhY2VzLg0KDQpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92Ni42L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jI0w0MjEN
Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjYvc291cmNlL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYyNMMTE4Mg0KDQpCdXQgaXQgYXBwZWFycyB0byBi
ZSBvdmVyd3JpdHRlbiBieSBmYmRldiBsYXRlciBkdXJpbmcgaW5pdGlhbGl6YXRpb246DQoN
Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjYvc291cmNlL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZmJfaGVscGVyLmMjTDE2NzINCg0KSSdsbCBjaGFuZ2UgdGhlIG5hbWUg
dGhlbiwgYnV0IEknbSBub3Qgc3VyZSBpZiBpdCdsbCBtYWtlIGEgZGlmZmVyZW5jZSANCmlu
IHRoZSBlbmQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEJSLA0KPiANCj4g
Sm91bmkgSMO2Z2FuZGVyDQo+ICAgDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMN
Cj4+DQo+PiBbMV0NCj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjYv
c291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMjTDE3NTUNCj4+DQo+Pj4N
Cj4+PiBCUiwNCj4+Pg0KPj4+IEpvdW5pIEjDtmdhbmRlcg0KPj4+DQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmaW50
ZWxfZmJkZXZfY2xpZW50X2Z1bmNzKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkN
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX2RybV9mYl9o
ZWxwZXJfdW5wcmVwYXJlOw0KPj4+PiArDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqByZXQg
PSBkcm1fZmJfaGVscGVyX2luaXQoZGV2LCAmaWZiZGV2LT5oZWxwZXIpOw0KPj4+PiAtwqDC
oMKgwqDCoMKgwqBpZiAocmV0KSB7DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBrZnJlZShpZmJkZXYpOw0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIHJldDsNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgfQ0KPj4+PiArwqDCoMKgwqDC
oMKgwqBpZiAocmV0KQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290
byBlcnJfZHJtX2NsaWVudF9yZWxlYXNlOw0KPj4+PiAgICANCj4+Pj4gIMKgwqDCoMKgwqDC
oMKgwqDCoGRldl9wcml2LT5kaXNwbGF5LmZiZGV2LmZiZGV2ID0gaWZiZGV2Ow0KPj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgSU5JVF9XT1JLKCZkZXZfcHJpdi0+ZGlzcGxheS5mYmRldi5z
dXNwZW5kX3dvcmssDQo+Pj4+IGludGVsX2ZiZGV2X3N1c3BlbmRfd29ya2VyKTsNCj4+Pj4g
ICAgDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4+Pj4gKw0KPj4+PiAr
ZXJyX2RybV9jbGllbnRfcmVsZWFzZToNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgZHJtX2NsaWVu
dF9yZWxlYXNlKCZpZmJkZXYtPmhlbHBlci5jbGllbnQpOw0KPj4+PiArZXJyX2RybV9mYl9o
ZWxwZXJfdW5wcmVwYXJlOg0KPj4+PiArwqDCoMKgwqDCoMKgwqBkcm1fZmJfaGVscGVyX3Vu
cHJlcGFyZSgmaWZiZGV2LT5oZWxwZXIpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqBrZnJlZShp
ZmJkZXYpOw0KPj4+PiArwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPj4+PiAgwqDCoH0N
Cj4+Pj4gICAgDQo+Pj4+ICDCoMKgc3RhdGljIHZvaWQgaW50ZWxfZmJkZXZfaW5pdGlhbF9j
b25maWcodm9pZCAqZGF0YSwNCj4+Pj4gYXN5bmNfY29va2llX3QNCj4+Pj4gY29va2llKQ0K
Pj4+DQo+Pg0KPj4gLS0gDQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KPj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQo+PiBGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPj4g
R0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4g
TW9lcm1hbg0KPj4gSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo+IA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVl
cm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBN
Y0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==


--------------rmNgtjOj1AWhQtPWSH1WP0EA--

--------------2AJi3Bw1dEIeZeeDt3NJfciN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVCG0MFAwAAAAAACgkQlh/E3EQov+Au
bA/8DIu68UEyuPwnxkSbqsOevZ6Q6f1ibr91WBgyiakFy2I+Xcl0in9uzoyVbEkIcWqNpq1lOyx5
jP3VDdTCqEZXFNwdSX2jF+E0/qj0qeHVXfpunq+Uds/RTmtZ3H8f84UvWLpSxcmLVU8tSlbE/1GP
NZgrG53pmLUl9Wg2wn5qg9SJjPAuiVsUNXrZHmxU73ZnxNxFLxwUXb5KPFwiXc5pW1BCWBusJKI3
izc3qb0OT21cJYNAmwyIYRJOwiG9pbt1l5lvwsRUyz6+6FJ90LazGNfmeW6XbM7GsHHaRQ4qiNmv
dY35RN6u7B0tHlR2Qdq1ewu8WMsFDFNHT06adPMl1Jy7+wTl/yC5bvuPpie9iX6TkGm6H5Ok8sMd
QRQNyroJnNtYoopJhwR6k4cy8RwISjB4Bw3SFISpAAG3Drt5gKdGLlHCAuWnDa5ZlYyNM2iH4pC9
Yi2nJuCNyMyEySgz1d61ZdkzKTiJgvDmQTpL1bEmsNEwwp+qlxhHt4wpikDX254Fg3s2u23VyFV2
df47j8cgK9mMqxSwotn01AHFL7AbG55e/dwKifpq1MV8ZyDTrFxjBNwxTCB3kw36C39PCm453PY9
Eck3Lyo11t3Txtd3m5vHFw6xpFuQ2yNMDa8HgN8eVFFUn42rJIAfYIdSlF/bDWA8nrLqVJHHX9jL
7+M=
=0gMl
-----END PGP SIGNATURE-----

--------------2AJi3Bw1dEIeZeeDt3NJfciN--
