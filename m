Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A95D27F5A77
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 09:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE96E10E6E8;
	Thu, 23 Nov 2023 08:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE2C10E6E8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 08:49:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7ACEE1F388;
 Thu, 23 Nov 2023 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700729378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JxFberQ404wgbXqZV/76fL0sp1boZWf40NtPUUoR4vU=;
 b=mRsjvH/w9RZbrlpkS+RxDbXn+bGv0t0H1tz3LUmguqi59SOJ/e9O0i+YGMZsw2zVsNOLOl
 DxAxRL8zVV1MeFjPfTsQlOAQDGTl68RkI/s9FP7opxVZENQiIm0Q1/0rCeaxYRPeqg4G2O
 jat8iKae1rLIvMcDSWofniRyp5os3pM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700729378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JxFberQ404wgbXqZV/76fL0sp1boZWf40NtPUUoR4vU=;
 b=B40nm2JuBhSbeRf7B/NW/MeSHCzKXwicV2PV2Bc/5dTw18Iq+mtNyiUHbH8gtJHDlMzEaa
 1SYoSoNmHzluOyBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A541133B6;
 Thu, 23 Nov 2023 08:49:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XisoESISX2X9CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Nov 2023 08:49:38 +0000
Message-ID: <58672ab8-99bf-4a2a-af79-031d1e8fcba0@suse.de>
Date: Thu, 23 Nov 2023 09:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Rob Herring <robh@kernel.org>
References: <20231113085305.1823455-1-javierm@redhat.com>
 <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
 <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
 <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
 <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------upfV0WxZzdwoKclRKhpPZ3IP"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.90
X-Spamd-Result: default: False [3.90 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[11];
 SIGNED_PGP(-2.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_SPAM_SHORT(2.99)[0.995];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_SPAM_LONG(3.50)[1.000]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[];
 FREEMAIL_CC(0.00)[vger.kernel.org, redhat.com, ffwll.ch, marcan.st, gmail.com,
 lists.freedesktop.org]
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
Cc: devicetree@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------upfV0WxZzdwoKclRKhpPZ3IP
Content-Type: multipart/mixed; boundary="------------Fc0X8xpFsmPbPYAsU52D33hX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Message-ID: <58672ab8-99bf-4a2a-af79-031d1e8fcba0@suse.de>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
References: <20231113085305.1823455-1-javierm@redhat.com>
 <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
 <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
 <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
 <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>

--------------Fc0X8xpFsmPbPYAsU52D33hX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMTEuMjMgdW0gMTI6MTAgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyaXRlczoNCj4g
DQo+IEhlbGxvIEFyZCwNCj4gDQo+PiBPbiBGcmksIDE3IE5vdiAyMDIzIGF0IDAwOjA5LCBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IFsuLi5dDQo+IA0K
Pj4+Pj4NCj4+Pj4+IFRoaXMgY291bGQgYWxzbyBsZWFkIHRvIGFuIGludGVyZXN0aW5nIHNj
ZW5hcmlvLiBBcyBzaW1wbGUtZnJhbWVidWZmZXINCj4+Pj4+IGNhbiBkZWZpbmUgaXRzIG1l
bW9yeSBpbiBhIC9yZXNlcnZlZC1tZW1vcnkgbm9kZSwgYnV0IHRoYXQgaXMgaWdub3JlZA0K
Pj4+Pj4gaW4gRUZJIGJvb3QuIFByb2JhYmx5IHdvdWxkIHdvcmssIGJ1dCBvbmx5IGJlY2F1
c2UgRUZJIHByb2JhYmx5DQo+Pj4+PiBnZW5lcmF0ZXMgaXRzIG1lbW9yeSBtYXAgdGFibGUg
ZnJvbSB0aGUgL3Jlc2VydmVkLW1lbW9yeSBub2Rlcy4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IEkg
c2VlLiBTbyB3aGF0IHdvdWxkIGJlIHRoZSBzb2x1dGlvbiB0aGVuPyBJZ25vcmluZyBjcmVh
dGluZyBhIHBsYXRmb3JtDQo+Pj4+IGRldmljZSBmb3IgInNpbXBsZS1mcmFtZWJ1ZmZlciIg
aWYgYm9vdGVkIHVzaW5nIEVGSSBhbmQgaGF2ZSBhbiBFRkktR09QPw0KPj4+DQo+Pj4gU2hy
dWcuIEkgZG9uJ3QgcmVhbGx5IGtub3cgYW55dGhpbmcgbW9yZSBhYm91dCBFRkkgRkIsIGJ1
dCBJIHdvdWxkDQo+Pj4gZ3Vlc3MgaXQgY2FuJ3Qgc3VwcG9ydCBoYW5kbGluZyByZXNvdXJj
ZXMgbGlrZSBjbG9ja3MsIHBvd2VyIGRvbWFpbnMsDQo+Pj4gcmVndWxhdG9ycywgZXRjLiB0
aGF0IHNpbXBsZS1mYiBjYW4uIFNvIGlmIGEgcGxhdGZvcm0gbmVlZHMgdGhvc2UsIGRvDQo+
Pj4gd2Ugc2F5IHRoZXkgc2hvdWxkIG5vdCBzZXR1cCBFRkktR09QPyBPciBpcyB0aGVyZSBh
IHVzZSBjYXNlIGZvcg0KPj4+IGhhdmluZyBib3RoPyBDbGllbnRzIHRoYXQgZG9uJ3QgbXVj
ayB3aXRoIHJlc291cmNlcyBjYW4gdXNlIEVGSS1HT1ANCj4+PiBhbmQgdGhvc2UgdGhhdCBk
byB1c2Ugc2ltcGxlLWZiLiBGb3IgZXhhbXBsZSwgZG9lcy9jYW4gZ3J1YiB1c2UNCj4+PiBF
RkktR09QLCBidXQgbm90IHNpbXBsZS1mYj8NCj4+Pg0KPj4NCj4+IFRoZSBFRkkgR09QIGlz
IGp1c3QgYSBkdW1iIGZyYW1lYnVmZmVyLCBhbmQgaXQgaXMgbm90IGV2ZW4gZ2VuZXJhbGx5
DQo+PiBwb3NzaWJsZSB0byBjcm9zcyByZWZlcmVuY2UgdGhlIEdPUCB3aXRoIGEgcGFydGlj
dWxhciBkZXZpY2UgaW4gdGhlDQo+PiBkZXZpY2UgaGllcmFyY2h5IHVubGVzcyB5b3UgZS5n
LiwgY29tcGFyZSB0aGUgQkFScyBvZiBlYWNoIGRldmljZSB3aXRoDQo+PiB0aGUgcmVnaW9u
IGRlc2NyaWJlZCBieSB0aGUgR09QIHByb3RvY29sLg0KPj4NCj4+IEdSVUIgZm9yIEVGSSB3
aWxsIHVzZSB0aGUgR09QIGFuZCBub3RoaW5nIGVsc2UsIGJ1dCBvbmx5IGF0IGJvb3QgdGlt
ZQ0KPj4gKHRoZSBHT1AgcHJvdG9jb2wgaXMgbW9yZSB0aGFuIGEgbWFnaWMgbGluZWFyIG1l
bW9yeSByZWdpb24sIGl0IGFsc28NCj4+IGltcGxlbWVudHMgYSBCbHQoKSBhYnN0cmFjdGlv
biB0aGF0IHBlcm1pdHMgdGhlIHVzZSBvZiBmcmFtZWJ1ZmZlcnMNCj4+IHRoYXQgYXJlIG5v
dCBtYXBwZWQgbGluZWFybHkgaW50byB0aGUgYWRkcmVzcyBzcGFjZSBhdCBhbGwsIGFuZCBH
UlVCDQo+PiBtYWtlcyB1c2Ugb2YgdGhpcykNCj4+DQo+PiBUaGUgRUZJIHN0dWIgd2lsbCBv
bmx5IGV4cG9zZSBHT1BzIHRvIHRoZSBrZXJuZWwgaWYgdGhleSBhcmUgaW4gZmFjdA0KPj4g
bGluZWFyIGZyYW1lYnVmZmVycywgYnV0IGhhcyB6ZXJvIGluc2lnaHQgaW50byB3aGV0aGVy
IHRoZSBoYXJkd2FyZQ0KPj4gbmVlZHMgY2xvY2tzIGFuZCByZWd1bGF0b3JzLCBhbmQgd2hl
dGhlciBvciBub3QgdGhlIGZyYW1lYnVmZmVyIG5lZWRzDQo+PiBJT01NVSBwYXNzIHRocm91
Z2ggKHdoaWNoIG1pZ2h0IGJlIHRoZSBjYXNlIGlmIHRoZSBzY2Fub3V0IGlzIHVzaW5nDQo+
PiBETUEgaW50byBzeXN0ZW0gbWVtb3J5KQ0KPj4NCj4+IFNvIGNhbGxpbmcgRUZJIEdPUCAn
c291cmNlIG9mIHRydXRoJyBpcyByYXRoZXIgZ2VuZXJvdXMsIGFuZCBJIHRoaW5rDQo+PiBp
dCBtYWtlcyBzZW5zZSB0byBwcmlvcml0aXplIG1vcmUgYWNjdXJhdGUgZGVzY3JpcHRpb25z
IG9mIHRoZQ0KPj4gdW5kZXJseWluZyBmcmFtZWJ1ZmZlciBvdmVyIEVGSSBHT1AuDQo+Pg0K
PiANCj4gVGhhdCB3YXMgbXkgb3BpbmlvbiBhcyB3ZWxsIGFuZCB0aGUgcmVhc29uIHdoeSBJ
IGNhbGxlZCB0aGUgRFRCIHRoZQ0KPiBzaW5nbGUgc291cmNlIG9mIHRydXRoLg0KPiANCj4+
IEhvd2V2ZXIsIG1ha2luZyAnc2ltcGxlLWZyYW1lYnVmZmVyJyBtYWdpYyBpbiB0aGlzIHJl
Z2FyZCBkb2Vzbid0IHNlZW0NCj4+IGxpa2UgYSBncmVhdCBhcHByb2FjaCB0byBtZS4gSXMg
dGhlcmUgYSBiZXR0ZXIgd2F5IHdlIGNvdWxkIGdldCB0aGUNCj4+IHJlc291cmNlIGNvbmZs
aWN0IHRvIGJlIGRlY2lkZWQgaW4gYSB3YXkgd2hlcmUgdGhlIEVGSSBHT1AgZ2V0cw0KPj4g
c3VwZXJzZWRlZCBpZiBpdHMgcmVzb3VyY2VzIGFyZSBjbGFpbWVkIGJ5IGFub3RoZXIgZGV2
aWNlPw0KPj4NCj4gDQo+IFRoZXJlIGlzIGFuIGFwZXJ0dXJlIFswXSBmcmFtZXdvcmsgdGhh
dCBpcyB1c2VkIGJ5IHRoZSBmYmRldiBhbmQgRFJNDQo+IHN1YnN5c3RlbXMgdG8gYWxsb3cg
bmF0aXZlIGRyaXZlcnMgdG8gcmVtb3ZlIGFueSBjb25mbGljdGluZyBkZXZpY2VzDQo+IHRo
YXQgc2hhcmUgdGhlIHNhbWUgZnJhbWVidWZmZXIgYXBlcnR1cmUuDQo+IA0KPiBCdXQgaXQg
b25seSBtYWtlcyBzZW5zZSBmb3IgbmF0aXZlIGRyaXZlcnMgdG8gdXNlIHRoYXQgSSB0aGlu
aywgYnV0DQo+IGluIHRoaXMgY2FzZSBpcyBhYm91dCB0d28gZHJpdmVycyB0aGF0IGF0dGVt
cHQgdG8gdXNlIHRoZSBzYW1lIGZyYW1lDQo+IGJ1ZmZlciBwcm92aWRlZCBieSB0aGUgZmly
bXdhcmUgYnV0IGdldHRpbmcgaXQgZnJvbSBkaWZmZXJlbnQgcGxhY2VzLg0KPiANCj4gSSBk
b24ndCBoYXZlIGEgYmV0dGVyIGlkZWEgdGhhbiB0aGlzIHBhdGNoIGJ1dCBtYXliZSBUaG9t
YXMgb3IgU2ltYSBkbz8NCg0KQXQgU1VTRSwgd2UndmUgY2FycmllZCBzdWNoIGEgcGF0Y2gg
aW4gb3VyIHJlcG9zIGZvciBzb21lIHRpbWUuIEl0IHdvcmtzIA0KYXJvdW5kIHRoZSBkb3Vi
bGUtZnJhbWVidWZmZXIgcHJvYmxlbSBpbiBhIHNpbWlsYXIgd2F5LiBbMV0NCg0KQXMgSmF2
aWVyIG1lbnRpb25lZCwgd2UgZG8gdHJhY2sgdGhlIGZyYW1lYnVmZmVyIHJhbmdlcyBmb3Ig
RUZJL1ZFU0EvT0YgDQpmcmFtZWJ1ZmZlcnMgaW4gdGhlIGdyYXBoaWNzIGFwZXJ0dXJlIGhl
bHBlcnMuIEZiZGV2IGhhcyBkb25lIHRoaXMgZm9yIA0KZGVjYWRlcywgYW5kIHRoZSBjdXJy
ZW50IGNvZGViYXNlIGV4dGVuZHMgYW5kIGhhcm1vbml6ZXMgdGhpcyANCmZ1bmN0aW9uYWxp
dHkgYW1vbmcgZmJkZXYgYW5kIERSTSBkcml2ZXJzLg0KDQpXUlQgRFQgdnMgRUZJOiBBRkFJ
SyB0aGUgRUZJIHN1cHBvcnQgb24gYWZmZWN0ZWQgcGxhdGZvcm1zIGxvb2tzIGF0IHRoZSAN
CkRUIHRvIHNldCB1cCB0aGUgRUZJIGZyYW1lYnVmZmVyLiBTbyBJTUhPIHRoZSBEVCBpcyB0
aGUgYXV0aG9yaXRhdGl2ZSANCnNvdXJjZSBvbiB0aGUgZnJhbWVidWZmZXIuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNClsxXSBodHRwczovL2J1Z3ppbGxhLnN1c2UuY29tL3Nob3df
YnVnLmNnaT9pZD0xMjA0MzE1DQoNCj4gDQo+IFswXTogaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL3ZpZGVvL2FwZXJ0dXJlLmMNCj4g
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2Ug
MTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBN
eWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcg
TnVlcm5iZXJnKQ0K

--------------Fc0X8xpFsmPbPYAsU52D33hX--

--------------upfV0WxZzdwoKclRKhpPZ3IP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVfEiEFAwAAAAAACgkQlh/E3EQov+D/
Rg/+JCMxA/Ek5qzn6qh51bQExv5ChLesYcAAlKDmzW7Aav+4VfC9QeV5hyEpa1lWyE5zofL8E2bO
W+atZEFH/qBsDC85l7rP/fZ+zV3ygaAmnNvvrkXVxF5d9ULOxWfpB7ZZ7IkEmdQiUUJGxKE0FGL4
9PIf4v+0Qk4jJ9beRqke4+KgCfgKhRkhLuHmeo61ZlvWmP4v+1oj9gZbmTE3NXJmmbgpOmY5km6d
g8RgQcl3mZChCPv5ZtQR9sK+0/Tmq4sA9lnH5GcvfFKfAhI1p+se6LlCvMVgyVTN+3sALkquZnE8
sC0cmhdzCzYW8ldR573ni92BbGYn6ONYQUHgBOb/Y9pZA/y04/3Ttfjih5Bv+lL/lRO6dDP0+xzX
y4EAgoa+NkhuPwuvzLSXEk37Qjx+lgiCGciDnWEq+AIZJXsRcZsU2HmQ9zvCA6Iak69ONNvGZTsP
v0lzvHFYqE6JBu0S4vZNZUZoZIcg2o+fgtKav1UA6ctwk8bGqpYLGpxt56zsxZuaC/KC3BGTAP46
bX78pvCP8b6CX5v4MTW1EDkP2cDDn2kKsRqyXaP/Rf1ICKJk9BMGRbJ+VLEvWg5V9TwAglPmGMpu
akfOva5dZx6QQmC4UIxBgCSNdgiSa0BnKtE78QNUCy/GxPBEjFM0toP0rVDSqAjt7FtM9h17NTYk
mPQ=
=dVik
-----END PGP SIGNATURE-----

--------------upfV0WxZzdwoKclRKhpPZ3IP--
