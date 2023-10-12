Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A977C6687
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 09:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D06110E431;
	Thu, 12 Oct 2023 07:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3993C10E431
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 07:39:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D46A2184F;
 Thu, 12 Oct 2023 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697096394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uF/oRSFrjCSMfceJHBi4BsTZ2QN8q7wjy9rTsttb/AA=;
 b=lAJVEPhL5y5wD66lUogGRaX9Q24vAWOBy/yryA/3+DzT47HY5uxi3eL6x+fJux2cqDhApp
 5PsRpQ8FbAECnD+hUhlc0Lj190bhKrNdwS0OdN5kPl1cK9SJxMyk3pZ/t+eTzYuc+tLzNb
 UhFjbFvbUbOlIDIdJ9RJQaAvEq6vmoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697096394;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uF/oRSFrjCSMfceJHBi4BsTZ2QN8q7wjy9rTsttb/AA=;
 b=EyZ3uQR/GE6gEsyo2qLITfHI+1cfUN+KpwpdbJkhEbxSMEvH44UrZgS7Hl1f0luUZR3+PD
 dijm1y7ZS6LspbDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EFB2139ED;
 Thu, 12 Oct 2023 07:39:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id imsfAsqiJ2W8MQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Oct 2023 07:39:54 +0000
Message-ID: <e6593ea5-daa1-466a-9d42-0c1872f41a13@suse.de>
Date: Thu, 12 Oct 2023 09:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/ssd130x: Add a per controller family functions
 table
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-3-javierm@redhat.com>
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
In-Reply-To: <20231012065822.1007930-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Tq4YXa8904g0zRdoumViHhKR"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -9.09
X-Spamd-Result: default: False [-9.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; BAYES_HAM(-0.00)[40.68%];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[7]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,linux-m68k.org,gmail.com]
X-Spam-Flag: NO
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
Cc: Peter Robinson <pbrobinson@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Tq4YXa8904g0zRdoumViHhKR
Content-Type: multipart/mixed; boundary="------------63JonpT484ZcFFv0z0pIcAQc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>,
 Peter Robinson <pbrobinson@gmail.com>
Message-ID: <e6593ea5-daa1-466a-9d42-0c1872f41a13@suse.de>
Subject: Re: [PATCH v2 2/6] drm/ssd130x: Add a per controller family functions
 table
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-3-javierm@redhat.com>
In-Reply-To: <20231012065822.1007930-3-javierm@redhat.com>

--------------63JonpT484ZcFFv0z0pIcAQc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDEyLjEwLjIzIHVtIDA4OjU4IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KWy4uLl0NCj4gICANCj4gK3N0cnVjdCBzc2QxMzB4X2Z1bmNzIHsN
Cj4gKwlpbnQgKCppbml0KShzdHJ1Y3Qgc3NkMTMweF9kZXZpY2UgKnNzZDEzMHgpOw0KPiAr
CWludCAoKnNldF9idWZmZXJfc2l6ZXMpKHN0cnVjdCBzc2QxMzB4X2RldmljZSAqc3NkMTMw
eCk7DQo+ICsJdm9pZCAoKmFsaWduX3JlY3QpKHN0cnVjdCBzc2QxMzB4X2RldmljZSAqc3Nk
MTMweCwgc3RydWN0IGRybV9yZWN0ICpyZWN0KTsNCj4gKwlpbnQgKCp1cGRhdGVfcmVjdCko
c3RydWN0IHNzZDEzMHhfZGV2aWNlICpzc2QxMzB4LCBzdHJ1Y3QgZHJtX3JlY3QgKnJlY3Qs
DQo+ICsJCQkgICB1OCAqYnVmLCB1OCAqZGF0YV9hcnJheSk7DQo+ICsJdm9pZCAoKmNsZWFy
X3NjcmVlbikoc3RydWN0IHNzZDEzMHhfZGV2aWNlICpzc2QxMzB4LA0KPiArCQkJICAgICB1
OCAqZGF0YV9hcnJheSk7DQo+ICsJdm9pZCAoKmZtdF9jb252ZXJ0KShzdHJ1Y3QgaW9zeXNf
bWFwICpkc3QsIGNvbnN0IHVuc2lnbmVkIGludCAqZHN0X3BpdGNoLA0KPiArCQkJICAgIGNv
bnN0IHN0cnVjdCBpb3N5c19tYXAgKnNyYywgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqZmIsDQo+ICsJCQkgICAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsNCj4gK307
DQo+ICsNCg0KWW91IGFyZSByZWludmVudGluZyBEUk0ncyBhdG9taWMgaGVscGVycy4gSSBz
dHJvbmdseSBhZHZpc2VkIGFnYWluc3QgDQpkb2luZyB0aGF0LCBhcyBpdCBvZnRlbiB0dXJu
cyBvdXQgYmFkLiBNYXliZSBzZWUgbXkgcmFudCBhdCBbMV0gd3J0IHRvIA0KYW5vdGhlciBk
cml2ZXIuDQoNCkl0J3MgbXVjaCBiZXR0ZXIgdG8gY3JlYXRlIGEgc2VwYXJhdGUgbW9kZS1z
ZXR0aW5nIHBpcGVsaW5lIGZvciB0aGUgDQpzc2QxMzJ4IHNlcmllcyBhbmQgc2hhcmUgdGhl
IGNvbW1vbiBjb2RlIGFtb25nIHBpcGVsaW5lcy4gWW91ciBkcml2ZXIgDQp3aWxsIGhhdmUg
YSBjbGVhbiBhbmQgcmVhZGFibGUgaW1wbGVtZW50YXRpb24gZm9yIGVhY2ggc3VwcG9ydGVk
IA0KY2hpcHNldC4gQ29tcGFyZSBhbiBvbGQgdmVyc2lvbiBvZiBtZ2FnMjAwIFsyXSB3aXRo
IHRoZSBjdXJyZW50IGRyaXZlciANCnRvIHNlZSB0aGUgZGlmZmVyZW5jZS4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRl
dmVsLzA3Y2M4OWE1LTUyMDAtNzJlNi1mMDc4LTY5NGM1ODIwYTk5YUBzdXNlLmRlLw0KWzJd
IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjUvc291cmNlL2RyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwDQoNCg0KPiAgIGV4dGVybiBjb25zdCBzdHJ1Y3Qgc3NkMTMweF9k
ZXZpY2VpbmZvIHNzZDEzMHhfdmFyaWFudHNbXTsNCj4gICANCj4gICBzdHJ1Y3Qgc3NkMTMw
eF9kZXZpY2UgKnNzZDEzMHhfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcmVn
bWFwICpyZWdtYXApOw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZy
YW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRv
dGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpI
UkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------63JonpT484ZcFFv0z0pIcAQc--

--------------Tq4YXa8904g0zRdoumViHhKR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUnoskFAwAAAAAACgkQlh/E3EQov+BI
BA/+IhgwcjgtdeP7xc4IsyNm0XOFJIp3kYaWNGWXeD/EZlJSCKk9xwwutubdonj50X20yj6NuT7M
e01EmolrqMu6vaHDSQ42h0KU6K5vT573JADO6/pTb3Zmfeg/Pa+v5+kUTQXplUKc+bnm09H3Lwef
dI1TF8yNDfhM/JetP6jixWoMeK7wdnEvFkGoaZLj6jKlySuJXcKd2XD/S8GB4napqxRUP35C/Qyu
5AuYtOSUUHoEPyY9F3B5o2o0KRfmmT9d5MsfNGTy2Kl9UtyVnbNr83+zVdPoZ1B2Q3yzhwXAwMGi
dEVCKOKg5h0mL5x4v+3clBRX/mZ5OVPAQ28kVSsWJoCQDFIWh45QIzHxQTmeJsJuLz5hMctV1LQu
vI7LjdzOo1H3OpmiIXhqV55bO9Z+s30BWRpvcVDJy8PaN+4Gy67aEs81Y5PTlBGVNCefMdRCOxoa
bpGLjANPr5fMEWTTdmyzS5olJu+nEaOWJm23eLr9N5y29OJYDEjtzTVUC88uoVWOzlSw0OXrwFu3
4HQJ7qbH2fLmCVlTyeQkEz2qDSD0j4Orc0YNJP8Xr8wKtB9YSPKehv/LD0LufCbATtSqOIAaGgbV
GTyxAEn9kGhSkQuh7ChK5qGCmIdZ6EWoL7lhFZm8bTvt/s69CULG5k4N6XuV7r4Ayh2d4Ta7GNW4
M5I=
=S3R1
-----END PGP SIGNATURE-----

--------------Tq4YXa8904g0zRdoumViHhKR--
