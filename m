Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FC37B9CD2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 13:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832DC10E3EB;
	Thu,  5 Oct 2023 11:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC2510E3DB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 11:54:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 77AC51F88C;
 Thu,  5 Oct 2023 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696506896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5p0A7/chiZsIq9MvBHh4HRv8lvISKuZtRy2G4vYeOho=;
 b=t+9wKZRei/vTvzMH8p4PlnL/6w5VBO4waOQckZQ9zWAeN4RhSLBhPFjJZakS68Lh/zUsDT
 Q7HvEV2PX94fyA6diqDyu/D7YnSGGIBWvkAo+AeL5SJchLh7dMYqxZ0nTbJMgAJzFvRLLv
 lHcWHAz5DqAMlp+8wEhTuyiNy+SaF2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696506896;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5p0A7/chiZsIq9MvBHh4HRv8lvISKuZtRy2G4vYeOho=;
 b=tLOCDPWDMIvCQFdNlvQGH8K3zIA6t8/yiSpE7K5oi71RH2v7CbsXMcfv0OORN0eIvChnfl
 wBxNwPJDbntkcEDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A246139C2;
 Thu,  5 Oct 2023 11:54:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 10tECRCkHmU/VgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Oct 2023 11:54:56 +0000
Message-ID: <c4fd1d91-7d9b-483f-8b1d-10857a6f1016@suse.de>
Date: Thu, 5 Oct 2023 13:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/ssd130x: Fix atomic_check for disabled planes
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-7-tzimmermann@suse.de>
 <8734ypwb9w.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <8734ypwb9w.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qC5wYuLJaN81Kmifvf89ep1n"
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qC5wYuLJaN81Kmifvf89ep1n
Content-Type: multipart/mixed; boundary="------------dMLIwN1ZbxTs157Ebu2l1N8s";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <c4fd1d91-7d9b-483f-8b1d-10857a6f1016@suse.de>
Subject: Re: [PATCH v4 6/7] drm/ssd130x: Fix atomic_check for disabled planes
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-7-tzimmermann@suse.de>
 <8734ypwb9w.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <8734ypwb9w.fsf@minerva.mail-host-address-is-not-set>

--------------dMLIwN1ZbxTs157Ebu2l1N8s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA1LjEwLjIzIHVtIDEzOjM3IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4gSGVsbG8gVGhvbWFzLA0KPiANCj4gVGhhbmtzIGZvciB5b3Vy
IHBhdGNoLg0KPiANCj4+IFRoZSBwbGFuZSdzIGF0b21pY19jaGVjayByZXR1cm5zIC1FSU5W
QUwgaWYgdGhlIENSVEMgaGFzIG5vdCBiZWVuDQo+PiBzZXQuIFRoaXMgaXMgdGhlIGNhc2Ug
Zm9yIGRpc2FibGVkIHBsYW5lcywgZm9yIHdoaWNoIGF0b21pY19jaGVjaw0KPj4gc2hvdWxk
IHJldHVybiAwLiBGb3IgZGlzYWJsZWQgcGxhbmVzLCBpdCBhbHNvIG9taXRzIHRoZSBtYW5k
YXRvcnkNCj4+IGNhbGwgdG8gZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVfc3RhdGUo
KS4NCj4+DQo+PiBSZXBsYWNlIHRoZSB0ZXN0IHdpdGggdGhlIGJvaWxlci1wbGF0ZSBjb2Rl
IHRoYXQgZmlyc3QgaW52b2tlcw0KPj4gZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVf
c3RhdGUoKSBhbmQgdGhlbiB0ZXN0cyBmb3IgdGhlIHBsYW5lDQo+PiB0byBiZSB2aXNpYmxl
LiBSZXR1cm4gZWFybHkgZm9yIG5vbi12aXNpYmxlIHBsYW5lcy4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IEZp
eGVzOiBkNTFmOWZiZDk4YjYgKCJkcm0vc3NkMTMweDogU3RvcmUgdGhlIEhXIGJ1ZmZlciBp
biB0aGUgZHJpdmVyLXByaXZhdGUgQ1JUQyBzdGF0ZSIpDQo+PiBDYzogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4+IENjOiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4+IENjOiBNYXhpbWUgUmlwYXJkIDxt
cmlwYXJkQGtlcm5lbC5vcmc+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3NvbG9t
b24vc3NkMTMweC5jIHwgMTcgKysrKysrKysrLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jIGIvZHJpdmVycy9ncHUvZHJt
L3NvbG9tb24vc3NkMTMweC5jDQo+PiBpbmRleCAzZGQ4ZThhNDQ0YjZmLi5kY2NiZmUzM2Vk
YjVlIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5j
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMNCj4+IEBAIC02
MzksMjEgKzYzOSwyMiBAQCBzdGF0aWMgaW50IHNzZDEzMHhfcHJpbWFyeV9wbGFuZV9hdG9t
aWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+PiAgIAlzdHJ1Y3QgZHJtX3Bs
YW5lX3N0YXRlICpwbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0
ZShzdGF0ZSwgcGxhbmUpOw0KPj4gICAJc3RydWN0IHNzZDEzMHhfcGxhbmVfc3RhdGUgKnNz
ZDEzMHhfc3RhdGUgPSB0b19zc2QxMzB4X3BsYW5lX3N0YXRlKHBsYW5lX3N0YXRlKTsNCj4+
ICAgCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IHBsYW5lX3N0YXRlLT5jcnRjOw0KPj4gLQlz
dHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGU7DQo+PiArCXN0cnVjdCBkcm1fY3J0
Y19zdGF0ZSAqY3J0Y19zdGF0ZSA9IE5VTEw7DQo+PiAgIAljb25zdCBzdHJ1Y3QgZHJtX2Zv
cm1hdF9pbmZvICpmaTsNCj4+ICAgCXVuc2lnbmVkIGludCBwaXRjaDsNCj4+ICAgCWludCBy
ZXQ7DQo+PiAgIA0KPj4gLQlpZiAoIWNydGMpDQo+PiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4+
IC0NCj4+IC0JY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X2NydGNfc3RhdGUoc3RhdGUs
IGNydGMpOw0KPj4gLQlpZiAoSVNfRVJSKGNydGNfc3RhdGUpKQ0KPj4gLQkJcmV0dXJuIFBU
Ul9FUlIoY3J0Y19zdGF0ZSk7DQo+PiArCWlmIChjcnRjKQ0KPj4gKwkJY3J0Y19zdGF0ZSA9
IGRybV9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKTsNCj4+ICAgDQo+
PiAtCXJldCA9IGRybV9wbGFuZV9oZWxwZXJfYXRvbWljX2NoZWNrKHBsYW5lLCBzdGF0ZSk7
DQo+PiArCXJldCA9IGRybV9hdG9taWNfaGVscGVyX2NoZWNrX3BsYW5lX3N0YXRlKHBsYW5l
X3N0YXRlLCBjcnRjX3N0YXRlLA0KPj4gKwkJCQkJCSAgRFJNX1BMQU5FX05PX1NDQUxJTkcs
DQo+PiArCQkJCQkJICBEUk1fUExBTkVfTk9fU0NBTElORywNCj4+ICsJCQkJCQkgIGZhbHNl
LCBmYWxzZSk7DQo+IA0KPiBBcyBHZWVydCBtZW50aW9uZWQgeW91IGFyZSBvcGVuIGNvZGlu
ZyBoZXJlIHdoYXQgdGhlIGNhbGxlZCBoZWxwZXIgYWxyZWFkeQ0KPiBkb2VzLiBJIHByZWZl
ciB0byBrZWVwIGRvaW5nIHRoYXQsIGluc3RlYWQgb2YgYWRkaW5nIGJvaWxlciBwbGF0ZSBj
b2RlLg0KDQpQbGVhc2Ugc2VlIG15IG90aGVyIGVtYWlsLg0KDQo+IA0KPiBPbmUgcXVlc3Rp
b24sIHRoZSByZWFzb24gdG8gcmV0dXJuIC1FSU5WQUwgd2FzIHRvIHByZXZlbnQgdGhlIGNh
bGxiYWNrDQo+IHNzZDEzMHhfcHJpbWFyeV9wbGFuZV9hdG9taWNfdXBkYXRlKCkgdG8gYmUg
ZXhlY3V0ZWQsIHNpbmNlIHRoYXQgYXR0ZW1wdHMNCj4gdG8gZ2V0IHRoZSBDUlRDIHN0YXRl
IHRvIHBhc3MgdGhlIEhXIGJ1ZmZlciB0byBzc2QxMzB4X2ZiX2JsaXRfcmVjdCgpLg0KDQpS
ZXR1cm5pbmcgYW4gZXJybm8gY29kZSBhYm9ydHMgdGhlIGNvbW1pdC4gWzFdIFRoZSBDUlRD
IGNhbiAobWF5YmUgDQpzaG91bGQ/KSBiZSBOVUxMIHRvIGRpc2FibGUgdGhlIHBsYW5lLiAo
SXQgaXMgaW4gc3luYyB3aXRoIA0KcGxhbmVfc3RhdGUtPmZiIElJUkMuKQ0KDQpTbyBjYW4g
eW91IGRpc2FibGUgdGhlIHBsYW5lIG5vdz8NCg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjYuNS9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNf
aGVscGVyLmMjTDk5Nw0KDQo+IA0KPiBJIGJlbGlldmUgdGhpcyBwYXRjaCB3aWxsIGludHJv
ZHVjZSBhIHJlZ3Jlc3Npb24gYW5kIGNhdXNlIGEgTlVMTCBwb2ludGVyDQo+IGRlcmVmZXJl
bmNlIHdoZW4gIXBsYW5lX3N0YXRlLT5jcnRjIGFuZCB5b3Ugc2hvdWxkIGFsc28gYWRkIGEg
Y2hlY2sgZm9yDQo+IHBsYW5lX3N0YXRlLT52aXNpYmxlIGluIHNzZDEzMHhfcHJpbWFyeV9w
bGFuZV9hdG9taWNfdXBkYXRlKCkgdG8gYmFpbCA/DQoNCllvdSBoYXZlIGEgYXRvbWljX2Rp
c2FibGUgaW4gdGhhdCBwbGFuZSwgc28geW91J3JlIHRha2luZyB0aGUgYnJhbmNoIGF0IA0K
WzJdIGZvciBkaXNhYmxpbmcgdGhlIHBsYW5lLiBObyBhdG9taWNfdXBkYXRlIHRoZW4uIElm
IHRoZSBwbGFuZSBoYXMgDQpiZWVuIGVuYWJsZWQsIHlvdSBzaG91bGQgdGFrZSB0aGUgYnJh
bmNoIGF0IFszXS4gV2l0aG91dCBiZWluZyBhYmxlIHRvIA0KbW92ZS9zY2FsZSB0aGUgcHJp
bWFyeSBwbGFuZSwgSSBkb24ndCBzZWUgaG93IHBsYW5lX3N0YXRlLT52aXNpYmxlIGNvdWxk
IA0KYmUgZmFsc2UgaGVyZS4gUmlnaHQ/DQoNCkFGQUlLVCB0aGVyZSBzaG91bGQgbm90IGJl
IGEgTlVMTC1kZXJlZiBoZXJlLiBDYW4geW91IGRvIGEgdGVzdD8NCg0KWzJdIA0KaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNS9zb3VyY2UvZHJpdmVycy9ncHUvZHJt
L2RybV9hdG9taWNfaGVscGVyLmMjTDI3NDUNClszXSANCmh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y2LjUvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hl
bHBlci5jI0wyNzU1DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEkgaGF2ZW4n
dCB0ZXN0ZWQgeW91ciBwYXRjaCB5ZXQgdGhvdWdoLCBzbyBtYXliZSBJJ20gd3JvbmcgYWJv
dXQgdGhpcy4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJh
bmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90
ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhS
QiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------dMLIwN1ZbxTs157Ebu2l1N8s--

--------------qC5wYuLJaN81Kmifvf89ep1n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUepA8FAwAAAAAACgkQlh/E3EQov+Bz
zhAAjyWU7s4LCb6y4lXhItreak7doYTsXOqaYqBwfihfUnYmmTZmLYGZVCRlWbNHeeBC+ZS/eFmk
+QOV4iu9PuojUohEZcOugoYzFyG6k8joRpHWW036sfE1oNoQyStpBat1RTVJv+Zqqoek767Ym+rk
GrPD1QV52p8az5+lA8m0ywXlr8usJusJzGzEXlK8R1Cq99s6irNGltrk2kxRrwoCDpue6XfFnFnB
benSCVawvt7XmRGbNdEI7OsFiuzo5871pBRN0WAE/75hAK1PdBS4q7iIipdSW1we8+DgdOpNIkIc
9jypqKaMTHFlMrXbmwKBp6i0vZwE+FejUc/mBmxWYg945wxaX23pR3t1AZDwzjLiDiTsVu0xjksx
VnW6NWL00p+qy9a0My/A9/7gaIXnjgGgOs1lCjHrhWDXh06/4nsy6s4mDQt4tzX3IqLXFBA0xd65
LM+HzHsVePGKgLNAA+cGUd0CgRt9vboDUzlrbd6zIcQfnl4vJlci25xFiYBn+0jj3rURJgc8daDj
rOEgDFDNsjPly0NwjkX/IyVTmVKjSyOxw1neWIOm8VpvI/HkB4QmfSDYptnSn+o4ZP5dEE1cVtel
H81W0M+EmGtDuq/smhXDkMpooBVVWo/JdDP41FF3kciOU5IsU8r0loXdUSUkVkoEEPaVVB7359UL
DSE=
=Dvvy
-----END PGP SIGNATURE-----

--------------qC5wYuLJaN81Kmifvf89ep1n--
