Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ABD7B9CB1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 13:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C1810E075;
	Thu,  5 Oct 2023 11:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4925910E075
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 11:15:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D18932184B;
 Thu,  5 Oct 2023 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696504528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dCvATAy+PNlmTITeOmZIFs4TesEzt8zqwfR4SsTWL14=;
 b=j+CxulmuigzIhiwvYnvGGmL28ewLH3T+0orbfDk6CKOMBude7m7BwUgFWRGDxmbedo0gI1
 ecgxjWIR5dMpVqlhyNxTAlg1n3gOyZMhA36FLOwowfejQlzXItn1QxNAs1mPKAYvKYUaWV
 rDopoIF26+7UphM4b16GRnQE5FWMcWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696504528;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dCvATAy+PNlmTITeOmZIFs4TesEzt8zqwfR4SsTWL14=;
 b=nRhB8LHWMlUJjHQSPv8H6IOZvvTfXIgSW+CmWv9Vknir28hBGg9P+c001EZhLw1kI0d96O
 nAKbOA95O2cokJCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 903DD13438;
 Thu,  5 Oct 2023 11:15:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zdpDItCaHmXHPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Oct 2023 11:15:28 +0000
Message-ID: <b6a60bd7-b187-4925-b711-9fd5e73d911c@suse.de>
Date: Thu, 5 Oct 2023 13:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] drm/format-helper: Pass format-conversion state to
 helpers
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, javierm@redhat.com, 
 jfalempe@redhat.com, jose.exposito89@gmail.com, arthurgrillo@riseup.net,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-4-tzimmermann@suse.de>
 <a079e75b-291a-4faf-7c56-19aa784df34c@tronnes.org>
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
In-Reply-To: <a079e75b-291a-4faf-7c56-19aa784df34c@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ltrH5SSnXAU1EaDY5BoZi3Au"
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 David Lechner <david@lechnology.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ltrH5SSnXAU1EaDY5BoZi3Au
Content-Type: multipart/mixed; boundary="------------G5YUaIYqMv80V2iTG9yicWZ9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, javierm@redhat.com,
 jfalempe@redhat.com, jose.exposito89@gmail.com, arthurgrillo@riseup.net,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Lechner <david@lechnology.com>
Message-ID: <b6a60bd7-b187-4925-b711-9fd5e73d911c@suse.de>
Subject: Re: [PATCH v4 3/7] drm/format-helper: Pass format-conversion state to
 helpers
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-4-tzimmermann@suse.de>
 <a079e75b-291a-4faf-7c56-19aa784df34c@tronnes.org>
In-Reply-To: <a079e75b-291a-4faf-7c56-19aa784df34c@tronnes.org>

--------------G5YUaIYqMv80V2iTG9yicWZ9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTAuMjMgdW0gMTM6MTAgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
IA0KPiANCj4gT24gMTAvNS8yMyAxMTowNCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBQYXNzIGFuIGluc3RhbmNlIG9mIHN0cnVjdCBkcm1fZm9ybWF0X2NvbnZfc3RhdGUgdG8g
RFJNJ3MgZm9ybWF0DQo+PiBjb252ZXJzaW9uIGhlbHBlcnMuIFVwZGF0ZSBhbGwgY2FsbGVy
cy4NCj4+DQo+PiBNb3N0IGRyaXZlcnMgY2FuIHVzZSB0aGUgZm9ybWF0LWNvbnZlcnNpb24g
c3RhdGUgZnJvbSB0aGVpciBzaGFkb3ctDQo+PiBwbGFuZSBzdGF0ZS4gVGhlIHNoYWRvdyBw
bGFuZSdzIGRlc3Ryb3kgZnVuY3Rpb24gcmVsZWFzZXMgdGhlDQo+PiBhbGxvY2F0ZWQgYnVm
ZmVyLiBEcml2ZXJzIHdpbGwgbGF0ZXIgYmUgYWJsZSB0byBhbGxvY2F0ZSBhIGJ1ZmZlcg0K
Pj4gb2YgYXBwcm9wcmlhdGUgc2l6ZSBpbiB0aGVpciBwbGFuZSdzIGF0b21pY19jaGVjayBj
b2RlLg0KPj4NCj4+IFRoZSBndWQgZHJpdmVyIHVzZXMgYSBzZXBhcmF0ZSB0aHJlYWQgZm9y
IGNvbW1pdHRpbmcgdXBkYXRlcy4gRm9yDQo+PiBub3csIHRoZSB1cGRhdGUgd29ya2VyIGNv
bnRhaW5zIGl0cyBvd24gZm9ybWF0LWNvbnZlcnNpb24gc3RhdGUuDQo+Pg0KPj4gSW1hZ2Vz
IGluIHRoZSBmb3JtYXQtaGVscGVyIHRlc3RzIGFyZSBzbWFsbC4gVGhlIHRlc3RzIHByZWFs
bG9jYXRlDQo+PiBhIHN0YXRpYyBwYWdlIGZvciB0aGUgdGVtcG9yYXJ5IGJ1ZmZlci4gVW5s
b2FkaW5nIHRoZSBtb2R1bGUgcmVsZWFzZXMNCj4+IHRoZSBtZW1vcnkuDQo+Pg0KPj4gdjM6
DQo+PiAJKiBzdG9yZSBidWZmZXIgaW4gc2hhZG93LXBsYW5lIHN0YXRlIChKYXZpZXIsIE1h
eGltZSkNCj4+IAkqIHJlcGxhY2UgQVJSQVlfU0laRSgpIHdpdGggc2l6ZW9mKCkgKEphbmkp
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQo+PiBDYzogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+
DQo+PiBDYzogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+
DQo+PiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+DQo+PiBDYzogRGF2
aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+DQo+PiAtLS0NCj4gDQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPj4gaW5kZXggMzdjNDk5YWU0ZmU0Zi4u
YjliM2RhZGY3YjVmOCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9y
bWF0X2hlbHBlci5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxw
ZXIuYw0KPiANCj4+IEBAIC0zMjgsNiArMzI0LDcgQEAgc3RhdGljIHZvaWQgZHJtX2ZiX3N3
YWIzMl9saW5lKHZvaWQgKmRidWYsIGNvbnN0IHZvaWQgKnNidWYsIHVuc2lnbmVkIGludCBw
aXhlbHMNCj4+ICAgICogQGZiOiBEUk0gZnJhbWVidWZmZXINCj4+ICAgICogQGNsaXA6IENs
aXAgcmVjdGFuZ2xlIGFyZWEgdG8gY29weQ0KPj4gICAgKiBAY2FjaGVkOiBTb3VyY2UgYnVm
ZmVyIGlzIG1hcHBlZCBjYWNoZWQgKGVnLiBub3Qgd3JpdGUtY29tYmluZWQpDQo+PiArICog
QHhmcm06IFRyYW5zZm9ybSBhbmQgY29udmVyc2lvbiBzdGF0ZQ0KPiANCj4gSGVyZSBhbmQg
dGhyb3VnaG91dCB0aGUgcGF0Y2g6IHhmcm0gZG9lcyBub3QgbWF0Y2ggdGhlIGFyZ3VtZW50
IG5hbWUuDQoNClRoYW5rcyEgSSBzaG91bGQgYmUgbW9yZSBjYXJlZnVsIHdoZW4gcmVuYW1p
bmcuDQoNCj4gDQo+PiAgICAqDQo+PiAgICAqIFRoaXMgZnVuY3Rpb24gY29waWVzIHBhcnRz
IG9mIGEgZnJhbWVidWZmZXIgdG8gZGlzcGxheSBtZW1vcnkgYW5kIHN3YXBzIHBlci1waXhl
bA0KPj4gICAgKiBieXRlcyBkdXJpbmcgdGhlIHByb2Nlc3MuIERlc3RpbmF0aW9uIGFuZCBm
cmFtZWJ1ZmZlciBmb3JtYXRzIG11c3QgbWF0Y2guIFRoZQ0KPj4gQEAgLTM0Miw3ICszMzks
OCBAQCBzdGF0aWMgdm9pZCBkcm1fZmJfc3dhYjMyX2xpbmUodm9pZCAqZGJ1ZiwgY29uc3Qg
dm9pZCAqc2J1ZiwgdW5zaWduZWQgaW50IHBpeGVscw0KPj4gICAgKi8NCj4+ICAgdm9pZCBk
cm1fZmJfc3dhYihzdHJ1Y3QgaW9zeXNfbWFwICpkc3QsIGNvbnN0IHVuc2lnbmVkIGludCAq
ZHN0X3BpdGNoLA0KPj4gICAJCSBjb25zdCBzdHJ1Y3QgaW9zeXNfbWFwICpzcmMsIGNvbnN0
IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPj4gLQkJIGNvbnN0IHN0cnVjdCBkcm1f
cmVjdCAqY2xpcCwgYm9vbCBjYWNoZWQpDQo+PiArCQkgY29uc3Qgc3RydWN0IGRybV9yZWN0
ICpjbGlwLCBib29sIGNhY2hlZCwNCj4+ICsJCSBzdHJ1Y3QgZHJtX2Zvcm1hdF9jb252X3N0
YXRlICpzdGF0ZSkNCj4+ICAgew0KPj4gICAJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5m
byAqZm9ybWF0ID0gZmItPmZvcm1hdDsNCj4+ICAgCXU4IGNwcCA9IERJVl9ST1VORF9VUChk
cm1fZm9ybWF0X2luZm9fYnBwKGZvcm1hdCwgMCksIDgpOw0KPiANCj4gDQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvcmVwYXBlci5jIGIvZHJpdmVycy9ncHUvZHJt
L3RpbnkvcmVwYXBlci5jDQo+PiBpbmRleCA3M2RkNGY0Mjg5YzIwLi44MjZmYjIwZGJiZjBk
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvcmVwYXBlci5jDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMNCj4gDQo+PiBAQCAtODMwLDEz
ICs4MzEsMTQgQEAgc3RhdGljIHZvaWQgcmVwYXBlcl9waXBlX3VwZGF0ZShzdHJ1Y3QgZHJt
X3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsDQo+PiAgIAkJCQlzdHJ1Y3QgZHJtX3BsYW5l
X3N0YXRlICpvbGRfc3RhdGUpDQo+PiAgIHsNCj4+ICAgCXN0cnVjdCBkcm1fcGxhbmVfc3Rh
dGUgKnN0YXRlID0gcGlwZS0+cGxhbmUuc3RhdGU7DQo+PiArCXN0cnVjdCBkcm1fc2hhZG93
X3BsYW5lX3N0YXRlICpzaGFkb3dfcGxhbmVfc3RhdGUgPSB0b19kcm1fc2hhZG93X3BsYW5l
X3N0YXRlKHN0YXRlKTsNCj4+ICAgCXN0cnVjdCBkcm1fcmVjdCByZWN0Ow0KPj4gICANCj4+
ICAgCWlmICghcGlwZS0+Y3J0Yy5zdGF0ZS0+YWN0aXZlKQ0KPj4gICAJCXJldHVybjsNCj4+
ICAgDQo+PiAgIAlpZiAoZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX21lcmdlZChvbGRfc3Rh
dGUsIHN0YXRlLCAmcmVjdCkpDQo+PiAtCQlyZXBhcGVyX2ZiX2RpcnR5KHN0YXRlLT5mYik7
DQo+PiArCQlyZXBhcGVyX2ZiX2RpcnR5KHN0YXRlLT5mYiwgJnNoYWRvd19wbGFuZV9zdGF0
ZS0+Zm10Y252X3N0YXRlKTsNCj4gDQo+IFRoaXMgd29uJ3Qgd29yayBzaW5jZSByZXBhcGVy
IGRvZXNuJ3QgdXNlIHRoZSBzaGFkb3cgcGxhbmUgaGVscGVyLg0KDQpJbmRlZWQuIEl0IGNh
biB1c2UgYSBsb2NhbCBidWZmZXIuIEJ1dCBJJ20gYSBiaXQgc3VycHJpc2VkIHRvIGZpbmQg
dGhhdCANCnRoZXJlIGFyZSBubyBzaGFkb3ctcGxhbmUgaGVscGVycyBoZXJlLiBUaGF0IHNv
dW5kcyBsaWtlIGEgdXNlZnVsIA0KZm9sbG93LXVwIHBhdGNoLg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KPiBOb3JhbGYuDQo+IA0KPj4gICB9DQo+PiAgIA0KPj4gICBzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlX2Z1bmNzIHJlcGFwZXJf
cGlwZV9mdW5jcyA9IHsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpG
cmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBU
b3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0K
SFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------G5YUaIYqMv80V2iTG9yicWZ9--

--------------ltrH5SSnXAU1EaDY5BoZi3Au
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUemtAFAwAAAAAACgkQlh/E3EQov+Da
3w/8CbKfih3KIBC9eB2OOfzb8auurQASmnYVbUGVZ6tcnknJBOJ4Y08NvxtUZHPBX6nzg9lZ92op
VgylAqx3wq/qDbVLpWM+wIEsqkBnvFt3LDl0MQTiyvBe58SWOZGHwPvlZ51tfXN4eEzzFUPydHhj
AUVU4zU6CvpGE5tegOlBD5h3RU078WM0jhpkhkI+qSX+JetFD7oGfIPVv4lPXsXOItHNgOp7sYhY
LhoYxkRhFvNueMZBrx1De4mOODSgNVUNr+waOE1im/EJgBkqJ3EnT7KMBXrNoGr4h+X6E+4X7kFV
Ncn0B7ARvAlhV+F/j9lZkjYRmTjbnFDv3uC1imH/YkEzP8/qfhb0LMsEy2jvlaiK48sO10bK1HuJ
HQ81NBMg6MLGZ79wUs+L/XnbeJWO3XvcOYLVY1ZjoxG3E0voSvEQJCYYuMt5FLrF0ncf6LtAkgcI
fsSFDOK4T8mw+tzpIvF33QSTTJdPgWgVFkYNAU5mAmkvt+IFSvSfoKjEyFEWzg73+8FbGocG+iPI
6+A0Dr6AYiJN7VMjivWYRljcxyOvXmJJ7zxezLV5ICHCx+Rrjs9w4hlisgY/+cJaAzCqrh+jfpRC
4BcgP1YkN+1pvlFzWNQcz3DfG1FKbxEzU6lhCZf78Eph3gqLbE3LcTAFvPc3UsZFo+yFlvQD7FbI
KCg=
=CJhP
-----END PGP SIGNATURE-----

--------------ltrH5SSnXAU1EaDY5BoZi3Au--
