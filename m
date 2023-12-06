Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD59806986
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 09:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1888110E6BD;
	Wed,  6 Dec 2023 08:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3B910E6BD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 08:22:08 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9EF9021F48;
 Wed,  6 Dec 2023 08:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701850925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YQczaXs8PKJ+its+cEaYffQ9Mwq4ldCbvUAPZAwc534=;
 b=mV4xOWGw2T5J5ax10GThmWeABYx6pch8BQEmZ5yrLhZmZNfWVtWThWHBfEcwIxKU9ppSGe
 orDw7h3T2qKUogSuUuHeenvLArkZHgfE8f9zI5yZstG/Qnp4sUbh5MI3z05Mx8i4fFeY+j
 8/o7+QzcHJYO/5XKKI8P4jeH+a5B7Fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701850925;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YQczaXs8PKJ+its+cEaYffQ9Mwq4ldCbvUAPZAwc534=;
 b=otNOgmGelfaga99Kx+cx+WHqsZ3RS41Xt0j93KflHxtyrQ7PlrphIeYLj669a7CpfoS3tV
 jgexPOuqQ0YyKIBQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 82AC1133DD;
 Wed,  6 Dec 2023 08:22:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id f9+SHi0vcGWFIAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Dec 2023 08:22:05 +0000
Message-ID: <77925c2e-8cb2-473b-9dd0-3ce60a909066@suse.de>
Date: Wed, 6 Dec 2023 09:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/plane: fix error handling in
 __drm_universal_plane_init
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
References: <20231206072701.13276-1-dinghao.liu@zju.edu.cn>
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
In-Reply-To: <20231206072701.13276-1-dinghao.liu@zju.edu.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------la2JX688VsqBrOuGQu0IBMkD"
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 BAYES_HAM(-3.00)[100.00%]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,bootlin.com:url,zju.edu.cn:email];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -4.29
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
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
Cc: Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------la2JX688VsqBrOuGQu0IBMkD
Content-Type: multipart/mixed; boundary="------------WZzeJ0Ady0Fe1vY2SuGe7CgP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Message-ID: <77925c2e-8cb2-473b-9dd0-3ce60a909066@suse.de>
Subject: Re: [PATCH] drm/plane: fix error handling in
 __drm_universal_plane_init
References: <20231206072701.13276-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20231206072701.13276-1-dinghao.liu@zju.edu.cn>

--------------WZzeJ0Ady0Fe1vY2SuGe7CgP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMTIuMjMgdW0gMDg6Mjcgc2NocmllYiBEaW5naGFvIExpdToNCj4gX19k
cm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoKSBmcmVlcyBwbGFuZS0+Zm9ybWF0X3R5cGVzIGFu
ZA0KPiBwbGFuZS0+bW9kaWZpZXJzIG9uIGZhaWx1cmUuIEhvd2V2ZXIsIHNvbWV0aW1lcyBp
dHMgY2FsbGVycw0KPiB3aWxsIGZyZWUgdGhlc2UgdHdvIHBvaW50ZXJzIGFnYWluLCB3aGlj
aCBtYXkgbGVhZCB0byBhDQo+IGRvdWJsZS1mcmVlLiBPbmUgcG9zc2libGUgY2FsbCBjaGFp
biBpczoNCj4gDQo+IG1kcDVfcGxhbmVfaW5pdA0KPiAgICB8LT4gZHJtX3VuaXZlcnNhbF9w
bGFuZV9pbml0DQo+ICAgIHwgICAgIHwtPiBfX2RybV91bml2ZXJzYWxfcGxhbmVfaW5pdCAo
Zmlyc3QgZnJlZSkNCj4gICAgfA0KPiAgICB8LT4gbWRwNV9wbGFuZV9kZXN0cm95DQo+ICAg
ICAgICAgIHwtPiBkcm1fcGxhbmVfY2xlYW51cCAoc2Vjb25kIGZyZWUpDQo+IA0KPiBGaXgg
dGhpcyBieSBzZXR0aW5nIHRoZSB0d28gcG9pbnRlcnMgdG8gTlVMTCBhZnRlciBrZnJlZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IERpbmdoYW8gTGl1IDxkaW5naGFvLmxpdUB6anUuZWR1
LmNuPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQoNCnRvIGdldCB0aGUgaW1tZWRpYXRlIGJ1ZyBmaXhlZC4NCg0KSG93ZXZlciwg
SSBkb24ndCB0aGluayBpdCdzIHRoZSBjb3JyZWN0IHdheSBvZiBkb2luZyB0aGluZ3MgaW4g
Z2VuZXJhbC4gDQpQbGFuZXMgc2hvdWxkIHByb2JhYmx5IG5vdCBhdHRlbXB0IHRvIGV2ZW4g
bWFrZSBhIGNvcHksIGJ1dCB1c2UgdGhlIA0Kc3VwcGxpZWQgcG9pbnRlcnMuIExpZmV0aW1l
IG9mIHRoZSBhcnJheXMgaXMgdGhlIHNhbWUgYXMgb2YgdGhlIHBsYW5lLiANClRoYXQncyBm
b3IgYSBkaWZmZXJlbnQgcGF0Y2ggc2V0LCBvZiBjb3Vyc2UuICAoSSBkaWQgbm90IHJldmll
dyB0aGUgRFJNIA0KY29kZSB3aGV0aGVyIHRoZSBpbnRlcm5hbCBjb3B5IGlzIHJlcXVpcmVk
LikNCg0KRm9yIG5vdywgbWF5YmUgZHJtX3BsYW5lX2NsZWFudXAoKSBjb3VsZCB3YXJuIGlm
IGZvcm1hdF90eXBlcyBlcXVhbHMgDQpOVUxMLiBbMV0gSXQgaW5kaWNhdGVzIHRoYXQgdGhl
IHBsYW5lIGhhcyBub3QgYmVlbiBpbml0aWFsaXplZCBjb3JyZWN0bHkgDQphbmQgdGhlIGRy
aXZlcidzIG1lbW9yeSBsaWZldGltZSBoYW5kbGluZyBpcyBzb21laG93IGJyb2tlbi4NCg0K
QmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMjTDU0
Mg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyB8IDMgKysrDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxh
bmUuYw0KPiBpbmRleCAyNGU3OTk4ZDE3MzEuLjEzMzFiODIyNDkyMCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcGxhbmUuYw0KPiBAQCAtMzA0LDYgKzMwNCw3IEBAIHN0YXRpYyBpbnQgX19kcm1f
dW5pdmVyc2FsX3BsYW5lX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICAJaWYg
KGZvcm1hdF9tb2RpZmllcl9jb3VudCAmJiAhcGxhbmUtPm1vZGlmaWVycykgew0KPiAgIAkJ
RFJNX0RFQlVHX0tNUygib3V0IG9mIG1lbW9yeSB3aGVuIGFsbG9jYXRpbmcgcGxhbmVcbiIp
Ow0KPiAgIAkJa2ZyZWUocGxhbmUtPmZvcm1hdF90eXBlcyk7DQo+ICsJCXBsYW5lLT5mb3Jt
YXRfdHlwZXMgPSBOVUxMOw0KPiAgIAkJZHJtX21vZGVfb2JqZWN0X3VucmVnaXN0ZXIoZGV2
LCAmcGxhbmUtPmJhc2UpOw0KPiAgIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAgCX0NCj4gQEAg
LTMxNyw2ICszMTgsOCBAQCBzdGF0aWMgaW50IF9fZHJtX3VuaXZlcnNhbF9wbGFuZV9pbml0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAgCWlmICghcGxhbmUtPm5hbWUpIHsNCj4g
ICAJCWtmcmVlKHBsYW5lLT5mb3JtYXRfdHlwZXMpOw0KPiAgIAkJa2ZyZWUocGxhbmUtPm1v
ZGlmaWVycyk7DQo+ICsJCXBsYW5lLT5mb3JtYXRfdHlwZXMgPSBOVUxMOw0KPiArCQlwbGFu
ZS0+bW9kaWZpZXJzID0gTlVMTDsNCj4gICAJCWRybV9tb2RlX29iamVjdF91bnJlZ2lzdGVy
KGRldiwgJnBsYW5lLT5iYXNlKTsNCj4gICAJCXJldHVybiAtRU5PTUVNOw0KPiAgIAl9DQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2
LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVy
cywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVl
cm5iZXJnKQ0K

--------------WZzeJ0Ady0Fe1vY2SuGe7CgP--

--------------la2JX688VsqBrOuGQu0IBMkD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVwLywFAwAAAAAACgkQlh/E3EQov+BE
rw/7B0OUwP4s3ZZq2tOKgtd1RvaUlfezz4Lb2zuq1tBbdB3GZeJTj6FZuJcN6H9hKPsGlcmHbeWo
hI3EhA2fWX9NyFxEm3U6wR2Zo8eDwCUqxxMmiNPbygrlcjk91Y4gFvUxKBaA4EL0Veds/l0vPKKU
zpoU4alM7DAFZ25ih6IvVDHJKjcjMpyBf1Qp1wewebXOoue2Zob+LsuYBjmbRnoqcFXDUx/npkD/
kC/9LMVR2vptAQ8t4Hpq1AQkLBBhAcbty9NKTUxLfkzKvkuGlrN0KSZ/p+FhQghlxeskyBYQ+187
eY2Y5cntnc2iS779ZrjO2c3FbNNqdmmvE6e9drUABJxPn8vRudxhQpHHEHGFN5fH/WoZtBESu4ot
DKVp9Gj8MNd3zVs45RvyKqmnJiNCGhvfy5QURrkVFGuvshmugvJo9aA/H7ctAWTNKSs7MS+j+wBU
Va236FXnEqltAAdP4Bc7ztdAlQdeaki+gvBiN0ByuX00soX58bw5m+YPcV7iVyCO/euBkR3V9BrL
vSW7QEvXwJgVJaACEVFUtWPsgROMoMmDGicoUtBXqjRNRPtCuCsnsuvaKKwin1lc0Ua76KWo7IIo
m6jnhq8deiFTjKme6E2i974JfA9NInWneJFoiymyP8YEY3WApEcGzQMbwnGxHXCRWWNaK9HWBmVr
esg=
=QpfB
-----END PGP SIGNATURE-----

--------------la2JX688VsqBrOuGQu0IBMkD--
