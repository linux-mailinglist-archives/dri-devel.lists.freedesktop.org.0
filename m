Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52167B176B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 11:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4A510E0CF;
	Thu, 28 Sep 2023 09:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B08F10E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 09:33:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 26F5D1F895;
 Thu, 28 Sep 2023 09:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695893595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nXI1rnYxBsGF6UDgilwbjpigq2xUzvakVbI1jUa8tf8=;
 b=IWgBf9XtLJXof5CJtvFB8EkbyOIvm00Wzvr6o/M6FIOzBV1TOCg+7rvhu4zLTqPyoRa8Ub
 ULbChJ+N/+IX74fAsb66lpsEfeXfNvoZmzrBkzyFcDm19V2kw/2xgkC4pNfPfyp7tWW/28
 T9m6byCbRo9+HmGpXvapHy9zT4GbLYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695893595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nXI1rnYxBsGF6UDgilwbjpigq2xUzvakVbI1jUa8tf8=;
 b=dENXpIRda6oODH/gATq91QsX1W6xszcSThZj1/r+q0FdcCTyP0C9lUjEYQXqf4RZu+mUKD
 phPYm3Ab2HVX3dCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE7D613581;
 Thu, 28 Sep 2023 09:33:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mk08NVpIFWUdcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Sep 2023 09:33:14 +0000
Message-ID: <330a87cf-45d3-4a2f-ae51-1fecb359b3c0@suse.de>
Date: Thu, 28 Sep 2023 11:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/simpledrm: Add drm_panic support
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
References: <20230927172849.193996-1-jfalempe@redhat.com>
 <20230927172849.193996-4-jfalempe@redhat.com>
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
In-Reply-To: <20230927172849.193996-4-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CjEhszWV6ZwdFOkbTOlPue9e"
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
--------------CjEhszWV6ZwdFOkbTOlPue9e
Content-Type: multipart/mixed; boundary="------------2PuHMT96KQoLM4JOObF4fbzS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
Cc: gpiccoli@igalia.com
Message-ID: <330a87cf-45d3-4a2f-ae51-1fecb359b3c0@suse.de>
Subject: Re: [PATCH v3 3/3] drm/simpledrm: Add drm_panic support
References: <20230927172849.193996-1-jfalempe@redhat.com>
 <20230927172849.193996-4-jfalempe@redhat.com>
In-Reply-To: <20230927172849.193996-4-jfalempe@redhat.com>

--------------2PuHMT96KQoLM4JOObF4fbzS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDkuMjMgdW0gMTk6MjIgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IEFkZCBzdXBwb3J0IGZvciB0aGUgZHJtX3BhbmljIG1vZHVsZSwgd2hpY2ggZGlzcGxheXMg
YSB1c2VyLWZyaWVuZGx5DQo+IG1lc3NhZ2UgdG8gdGhlIHNjcmVlbiB3aGVuIGEga2VybmVs
IHBhbmljIG9jY3Vycy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvY2VseW4gRmFsZW1wZSA8
amZhbGVtcGVAcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkv
c2ltcGxlZHJtLmMgfCAxNyArKysrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxNyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3Rpbnkvc2ltcGxlZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0K
PiBpbmRleCAyNWUxMWVmMTFjNGMuLmYwNDU0YjU4ZWFkMyAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3Rpbnkvc2ltcGxlZHJtLmMNCj4gQEAgLTIzLDYgKzIzLDcgQEANCj4gICAjaW5jbHVkZSA8
ZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fbWFu
YWdlZC5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMu
aD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX3BhbmljLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9k
cm1fcGxhbmVfaGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVy
Lmg+DQo+ICAgDQo+IEBAIC04MzgsMTAgKzgzOSwyNCBAQCBzdGF0aWMgc3RydWN0IHNpbXBs
ZWRybV9kZXZpY2UgKnNpbXBsZWRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1fZHJpdmVy
ICpkcnYsDQo+ICAgCQlyZXR1cm4gRVJSX1BUUihyZXQpOw0KPiAgIA0KPiAgIAlkcm1fbW9k
ZV9jb25maWdfcmVzZXQoZGV2KTsNCj4gKwlkcm1fcGFuaWNfcmVnaXN0ZXIoZGV2KTsNCg0K
VGhlc2UgY2FsbHMgc2hvdWxkIGJlIHBhcnQgb2YgZHJtX2RldmljZV9yZWdpc3RlcigpLiBF
dmVyeXRoaW5nIHNob3VsZCANCndvcmsgdHJhbnNwYXJlbnRseSB0byB0aGUgZHJpdmVyIHVu
dGlsIERSTSBwYW5pYyBhY3R1YWxseSBjYWxscyB0aGUgDQpnZXRfc2Nhbm91dF9idWZmZXIg
Y2FsbGJhY2suDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICANCj4gICAJcmV0dXJu
IHNkZXY7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGludCBzaW1wbGVkcm1fZ2V0X3NjYW5v
dXRfYnVmZmVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICsJCQkJCXN0cnVjdCBkcm1f
c2Nhbm91dF9idWZmZXIgKnNiKQ0KPiArew0KPiArCXN0cnVjdCBzaW1wbGVkcm1fZGV2aWNl
ICpzZGV2ID0gc2ltcGxlZHJtX2RldmljZV9vZl9kZXYoZGV2KTsNCj4gKw0KPiArCXNiLT53
aWR0aCA9IHNkZXYtPm1vZGUuaGRpc3BsYXk7DQo+ICsJc2ItPmhlaWdodCA9IHNkZXYtPm1v
ZGUudmRpc3BsYXk7DQo+ICsJc2ItPnBpdGNoID0gc2Rldi0+cGl0Y2g7DQo+ICsJc2ItPmZv
cm1hdCA9IHNkZXYtPmZvcm1hdDsNCj4gKwlzYi0+bWFwID0gc2Rldi0+c2NyZWVuX2Jhc2U7
DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gICAvKg0KPiAgICAqIERSTSBkcml2ZXIN
Cj4gICAgKi8NCj4gQEAgLTg1Nyw2ICs4NzIsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2
ZXIgc2ltcGxlZHJtX2RyaXZlciA9IHsNCj4gICAJLm1pbm9yCQkJPSBEUklWRVJfTUlOT1Is
DQo+ICAgCS5kcml2ZXJfZmVhdHVyZXMJPSBEUklWRVJfQVRPTUlDIHwgRFJJVkVSX0dFTSB8
IERSSVZFUl9NT0RFU0VULA0KPiAgIAkuZm9wcwkJCT0gJnNpbXBsZWRybV9mb3BzLA0KPiAr
CS5nZXRfc2Nhbm91dF9idWZmZXIJPSBzaW1wbGVkcm1fZ2V0X3NjYW5vdXRfYnVmZmVyLA0K
PiAgIH07DQo+ICAgDQo+ICAgLyoNCj4gQEAgLTg5NCw2ICs5MTAsNyBAQCBzdGF0aWMgaW50
IHNpbXBsZWRybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAJ
c3RydWN0IGRybV9kZXZpY2UgKmRldiA9ICZzZGV2LT5kZXY7DQo+ICAgDQo+ICAgCWRybV9k
ZXZfdW5wbHVnKGRldik7DQo+ICsJZHJtX3BhbmljX3VucmVnaXN0ZXIoZGV2KTsNCj4gICAN
Cj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpH
RjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBN
b2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------2PuHMT96KQoLM4JOObF4fbzS--

--------------CjEhszWV6ZwdFOkbTOlPue9e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUVSFoFAwAAAAAACgkQlh/E3EQov+Dr
Ug//U6CrQ7xbUSUid1OxDKxBvaQKlIT3iPfEhLrb87YHbagydEp15aSP/f2yIDnqHlAInrjDyL97
S84YCtipnbNnuypQnS+H5HdU/m9a/f6gWYkfFpkxTQKmx0ibT4LeYhIv0M8zppess8HHdiTwyYhs
sYIW7PXMb3kAcOwZZyb4g4nWCYIheyk8OmJ6z7vFCcyEuhhnZSJJ+1qAH4EzKtsjjnLGVo3gmUQj
1gF8u9Gxb3GT/zW0NEE87sICTZ/lLazzZvBSA5mBzUkyWs068fSbvjiCF1us04xRSVYqNiEfcrli
P1qU54Eph+hQHuFLDlU0AMXI8J/gtLa/yHB1/svsrShmjqV0pCQ0z3QcdsgDBYea0YeTyH9IfHcd
mRR7HWDvVT5CZsDyp/p6NVxtzv0JkKeHUPHwh2Ndmrh8GAnZkWLiPUbv4pScWbLLONWl/EdW/xwk
UdpQemnW/+3rH2iDX1iyZgfoBpMw8z0dZSInPEK0Dv/wMdK6GrlcJKNFVBkUw7KUGWUUOl0b3aPX
D856TAkefGh6qXg25OnKu/zIkGfoKcZ8zWVwS+nWAbNFuxg2tjuDUN2WoUiltuQlBnrzYVGIfOFu
9GkaFwCQZfHIZsyv4ReHBB2oVqZ0i51BjrT6g1gIsLC9nPGQl31MgjHOUc4WbFRqg6JYH04fhCMd
D/Q=
=aTJw
-----END PGP SIGNATURE-----

--------------CjEhszWV6ZwdFOkbTOlPue9e--
