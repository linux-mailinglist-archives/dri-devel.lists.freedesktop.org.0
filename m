Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A067D7FB33F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 08:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B7810E437;
	Tue, 28 Nov 2023 07:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CAF10E437
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 07:53:13 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C8D001F38D;
 Tue, 28 Nov 2023 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701157991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MSLH1wWFKNwrnC3ixq4+6hQLkvaMpdv5HIgJF4WBAs4=;
 b=wvLC9Vbma3d6Wms8Fa8a+AUoLoW8k8EExnqHbcIWsIMLRaTsVJB9aByD51PI9SoIRP/ENn
 wTdre4PvT/f+0W0eFO48q7IUaWaB6inTQYrVwbUkaUTyJXKKCyQFH6ZZdH0lNMHAKnaDci
 2H9Ltx4kZrPaGWnbS8qEruHsRLsbgNs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701157991;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MSLH1wWFKNwrnC3ixq4+6hQLkvaMpdv5HIgJF4WBAs4=;
 b=ds2rYFse499m/vvk3nQ0y8NsxMhwUhtHeKRBCzVbGAR4zHUqEj/pBJ7u7X1w7LoMmNnDCC
 k0Wh8GBcNyR5IUBg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 813B2133B5;
 Tue, 28 Nov 2023 07:53:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id fLqCHmecZWWCNgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Nov 2023 07:53:11 +0000
Message-ID: <e566d2fa-8607-42e4-a152-ad32f023bcfe@suse.de>
Date: Tue, 28 Nov 2023 08:53:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mxsfb: Switch to drmm_mode_config_init
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20231127212612.77667-1-marex@denx.de>
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
In-Reply-To: <20231127212612.77667-1-marex@denx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qFDOS4KIIS4260p5cTv4dDSg"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.09
X-Spamd-Result: default: False [-5.09 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 RCVD_COUNT_THREE(0.00)[3]; MIME_BASE64_TEXT(0.10)[];
 SIGNED_PGP(-2.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[13];
 DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,linux.intel.com,kernel.org,nxp.com,pengutronix.de,agner.ch,lists.infradead.org];
 RCVD_TLS_ALL(0.00)[]
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qFDOS4KIIS4260p5cTv4dDSg
Content-Type: multipart/mixed; boundary="------------UhXpgbOfrMqV5dkH9SNa2e8Q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Agner <stefan@agner.ch>, linux-arm-kernel@lists.infradead.org
Message-ID: <e566d2fa-8607-42e4-a152-ad32f023bcfe@suse.de>
Subject: Re: [PATCH v2] drm/mxsfb: Switch to drmm_mode_config_init
References: <20231127212612.77667-1-marex@denx.de>
In-Reply-To: <20231127212612.77667-1-marex@denx.de>

--------------UhXpgbOfrMqV5dkH9SNa2e8Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI3LjExLjIzIHVtIDIyOjI1IHNjaHJpZWIgTWFyZWsgVmFzdXQ6DQo+IFN3aXRj
aCBmcm9tIGRlcHJlY2F0ZWQgdW5tYW5hZ2VkIGRybV9tb2RlX2NvbmZpZ19pbml0KCkgdG8N
Cj4gbWFuYWdlZCBkcm1tX21vZGVfY29uZmlnX2luaXQoKS4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4N
Cj4gLS0tDQo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPg0KPiBDYzogRmFiaW8gRXN0ZXZhbSA8
ZmVzdGV2YW1AZ21haWwuY29tPg0KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBh
cmRAa2VybmVsLm9yZz4NCj4gQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNv
bT4NCj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXgu
ZGU+DQo+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+IENj
OiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+IENjOiBTdGVmYW4gQWduZXIg
PHN0ZWZhbkBhZ25lci5jaD4NCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBD
YzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQoNCkFja2VkLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gVjI6
IERyb3AgbWF0Y2hpbmcgZHJtX21vZGVfY29uZmlnX2NsZWFudXANCj4gLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIHwgNyArKysrKy0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMNCj4gaW5kZXggM2JmYTM2OWIyNTA3ZS4uY2ZhMzE3
NmViZTJjMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Ry
di5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYw0KPiBAQCAt
MjQ4LDcgKzI0OCwxMSBAQCBzdGF0aWMgaW50IG14c2ZiX2xvYWQoc3RydWN0IGRybV9kZXZp
Y2UgKmRybSwNCj4gICAJcG1fcnVudGltZV9lbmFibGUoZHJtLT5kZXYpOw0KPiAgIA0KPiAg
IAkvKiBNb2Rlc2V0IGluaXQgKi8NCj4gLQlkcm1fbW9kZV9jb25maWdfaW5pdChkcm0pOw0K
PiArCXJldCA9IGRybW1fbW9kZV9jb25maWdfaW5pdChkcm0pOw0KPiArCWlmIChyZXQpIHsN
Cj4gKwkJZGV2X2Vycihkcm0tPmRldiwgIkZhaWxlZCB0byBpbml0aWFsaXplIG1vZGUgY29u
ZmlnXG4iKTsNCj4gKwkJZ290byBlcnJfdmJsYW5rOw0KPiArCX0NCj4gICANCj4gICAJcmV0
ID0gbXhzZmJfa21zX2luaXQobXhzZmIpOw0KPiAgIAlpZiAocmV0IDwgMCkgew0KPiBAQCAt
MzExLDcgKzMxNSw2IEBAIHN0YXRpYyBpbnQgbXhzZmJfbG9hZChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtLA0KPiAgIHN0YXRpYyB2b2lkIG14c2ZiX3VubG9hZChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtKQ0KPiAgIHsNCj4gICAJZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKGRybSk7DQo+
IC0JZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsNCj4gICANCj4gICAJcG1fcnVudGlt
ZV9nZXRfc3luYyhkcm0tPmRldik7DQo+ICAgCW14c2ZiX2lycV91bmluc3RhbGwoZHJtKTsN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAx
NDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15
ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBO
dWVybmJlcmcpDQo=

--------------UhXpgbOfrMqV5dkH9SNa2e8Q--

--------------qFDOS4KIIS4260p5cTv4dDSg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVlnGcFAwAAAAAACgkQlh/E3EQov+AO
uA/+LEBo31lXqTVnO4rf9qO3lczBvsSBVE4CsXrWRI4AgQRub880iKNk651rh2BepFbn7KSpxBMn
0OsctWDrAgzCEvel3gXn0OgFwl2Aw+SgRwfIHvmfVbs8RFHWeBzqgodrNv71gkq4zCqfzoQhi5jj
s94+DQvf98ugY23rvHisB9U+4OBazGyJD2eMytpCTaeX/mxnT/ozraX1rHuAaP2pAHQfq2jHR4/Z
4XUIfiH8mX5b0oHD06MhZVN5r9tKTQyIuqv9UM4zGfIt+SjFMWrhZHRdcdkbVTcexCCQ1ojP7o0D
QdEEDdCxCmEYIkulIlVl9m9wMwRQ8j10OVc1mBcRfelBrrf2LLLQGanXh91JUxo0r+oILP0n7glO
r8G49HvWKVe4bVbTNdHAt5Pj3mRfo8O+uWb3eqsBsiaV5BnCbafINZWq/q6nS0Tq8RMyY8boWe09
o7tjHc1BMOa2GN5iQj+J+oI/stYQcLiFLbpQuasFaBy8mWjE9tYQM6GbG2TIyWSaz95RqOiIuWXv
bkguL79RhuTSJ7FuERmm61ntmen0zmQ4XQ4PrTb7vVnd60lErsAwecH+tQV1iQAw6UfVDdf9KcJI
FMcejjebyvjGrTSCRgGb3RxdY0i68HOvuX5gYoGQI5it4dV8eYROXl6p/nJzZIlZKPPQt0zS6q/K
g3Y=
=LS5S
-----END PGP SIGNATURE-----

--------------qFDOS4KIIS4260p5cTv4dDSg--
