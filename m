Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E49C751C3F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3471210E18C;
	Thu, 13 Jul 2023 08:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD22510E18C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:50:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 47D211F45E;
 Thu, 13 Jul 2023 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689238225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sMuNJTtyc0QGPS1emOUPFzg2621BggGtV8ozg/R+tnQ=;
 b=rHSwVDJUa9aEzehZFQI4dT6FTJXpwx6ZY1y3Uy2/oFr1bah0sutU0KIlPyhayQ4jhO2300
 kv2Ff0mn4lo6/2njzmeLB00KtvXqyxDs2YOunA25z/WnAOWzIRnGqAM66wspB2wn285TGZ
 2pEHKmqlVy4lNO6qRFsfjocHu+KQI3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689238225;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sMuNJTtyc0QGPS1emOUPFzg2621BggGtV8ozg/R+tnQ=;
 b=ZIY/EvwmHJe3p3po1uhn5MDh9hrEJlzZuUPKV8nj8Q8bsNYgAchosth+cD1uaMzCrEXP0n
 4RbV+4bwasl/L/Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18FE913489;
 Thu, 13 Jul 2023 08:50:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IwHyBNG6r2QMOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 08:50:25 +0000
Message-ID: <3f9e8ff8-e6c1-2931-51c7-df191f095549@suse.de>
Date: Thu, 13 Jul 2023 10:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
 <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
 <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
 <81c57344-289d-fe41-8518-503249ea8d64@suse.de>
 <3fc768f8-9461-c4b0-b9af-555c52294c94@redhat.com>
 <2fb391e2-9f68-26f0-e005-a7f0f4324adc@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2fb391e2-9f68-26f0-e005-a7f0f4324adc@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------slHSGANgpC95Qt0yspJgSfLr"
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
--------------slHSGANgpC95Qt0yspJgSfLr
Content-Type: multipart/mixed; boundary="------------jCpJMyjuXZc0QtQfFj3txrAh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <3f9e8ff8-e6c1-2931-51c7-df191f095549@suse.de>
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
In-Reply-To: <2fb391e2-9f68-26f0-e005-a7f0f4324adc@loongson.cn>

--------------jCpJMyjuXZc0QtQfFj3txrAh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDcuMjMgdW0gMTc6MDUgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gDQo+IEknbSBoZXJlIGpvaW4gdG8gdGhlIGRpc2N1c3Npb24uIEJlY2F1c2Ug
SSBrbm93IGEgbGl0dGxlIGFib3V0IGFzcGVlZCBCTUMuDQo+IA0KPiANCj4gT24gMjAyMy83
LzEwIDE2OjA3LCBKb2NlbHluIEZhbGVtcGUgd3JvdGU6DQo+PiBPbiAwNy8wNy8yMDIzIDA5
OjMwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+PiBIaQ0KPj4+DQo+Pj4gQW0gMDYu
MDcuMjMgdW0gMTg6Mzcgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+Pj4gWy4uLl0NCj4+
Pj4+Pg0KPj4+Pj4+IFlvdSBjb3VsZCBvdXQtY29tbWVudCB0aGUgVkdBIGNvZGUgaW4gdGhl
IGFzdCBkcml2ZXIgZm9yIHRlc3RpbmcuDQo+Pj4+Pg0KPj4+Pj4gT2gsIFRoYW5rcyBmb3Ig
dGhlIGlkZWEsIEkgd2lsbCB0cnkgdGhhdC4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IFRoZSByZXN1
bHQgaXMgdGhhdCBJIGdldCBhIGJsYWNrIHNjcmVlbiBvbiB0aGUgcmVtb3RlIEJNQy4gU28g
bWF5YmUgDQo+Pj4+IGFkZGluZyBhIHJlbW90ZS9ibWMgY29ubmVjdG9yIHdpbGwgc29sdmUg
dGhhdC4NCj4+Pg0KPj4+IENvdWxkIHdvcmsuIFRoYXQgd291bGQgYmUgYSBjb25uZWN0b3Ig
YW5kIGVuY29kZXIgb2YgdHlwZSAndmlydHVhbCc/DQo+Pj4NCj4+PiBOb3QgYWxsIGFzdCBk
ZXZpY2VzIGhhdmUgYSBCTUMuIERvIHlvdSBrbm93IGhvdyB0byBkZXRlY3QgaXRzIHByZXNl
bmNlPw0KPj4NCj4+IEh1bSwgSSB0aG91Z2ggYWxsIGFzdCBkZXZpY2VzIGhhdmUgYSBCTUMs
IA0KPiANCj4gTm8sIFRob21hcyBpcyByaWdodCwgbm90IGFsbCBhc3QgZGV2aWNlcyBoYXZl
IGEgQk1DLg0KPiANCj4gSSBoYXZlIHR3byBkaXNjcmV0ZSBBU1QgQk1DIGNhcmRzLCBzZWUg
WzFdIGZvciByZWZlcmVuY2UuDQo+IA0KPiBJIGdlbmVyYWxseSB1c2luZyB0aGUgYXN0MjQw
MCBCTUMgY2FyZHMgdG8gdGVzdGluZyBwYXRjaGVzIGFuZCBzdHVkeSANCj4gZHJtL2FzdCBk
cml2ZXIuDQo+IA0KPiBJdCBzZWVtcyB0aGF0IHRoaXMgdHdvIGNhcmRzIGFyZSBwdXJlIDJE
IGRpc3BsYXkgY2FyZCwgYmVjYXVzZSB0aGV5IA0KPiBkb24ndCBoYXZlIGEgbmV0IGludGVy
ZmFjZShjYW4gbm90IHBsdWctaW4gdGhlIG5ldCBjYWJsZSkuDQo+IA0KPiANCj4gWzFdIA0K
PiBodHRwczovL2dpdGh1Yi5jb20vbG9vbmdzb24tZ2Z4L2xvb25nc29uX2JvYXJkcy9ibG9i
L21haW4vYXN0X2JtY19jYXJkcy9hc3QxNDAwX2FuZF9hc3QyNDAwLmpwZw0KDQpUaGFua3Mg
Zm9yIHRoZSBpbmZvLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4+IGFu
ZCBJIGRvbid0IHNlZSBhIHdheSB0byBkZXRlY3QgdGhhdCBCTUMgaXMgYWN0aXZlIG9yIHBy
ZXNlbnQuDQo+IA0KPiBJIHRoaW5rIHdlIGJldHRlciBmaW5kIG9uZSwgdGhlbiBpZiB0aGUg
Qk1DIGlzIGFjdGl2ZSAocHJlc2VudCkuDQo+IA0KPiB3ZSBjb3VsZCBjcmVhdGUgYSB2aXJ0
dWFsIGVuY29kZXIgYW5kIGNvbm5lY3RvciBzYWZlbHkuDQo+IA0KPiANCj4+IChJdCB3b3Vs
ZCBiZSBldmVuIGJldHRlciB0byBrbm93IHRoZSBicm93c2VyJ3Mgc2l6ZSwgYW5kIGF1dG9t
YXRpY2FsbHkgDQo+PiByZXNpemUsIGxpa2Ugd2hlbiB1c2luZyBhIFZNLiBCdXQgSSdtIG5v
dCBzdXJlIHRoZSBoYXJkd2FyZS9maXJtd2FyZSANCj4+IGlzIGFibGUgdG8gZG8gdGhpcyku
DQo+Pg0KPiANCj4gSSB0aGluayBpdCBpcyBub3QgZGlmZmljdWx0LCBpdCBqdXN0IHRoYXQg
bmVlZCB0aGUgZmlybXdhcmUgb2YgeW91ciANCj4gYm9hcmQgdG8gc2V0IGEgdmFsdWUgdG8g
YSByZWdpc3RlciwNCj4gDQo+IChhIHNjcmF0Y2ggcmVnaXN0ZXIpIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuDQo+IA0KPiBCdXQgdGhpcyByZWFsbHkgbmVlZCB5b3UgaGF2ZSB0aGUgZmly
bXdhcmUgKHNvdXJjZSBjb2RlKSB0byBzdXBwb3J0IHRoaXMuDQo+IA0KPiBPciB5b3UgYXJl
IGx1Y2tpbHksIGlmIHRoZXJlIHNvbWVib2R5IGFscmVhZHkgZG9uZSB0aGlzIGZvciB5b3Uu
DQo+IA0KPj4gT24gdGhlIG90aGVyIGhhbmQsIGFyZSB0aGVyZSBhbnkgZHJhd2JhY2sgdG8g
cHJlc2VudCBhIEJNQyBjb25uZWN0b3IgDQo+PiBldmVuIHdoZW4gdGhlIGhhcmR3YXJlIGRv
ZXNuJ3QgaGF2ZSBpdCA/DQo+IA0KPiBJZiBub3QgcHJvcGVybHkgc2V0dGluZyB1cCwgSSB0
aGluayB5b3Ugd2lsbCBjcmVhdGUgdHdvIGVuY29kZXIgYW5kIHR3byANCj4gY29ubmVjdG9y
IGluIHRoZSBzeXN0ZW0uDQo+IA0KPj4+DQo+Pj4gQmVzdCByZWdhcmRzDQo+Pj4gVGhvbWFz
DQo+Pj4NCj4+Pj4NCj4+Pj4NCj4+Pg0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+DQo+IA0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0
NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXll
cnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51
ZXJuYmVyZykNCg==

--------------jCpJMyjuXZc0QtQfFj3txrAh--

--------------slHSGANgpC95Qt0yspJgSfLr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSvutAFAwAAAAAACgkQlh/E3EQov+CL
8hAAvVDyTzb/6uCvl53iIOJAG1kMZnt5GI4P2RtvP2ro8QQceY8eMRKvBkXlMFgWpQv6fxIRJWD2
YKtKAB+OmQCuZq+cVQRM166rQaVjn/X6rd8wnQPfR6mUCnm05v3sf6CBvrNi7hnUPrmA2qOVcWIv
qKm9XK+DNQcG/IgF53yp3jiqEPnPEUHI4d3sQ0bRZMK7mtNGFFQkT9kApGXkuAG3GUHSU7l5cqS4
GXkLk0P4ubnNLs/TrcPJNhX046ZH+uOWQ/3Diq/14tuVzQNp8Q3K6/nDtZmru4gI27R4B8GDeBiz
3Ghf9Aq4YzjfTsZxqW5BtZQllC+IpwQLdQFKDYPfXXiXgjx3hx814oSQrsHPzjHvkW4yhZX7MjGO
EN2/07JbHpiZS8xHsvf1cAlP/j2gbObwK01uK2yU1xNPHgTYuQL2WxgHvvUDGRZ5d3iAs3UDZq5n
cDWILtgo/ib/X56SD78sghjR83fnt1/tCSM511G8o9F6fVQP2qtytnyYvrjzH0Sww/O+pp7tVno/
vXDkZ5wvNBSr1oFihD275oPetOwEUsX+KJ3C3SJT9XkbXLjbRt0Tv/PSIquQzVh+g82wVAj4ab95
aZmDkS44hYQ7qAI9KF202nuGtxUvz9MIL4Vo4VfZ+/qAQV8C+hUF+c1fNTC/lIbcGSYHguHmHyaL
vkI=
=UJal
-----END PGP SIGNATURE-----

--------------slHSGANgpC95Qt0yspJgSfLr--
