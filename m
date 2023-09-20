Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211E17A7A73
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7EA10E179;
	Wed, 20 Sep 2023 11:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F6910E179
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:30:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 761811FDC2;
 Wed, 20 Sep 2023 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695209427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9ivdlzK5DQ1af3mnDFKb2JZLiwihtoZ+2zne03qKW6M=;
 b=VDeCfwV+yeuC8ltYYM1ws9aBou9HQO+0YxGlqaJaF0zbTe8dzBacFbT11KO9Xsu+V4KI7T
 oeIpZNAK6U7YxPe6y5amn1as4sS/huUkAlp6WH41g9RK3ORMvi64yP1lGPNgdYm8NetyH8
 xJwBvv3ALRZTwjkyUfLR2NcdbogtjNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695209427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9ivdlzK5DQ1af3mnDFKb2JZLiwihtoZ+2zne03qKW6M=;
 b=rCl36co9Gmqok7j+BKnGBLGjtJJIdluveunFEks9QfrTSgcwFPrAxu9p2rSMPHFBTvAS38
 tRLnPZVj+xLQ9qCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EE511333E;
 Wed, 20 Sep 2023 11:30:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id phtkDtPXCmVMOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 11:30:27 +0000
Message-ID: <e726bb94-1722-422b-8d55-d01661274be3@suse.de>
Date: Wed, 20 Sep 2023 13:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/ssd130x: Preallocate xfrm buffer in plane's
 atomic_check
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
References: <20230920112508.11770-1-tzimmermann@suse.de>
 <20230920112508.11770-9-tzimmermann@suse.de>
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
In-Reply-To: <20230920112508.11770-9-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------joeAbDg5B2VDzRMn72i0RH6d"
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
--------------joeAbDg5B2VDzRMn72i0RH6d
Content-Type: multipart/mixed; boundary="------------rKGdpznHVSzftcoZ1md1LT3D";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <e726bb94-1722-422b-8d55-d01661274be3@suse.de>
Subject: Re: [PATCH 8/8] drm/ssd130x: Preallocate xfrm buffer in plane's
 atomic_check
References: <20230920112508.11770-1-tzimmermann@suse.de>
 <20230920112508.11770-9-tzimmermann@suse.de>
In-Reply-To: <20230920112508.11770-9-tzimmermann@suse.de>

--------------rKGdpznHVSzftcoZ1md1LT3D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIwLjA5LjIzIHVtIDEzOjEwIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQpb
Li4uXQ0KPiAgIAlpZiAoIWZpKQ0KPiBAQCAtNjE5LDYgKzYyOSwxNSBAQCBzdGF0aWMgaW50
IHNzZDEzMHhfcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lLA0KPiAgIA0KPiAgIAlwaXRjaCA9IGRybV9mb3JtYXRfaW5mb19taW5f
cGl0Y2goZmksIDAsIHNzZDEzMHgtPndpZHRoKTsNCj4gICANCj4gKwlpZiAobmV3X3BsYW5l
X3N0YXRlLT5mYi0+Zm9ybWF0ICE9IGZpKSB7DQo+ICsJCXZvaWQgKmJ1ZjsNCj4gKw0KPiAr
CQkvKiBmb3JtYXQgY29udmVyc2lvbiBuZWNlc3Nhcnk7IHJlc2VydmUgYnVmZmVyICovDQo+
ICsJCWJ1ZiA9IGRybV94ZnJtX2J1Zl9yZXNlcnZlKCZzc2QxMzB4LT54ZnJtLCBwaXRjaCwg
R0ZQX0tFUk5FTCk7DQo+ICsJCWlmICghYnVmKQ0KPiArCQkJcmV0dXJuIC1FTk9NRU07DQo+
ICsJfQ0KDQpHcnJyISBSaWdodCBpbiB0aGUgbW9tZW50IEkgc2VudCB0aGlzIHBhdGNoLCBJ
IHJlYWxpemVkIHRoYXQgdGhpcyBjb2RlIA0Kd291bGQgcnVuIGNvbmN1cnJlbnRseSB3aXRo
IGF0b21pY191cGRhdGUuIEhlbmNlLCBpdCBjYW5ub3QgcmVhbGxvYyB0aGUgDQp0ZW1wb3Jh
cnkgYnVmZmVyLg0KDQpJIHRoaW5rIGRyaXZlcnMgY291bGQgYWxzbyBwcmUtYWxsb2NhdGUg
aW4gdGhlIGRldmljZSdzIHByb2JlIGZ1bmN0aW9uIA0KYWZ0ZXIgY2FsbGluZyBkcm1tX3hm
cm1fYnVmX2luaXQoKS4gSXQncyBqdXN0IGVub3VnaCBtZW1vcnkgZm9yIGEgc2luZ2xlIA0K
c2NhbmxpbmUuDQoNCg0KPiArDQo+ICAgCXNzZDEzMHhfc3RhdGUtPmJ1ZmZlciA9IGtjYWxs
b2MocGl0Y2gsIHNzZDEzMHgtPmhlaWdodCwgR0ZQX0tFUk5FTCk7DQo+ICAgCWlmICghc3Nk
MTMweF9zdGF0ZS0+YnVmZmVyKQ0KPiAgIAkJcmV0dXJuIC1FTk9NRU07DQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------rKGdpznHVSzftcoZ1md1LT3D--

--------------joeAbDg5B2VDzRMn72i0RH6d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUK19IFAwAAAAAACgkQlh/E3EQov+AR
rBAAv6qmGfevH6iqcGdViKcqfrsjiv+3nQrEQL/Tvdq2KGB3t2L8LlhV6hmORmQAgkLuaX4V9UxQ
+27OsguY3nfaFF5v3BIX8Ma8UITCD5xBY3bLcw2rU1qJCpbPKbiW2xRaNwlqx6JpptkC6I84iEso
3U3U/KhZVqTTqdZ9F3sZkIphqXwACgc5iVzHzAORV+BL1xEWUY7L/xp+WnLqy39GV4MS1Ej/x8O7
ZAMzEAGQa/KxurPU++ksGd6pnLzPBxH53VuJIjY2nY2dUkv1Rk4pMhfSoPvr8d7DYb9Y5zXsp50J
OnnN99ucN2/K86T9M7On4wxutV92coiqHmVOcrE/kN4ctureNvqd/xn6FHB27jyJtP/GHwvZrVSt
6GzfyoD9Q8Jx1J55/T0dvAjCLWbd9V4zFfmjG1ZybV3n0q1l7msKey9w+db4Xozw2DNcK/iWeRXc
RHT8x6OryrZiEVatGAP/WLOH1A0avtpqLcdsJqTJKQxEFcWzLwCBAlVbmc0BdWxCwC/KbfX7WVh/
aZcAGvbxCmU274UoEAx9OOFt/SF8rRmIKaopuAP2G7c5oAPxmE+TQKcKE2ktXIvJDvm7AJvfjp1F
fuPfXSQK10FEi7mtOcfOvH5r21ML9VnKuXwER0NN2147JePBk7Jq+h5pInSqZC8iOq9gDUaSOkU+
0is=
=Obf5
-----END PGP SIGNATURE-----

--------------joeAbDg5B2VDzRMn72i0RH6d--
