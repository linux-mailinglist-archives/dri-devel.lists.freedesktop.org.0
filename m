Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9DF7FB5D3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 10:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC85710E469;
	Tue, 28 Nov 2023 09:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A7110E469
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 09:31:14 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 36ADA21989;
 Tue, 28 Nov 2023 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701163871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CxnslxgsQDZ0yNYNWQHF8/y7lmNcof7qD6h6S5Wk6ro=;
 b=e892FWTY9xnYxtcnxuLVFBaKIcAQW9kr2Fx2JsvWP2dCXDDI4kTSDnGSe0ghwXZwukch78
 +KNFHTt9P5YfPMUCFrjZKJMvBPYZs+NA8p5Rmfy5dw1oBpgNaaj8fmKURiGVWfrEK2wzMS
 cYkUwtQvSlG/bfgrOccxLS86vZ+V+LU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701163871;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CxnslxgsQDZ0yNYNWQHF8/y7lmNcof7qD6h6S5Wk6ro=;
 b=8ibmHYYcjBQqnSEqDAr8PRt4DH0kFvHOluknfqFsswiNildda4Y/K2RMb9D9XzxCivStxX
 vO/xvdsbC3TlNLAg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D361A139FC;
 Tue, 28 Nov 2023 09:31:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id GWbiMV6zZWUPUwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Nov 2023 09:31:10 +0000
Message-ID: <0dd95ae0-1d33-4fbc-9393-0f93e59c0141@suse.de>
Date: Tue, 28 Nov 2023 10:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mxsfb: Switch to drmm_mode_config_init
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Marek Vasut <marex@denx.de>
References: <20231127212612.77667-1-marex@denx.de>
 <viqwqsyiymnlx6rbt6grpzeac5sdac3wn54xt32p42y3vigopw@gte4gbsiwjt6>
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
In-Reply-To: <viqwqsyiymnlx6rbt6grpzeac5sdac3wn54xt32p42y3vigopw@gte4gbsiwjt6>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HIvdoJZYmgjOmOH0aOKT9wFF"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -9.09
X-Spamd-Result: default: False [-9.09 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 MIME_BASE64_TEXT(0.10)[]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[13];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,denx.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,ffwll.ch,gmail.com,linux.intel.com,nxp.com,pengutronix.de,kernel.org,agner.ch,lists.infradead.org];
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
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HIvdoJZYmgjOmOH0aOKT9wFF
Content-Type: multipart/mixed; boundary="------------eKxjLyXPsOgv1ENtdp0FsEcc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Agner <stefan@agner.ch>, linux-arm-kernel@lists.infradead.org
Message-ID: <0dd95ae0-1d33-4fbc-9393-0f93e59c0141@suse.de>
Subject: Re: [PATCH v2] drm/mxsfb: Switch to drmm_mode_config_init
References: <20231127212612.77667-1-marex@denx.de>
 <viqwqsyiymnlx6rbt6grpzeac5sdac3wn54xt32p42y3vigopw@gte4gbsiwjt6>
In-Reply-To: <viqwqsyiymnlx6rbt6grpzeac5sdac3wn54xt32p42y3vigopw@gte4gbsiwjt6>

--------------eKxjLyXPsOgv1ENtdp0FsEcc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMTEuMjMgdW0gMDk6Mjcgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBI
aSwNCj4gDQo+IE9uIE1vbiwgTm92IDI3LCAyMDIzIGF0IDEwOjI1OjM4UE0gKzAxMDAsIE1h
cmVrIFZhc3V0IHdyb3RlOg0KPj4gU3dpdGNoIGZyb20gZGVwcmVjYXRlZCB1bm1hbmFnZWQg
ZHJtX21vZGVfY29uZmlnX2luaXQoKSB0bw0KPj4gbWFuYWdlZCBkcm1tX21vZGVfY29uZmln
X2luaXQoKS4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
TWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+PiAtLS0NCj4+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGdt
YWlsLmNvbT4NCj4+IENjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+
PiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT4NCj4+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+PiBD
YzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPg0KPj4gQ2M6IFBlbmd1dHJv
bml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+PiBDYzogU2FzY2hh
IEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPj4gQ2M6IFNoYXduIEd1byA8c2hh
d25ndW9Aa2VybmVsLm9yZz4NCj4+IENjOiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5j
aD4NCj4+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBDYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IA0KPiBUaGlzIGlzIG9ubHkgc29tZXdo
YXQgcmVsYXRlZCB0byB0aGF0IHBhdGNoLCBidXQgbWtzZmJfZHJtX3ByaXZhdGUgaXMNCj4g
YWxsb2NhdGVkIHdpdGggZGV2bSBhbmQgaG9sZHMgdGhlIHBsYW5lcywgY3J0Y3MgYW5kIGVu
Y29kZXJzLiBUaGlzIGlzDQo+IHVuc2FmZSwgbGVhZHMgdG8gVUFGLCBhbmQgc2hvdWxkIGJl
IGNvbnZlcnRlZCB0byBhIGRybW0gYWxsb2NhdGlvbiB0b28NCj4gKGluIGFub3RoZXIgcGF0
Y2ggb2YgY291cnNlKQ0KDQpUbyBhZGQgdG8gdGhpcywgdGhlIHdob2xlIGRyaXZlcidzIHBy
b2JlL3JlbW92ZSBzaG91bGQgYmUgY29udmVydGVkIHRvIA0KbWFuYWdlZCBjb2RlLiBUaGVy
ZSdzIGlycSBhbmQgcG0gY29kZSB0aGF0IGNvdWxkIGxpa2VseSBiZSB1cGRhdGVkLiANCk1h
cmVrLCBpZiB5b3UgaGF2ZSB0aGUgbWVhbnMsIHBhdGNoZXMgYXJlIHdlbGNvbWUuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IE1heGltZQ0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------eKxjLyXPsOgv1ENtdp0FsEcc--

--------------HIvdoJZYmgjOmOH0aOKT9wFF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVls14FAwAAAAAACgkQlh/E3EQov+Cd
hBAAiXCWzF5rlJw/rVeubyZnMm5TxIk0jAS1ipwWOCdSKeryC69kBmujJU8AnOnEnVNqMJUcxNC1
kRD3evGSmm//dDH8OzHQwzEALuklI38fUYX59OOqu1B1H/Lgs27RGmWtRdKp7xKsSV71Y5I82El3
+LgRcxyWVF78A7oPH+NRaK8rJ02DaUivi8nK8FUBVPLsQ2XkUx+JBVbxRZiY1GD6P7RunnypwUT8
mex84nr7G4Mfy6Lz5AplUbl1ux+2z5/4tzBkvKaOn/4FPdz/D1g0NQbWD3ni96CIjklWvknZiGV8
jlWQjiss6KX8zkS7/9ltkTN0QkeHwpH0/2WYGizGaX6fF+aIgwBXnFGMU8YwRIa/L8jXZq9YMBaz
2EOJmZVpejJb+b3i/VTle/fabxUgEj0E4JZH3rr2JnyajXXoawL699W5RD+kGpIwpDP2mRkY0Va3
z0a4Hja06U0Zar499FhIgqowXrIdSfj8l16Vx1KGxGA8gUEclP1/JT+vHljENUzL50PphdFXyixy
aVB298/WZbLuqa5/OZUyusPc60hg1D0vI1DMOJVctpq6wUBOcCfLY+CySD0CBjHG7miGqO1WvPcf
Ergg1ZjiEoMvOIweq7J74gZdNBxnD2ZreRz4DQG9fjf5yPze7E9cQNOPizRD1Fb5op04R++JhnSu
oAE=
=nBJf
-----END PGP SIGNATURE-----

--------------HIvdoJZYmgjOmOH0aOKT9wFF--
