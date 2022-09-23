Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B0C5E785C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 12:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C6010E831;
	Fri, 23 Sep 2022 10:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C8F10E4DC;
 Fri, 23 Sep 2022 10:30:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E23841FA43;
 Fri, 23 Sep 2022 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663929010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+d3oE0MQ60Quyrm+hahnRJfo1NbXRnt7z2frKzHN6Cw=;
 b=r06gVQPNIDK4LH+V1E1K4+E5n1wjlUGLFV++vtnoRA4+sqkhImdwAmdAc4qYXxp6b1exxQ
 6+q0NrirZ4sRKnI9BVzjZRca/F/ugjiQ+O/gDtYfpTcfuuLEWSh1Lvgylu+UC+CtlKqrCH
 UCPJWlCNDJWn+E9hErYWx4JlCrL8R5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663929010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+d3oE0MQ60Quyrm+hahnRJfo1NbXRnt7z2frKzHN6Cw=;
 b=Zt/7M2bFCcgg4tq5iROb8fzzfqor4FD4u21ddlXuIEQs5SwuBjDjExYsB0s7xpNLkEMvPL
 32rQOjVu8WR0XAAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E81E13AA5;
 Fri, 23 Sep 2022 10:30:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QrdHFrKKLWMUQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Sep 2022 10:30:10 +0000
Message-ID: <93969920-b5ed-ff15-48d4-02e2f9c23505@suse.de>
Date: Fri, 23 Sep 2022 12:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 13/33] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
 <49ea7c7c-7d4c-8348-ea75-e0f376111e4c@suse.de>
 <b3c4ee65-fc56-f54c-3946-b6524fb36f72@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b3c4ee65-fc56-f54c-3946-b6524fb36f72@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2CtqZ2vfwLlkheeWKPIE9NVi"
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2CtqZ2vfwLlkheeWKPIE9NVi
Content-Type: multipart/mixed; boundary="------------x3op9zyJLgSfMXocf8xeVJiF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Message-ID: <93969920-b5ed-ff15-48d4-02e2f9c23505@suse.de>
Subject: Re: [PATCH v2 13/33] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
 <49ea7c7c-7d4c-8348-ea75-e0f376111e4c@suse.de>
 <b3c4ee65-fc56-f54c-3946-b6524fb36f72@redhat.com>
In-Reply-To: <b3c4ee65-fc56-f54c-3946-b6524fb36f72@redhat.com>

--------------x3op9zyJLgSfMXocf8xeVJiF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDkuMjIgdW0gMTE6MjYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDkvMjMvMjIgMTE6MTUsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gSGkNCj4+DQo+PiBBbSAyMi4wOS4yMiB1bSAxNjoyNSBzY2hyaWViIE1heGltZSBSaXBh
cmQ6DQo+Pj4gZHJtX2Nvbm5lY3Rvcl9waWNrX2NtZGxpbmVfbW9kZSgpIGlzIGluIGNoYXJn
ZSBvZiBmaW5kaW5nIGEgcHJvcGVyDQo+Pj4gZHJtX2Rpc3BsYXlfbW9kZSBmcm9tIHRoZSBk
ZWZpbml0aW9uIHdlIGdvdCBpbiB0aGUgdmlkZW89IGNvbW1hbmQgbGluZQ0KPj4+IGFyZ3Vt
ZW50Lg0KPj4+DQo+Pj4gTGV0J3MgYWRkIHNvbWUgdW5pdCB0ZXN0cyB0byBtYWtlIHN1cmUg
d2UncmUgbm90IGdldHRpbmcgYW55IHJlZ3Jlc3Npb25zDQo+Pj4gdGhlcmUuDQo+Pj4NCj4+
PiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCj4+
Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMNCj4+PiBpbmRleCBi
YmM1MzVjYzUwZGQuLmQ1NTNlNzkzZTY3MyAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2NsaWVudF9tb2Rlc2V0LmMNCj4+PiBAQCAtMTIzNywzICsxMjM3LDcgQEAgaW50IGRy
bV9jbGllbnRfbW9kZXNldF9kcG1zKHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50LCBp
bnQgbW9kZSkNCj4+PiAgICAJcmV0dXJuIHJldDsNCj4+PiAgICB9DQo+Pj4gICAgRVhQT1JU
X1NZTUJPTChkcm1fY2xpZW50X21vZGVzZXRfZHBtcyk7DQo+Pj4gKw0KPj4+ICsjaWZkZWYg
Q09ORklHX0RSTV9LVU5JVF9URVNUDQo+Pj4gKyNpbmNsdWRlICJ0ZXN0cy9kcm1fY2xpZW50
X21vZGVzZXRfdGVzdC5jIg0KPj4+ICsjZW5kaWYNCj4+DQo+PiBJIHN0cm9uZ2x5IGRpc2xp
a2UgdGhpcyBzdHlsZSBvZiBpbmNsdWRpbmcgc291cmNlIGZpbGVzIGluIGVhY2ggb3RoZXIu
DQo+PiBJdCdzIGEgcmVjaXBlIGZvciBhbGwga2luZCBvZiBidWlsZCBlcnJvcnMuIENhbiB5
b3UgZG8gc29tZXRoaW5nIGVsc2U/DQo+Pg0KPiANCj4gVGhpcyBzZWVtcyB0byBiZSB0aGUg
Y29udmVudGlvbiB1c2VkIHRvIHRlc3Qgc3RhdGljIGZ1bmN0aW9ucyBhbmQgd2hhdCdzDQo+
IGRvY3VtZW50ZWQgaW4gdGhlIEt1bml0IGRvY3M6IGh0dHBzOi8va3VuaXQuZGV2L3RoaXJk
X3BhcnR5L2tlcm5lbC9kb2NzL3RpcHMuaHRtbCN0ZXN0aW5nLXN0YXRpYy1mdW5jdGlvbnMN
Cg0KVGhhdCBkb2N1bWVudCBzYXlzICIuLi5vbmUgb3B0aW9uIGlzIHRvIGNvbmRpdGlvbmFs
bHkgI2luY2x1ZGUgdGhlIHRlc3QgDQpmaWxlLi4uIi4gVGhpcyBkb2Vzbid0IHNvdW5kIGxp
a2UgYSBzdHJvbmcgcmVxdWlyZW1lbnQuDQoNCj4gDQo+IEkgYWdyZWUgd2l0aCB5b3UgdGhh
dCdzIG5vdCBpZGVhbCBidXQgSSB0aGluayB0aGF0IGNvbnNpc3RlbmN5IHdpdGggaG93DQo+
IGl0IGlzIGRvbmUgYnkgb3RoZXIgc3Vic3lzdGVtcyBpcyBhbHNvIGltcG9ydGFudC4NCj4g
ICANCj4+IEFzIHRoZSB0ZXN0ZWQgZnVuY3Rpb24gaXMgYW4gaW50ZXJuYWwgaW50ZXJmYWNl
LCBtYXliZSBleHBvcnQgYSB3cmFwcGVyDQo+PiBpZiB0ZXN0cyBhcmUgZW5hYmxlZCwgbGlr
ZSB0aGlzOg0KPj4NCj4+ICNpZmRlZiBDT05GSUdfRFJNX0tVTklUX1RFU1QNCj4+IHN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlICoNCj4+IGRybV9jb25uZWN0b3JfcGlja19jbWRsaW5lX21v
ZGVfa3VuaXQoZHJtX2NvbmVuY3RvcikNCj4+IHsNCj4+ICAgICByZXR1cm4gZHJtX2Nvbm5l
Y3Rvcl9waWNrX2NtZGxpbmVfbW9kZShjb25uZWN0b3IpDQo+PiB9DQo+PiBFWFBPUlRfU1lN
Qk9MKGRybV9jb25uZWN0b3JfcGlja19jbWRsaW5lX21vZGVfa3VuaXQpDQo+PiAjZW5kaWYN
Cj4+DQo+PiBUaGUgd3JhcHBlcidzIGRlY2xhcmF0aW9uIGNhbiBiZSBsb2NhdGVkIGluIHRo
ZSBrdW5pdCB0ZXN0IGZpbGUuDQo+Pg0KPiANCj4gQnV0IHRoYXQncyBhbHNvIG5vdCBuaWNl
IHNpbmNlIHdlIGFyZSBhcnRpZmljaWFsbHkgZXhwb3NpbmcgdGhlc2Ugb25seQ0KPiB0byBh
bGxvdyB0aGUgc3RhdGljIGZ1bmN0aW9ucyB0byBiZSBjYWxsZWQgZnJvbSB1bml0IHRlc3Rz
LiBBbmQgd291bGQNCj4gYmUgYSBkaWZmZXJlbnQgYXBwcm9hY2ggdGhhbiB0aGUgb25lIHVz
ZWQgYnkgYWxsIG90aGVyIHN1YnN5c3RlbXMuLi4NCj4gDQoNClRoZXJlJ3MgdGhlIHByb2Js
ZW0gb2YgaW50ZXJmZXJlbmNlIGJldHdlZW4gdGhlIHNvdXJjZSBmaWxlcyB3aGVuIA0KYnVp
bGRpbmcgdGhlIGNvZGUuIEl0J3MgYWxzbyBub3QgdGhlIHNhbWUgc291cmNlIGNvZGUgYWZ0
ZXIgaW5jbHVkaW5nIA0KdGhlIHRlc3QgZmlsZS4gQXQgYSBtaW5pbXVtLCBpbmNsdWRpbmcg
dGhlIHRlc3RzJyBzb3VyY2UgZmlsZSBmdXJ0aGVyIA0KaW5jbHVkZXMgbW9yZSBmaWxlcy4g
PGt1bml0L3Rlc3RzLmg+IGFsc28gaW5jbHVkZXMgcXVpdGUgYSBmZXcgb2YgTGludXggDQpo
ZWFkZXIgZmlsZXMuDQoNCklNSE8gdGhlIGN1cnJlbnQgY29udmVudGlvbiAoaWYgYW55KSBp
cyBmYXIgZnJvbSBvcHRpbWFsIGFuZCB3ZSBzaG91bGQgDQpjb25zaWRlciBicmVha2luZyBp
dC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------x3op9zyJLgSfMXocf8xeVJiF--

--------------2CtqZ2vfwLlkheeWKPIE9NVi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMtirEFAwAAAAAACgkQlh/E3EQov+CM
OA/9HZJ5Dr75ScIPSVmAz7p2sZT/skTdYhTo2rlRnmdB/TQQoL8Ftkp+CxLqMzpnu32lx4PZ2r/c
Ji6hUAmmqGFngV4rgCmMqA3i+ZhZwfXa3nz5lcwe6jtmZBx2Ey2waNXbSrjioJOGxSKtDDbUnz1p
hqCxNHLIpNC2T8jbVfKMPtWTBzX8EqyGhDypnseC4ypyI14YvbE6oEfKUgcxDeTwCrgXKf5U2j72
Ec8hiqh0H1O1IIbutmuil6eKNCKs2EBLv6tZz/4tNBdn7aDjkUA4nNpV974Rk9hHV27kK8dEQXpu
kb+PnBHnSH6l1rRWfvPM4EhhLX972LUz8rXU7P50dj1RWtrSxWOp4yN6g1fVE/Os3vNOCRL0aQoQ
agK/lz3WZFk5MCbuy+5YtGCq9F3eFYfS6UV+8ipsJJcilkNmkGsmVriZZep5+Q2TgEWpGIBhox6b
2etoG3cSlUXaS7PwDkbXrjHblroxCxuvvR0N8dI9miCtHNOW/MHqA4+BowQD5Pls8wn1GPkFFk2W
lWdd+Ccg4KXb50YBxZBBvL7dtCMif7yKHVvhdFws9T7WmRKjZVl9CPNJZYPMrMnnEBQ+ydKof7XR
EN5ZxiPIlzv7oNmI6kzervSrsugTxiCds/ODjyrA0l9fJ78aaR8yp/v3eFwhU7n/3I59xCj1M8ky
0Fc=
=v90E
-----END PGP SIGNATURE-----

--------------2CtqZ2vfwLlkheeWKPIE9NVi--
