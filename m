Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699157BD4BC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 09:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCE710E0D9;
	Mon,  9 Oct 2023 07:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E5510E0D9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 07:53:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 34C411F381;
 Mon,  9 Oct 2023 07:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696838037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qGlg/tk7CQyYcEUMUsy3JIR3DGsFQNAsBaYU/L4oT1E=;
 b=WiBn2XpEAwu5DTD9g1Iuu/kZDn7Yv38dbpTBDxxpQoLtQuSmRBlz40E0jQh5xgdr653aO3
 J6kldgQAA74AIN0OuJePqiFT3mSI68iYCYw8KIHccnN1+Ig6hjP2SAVxjgLdHmVkbRb5/2
 Dkzbt0Ke8oVkC9yc60tE4EEp71dMg5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696838037;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qGlg/tk7CQyYcEUMUsy3JIR3DGsFQNAsBaYU/L4oT1E=;
 b=/zPNrmEvYYmAqDeQ2TD3ReBhUaboLAjNQ1OjUujZ605qZRVE3D3lZVw9ib9FJCD2Z5ZGBe
 euqD2bPfUXRKKJDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00AF013905;
 Mon,  9 Oct 2023 07:53:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mk7EOpSxI2XDLgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Oct 2023 07:53:56 +0000
Message-ID: <39bd4c35-8a61-42ee-8675-ccea4f5d4ac6@suse.de>
Date: Mon, 9 Oct 2023 09:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] drm: Reuse temporary memory for format conversion
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, javierm@redhat.com, 
 jfalempe@redhat.com, jose.exposito89@gmail.com, arthurgrillo@riseup.net,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <47a54b65-168f-4188-ad5c-79ba55d7a768@tronnes.org>
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
In-Reply-To: <47a54b65-168f-4188-ad5c-79ba55d7a768@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cTBkk6FAwHBe6wVM6uTFBR6W"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cTBkk6FAwHBe6wVM6uTFBR6W
Content-Type: multipart/mixed; boundary="------------OGi32TWYuoDUNfG736zmpjcM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, javierm@redhat.com,
 jfalempe@redhat.com, jose.exposito89@gmail.com, arthurgrillo@riseup.net,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <39bd4c35-8a61-42ee-8675-ccea4f5d4ac6@suse.de>
Subject: Re: [PATCH v4 0/7] drm: Reuse temporary memory for format conversion
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <47a54b65-168f-4188-ad5c-79ba55d7a768@tronnes.org>
In-Reply-To: <47a54b65-168f-4188-ad5c-79ba55d7a768@tronnes.org>

--------------OGi32TWYuoDUNfG736zmpjcM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTm9yYWxmDQoNCkFtIDA3LjEwLjIzIHVtIDE0OjAxIHNjaHJpZWIgTm9yYWxmIFRyw7hu
bmVzOg0KPiANCj4gDQo+IE9uIDEwLzUvMjMgMTE6MDQsIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOg0KPj4gRFJNJ3MgZm9ybWF0LWNvbnZlcnNpb24gaGVscGVycyByZXF1aXJlIHRlbXBv
cmFyeSBtZW1vcnkuIFBhc3MgdGhlDQo+PiBidWZmZXIgZnJvbSB0aGUgY2FsbGVyIGFuZCBr
ZWVwIGl0IGFsbG9jYXRlZCBvdmVyIHNldmVyYWwgY2FsbHMuIEFsbG93DQo+PiB0aGUgY2Fs
bGVyIHRvIHByZWFsbG9jYXRlIHRoZSBidWZmZXIgbWVtb3J5Lg0KPj4NCj4+IFRoZSBtb3Rp
dmF0aW9uIGZvciB0aGlzIHBhdGNoc2V0IGlzIHRoZSByZWNlbnQgd29yayBvbiBhIERSTSBw
YW5pYw0KPj4gaGFuZGxlci4gWzFdIFRoZSBwYW5pYyBoYW5kbGVyIHJlcXVpcmVzIGZvcm1h
dCBjb252ZXJzaW9uIHRvIGRpc3BsYXkgYW4NCj4+IGVycm9yIHRvIHRoZSBzY3JlZW4uIEJ1
dCBhbGxvY2F0aW5nIG1lbW9yeSBkdXJpbmcga2VybmVsIHBhbmljcyBpcw0KPj4gZnJhZ2ls
ZS4gVGhlIGNoYW5nZXMgaW4gdGhpcyBwYXRjaHNldCBlbmFibGUgdGhlIERSTSBwYW5pYyBo
YW5kbGVyIHRvDQo+PiBwcmVhbGxvY2F0ZSBidWZmZXIgc3RvcmFnZSBiZWZvcmUgdGhlIHBh
bmljIG9jY3Vycy4NCj4+DQo+IA0KPiBJJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgdGhpcyBh
bmQgYWZhaXUgdGhpcyByZXF1aXJlcyB0aGUgZGlzcGxheSBodyB0bw0KPiBzd2l0Y2ggdG8g
dGhlIG5ldyBwYW5pYyBidWZmZXIgZm9yIHNjYW5vdXQsIHJpZ2h0Pw0KPiBJIGRvbid0IHRo
aW5rIHRoYXQgaXMgcG9zc2libGUgZm9yIGFueSBjb21wbGV4IGh3IHRvIGRvIGluIGEgcGFu
aWMNCj4gc2l0dWF0aW9uLiBPciBhcmUgeW91IHRoaW5raW5nIHRoYXQgdGhlIGRyaXZlciBz
aG91bGQgc29tZWhvdyAibWVtY3B5Ig0KPiB0aGlzIGJ1ZmZlciB0byB0aGUgYWN0dWFsIHNj
YW5vdXQgYnVmZmVyPw0KDQpJdCdzIGFsbCBvZiB0aGF0LCBidXQgZGVwZW5kcyBvbiB0aGUg
c2l0dWF0aW9uLiBJbiB0aGUgZWFzeSBjYXNlLCB3ZSANCmhhdmUgYSB1c2FibGUgc2Nhbm91
dCBidWZmZXIgZHVyaW5nIHRoZSBwYW5pYyAoZS5nLiwgWFJHQjg4OCkuIFdlIGNhbiANCnVz
ZSBpdCBmb3IgdGhlIHBhbmljIHNjcmVlbi4NCg0KSWYgdGhlcmUncyBubyBzdWNoIHNjYW5v
dXQgcHJvZ3JhbW1lZCwgd2UgY2FuIGF0dGVtcHQgdG8gc2V0IGEgbmV3IA0KZGlzcGxheSBt
b2RlLiBJIHRoaW5rLCBpdCBpcyBiZXN0IHRvIGxlYXZlIHRoZXNlIGV4YWN0IHN0ZXBzIHRv
IHRoZSBEUk0gDQpkcml2ZXIuIFNvbWUgZHJpdmVycyBtaWdodCBub3QgYmUgYWJsZSB0byBy
ZXByb2dyYW0gdGhlIGRpc3BsYXkgKGUuZy4sIA0Kd2l0aCBVU0Igb3IgSTJDIGhhcmR3YXJl
KS4NCg0KSW4gdGhlIHBhbmljIGhhbmRsZXIsIHdlIGNvcHkgZ2x5cGhzIGludG8gdGhlIHNj
YW5vdXQgYnVmZmVyIGFuZCANCnBvc3NpYmx5IGNvbnZlcnQgdGhlIGNvbG9yIGZvcm1hdCBk
dXJpbmcgdGhhdCBwcm9jZXNzLiBXaXRob3V0IGEgd29ya2luZyANCnNjYW5vdXQgYnVmZmVy
LCB0aGUgcGFuaWMgaGFuZGxlciBkb2VzIG5vdGhpbmcuDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCg0KPiANCj4gTm9yYWxmLg0KPiANCj4+IEFzIGFuIGFkZGl0b25hbCBiZW5lZml0
LCBkcml2ZXJzIGNhbiBub3cga2VlcCB0aGUgdGVtcG9yYXJ5IHN0b3JhZ2UNCj4+IGFjcm9z
cyBtdWx0aXBsZSB1cGRhdGVzLiBBdm9pZGluZyBtZW1vcnkgYWxsb2NhdGlvbiBzbGlnaHRs
eSByZWR1Y2VzDQo+PiB0aGUgQ1BVIG92ZXJoZWFkIG9mIHRoZSBmb3JtYXQgaGVscGVycy4N
Cj4+DQo+PiBQYXRjaCAxIGFkZHMgc3RydWN0IGRybV9mb3JtYXRfY29udl9zdGF0ZSwgYSBz
aW1wbGUgaW50ZXJmYWNlIHRvIHBhc3MNCj4+IGFyb3VuZCB0aGUgYnVmZmVyIHN0b3JhZ2Uu
IFBhdGNoIDIgYWRkcyBhbiBpbnN0YW5jZSBvZiB0aGUgc3RydWN0IHRvDQo+PiB0aGUgc2hh
ZG93LXBsYW5lIHN0YXRlLiBQYXRjaCAzIG1vdmVzIHRoZSBidWZmZXIncyBtZW1vcnkgbWFu
YWdlbWVudA0KPj4gZnJvbSB0aGUgZm9ybWF0IGhlbHBlcnMgaW50byB0aGVpciBjYWxsZXJz
IHdpdGhpbiB0aGUgRFJNIGRyaXZlcnMuIE1vc3QNCj4+IG9mIHRoZSBhZmVjdGVkIGRyaXZl
cnMgdXNlIHRoZSBzdGF0ZSBpbnN0YW5jZSBzdG9yZWQgaW4gdGhlaXIgc2hhZG93LQ0KPj4g
cGxhbmUgc3RhdGUuIFRoZSBzaGFkb3ctcGxhbmUgY29kZSByZWxlYXNlcyB0aGUgYnVmZmVy
IG1lbW9yeSBhdXRvbWF0aWNhbGx5Lg0KPj4NCj4+IFBhdGNoZXMgNCB0byA3IHVwZGF0ZSB0
aHJlZSBkcml2ZXJzIHRvIHByZWFsbG9jYXRlIHRoZSBmb3JtYXQtY29udmVyc2lvbg0KPj4g
YnVmZmVyIGluIHRoZWlyIHBsYW5lJ3MgYXRvbWljX2NoZWNrIGZ1bmN0aW9uLiBUaGUgZHJp
dmVyIHRodXMgZGV0ZWN0cyBPT00NCj4+IGVycm9ycyBiZWZvcmUgdGhlIGRpc3BsYXkgdXBk
YXRlIGJlZ2lucy4NCj4+DQo+PiBUZXN0ZWQgd2l0aCBzaW1wbGVkcm0uDQo+Pg0KPj4gdjQ6
DQo+PiAJKiByZW5hbWUgc3RydWN0IHRvIGRybV9mb3JtYXRfY29udl9zdGF0ZSAoSmF2aWVy
KQ0KPj4gCSogcmVwbGFjZSBBUlJBWV9TSVpFKCkgd2l0aCBzaXplb2YoKSAoSmFuaSkNCj4+
IAkqIHN0b3JlIGJ1ZmZlciBpbiBzaGFkb3ctcGxhbmUgc3RhdGUgKEphdmllciwgTWF4aW1l
KQ0KPj4gCSogcHJlYWxsb2MgaW4gYXRvbWljX2NoZWNrIGluIHNldmVyYWwgZHJpdmVycw0K
Pj4gdjM6DQo+PiAJKiBubyBjaGFuZ2VzDQo+PiB2MjoNCj4+IAkqIHJlc2VydmUgc3RvcmFn
ZSBkdXJpbmcgcHJvYmluZyBpbiB0aGUgZHJpdmVycw0KPj4NCj4+IFsxXSBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyMjI0NC8NCj4+DQo+PiBUaG9tYXMg
WmltbWVybWFubiAoNyk6DQo+PiAgICBkcm0vZm9ybWF0LWhlbHBlcjogQ2FjaGUgYnVmZmVy
cyB3aXRoIHN0cnVjdCBkcm1fZm9ybWF0X2NvbnZfc3RhdGUNCj4+ICAgIGRybS9hdG9taWMt
aGVscGVyOiBBZGQgZm9ybWF0LWNvbnZlcnNpb24gc3RhdGUgdG8gc2hhZG93LXBsYW5lIHN0
YXRlDQo+PiAgICBkcm0vZm9ybWF0LWhlbHBlcjogUGFzcyBmb3JtYXQtY29udmVyc2lvbiBz
dGF0ZSB0byBoZWxwZXJzDQo+PiAgICBkcm0vb2Zkcm06IFByZWFsbG9jYXRlIGZvcm1hdC1j
b252ZXJzaW9uIGJ1ZmZlciBpbiBhdG9taWNfY2hlY2sNCj4+ICAgIGRybS9zaW1wbGVkcm06
IFByZWFsbG9jYXRlIGZvcm1hdC1jb252ZXJzaW9uIGJ1ZmZlciBpbiBhdG9taWNfY2hlY2sN
Cj4+ICAgIGRybS9zc2QxMzB4OiBGaXggYXRvbWljX2NoZWNrIGZvciBkaXNhYmxlZCBwbGFu
ZXMNCj4+ICAgIGRybS9zc2QxMzB4OiBQcmVhbGxvY2F0ZSBmb3JtYXQtY29udmVyc2lvbiBi
dWZmZXIgaW4gYXRvbWljX2NoZWNrDQo+Pg0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zv
cm1hdF9oZWxwZXIuYyAgICAgICAgICAgfCAyMTIgKysrKysrKysrKysrKy0tLS0tDQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2F0b21pY19oZWxwZXIuYyAgICAgICB8ICAgOSAr
DQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYyAgICAgICAgICAgICAgICB8
ICAxOSArLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMgICAgICAgICAg
ICAgICAgfCAgMzAgKystDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9zb2xvbW9uL3NzZDEzMHgu
YyAgICAgICAgICAgICB8ICAzNiArKy0NCj4+ICAgLi4uL2dwdS9kcm0vdGVzdHMvZHJtX2Zv
cm1hdF9oZWxwZXJfdGVzdC5jICAgIHwgIDcyICsrKy0tLQ0KPj4gICBkcml2ZXJzL2dwdS9k
cm0vdGlueS9jaXJydXMuYyAgICAgICAgICAgICAgICAgfCAgIDMgKy0NCj4+ICAgZHJpdmVy
cy9ncHUvZHJtL3RpbnkvaWxpOTIyNS5jICAgICAgICAgICAgICAgIHwgIDEwICstDQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmMgICAgICAgICAgICAgICAgICB8ICAxNiAr
LQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMgICAgICAgICAgICAgICAg
fCAgIDggKy0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgICAgICAg
ICAgICAgIHwgIDQzICsrKy0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc3Q3NTg2LmMg
ICAgICAgICAgICAgICAgIHwgIDE5ICstDQo+PiAgIGluY2x1ZGUvZHJtL2RybV9mb3JtYXRf
aGVscGVyLmggICAgICAgICAgICAgICB8ICA4MSArKysrKy0tDQo+PiAgIGluY2x1ZGUvZHJt
L2RybV9nZW1fYXRvbWljX2hlbHBlci5oICAgICAgICAgICB8ICAxMCArDQo+PiAgIGluY2x1
ZGUvZHJtL2RybV9taXBpX2RiaS5oICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQ0KPj4g
ICAxNSBmaWxlcyBjaGFuZ2VkLCA0MjggaW5zZXJ0aW9ucygrKSwgMTQ0IGRlbGV0aW9ucygt
KQ0KPj4NCj4+DQo+PiBiYXNlLWNvbW1pdDogNTdkM2I4M2E4M2M1NTI3MzI1ZWZiNWJjYWY1
OTRkYTA5ZmU0YTQxYg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZy
YW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRv
dGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpI
UkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------OGi32TWYuoDUNfG736zmpjcM--

--------------cTBkk6FAwHBe6wVM6uTFBR6W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUjsZQFAwAAAAAACgkQlh/E3EQov+Di
Rg/9E6W8C7foqlwVKf9cEqCWbF8NKEaXLW0xn7MUsfFgabdBSHJqugoVCJNe2j0w6Ofj78XFhuzO
C/ot2w/oWqZtBpJpnWoy55+GxUm0Gt26yFbN28RY0Gg/C17QnuB+MEr/p00vQJ+LCC9WfWFDHjqp
wDayAxQlgkUgdASbzaxuDjSYpZaLxq2pkgQw7Huwbg7MkSl+LaN3Hq0ybt6PDcCP5Ryp+7DKWPHI
YU38vNwwI9Y+Vs/YFZugu1dWA/RZNy4CM5yUGn3AmPR+yrHS3XQplaINlNJYmXxmizGtvGCvi1s5
ThaANvvN1buweUo7IRFKqanpPH1HITPa4KwivkYYdlf5zKfZnmPG6EF78RrefoCDauhis/uMpD7P
UbA/EhcoqR3OpybjeOUHbZui6wMc6RMhpD6dpMJ6r3OedslNwXO9vAfPBIQPbFCSuGJalFHtKAZa
jTXR1R+1EKF3JnPbXhcaUGt4LCedzRclT3+ex9WueGM/+AgqGztjPcw1hH+FPT7fN0nKDkdPawR5
OgYkkvNZJ8CkgEk1eMSoUMG9ToUiJFINXkQ9js7scwoYu069sj6N4fGbrTVz4+oH9z2Y2jouFM2s
AJru/Kvz58zXvMjyIRbjnVPEtZqLv/1jgEbqfSp77LYRIZjsTBNW1Es90X4UqQV5PjtKEY3p/967
y1A=
=/Fpm
-----END PGP SIGNATURE-----

--------------cTBkk6FAwHBe6wVM6uTFBR6W--
