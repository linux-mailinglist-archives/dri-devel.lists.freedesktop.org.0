Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6407C679D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D947C10E009;
	Thu, 12 Oct 2023 08:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F57910E009
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:36:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B23231F86C;
 Thu, 12 Oct 2023 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697099778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xFx278HO4jWhTf9NFENFXAJk6jA4TQn2rp1rSyORXnE=;
 b=GtJYjjWpCjuO4GJEJQbjSNRaLLH6sciXS0TwvEzsZvjNgyIi4TFdhgykuUVc7GKZxibXJE
 2WODwqcTFkt+wMBZ59X7dAGdpp8plcvN5YntRhlUogVTqB1W9GDaNsnSwt/coF4Bovxa+r
 yCjWcTASDPA6hEbm31vKgxaxmqHPluw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697099778;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xFx278HO4jWhTf9NFENFXAJk6jA4TQn2rp1rSyORXnE=;
 b=JLxcdz7HNnZpaJLnZ1CgBi/X6gKbA7nnYXokBbQK5CzPrcOljSw5wsykm6cXgdaC4idhVS
 IbzsbB+4NU9LAACA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C275139F9;
 Thu, 12 Oct 2023 08:36:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id blJBJQKwJ2VWUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Oct 2023 08:36:18 +0000
Message-ID: <61b17d9d-1984-4444-88ef-72b9552edeca@suse.de>
Date: Thu, 12 Oct 2023 10:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/simpledrm: Fix power domain device link validity check
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20231011143230.1107731-1-thierry.reding@gmail.com>
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
In-Reply-To: <20231011143230.1107731-1-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UT2X2EAtbTaInZfGAtW7TkqW"
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
--------------UT2X2EAtbTaInZfGAtW7TkqW
Content-Type: multipart/mixed; boundary="------------CyGPkoCGc1qOQPBKBRoercTQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <61b17d9d-1984-4444-88ef-72b9552edeca@suse.de>
Subject: Re: [PATCH] drm/simpledrm: Fix power domain device link validity
 check
References: <20231011143230.1107731-1-thierry.reding@gmail.com>
In-Reply-To: <20231011143230.1107731-1-thierry.reding@gmail.com>

--------------CyGPkoCGc1qOQPBKBRoercTQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTAuMjMgdW0gMTY6MzIgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IFdlIG5l
ZWQgdG8gY2hlY2sgaWYgYSBsaW5rIGlzIG5vbi1OVUxMIGJlZm9yZSB0cnlpbmcgdG8gZGVs
ZXRlIGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdA
bnZpZGlhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPg0KDQpJJ20gZ29pbmcgdG8gbWVyZ2UgdGhlIHBhdGNoIGludG8gZHJt
LW1pc2MtbmV4dCB3aXRoIHRoZSBhZGRpdGlvbmFsIA0KRml4ZXMgdGFnDQoNCkZpeGVzOiA2
MWRmOWNhMjMxMDcgKCJkcm0vc2ltcGxlZHJtOiBBZGQgc3VwcG9ydCBmb3IgbXVsdGlwbGUg
DQoicG93ZXItZG9tYWlucyIiKQ0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNCj4gLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAyICstDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPiBpbmRleCA5YzU5NzQ2MWQxZTIuLjhiZGFmNjYw
NDRmYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gQEAgLTUwNiw3
ICs1MDYsNyBAQCBzdGF0aWMgdm9pZCBzaW1wbGVkcm1fZGV2aWNlX2RldGFjaF9nZW5wZCh2
b2lkICpyZXMpDQo+ICAgCQlyZXR1cm47DQo+ICAgDQo+ICAgCWZvciAoaSA9IHNkZXYtPnB3
cl9kb21fY291bnQgLSAxOyBpID49IDA7IGktLSkgew0KPiAtCQlpZiAoIXNkZXYtPnB3cl9k
b21fbGlua3NbaV0pDQo+ICsJCWlmIChzZGV2LT5wd3JfZG9tX2xpbmtzW2ldKQ0KPiAgIAkJ
CWRldmljZV9saW5rX2RlbChzZGV2LT5wd3JfZG9tX2xpbmtzW2ldKTsNCj4gICAJCWlmICgh
SVNfRVJSX09SX05VTEwoc2Rldi0+cHdyX2RvbV9kZXZzW2ldKSkNCj4gICAJCQlkZXZfcG1f
ZG9tYWluX2RldGFjaChzZGV2LT5wd3JfZG9tX2RldnNbaV0sIHRydWUpOw0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEg
TnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJl
dyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykN
Cg==

--------------CyGPkoCGc1qOQPBKBRoercTQ--

--------------UT2X2EAtbTaInZfGAtW7TkqW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUnsAIFAwAAAAAACgkQlh/E3EQov+DD
Rw/+KuyHo2Lb5Fx1fTxhzYpYw4PMo40iF/Wpqfq/rPW6LO4EzYdHTUrs6oPS2lY6OM547e0XnPmH
dOXa9R2FqA1GoUYQimdja/lEPoQEJIdFikAyH+OOeyQ0yaBNW62xAp/UUll0fXxq3uws6VHv9cR3
ADYK3CMocYzi4Ng5398uhDJoZato00ZHQzb1Z+ZD0dTZ6lk7gwQBwJelRn7GEOuqp748D9EQBBR/
PdvVjEcFE5t1IgYhzShmV7WJcgVG1bHSNAQ+jNruKsxgefj95+MZ5MqBsZWhDOFxhP/pg4gtXjKn
j/twGmCfSAsnhZM6ddXn59YHrLPXCfQF48Gbejss2Q06ccWejSdb/TBZlcakdDNoxlo6g3Bhdwik
fWKhgp48wJOXnFfsBBuMiYSemKZ2wg+g+2z59TAv72ntIpLNJk0JahYkUTtyzh+wN4oYI+8CZB8r
Ck3NGf+tKH2+lnISp5M2v83Z2k4LgI/joIAtc9il3fXhj87CyeOelsOA2R0qMqM06dP6dVsfM9v6
OwP7LRLyV4lgnY5CpL/pQCeW6x/cyDPZ4RGu/UiDODFTgD5U8LV5gy8IrQkRwoSA5g5XHpi6vRZe
5R0RSTozSKfaH36vcMPQfFkRrhHDEe51K9g3bRZ9us4i51HtVhcDkguiQ8YqaZXIS1pHtlSMEorx
sK0=
=5xWD
-----END PGP SIGNATURE-----

--------------UT2X2EAtbTaInZfGAtW7TkqW--
