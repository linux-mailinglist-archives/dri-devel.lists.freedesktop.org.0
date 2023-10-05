Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE27BA1AC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 16:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8293510E3F5;
	Thu,  5 Oct 2023 14:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C02810E3F5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 14:55:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 400041F855;
 Thu,  5 Oct 2023 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696517753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0rtiqgC9XQqJRZeBXncnpayA0CdSu+X5lZSoiXEiINo=;
 b=Jur2X70HhcqJEbRn95cKaPMxNJTQBKIqX7I0/aQ7Ab40BFTT6nR7CrGrScvWIkJQRAO457
 kP0tbCnLeVu8vdWf+ptDw1TSN8WR85PnhcnJEQkG3QbP4LIoAlhAWnKVvDLU78HIt+3gLg
 bBimQHK8pD9v+5kRAvNOUQxi/bERHOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696517753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0rtiqgC9XQqJRZeBXncnpayA0CdSu+X5lZSoiXEiINo=;
 b=MlfjDSTD4RB2u8MumT+BYdxgF5l4OewQM9ya4VNvXRkfvwfuNqYg5Gxu+6sGJzWjSM6rqP
 RgEwmvD2dw2MKdAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04C1D13438;
 Thu,  5 Oct 2023 14:55:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zm4nAHnOHmVNQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Oct 2023 14:55:53 +0000
Message-ID: <9953d128-1366-4967-8fc8-6342bc31e9fb@suse.de>
Date: Thu, 5 Oct 2023 16:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/format-helper: Cache buffers with struct
 drm_format_conv_state
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-2-tzimmermann@suse.de>
 <87y1gh6wd2.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87y1gh6wd2.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pfyL6c2a1PnUkx0WxCtJcbRG"
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
--------------pfyL6c2a1PnUkx0WxCtJcbRG
Content-Type: multipart/mixed; boundary="------------8Y74xa7vsuWKZx2DfhXFGDUm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <9953d128-1366-4967-8fc8-6342bc31e9fb@suse.de>
Subject: Re: [PATCH v4 1/7] drm/format-helper: Cache buffers with struct
 drm_format_conv_state
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-2-tzimmermann@suse.de>
 <87y1gh6wd2.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87y1gh6wd2.fsf@minerva.mail-host-address-is-not-set>

--------------8Y74xa7vsuWKZx2DfhXFGDUm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTAuMjMgdW0gMTU6MTggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPj4gSG9sZCB0ZW1wb3JhcnkgbWVtb3J5
IGZvciBmb3JtYXQgY29udmVyc2lvbiBpbiBhbiBpbnN0YW5jZSBvZiBzdHJ1Y3QNCj4+IGRy
bV9mb3JtYXRfY29udl9zdGF0ZS4gVXBkYXRlIGludGVybmFsIGhlbHBlcnMgb2YgRFJNJ3Mg
Zm9ybWF0LWNvbnZlcnNpb24NCj4+IGNvZGUgYWNjb3JkaW5nbHkuIERyaXZlcnMgd2lsbCBs
YXRlciBiZSBhYmxlIHRvIG1haW50YWluIHRoaXMgY2FjaGUgYnkNCj4+IHRoZW1zZWx2ZXMu
DQo+Pg0KPj4gQmVzaWRlcyBjYWNoaW5nLCBzdHJ1Y3QgZHJtX2Zvcm1hdF9jb252X3N0YXRl
IHdpbGwgYmUgdXNlZnVsIHRvIGhvbGQNCj4+IGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gZm9y
IGZvcm1hdCBjb252ZXJzaW9uLCBzdWNoIGFzIHBhbGV0dGUgZGF0YSBvcg0KPj4gZm9yZWdy
b3VuZC9iYWNrZ3JvdW5kIGNvbG9ycy4gVGhpcyB3aWxsIGVuYWJsZSBjb252ZXJzaW9uIGZy
b20gaW5kZXhlZA0KPj4gY29sb3IgZm9ybWF0cyB0byBjb21wb25lbnQtYmFzZWQgZm9ybWF0
cy4NCj4+DQo+PiB2MzoNCj4+IAkqIHJlbmFtZSBzdHJ1Y3QgZHJtX3hmcm1fYnVmIHRvIHN0
cnVjdCBkcm1fZm9ybWF0X2NvbnZfc3RhdGUNCj4+IAkgIChKYXZpZXIpDQo+PiAJKiByZW1v
dmUgbWFuYWdlZCBjbGVhbnVwDQo+PiAJKiBhZGQgZHJtX2Zvcm1hdF9jb252X3N0YXRlX2Nv
cHkoKSBmb3Igc2hhZG93LXBsYW5lIHN1cHBvcnQNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPiANCj4g
Wy4uLl0NCj4gDQo+PiArLyoqDQo+PiArICogZHJtX2Zvcm1hdF9jb252X3N0YXRlX2luaXQg
LSBJbml0aWFsaXplIGZvcm1hdC1jb252ZXJzaW9uIHN0YXRlDQo+PiArICogQHN0YXRlOiBU
aGUgc3RhdGUgdG8gaW5pdGlhbGl6ZQ0KPj4gKyAqDQo+PiArICogQ2xlYXJzIGFsbCBmaWVs
ZHMgaW4gc3RydWN0IGRybV9mb3JtYXRfY29udl9zdGF0ZSBhbmQgaW5zdGFsbHMgYSBEUk0N
Cj4+ICsgKiByZWxlYXNlIGFjdGlvbiBmb3IgdGhlIGJ1ZmZlci4gVGhlIGJ1ZmZlciB3aWxs
IGJlIGVtcHR5IHdpdGggbm8NCj4+ICsgKiBwcmVhbGxvY2F0ZWQgcmVzb3VyY2VzLg0KPj4g
KyAqLw0KPj4gK3ZvaWQgZHJtX2Zvcm1hdF9jb252X3N0YXRlX2luaXQoc3RydWN0IGRybV9m
b3JtYXRfY29udl9zdGF0ZSAqc3RhdGUpDQo+PiArew0KPj4gKwlzdGF0ZS0+dG1wLm1lbSA9
IE5VTEw7DQo+PiArCXN0YXRlLT50bXAuc2l6ZSA9IDA7DQo+PiArCXN0YXRlLT50bXAucHJl
YWxsb2NhdGVkID0gZmFsc2U7DQo+PiArfQ0KPj4gK0VYUE9SVF9TWU1CT0woZHJtX2Zvcm1h
dF9jb252X3N0YXRlX2luaXQpOw0KPj4gKw0KPj4gKy8qKg0KPj4gKyAqIGRybV9mb3JtYXRf
Y29udl9zdGF0ZV9jb3B5IC0gQ29weSBmb3JtYXQtY29udmVyc2lvbiBzdGF0ZQ0KPj4gKyAq
IEBzdGF0ZTogRGVzdGluYXRpb24gc3RhdGUNCj4+ICsgKiBAb2xkX3N0YXRlOiBTb3VyY2Ug
c3RhdGUNCj4+ICsgKg0KPj4gKyAqIENvcGllcyBmb3JtYXQtY29udmVyc2lvbiBzdGF0ZSBm
cm9tIEBvbGRfc3RhdGUgdG8gQHN0YXRlOyBleGNlcHQgZm9yDQo+PiArICogdGVtcG9yYXJ5
IHN0b3JhZ2UuDQo+PiArICovDQo+PiArdm9pZCBkcm1fZm9ybWF0X2NvbnZfc3RhdGVfY29w
eShzdHJ1Y3QgZHJtX2Zvcm1hdF9jb252X3N0YXRlICpzdGF0ZSwNCj4+ICsJCQkJY29uc3Qg
c3RydWN0IGRybV9mb3JtYXRfY29udl9zdGF0ZSAqb2xkX3N0YXRlKQ0KPj4gK3sNCj4+ICsJ
c3RhdGUtPnRtcC5tZW0gPSBOVUxMOw0KPj4gKwlzdGF0ZS0+dG1wLnNpemUgPSAwOw0KPj4g
KwlzdGF0ZS0+dG1wLnByZWFsbG9jYXRlZCA9IGZhbHNlOw0KPj4gK30NCj4+ICtFWFBPUlRf
U1lNQk9MKGRybV9mb3JtYXRfY29udl9zdGF0ZV9jb3B5KTsNCj4+ICsNCj4gDQo+IEknbSBj
b25mdXNlZCwgdGhlIGNvcHkgaGVscGVyIGlzIHRoZSBzYW1lIHRoYW4gaW5pdC4gV2hhdCdz
IHRoZSBwb2ludCBvZg0KPiB0aGlzIGZ1bmN0aW9uID8gV2h5IG5vdCBqdXN0IGNhbGwgZHJt
X2Zvcm1hdF9jb252X3N0YXRlX2luaXQoKSBmcm9tIHRoZQ0KPiBfX2RybV9nZW1fZHVwbGlj
YXRlX3NoYWRvd19wbGFuZV9zdGF0ZSgpIGZ1bmN0aW9uIGluIHRoZSBuZXh0IHBhdGNoID8N
Cg0KSSBndWVzcyB0aGF0IGRlc2VydmVzIGEgY29tbWVudCBpbiB0aGUgY29kZS4gVGhlIHJl
c2VydmVkIGJ1ZmZlciBpcyBub3QgDQp0byBiZSBjb3BpZWQgdG8gYW5vdGhlciBzdGF0ZS4g
U28gd2UganVzdCBjbGVhciB0aGUgZmllbGRzLiBCdXQgaW4gdGhlIA0KZnV0dXJlLCB3ZSB3
aWxsIGxpa2VseSBiZSBleHRyYSBmaWVsZHMsIHN1Y2ggYXMgdGhlIGFmb3JlbWVudGlvbmVk
IA0KcGFsZXR0ZSBkYXRhLCB0aGF0IHdpbGwgYmUgY29waWVkLiBJdCdzIGp1c3QgdGhhdCB0
aGVzZSBmaWVsZHMgZG9uJ3QgDQpleGlzdCB5ZXQuIEhlbmNlIHRoZSBjb3B5IGZ1bmN0aW9u
IGlzIGRpZmZlcmVudCBmcm9tIHRoZSBpbml0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+IA0KPiBPdGhlciB0aGFuIHRoYXQgdGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuIEFm
dGVyIGZpeGluZyB0aGUgaXNzdWUgdGhhdA0KPiBOb3JhbGYgcG9pbnRlZCBvdXQ6DQo+IA0K
PiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhh
dC5jb20+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5r
ZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2
LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIg
MzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------8Y74xa7vsuWKZx2DfhXFGDUm--

--------------pfyL6c2a1PnUkx0WxCtJcbRG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUezngFAwAAAAAACgkQlh/E3EQov+Bn
CBAApRr/Cm20dIQVDMb906rgyVTCHLUtjgG7Xni6xoH9plB+iME0IppY/+3Dr3iavXJj8XDGgxjE
FnJUQFvMrM7XPiPQNbSmLYf1YKmhHkK9ZYgJG3cbqMDSXf9fLXMWGlWRF32/KjADgV6YVWEGkt4j
+K7JaHkm4E2C3RFQ8DKZu6p7y4Xs1lgfk09Zc/vmvGKRlxqR2kr3IyEacoQi3WOAwAUQC6zql1VI
9kcs0+VEqYUSaM4qV/JlnyBvvY/CcvPqTDxRSZpKKlFXS6kYqjhmJOJesnwqkzWTiGlEYujYVuJD
4sOLJ4/Bkkk+N/fqnaUSAGvd86tU/bbRaY+qFlVhsHBaeMRkDGlzNAcMXWyqzcyCmb6QoImjyGHr
Tbj2GRlnIt2wQaA+uycyZ1Ac4p/u6UoHI9F2wVILAJoMIgiXWkQDES1xGHEutofTlny5Pi20ZwGC
i9R7w7Ri/Sjj/GMMFb4PTVgLnLAS43wN/tTZp1xG5vVP7nfr5ervNqEIa6UNcWS8Vmg4kskpfQHf
4Cja/EuYdU+piN0t/Jt7EJMqflDGyuQkRgrcRScUVO1jlHripWBhTtxWMZ6LkdE8ricnkKI/vHrw
vhPS3RWEwnu/Ij4BzBMybsadWHFYY+ADyceSkOnDNo5IZHLKQGEuQTVcXSnMrGUlbETjZsjgvbZb
MPc=
=tiD9
-----END PGP SIGNATURE-----

--------------pfyL6c2a1PnUkx0WxCtJcbRG--
