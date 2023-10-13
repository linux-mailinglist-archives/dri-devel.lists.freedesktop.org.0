Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9DB7C8854
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 17:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B758A10E179;
	Fri, 13 Oct 2023 15:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD19A10E179
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 15:10:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E5BF6219F8;
 Fri, 13 Oct 2023 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697209849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aHYz4048WX7TYJHllpaABibD+YxoKxgBeceFZOwIOGw=;
 b=x0FUDMWHUbf60VvpQj+5PNK3DnEzXWR9Rflz1g+NjX0gg4svDd/RICe7WKSfIeg1+Wmjsg
 iLajxOWSI+T7fdnKy4xqey+Ix9oVKiZjJCfqlQvI+K+Rhnn1ihdLiOpGGv7/iIfHGm8+7Z
 IqzTDDjedqOtKH8lIzpOSSwq5jU3uO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697209849;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aHYz4048WX7TYJHllpaABibD+YxoKxgBeceFZOwIOGw=;
 b=w57Le/5yXFeyZmuRWHw+T3W1mbglHCwc/ePsGJzu6luTE8ODO/xULf8VJq/QUz5k5zFI9g
 mt78F5vykfbjsmCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD7D6138EF;
 Fri, 13 Oct 2023 15:10:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ApJGLfldKWVWRgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Oct 2023 15:10:49 +0000
Message-ID: <21ed30ec-506d-4a4b-b787-37b054285914@suse.de>
Date: Fri, 13 Oct 2023 17:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/ssd130x: Add support for the SSD132x OLED
 controller family
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20231012213843.1151060-1-javierm@redhat.com>
 <20231012213843.1151060-5-javierm@redhat.com>
 <6740c736-ba5f-4df2-ba2b-da0902f51f6d@suse.de>
 <87bkd2sh77.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87bkd2sh77.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Nrl1LKdn7yLUJ8KHILkPQr8y"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -12.09
X-Spamd-Result: default: False [-12.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[7]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,linux-m68k.org,lists.freedesktop.org,gmail.com]
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
Cc: Peter Robinson <pbrobinson@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Nrl1LKdn7yLUJ8KHILkPQr8y
Content-Type: multipart/mixed; boundary="------------h5f0bauPC7zT0maCC0KN7NsE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor@kernel.org>, Peter Robinson <pbrobinson@gmail.com>
Message-ID: <21ed30ec-506d-4a4b-b787-37b054285914@suse.de>
Subject: Re: [PATCH v3 4/6] drm/ssd130x: Add support for the SSD132x OLED
 controller family
References: <20231012213843.1151060-1-javierm@redhat.com>
 <20231012213843.1151060-5-javierm@redhat.com>
 <6740c736-ba5f-4df2-ba2b-da0902f51f6d@suse.de>
 <87bkd2sh77.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87bkd2sh77.fsf@minerva.mail-host-address-is-not-set>

--------------h5f0bauPC7zT0maCC0KN7NsE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMTAuMjMgdW0gMTY6NTcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBUaGFua3MgYSBsb3QgZm9yIHlvdXIg
ZmVlZGJhY2suDQo+IA0KPj4gSGkgSmF2aWVyLA0KPj4NCj4+IHRoYW5rcyBmb3IgdGhpcyBw
YXRjaC4NCj4+DQo+PiBBbSAxMi4xMC4yMyB1bSAyMzozOCBzY2hyaWViIEphdmllciBNYXJ0
aW5leiBDYW5pbGxhczoNCj4+IFsuLi5dDQo+Pj4gICAgDQo+Pj4gK3N0YXRpYyBpbnQgc3Nk
MTMyeF9mYl9ibGl0X3JlY3Qoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+Pj4gKwkJ
CQljb25zdCBzdHJ1Y3QgaW9zeXNfbWFwICp2bWFwLA0KPj4+ICsJCQkJc3RydWN0IGRybV9y
ZWN0ICpyZWN0LCB1OCAqYnVmLA0KPj4+ICsJCQkJdTggKmRhdGFfYXJyYXkpDQo+Pj4gK3sN
Cj4+PiArCXN0cnVjdCBzc2QxMzB4X2RldmljZSAqc3NkMTMweCA9IGRybV90b19zc2QxMzB4
KGZiLT5kZXYpOw0KPj4+ICsJdW5zaWduZWQgaW50IGRzdF9waXRjaCA9IGRybV9yZWN0X3dp
ZHRoKHJlY3QpOw0KPj4+ICsJc3RydWN0IGlvc3lzX21hcCBkc3Q7DQo+Pj4gKwlpbnQgcmV0
ID0gMDsNCj4+PiArDQo+Pj4gKwkvKiBBbGlnbiB4IHRvIGRpc3BsYXkgc2VnbWVudCBib3Vu
ZGFyaWVzICovDQo+Pj4gKwlyZWN0LT54MSA9IHJvdW5kX2Rvd24ocmVjdC0+eDEsIFNTRDEz
MlhfU0VHTUVOVF9XSURUSCk7DQo+Pj4gKwlyZWN0LT54MiA9IG1pbl90KHVuc2lnbmVkIGlu
dCwgcm91bmRfdXAocmVjdC0+eDIsIFNTRDEzMlhfU0VHTUVOVF9XSURUSCksDQo+Pj4gKwkJ
CSBzc2QxMzB4LT53aWR0aCk7DQo+Pj4gKw0KPj4+ICsJcmV0ID0gZHJtX2dlbV9mYl9iZWdp
bl9jcHVfYWNjZXNzKGZiLCBETUFfRlJPTV9ERVZJQ0UpOw0KPj4+ICsJaWYgKHJldCkNCj4+
PiArCQlyZXR1cm4gcmV0Ow0KPj4+ICsNCj4+PiArCWlvc3lzX21hcF9zZXRfdmFkZHIoJmRz
dCwgYnVmKTsNCj4+PiArCWRybV9mYl94cmdiODg4OF90b19ncmF5OCgmZHN0LCAmZHN0X3Bp
dGNoLCB2bWFwLCBmYiwgcmVjdCk7DQo+Pg0KPj4gSGVyZSdzIGFuIGlkZWEgZm9yIGEgZm9s
bG93LXVwIHBhdGNoc2V0Lg0KPj4NCj4+IFlvdSBjb3VsZCBhdHRlbXB0IHRvIGludGVncmF0
ZSB0aGUgZ3JheTggYW5kIG1vbm8gY29udmVyc2lvbnMgaW50bw0KPj4gZHJtX2ZiX2JsaXQo
KS4gV2l0aCBzb21lIHRoZSByaWdodCBwYXJhbWV0ZXJzLCBib3RoLCBzc2QxMzB4IGFuZCBz
c2QxMzJ4DQo+PiBjb3VsZCB1c2UgdGhlIHNhbWUgYmxpdHRpbmcgY29kZSBmcm9tIEJPIHRv
IGJ1ZmZlci4NCj4+DQo+IA0KPiBZZWFoLCBJIGNvbnNpZGVyZWQgdGhhdCBidXQgYXMgbWVu
dGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZSB3YW50IHRvIHNlZQ0KPiB3aGF0IGFyZSB0
aGUgbmVlZHMgb2YgdGhlIFNTRDEzM3ggY29udHJvbGxlciBmYW1pbHkgKEkgYm91Z2h0IGEg
U1NEMTMzMQ0KPiBkaXNwbGF5IGJ1dCBoYXZlbid0IGhhZCB0aW1lIHRvIHBsYXkgd2l0aCBp
dCB5ZXQpIGJlZm9yZSB0cnlpbmcgdG8gZmFjdG9yDQo+IG91dCB0aGUgY29tbW9uIGJpdHMg
aW4gaGVscGVyIGZ1bmN0aW9ucy4NCj4gDQo+IFsuLi5dDQo+IA0KPj4+ICsNCj4+PiArCXNz
ZDEzMHhfc3RhdGUtPmJ1ZmZlciA9IGtjYWxsb2MocGl0Y2gsIHNzZDEzMHgtPmhlaWdodCwg
R0ZQX0tFUk5FTCk7DQo+Pj4gKwlpZiAoIXNzZDEzMHhfc3RhdGUtPmJ1ZmZlcikNCj4+PiAr
CQlyZXR1cm4gLUVOT01FTTsNCj4+DQo+PiBJdCdzIHVucmVsYXRlZCB0byB0aGVzZSBwYXRj
aGVzIGFuZCBJIGtub3cgaXQncyBiZWVuIGRpc2N1c3NlZA0KPj4gZW5kbGVzc2x5LCBidXQg
SSBoYXZlIGEgcXVlc3Rpb25zIGFib3V0IGJ1ZmZlciBhbGxvY2F0aW9uLiBUaGF0IG1lbW9y
eQ0KPj4gYWN0cyBhcyBhbm90aGVyIHNoYWRvdyBidWZmZXIgZm9yIHRoZSBkZXZpY2UncyBt
ZW1vcnksIHN1Y2ggdGhhdCBmb3JtYXQNCj4+IGNvbnZlcnNpb24gYmVjb21lcyBlYXNpZXIu
DQo+Pg0KPiANCj4gQ29ycmVjdC4NCj4gDQo+PiBCdXQgdGhlbiwgd2h5IGlzIC0+YnVmZmVy
IHBhcnQgb2YgdGhlIHBsYW5lX3N0YXRlPyBTaG91bGRuJ3QgaXQgYmUgcGFydA0KPj4gb2Yg
dGhlIHBsYW5lIGFuZCBuZXZlciBiZSByZS1hbGxvY2F0ZWQ/IFRoZSByZWFsIHNpemUgb2Yg
dGhhdCBidWZmZXIgaXMNCj4+IDx3aWR0aD4gdGltZXMgPGhlaWdodD4gKG5vdCA8cGl0Y2g+
KS4gVGhhdCBzaXplIGlzIHN0YXRpYyBvdmVyIHRoZQ0KPj4gbGlmZXRpbWUgb2YgdGhlIGRl
dmljZS4gVGhhdCB3b3VsZCByZXByZXNlbnQgdGhlIHNlbWFudGljcyBtdWNoIGJldHRlci4N
Cj4+DQo+PiBUaGlzIHdvdWxkIGFsbG93IGZvciBhZGRpdGlvbmFsIGNoYW5nZXM6IGJsaXRf
cmVjdCBhbmQgdXBkYXRlX3JlY3Qgd291bGQNCj4+IGJlIG11Y2ggZWFzaWVyIHRvIHNlcGFy
YXRlOiBubyBtb3JlIHNlZ21lbnQgYWRqdXN0bWVudHMgZm9yIHRoZSBibGl0DQo+PiBjb2Rl
OyBvbmx5IGZvciB1cGRhdGVzLiBJZiB0aGUgdXBkYXRlIGNvZGUgaGFzIGhpZ2ggbGF0ZW5j
eSAoSURLKSwgeW91DQo+PiBjb3VsZCBwdXNoIGl0IGludG8gYSB3b3JrZXIgdGhyZWFkIHRv
IHJ1biBiZXNpZGVzIHRoZSBEUk0gbG9naWMuIFRoZSBndWQNCj4+IGFuZCByZXBhcGVyIGRy
aXZlcnMgZG8gc29tZXRoaW5nIHRvIHRoaXMgZWZmZWN0Lg0KPj4NCj4+DQo+IA0KPiBUaGUg
aWRlYSBvZiBtYWtpbmcgaXQgcGFydCBvZiB0aGUgcGxhbmUgc3RhdGUgaXMgdGhhdCB0aGlz
IGJ1ZmZlciBjb3VsZCBiZQ0KPiBvcHRpb25hbCwgZm9yIGV4YW1wbGUgaW4gdGhlIGNhc2Ug
b2YgdXNlci1zcGFjZSB1c2luZyB0aGUgbmF0aXZlIGRpc3BsYXkNCj4gZm9ybWF0IGluc3Rl
YWQgb2YgdGhlIGVtdWxhdGVkIFhSR0I4ODg4Lg0KPiANCj4gSW4gdGhhdCBjYXNlLCBhbiBp
bnRlcm1lZGlhdGUgYnVmZmVyIHdvbid0IGJlIHVzZWQgYmVjYXVzZSB0aGUgc2hhZG93LXBs
YW5lDQo+IGZvcm1hdCB3aWxsIGFscmVhZHkgYmUgdGhlIG5hdGl2ZSBvbmUgKGUuZzogUjEp
IGFuZCB0aGVyZSB3b24ndCBiZSBhIG5lZWQNCj4gdG8gZG8gYW55IGZvcm1hdCBjb252ZXJz
aW9uIChvbmx5IHRoZSBjb252ZXJzaW9uIHRvIHRoZSBkYXRhIGZvcm1hdCBhcyBpcw0KPiBl
eHBlY3RlZCBieSB0aGUgY29udHJvbGxlcikuDQo+IA0KPiBUYWtlIGEgbG9vayB0byBHZWVy
dCdzIHBhdGNoIGFkZGluZyBSMSBzdXBwb3J0IHRvIHNzZDEzMHggZm9yIGFuIGV4YW1wbGU6
DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNzI3NDZmNmQ5YzQ3ZjA5ZmMw
NTdhZDdhNGJiYjNiN2Y0MjNhZjgwMy4xNjg5MjUyNzQ2LmdpdC5nZWVydEBsaW51eC1tNjhr
Lm9yZy8NCj4gDQo+IFRoYXQncyB3aHkgaXQgd2FzIGRlY2lkZWQgdGhhdCBtYWtpbmcgaXQg
cGFydCBvZiB0aGUgcGxhbmUgc3RhdGUgZm9sbG93cw0KPiBiZXR0ZXIgdGhlIEtNUyBtb2Rl
bCwgYmVjYXVzZSB3aGVuIHVzaW5nIFIxIHRoaXMgYnVmZmVyIHdvbid0IGV2ZW4gYmUNCj4g
YWxsb2NhdGVkIGluIHRoZSBwcmltYXJ5IHBsYW5lIC5hdG9taWNfY2hlY2sgaGFuZGxlci4N
Cj4gDQo+IFsuLi5dDQo+IA0KPj4+ICsJZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0ZXJf
aW5pdCgmaXRlciwgb2xkX3BsYW5lX3N0YXRlLCBwbGFuZV9zdGF0ZSk7DQo+Pj4gKwlkcm1f
YXRvbWljX2Zvcl9lYWNoX3BsYW5lX2RhbWFnZSgmaXRlciwgJmRhbWFnZSkgew0KPj4+ICsJ
CWRzdF9jbGlwID0gcGxhbmVfc3RhdGUtPmRzdDsNCj4+PiArDQo+Pj4gKwkJaWYgKCFkcm1f
cmVjdF9pbnRlcnNlY3QoJmRzdF9jbGlwLCAmZGFtYWdlKSkNCj4+PiArCQkJY29udGludWU7
DQo+Pj4gKw0KPj4+ICsJCXNzZDEzMnhfZmJfYmxpdF9yZWN0KGZiLCAmc2hhZG93X3BsYW5l
X3N0YXRlLT5kYXRhWzBdLCAmZHN0X2NsaXAsDQo+Pj4gKwkJCQkgICAgIHNzZDEzMHhfcGxh
bmVfc3RhdGUtPmJ1ZmZlciwNCj4+PiArCQkJCSAgICAgc3NkMTMweF9jcnRjX3N0YXRlLT5k
YXRhX2FycmF5KTsNCj4+PiArCX0NCj4+DQo+PiBIZXJlJ3MgYW5vdGhlciBpZGVhIGZvciBh
IGFub3RoZXIgZm9sbG93LXVwIHBhdGNoc2V0Og0KPj4NCj4+IFlvdSBhcmUgYWxsb2NhdGlu
ZyBzdGF0ZS0+YnVmZmVyIHRvIGNvdmVyIHRoZSB3aG9sZSBkaXNwbGF5LCByaWdodD8gSXQn
cw0KPj4gPHBpdGNoPiB0aW1lcyA8aGVpZ2h0PiBJSVJDLiAgTWF5YmUgaXQgd291bGQgbWFr
ZSBzZW5zZSB0byBzcGxpdCB0aGUNCj4+IGRhbWFnZSBsb29wIGludG8gdHdvIGxvb3BzIGFu
ZCBpbmxpbmUgdGhlIGRyaXZlcidzIGJsaXRfcmVjdCgpIGZ1bmN0aW9uLg0KPj4gU29tZXRo
aW5nIGxpa2UgdGhhdA0KPj4NCj4+ICAgICBiZWdpbl9jcHVfYWNjZXNzKCkNCj4+DQo+PiAg
ICAgZm9yX2VhY2goZGFtYWdlKSB7DQo+PiAgICAgICBkcm1fZmJfYmxpdCggImZyb20gR0VN
IEJPIHRvIGJ1ZmZlciIgKQ0KPj4gICAgIH0NCj4+DQo+PiAgICAgZW5kX2NwdV9hY2Nlc3Mo
KQ0KPj4NCj4+ICAgICBmb3JfZWFjaChkYW1nZSkgew0KPj4gICAgICAgdXBkYXRlX3JlY3Qo
ICJmcm9tIGJ1ZmZlciB0byBkZXZpY2UiICkNCj4+ICAgICB9DQo+Pg0KPj4gV2l0aCB0aGUg
Y2hhbmdlcyBmcm9tIHRoZSBvdGhlciBjb21tZW50cywgdGhlIGZpcnN0IGxvb3AgY291bGQg
YmVjb21lDQo+PiBlbnRpcmVseSBkZXZpY2UtbmV1dHJhbCBBRkFJQ1QuDQo+Pg0KPiANCj4g
UmVnYXJkbGVzcywgc3BsaXR0aW5nIHRoZSBibGl0IGFuZCB1cGRhdGUgcmVjdCBtaWdodCBt
YWtlIHNlbnNlIGFuZCBpcyBhbg0KPiBpbnRlcnNlc3RpbmcgaWRlYS4gSSBuZWVkIHRvIGV4
cGxvcmUgdGhpcywgdGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4NCj4gDQo+IEFzIHlvdSBt
ZW50aW9uIHRoYXQgdGhlc2UgY291bGQgYmUgZm9sbG93LXVwIGNoYW5nZXMsIEkgYXNzdW1l
IHRoYXQgeW91DQo+IGFncmVlIHdpdGggdGhlIGN1cnJlbnQgYXBwcm9hY2guIFNob3VsZCBJ
IGV4cGVjdCB5b3VyIHJldmlldyAvIGFjayBmb3INCj4gdGhpcyBwYXRjaC1zZXQ/DQoNClBs
ZWFzZSB0YWtlIG15IGFjayBmb3IgdGhpcyBwYXRjaHNldA0KDQpBY2tlZC1ieTogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gDQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------h5f0bauPC7zT0maCC0KN7NsE--

--------------Nrl1LKdn7yLUJ8KHILkPQr8y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUpXfkFAwAAAAAACgkQlh/E3EQov+Af
zxAAjmB43G9J41DehTIMIUOwKbWKxJSamWQ7mUnkm5VlJeWIjErtAbpnNMGMfEE0KTEGGpYdhidU
4CnaeGgyZRaVu7UADYJi0dXYvrYuNNrlsI2dWvDqhj4vpHCANf8JbvQAv3qb+7Al/y+wb2usuIg2
lpS7IOpSeojQJwoD1BYYntwYk1LL66glKIcy1IE49S1YcvumBI5o5I6eXjODTOFBJl6J8g5uhz9s
TuVqH9kXtUlzIkOxFSxg8JxOwD3LSBlVpj+erJ7hM0+ezb3eK7u54AlZqvbWyHseAk0I6UrEGESq
/d3wJPt+mmqUeMGdqtwX/hah41BB5IOPsVOd/K44+SKwFdk9czl3aTvOo88gECVwuKtK2j8ENv1+
7vl+ggNNJDaI8cbSKoZp2MkD3PCT12xps3LWSTW2+fyLkJN1Y7JW4AvGLcZh7/2ni23GTBXjlugj
cIhfqWafX+SMf6RKs7TOR3Lf59rGDO62x5nLj6//7gW+H8/7dLqkA0g1oHwBVEVaJuGh/5YmI3EU
UZPHjPAWldQPU6zdRXqHHbSGbJkrY62XsqzKwIJBPEgvLhC9IPmCPJj10Lia/WK3y2X7ibGbRZ6G
0MFbRlwWeeFXd1gduXp6b+alEV7D4pmpqqOvI2TPj9kSTIwFBOo1CUSPW+rX225uB1v+XCSYdQHL
Vsg=
=c0Mh
-----END PGP SIGNATURE-----

--------------Nrl1LKdn7yLUJ8KHILkPQr8y--
