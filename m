Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 178387BD50C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 10:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C21410E0E0;
	Mon,  9 Oct 2023 08:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F1110E0E0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 08:23:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F48221879;
 Mon,  9 Oct 2023 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696839783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OyPpVJWd8qqMAMGvtvqhLMWoU2YWxrJ7bQub7DXi9jo=;
 b=labiG+qdC13VJnFHqyz1P6omfmZ0AX17RFMBFxRnbsoLPRdxFQCvn8FCfqq086G+Bl1iOO
 b+qoDz342up4inX302TUQBG1V91z/10nnc7v1QuxInknwPZ+XN8Y8N2Y1A5jK+k1RGAQb4
 cDOGBxcOixEaX3QTGjHS2G6wTm3MXgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696839783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OyPpVJWd8qqMAMGvtvqhLMWoU2YWxrJ7bQub7DXi9jo=;
 b=uPctnFyT/SRltIsuvzPx9UvcA6fIqLRa2yU9tycT2bj8hHX/XWWb3notOMav+SC5m3GiRT
 4nHs3tKv3Jc3LtAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3437913586;
 Mon,  9 Oct 2023 08:23:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /cegC2e4I2WzPwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Oct 2023 08:23:03 +0000
Message-ID: <e90dceff-5f8a-4d2c-b1a9-8afec856ba20@suse.de>
Date: Mon, 9 Oct 2023 10:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] drm: Reuse temporary memory for format conversion
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <ozoizmezbyhwtnsyxahdoibpkwm2gvxnclw5gyt5j257demgpd@3efr2ioqhgg2>
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
In-Reply-To: <ozoizmezbyhwtnsyxahdoibpkwm2gvxnclw5gyt5j257demgpd@3efr2ioqhgg2>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tfLKqLAdozgXeZAw0IIKD0Q2"
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
--------------tfLKqLAdozgXeZAw0IIKD0Q2
Content-Type: multipart/mixed; boundary="------------tfFCREn7lKNtdS3UB7VSdf9v";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org
Message-ID: <e90dceff-5f8a-4d2c-b1a9-8afec856ba20@suse.de>
Subject: Re: [PATCH v4 0/7] drm: Reuse temporary memory for format conversion
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <ozoizmezbyhwtnsyxahdoibpkwm2gvxnclw5gyt5j257demgpd@3efr2ioqhgg2>
In-Reply-To: <ozoizmezbyhwtnsyxahdoibpkwm2gvxnclw5gyt5j257demgpd@3efr2ioqhgg2>

--------------tfFCREn7lKNtdS3UB7VSdf9v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF4aW1lDQoNCkFtIDA2LjEwLjIzIHVtIDE2OjQ5IHNjaHJpZWIgTWF4aW1lIFJpcGFy
ZDoNCj4gSGksDQo+IA0KPiBPbiBUaHUsIE9jdCAwNSwgMjAyMyBhdCAxMTowNDoyMEFNICsw
MjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IERSTSdzIGZvcm1hdC1jb252ZXJz
aW9uIGhlbHBlcnMgcmVxdWlyZSB0ZW1wb3JhcnkgbWVtb3J5LiBQYXNzIHRoZQ0KPj4gYnVm
ZmVyIGZyb20gdGhlIGNhbGxlciBhbmQga2VlcCBpdCBhbGxvY2F0ZWQgb3ZlciBzZXZlcmFs
IGNhbGxzLiBBbGxvdw0KPj4gdGhlIGNhbGxlciB0byBwcmVhbGxvY2F0ZSB0aGUgYnVmZmVy
IG1lbW9yeS4NCj4gDQo+IEknbSBzb3JyeS4uLiBidXQgd2h5PyBXaHkgZG8geW91IG5lZWQg
dG8ga2VlcCBpdCBhbGxvY2F0ZWQgb3ZlciBzZXZlcmFsDQo+IGNhbGxzIGFuZCBwcmVhbGxv
Y2F0ZSB0aGUgYnVmZmVyPyBJdCdzIG5vdCBjbGVhciB0byBtZSBhdCBhbGwuDQo+IA0KPj4g
VGhlIG1vdGl2YXRpb24gZm9yIHRoaXMgcGF0Y2hzZXQgaXMgdGhlIHJlY2VudCB3b3JrIG9u
IGEgRFJNIHBhbmljDQo+PiBoYW5kbGVyLiBbMV0gVGhlIHBhbmljIGhhbmRsZXIgcmVxdWly
ZXMgZm9ybWF0IGNvbnZlcnNpb24gdG8gZGlzcGxheSBhbg0KPj4gZXJyb3IgdG8gdGhlIHNj
cmVlbi4gQnV0IGFsbG9jYXRpbmcgbWVtb3J5IGR1cmluZyBrZXJuZWwgcGFuaWNzIGlzDQo+
PiBmcmFnaWxlLg0KPiANCj4gV2UgYWdyZWUgdGhhdCB3ZSBzaG91bGRuJ3QgYWxsb2NhdGUg
bWVtb3J5IGR1cmluZyB0aGUgcGFuaWMuIEkgc3RpbGwNCj4gaGF2ZSBjb25jZXJucyBhYm91
dCBob3cgdGhlIHBhbmljIGhhbmRsZXIgd2lsbCBoYW5kbGUgdGhlIGRyaXZlcg0KPiBjdXJy
ZW50bHkgc2V0IHVwIGZvciBhIHBsYW5lIHRoYXQgaXNuJ3QgdXNpbmcgYW4gUkdCIGZvcm1h
dCwgb3IgYSBidWZmZXINCj4gbm90IGFjY2Vzc2libGUgYnkgdGhlIGtlcm5lbCBvciBDUFUu
DQo+IA0KPiBZb3UgY2FuJ3QgZXhwZWN0IHRvIGdldCBhd2F5IHdpdGgganVzdCBhIGNvcHkg
dG8gdGhlIGN1cnJlbnQgYWN0aXZlDQo+IGJ1ZmZlci4NCg0KSW4gb3VyIGN1cnJlbnQgZGVz
aWduLCB0aGUgcGFuaWMgaGFuZGxlciBjYWxscyBnZXRfc2Nhbm91dF9idWZmZXIgZnJvbSAN
CnN0cnVjdCBkcm1fZHJpdmVyIHRvIHJldHJpZXZlIGEgc2Nhbm91dCBidWZmZXIuIFdoYXQg
aGFwcGVucyB3aXRoaW4gdGhhdCANCmNhbGxiYWNrIGRlcGVuZHMgb24gdGhlIGRyaXZlciBh
bmQgaGFyZHdhcmUuIEhlcmUgYXJlIHNvbWUgb2YgdGhlIA0KZXhwZWN0ZWQgc2NlbmFyaW9z
Og0KDQogICogc2ltcGxlZHJtIG9yIG9mZHJtIGNhbiByZXR1cm4gdGhlIGZpcm13YXJlLXBy
b3ZpZGVkIHNjYW5vdXQgYnVmZmVyLiANCk5vIGZ1cnRoZXIgYWN0aW9uIGlzIHJlcXVpcmVk
Lg0KDQogICogRGV2aWNlcyBvbiBhIFBDSS1saWtlIGJ1czoNCiAgICAgICogV2l0aCBhIHdv
cmtpbmcgbW9kZSBpbiBSR0IgY29sb3JzLCBkcml2ZXJzIGNhbiByZXR1cm4gdGhlIA0KY3Vy
cmVudCBzY2Fub3V0IGJ1ZmZlciBhcyB3ZWxsLg0KICAgICAgKiBXaXRob3V0IGEgd29ya2lu
ZyBtb2RlLCBkcml2ZXJzIGxpa2VseSBhdHRlbXB0IHRvIHByb2dyYW0gYSANCmNvbW1vbiBk
aXNwbGF5IG1vZGUgd2l0aCBSR0IgY29sb3JzLg0KDQogICogRHJpdmVycyBmb3IgZGV2aWNl
cyBiZWhpbmQgb3RoZXIgYnVzc2VzLCBzdWNoIGFzIFVTQiwgd2lsbCBwcm9iYWJseSANCm5v
dCBiZSBhYmxlIHRvIHJlcHJvZ3JhbSBkdXJpbmcgYSBwYW5pYyBvciBwcm92aWRlIGEgdXNl
ZnVsIHNjYW5vdXQgDQpidWZmZXIgYXQgYWxsLg0KDQogICogVGhlIHNjYW5vdXQgYnVmZmVy
IGhhcyB0byBiZSBtYXBwZWQgaW50byBrZXJuZWwgYWRkcmVzcyBzcGFjZS4gVGhpcyANCm9w
ZXJhdGlvbiBtaWdodCBiZSBmcmFnaWxlIGR1cmluZyBhIHBhbmljLiBTbyBkcml2ZXJzIGNv
dWxkIHNldCBhc2lkZSBhIA0Kc2xpY2Ugb2YgZ3JhcGhpY3MgbWVtb3J5IGFuZCBwcmUtbWFw
IGl0OyB0aGVuIHVzZSBpdCBkdXJpbmcgcGFuaWMgDQoocmVxdWlyZXMgc29tZSBtb2RlIHBy
b2dyYW1taW5nKS4NCg0KSSBleHBlY3QgdGhhdCB3ZSB3aWxsIGV2ZW50dWFsbHkgaGF2ZSBo
ZWxwZXJzIGZvciB0aGUgdmFyaW91cyBzY2VuYXJpb3MuIA0KRHJpdmVycyB3aWxsIGJlIGFi
bGUgdG8gaW1wbGVtZW50IHRoZWlyIGdldF9zY2Fub3V0X2J1ZmZlciB3aXRoIHRoZXNlIA0K
aGVscGVycy4NCg0KVGhlIGZvbnQgZ2x5cGhzIGFyZSAxLWJpdCBiaXRtYXBzLiBTbyB3ZSBo
YXZlIHRvIGNvbnZlcnQgdGhlbSB0byB0aGUgDQpzY2Fub3V0IGJ1ZmZlcidzIGZvcm1hdCBp
biBhbnkgY2FzZS4gV2Ugd2FudCB0byB1c2UgdGhlIGV4aXN0aW5nIA0KZm9ybWF0LWNvbnZl
cnNpb24gaGVscGVycyB3ZXJlIHBvc3NpYmxlLg0KDQo+IA0KPiBJZiB0aGF0J3MgdGhlIGFz
c3VtcHRpb24gdGhhdCB1bmRlcmxpbmVzIHRoYXQgcGF0Y2ggc2VyaWVzLCB0aGVuIEkgZG9u
J3QNCj4ga25vdyB3aHkgd2UgbmVlZCBpdCBhdCBhbGwsIGJlY2F1c2UgdGhhdCBhc3N1bXB0
aW9uIGlzIHdyb25nIHRvIGJlZ2luDQo+IHdpdGgsIGFuZCB3YXkgdG9vIHJlc3RyaWN0aXZl
Lg0KPiANCj4+IFRoZSBjaGFuZ2VzIGluIHRoaXMgcGF0Y2hzZXQgZW5hYmxlIHRoZSBEUk0g
cGFuaWMgaGFuZGxlciB0bw0KPj4gcHJlYWxsb2NhdGUgYnVmZmVyIHN0b3JhZ2UgYmVmb3Jl
IHRoZSBwYW5pYyBvY2N1cnMuDQo+Pg0KPj4gQXMgYW4gYWRkaXRvbmFsIGJlbmVmaXQsIGRy
aXZlcnMgY2FuIG5vdyBrZWVwIHRoZSB0ZW1wb3Jhcnkgc3RvcmFnZQ0KPj4gYWNyb3NzIG11
bHRpcGxlIHVwZGF0ZXMuIEF2b2lkaW5nIG1lbW9yeSBhbGxvY2F0aW9uIHNsaWdodGx5IHJl
ZHVjZXMNCj4+IHRoZSBDUFUgb3ZlcmhlYWQgb2YgdGhlIGZvcm1hdCBoZWxwZXJzLg0KPiAN
Cj4gSSdtIHNvcnJ5IHRvIGdvIG92ZXIgdGhhdCBhZ2FpbiwgYnV0IHlvdSBjYW4ndCB3cml0
ZSBhIHBlcmZvcm1hbmNlDQo+IGltcHJvdmVtZW50IG1lY2hhbmlzbSB3aXRob3V0IHNvbWUg
a2luZCBvZiBiZW5jaG1hcmsuIGttYWxsb2MgaGFzDQo+IGJ1aWx0LWluIGNhY2hpbmcsIHdo
eSBkbyB3ZSBhYnNvbHV0ZWx5IG5lZWQgb3VyIG93biBjYWNoZSBvbiB0b3Agb2YgaXQ/DQo+
IA0KPiBJZiB5b3UgbmV2ZXIgbWVhc3VyZWQgaXQsIGZvciBhbGwgd2Uga25vdywgd2Ugc2lt
cGx5IGRvbid0IG5lZWQgaXQgYW5kDQo+IGttYWxsb2MgaXMgZ29vZCBlbm91Z2guDQoNCkkn
bGwgcmVtb3ZlIHRoYXQgcGFyYWdyYXBoIGlmIHlvdSBmaW5kIGl0IHNvIGFubm95aW5nLiBM
ZXQgbWUganVzdCBzYXkgDQphZ2FpbiB0aGF0IG92ZXJoZWFkIGlzIG5vdCB0aGUgcHJpbWFy
eSBtb3RpdmF0aW9uIGJlaGluZCB0aGVzZSBwYXRjaGVzLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQoNCj4gDQo+IE1heGltZQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpH
RjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBN
b2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------tfFCREn7lKNtdS3UB7VSdf9v--

--------------tfLKqLAdozgXeZAw0IIKD0Q2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUjuGYFAwAAAAAACgkQlh/E3EQov+C3
ow//S5BsRRR5dNsUAhBSi/7RQ2W3njVRe9T7INPLF50sNxzaaKDmBBMTMT2RCLzhiYbyYit3TJ8f
8ByW85ZGkMIfmi6eZJZi08ebTc17ExJrSUhoD3gX9gQM2Ig7CX2iZzSd8qOU1PnxRyx7JCHFtpQH
n7OjnI70iT5ONLYlsYSSvHan8Oc4OJ4+YY+DUjpcLCaq5IAYcZ3BVDDBMckEGDqIX35Dq7fTGjaE
Ea2FdebA9Q4nW99KL5NYHeRkaps3vrhXVk3sqxJ+Lcy9SDtu/z+wbhdU/P0mhgRbVY35bG4fDOp+
PfhgC48gGSWR6dZhly0aGp5P6LYhAHFwvfF4yoZBw4HTGwz9VTvGZXgqvtmN0xzbZsm9eoCLnb53
7TEpVBdMOBBPstURRX3OcxrA1vHuBWBTKLaGIycdugavyW3n0bLY9qIlOQXW4niusiwMhhJgDGeI
N4NF/cUe7nyhNOg+0i4m1zq+OzmIyfOKjK3aQ6tLRUZQXLKjaTrHV6pBNTElPKcuMypomLRRDD6E
ajTfuyB3ccvoUlKR7HoA3ybDHbyg+8XdcC14ZRUMuAlKCM84T26VM8a44BjllISBJV3uXgvES50K
D4AXQIZF25+bVhyTtzV4rzmMj1By+tcL441xWa5h0rgAi3wwqvqP2Z8B32o25/a0MpGOzkTmtdCo
DCI=
=02jP
-----END PGP SIGNATURE-----

--------------tfLKqLAdozgXeZAw0IIKD0Q2--
