Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71867B9B76
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 09:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A0110E3D3;
	Thu,  5 Oct 2023 07:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F6A10E1BB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 07:44:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 587E71F8C1;
 Thu,  5 Oct 2023 07:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696491884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6Fiw1QxWqAmbnUUUEcuKx0CG3fBEsJS495hprxqjYac=;
 b=xAOCwKzdRrM6ImgS0E70wSwEHxqJGNvgkx4MdGrA9CkgoYf5HayXu4l7mDt9wRSfB4XeCQ
 RUZdMdwXr6vUNGX69TmatzjZeq8V1/DTKRpZ5FgePbIsy7D3pKMOXhcU7vHQalwoADV9qH
 LuS8u6/8qbED3lvZ1cxYc8aWTMeK++k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696491884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6Fiw1QxWqAmbnUUUEcuKx0CG3fBEsJS495hprxqjYac=;
 b=VUcRuG66ejbNj2wAGn4YE9vaLEmeZ3HJoA3RXBglmQ3wGkpGkgpOir3jBfaGYaeeGlGeiJ
 vGZRk7lrcfZ+/DCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6D8A139C2;
 Thu,  5 Oct 2023 07:44:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iXn5M2tpHmWbRAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Oct 2023 07:44:43 +0000
Message-ID: <fed1cbf3-0926-4895-a8ba-d6fa9fd53dbe@suse.de>
Date: Thu, 5 Oct 2023 09:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
Content-Language: en-US
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 Matthew Wilcox <willy@infradead.org>
References: <13360591.uLZWGnKmhe@natalenko.name>
 <2300189.ElGaqSPkdT@natalenko.name> <ZRrUjcWqtmzPV3Fs@casper.infradead.org>
 <2160215.irdbgypaU6@natalenko.name>
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
In-Reply-To: <2160215.irdbgypaU6@natalenko.name>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------72PmBn0Mbk7dBZYhSA00TrME"
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------72PmBn0Mbk7dBZYhSA00TrME
Content-Type: multipart/mixed; boundary="------------irKYM1Z83udZBdlPGECxWYUo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 Matthew Wilcox <willy@infradead.org>
Cc: Linux Regressions <regressions@lists.linux.dev>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 Maxime Ripard <mripard@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Message-ID: <fed1cbf3-0926-4895-a8ba-d6fa9fd53dbe@suse.de>
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
References: <13360591.uLZWGnKmhe@natalenko.name>
 <2300189.ElGaqSPkdT@natalenko.name> <ZRrUjcWqtmzPV3Fs@casper.infradead.org>
 <2160215.irdbgypaU6@natalenko.name>
In-Reply-To: <2160215.irdbgypaU6@natalenko.name>

--------------irKYM1Z83udZBdlPGECxWYUo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMTAuMjMgdW0gMTc6Mzggc2NocmllYiBPbGVrc2FuZHIgTmF0YWxlbmtv
Og0KPiBPbiBwb25kxJtsw60gMi4gxZnDrWpuYSAyMDIzIDE2OjMyOjQ1IENFU1QgTWF0dGhl
dyBXaWxjb3ggd3JvdGU6DQo+PiBPbiBNb24sIE9jdCAwMiwgMjAyMyBhdCAwMTowMjo1MlBN
ICswMjAwLCBPbGVrc2FuZHIgTmF0YWxlbmtvIHdyb3RlOg0KPj4+Pj4+PiBCVUc6IEtGRU5D
RTogbWVtb3J5IGNvcnJ1cHRpb24gaW4gZHJtX2dlbV9wdXRfcGFnZXMrMHgxODYvMHgyNTAN
Cj4+Pj4+Pj4NCj4+Pj4+Pj4gQ29ycnVwdGVkIG1lbW9yeSBhdCAweDAwMDAwMDAwZTE3M2Ey
OTQgWyAhICEgISAhICEgISAhICEgISAhICEgISAhICEgISAhIF0gKGluIGtmZW5jZS0jMTA4
KToNCj4+Pj4+Pj4gICBkcm1fZ2VtX3B1dF9wYWdlcysweDE4Ni8weDI1MA0KPj4+Pj4+PiAg
IGRybV9nZW1fc2htZW1fcHV0X3BhZ2VzX2xvY2tlZCsweDQzLzB4YzANCj4+Pj4+Pj4gICBk
cm1fZ2VtX3NobWVtX29iamVjdF92dW5tYXArMHg4My8weGUwDQo+Pj4+Pj4+ICAgZHJtX2dl
bV92dW5tYXBfdW5sb2NrZWQrMHg0Ni8weGIwDQo+Pj4+Pj4+ICAgZHJtX2ZiZGV2X2dlbmVy
aWNfaGVscGVyX2ZiX2RpcnR5KzB4MWRjLzB4MzEwDQo+Pj4+Pj4+ICAgZHJtX2ZiX2hlbHBl
cl9kYW1hZ2Vfd29yaysweDk2LzB4MTcwDQo+Pj4NCj4+PiBNYXR0aGV3LCBiZWZvcmUgSSBz
dGFydCBkYW5jaW5nIGFyb3VuZCwgZG8geW91IHRoaW5rIF5eIGNvdWxkIGhhdmUgdGhlIHNh
bWUgY2F1c2UgYXMgMGI2MmFmMjhmMjQ5YjljNDAzNmEwNWFjZmIwNTMwNThkYzAyZTJlMiB3
aGljaCBnb3QgZml4ZWQgYnkgODYzYThlYjNmMjcwOThiNDI3NzJmNjY4ZTM5NzdmZjRjYWUx
MGIwND8NCj4+DQo+PiBZZXMsIGVudGlyZWx5IHBsYXVzaWJsZS4gIEkgdGhpbmsgeW91IGhh
dmUgdHdvIHVzZWZ1bCBwb2ludHMgdG8gbG9vayBhdA0KPj4gYmVmb3JlIGRlbHZpbmcgaW50
byBhIGZ1bGwgYmlzZWN0IC0tIDg2M2E4ZSBhbmQgdGhlIHBhcmVudCBvZiAwYjYyYWYuDQo+
PiBJZiBlaXRoZXIgb2YgdGhlbSB3b3JrLCBJIHRoaW5rIHlvdSBoYXZlIG5vIG1vcmUgd29y
ayB0byBkby4NCj4gDQo+IE9LLCBJJ3ZlIGRpZCB0aGlzIGFnYWluc3QgdjYuNS41Og0KPiAN
Cj4gYGBgDQo+IGdpdCBsb2cgLS1vbmVsaW5lIEhFQUR+My4uDQo+IDdjMWU3Njk1Y2E5Yjgg
KEhFQUQgLT4gdGVzdCkgUmV2ZXJ0ICJtbTogcmVtb3ZlIHN0cnVjdCBwYWdldmVjIg0KPiA4
ZjJhZDUzYjZlYWM2IFJldmVydCAibW06IHJlbW92ZSBjaGVja19tb3ZlX3VuZXZpY3RhYmxl
X3BhZ2VzKCkiDQo+IGZhMWUzYzBiNTQ1M2MgUmV2ZXJ0ICJkcm06IGNvbnZlcnQgZHJtX2dl
bV9wdXRfcGFnZXMoKSB0byB1c2UgYSBmb2xpb19iYXRjaCINCj4gYGBgDQo+IA0KPiB0aGVu
IHJlYm9vdGVkIHRoZSBob3N0IG11bHRpcGxlIHRpbWVzLCBhbmQgdGhlIGlzc3VlIGlzIG5v
dCBzZWVuIGFueSBtb3JlLg0KPiANCj4gU28gSSBndWVzcyAzMjkxZTA5YTQ2Mzg3MDYxMGI4
MjI3ZjMyYjE2YjE5YTU4N2VkZjMzIGlzIHRoZSBjdWxwcml0Lg0KDQpJZ25vcmUgbXkgb3Ro
ZXIgZW1haWwuIEl0J3MgYXBwYXJlbnRseSBiZWVuIGZpeGVkIGFscmVhZHkuIFRoYW5rcyEN
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gVGhhbmtzLg0KPiANCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYx
IE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRy
ZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcp
DQo=

--------------irKYM1Z83udZBdlPGECxWYUo--

--------------72PmBn0Mbk7dBZYhSA00TrME
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUeaWsFAwAAAAAACgkQlh/E3EQov+C8
IQ//f7UtB0BiFOP/urp8ifj2BA++IH7AahthXC/eA6+2pPwYjw/fe9YrnNsXHKZkmRoa+txpuWSO
IqfBW945oex2UlDLbj1vlaZ4aGlPDxnRwcGbabDtsZ6G/tGVquNiLTSmetw/tigqXEIoH1w75zdS
zUBPyCLzeyfjHEdEu6A/HbaP7jhr7+ueRJxx9r2EVyP4CEZ4RI4ZepOMf0DuANhXUZ1Cu0ut3KiU
ncNevZo+WHor0sZq1bNWzJ9CUgNk0sqZux8KPnd5kOxzK3BiTivKoLJGOmjA3SeanTipgLEu+aK+
Dyjm/v211t64CXuw0pAaGG0Ha/moJ9XSd/r9NiKFxfvs1tsV/+vFjiXZbInjzIj43YhNpywfMcGF
MzV+hmEhMqugK0P/Holb1s5MQJbR6Bq8FE8lMeK3lxC3c0/71hcGyK/PwPJXLXinFmVIGw74Qg7E
jVKHdCxgM1Q/gbPuaeX+o4xD+DbJlqYofv+XBMpOJtcPQ/OsdGGW1+S/fR33yNwJ11k3E/Nphji/
Amv1gluY6iTqaHmIJfnsBAA+Z0Q6dgTKhue771qOyYu4uIoK6bFnv7yx9iXBe9khb3LOIIlselMZ
CQoPI57RQr1N8QA3UZ3VYC4NqTRgNcXhAxNVLpwVlNrGjIm17nrbB/BlC0NlrBHLkNeRE7lck58Z
rRo=
=C3sp
-----END PGP SIGNATURE-----

--------------72PmBn0Mbk7dBZYhSA00TrME--
