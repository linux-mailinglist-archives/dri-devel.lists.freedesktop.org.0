Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6753A7BF735
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 11:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08CB10E0BE;
	Tue, 10 Oct 2023 09:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD8A10E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 09:23:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E085D211F0;
 Tue, 10 Oct 2023 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696929787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SYtLDcVGHg0ypZQ9wupBYDZX3/NuUh7mP6QnXMwwGXQ=;
 b=Xw8kA6si6tdWHwn/1yFraZolCDPl97KhZngFBt+USr/u5grgXQKEUrzsCp32UDg5/GisvY
 JyuT/A/Vy6jR2kiOjDph9VVSry08YTV9O+j4MYUjDWQ4zI1NGpjx5eoo29KF4OOPVhouqR
 Lak7/mO3cTIxJV0O9gcok0/f3z+nk/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696929787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SYtLDcVGHg0ypZQ9wupBYDZX3/NuUh7mP6QnXMwwGXQ=;
 b=MxTP4gsQwqCSpu6qqe7eHXdcHneS/1aPo5UfVu94eaNT+H5t8Atlyxc2p1ANhbohBFbZ+k
 GnlTwFdlhE20XJBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFAC51358F;
 Tue, 10 Oct 2023 09:23:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mx7OKfsXJWVveQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Oct 2023 09:23:07 +0000
Message-ID: <b96f25e9-0b10-4f01-8e0a-876e1ced4ee4@suse.de>
Date: Tue, 10 Oct 2023 11:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/mgag200: Add drm_panic support
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-5-jfalempe@redhat.com>
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
In-Reply-To: <20231003142508.190246-5-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i6nGaG6Soz1A8D4e1jxHqTv6"
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
Cc: gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------i6nGaG6Soz1A8D4e1jxHqTv6
Content-Type: multipart/mixed; boundary="------------LpluQHwdpugVR01ZXmebVETK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
Cc: gpiccoli@igalia.com
Message-ID: <b96f25e9-0b10-4f01-8e0a-876e1ced4ee4@suse.de>
Subject: Re: [PATCH v4 4/4] drm/mgag200: Add drm_panic support
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-5-jfalempe@redhat.com>
In-Reply-To: <20231003142508.190246-5-jfalempe@redhat.com>

--------------LpluQHwdpugVR01ZXmebVETK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMTAuMjMgdW0gMTY6MjIgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IEFkZCBzdXBwb3J0IGZvciB0aGUgZHJtX3BhbmljIG1vZHVsZSwgd2hpY2ggZGlzcGxheXMg
YSBtZXNzYWdlIHRvDQo+IHRoZSBzY3JlZW4gd2hlbiBhIGtlcm5lbCBwYW5pYyBvY2N1cnMu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhh
dC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2
LmMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwg
MjQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAw
X2Rydi5jDQo+IGluZGV4IDk3NmYwYWIyMDA2Yi4uMjI5ZDljMTE2YjQyIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMNCj4gQEAgLTEyLDEwICsxMiwx
MiBAQA0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2FwZXJ0dXJlLmg+DQo+ICAgI2luY2x1ZGUg
PGRybS9kcm1fZHJ2Lmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fZmJkZXZfZ2VuZXJpYy5o
Pg0KPiArI2luY2x1ZGUgPGRybS9kcm1fZnJhbWVidWZmZXIuaD4NCj4gICAjaW5jbHVkZSA8
ZHJtL2RybV9maWxlLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1faW9jdGwuaD4NCj4gICAj
aW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fbW9k
dWxlLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wYW5pYy5oPg0KPiAgICNpbmNsdWRlIDxk
cm0vZHJtX3BjaWlkcy5oPg0KPiAgIA0KPiAgICNpbmNsdWRlICJtZ2FnMjAwX2Rydi5oIg0K
PiBAQCAtODMsNiArODUsMjcgQEAgcmVzb3VyY2Vfc2l6ZV90IG1nYWcyMDBfcHJvYmVfdnJh
bSh2b2lkIF9faW9tZW0gKm1lbSwgcmVzb3VyY2Vfc2l6ZV90IHNpemUpDQo+ICAgCXJldHVy
biBvZmZzZXQgLSA2NTUzNjsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW50IG1nYWcyMDBf
Z2V0X3NjYW5vdXRfYnVmZmVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICsJCQkJICAg
ICAgc3RydWN0IGRybV9zY2Fub3V0X2J1ZmZlciAqc2IpDQo+ICt7DQo+ICsJc3RydWN0IGRy
bV9wbGFuZSAqcGxhbmU7DQo+ICsJc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYgPSB0b19tZ2Ff
ZGV2aWNlKGRldik7DQo+ICsJc3RydWN0IGlvc3lzX21hcCBtYXAgPSBJT1NZU19NQVBfSU5J
VF9WQUREUl9JT01FTShtZGV2LT52cmFtKTsNCj4gKw0KPiArCS8qIG1nYWcyMDAgaGFzIG9u
bHkgb25lIHBsYW5lICovDQo+ICsJZHJtX2Zvcl9lYWNoX3BsYW5lKHBsYW5lLCBkZXYpIHsN
Cj4gKwkJaWYgKCFwbGFuZS0+c3RhdGUgfHwgIXBsYW5lLT5zdGF0ZS0+ZmIpDQoNCkJldHRl
ciB0ZXN0IGZvciBwbGFuZS0+c3RhdGUtPnZpc2libGUuIFlvdSBzaG91bGQgYWxzbyBjaGVj
ayBpZiBpdCdzIGEgDQpwcmltYXJ5IHBsYW5lLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+ICsJCQlyZXR1cm4gLUVOT0RFVjsNCj4gKwkJc2ItPmZvcm1hdCA9IHBsYW5lLT5zdGF0
ZS0+ZmItPmZvcm1hdDsNCj4gKwkJc2ItPndpZHRoID0gcGxhbmUtPnN0YXRlLT5mYi0+d2lk
dGg7DQo+ICsJCXNiLT5oZWlnaHQgPSBwbGFuZS0+c3RhdGUtPmZiLT5oZWlnaHQ7DQo+ICsJ
CXNiLT5waXRjaCA9IHBsYW5lLT5zdGF0ZS0+ZmItPnBpdGNoZXNbMF07DQo+ICsJCXNiLT5t
YXAgPSBtYXA7DQo+ICsJCXJldHVybiAwOw0KPiArCX0NCj4gKwlyZXR1cm4gLUVOT0RFVjsN
Cj4gK30NCj4gKw0KPiAgIC8qDQo+ICAgICogRFJNIGRyaXZlcg0KPiAgICAqLw0KPiBAQCAt
OTgsNiArMTIxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyIG1nYWcyMDBf
ZHJpdmVyID0gew0KPiAgIAkubWFqb3IgPSBEUklWRVJfTUFKT1IsDQo+ICAgCS5taW5vciA9
IERSSVZFUl9NSU5PUiwNCj4gICAJLnBhdGNobGV2ZWwgPSBEUklWRVJfUEFUQ0hMRVZFTCwN
Cj4gKwkuZ2V0X3NjYW5vdXRfYnVmZmVyID0gbWdhZzIwMF9nZXRfc2Nhbm91dF9idWZmZXIs
DQo+ICAgCURSTV9HRU1fU0hNRU1fRFJJVkVSX09QUywNCj4gICB9Ow0KPiAgIA0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0
NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFu
ZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVy
ZykNCg==

--------------LpluQHwdpugVR01ZXmebVETK--

--------------i6nGaG6Soz1A8D4e1jxHqTv6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUlF/sFAwAAAAAACgkQlh/E3EQov+C/
3w/+MtLEpVH7EgTFHl12zGQ99sdzp58Y3Y+wS7ajRcl1r+eyB47k7+pxnnM4kvgt0RKfjtrfbZA5
sxL2GhcOnxsZrzo2tN62cjt4IBVn8/KjLm0e99nPl7s+1Utb49fZb3qqqf5ebS5XXOmEMaZpE8GD
LbdBhdVkf6DHDy4/wjRa444DtHF+5bffR+Prpp3Cqpk/LC/8UBFY81TxmlpWEgkXonvXGiIur5Mn
YU+8tTM0D2P6XfcZVkcIGhwfHusXM+Hyew499BjDAKQ5eBHZvVusUCPLIoaaFJ0v/xMkS+4wz0IP
RmnLddybwDT0lcuin2+jtbqxmNmpsILTlmNVJrLBLSN1v6J5ekKRtXbjtZmxh+l8QBfeKQYLgGgU
oIgXSdH2eLztQggck+Hrtvqi4YqQVQrwcMgJ3b4Z9MjWJctZKnJU6BEEfPEPKaZ/8I4MuPHe9h4/
IHJTJpsezx5+ZL0Ih0+0t0GuHFp85onhijoUuVGo9BVlcjnkJZI7jwGfLDPuKjNg4pF5EVxB98Jh
uzmIQ5nbx+aS6krc8sf9dnGoH5qfHQ4HHPdwoamRNhzCy5rZt2OLh3NVrIqH2quQpUGuCkOvf6wQ
WWtGIJajTMVEo9Cabv9vSZyiBpsoj1PYt3abRRshT/xdkwHkpgkiZSFIDSXtknZ+S7tOUJ0z0h/a
RBU=
=EFzP
-----END PGP SIGNATURE-----

--------------i6nGaG6Soz1A8D4e1jxHqTv6--
