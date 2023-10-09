Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F41277BD56A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 10:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BC810E220;
	Mon,  9 Oct 2023 08:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D096210E220
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 08:43:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D70921852;
 Mon,  9 Oct 2023 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696840980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Df8vOmpN8BVlzxo1w+iCyLYIVF0RtLnwhe2b1VWWXHc=;
 b=uMfKMF73lBRT6iYqVfBruUdqfAhMOlHgQ7gQrS/batLdWLTj1xK8bAt8WwVC3jA82+I7Xs
 H3Qupb8ByLBc6lzAlyIDsVmj6y9xf2fkNyN1c+B3FLBTlOPzCyROESHLIvPo7TndY05ol5
 kdlfq7nCxAAT8Wlp0aPgZYM1Mkl/NCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696840980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Df8vOmpN8BVlzxo1w+iCyLYIVF0RtLnwhe2b1VWWXHc=;
 b=GNsdbQVRy9vkxJO9HMuZKF+PIHlhP0N6fOoELPk658i7daub63zSPaeDyTWY/UNelXbnzR
 HLWE+zDY7G1koOAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3201D13586;
 Mon,  9 Oct 2023 08:43:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kWrEChS9I2VCSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Oct 2023 08:43:00 +0000
Message-ID: <ae863124-17a9-44a7-9565-f8248e5d4317@suse.de>
Date: Mon, 9 Oct 2023 10:42:59 +0200
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
In-Reply-To: <87zg0xyysa.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DHFW7RSUfC74yJ9kT2VRtxRw"
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
--------------DHFW7RSUfC74yJ9kT2VRtxRw
Content-Type: multipart/mixed; boundary="------------ZUMnD47liySqWPjexD4I08b8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <ae863124-17a9-44a7-9565-f8248e5d4317@suse.de>
Subject: Re: [PATCH v4 5/7] drm/simpledrm: Preallocate format-conversion
 buffer in atomic_check
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-6-tzimmermann@suse.de>
 <87zg0xyysa.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87zg0xyysa.fsf@minerva.mail-host-address-is-not-set>

--------------ZUMnD47liySqWPjexD4I08b8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA1LjEwLjIzIHVtIDE1OjM4IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4gSGVsbG8gVGhvbWFzLA0KPiANCj4+IFByZWFsbG9jYXRlIHRo
ZSBmb3JtYXQtY29udmVyc2lvbiBzdGF0ZSdzIHN0b3JhZ2UgaW4gdGhlIHBsYW5lJ3MNCj4+
IGF0b21pY19jaGVjayBmdW5jdGlvbiBpZiBhIGZvcm1hdCBjb252ZXJzaW9uIGlzIG5lY2Vz
c2FyeS4gQWxsb3dzDQo+PiB0aGUgdXBkYXRlIHRvIGZhaWwgaWYgbm8gbWVtb3J5IGlzIGF2
YWlsYWJsZS4gQXZvaWRzIHRoZSBzYW1lDQo+PiBhbGxvY2F0aW9uIHdpdGhpbiBhdG9taWNf
dXBkYXRlLCB3aGljaCBtYXkgbm90IGZhaWwuDQo+Pg0KPj4gQWxzbyBpbmxpbmUgZHJtX3Bs
YW5lX2hlbHBlcl9hdG9taWNfY2hlY2soKSBpbnRvIHRoZSBkcml2ZXIgYW5kIHRodXMNCj4+
IHJldHVybiBlYXJseSBmb3IgaW52aXNpYmxlIHBsYW5lcy4gQXZvaWRzIG1lbW9yeSBhbGxv
Y2F0aW9uIGVudGlyZWx5DQo+PiBpbiB0aGlzIGNhc2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+
ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCA0MSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdGlueS9zaW1wbGVkcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5j
DQo+PiBpbmRleCA2Nzg4ZjQ2NTk5NWIzLi5kMjI4MGM4MWNiYWFlIDEwMDY0NA0KPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+PiBAQCAtMTksNiArMTksNyBAQA0KPj4gICAj
aW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fZmJkZXZf
Z2VuZXJpYy5oPg0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9mb3JtYXRfaGVscGVyLmg+DQo+
PiArI2luY2x1ZGUgPGRybS9kcm1fZnJhbWVidWZmZXIuaD4NCj4+ICAgI2luY2x1ZGUgPGRy
bS9kcm1fZ2VtX2F0b21pY19oZWxwZXIuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fZ2Vt
X2ZyYW1lYnVmZmVyX2hlbHBlci5oPg0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fc2ht
ZW1faGVscGVyLmg+DQo+PiBAQCAtNTc5LDYgKzU4MCw0NCBAQCBzdGF0aWMgY29uc3QgdWlu
dDY0X3Qgc2ltcGxlZHJtX3ByaW1hcnlfcGxhbmVfZm9ybWF0X21vZGlmaWVyc1tdID0gew0K
Pj4gICAJRFJNX0ZPUk1BVF9NT0RfSU5WQUxJRA0KPj4gICB9Ow0KPj4gICANCj4+ICtzdGF0
aWMgaW50IHNpbXBsZWRybV9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfY2hlY2soc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+PiArCQkJCQkJICAgICAgIHN0cnVjdCBkcm1fYXRv
bWljX3N0YXRlICpzdGF0ZSkNCj4+ICt7DQo+PiArCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUg
Km5ld19wbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZShzdGF0
ZSwgcGxhbmUpOw0KPj4gKwlzdHJ1Y3QgZHJtX3NoYWRvd19wbGFuZV9zdGF0ZSAqbmV3X3No
YWRvd19wbGFuZV9zdGF0ZSA9DQo+PiArCQl0b19kcm1fc2hhZG93X3BsYW5lX3N0YXRlKG5l
d19wbGFuZV9zdGF0ZSk7DQo+PiArCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKm5ld19mYiA9
IG5ld19wbGFuZV9zdGF0ZS0+ZmI7DQo+PiArCXN0cnVjdCBkcm1fY3J0YyAqbmV3X2NydGMg
PSBuZXdfcGxhbmVfc3RhdGUtPmNydGM7DQo+PiArCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
bmV3X2NydGNfc3RhdGUgPSBOVUxMOw0KPj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0g
cGxhbmUtPmRldjsNCj4+ICsJc3RydWN0IHNpbXBsZWRybV9kZXZpY2UgKnNkZXYgPSBzaW1w
bGVkcm1fZGV2aWNlX29mX2RldihkZXYpOw0KPj4gKwlpbnQgcmV0Ow0KPj4gKw0KPj4gKwlp
ZiAobmV3X2NydGMpDQo+PiArCQluZXdfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25l
d19jcnRjX3N0YXRlKHN0YXRlLCBuZXdfY3J0Yyk7DQo+PiArDQo+PiArCXJldCA9IGRybV9h
dG9taWNfaGVscGVyX2NoZWNrX3BsYW5lX3N0YXRlKG5ld19wbGFuZV9zdGF0ZSwgbmV3X2Ny
dGNfc3RhdGUsDQo+PiArCQkJCQkJICBEUk1fUExBTkVfTk9fU0NBTElORywNCj4+ICsJCQkJ
CQkgIERSTV9QTEFORV9OT19TQ0FMSU5HLA0KPj4gKwkJCQkJCSAgZmFsc2UsIGZhbHNlKTsN
Cj4gDQo+IFNhbWUgY29tbWVudCB0aGF0IHdpdGggdGhlIHNzZDEzMHggZHJpdmVyLiBJIHRo
aW5rIHRoYXQgd2Ugc2hvdWxkIHVzZSB0aGUNCj4gZHJtX3BsYW5lX2hlbHBlcl9hdG9taWNf
Y2hlY2soKSBoZWxwZXIgaW5zdGVhZCBvZiBvcGVuIGNvZGluZyBpdCBpbiBlYWNoDQoNCkkn
bSBnb2luZyB0byByZXBsYWNlIHRoZSBjYWxsIGluIHNpbXBsZWRybS4gDQpkcm1fcGxhbmVf
aGVscGVyX2F0b21pY19jaGVjaygpIGlzIHVzZWZ1bCB0byByZW1vdmUgdGhlIGVudGlyZSAN
CmF0b21pY19jaGVjayBmdW5jdGlvbiBmcm9tIHRoZSBkcml2ZXI7IGl0IGRvZXMgbm90aGlu
ZyBhcGFydCBmcm9tIHRoYXQuIA0KSSd2ZSBiZWVuIGNhbGxlZCBvdXQgYmVmb3JlIGZvciBz
dWNoIGRvLW5vdGhpbmcgaGVscGVyczsgZGVzZXJ2ZWRseSBzby4gWzFdDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZl
bC9hYTNjNGFkNi1mOTllLWRlNDgtZTc5Ny0wNzQ4Yzk3MDZlOWVAYW1kLmNvbS8NCg0KPiBk
cml2ZXIuIEJ1dCByZWdhcmRsZXNzIG9mIHdoYXQncyBkZWNpZGVkIG9uIHRoYXQsIHRoZSBj
aGFuZ2UgbG9va3MgZ29vZDoNCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcs
IEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxk
LCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------ZUMnD47liySqWPjexD4I08b8--

--------------DHFW7RSUfC74yJ9kT2VRtxRw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUjvRMFAwAAAAAACgkQlh/E3EQov+D5
pA//c3Vy6WI+zEanw8hF0CiLa+M3G6JfwxAN4wSe0kd/K4oORUaCHBG/3h0C4boUeE6sWkCweNYB
9gDzXT3yENAs+hQyBITHTMTMs8vULVQH/+mXZehT374XVRnsamxRO7nPzdbpIUSmqtEJih0MU2et
6t4UmV2KIH2kmVe/BB9EPxoDzl5SE+rkaTJRMKculxV0oqkh6vpBRafXc27yaJRCczfZCYr5RJBy
yONgoynIOpzTCVPEY7+fFRMJE5OMqYmtfu6O3PGs85e2Tnggkxipm1mQHfBpR2QhkJDWSFVhKeDH
AnFMVHLuJx2KCpP5PCKRJS5EaFpMWwQnaqeH/nxIf9DROnJ0iSTRe+eEMUaHIQQwPkn6QB4CXBTH
ExaQT+7SgXLLvR2LdIswx5RJ2SoVP62hWjpqaGLmVmJBhtjSQYS5hGBiog5DrOqUwPv6cUViaC6B
eSC6cYw3j48554axIvcZ36H7DUiPqn92m8jSuqT8XjIbNWvgDnuS8m7B5F2vZtWVSvokVTWMsx20
Q68zuMxjXr0w0ZG4NHYWabeQvNAhv8anwSs8zzrXsxVf+nQP88oen2xCwYm0Q3zUw5UQfvHZrsS1
41evwcDwTdYcMZspTjLTb2LW0Yf3b/IBXdQp1OIXQ22NYE2aIDnaPT4bLOs6hURz44XJfBJUfh0c
PGE=
=QPCO
-----END PGP SIGNATURE-----

--------------DHFW7RSUfC74yJ9kT2VRtxRw--
