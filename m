Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 192DB587A6F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 12:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F195D10E585;
	Tue,  2 Aug 2022 10:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB3110ECFA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 10:14:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43BD120440;
 Tue,  2 Aug 2022 10:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659435270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Vre/61cegNi4wy/T8nox50WE3H7/Gqz4yV9Yy+Ha/o=;
 b=YR+6KFHNzcLLuHPNcW2uPTKzaUTvhBqyR2x5WTRR+MhlFZcRTBuFrsFomLShCczdTFcYJT
 BQU2wyWwGSNzOyhlZwM2sHYESX96fCc6HwKyTbw8L1gxRcQXQCQ/Yv/IGRQF+4eSnOHtnf
 eXRGsZVPaVWdcEutZmzEgDmxAVN3TCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659435270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Vre/61cegNi4wy/T8nox50WE3H7/Gqz4yV9Yy+Ha/o=;
 b=AkAJ/Cn+JbHP0D6G01uwONRjYT2xsG6OkbejNa9Fi2ufrWD8Qsw/YZJT1q7j8WtSn4ytE3
 rBvkZmEWKn+zpFAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D45CF13A8E;
 Tue,  2 Aug 2022 10:14:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lJ0QMwX56GLPfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Aug 2022 10:14:29 +0000
Message-ID: <14d698dc-172c-773f-7ea1-7101b9f5b77f@suse.de>
Date: Tue, 2 Aug 2022 12:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 08/35] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-8-3d53ae722097@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-8-3d53ae722097@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K5MK8hIKXq0hvmNNdm47Ne03"
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K5MK8hIKXq0hvmNNdm47Ne03
Content-Type: multipart/mixed; boundary="------------jwHUsosnwnCAj7SiMT2ZIMis";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Message-ID: <14d698dc-172c-773f-7ea1-7101b9f5b77f@suse.de>
Subject: Re: [PATCH v1 08/35] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-8-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-8-3d53ae722097@cerno.tech>

--------------jwHUsosnwnCAj7SiMT2ZIMis
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lDQoNCkFtIDI5LjA3LjIyIHVtIDE4OjM0IHNjaHJpZWIgTWF4aW1lIFJpcGFy
ZDoNCj4gZHJtX2Nvbm5lY3Rvcl9waWNrX2NtZGxpbmVfbW9kZSgpIGlzIGluIGNoYXJnZSBv
ZiBmaW5kaW5nIGEgcHJvcGVyDQo+IGRybV9kaXNwbGF5X21vZGUgZnJvbSB0aGUgZGVmaW5p
dGlvbiB3ZSBnb3QgaW4gdGhlIHZpZGVvPSBjb21tYW5kIGxpbmUNCj4gYXJndW1lbnQuDQo+
IA0KPiBMZXQncyBhZGQgc29tZSB1bml0IHRlc3RzIHRvIG1ha2Ugc3VyZSB3ZSdyZSBub3Qg
Z2V0dGluZyBhbnkgcmVncmVzc2lvbnMNCj4gdGhlcmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4NCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMNCj4gaW5kZXggYmJjNTM1Y2M1MGRkLi5lZTZiOGYx
OTNjMjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVz
ZXQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMNCj4g
QEAgLTEyMzcsMyArMTIzNyw3IEBAIGludCBkcm1fY2xpZW50X21vZGVzZXRfZHBtcyhzdHJ1
Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCwgaW50IG1vZGUpDQo+ICAgCXJldHVybiByZXQ7
DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2NsaWVudF9tb2Rlc2V0X2RwbXMpOw0K
PiArDQo+ICsjaWZkZWYgQ09ORklHX0RSTV9LVU5JVF9URVNUDQo+ICsjaW5jbHVkZSAidGVz
dHMvZHJtX21vZGVfdGVzdC5jIg0KPiArI2VuZGlmDQoNCkluY2x1ZGluZyBzb3VyY2UgZmls
ZXMgaXMgc29tZXdoYXQgdWdseSwgcHJvbG9uZ3MgY29tcGlsZSB0aW1lcyBhbmQgDQpjb3Vs
ZCBldmVuIGludGVyZmVyZSB3aXRoIHRoZSBhY3R1YWwgc291cmNlIGNvZGUuIENhbiB3ZSBk
byB0aGlzIGluIHNvbWUgDQpvdGhlciB3YXk/DQoNCkkgc3VnZ2VzdCB0byBhZGQgdGhlIHRl
c3RzIGhlcmUgYW5kIGV4cG9ydCB0aGVtIGZvciB1c2UgaW4gdGhlIHRlc3QgDQpjYXNlLiBT
b21ldGhpbmcgbGlrZQ0KDQojaWZkZWYgQ09ORklHX0RSTV9LVU5JVF9URVNUDQpzdGF0aWMg
ZHJtX21vZGVfcmVzXzE5MjBfMTA4MF82MCgpDQp7DQogICAuLi4NCn0NCg0Kc3RydWN0IGt1
bml0X2Nhc2UgZHJtX21vZGVfdGVzdHNbXSA9IHsNCiAgIGRybV9tb2RlX3Jlc18xOTIwXzEw
ODBfNjANCn07DQpFWFBPUlRfU1lNQk9MKGRybV9tb2RlX3Rlc3RzKTsNCiNlbmRpZg0KDQpU
aGlzIHdvdWxkIGFkZCB0aGUgdGVzdHMgbmV4dCB0byB0aGUgdGVzdGVkIGNvZGUsIGJ1dCBs
ZWF2ZSB0aGUgdGVzdCANCmRyaXZlciBpbiBkcm1fbW9kZV90ZXN0LmMuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9k
cm1fbW9kZV90ZXN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX21vZGVfdGVzdC5j
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMGY3MTUx
OTc4OGE3DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rlc3Rz
L2RybV9tb2RlX3Rlc3QuYw0KPiBAQCAtMCwwICsxLDEzMiBAQA0KPiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgKGMpIDIw
MjIgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPg0KPiArICovDQo+ICsNCj4g
KyNpbmNsdWRlIDxkcm0vZHJtX21vZGUuaD4NCj4gKyNpbmNsdWRlIDxrdW5pdC90ZXN0Lmg+
DQo+ICsNCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2Nvbm5lY3Rvci5oPg0KPiArI2luY2x1ZGUg
PGRybS9kcm1fZWRpZC5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+DQo+ICsjaW5j
bHVkZSA8ZHJtL2RybV9tb2Rlcy5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fbW9kZXNldF9o
ZWxwZXJfdnRhYmxlcy5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+
DQo+ICsNCj4gK3N0cnVjdCBkcm1fbW9kZV90ZXN0X3ByaXYgew0KPiArCXN0cnVjdCBkZXZp
Y2UgKmRldjsNCj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOw0KPiArCXN0cnVjdCBkcm1f
Y29ubmVjdG9yIGNvbm5lY3RvcjsNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIGRybV9tb2RlX2NvbmZpZ19mdW5jcyA9IHsNCj4g
K307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RyaXZlciBkcm1fbW9kZV9k
cml2ZXIgPSB7DQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgaW50IGRybV9tb2RlX2Nvbm5lY3Rv
cl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4gK3sNCj4g
KwlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZTsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+
ICsJcmV0ID0gZHJtX2FkZF9tb2Rlc19ub2VkaWQoY29ubmVjdG9yLCAxOTIwLCAxMjAwKTsN
Cj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0dXJuIDA7DQo+
ICt9DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJf
ZnVuY3MgZHJtX21vZGVfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyA9IHsNCj4gKwkuZ2V0X21v
ZGVzID0gZHJtX21vZGVfY29ubmVjdG9yX2dldF9tb2RlcywNCj4gK307DQo+ICsNCj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBkcm1fbW9kZV9jb25uZWN0
b3JfZnVuY3MgPSB7DQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgaW50IGRybV9tb2RlX3Rlc3Rf
aW5pdChzdHJ1Y3Qga3VuaXQgKnRlc3QpDQo+ICt7DQo+ICsJc3RydWN0IGRybV9tb2RlX3Rl
c3RfcHJpdiAqcHJpdjsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJcHJpdiA9IGt1bml0X2t6
YWxsb2ModGVzdCwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFwcml2
KQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKwl0ZXN0LT5wcml2ID0gcHJpdjsNCj4gKw0K
PiArCXByaXYtPmRldiA9IHJvb3RfZGV2aWNlX3JlZ2lzdGVyKCJkcm0tbW9kZS10ZXN0Iik7
DQo+ICsJaWYgKElTX0VSUihwcml2LT5kZXYpKQ0KPiArCQlyZXR1cm4gUFRSX0VSUihwcml2
LT5kZXYpOw0KPiArDQo+ICsJcHJpdi0+ZHJtID0gZHJtX2Rldl9hbGxvYygmZHJtX21vZGVf
ZHJpdmVyLCBwcml2LT5kZXYpOw0KPiArCWlmIChJU19FUlIocHJpdi0+ZHJtKSkNCj4gKwkJ
cmV0dXJuIFBUUl9FUlIocHJpdi0+ZHJtKTsNCj4gKwlwcml2LT5kcm0tPm1vZGVfY29uZmln
LmZ1bmNzID0gJmRybV9tb2RlX2NvbmZpZ19mdW5jczsNCj4gKw0KPiArCXJldCA9IGRybW1f
bW9kZV9jb25maWdfaW5pdChwcml2LT5kcm0pOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVy
biByZXQ7DQo+ICsNCj4gKwlyZXQgPSBkcm1tX2Nvbm5lY3Rvcl9pbml0KHByaXYtPmRybSwg
JnByaXYtPmNvbm5lY3RvciwNCj4gKwkJCQkgICZkcm1fbW9kZV9jb25uZWN0b3JfZnVuY3Ms
DQo+ICsJCQkJICBEUk1fTU9ERV9DT05ORUNUT1JfVW5rbm93biwNCj4gKwkJCQkgIE5VTEwp
Ow0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsJZHJtX2Nvbm5lY3Rvcl9o
ZWxwZXJfYWRkKCZwcml2LT5jb25uZWN0b3IsICZkcm1fbW9kZV9jb25uZWN0b3JfaGVscGVy
X2Z1bmNzKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9p
ZCBkcm1fbW9kZV90ZXN0X2V4aXQoc3RydWN0IGt1bml0ICp0ZXN0KQ0KPiArew0KPiArCXN0
cnVjdCBkcm1fbW9kZV90ZXN0X3ByaXYgKnByaXYgPSB0ZXN0LT5wcml2Ow0KPiArDQo+ICsJ
ZHJtX2Rldl9wdXQocHJpdi0+ZHJtKTsNCj4gKwlyb290X2RldmljZV91bnJlZ2lzdGVyKHBy
aXYtPmRldik7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGRybV9tb2RlX3Jlc18xOTIw
XzEwODBfNjAoc3RydWN0IGt1bml0ICp0ZXN0KQ0KPiArew0KPiArCXN0cnVjdCBkcm1fbW9k
ZV90ZXN0X3ByaXYgKnByaXYgPSB0ZXN0LT5wcml2Ow0KPiArCXN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0gPSBwcml2LT5kcm07DQo+ICsJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciA9ICZwcml2LT5jb25uZWN0b3I7DQo+ICsJc3RydWN0IGRybV9jbWRsaW5lX21vZGUgKmNt
ZGxpbmVfbW9kZSA9ICZjb25uZWN0b3ItPmNtZGxpbmVfbW9kZTsNCj4gKwlzdHJ1Y3QgZHJt
X2Rpc3BsYXlfbW9kZSAqZXhwZWN0ZWRfbW9kZSwgKm1vZGU7DQo+ICsJY29uc3QgY2hhciAq
Y21kbGluZSA9ICIxOTIweDEwODBANjAiOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlleHBl
Y3RlZF9tb2RlID0gZHJtX21vZGVfZmluZF9kbXQocHJpdi0+ZHJtLCAxOTIwLCAxMDgwLCA2
MCwgZmFsc2UpOw0KPiArCUtVTklUX0FTU0VSVF9QVFJfTkUodGVzdCwgZXhwZWN0ZWRfbW9k
ZSwgTlVMTCk7DQo+ICsNCj4gKwlLVU5JVF9BU1NFUlRfVFJVRSh0ZXN0LA0KPiArCQkJICBk
cm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3RvcihjbWRsaW5lLA0KPiAr
CQkJCQkJCQkgICAgY29ubmVjdG9yLA0KPiArCQkJCQkJCQkgICAgY21kbGluZV9tb2RlKSk7
DQo+ICsNCj4gKwltdXRleF9sb2NrKCZkcm0tPm1vZGVfY29uZmlnLm11dGV4KTsNCj4gKwly
ZXQgPSBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoY29ubmVjdG9y
LCAxOTIwLCAxMDgwKTsNCj4gKwltdXRleF91bmxvY2soJmRybS0+bW9kZV9jb25maWcubXV0
ZXgpOw0KPiArCUtVTklUX0FTU0VSVF9HVCh0ZXN0LCByZXQsIDApOw0KPiArDQo+ICsJbW9k
ZSA9IGRybV9jb25uZWN0b3JfcGlja19jbWRsaW5lX21vZGUoY29ubmVjdG9yKTsNCj4gKwlL
VU5JVF9BU1NFUlRfUFRSX05FKHRlc3QsIG1vZGUsIE5VTEwpOw0KPiArDQo+ICsJS1VOSVRf
RVhQRUNUX1RSVUUodGVzdCwgZHJtX21vZGVfZXF1YWwoZXhwZWN0ZWRfbW9kZSwgbW9kZSkp
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgc3RydWN0IGt1bml0X2Nhc2UgZHJtX21vZGVfdGVz
dHNbXSA9IHsNCj4gKwlLVU5JVF9DQVNFKGRybV9tb2RlX3Jlc18xOTIwXzEwODBfNjApLA0K
PiArCXt9DQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgc3RydWN0IGt1bml0X3N1aXRlIGRybV9t
b2RlX3Rlc3Rfc3VpdGUgPSB7DQo+ICsJLm5hbWUgPSAiZHJtX21vZGUiLA0KPiArCS5pbml0
ID0gZHJtX21vZGVfdGVzdF9pbml0LA0KPiArCS5leGl0ID0gZHJtX21vZGVfdGVzdF9leGl0
LA0KPiArCS50ZXN0X2Nhc2VzID0gZHJtX21vZGVfdGVzdHMNCj4gK307DQo+ICsNCj4gK2t1
bml0X3Rlc3Rfc3VpdGUoZHJtX21vZGVfdGVzdF9zdWl0ZSk7DQo+ICtNT0RVTEVfQVVUSE9S
KCJNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Iik7DQo+ICtNT0RVTEVfTElD
RU5TRSgiR1BMIik7DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------jwHUsosnwnCAj7SiMT2ZIMis--

--------------K5MK8hIKXq0hvmNNdm47Ne03
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLo+QUFAwAAAAAACgkQlh/E3EQov+Dw
ehAAo57WBq6hH2Zz1nzgtREpyzTYk/4gUvYgvbVeM17lY5wUufic0jVrhFPBi/XHwjA6q6JXvTrP
LlvH7XbMxNh0pCNdzVD4D3Ev8Ke6zUNn17J9Dgjs9MEqQb6H26gPhv8MkrkXXhebyGnCqbxMkX+O
IBK0Te1aUKSbGwAdEVJLq4Q8A513afp1GE6g/H/2CTUZZuA2uissnEEm8yLSTr445KH3GaIbevBb
U/zvHP7fk4kdYv5gICKz1WllNeaQTDERHK25fWMMMM+2ieATTefvwZPYIMnhL/7SkqJjzfO1VIAW
boJuHrrSHzJigswPZYkCzS0zzj3XxMeXivNSRCNrBsmem2EbcjcmeIOlZigUY5TgGKbON8U2POXL
L4Fa9uyicuAAmRe5GreRcrEHBXR4i3+bE2fwcKk4MPT4bihgGcVcFBQx9XhS42quAO46O5x4eljE
+wI1l8lm9GtmEJQeNeYfjIwWofwJa+eoMNlgymHEw4XgiWQdgLYGFleAD7bDvsTI50Bkg693+reg
1bKOQ+0OEACQ8lGfvUGeSVaRH1jhFa4R4v9+J226lgYR5zVqPJCEcGLu0CKSGO8VkC1NuyUOIiz8
3DQkPPsl6sBw/K5r5tyCjlctdMA/WMUrwSzk1h2zdmAQshxeHW4MQxC7bhQZtLwvA83uLDOxsKbx
yMg=
=yTiW
-----END PGP SIGNATURE-----

--------------K5MK8hIKXq0hvmNNdm47Ne03--
