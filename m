Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 873E8751CD0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02C410E65A;
	Thu, 13 Jul 2023 09:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DA010E64C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:09:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E39ED1F855;
 Thu, 13 Jul 2023 09:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689239391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pMAhmNv6AB4H29ahY31ai89W3FEUALtUwRaDwlh+b3M=;
 b=IfvN+bTm7/1TtTWWOgQ1QBIfrd+OeIwlCh5G7vhyA3V4ZR3MU1TTkKNcrNRseisBXCeWSZ
 VRYuLVWndJ9uKnfv9U95pXYdArS91nsupFZQpNEqg/wbWwzP2p3yNRlt5lwYhnWWfmwSDR
 VIZBpnRumGCRzo58Y0nzqP6ME6CwzuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689239391;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pMAhmNv6AB4H29ahY31ai89W3FEUALtUwRaDwlh+b3M=;
 b=dWPJUnUnhslDgitT3NcgWNLMF6+cvGkD7jFQ5mS/JvaDq+6lAJoISQhyTPuT2m5DlQWrY2
 7s8eupTvG6flnhBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B38AC13489;
 Thu, 13 Jul 2023 09:09:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id D+C6Kl+/r2StQwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 09:09:51 +0000
Message-ID: <9ceee0d3-cf5f-2a10-0d1b-9f02be00058e@suse.de>
Date: Thu, 13 Jul 2023 11:09:50 +0200
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
 <9b63ee41-13db-979f-80fd-10123da741d3@suse.de>
 <42e932cc-ff40-61bb-1d63-315f78fb2da2@mailbox.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <42e932cc-ff40-61bb-1d63-315f78fb2da2@mailbox.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lhZFDPOsICuRXojxKs0DbRGU"
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
--------------lhZFDPOsICuRXojxKs0DbRGU
Content-Type: multipart/mixed; boundary="------------WxMRLlqLndkxb4NXJ63a7li6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sui Jingfeng
 <suijingfeng@loongson.cn>, Jani Nikula <jani.nikula@linux.intel.com>,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <9ceee0d3-cf5f-2a10-0d1b-9f02be00058e@suse.de>
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
 <9b63ee41-13db-979f-80fd-10123da741d3@suse.de>
 <42e932cc-ff40-61bb-1d63-315f78fb2da2@mailbox.org>
In-Reply-To: <42e932cc-ff40-61bb-1d63-315f78fb2da2@mailbox.org>

--------------WxMRLlqLndkxb4NXJ63a7li6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDcuMjMgdW0gMTA6NTMgc2NocmllYiBNaWNoZWwgRMOkbnplcjoNCj4g
T24gNy8xMy8yMyAxMDo0OSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBBbSAxMy4w
Ny4yMyB1bSAxMDozMiBzY2hyaWViIE1pY2hlbCBEw6RuemVyOg0KPj4+IE9uIDcvMTIvMjMg
MTc6MjUsIEpvY2VseW4gRmFsZW1wZSB3cm90ZToNCj4+Pj4gT24gMTIvMDcvMjAyMyAxNzow
NSwgU3VpIEppbmdmZW5nIHdyb3RlOg0KPj4+Pj4gT24gMjAyMy83LzEwIDE2OjA3LCBKb2Nl
bHluIEZhbGVtcGUgd3JvdGU6DQo+Pj4+Pg0KPj4+Pj4+IE9uIHRoZSBvdGhlciBoYW5kLCBh
cmUgdGhlcmUgYW55IGRyYXdiYWNrIHRvIHByZXNlbnQgYSBCTUMgY29ubmVjdG9yIGV2ZW4g
d2hlbiB0aGUgaGFyZHdhcmUgZG9lc24ndCBoYXZlIGl0ID8NCj4+Pj4+DQo+Pj4+PiBJZiBu
b3QgcHJvcGVybHkgc2V0dGluZyB1cCwgSSB0aGluayB5b3Ugd2lsbCBjcmVhdGUgdHdvIGVu
Y29kZXIgYW5kIHR3byBjb25uZWN0b3IgaW4gdGhlIHN5c3RlbS4NCj4+Pj4NCj4+Pj4gWWVz
LCBidXQgSSB0aGluayBpdCB3b24ndCBoYXZlIGFueSB2aXNpYmxlIGVmZmVjdCBmb3IgdGhl
IGVuZC11c2VyLg0KPj4+DQo+Pj4gSSdtIGFmcmFpZCB1c2VyLXNwYWNlIGRpc3BsYXkgc2Vy
dmVycyB3b3VsZCB3YXN0ZSBlZmZvcnQgcHJvZHVjaW5nIGNvbnRlbnQgZm9yIGEgbm9uLWV4
aXN0aW5nIEJNQyAoYXNzdW1pbmcgaXRzIGNvbm5lY3RvciBzdGF0dXMgaXMgY29ubmVjdGVk
IG9yIHVua25vd24pLg0KPj4NCj4+IFJpZ2h0IG5vdywgdGhlIEJNQyBvdXRwdXQgd29ya3Mg
YmVjYXVzZSB0aGUgVkdBIHN0YXR1cyBpcyBhbHdheXMgY29ubmVjdGVkLiBTbyBub3RoaW5n
IHJlYWxseSBjaGFuZ2VzLg0KPiANCj4gVXNlci1zcGFjZSBkaXNwbGF5IHNlcnZlcnMgd291
bGQgZ2VuZXJhbGx5IHByb2R1Y2UgZGlmZmVyZW50IGNvbnRlbnRzIGJ5IGRlZmF1bHQgZm9y
IHRoZSBWR0EgJiBCTUMgY29ubmVjdG9ycy4NCg0KQ2FuIHlvdSBlbGFib3JhdGU/IEhvdyB3
b3VsZCB0aGUgb3V0cHV0IGRpZmZlcj8NCg0KPiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcs
IEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxk
LCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------WxMRLlqLndkxb4NXJ63a7li6--

--------------lhZFDPOsICuRXojxKs0DbRGU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSvv14FAwAAAAAACgkQlh/E3EQov+B9
8Q//XTf9AR2tWDQ5Yf2/KpC68bLFZC8bI4aDZnSXw9YtuatwekZptKVVAHUXqCS4ytHpd5mGPxx3
4zREHs6dyKXdshaSMShmJJLc6W77AnAO6R/5HCodx32s3KSoe+f9YxQXqayriEg2eWtQLa0GP1bn
PPl8O33pf5+E6HH3OsE5+BmKXbzVFvAl5LCYAbIJZRMWGh3hvRkUwGZn6k8ji2oo/Q937CgGrptW
nN81XHAQmmW1O/lPvOjy26ErYD/Lpv59wfMmPWy2vWfb5idHyLobP6uBjxIlnM3AfFeJRGzheio/
9cuARe/UI3LO1NIYDieiyzOveevOZLEVgxNeXPUF6A/XPtEu47OXgrEgdlH3lMoZ6bETC+mqdQOf
CX/rQpu6KQHs7Ex0szYmLUQvtrQVSHeEIqySqND8neqJ2pjP/tk52G0UcxwqFWvONIlcuO5L7FZs
BLd8sjoQG8dJftSbGpotFbHCfqeUtIyyBfcNdIDgfVWlJlKdUpks1I5/G95jIw3H+A6dEoXokeVc
Ztt2mqWPVesGIjfWnG9b4+BsPbsknBqiEaO8t20AjiGxbxuZAkUQc2M6k6R+/pujtKB8yX3xeT1g
f52NM8dOf/nU2QHloLRQ/RVdLvnBMv8auBcxP2ExfdTU7Dx9r9ju93xQX63cMqqi1klIA1N3pfhi
gY8=
=KFK9
-----END PGP SIGNATURE-----

--------------lhZFDPOsICuRXojxKs0DbRGU--
