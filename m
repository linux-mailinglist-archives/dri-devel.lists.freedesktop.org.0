Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB8E7C4B9D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 09:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3C610E200;
	Wed, 11 Oct 2023 07:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA7510E200
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 07:19:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E8ED21860;
 Wed, 11 Oct 2023 07:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697008763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dt24z3e7RmTaeNEuZ+cTAZvxkgnUpTCDbZzPBNSTYwA=;
 b=bu0xvWF3EUsQAW9TCepFJM52ebBOlux0XeuZfLpIMPxNkyvUKnD2L1dLoQpz1z7VtTC1ke
 w+Fv3IIp4VsIT5bx0uS70ynApxYGgwXAPn2PwIk4M2NxpoAEFTy9UC/F+igbVrb6gfo829
 xFwcbdmETO0EJb04z6AL9skww7g4ncI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697008763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dt24z3e7RmTaeNEuZ+cTAZvxkgnUpTCDbZzPBNSTYwA=;
 b=rp/GjvV62tsDBV2/bcLhJPYccLW1sWff/EgsJU30F07MPPuRjiZbohk4z8P6WD3SmNYIaT
 mGy5dm+pvp6HhiCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02BBF134F5;
 Wed, 11 Oct 2023 07:19:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nU36N3pMJmUmegAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Oct 2023 07:19:22 +0000
Message-ID: <afdb69df-abcc-4dbb-91b0-638ddfd99cc0@suse.de>
Date: Wed, 11 Oct 2023 09:19:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/tiny: correctly print `struct resource *` on error
To: Joey Gouly <joey.gouly@arm.com>, dri-devel@lists.freedesktop.org
References: <20231010174652.2439513-1-joey.gouly@arm.com>
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
In-Reply-To: <20231010174652.2439513-1-joey.gouly@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NgQWvICxbM6UbRAVwCA0nM2G"
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
Cc: javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NgQWvICxbM6UbRAVwCA0nM2G
Content-Type: multipart/mixed; boundary="------------TplMxA0bEIfVKuDsn4w7QVwx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Joey Gouly <joey.gouly@arm.com>, dri-devel@lists.freedesktop.org
Cc: javierm@redhat.com
Message-ID: <afdb69df-abcc-4dbb-91b0-638ddfd99cc0@suse.de>
Subject: Re: [PATCH v1] drm/tiny: correctly print `struct resource *` on error
References: <20231010174652.2439513-1-joey.gouly@arm.com>
In-Reply-To: <20231010174652.2439513-1-joey.gouly@arm.com>

--------------TplMxA0bEIfVKuDsn4w7QVwx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEwLjEwLjIzIHVtIDE5OjQ2IHNjaHJpZWIgSm9leSBHb3VseToNCj4gVGhlIGBy
ZXNgIHZhcmlhYmxlIGlzIGFscmVhZHkgYSBgc3RydWN0IHJlc291cmNlICpgLCBkb24ndCB0
YWtlIHRoZSBhZGRyZXNzIG9mIGl0Lg0KPiANCj4gRml4ZXMgaW5jb3JyZWN0IG91dHB1dDoN
Cj4gDQo+IAlzaW1wbGUtZnJhbWVidWZmZXIgOWUyMGRjMDAwLmZyYW1lYnVmZmVyOiBbZHJt
XSAqRVJST1IqIGNvdWxkIG5vdCBhY3F1aXJlIG1lbW9yeSByYW5nZSBbPz8/IDB4ZmZmZjRi
ZTg4YTM4N2QwMC0weGZmZmZmZWZmZmRlMGEyNDAgZmxhZ3MgMHgwXTogLTE2DQo+IA0KPiBU
byBiZSBjb3JyZWN0Og0KPiANCj4gCXNpbXBsZS1mcmFtZWJ1ZmZlciA5ZTIwZGMwMDAuZnJh
bWVidWZmZXI6IFtkcm1dICpFUlJPUiogY291bGQgbm90IGFjcXVpcmUgbWVtb3J5IHJhbmdl
IFttZW0gMHg5ZTIwZGMwMDAtMHg5ZTMwN2JmZmYgZmxhZ3MgMHgyMDBdOiAtMTYNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEpvZXkgR291bHkgPGpvZXkuZ291bHlAYXJtLmNvbT4NCj4gQ2M6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogSmF2aWVy
IE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KVGhhbmtzIGZv
ciB0aGUgcGF0Y2guDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxl
ZHJtLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2lt
cGxlZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPiBpbmRleCBm
Zjg2YmExYWUxYjguLjhlYTEyMGViODY3NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2lt
cGxlZHJtLmMNCj4gQEAgLTc0NSw3ICs3NDUsNyBAQCBzdGF0aWMgc3RydWN0IHNpbXBsZWRy
bV9kZXZpY2UgKnNpbXBsZWRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1fZHJpdmVyICpk
cnYsDQo+ICAgDQo+ICAgCQlyZXQgPSBkZXZtX2FwZXJ0dXJlX2FjcXVpcmVfZnJvbV9maXJt
d2FyZShkZXYsIHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSk7DQo+ICAgCQlpZiAo
cmV0KSB7DQo+IC0JCQlkcm1fZXJyKGRldiwgImNvdWxkIG5vdCBhY3F1aXJlIG1lbW9yeSBy
YW5nZSAlcHI6ICVkXG4iLCAmcmVzLCByZXQpOw0KPiArCQkJZHJtX2VycihkZXYsICJjb3Vs
ZCBub3QgYWNxdWlyZSBtZW1vcnkgcmFuZ2UgJXByOiAlZFxuIiwgcmVzLCByZXQpOw0KPiAg
IAkJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+ICAgCQl9DQo+ICAgDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1j
RG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------TplMxA0bEIfVKuDsn4w7QVwx--

--------------NgQWvICxbM6UbRAVwCA0nM2G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUmTHoFAwAAAAAACgkQlh/E3EQov+BD
+hAAuTaaeQpP1HVEefBOxqxwh3nVHDl/71k/9Jtxge9Le9jvlwotBgg+NvbE2u8uC6fQujcQMIS2
bsq5sX7TmdmI0l6lfesiisJdMlL8aOJI2Iq3y1oXpJoj4JwsT1Hz8XuHVX2aILpX+H/DmILaf9U+
0UHWd6qacUFKaJaQlPeBjAdWrWWYUMlSs4SGu2/l5kho4aPYm+/qdWgl1ROML61IAhDv/+cUXtiB
6W307w7uiLB5adM6EzqlP2ewjzHgf+rk8KW/uiPUdnMo4k9SmxJuboadkVCqRi9pBTJYwqnxmzou
2z4SWSN6O6dlZ+rDm8ZLz8D2u9Qbh3pU00gJDi2s8g24WxvvZMlJMRSieyjvypHMFYILzeUBn3rt
k1yQW+rhpSdBDyETodyvJZeyhYvCjX2oZSdueu2RWhvE2/wt++Uw67pTREJ3KNyesNoJH/MFk7le
+YwTTe3FHNJVSflI82G/ZlxpZ6qZxDjvnNIwSmMMRqaIpQAsiEyEDc58lu39mWogwU5UEAZ5TK6g
yCK1T976JyS6PwTAV/IKZnBC++8j8SgspeSrIE1M3TrzTT7we9yKtUnqX6IIXg1nCcz8KAZiVG64
Pqbeodhe4knQJz5VrjdlwHDbt4D0gLxp0jeXNiuyBKtDw2FlehjMsqF+mVRROBcL4q9nkSGU4Vmr
IIY=
=GcJC
-----END PGP SIGNATURE-----

--------------NgQWvICxbM6UbRAVwCA0nM2G--
