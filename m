Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD6B7F11F9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 12:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A49A10E39F;
	Mon, 20 Nov 2023 11:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7195910E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 11:29:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 864441F85D;
 Mon, 20 Nov 2023 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700479787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F4vJXyYyx4PKDOE1oTUwTNljyWQfMCua7+2bkVkhQsM=;
 b=Sh875DbSQpgjOfXrGI3a2446y/EiV6pRDrmzBTbf1hq65B4HGVf+raFtlcrf3Lbrx8Yacs
 Cw8Qo6/MtLNU7BiHE7HTTnbrpmPI0VNJuqxyc9XbfkWI0lq0XuvlCnSUy6/Ch/DI4yQt+7
 kbh8AkusBNB5JQj6I8zrT8n24eJ4fbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700479787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F4vJXyYyx4PKDOE1oTUwTNljyWQfMCua7+2bkVkhQsM=;
 b=6yVY8yRiZmZptSpDBE3ZiqQaMtWjLJ1vBOjcyxeZ9/sgFTeXDcTW+PIk09fCYeP5fYyw/X
 JN2poACRXz+TDpCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F08013499;
 Mon, 20 Nov 2023 11:29:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Cy7EFStDW2WrOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Nov 2023 11:29:47 +0000
Message-ID: <b76d22af-9b22-4869-bd68-3311bac3a7db@suse.de>
Date: Mon, 20 Nov 2023 12:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/32] media/ivtvfb: Initialize fb_ops to fbdev I/O-memory
 helpers
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, deller@gmx.de, javierm@redhat.com
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-21-tzimmermann@suse.de>
 <3103e3a1-7dfd-4db0-b67e-b8857b8027e7@xs4all.nl>
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
In-Reply-To: <3103e3a1-7dfd-4db0-b67e-b8857b8027e7@xs4all.nl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------th4kWWp1ZDcYmoeqYHDz4X0N"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -9.29
X-Spamd-Result: default: False [-9.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de,xs4all.nl];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[8]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[xs4all.nl,gmx.de,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
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
Cc: linux-fbdev@vger.kernel.org, Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------th4kWWp1ZDcYmoeqYHDz4X0N
Content-Type: multipart/mixed; boundary="------------Y3wD0kn1if6ZFoVnVaBfgcO0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans Verkuil <hverkuil@xs4all.nl>, deller@gmx.de, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Message-ID: <b76d22af-9b22-4869-bd68-3311bac3a7db@suse.de>
Subject: Re: [PATCH 20/32] media/ivtvfb: Initialize fb_ops to fbdev I/O-memory
 helpers
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-21-tzimmermann@suse.de>
 <3103e3a1-7dfd-4db0-b67e-b8857b8027e7@xs4all.nl>
In-Reply-To: <3103e3a1-7dfd-4db0-b67e-b8857b8027e7@xs4all.nl>

--------------Y3wD0kn1if6ZFoVnVaBfgcO0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTEuMjMgdW0gMDk6NTIgc2NocmllYiBIYW5zIFZlcmt1aWw6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIDE1LzExLzIwMjMgMTE6MTksIFRob21hcyBaaW1tZXJtYW5u
IHdyb3RlOg0KPj4gSW5pdGlhbGl6ZSB0aGUgaW5zdGFuY2Ugb2Ygc3RydWN0IGZiX29wcyB3
aXRoIGZiZGV2IGluaXRpYWxpemVyDQo+PiBtYWNyb3MgZm9yIGZyYW1lYnVmZmVycyBpbiBJ
L08gYWRkcmVzcyBzcGFjZS4gVGhpcyBleHBsaWN0aWx5IHNldHMNCj4+IHRoZSByZWFkL3dy
aXRlLCBkcmF3IGFuZCBtbWFwIGNhbGxiYWNrcyB0byB0aGUgY29ycmVjdCBkZWZhdWx0DQo+
PiBpbXBsZW1lbnRhdGlvbi4NCj4+DQo+PiBGYmRldiBkcml2ZXJzIHNvbWV0aW1lcyByZWx5
IG9uIHRoZSBjYWxsYmFja3MgYmVpbmcgTlVMTCBmb3IgYQ0KPj4gZGVmYXVsdCBpbXBsZW1l
bnRhdGlvbiB0byBiZSBpbnZva2VkOyBoZW5jZSByZXF1aXJlaW5nIHRoZSBJL08NCj4+IGhl
bHBlcnMgdG8gYmUgYnVpbHQgaW4gYW55IGNhc2UuIFNldHRpbmcgYWxsIGNhbGxiYWNrcyBp
biBhbGwNCj4+IGRyaXZlcnMgZXhwbGljaXRseSB3aWxsIGFsbG93IHRvIG1ha2UgdGhlIEkv
TyBoZWxwZXJzIG9wdGlvbmFsLg0KPj4gVGhpcyBiZW5lZml0cyBzeXN0ZW1zIHRoYXQgZG8g
bm90IHVzZSB0aGVzZSBmdW5jdGlvbnMuDQo+Pg0KPj4gU2V0IHRoZSBjYWxsYmFja3Mgdmlh
IG1hY3Jvcy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPiANCj4gTWFrZXMgc2Vuc2UsIHNo
YWxsIEkgcGljayB1cCB0aGlzIHBhdGNoPw0KPiANCj4gSWYgeW91IHByZWZlciB0byB0YWtl
IGl0LCB0aGVuIHlvdSBjYW4gYWRkOg0KPiANCj4gUmV2aWV3ZWQtYnk6IEhhbnMgVmVya3Vp
bCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPg0KDQpUaGFua3MuIFRoZSBzZXJpZXMnIGZp
bmFsIHBhdGNoZXMgZGVwZW5kIG9uIHRoaXMgb25lLiBJJ2QgcHJlZmVyYWJseSANCm1lcmdl
IGl0IGF0IG9uY2UgdGhyb3VnaCBkcm0tbWlzYy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IAlIYW5zDQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gQ2M6IEFu
ZHkgV2FsbHMgPGF3YWxsc0BtZC5tZXRyb2Nhc3QubmV0Pg0KPj4gQ2M6IE1hdXJvIENhcnZh
bGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPg0KPj4gQ2M6IGxpbnV4LW1lZGlhQHZn
ZXIua2VybmVsLm9yZw0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvbWVkaWEvcGNpL2l2dHYvS2Nv
bmZpZyAgfCA0ICstLS0NCj4+ICAgZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2ZmIuYyB8
IDYgKysrLS0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BjaS9pdnR2
L0tjb25maWcgYi9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L0tjb25maWcNCj4+IGluZGV4IDli
ZTUyMTAxYmM0ZjIuLjI0OThmOTA3OWI3NTYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21l
ZGlhL3BjaS9pdnR2L0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL2l2dHYv
S2NvbmZpZw0KPj4gQEAgLTQ4LDkgKzQ4LDcgQEAgY29uZmlnIFZJREVPX0lWVFZfQUxTQQ0K
Pj4gICBjb25maWcgVklERU9fRkJfSVZUVg0KPj4gICAJdHJpc3RhdGUgIkNvbmV4YW50IGN4
MjM0MTUgZnJhbWVidWZmZXIgc3VwcG9ydCINCj4+ICAgCWRlcGVuZHMgb24gVklERU9fSVZU
ViAmJiBGQg0KPj4gLQlzZWxlY3QgRkJfQ0ZCX0ZJTExSRUNUDQo+PiAtCXNlbGVjdCBGQl9D
RkJfQ09QWUFSRUENCj4+IC0Jc2VsZWN0IEZCX0NGQl9JTUFHRUJMSVQNCj4+ICsJc2VsZWN0
IEZCX0lPTUVNX0hFTFBFUlMNCj4+ICAgCWhlbHANCj4+ICAgCSAgVGhpcyBpcyBhIGZyYW1l
YnVmZmVyIGRyaXZlciBmb3IgdGhlIENvbmV4YW50IGN4MjM0MTUgTVBFRw0KPj4gICAJICBl
bmNvZGVyL2RlY29kZXIuDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wY2kvaXZ0
di9pdnR2ZmIuYyBiL2RyaXZlcnMvbWVkaWEvcGNpL2l2dHYvaXZ0dmZiLmMNCj4+IGluZGV4
IDIzYzhjMDk0ZTc5MWIuLjQxMDQ3N2UzZTYyMTYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L21lZGlhL3BjaS9pdnR2L2l2dHZmYi5jDQo+PiArKysgYi9kcml2ZXJzL21lZGlhL3BjaS9p
dnR2L2l2dHZmYi5jDQo+PiBAQCAtOTI3LDE3ICs5MjcsMTcgQEAgc3RhdGljIGludCBpdnR2
ZmJfYmxhbmsoaW50IGJsYW5rX21vZGUsIHN0cnVjdCBmYl9pbmZvICppbmZvKQ0KPj4gICAN
Cj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgaXZ0dmZiX29wcyA9IHsNCj4+ICAg
CS5vd25lciA9IFRISVNfTU9EVUxFLA0KPj4gKwkuZmJfcmVhZCAgICAgICAgPSBmYl9pb19y
ZWFkLA0KPj4gICAJLmZiX3dyaXRlICAgICAgID0gaXZ0dmZiX3dyaXRlLA0KPj4gICAJLmZi
X2NoZWNrX3ZhciAgID0gaXZ0dmZiX2NoZWNrX3ZhciwNCj4+ICAgCS5mYl9zZXRfcGFyICAg
ICA9IGl2dHZmYl9zZXRfcGFyLA0KPj4gICAJLmZiX3NldGNvbHJlZyAgID0gaXZ0dmZiX3Nl
dGNvbHJlZywNCj4+IC0JLmZiX2ZpbGxyZWN0ICAgID0gY2ZiX2ZpbGxyZWN0LA0KPj4gLQku
ZmJfY29weWFyZWEgICAgPSBjZmJfY29weWFyZWEsDQo+PiAtCS5mYl9pbWFnZWJsaXQgICA9
IGNmYl9pbWFnZWJsaXQsDQo+PiArCV9fRkJfREVGQVVMVF9JT01FTV9PUFNfRFJBVywNCj4+
ICAgCS5mYl9jdXJzb3IgICAgICA9IE5VTEwsDQo+PiAgIAkuZmJfaW9jdGwgICAgICAgPSBp
dnR2ZmJfaW9jdGwsDQo+PiAgIAkuZmJfcGFuX2Rpc3BsYXkgPSBpdnR2ZmJfcGFuX2Rpc3Bs
YXksDQo+PiAgIAkuZmJfYmxhbmsgICAgICAgPSBpdnR2ZmJfYmxhbmssDQo+PiArCV9fRkJf
REVGQVVMVF9JT01FTV9PUFNfTU1BUCwNCj4+ICAgfTsNCj4+ICAgDQo+PiAgIC8qIFJlc3Rv
cmUgaGFyZHdhcmUgYWZ0ZXIgZmlybXdhcmUgcmVzdGFydCAqLw0KPiANCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51
ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcg
TWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=


--------------Y3wD0kn1if6ZFoVnVaBfgcO0--

--------------th4kWWp1ZDcYmoeqYHDz4X0N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVbQyoFAwAAAAAACgkQlh/E3EQov+B9
zRAAs0Fyac7IuPdV2ILsbCZjAJuhAYkYZzxrGzkmNf0aXzm7oy4aINEPSchjDRrFYyj9TL7JEYKy
dVweLlbmaR7ku2lhaZrE6IwELczlxxwZcR3XX7X1nBIZejOFOBN4Awv+OOsn2mRKcWKgaHvHFnlx
75H2npyyaDp7oE1NFmMczbCE5ZOpaoPHm1onU8VdDyC6HBcib5OrN6mDtb6CpwR3+2gnMNwHWHv2
0a+CELAu8pWsYymjPgGc92PeJewfE+hPNLVaS/qO4uk8gFcqkINdX1qxc7On0BHHkY25Q0o1OBls
aqPLCYpFNEQhB8vPnwBkluZOFq3eJzGzaG/KeAC9gMn2p5Dbh/7jUSq8aW2YrPIgjJ4tSIz7678x
Wvn8QQflXRYvzlJHLVuQACJTiTW1VsA9DXEPJ2ZH9dFyOfMqoCdqwScgV8RaaSsFclQYkCST9GoZ
BDgLEvjsnS5wzZXgLKd9uEf47owxdZG/d/rRPmdp2cD0R1kmssVAIUWfwb1CRL2jiLrmnU0pxebe
xRebTYfOv8qrcBOdjxY3F9PdknS0IvPXM+uWC2/XP/vWwMZIfxx4bX3DpimI+1e/REIhzs0mQXG8
KTcrus34iCvjqnn3HMaUe1gRaR32xyuTdkYWdpY75x+jWPiIYI/cSSdKaiXOFBAEln9H1YVnFD1A
phA=
=srht
-----END PGP SIGNATURE-----

--------------th4kWWp1ZDcYmoeqYHDz4X0N--
