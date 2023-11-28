Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEB17FB34D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 08:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E4C10E438;
	Tue, 28 Nov 2023 07:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E6210E438
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 07:54:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C64352192D;
 Tue, 28 Nov 2023 07:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701158039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P0t7Nazp0pVdLY/tQj8PI1fxPMGuIkHpypLb3s65qRw=;
 b=mmlHlJQLsWrWNe/CRzVzzKzWUufXkwZk8xwfzoDMc6om/GYjqUhsVDOD+ceAO5LdVHQpAR
 EZgs/nzJ3VxHB3nz+lYrsOmpWPkD7FtdB8Kw/Rn/Ne/P4ZtKhEo5VKnNWVynDNJIgX2JL7
 I5W7xg7BZ3+J17X8SQzMIz6X9e3vgsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701158039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P0t7Nazp0pVdLY/tQj8PI1fxPMGuIkHpypLb3s65qRw=;
 b=gNBTNG0Puja0pthv4upu3BpTS8Itxraz3+J9NECm/OHl2QlJnigYEAV717Zw3bPx2wRP1o
 Vk4w/KCCsb7clgDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8DD2E133B5;
 Tue, 28 Nov 2023 07:53:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id OAxuIJecZWWCNgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Nov 2023 07:53:59 +0000
Message-ID: <e46ab024-ef95-4f6b-897f-40d6f2846be5@suse.de>
Date: Tue, 28 Nov 2023 08:53:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: lcdif: Switch to drmm_mode_config_init
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20231127212638.77688-1-marex@denx.de>
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
In-Reply-To: <20231127212638.77688-1-marex@denx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5pKiDAyUQfqkcOUsxDkvWZSQ"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.09
X-Spamd-Result: default: False [-5.09 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 RCVD_COUNT_THREE(0.00)[3]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[8]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,infradead.org:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5pKiDAyUQfqkcOUsxDkvWZSQ
Content-Type: multipart/mixed; boundary="------------uxqJ5bRohfdyklQbYrP9TkRE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <e46ab024-ef95-4f6b-897f-40d6f2846be5@suse.de>
Subject: Re: [PATCH] drm: lcdif: Switch to drmm_mode_config_init
References: <20231127212638.77688-1-marex@denx.de>
In-Reply-To: <20231127212638.77688-1-marex@denx.de>

--------------uxqJ5bRohfdyklQbYrP9TkRE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI3LjExLjIzIHVtIDIyOjI2IHNjaHJpZWIgTWFyZWsgVmFzdXQ6DQo+IFN3aXRj
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
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbGNkaWZfZHJ2LmMgfCA3ICsrKysrLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9sY2RpZl9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9teHNmYi9sY2RpZl9kcnYuYw0KPiBpbmRleCAxOGRlMmYxN2UyNDkxLi5lYTEw
YmY4MTU4MmU5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbGNkaWZf
ZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL214c2ZiL2xjZGlmX2Rydi5jDQo+IEBA
IC0xNjcsNyArMTY3LDExIEBAIHN0YXRpYyBpbnQgbGNkaWZfbG9hZChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtKQ0KPiAgIAkJcmV0dXJuIHJldDsNCj4gICANCj4gICAJLyogTW9kZXNldCBp
bml0ICovDQo+IC0JZHJtX21vZGVfY29uZmlnX2luaXQoZHJtKTsNCj4gKwlyZXQgPSBkcm1t
X21vZGVfY29uZmlnX2luaXQoZHJtKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIo
ZHJtLT5kZXYsICJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBtb2RlIGNvbmZpZ1xuIik7DQo+ICsJ
CXJldHVybiByZXQ7DQo+ICsJfQ0KPiAgIA0KPiAgIAlyZXQgPSBsY2RpZl9rbXNfaW5pdChs
Y2RpZik7DQo+ICAgCWlmIChyZXQgPCAwKSB7DQo+IEBAIC0yMjcsNyArMjMxLDYgQEAgc3Rh
dGljIHZvaWQgbGNkaWZfdW5sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pDQo+ICAgCWRy
bV9jcnRjX3ZibGFua19vZmYoJmxjZGlmLT5jcnRjKTsNCj4gICANCj4gICAJZHJtX2ttc19o
ZWxwZXJfcG9sbF9maW5pKGRybSk7DQo+IC0JZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJt
KTsNCj4gICANCj4gICAJcG1fcnVudGltZV9wdXRfc3luYyhkcm0tPmRldik7DQo+ICAgCXBt
X3J1bnRpbWVfZGlzYWJsZShkcm0tPmRldik7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1h
bnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3Vk
aWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------uxqJ5bRohfdyklQbYrP9TkRE--

--------------5pKiDAyUQfqkcOUsxDkvWZSQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVlnJcFAwAAAAAACgkQlh/E3EQov+A8
aw//ceBwbfDVa9Fwxq/Wskcjb8kP0G3n10gYLIToPfpzsjgQjwT5vDrCXBUGYc8X5n78696emOIc
A0RkxrSyUktBhdLTUYlwbsSuONDrn7toUlEKV/NT+Q0WuRJuoxA0CF82uRPsZyEZcaXeTArjRg5x
sb8yxzk+hVMouNiH3C128iIFszGwnas9TFACqmRPuqNfOUCB5ofm9quwBUasBVjoifEqOga3O7s7
8IDwJ7nxl9gwhMNXxGmo/QZAYDWNWRAwh8+XZpYd+i2RZ/qjAhKjstdIHnqB5jQb1exfOoDKTmAH
jNbQ4be6Iwa995obtDZnygqzBvXDrVd+/8XF/R3bAwfwXjWvwaHKZuG4klkSJQPrLThztYF+eUdg
F9Bje0Va5ZYPga80a0wWngRPF/3OQyPzWq9GCTQkcxNauoqJT54yPZXWKl6xdiwyxeg9FbHXk9pG
RdhmhQZ62IlnSWdGhK7MbHXZOtcFDZ2z6zyusAwQ9vDrHBAm/gsFAsMfXi8J4kbkGDxHrdFb9ANO
Ao/rwORc+4i5iOtL4hR4VO3NElwDalx97mOilNrT8+dlu4DhLyOTLMHKNz3iU+E08hY3N8nhD/BM
7dnhlrTvpQC4N3d+N8zFqZcSiKFw6peR+GEmOl8n3g3itDCsi9Ok77FPifBhn96cwAoYwfBX4Op5
Y+w=
=3svz
-----END PGP SIGNATURE-----

--------------5pKiDAyUQfqkcOUsxDkvWZSQ--
