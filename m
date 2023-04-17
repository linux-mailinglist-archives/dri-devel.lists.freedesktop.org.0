Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC1E6E4257
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 10:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE3E10E12B;
	Mon, 17 Apr 2023 08:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B424210E12B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 08:16:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4EB311F381;
 Mon, 17 Apr 2023 08:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681719360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q5nmUpgvCQ0u2MP+TI3hAO45vlI9kSGcrKDYAZgJlps=;
 b=SfAPvxwpn9wO/zRDhf6Ag2dJdAJX4S3igCp6leYs8904j6yk6+639LBC/CsNvA++RG4+cw
 hue8Ci10SY4SpJrqrCIbaRv6Am6LbgfXfLwHRfG4HILN3JAHp6kbtIZ4Xmc7/1TcV+7AQ4
 QUPdArG53TaSiGQnoaGQwaZ4fR4B3ZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681719360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q5nmUpgvCQ0u2MP+TI3hAO45vlI9kSGcrKDYAZgJlps=;
 b=YP107ZirM4rvsq/kINPS5/KU2zjcwMy9SS3kPqMBALxmM2zAhothy6+oFf5RvdJpeOG+y7
 RqEM7rwtjsHlQJDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FDD31390E;
 Mon, 17 Apr 2023 08:16:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9wPIBkAAPWQgOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 08:16:00 +0000
Message-ID: <23d45518-3565-e915-c6d4-45dabe82ea4c@suse.de>
Date: Mon, 17 Apr 2023 10:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
Content-Language: en-US
To: Pierre Asselin <pa@panix.com>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
 <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
 <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
 <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
 <4PxhQn3zK1zcbc@panix1.panix.com>
 <f3004fccf706fb3cbb7ef6877dcd9168.squirrel@mail.panix.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <f3004fccf706fb3cbb7ef6877dcd9168.squirrel@mail.panix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PWXLCqpksoB4tWK4hp6JjzCo"
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
Cc: jfalempe@redhat.com, daniel.vetter@ffwll.ch, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 hdegoede@redhat.com, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PWXLCqpksoB4tWK4hp6JjzCo
Content-Type: multipart/mixed; boundary="------------97byxBVVYkHd1Wqftw3W5M97";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pierre Asselin <pa@panix.com>
Cc: jfalempe@redhat.com, daniel.vetter@ffwll.ch, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 hdegoede@redhat.com, ardb@kernel.org
Message-ID: <23d45518-3565-e915-c6d4-45dabe82ea4c@suse.de>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
 <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
 <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
 <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
 <4PxhQn3zK1zcbc@panix1.panix.com>
 <f3004fccf706fb3cbb7ef6877dcd9168.squirrel@mail.panix.com>
In-Reply-To: <f3004fccf706fb3cbb7ef6877dcd9168.squirrel@mail.panix.com>

--------------97byxBVVYkHd1Wqftw3W5M97
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBhIGxvdCB0byBib3RoIG9mIHlvdSBmb3IgdGhpcyBidWcgZml4Lg0K
DQpBbSAxMy4wNC4yMyB1bSAwMzozNCBzY2hyaWViIFBpZXJyZSBBc3NlbGluOg0KPj4gKG5v
dCB0ZXN0ZWQpDQo+IA0KPiBUZXN0ZWQuICBJdCBmaXhlcyB0aGUgcmVncmVzc2lvbiBvbiBt
eSBsYXB0b3AuDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvc3lzZmJf
c2ltcGxlZmIuYw0KPj4gYi9kcml2ZXJzL2Zpcm13YXJlL3N5c2ZiX3NpbXBsZWZiLmMNCj4+
IGluZGV4IDgyYzY0Y2I5ZjUzMS4uOWY1Mjk5ZDU0NzMyIDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9maXJtd2FyZS9zeXNmYl9zaW1wbGVmYi5jDQo+PiArKysgYi9kcml2ZXJzL2Zpcm13
YXJlL3N5c2ZiX3NpbXBsZWZiLmMNCj4+IEBAIC01NiwxMCArNTYsMTEgQEAgX19pbml0IGJv
b2wgc3lzZmJfcGFyc2VfbW9kZShjb25zdCBzdHJ1Y3Qgc2NyZWVuX2luZm8NCj4+ICpzaSwN
Cj4+ICAgCSAqIGRvbid0IHNwZWNpZnkgYWxwaGEgY2hhbm5lbHMuDQo+PiAgIAkgKi8NCj4+
ICAgCWlmIChzaS0+bGZiX2RlcHRoID4gOCkgew0KPj4gLQkJYml0c19wZXJfcGl4ZWwgPSBt
YXgobWF4MyhzaS0+cmVkX3NpemUgKyBzaS0+cmVkX3BvcywNCj4+ICsJCWJpdHNfcGVyX3Bp
eGVsID0gbWF4MyhtYXgzKHNpLT5yZWRfc2l6ZSArIHNpLT5yZWRfcG9zLA0KPj4gICAJCQkJ
CSAgc2ktPmdyZWVuX3NpemUgKyBzaS0+Z3JlZW5fcG9zLA0KPj4gICAJCQkJCSAgc2ktPmJs
dWVfc2l6ZSArIHNpLT5ibHVlX3BvcyksDQo+PiAtCQkJCSAgICAgc2ktPnJzdmRfc2l6ZSAr
IHNpLT5yc3ZkX3Bvcyk7DQo+PiArCQkJCSAgICAgc2ktPnJzdmRfc2l6ZSArIHNpLT5yc3Zk
X3BvcywNCj4+ICsJCQkJICAgICBzaS0+bGZiX2RlcHRoKTsNCg0KSSdtIE9LIHdpdGggdGhp
cyBjaGFuZ2UuIFRoZXJlJ3MgYSBjb21tZW50DQoNCiAgIlRoZSBiZXN0IHNvbHV0aW9uIGlz
IHRvIGNvbXB1dGUgYml0c19wZXJfcGl4ZWwgaGVyZSBhbmQgaWdub3JlIA0KbGZiX2RlcHRo
LiINCg0KSSdkIGNoYW5nZSB0aGlzIHRvDQoNCiAgIlRoZSBiZXN0IHNvbHV0aW9uIGlzIHRv
IGNvbXB1dGUgYml0c19wZXJfcGl4ZWwgaGVyZSBmcm9tIHRoZSBjb2xvciANCmJpdHMsIHRo
ZSByZXNlcnZlZCBiaXRzIGFuZCB0aGUgcmVwb3J0ZWQgY29sb3IgZGVwdGg7IHdoYXRldmVy
IGlzIGhpZ2hlc3QuIg0KDQpUaGF0IHdpbGwgaG9wZWZ1bGx5IGNsYXJpZnkgdGhlIG1lYW5p
bmcgb2YgdGhlc2UgbWF4MygpIHN0YXRlbWVudHMuIFRoZXkgDQphcmUgbm90IG9idmlvdXMg
YXQgZmlyc3QuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KPj4gICAJfSBlbHNlIHsN
Cj4+ICAgCQliaXRzX3Blcl9waXhlbCA9IHNpLT5sZmJfZGVwdGg7DQo+PiAgIAl9DQo+IA0K
PiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------97byxBVVYkHd1Wqftw3W5M97--

--------------PWXLCqpksoB4tWK4hp6JjzCo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ9AD8FAwAAAAAACgkQlh/E3EQov+A4
kA//b8iLVNTGaV3hmyG3/0DiQzBiimbrk9Za/r+oYm6eslbT7RDGiHkiY4/7uBzAQF/N6D/goXyB
2P2Rr6ueTWtz+lpj+C5G9WQW7cSyqdipX5zuw5Us/CKW9++RZDekU2CBehmvhzPxynTIxXbalN5x
OZSI3+yzOEA1zkuvkscnt7cSbMRcNaFwV1Nll2CsFMM6esnrtfWjTiwhUc6f8s24sBIQ1D2lbei/
2W/ETaTefRet4SkW0bf3bH2w4TyeoPWcrlXLtwUJoSOXau/lVBt4ewMY9LgUoQjMI08bUnm3PiZQ
HPNFZ9rzGMN1dHaKu2pIdZUJpgnum1Vl6hlP1JVI+du9mYKrbHAoH3XPGIcmnxIQBq4Wr/vdetl2
g3zOY+vr1DHrvmGMEywL0hnr5pqdmRYPnKROEtEYxBrZDGJiX7iCue7zo2yAila8wQPLLdCpbiwE
icpVg+CgJMjZd1IyjPmlo93iryJnC/yr293n0frzkAxrWGFgV89pPGR3CLHuvJ8HtuaUwGkk9AZf
jx9lxqqyi33tjq5orZPZ6qjdF9P9vFCD5vtCGObx98tpnpv4by9thRY2yBjd/psMwrjBuB+ALzp0
/2zOkdCr1pt/4VqljUpn0sbE1DxLGNPcu85NHsig9/Ar8FOu3ApjbUDchm+iyMwaa/XJ7ksOI0es
rbQ=
=ECWV
-----END PGP SIGNATURE-----

--------------PWXLCqpksoB4tWK4hp6JjzCo--
