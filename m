Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0F07F0C06
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 07:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5675210E116;
	Mon, 20 Nov 2023 06:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B91010E116
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 06:53:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C731C218E4;
 Mon, 20 Nov 2023 06:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700463228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t2F96PgUMjD+Figly/igBINmNLhW5uMGSNgmrZ/eJ9c=;
 b=kFs/gUxnmAYlBHqXtI69ZEP9O5kE5SupBZuUE8lxuNw5T4qbxx8vpdwb0WjVFuxLjs+rrX
 srNx+8OHkq8/Cj96oYNXP4a3upv8T1GPQ0Rl/q0dmvmfmHKAP8wu6IEXvSxXLe7X4N5VcY
 zMdR4GeEybDxyOJhg2IhRZYskl9Huyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700463228;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t2F96PgUMjD+Figly/igBINmNLhW5uMGSNgmrZ/eJ9c=;
 b=9fN+YjWn4ZrT0z9GzyOxijSU7xNyQPYiIXxh959A0kjHTVrq2SmhG+9DYFcsEVNfxYnLHm
 Q9OBW57CzJXR/TCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 912DA134AD;
 Mon, 20 Nov 2023 06:53:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nqOVInwCW2WDIQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Nov 2023 06:53:48 +0000
Message-ID: <7c2bf60d-c355-49ff-a317-67626bb7ba12@suse.de>
Date: Mon, 20 Nov 2023 07:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] drm/ast: Detect device type before init
To: Sui Jingfeng <sui.jingfeng@linux.dev>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com
References: <20231116100240.22975-1-tzimmermann@suse.de>
 <86a8affd-d20e-49c2-938f-76dcec8eae46@linux.dev>
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
In-Reply-To: <86a8affd-d20e-49c2-938f-76dcec8eae46@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3E9ouQB1WsAsEjlpwYnPwtHy"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.68
X-Spamd-Result: default: False [-1.68 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.09)[-0.467]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[8]; NEURAL_SPAM_LONG(3.50)[1.000];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[linux.dev,redhat.com,linux.intel.com,kernel.org,ffwll.ch,gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3E9ouQB1WsAsEjlpwYnPwtHy
Content-Type: multipart/mixed; boundary="------------qQPM0raZ0drp0As7MXvZgMyX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <7c2bf60d-c355-49ff-a317-67626bb7ba12@suse.de>
Subject: Re: [PATCH v2 00/10] drm/ast: Detect device type before init
References: <20231116100240.22975-1-tzimmermann@suse.de>
 <86a8affd-d20e-49c2-938f-76dcec8eae46@linux.dev>
In-Reply-To: <86a8affd-d20e-49c2-938f-76dcec8eae46@linux.dev>

--------------qQPM0raZ0drp0As7MXvZgMyX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMTEuMjMgdW0gMTY6MDYgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gDQo+IE9uIDIwMjMvMTEvMTYgMTc6NTksIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOg0KPj4gRGV0ZWN0aW5nIHRoZSBhc3QgZGV2aWNlJ3MgY2hpcHNldCB0eXBlIGFuZCBj
b25maWd1cmF0aW9uIG1vZGUNCj4+IGludm9sdmVzIHNldmVyYWwgcmVnaXN0ZXJzLCBEVCBw
cm9wZXJ0aWVzIGFuZCBwb3NzaWJseSBQT1NUaW5nDQo+PiBwYXJ0cyBvZiB0aGUgY2hpcC4g
SXQgaXMgcHJlZmVyYWJsZSB0byBkbyB0aGlzIGJlZm9yZSBpbml0aWFsaXppbmcNCj4+IHRo
ZSBEUk0gZHJpdmVyLCBzbyB0aGF0IHRoYXQgZWFjaCBjaGlwIHR5cGUgY2FuIGhhdmUgYW4g
aW5kaXZpZHVhbA0KPj4gc2V0dXAgY29kZS4NCj4+DQo+PiBUaGUgcGF0Y2hzZXQgYWRkcmVz
c2VzIHRoZSBwcm9ibGVtIGJ5IG1vdmluZyBhbGwgZWFybHkgZGV0ZWN0aW9uDQo+PiBjb2Rl
IGJlZm9yZSB0aGUgYWxsb2NhdGlvbiBvZiB0aGUgYXN0IGRldmljZS4NCj4+DQo+PiBQYXRj
aCBvbmUgZ2V0cyBhIGxvY2sgb3V0IG9mIHRoZSB3YXkuIFRoZSBsb2NrIGlzIG9ubHkgcmVs
ZXZhbnQNCj4+IGZvciBtb2RlIHNldHRpbmcuIE1vdmUgaXQgdGhlcmUuDQo+Pg0KPj4gUGF0
Y2hlcyAyIGFuZCAzIHJld29yayB0aGUgZGV0ZWN0aW9uIG9mIHRoZSBjb3JyZWN0IEkvTyBt
ZW1vcnkNCj4+IHJhbmdlcy4gSXQgaXMgbm93IHNlbGYtY29udGFpbmVkLCBtb3JlIHJlYWRh
YmxlIGFuZCB3b3JrcyB3aXRob3V0DQo+PiBhbiBpbnN0YW5jZSBvZiBzdHJ1Y3QgYXN0X2Rl
dmljZS4NCj4+DQo+PiBQYXRjaGVzIDQgdG8gNyByZXdvcmsgdGhlIHNldHVwIG9mIHZhcmlv
dXMgcmVnaXN0ZXJzIHRoYXQgYXJlDQo+PiByZXF1aXJlZCBmb3IgZGV0ZWN0aW9uLiBBY2Nl
c3MgaGVscGVycyBmb3IgSS9PIGNhbiBub3cgb3BlcmF0ZQ0KPj4gd2l0aG91dCBhbiBpbnN0
YW5jZSBvZiBzdHJ1Y3QgYXN0X2RldmljZS4gVGhlIHNldHVwIGZ1bmN0aW9ucw0KPj4gb3Bl
cmF0ZSBvbiB0aGUgSS9PIHJhbmdlcyB0aGF0IGhhdmUgYmVlbiBtYWRlIGF2YWlsYWJsZSB3
aXRoDQo+PiBwYXRjaCAzLCBidXQgYWdhaW4gd2l0aG91dCBzdHJ1Y3QgYXN0X2RldmljZS4N
Cj4+DQo+PiBXaXRoIHRoZSBkZXRlY3Rpb24ncyBpbnRlcm5hbHMgZG9uZSwgcGF0Y2hlcyA4
IGFuZCA5IHJld29yayB0aGUNCj4+IGNoaXAncyBhbmQgY29uZmlnLW1vZGUncyBkZXRlY3Rp
b24gY29kZSB0byBvcGVyYXRlIHdpdGhvdXQgc3RydWN0DQo+PiBhc3RfZGV2aWNlIGFzIHdl
bGwuDQo+Pg0KPj4gRmluYWxseSwgcGF0Y2ggMTAgbW92ZXMgdGhlIGRldGVjdGlvbiBjb2Rl
IGludG8gdGhlIFBDSSBwcm9iZQ0KPj4gZnVuY3Rpb24uIGl0IHJ1bnMgYmVmb3JlIGFueSBv
ZiB0aGUgRFJNIGRldmljZSBjb2RlLiBUaGUgZnVuY3Rpb24NCj4+IGZvciBjcmVhdGluZyBh
biBhc3QgZGV2aWNlLCBhc3RfZGV2aWNlX2NyZWF0ZSgpLCByZWNlaXZlcyB0aGUNCj4+IGRl
dGVjdGVkIEkvTyBtZW1vcnkgcmFuZ2VzLCBjaGlwIHR5cGUgYW5kIGNvbmZpZ3VyYXRpb24g
bW9kZS4NCj4+DQo+PiBUaGlzIGNsZWFucyB1cCB0aGUgZGV0ZWN0aW9uIGNvZGUuIFRoZXJl
IGlzIG1vcmUgY2hpcC1zcGVjaWZpYw0KPj4gY29kZSBpbiBvdGhlciBwYXJ0cyBvZiB0aGUg
ZHJpdmVyLiBJbiBhIGxhdGVyIHBhdGNoLCB0aGUgYXN0IGRldmljZQ0KPj4gc2V0dXAgY2Fu
IGJlIHNwbGl0IHVwIHNvIHRoYXQgZWFjaCBjaGlwIHR5cGUgZ2V0cyBpdHMgb3duIGNvZGUN
Cj4+IHBhdGggdGhhdCBkb2VzIG5vdCBpbnRlcmZlcmUgd2l0aCBvdGhlciBjaGlwcy4NCj4+
DQo+PiBUZXN0ZWQgb24gQVNUMTEwMCBhbmQgQVNUMjEwMC4NCj4gDQo+IA0KPiBUZXN0ZWQt
Ynk6IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+IA0KPiANCj4g
U3RpbGwgd29ya3MsIFRoZSB3aG9sZSBzZXJpZXMgaXMgdGVzdGVkIHdpdGggQVNUMjQwMCBo
YXJkd2FyZSBvbiBYODYtNjQuDQoNClRoYW5rcyBhIGxvdC4gSSdsbCBmaXggdXAgdGhlIHR5
cG8geW91IHNwb3R0ZWQgd2hlbiBJIG1lcmdlIHRoZSBwYXRjaGVzLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiANCj4gJCBzdWRvIGRtZXNnIHwgZ3JlcCAiMDM6MDAuMCIN
Cj4gDQo+IGFzdCAwMDAwOjAzOjAwLjA6IFVzaW5nIFAyQSBicmlkZ2UgZm9yIGNvbmZpZ3Vy
YXRpb24NCj4gYXN0IDAwMDA6MDM6MDAuMDogQVNUIDI0MDAgZGV0ZWN0ZWQNCj4gYXN0IDAw
MDA6MDM6MDAuMDogW2RybV0gVXNpbmcgYW5hbG9nIFZHQQ0KPiBhc3QgMDAwMDowMzowMC4w
OiBbZHJtXSBkcmFtIE1DTEs9Mzk2IE1oeiB0eXBlPTYgYnVzX3dpZHRoPTE2DQo+IFtkcm1d
IEluaXRpYWxpemVkIGFzdCAwLjEuMCAyMDEyMDIyOCBmb3IgMDAwMDowMzowMC4wIG9uIG1p
bm9yIDANCj4gYXN0IDAwMDA6MDM6MDAuMDogW2RybV0gZmIwOiBhc3Rkcm1mYiBmcmFtZSBi
dWZmZXIgZGV2aWNlDQo+IA0KPiANCj4+IHYyOg0KPj4gwqDCoMKgwqAqIGFkZCBtaXNzaW5n
IGJyZWFrIHN0YXRlbWVudHMgKEpvY2VseW4pDQo+PiDCoMKgwqDCoCogZml4IGxlbmd0aCB0
ZXN0IGZvciBJL08gcmFuZ2UNCj4+DQo+PiBUaG9tYXMgWmltbWVybWFubiAoMTApOg0KPj4g
wqDCoCBkcm0vYXN0OiBUdXJuIGlvcmVnc19sb2NrIHRvIG1vZGVzZXRfbG9jaw0KPj4gwqDC
oCBkcm0vYXN0OiBSZXdvcmsgSS9PIHJlZ2lzdGVyIHNldHVwDQo+PiDCoMKgIGRybS9hc3Q6
IFJldHJpZXZlIEkvTy1tZW1vcnkgcmFuZ2VzIHdpdGhvdXQgYXN0IGRldmljZQ0KPj4gwqDC
oCBkcm0vYXN0OiBBZGQgSS9PIGhlbHBlcnMgd2l0aG91dCBhc3QgZGV2aWNlDQo+PiDCoMKg
IGRybS9hc3Q6IEVuYWJsZSBWR0Egd2l0aG91dCBhc3QgZGV2aWNlIGluc3RhbmNlDQo+PiDC
oMKgIGRybS9hc3Q6IEVuYWJsZSBNTUlPIHdpdGhvdXQgYXN0IGRldmljZSBpbnN0YW5jZQ0K
Pj4gwqDCoCBkcm0vYXN0OiBQYXJ0aWFsbHkgaW1wbGVtZW50IFBPU1Qgd2l0aG91dCBhc3Qg
ZGV2aWNlIGluc3RhbmNlDQo+PiDCoMKgIGRybS9hc3Q6IEFkZCBlbnVtIGFzdF9jb25maWdf
bW9kZQ0KPj4gwqDCoCBkcm0vYXN0OiBEZXRlY3QgYXN0IGRldmljZSB0eXBlIGFuZCBjb25m
aWcgbW9kZSB3aXRob3V0IGFzdCBkZXZpY2UNCj4+IMKgwqAgZHJtL2FzdDogTW92ZSBkZXRl
Y3Rpb24gY29kZSBpbnRvIFBDSSBwcm9iZSBoZWxwZXINCj4+DQo+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9kcnYuY8KgIHwgMjYzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmjCoCB8IDEwMSAr
KysrKysrKystLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgfCAy
NDQgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9tb2RlLmMgfMKgIDI2ICsrLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X3Bvc3QuYyB8wqAgNzMgKysrKystLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9yZWcuaMKgIHzCoCAxMiArLQ0KPj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCA0MTMg
aW5zZXJ0aW9ucygrKSwgMzA2IGRlbGV0aW9ucygtKQ0KPj4NCj4+DQo+PiBiYXNlLWNvbW1p
dDogYjc4MTZjMzkzNDk2ZGM0NDk3YzEzMjczMTA4MjE0MDdmNzE3MWQ4Yg0KPj4gcHJlcmVx
dWlzaXRlLXBhdGNoLWlkOiAwYWEzNTlmNjE0NGM0MDE1YzE0MGM4YTY3NTBiZTE5MDk5YzY3
NmZiDQo+PiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGM2N2U1ZDg4NmE0N2I3ZDAyNjZkODEx
MDA4Mzc1NTdmZGEzNGNiMjQNCj4+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogY2JjNDUzZWUw
MmZhZTAyYWYyMmZiZmRjZTU2YWI3MzJjN2E4OGMzNg0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBH
ZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwg
Qm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------qQPM0raZ0drp0As7MXvZgMyX--

--------------3E9ouQB1WsAsEjlpwYnPwtHy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVbAnwFAwAAAAAACgkQlh/E3EQov+AM
fw/+M8cwHvD49jFeMNhwYGYZ1rtBjjcohf9dZ/F0rmvg7rmZz7TvxvTHHfBDrzaanoaGzY4KojT9
AO8AEBZBawD38t7307q1qlDc9xt1EPNEr4xXubsKqy9k/vkqkmE49FnPDU0PGsWEQP17m6EJ+3w6
DTYgH/AxgEa5Qase8U+XRo7GtFrf7mO0vgM7a42ivCGHQ/kAtRqpm6+ixilY+I5YJ3B6fCnhWRut
s3R2Yc5z0BSKrNmsbSTloFWMiN7SMsPKZo5mAq9yWVe2JP0An8f1ym9RZz1K8EGEl90CJp8DBezt
j2BK31+CGr7rY9oXwro54ARU/GhyZpfjtnaJiZ+7+gM/9NP2NzwnaoWQ+wG8K8HPTbqz+StcAykB
Evsoj4z0behO80QG2am9htwDNIc0MMNUoBXY4O3w8U/caEoJ4u3xdEnmmmbArtz+Txo2XGNprxft
sQlsAe7SZOiu6rqrBgry/zR7hNILaeMUHN1wR81dFsf1o6e9YYk77JZzdyqqQp9Ly4pg8pq6Du8n
1BBBzorw3Alv+p1R7Iut0BJ68iA4Djdv2gVsKIwpqrRUcxNoBH3cj/HLCFaGvrXPQ2GQ+owAMvKw
RCgK0LGMCVwI4NjsttZo0YUHbI3YI9RDdXBW7181by+tVijmXPSBDI6HVG6152IuTSMhE7wnL3HB
68s=
=vS/y
-----END PGP SIGNATURE-----

--------------3E9ouQB1WsAsEjlpwYnPwtHy--
