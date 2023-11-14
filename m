Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A517EB4D1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06DE10E474;
	Tue, 14 Nov 2023 16:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3F910E474
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:31:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B55A228FB;
 Tue, 14 Nov 2023 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699979500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sovxA66HfCq0swg6ghrAu2x9HEH7zjWbLxdvPa60n00=;
 b=ZGBCqbTTMLtVvF/95C+Fo+5VvD8pf4kRRE0vlVhXdhT/9bAfRxuaUB7qAkVHFyBGMW8AIb
 1S07l7LXJ1TbNTpR0gbSoSIo81styv9xsf5SEc22PA1/14tRLZPDQ69xdc3p2kSYKX4SIC
 Bs0KERDri3cQj0tW29weBIuJ2YUk7mU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699979500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sovxA66HfCq0swg6ghrAu2x9HEH7zjWbLxdvPa60n00=;
 b=f4WjibKjSivgs9LIj7vYzF4TboqTvxW6B7be1kEhQoLHWhjobs+CIhmFLnwbkfCKYyAeiS
 DNo28mPya+6bjNDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E83E413416;
 Tue, 14 Nov 2023 16:31:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dgzfN+ugU2WqcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Nov 2023 16:31:39 +0000
Message-ID: <a8731f9f-3652-4efd-b40e-06a792d0fccf@suse.de>
Date: Tue, 14 Nov 2023 17:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm: Add
 drm_atomic_helper_buffer_damage_{iter_init,merged}() helpers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20231109172449.1599262-1-javierm@redhat.com>
 <20231109172449.1599262-3-javierm@redhat.com>
 <c4fdfec8-aa9a-4a09-94c4-114595cf5596@suse.de>
 <8734x872dy.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <8734x872dy.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fshz2Sgh0QP70bXlsohUJZqo"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -10.59
X-Spamd-Result: default: False [-10.59 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[11]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,verizon.net];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[];
 FREEMAIL_CC(0.00)[redhat.com, verizon.net, collabora.com, lists.freedesktop.org,
 kernel.org, vger.kernel.org, ffwll.ch, gmail.com]
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
Cc: nerdopolis <bluescreen_avenger@verizon.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, dri-devel@lists.freedesktop.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 stable@vger.kernel.org, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fshz2Sgh0QP70bXlsohUJZqo
Content-Type: multipart/mixed; boundary="------------Jy9o2GnLNbaxUncDP5iP16yd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 nerdopolis <bluescreen_avenger@verizon.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org, Bilal Elmoussaoui <belmouss@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, stable@vger.kernel.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, Erico Nunes <nunes.erico@gmail.com>
Message-ID: <a8731f9f-3652-4efd-b40e-06a792d0fccf@suse.de>
Subject: Re: [PATCH 2/6] drm: Add
 drm_atomic_helper_buffer_damage_{iter_init,merged}() helpers
References: <20231109172449.1599262-1-javierm@redhat.com>
 <20231109172449.1599262-3-javierm@redhat.com>
 <c4fdfec8-aa9a-4a09-94c4-114595cf5596@suse.de>
 <8734x872dy.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <8734x872dy.fsf@minerva.mail-host-address-is-not-set>

--------------Jy9o2GnLNbaxUncDP5iP16yd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMTEuMjMgdW0gMTY6NTggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBUaGFua3MgYSBsb3QgZm9yIHlvdXIg
ZmVlZGJhY2suDQo+IA0KPj4gSGkNCj4+DQo+PiBBbSAwOS4xMS4yMyB1bSAxODoyNCBzY2hy
aWViIEphdmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4+PiBUbyBiZSB1c2VkIGJ5IGRyaXZl
cnMgdGhhdCBkbyBwZXItYnVmZmVyIChlLmc6IHZpcnRpby1ncHUpIHVwbG9hZHMgKHJhdGhl
cg0KPj4+IHRoYW4gcGVyLXBsYW5lIHVwbG9hZHMpLCBzaW5jZSB0aGVzZSB0eXBlIG9mIGRy
aXZlcnMgbmVlZCB0byBoYW5kbGUgYnVmZmVyDQo+Pj4gZGFtYWdlcyBpbnN0ZWFkIG9mIGZy
YW1lIGRhbWFnZXMuDQo+Pj4NCj4+PiBUaGUgZHJtX2F0b21pY19oZWxwZXJfYnVmZmVyX2Rh
bWFnZV9pdGVyX2luaXQoKSBoYXMgdGhlIHNhbWUgbG9naWMgdGhhbg0KPj4+IGRybV9hdG9t
aWNfaGVscGVyX2RhbWFnZV9pdGVyX2luaXQoKSBidXQgaXQgYWxzbyB0YWtlcyBpbnRvIGFj
Y291bnQgaWYgdGhlDQo+Pj4gZnJhbWVidWZmZXIgYXR0YWNoZWQgdG8gcGxhbmUncyBzdGF0
ZSBoYXMgY2hhbmdlZCBzaW5jZSB0aGUgbGFzdCB1cGRhdGUuDQo+Pj4NCj4+PiBBbmQgdGhl
IGRybV9hdG9taWNfaGVscGVyX2J1ZmZlcl9kYW1hZ2VfbWVyZ2VkKCkgaXMganVzdCBhIHZl
cnNpb24gb2YgdGhlDQo+Pj4gZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX21lcmdlZCgpIGhl
bHBlciwgYnV0IGl0IHVzZXMgdGhlIGl0ZXJfaW5pdCBoZWxwZXINCj4+PiB0aGF0IGlzIG1l
bnRpb25lZCBhYm92ZS4NCj4+Pg0KPj4+IEZpeGVzOiAwMWYwNTk0MGE5YTcgKCJkcm0vdmly
dGlvOiBFbmFibGUgZmIgZGFtYWdlIGNsaXBzIHByb3BlcnR5IGZvciB0aGUgcHJpbWFyeSBw
bGFuZSIpDQo+Pj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY2LjQrDQo+Pj4g
UmVwb3J0ZWQtYnk6IG5lcmRvcG9saXMgPGJsdWVzY3JlZW5fYXZlbmdlckB2ZXJpem9uLm5l
dD4NCj4+PiBDbG9zZXM6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MjE4MTE1DQo+Pj4gU3VnZ2VzdGVkLWJ5OiBTaW1hIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4+PiAtLS0NCj4+Pg0KPj4+ICAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jIHwgNzkgKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0NCj4+PiAgICBpbmNsdWRlL2RybS9kcm1fZGFtYWdlX2hlbHBlci5oICAg
ICB8ICA3ICsrKw0KPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RhbWFnZV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBl
ci5jDQo+Pj4gaW5kZXggYWEyMzI1NTY3OTE4Li5iNzIwNjJjOWQzMWMgMTAwNjQ0DQo+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMNCj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RhbWFnZV9oZWxwZXIuYw0KPj4+IEBAIC0yMDQsNyArMjA0
LDggQEAgRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2hlbHBlcl9kaXJ0eWZiKTsNCj4+PiAg
ICBzdGF0aWMgdm9pZA0KPj4+ICAgIF9fZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0ZXJf
aW5pdChzdHJ1Y3QgZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0ZXIgKml0ZXIsDQo+Pj4g
ICAgCQkJCSAgICAgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3N0YXRlLA0K
Pj4+IC0JCQkJICAgICBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkNCj4+
PiArCQkJCSAgICAgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUsDQo+Pj4g
KwkJCQkgICAgIGJvb2wgYnVmZmVyX2RhbWFnZSkNCj4+DQo+PiBJIHRoaW5rIGl0IHdvdWxk
IGJlIHByZWZlcmFibGUgdG8gZHJvcCBwYXRjaGVzIG9uZSBhbmQgdHdvIGFuZCBpbnN0ZWFk
DQo+PiBhZGQgdGhpcyBwYXJhbWV0ZXIgZGlyZWN0bHkgdG8gZHJtX2F0b21pY19oZWxwZXJf
ZGFtYWdlX2l0ZXJfaW5pdCgpIGFuZA0KPj4gZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX21l
cmdlZCgpLiAgVGhhdCdzIGEgYml0IG9mIGNodXJuLCBidXQgbW9yZQ0KPj4gcmVhZGFibGUg
Y29kZS4NCj4+DQo+IA0KPiBNYWtlcyBzZW5zZS4gSSdsbCBkbyB0aGF0IGluIHYyLg0KDQpJ
bnN0ZWFkIG9mIG1vZGlmeWluZyB0aGVzZSBmdW5jdGlvbiBpbnRlcmZhY2VzLCBpdCBtaWdo
dCBiZSBldmVuIGJldHRlciANCnRvIGludHJvZHVjZSBhIHN0YXRlIGZsYWcgaW4gc3RydWN0
IGRybV9wbGFuZV9zdGF0ZSB0aGF0IHlvdSBjYW4gbW9kaWZ5IA0KaW4gdGhlIHBsYW5lJ3Mg
YXRvbWljX2NoZWNrIGhlbHBlci4gU29tZXRoaW5nIHNpbXBsZSBsaWtlIHRoaXM6DQoNCiAg
IGlmIChvbGRfZmIgIT0gbmV3X2ZiKQ0KICAgICBwbGFuZV9zdGF0ZS0+aWdub3JlX2RhbWFn
ZV9jbGlwcyA9IHRydWU7DQoNCmluIHRoZSBhZmZlY3RlZCBkcml2ZXJzL3BsYW5lcy4gSW4g
ZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0ZXJfaW5pdCgpIA0KeW91IGNhbiB1c2UgaXQg
dG8gZ2VuZXJhdGUgYSBmdWxsIHVwZGF0ZS4gVGhpcyBhdm9pZHMgdGhlIGNodXJuIGFuZCBp
cyANCmluIGxpbmUgd2l0aCB0aGUgb3ZlcmFsbCBjaGVjay9jb21taXQgZGVzaWduIG9mIHRo
ZSBEUk0gZnJhbWV3b3JrLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4gQmVz
dCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJt
YW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91
ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------Jy9o2GnLNbaxUncDP5iP16yd--

--------------fshz2Sgh0QP70bXlsohUJZqo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVToOsFAwAAAAAACgkQlh/E3EQov+B7
lhAAvvJpRZEuepyZpORSpc6Z48+3p1w/Ggy+z8EnOyBcf24lxnl8tkq7W9HtfMSS2FZFNZ6OzyAY
0Hw+4PNfCacW6Uv+K5ldB2Sn4DvCQ239WJPl0X4pFxO0yeb7x6OjDiQTM7ps4sk5Zstqv4654ufU
kUnpYyGSdQcL2i2+VFiIE4DW/uwfjRAEN7OKIR+PLJC9T48xZs+JSpPdU4JblaSA+sUmWZtokj/N
fyWk+DVntsmY8W7IKXeN7+Kr9xnCTaumNWMh76FXBRA272G/ESio7y1GX1A9WhmTZSeNasgbjhcg
EJAycGxOaqPAsaUuuqMaC5n+EqKp0bXfgIY1CFJARlKt1hIVE0gYAkSiYHeEVLfXqDl3JT9NRvpU
Lyheo+E3pC6rEGQWqhXGM0Sfg8h8aOc9Bdt6Gk6mWe6e505TC4uoIOGUPoyDe4YEhKRQEZTP51xT
rSBT9zJrUScMX6TpmVD9UvlSsFeN6HtrWdQkC/4O/KTTKtjMvQO3RMPVNaq5em3W1ctifrAxEIGW
bCH/ccNI8seh4xnn3+S+/8rqjik5AEXLwFDTofeiyES5hY2cuBKtfCh5qWqNP3oLxp+GadopGO3U
N1KSj14u7rFKmn/7HtyA2J14+xCwP7YQaNRoF1lIxnkg6jPI/yr/r2IboSBDbR14S8cOm0oOFzVC
sxs=
=RuAM
-----END PGP SIGNATURE-----

--------------fshz2Sgh0QP70bXlsohUJZqo--
