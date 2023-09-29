Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1187B3635
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 16:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B640F10E0CC;
	Fri, 29 Sep 2023 14:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD71E10E0CC
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 14:58:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9E5151F390;
 Fri, 29 Sep 2023 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695999511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iAF5CXfv3t/JBxcDETJYmlc90szWKh/nb6QRWam13f4=;
 b=jPK4k7whQ3lAqE3ssMwj3i5pRi2WSHELoh0Eys5aa2MQbuusHUrbhcrKN/g2WfPnMyLsX7
 H/sCDQRC9yGGA76xDfsVdBM0ubsoJ43lQGgqKfk2Uzd6Tl9mLaqEjah30wJeatzLo4mhBO
 I0UG2z0KW+U59Puy42UXxmbDqKyInB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695999511;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iAF5CXfv3t/JBxcDETJYmlc90szWKh/nb6QRWam13f4=;
 b=pXDjgN7sqYzsRB3TOGMb3Cc8siv9H/83JSgz/yuXZnnwCfFbk+DCnwDUgrIBgzbgM2OBox
 JuJQ1ynsYMbXWCCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77ED31390A;
 Fri, 29 Sep 2023 14:58:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7edkHBfmFmV4KgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Sep 2023 14:58:31 +0000
Message-ID: <cf9eb014-8f84-4203-ba4e-a38f2aa7c769@suse.de>
Date: Fri, 29 Sep 2023 16:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm: Reuse temporary memory for format conversion
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <kvsuwskjydl24euafxnlr52xhozw7ldyut7hjib3sveb7uyo66@pkpncxahqx5l>
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
In-Reply-To: <kvsuwskjydl24euafxnlr52xhozw7ldyut7hjib3sveb7uyo66@pkpncxahqx5l>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PhbaX8OFCtniV01KVuUcWuT7"
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
Cc: jfalempe@redhat.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, noralf@tronnes.org, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PhbaX8OFCtniV01KVuUcWuT7
Content-Type: multipart/mixed; boundary="------------nH06tnzkuBg0SWiH41YVvWSv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: jfalempe@redhat.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, noralf@tronnes.org, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net
Message-ID: <cf9eb014-8f84-4203-ba4e-a38f2aa7c769@suse.de>
Subject: Re: [PATCH v2 0/5] drm: Reuse temporary memory for format conversion
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <kvsuwskjydl24euafxnlr52xhozw7ldyut7hjib3sveb7uyo66@pkpncxahqx5l>
In-Reply-To: <kvsuwskjydl24euafxnlr52xhozw7ldyut7hjib3sveb7uyo66@pkpncxahqx5l>

--------------nH06tnzkuBg0SWiH41YVvWSv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDkuMjMgdW0gMTQ6MTEgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
biBXZWQsIFNlcCAyMCwgMjAyMyBhdCAwNDoyNDoyNlBNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IERSTSdzIGZvcm1hdC1jb252ZXJzaW9uIGhlbHBlcnMgcmVxdWly
ZSB0ZW1wb3JhcnkgbWVtb3J5LiBQYXNzIHRoZQ0KPj4gYnVmZmVyIGZyb20gdGhlIGNhbGxl
ciBhbmQga2VlcCBpdCBhbGxvY2F0ZWQgb3ZlciBzZXZlcmFsIGNhbGxzLiBBbGxvdw0KPj4g
dGhlIGNhbGxlciB0byBwcmVhbGxvY2F0ZSB0aGUgYnVmZmVyIG1lbW9yeS4NCj4+DQo+PiBU
aGUgbW90aXZhdGlvbiBmb3IgdGhpcyBwYXRjaHNldCBpcyB0aGUgcmVjZW50IHdvcmsgb24g
YSBEUk0gcGFuaWMNCj4+IGhhbmRsZXIuIFRoZSBwYW5pYyBoYW5kbGVyIHJlcXVpcmVzIGZv
cm1hdCBjb252ZXJzaW9uIHRvIGRpc3BsYXkgYW4NCj4+IGVycm9yIHRvIHRoZSBzY3JlZW4u
IEJ1dCBhbGxvY2F0aW5nIG1lbW9yeSBkdXJpbmcga2VybmVsIHBhbmljcyBpcw0KPj4gZnJh
Z2lsZS4gVGhlIGNoYW5nZXMgaW4gdGhpcyBwYXRjaHNldCBlbmFibGUgdGhlIERSTSBwYW5p
YyBoYW5kbGVyIHRvDQo+PiBwcmVhbGxvY2F0ZSBidWZmZXIgc3RvcmFnZSBiZWZvcmUgdGhl
IHBhbmljIG9jY3Vycy4NCj4+DQo+PiBBcyBhbiBhZGRpdG9uYWwgYmVuZWZpdCwgZHJpdmVy
cyBjYW4gbm93IGtlZXAgdGhlIHRlbXBvcmFyeSBzdG9yYWdlDQo+PiBhY3Jvc3MgbXVsdGlw
bGUgZGlzcGxheSB1cGRhdGVzLiBBdm9pZGluZyBtZW1vcnkgYWxsb2NhdGlvbiByZWR1Y2Vz
DQo+PiB0aGUgQ1BVIG92ZXJoZWFkIG9mIHRoZSBmb3JtYXQgaGVscGVycy4NCj4gDQo+IFRo
aXMgYXJndW1lbnQgaXMgZ2V0dGluZyBhIGJpdCB0aXJpbmcuIFRoZSBtYWluIHJlYXNvbiBp
cyB0aGF0IGl0IGlzbid0DQo+IG9uZSwgYW5kOg0KDQpDUFUgb3ZlcmhlYWQgaXNuJ3QgdGhl
IGRyaXZlciBiZWhpbmQgdGhpcyBwYXRjaHNldCwgYnV0IGlmIGl0IGlzIA0KYWZmZWN0ZWQs
IHdoeSBub3Qgc2F5IHRoYXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlPyBUaGVyZSdzIGEgYWxs
b2MvZnJlZSANCnBhaXIgZm9yIGVhY2ggdXBkYXRlZCBzY2FubGluZS4gRm9yIGEgZnVsbC1z
Y3JlZW4gdXBkYXRlcywgdGhhdCdzIHF1aXRlIA0KYSBiaXQuDQoNCj4gDQo+ICAgIC0gd2Ug
YWxsb2NhdGUgc29tZXRoaW5nIGluIHRoZSAxMC0yMCByYW5nZSBvYmplY3RzIGF0IGEgZ2l2
ZW4gY29tbWl0LA0KPiAgICAgIHNvIGFub3RoZXIgc21hbGwgb25lIGlzIG5vdCBpbnNpZ25p
ZmljYW50Lg0KPiANCj4gICAgLSBJZiBpdCB3YXMsIGl0IHdvdWxkIGJlIHRyaXZpYWwgdG8g
cHJvZHVjZSBhIGJlbmNobWFyaywgYnV0IG5vLW9uZQ0KPiAgICAgIGV2ZXIgYWN0dWFsbHkg
c2hvd2VkIGEgd29ya2xvYWQgYW5kIG51bWJlcnMgd2hlcmUgdGhlcmUncyBhY3R1YWxseQ0K
PiAgICAgIGFueSBkaWZmZXJlbmNlLg0KPiANCj4gICAgLSBBbHNvLCB0aGUgQ1BVIG92ZXJo
ZWFkIGlzIGluZGVlZCAoZXZlbiBpZiBtYXJnaW5hbGx5KSBkZWNyZWFzZWQsIGJ1dA0KPiAg
ICAgIHRoZSBtZW1vcnkgb3ZlcmhlYWQgaXMgaW5jcmVhc2VkLiBJIGRvbid0IGtub3cgd2hl
dGhlciB0aGF0J3MgYSBnb29kDQo+ICAgICAgdHJhZGUtb2ZmIG9yIG5vdCwgc2VlIHRoZSBw
b2ludCBhYm92ZS4NCj4gDQo+IEl0IHJlYWxseSBzb3VuZHMgbGlrZSBhbiBlbXB0eSBzdGF0
ZW1lbnQgdG8gbWU6ICJCdXQganVzdCB0aGluayBvZiB0aGUNCj4gQ1BVISIuDQo+IA0KPiBU
aGF0IGJlaW5nIHNhaWQsIEkgYWxzbyBoYXZlIG1vcmUgZnVuZGFtZW50YWwgZG91YnRzIGFi
b3V0IHRoaXMgc2VyaWVzLg0KPiANCj4gVGhlIGZpcnN0IG9uZSBpcyB0aGF0IHN0b3Jpbmcg
dGhlIGJ1ZmZlciBwb2ludGVyIGluIHRoZSBkZXZpY2UgaW5zdGVhZA0KPiBvZiB0aGUgc3Rh
dGUgbWFrZXMgaXQgaGFyZGVyIHRvIHJlYXNvbiBhYm91dC4gV2hlbiB5b3UgaGF2ZSBhIHN0
YXRlLCB0aGUNCj4gZnJhbWV3b3JrIHByb3ZpZGVzIHRoZSBndWFyYW50ZWUgYXQgY29tbWl0
IHRpbWUgdGhhdCB0aGVyZSdzIG9ubHkgZ29pbmcNCj4gdG8gYmUgb25lIGF0IGEgZ2l2ZW4g
dGltZS4gQW5kIHNpbmNlIHRoZSBidWZmZXIgaXMgc3RvcmVkIGluIHRoYXQgc3RhdGUNCj4g
b2JqZWN0LCB5b3UgY2FuJ3QgYWNjZXNzIGl0IGJ5IG1pc3Rha2UuIFRoZSBidWZmZXIgc2l6
ZSBhbHNvIGRlcGVuZHMgb24NCj4gdGhlIHN0YXRlLCBzbyB0aGF0IGFsbCBtYWtlcyBzZW5z
ZSBmcm9tIGEgbG9naWNhbCBQb1YuDQoNClllcy4gSSBkaXNjdXNzZWQgdGhpcyB3aXRoIEph
dmllciBhbHJlYWR5LiBQdXR0aW5nIHRoaXMgaW50byB0aGUgc3RhdGUgDQppcyB0aGUgY2xl
YW4gc29sdXRpb24uDQoNCj4gDQo+IElmIHdlIHN0b3JlIHRoZSBidWZmZXIgaW50byB0aGUg
ZGV2aWNlLCB0aGVuIHN1ZGRlbmx5IHlvdSBoYXZlIHRvIHRoaW5rDQo+IGFib3V0IHdoZXRo
ZXIgdGhlcmUncyBtdWx0aXBsZSBDUlRDcyBvciBub3QgKHNpbmNlIGNvbW1pdHMgYXJlbid0
DQo+IHNlcmlhbGlzZWQgaWYgdGhleSBhZmZlY3QgZGlmZmVyZW50IENSVENzKSwgd2hldGhl
ciB0aGUgYnVmZmVyIHNpemUgeW91DQo+IGFsbG9jYXRlZCBpcyBsYXJnZSBlbm91Z2ggbm93
IGZvciB5b3VyIGN1cnJlbnQgcmVzb2x1dGlvbiBhbmQgZm9ybWF0LA0KPiBldGMuIEl0IGFk
ZHMgYSBkZWNlbnQgY2h1bmsgb2YgY29tcGxleGl0eSBvbiBzb21ldGhpbmcgdGhhdCB3YXMg
cXVpdGUNCj4gY29tcGxleCBhbHJlYWR5Lg0KDQpJdCdzIGluIHRoZSBkZXZpY2UgYmVjYXVz
ZSBpdCdzIGdvb2QgZW5vdWdoIGZvciB0aGVzZSBzaW1wbGUgZHJpdmVycy4gDQpUaGUgbmV4
dCBiZXN0IHBsYWNlIHdvdWxkIGJlIGEgZGVkaWNhdGVkIHBsYW5lIHN0cnVjdHVyZSBpbiBl
YWNoIGRyaXZlci4gDQpUaGUgcGVyLXBsYW5lIGNhY2hlIHdvdWxkIHRoZW4gYmUgY2xlYXJs
eSBhdHRyaWJ1dGVkIHRvIGEgc2luZ2xlIHBsYW5lLg0KDQo+IA0KPiBJIHVuZGVyc3RhbmQg
dGhhdCB0aGUgbW90aXZhdGlvbiBpcyBmb3IgZHJtX3BhbmljIHRvIGhhdmUgYSBidWZmZXIg
cmVhZHkNCj4gd2hlbiBpdCBoYXMgdG8ga2ljayBpbi4gQnV0IHdoeSBkb24ndCB3ZSBqdXN0
IGFsbG9jYXRlIChhbmQgY2hlY2spIGENCj4gc3BhcmUgY29tbWl0IGF0IHByb2JlIHRpbWUg
c28gd2UganVzdCBoYXZlIHRvIGNvbW1pdCBpdCB3aGVuIHdlIHBhbmljLg0KDQpEUk0gcGFu
aWMgZG9lc24ndCBjb21taXQgYW55dGhpbmcuIEl0IHBpY2tzIHVwIHdoYXRldmVyIHRoZSBj
dXJyZW50IA0Kc2Nhbm91dCBidWZmZXIgaXMgYW5kIGRyYXdzIGludG8gdGhhdC4gSWYgdGhl
IERSTSBkcml2ZXIgY2Fubm90IHByb3ZpZGUgDQphIHNjYW5vdXQgYnVmZmVyLCBEUk0gcGFu
aWMgZG9lcyBub3RoaW5nLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBUaGF0
IHdvdWxkIGZhbGwgbmljZWx5IGludG8gdGhlIHJlc3Qgb2YgdGhlIGF0b21pYyBtb2Rlc2V0
dGluZyBjb2RlLCBhbmQNCj4gc2luY2Ugd2UgcHJldHR5IG11Y2ggcmVxdWlyZSBub3QgdG8g
YWxsb2NhdGUgYW55dGhpbmcgZHVyaW5nDQo+IGF0b21pY19jb21taXQsIHdlIGhhdmUgdGhh
dCBjb25zdHJhaW50cyBhbHJlYWR5IGZpZ3VyZWQgb3V0Lg0KPiANCj4gTWF4aW1lDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5
MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywg
QW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5i
ZXJnKQ0K

--------------nH06tnzkuBg0SWiH41YVvWSv--

--------------PhbaX8OFCtniV01KVuUcWuT7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUW5hcFAwAAAAAACgkQlh/E3EQov+AV
hw//Rk10/2gNXZoTtODtyc9OTAF5so2REKRneA7fM/XiMxZw28LeixHDNqVKpzIzxA2yaPasvp6f
Agpg/adlitxRgikYUP7mJnwLRyOi4ETzcNTEItm7khbn+Uz/1cLajD8vUsxcCi4vBEADAWst/Mg3
32wHmaLcktfT7Oi63SgAH26lWv0+QrbrcP/JnZoAbm7SyBDt6k7QdszbSwOgbJ3uX2sCsxM7MVxV
3aCQkc6FfxF+kd5uwiotb7PthZ3gQzRNAHcIb4a2oW4t1c6Fol9NAFKlKYw3T4Qt9mShXdfVUql6
rSXVPqP4QAsrKR1xujZr1fwb0Qdz/vmGdLTZ2TFFDPWJLAAoids0es0OJpeGLjGDZDjl9FW9CQ/7
laAeL1iANXRmpJUxMDFu/zQT4iiQAO4T6/qvrYCC1+KydEOu7s+nQRwSBo80PnanaIovPqfMPRF/
WRgNTElz3yHTYkzDrH0NTRm1cGP1BFLkPDe9BzYpbSa3kxmUfvg4M1JGP2vd4aE8vjy3f4bUcZ8O
8HRYa4aHz0Q8VOr7Gp+OaueyobzgoNH9H7xFI9xIY/sffYWnEXy1BdPCVhU/kB9kBFPUTiQrYhTM
ndsZJ4q6JFaWz8FU/yAkqVySmE8SS9vR7ZoPJo4IQs5m99FHX7wvg8nWOcQm6EJM4bQglgD3MdzH
bYs=
=cWKG
-----END PGP SIGNATURE-----

--------------PhbaX8OFCtniV01KVuUcWuT7--
