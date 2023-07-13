Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60153751C25
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A48910E0C4;
	Thu, 13 Jul 2023 08:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AE110E0C4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:49:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52FCB1F45E;
 Thu, 13 Jul 2023 08:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689238173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sJLG2yZNZHcVlsW3FsC60sv9Udu4DHfYI3d82cAV6zI=;
 b=fcfOwQ1bMJL1RXsnwWWWSZyNwBfzQfcaBiANhywmKK1eSgAgDEEg7K0wLY9H3XKjJFL59L
 zcMb4XdDcKJJsp6JXlgU7pOxfWDRylWz2g0iCRHs70lVWBOSKhuR2nOR4JM26oTpU1w/IS
 hoyV7kZ6EETCD5IEMzWQ+1Yem4Me5ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689238173;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sJLG2yZNZHcVlsW3FsC60sv9Udu4DHfYI3d82cAV6zI=;
 b=MBGMzvwP9aaaXnrawP4wCjzY0Ce/JP3WqQ5s6BtXh8Aa/HPHEHBxzNcrdENTeex0V9XjqB
 S0IV9byOC28pi7Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26CC913489;
 Thu, 13 Jul 2023 08:49:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MciACJ26r2R8OQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 08:49:33 +0000
Message-ID: <9b63ee41-13db-979f-80fd-10123da741d3@suse.de>
Date: Thu, 13 Jul 2023 10:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sui Jingfeng
 <suijingfeng@loongson.cn>, Jani Nikula <jani.nikula@linux.intel.com>,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
 <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
 <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
 <81c57344-289d-fe41-8518-503249ea8d64@suse.de>
 <3fc768f8-9461-c4b0-b9af-555c52294c94@redhat.com>
 <2fb391e2-9f68-26f0-e005-a7f0f4324adc@loongson.cn>
 <b56afc8a-5fda-3227-3ac0-5e7b7773976b@redhat.com>
 <36e04e4c-c2ac-64cf-9503-ea43a29b66d0@mailbox.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <36e04e4c-c2ac-64cf-9503-ea43a29b66d0@mailbox.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OyWiMY9yl79n065zz0aJIsAn"
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
--------------OyWiMY9yl79n065zz0aJIsAn
Content-Type: multipart/mixed; boundary="------------15Z3h9ZLuD8mc6s3DwvP33ud";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sui Jingfeng
 <suijingfeng@loongson.cn>, Jani Nikula <jani.nikula@linux.intel.com>,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <9b63ee41-13db-979f-80fd-10123da741d3@suse.de>
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
 <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
 <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
 <81c57344-289d-fe41-8518-503249ea8d64@suse.de>
 <3fc768f8-9461-c4b0-b9af-555c52294c94@redhat.com>
 <2fb391e2-9f68-26f0-e005-a7f0f4324adc@loongson.cn>
 <b56afc8a-5fda-3227-3ac0-5e7b7773976b@redhat.com>
 <36e04e4c-c2ac-64cf-9503-ea43a29b66d0@mailbox.org>
In-Reply-To: <36e04e4c-c2ac-64cf-9503-ea43a29b66d0@mailbox.org>

--------------15Z3h9ZLuD8mc6s3DwvP33ud
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDcuMjMgdW0gMTA6MzIgc2NocmllYiBNaWNoZWwgRMOkbnplcjoNCj4g
T24gNy8xMi8yMyAxNzoyNSwgSm9jZWx5biBGYWxlbXBlIHdyb3RlOg0KPj4gT24gMTIvMDcv
MjAyMyAxNzowNSwgU3VpIEppbmdmZW5nIHdyb3RlOg0KPj4+IE9uIDIwMjMvNy8xMCAxNjow
NywgSm9jZWx5biBGYWxlbXBlIHdyb3RlOg0KPj4+DQo+Pj4+IE9uIHRoZSBvdGhlciBoYW5k
LCBhcmUgdGhlcmUgYW55IGRyYXdiYWNrIHRvIHByZXNlbnQgYSBCTUMgY29ubmVjdG9yIGV2
ZW4gd2hlbiB0aGUgaGFyZHdhcmUgZG9lc24ndCBoYXZlIGl0ID8NCj4+Pg0KPj4+IElmIG5v
dCBwcm9wZXJseSBzZXR0aW5nIHVwLCBJIHRoaW5rIHlvdSB3aWxsIGNyZWF0ZSB0d28gZW5j
b2RlciBhbmQgdHdvIGNvbm5lY3RvciBpbiB0aGUgc3lzdGVtLg0KPj4NCj4+IFllcywgYnV0
IEkgdGhpbmsgaXQgd29uJ3QgaGF2ZSBhbnkgdmlzaWJsZSBlZmZlY3QgZm9yIHRoZSBlbmQt
dXNlci4NCj4gDQo+IEknbSBhZnJhaWQgdXNlci1zcGFjZSBkaXNwbGF5IHNlcnZlcnMgd291
bGQgd2FzdGUgZWZmb3J0IHByb2R1Y2luZyBjb250ZW50IGZvciBhIG5vbi1leGlzdGluZyBC
TUMgKGFzc3VtaW5nIGl0cyBjb25uZWN0b3Igc3RhdHVzIGlzIGNvbm5lY3RlZCBvciB1bmtu
b3duKS4NCg0KUmlnaHQgbm93LCB0aGUgQk1DIG91dHB1dCB3b3JrcyBiZWNhdXNlIHRoZSBW
R0Egc3RhdHVzIGlzIGFsd2F5cyANCmNvbm5lY3RlZC4gU28gbm90aGluZyByZWFsbHkgY2hh
bmdlcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1j
RG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------15Z3h9ZLuD8mc6s3DwvP33ud--

--------------OyWiMY9yl79n065zz0aJIsAn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSvupwFAwAAAAAACgkQlh/E3EQov+Bu
vhAAnUhOA8CNy5lQudkXlnDb0wY6r1FecBHr7m9tphCk/LGE72YD7QDHV6qtPu76RxmH+I1J9noe
Wvp0E9FtF7ei+qk31fF1vHc9qJAl5zbiVYExc/X+EFrFPVvvIUp1Zm1aZEui+EGltybSdn6ITZqV
KtEY0VSGxmFi6Ajcg/4nWBkjDOcLc3yhFEcIf+3a8xsRXzD2QAleY3RU8WHWcPCVHGyKjS9XuEQA
/KqN6Jmt1yQ53/EcXHX0Q/FQexoWrRGWlI9wyVnxoqfCXGW68Em9LQ2WK5Ohg21nGVJ1nd2/DtSg
5CxLlJFBuKPSED/B6YokL8yQWCPHvGF5i5tL/EDOYOQ4BWl8PuMpZ+GpHYb221vRWEZCtQw77OMQ
Ek8cTUJkGsXYHBsemhDJMrSI90iuGuFd6zJJyb6r6wWnk0c+gwcSXmcoDp7JiuWZQAy2F+Wj9ZQB
n1bVdV876/VZjrgF851NI2yJv3hjglHtbkjod9qBa+JV483akHWUbmc/Y3issW8p3QDHOg1Atlm2
eN3UXPiZfz5LDKuReIxJ+/s7x6DAM9uhQ3/9gQCUPS7utlXQXeH1GrUk40IknryqiZiFwJhVx95m
4XMbfF/BSry7PsvjcPThM3xV0r4jw9y2jZf5F41H/9XoTGu+G8DDxWX/1XBsN/qFOfQ06Vf+GMXJ
jGQ=
=P70c
-----END PGP SIGNATURE-----

--------------OyWiMY9yl79n065zz0aJIsAn--
