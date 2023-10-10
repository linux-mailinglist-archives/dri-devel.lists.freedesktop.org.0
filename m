Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B97BF6B8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 11:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA46410E1D6;
	Tue, 10 Oct 2023 09:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F0610E1D6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 09:04:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D72B61F461;
 Tue, 10 Oct 2023 09:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696928674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3Hixv69NyJ9EMbb7+MfHZnnVqZyS4xuyRB8q+Wdz9qs=;
 b=Ig4cZ6AiqlZNFiMfmQvSqHl9+5wadDhMbH+9TvnOd8fndFltvmxHuXryXvMIPVBgknLSZW
 cGOmI5p5U/rJj+aSaVrHR8xpsNxO5gekCZWaW/cz7vSc2rHoaw3xUOrqDkdO+MWkvZT19W
 uzgcDCGMRrRv9ggbaayY1UkDbLcZsfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696928674;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3Hixv69NyJ9EMbb7+MfHZnnVqZyS4xuyRB8q+Wdz9qs=;
 b=EO1/G05B/d5oKET0d6AzyWz4cR4rrN99UBxfI/1Jr0AlsJn9/D+pt0LBB1oAeEO3mMm9QN
 uJvFrAle7M1HvqCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A987D1358F;
 Tue, 10 Oct 2023 09:04:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +CuHKKITJWU9bwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Oct 2023 09:04:34 +0000
Message-ID: <18af6c07-e2c1-4c77-8083-2e82d29f16c9@suse.de>
Date: Tue, 10 Oct 2023 11:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>
References: <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <f9473f01-f78b-2ea0-0de4-116076ef7b5a@redhat.com>
 <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>
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
In-Reply-To: <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Tkx7BxpF3QiYUkL661K0PblV"
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Tkx7BxpF3QiYUkL661K0PblV
Content-Type: multipart/mixed; boundary="------------uJWk0AyP61pIgPYTbeTHCf5G";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, airlied@redhat.com
Message-ID: <18af6c07-e2c1-4c77-8083-2e82d29f16c9@suse.de>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
References: <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <f9473f01-f78b-2ea0-0de4-116076ef7b5a@redhat.com>
 <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>
In-Reply-To: <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>

--------------uJWk0AyP61pIgPYTbeTHCf5G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMTAuMjMgdW0gMTg6MDcgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
biBNb24sIE9jdCAwOSwgMjAyMyBhdCAwNDowNToxOVBNICswMjAwLCBKb2NlbHluIEZhbGVt
cGUgd3JvdGU6DQo+Pj4+IC0gSSBmaW5kIGl0IHJpc2t5IHRvIGNvbXBsZXRlbHkgcmVjb25m
aWd1cmUgdGhlIGhhcmR3YXJlIGluIGEgcGFuaWMgaGFuZGxlci4NCj4+Pg0KPj4+IEkgd291
bGQgZXhwZWN0IHRvIG9ubHkgY2hhbmdlIHRoZSBmb3JtYXQgYW5kIGJhc2UgYWRkcmVzcyBv
ZiB0aGUNCj4+PiBmcmFtZWJ1ZmZlci4gSSBndWVzcyBpdCBjYW4gZmFpbCwgYnV0IGl0IGRv
ZXNuJ3Qgc2VlbSB0aGF0IGRpZmZlcmVudCB0bw0KPj4+IHRoZSBhc3luYyBwbGFuZSB1cGRh
dGUgd2UgYWxyZWFkeSBoYXZlIGFuZCB3b3JrcyB3ZWxsLg0KPj4+DQo+PiBJbiB0aGlzIGNh
c2UgaXQgY2FuIHdvcmssIGJ1dCBieSB1c2luZyBnZW5lcmljIGRybSBhcGksIGl0J3MgaGFy
ZCB0byBrbm93DQo+PiB3aGF0IHRoZSBkcml2ZXIgd2lsbCBkby4NCj4gDQo+IFdlIHNob3Vs
ZCBkb2N1bWVudCBleHRlbnNpdmVseSB3aGF0IHdlIGV4cGVjdCBkcml2ZXJzIHRvIGRvIGlu
IHRob3NlDQo+IGhvb2tzLCBhbmQgcG9zc2libHkgY2FsbCBjYW50X3NsZWVwKCkgaW4gdGhl
IGZyYW1ld29yayBmdW5jdGlvbiB0byBoYXZlDQo+IHNvbWUgcmVwb3J0aW5nIGF0IGxlYXN0
Lg0KPiANCj4+Pj4gQWxzbyBob3cgbWFueSBkcml2ZXJzIHdvdWxkIG5lZWQgdGhpcyA/DQo+
Pj4+DQo+Pj4+IEN1cnJlbnRseSBJIHdhcyBtb3N0bHkgY29uc2lkZXJpbmcgeDg2IHBsYXRm
b3JtLCBzbzoNCj4+Pj4NCj4+Pj4gc2ltcGxlZHJtL2FzdC9tZ2FnMjAwIHdoaWNoIHdvcmtz
IHdlbGwgd2l0aCB0aGUgZ2V0X3NjYW5vdXRfYnVmZmVyKCkuDQo+Pj4+DQo+Pj4+IGk5MTUv
YW1kZ3B1L25vdXZlYXUsIHdoaWNoIGFyZSBxdWl0ZSBjb21wbGV4LCBhbmQgd2lsbCBuZWVk
IHRvIGRvIHRoZWlyIG93bg0KPj4+PiB0aGluZyBhbnl3YXkuDQo+Pj4NCj4+PiBJIGd1ZXNz
IHdlJ3JlIG5vdCBlbnRpcmVseSBhbGlnbmVkIHRoZXJlIHRoZW4uIEkgd291bGQgZXhwZWN0
IHRoYXQNCj4+PiBtZWNoYW5pc20gdG8gd29yayB3aXRoIGFueSBhdG9taWMgS01TIGRyaXZl
ci4gWW91IGFyZSByaWdodCB0aGF0IGk5MTUsDQo+Pj4gYW1kZ3B1IGFuZCBub3V2ZWF1IGFy
ZSBzcGVjaWFsIGVub3VnaCB0aGF0IHNvbWUgZXh0cmEgaW50ZXJuYWwgcGx1bWJpbmcNCj4+
PiBpcyBnb2luZyB0byBiZSByZXF1aXJlZCwgYnV0IEknZCBleHBlY3QgaXQgdG8gYmUgZWFz
eSB0byBzdXBwb3J0IHdpdGgNCj4+PiBhbnkgb3RoZXIgZHJpdmVyIGZvciBhIG1lbW9yeS1t
YXBwZWQgZGV2aWNlLg0KPj4+DQo+Pj4gSSBndWVzcyB3aGF0IEknbSB0cnlpbmcgdG8gc2F5
IGlzLCBldmVuIHRob3VnaCBpdCdzIHRvdGFsbHkgZmluZSB0aGF0DQo+Pj4geW91IG9ubHkg
c3VwcG9ydCB0aG9zZSBkcml2ZXJzIGF0IGZpcnN0LCBzdXBwb3J0aW5nIGluIHZjNCBmb3Ig
ZXhhbXBsZQ0KPj4+IHNob3VsZG4ndCByZXF1aXJlIHRvIHJld3JpdGUgdGhlIHdob2xlIHRo
aW5nLg0KPj4NCj4+IFdvdWxkIHRoYXQgd29yayBmb3IgeW91IHRvIHB1dCB0aGF0IGluIGEg
ZHJtX3BhbmljX2hlbHBlci5jLA0KPj4gc28gdGhhdCBkcml2ZXJzIGNhbiBvcHQtaW4gPw0K
Pj4NCj4+IFNvIHRoZSBkcml2ZXIgY2FuIGNhbGwgYSBkcm1fcGFuaWNfaGVscGVyX3ByZXBh
cmVfY29tbWl0KCkgYXQNCj4+IGluaXRpYWxpemF0aW9uLCBhbmQgdGhlbiBpbiB0aGUgZ2V0
X3NjYW5vdXRfYnVmZmVyKCkgZnVuY3Rpb24NCj4gDQo+IElmIHdlIGhhdmUgYSBmdWxsIGJs
b3duIGNvbW1pdCB3aXRoIGEgbmV3IGZyYW1lYnVmZmVyLCB3aHkgZG8gd2UgbmVlZA0KPiBn
ZXRfc2Nhbm91dF9idWZmZXI/IEl0IHNob3VsZCBiZSBlaXRoZXIgdGhlIGZyYW1lYnVmZmVy
IGl0c2VsZiwgb3IgaW4NCj4gdGhlIHBsYW5lIHN0YXRlIGlmIHlvdSBoYXZlIGEgY29udmVy
c2lvbi4NCg0KV2UgYWxzbyBoYXZlIGRpc2N1c3Npb25zIGFib3V0IGtleGVjL2tkdW1wIHN1
cHBvcnQuIEhlcmUgd2UnZCBuZWVkIHRvIA0KcmV0cmlldmUgdGhlIHNjYW5vdXQgYWRkcmVz
cywgZm9yd2FyZCBpdCB0byB0aGUga2V4ZWMga2VybmVsIGFuZCBwdXQgDQpzaW1wbGVkcm0g
b250byB0aGF0IGZyYW1lYnVmZmVyIHVudGlsIHRoZSByZWd1bGFyIGRyaXZlciB0YWtlcyBv
dmVyLiBBbiANCmludGVyZmFjZSBsaWtlIGdldF9zY2Fub3V0X2J1ZmZlciB3aWxsIGJlIGhl
bHBmdWwgZm9yIHRoaXMgdXNlIGNhc2UuIFNvIA0KaXQgbWFrZXMgc2Vuc2UgdG8gdXNlIGl0
IGZvciB0aGUgcGFuaWMgaGFuZGxlciBhcyB3ZWxsLg0KDQo+IA0KPj4gcnVuIHRoZSBhdG9t
aWNfdXBkYXRlKCkgb24gaXQsIGFuZCByZXR1cm4gdGhpcyBjb21taXQncyBmcmFtZWJ1ZmZl
ciA/DQo+Pg0KPj4gVGhhdCB3YXkgZWFjaCBkcml2ZXIgaGF2ZSBhIGJldHRlciBjb250cm9s
IG9uIHdoYXQgdGhlIHBhbmljIGhhbmRsZXIgd2lsbA0KPj4gZG8uDQo+PiBJdCBjYW4gZXZl
biBjYWxsIGRpcmVjdGx5IGl0cyBpbnRlcm5hbCBmdW5jdGlvbnMsIHRvIGF2b2lkIHRoZSBs
b2NrcyBvZiB0aGUNCj4+IGRybSBnZW5lcmljIGZ1bmN0aW9ucywgYW5kIG1ha2Ugc3VyZSBp
dCB3aWxsIG9ubHkgY2hhbmdlIHRoZSBmb3JtYXQgYW5kIGJhc2UNCj4+IGFkZHJlc3MuDQo+
PiBUaGF0J3MgYSBiaXQgbW9yZSB3b3JrIGZvciBlYWNoIGRyaXZlciwgYnV0IHNob3VsZCBi
ZSBtb3JlIHJlbGlhYmxlIEkgdGhpbmsuDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoYXQgYmV0
dGVyIGNvbnRyb2wgdGhlcmUgaXMgYSBnb29kIGlkZWEsIGl0J3MgYSBwYXRoIHRoYXQNCj4g
d29uJ3QgZ2V0IHRlc3RlZCBtdWNoIHNvIHdlJ2QgYmUgYmV0dGVyIG9mZiBub3QgYWxsb3dp
bmcgZHJpdmVycyB0bw0KPiBkZXZpYXRlIHRvbyBtdWNoIGZyb20gdGhlICJpZGVhbCIgZGVz
aWduLg0KPiANCj4gV2hhdCBJIGhhZCBpbiBtaW5kIGlzIHNvbWV0aGluZyBsaWtlOg0KPiAN
Cj4gICAgLSBBZGQgYSBwYW5pYyBob29rIGluIGRybV9tb2RlX2NvbmZpZ19mdW5jcywgd2l0
aCBhDQo+ICAgICAgZHJtX2F0b21pY19oZWxwZXJfcGFuaWMgaGVscGVyOw0KPiANCj4gICAg
LSBQcm92aWRlIGFuIGF0b21pY19wYW5pYyBob29rIG9yIHNvbWV0aGluZyBpbiBkcm1fcGxh
bmVfaGVscGVyX2Z1bmNzOw0KPiANCj4gICAgLSBJZiB0aGV5IGFyZSBzZXQsIHdlIHJlZ2lz
dGVyIHRoZSBkcm1fcGFuaWMgaGFuZGxlcjsNCj4gDQo+ICAgIC0gVGhlIGhhbmRsZXIgd2ls
bCBjYWxsIGRybV9tb2RlX2NvbmZpZ19mdW5jcy5wYW5pYywgd2hpY2ggd2lsbCB0YWtlDQo+
ICAgICAgaXRzIHByZXBhcmVkIHN0YXRlLCBmaWxsIHRoZSBmcmFtZWJ1ZmZlciBpdCBhbGxv
Y2F0ZWQgd2l0aCB0aGUNCj4gICAgICBwZW5ndWluIGFuZCBiYWNrdHJhY2UsIGNhbGwgZHJt
X3BsYW5lX2hlbHBlcl9mdW5jcy5hdG9taWNfcGFuaWMoKS4NCj4gDQo+ICAgIC0gVGhlIGRy
aXZlciBub3cgdXBkYXRlcyB0aGUgZm9ybWF0IGFuZCBmYiBhZGRyZXNzLg0KPiANCj4gICAg
LSBIYWx0IGFuZCBjYXRjaCBmaXJlDQo+IA0KPiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8NCg0K
UGxlYXNlIHNlZSBteSBvdGhlciByZXBsaWVzLiBJIGZpbmQgdGhpcyBmcmFnaWxlLCBhbmQg
dW5uZWNlc3NhcnkgZm9yIA0KY2FzZXMgd2hlcmUgdGhlcmUgYWxyZWFkeSBpcyBhIHdvcmtp
bmcgc2Nhbm91dCBidWZmZXIgaW4gcGxhY2UuIEl0J3MgDQpzb21ldGhpbmcgYSBkcml2ZXIg
Y291bGQgaW1wbGVtZW50IGludGVybmFsbHkgdG8gcHJvdmlkZSBhIHNjYW5vdXQgDQpidWZm
ZXIgaWYgbm9uZSBoYXMgYmVlbiBzZXQgdXAgYWxyZWFkeS4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiBNYXhpbWUNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1h
bg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------uJWk0AyP61pIgPYTbeTHCf5G--

--------------Tkx7BxpF3QiYUkL661K0PblV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUlE6IFAwAAAAAACgkQlh/E3EQov+BQ
Jg/8DahoiDRyc1Gnmsf5tZqWMCAOAPd803y/hME7ImOdx1ILakR0rvEMWTkUlYh55cYYMTy5Wp7+
oBKHrq8hZHl0ncXSR9v6Vo/YRP7V531uo2Dj1oWhEggWe39NTF3ocMbCdg3kMJFtH8sSUCc8gCft
NYN9+lGBxAsVtgxoaWF6Yp4FY2d3hGra0VUEFi2QB2l5YDPCG9Ng3dbplf2165hXQE3MoSVv3Gwp
8ob1NubW+NTWTjfsAuThhvYa2G+Hf3bCOy6BmOCdMfYc6bQJP66JFR8N50QBH2P23oUYj9PgHHxZ
bJ1qiTMcglZ6q/qfRz1+WV3fsUeIrWenL1vwhspXSjBHwWUJDhzP0HRJYFhEbBurgK8qwK3TpAtN
fvSXJi9wD4eonS5chkOg+RR7qIfBtdpzsIApAa/wt74VUwO3RHrqZIi3bTLsZpUJPEop2oPotFpT
VXwT97Rn6AROe1eFXnpSu7OYqgwO92QLU1mDkTUJLqvakG9hqyXj4n+KOCs9wTpErHTNrEHuWpHF
PxeqbnR8AFxZ4e/OEyJBIKGqNukEoQoCdZ8yeq29k7P4lqrLk6fA95PrLwe8YhSo+utkRt9jgsza
WnxWtNA8AVnWeaVfZLz2kVZyRL7RwOojK/AhtXOFovhNykn/hIk7cc4DzSgn7VxmJmr9/bB5rlV2
CWs=
=7KQl
-----END PGP SIGNATURE-----

--------------Tkx7BxpF3QiYUkL661K0PblV--
