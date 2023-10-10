Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4C7BFCE0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA8710E01F;
	Tue, 10 Oct 2023 13:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EAB10E01F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:05:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3A72A1F38A;
 Tue, 10 Oct 2023 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696943121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hDcushfrq/dNn/rtpFHCEeJz+rDtL0woKOnwvo2WfWY=;
 b=BzP8NAv0kHQ8viTh0yG2H21N5cSE7zc2WeIrfczZhSfToC3l0HeLLLX/a1HjGw5r12KYon
 Am4zPbAkfyp3ytJy7eTQTMWzJcsXbv9+7z96fvA+gvQx2FHlMBsKL/BS/d2RiRb6UKSEG3
 gbvsn3tPXwGp1OkAeXkTPuv+2yg/9nA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696943121;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hDcushfrq/dNn/rtpFHCEeJz+rDtL0woKOnwvo2WfWY=;
 b=Ogiaz0i7xPTnprYgOTSLMKZbkzTbHk14OUrLhZXDH+0uC60kiZje9qvGEYy6ewJuG/2sbT
 MXok2ULquZ4Ve7DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C6241348E;
 Tue, 10 Oct 2023 13:05:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ul0IAhFMJWXUXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Oct 2023 13:05:21 +0000
Message-ID: <dfc93641-b163-4114-97bc-c481b15f16b8@suse.de>
Date: Tue, 10 Oct 2023 15:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <f9473f01-f78b-2ea0-0de4-116076ef7b5a@redhat.com>
 <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>
 <18af6c07-e2c1-4c77-8083-2e82d29f16c9@suse.de>
 <nkfwl7bs7mbe4xqj3skktlkfoh5osgvdx5jj3oa7dfdfetxnxm@eutubfkjbhmp>
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
In-Reply-To: <nkfwl7bs7mbe4xqj3skktlkfoh5osgvdx5jj3oa7dfdfetxnxm@eutubfkjbhmp>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xRduCDcoJEuvmzEP2K0o5rEp"
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xRduCDcoJEuvmzEP2K0o5rEp
Content-Type: multipart/mixed; boundary="------------iSQiM14YCdJsy4b2eOzVkafs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, airlied@redhat.com
Message-ID: <dfc93641-b163-4114-97bc-c481b15f16b8@suse.de>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
References: <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
 <f9473f01-f78b-2ea0-0de4-116076ef7b5a@redhat.com>
 <pdzyzvq4bvaec5ohwoh3p2gdzul4vvqk5a3q2lkbmsx4lm4sem@uckgzhlhks53>
 <18af6c07-e2c1-4c77-8083-2e82d29f16c9@suse.de>
 <nkfwl7bs7mbe4xqj3skktlkfoh5osgvdx5jj3oa7dfdfetxnxm@eutubfkjbhmp>
In-Reply-To: <nkfwl7bs7mbe4xqj3skktlkfoh5osgvdx5jj3oa7dfdfetxnxm@eutubfkjbhmp>

--------------iSQiM14YCdJsy4b2eOzVkafs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMTAuMjMgdW0gMTE6MzMgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KWy4u
Ll0NCj4+IFdlIGFsc28gaGF2ZSBkaXNjdXNzaW9ucyBhYm91dCBrZXhlYy9rZHVtcCBzdXBw
b3J0LiBIZXJlIHdlJ2QgbmVlZCB0bw0KPj4gcmV0cmlldmUgdGhlIHNjYW5vdXQgYWRkcmVz
cywgZm9yd2FyZCBpdCB0byB0aGUga2V4ZWMga2VybmVsIGFuZCBwdXQNCj4+IHNpbXBsZWRy
bSBvbnRvIHRoYXQgZnJhbWVidWZmZXIgdW50aWwgdGhlIHJlZ3VsYXIgZHJpdmVyIHRha2Vz
IG92ZXIuDQo+IA0KPiBHZW5lcmljYWxseSBzcGVha2luZywgdGhlcmUncyBzdHJpY3RseSBu
byBndWFyYW50ZWUgdGhhdCB0aGUgY3VycmVudA0KPiBzY2Fub3V0IGJ1ZmZlciBpcyBhY2Nl
c3NpYmxlIGJ5IHRoZSBDUFUuIEl0J3Mgbm90IGV2ZW4gYSBkcml2ZXIgaXNzdWUsDQo+IGl0
J3MgYSB3b3JrbG9hZCBpc3N1ZSwgc28gaXQgd2lsbCBhZmZlY3QgMTAwJSBvZiB0aGUgdGlt
ZXMgc29tZSB1c2VycywNCj4gYW5kIHNvbWUgMCUgb2YgdGhlIHRpbWUuDQoNCkFuZCBJJ2Qg
YmUgT0sgd2l0aCB0aGF0LiBJdCdzIGFsbCBiZXN0IGVmZm9ydCBhbnl3YXkuDQoNCj4gDQo+
PiBBbiBpbnRlcmZhY2UgbGlrZSBnZXRfc2Nhbm91dF9idWZmZXIgd2lsbCBiZSBoZWxwZnVs
IGZvciB0aGlzIHVzZQ0KPj4gY2FzZS4gU28gaXQgbWFrZXMgc2Vuc2UgdG8gdXNlIGl0IGZv
ciB0aGUgcGFuaWMgaGFuZGxlciBhcyB3ZWxsLg0KPiANCj4gSXQgd29uJ3QgYmUgaGVscGZ1
bCBiZWNhdXNlIHRoZSB2YXN0IG1ham9yaXR5IG9mIHRoZSBBUk0gZHJpdmVycyAoYW5kDQo+
IHRodXMgdGhlIHZhc3QgbWFqb3JpdHkgb2YgdGhlIEtNUyBkcml2ZXJzKSB3b24ndCBiZSBh
YmxlIHRvIGltcGxlbWVudCBpdA0KPiBwcm9wZXJseSBhbmQgcmVsaWFibHkuDQoNClRoZSBi
YXJyaWVyIGZvciBmaXJtd2FyZS1iYXNlZCBkcml2ZXJzIGlzIGxvdzogYSBwcmUtY29uZmln
dXJlZCBkaXNwbGF5IA0KYW5kIG1tYXAnYWJsZSBmcmFtZWJ1ZmZlciBtZW1vcnkuIEFuZCBp
dCdzIGFzc3VtZWQgdGhhdCBhIGNhbGxiYWNrIGZvciANCmtleGVjIHdvdWxkIGF0dGVtcHQg
dG8gY29uZmlndXJlIGhhcmR3YXJlIGFjY29yZGluZ2x5LiBJZiBhIHN5c3RlbSANCnJlYWxs
eSBjYW5ub3QgcHJvdmlkZSB0aGlzLCBzbyBiZSBpdC4NCg0KPiANCj4+Pj4gcnVuIHRoZSBh
dG9taWNfdXBkYXRlKCkgb24gaXQsIGFuZCByZXR1cm4gdGhpcyBjb21taXQncyBmcmFtZWJ1
ZmZlciA/DQo+Pj4+DQo+Pj4+IFRoYXQgd2F5IGVhY2ggZHJpdmVyIGhhdmUgYSBiZXR0ZXIg
Y29udHJvbCBvbiB3aGF0IHRoZSBwYW5pYyBoYW5kbGVyIHdpbGwNCj4+Pj4gZG8uDQo+Pj4+
IEl0IGNhbiBldmVuIGNhbGwgZGlyZWN0bHkgaXRzIGludGVybmFsIGZ1bmN0aW9ucywgdG8g
YXZvaWQgdGhlIGxvY2tzIG9mIHRoZQ0KPj4+PiBkcm0gZ2VuZXJpYyBmdW5jdGlvbnMsIGFu
ZCBtYWtlIHN1cmUgaXQgd2lsbCBvbmx5IGNoYW5nZSB0aGUgZm9ybWF0IGFuZCBiYXNlDQo+
Pj4+IGFkZHJlc3MuDQo+Pj4+IFRoYXQncyBhIGJpdCBtb3JlIHdvcmsgZm9yIGVhY2ggZHJp
dmVyLCBidXQgc2hvdWxkIGJlIG1vcmUgcmVsaWFibGUgSSB0aGluay4NCj4+Pg0KPj4+IEkg
ZG9uJ3QgdGhpbmsgdGhhdCBiZXR0ZXIgY29udHJvbCB0aGVyZSBpcyBhIGdvb2QgaWRlYSwg
aXQncyBhIHBhdGggdGhhdA0KPj4+IHdvbid0IGdldCB0ZXN0ZWQgbXVjaCBzbyB3ZSdkIGJl
IGJldHRlciBvZmYgbm90IGFsbG93aW5nIGRyaXZlcnMgdG8NCj4+PiBkZXZpYXRlIHRvbyBt
dWNoIGZyb20gdGhlICJpZGVhbCIgZGVzaWduLg0KPj4+DQo+Pj4gV2hhdCBJIGhhZCBpbiBt
aW5kIGlzIHNvbWV0aGluZyBsaWtlOg0KPj4+DQo+Pj4gICAgIC0gQWRkIGEgcGFuaWMgaG9v
ayBpbiBkcm1fbW9kZV9jb25maWdfZnVuY3MsIHdpdGggYQ0KPj4+ICAgICAgIGRybV9hdG9t
aWNfaGVscGVyX3BhbmljIGhlbHBlcjsNCj4+Pg0KPj4+ICAgICAtIFByb3ZpZGUgYW4gYXRv
bWljX3BhbmljIGhvb2sgb3Igc29tZXRoaW5nIGluIGRybV9wbGFuZV9oZWxwZXJfZnVuY3M7
DQo+Pj4NCj4+PiAgICAgLSBJZiB0aGV5IGFyZSBzZXQsIHdlIHJlZ2lzdGVyIHRoZSBkcm1f
cGFuaWMgaGFuZGxlcjsNCj4+Pg0KPj4+ICAgICAtIFRoZSBoYW5kbGVyIHdpbGwgY2FsbCBk
cm1fbW9kZV9jb25maWdfZnVuY3MucGFuaWMsIHdoaWNoIHdpbGwgdGFrZQ0KPj4+ICAgICAg
IGl0cyBwcmVwYXJlZCBzdGF0ZSwgZmlsbCB0aGUgZnJhbWVidWZmZXIgaXQgYWxsb2NhdGVk
IHdpdGggdGhlDQo+Pj4gICAgICAgcGVuZ3VpbiBhbmQgYmFja3RyYWNlLCBjYWxsIGRybV9w
bGFuZV9oZWxwZXJfZnVuY3MuYXRvbWljX3BhbmljKCkuDQo+Pj4NCj4+PiAgICAgLSBUaGUg
ZHJpdmVyIG5vdyB1cGRhdGVzIHRoZSBmb3JtYXQgYW5kIGZiIGFkZHJlc3MuDQo+Pj4NCj4+
PiAgICAgLSBIYWx0IGFuZCBjYXRjaCBmaXJlDQo+Pj4NCj4+PiBEb2VzIHRoYXQgbWFrZSBz
ZW5zZT8NCj4+DQo+PiBQbGVhc2Ugc2VlIG15IG90aGVyIHJlcGxpZXMuIEkgZmluZCB0aGlz
IGZyYWdpbGUsIGFuZCB1bm5lY2Vzc2FyeSBmb3IgY2FzZXMNCj4+IHdoZXJlIHRoZXJlIGFs
cmVhZHkgaXMgYSB3b3JraW5nIHNjYW5vdXQgYnVmZmVyIGluIHBsYWNlLg0KPiANCj4gQW5k
IHBsZWFzZSBzZWUgbXkgb3RoZXIgcmVwbGllcy4gRGVwZW5kaW5nIG9uIGEgd29ya2luZyBz
Y2Fub3V0IGJ1ZmZlcg0KPiBpbiBwbGFjZSBiZWluZyBhY2Nlc3NpYmxlIGJ5IHRoZSBDUFUg
aXMgaW5jcmVkaWJseSBsaW1pdGluZy4gSWdub3JpbmcgaXQNCj4gd2hlbiBJJ20gcG9pbnRp
bmcgdGhhdCBvdXQgd29uJ3QgZ2V0IHVzIHRvIGEgc29sdXRpb24gYWNjZXB0YWJsZSBmb3IN
Cj4gZXZlcnlvbmUuDQo+IA0KPj4gSXQncyBzb21ldGhpbmcgYSBkcml2ZXIgY291bGQgaW1w
bGVtZW50IGludGVybmFsbHkgdG8gcHJvdmlkZSBhDQo+PiBzY2Fub3V0IGJ1ZmZlciBpZiBu
b25lIGhhcyBiZWVuIHNldCB1cCBhbHJlYWR5Lg0KPiANCj4gU29tZSBkcml2ZXJzIG5lZWQg
ZXh0cmEgcmVzb3VyY2VzIHdoZW4gc2V0dGluZyB1cCBhIHBsYW5lLiBWQzQgZm9yDQo+IGV4
YW1wbGUgbmVlZCBmb3IgZXZlcnkgcGxhbmUgdG8gYWxsb2NhdGUgbXVsdGlwbGUgaW50ZXJu
YWwgU1JBTSBidWZmZXJzLg0KPiBKdXN0IGFsbG9jYXRpbmcgYW4gZXh0cmEgZnJhbWVidWZm
ZXIgd29uJ3QgY3V0IGl0Lg0KPiANCj4gVGhpcyBpcyB0aWVkIHRvIHRoZSBzdGF0ZSBzbyBm
YXIsIHNvIEkgZ3Vlc3Mgd2Ugd291bGQgbmVlZCB0byBhbGxvY2F0ZSBhDQo+IG5ldyBzdGF0
ZS4gT2gsIGFuZCBpZiB3ZSBoYXZlIHNldmVyYWwgZHJpdmVycyB0aGF0IG5lZWQgdG8gYWxs
b2NhdGUgdGhhdA0KPiBleHRyYSBmcmFtZWJ1ZmZlciBhbmQgc3RhdGUsIHdlIGNvdWxkIG1h
a2UgaXQgcGFydCBvZiB0aGUgY29yZSBvciB0dXJuDQo+IGl0IGludG8gYSBoZWxwZXI/DQoN
CkkgbWVudGlvbmVkIHRoYXQgZXZlbiB0aGUgc2ltcGxlIGRyaXZlcnMgaG9sZCBsb2NrcyBk
dXJpbmcgdGhlIGF0b21pYyANCmNvbW1pdC4gU29tZSBvZiB0aGUgZHJpdmVycyB1c2Ugdm1h
cC92dW5tYXAsIHdoaWNoIG1pZ2h0IG1ha2UgcHJvYmxlbXMgDQphcyB3ZWxsLiBJdCdzIHVz
ZWQgaW4gdGhlIGNvbnRleHQgb2YgZGFtYWdlIGhhbmRsaW5nLCB3aGljaCBhbHNvIG1ha2Vz
IA0Kbm8gc2Vuc2UgaGVyZS4gU28gdGhlIHJlZ3VsYXIgYXRvbWljIGhlbHBlcnMgbW9zdCBs
aWtlbHkgd29uJ3Qgd29yay4NCg0KSXQgc291bmRzIHRvIG1lIGFzIGlmIHlvdSdyZSBlc3Nl
bnRpYWxseSBhc2tpbmcgZm9yIHNvbWV0aGluZyBsaWtlIGEgDQpmbHVzaCBvciBzeW5jIG9w
ZXJhdGlvbi4NCg0KU3RlcHBpbmcgYmFjayBmcm9tIGdldF9zY2Fub3V0X2J1ZmZlciBmb3Ig
YSBtb21lbnQgYW5kIGFkb3B0aW5nIHlvdXIgDQpwcm9wb3NhbCBmcm9tIGFib3ZlLCBJIGNh
biBzZWUgc29tZXRoaW5nIGxpa2UgdGhpcyB3b3JraW5nOg0KDQogICAtIHRoZSBkcml2ZXIg
cHJvdmlkZXMgYSBwYW5pYyBjYWxsYmFjayBpbiBzdHJ1Y3QgZHJtX2RyaXZlcg0KDQogICAt
IERSTSByZWdpc3RlcnMgYSBwYW5pYyBoYW5kbGVyIHRvIGludm9rZXMgdGhlIGNhbGxiYWNr
DQoNCiAgIC0gdGhlIHBhbmljIGNhbGxiYWNrIGhhcyBhIHNjYW5vdXQgYnVmZmVyIGZyb20g
c29tZXdoZXJlIChjdXJyZW50bHkgDQphY3RpdmUsIHByZXBhcmVkLCBmcm9tIGZpcm13YXJl
LCBwbGFpbiBtZW1vcnksIGV0YykNCg0KICAgLSB3ZSBwcm92aWRlIGEgaGVscGVyIHRoYXQg
ZmlsbHMgdGhlIHNjYW5vdXQgYnVmZmVyIHdpdGggaW5mb3JtYXRpb24NCg0KICAgLSB0aGUg
ZHJpdmVyIHRoZW4gdXBkYXRlcyB0aGUgaGFyZHdhcmUgZnJvbS93aXRoIHRoZSBzY2Fub3V0
IGJ1ZmZlcjsgDQpkZXRhaWxzIGRlcGVuZCBvbiB0aGUgaGFyZHdhcmUNCg0KVGhlIGZpbmFs
IHN0ZXAgaXMgbGlrZSBhIGZsdXNoIG9yIGNvbW1pdCBvcGVyYXRpb24uIFRvIGdpdmUgc29t
ZSANCmV4YW1wbGVzOiBUaGUgc2ltcGxlIGRyaXZlcnMgb2YgdGhpcyBwYXRjaHNldCBwcm9i
YWJseSBkb24ndCBoYXZlIHRvIGRvIA0KYW55dGhpbmcuIERyaXZlcnMgd2l0aCBjb21tYW5k
L3BhY2tldCBxdWV1ZXMgY291bGQgYXR0ZW1wdCB0byBzZW5kIHRoZSANCm5lY2Vzc2FyeSBj
b21tYW5kcyB0byB0aGUgZGV2aWNlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
PiBNYXhpbWUNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------iSQiM14YCdJsy4b2eOzVkafs--

--------------xRduCDcoJEuvmzEP2K0o5rEp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUlTBAFAwAAAAAACgkQlh/E3EQov+Dj
6g/+NYUFrvx1wGep9YwG9E5wyteopvpOhx2aNlKhDnQh25kfDPnRgcJrU28mEgP7BszmNnEoyAse
juDOQBwbgskGIB1u8+Attjz3YVD8bTwpZ0Gx5+mJXcasYWT4WjPmfRY4x4BW/06eaEBR+HZjgp+7
bTO/2MbJli0omMO9eHdfkMv0pmv+YRxqFb1Wu65U5/vxwUsSd56gtFlslkJ3YNXLIkVQTGo1XfF3
XMr1kN2kPkY86CfMyg4h9ODzFXzDAL+nMTiZEQtrdF4gANriY0Zd9cLWl8AbEx4LN8StgGhYISYR
5r0fw+Yvu4F4Wev4fEUcrzfyRPkPWcqVAWkzWjG519dC9eb3zQb06k2rGSQkkRwu6UnBMZw27R5q
26z20gezJNo/hTTD83QXUlNA2jZSVV169oSIHp6pGujzHQCKN36yBIZ645rSBg0avGAzceSVLlPO
vo1IcQjgOLeNgfwfbfzR7oQ63/PMK22OSgD5MLkOPx3rfsOI1LIAVdEIr3q4Yz56tY+zDAgKEx/z
mMpYkcUJa/xtTE0NYuD5YGiGCqsrFuSmyeErR6/au6uFdl1nFNk9K0MIMfTrR5HL6kTAl827WObB
48lVq2jMYqOblSpsdVyb1R7lEuXem0Bf0kO5LVN5hoab7IgkHLIWjsr7LQBZSZjxNRhJJuDkkSXG
uxM=
=Xb9X
-----END PGP SIGNATURE-----

--------------xRduCDcoJEuvmzEP2K0o5rEp--
