Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E155979A764
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B5710E1CB;
	Mon, 11 Sep 2023 10:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68AA10E184
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:44:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 69BD51F38D;
 Mon, 11 Sep 2023 10:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694429086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lCAnBhbhMFj6XbakM40e3beKa+py2Q7bF1srUezWOIY=;
 b=v/7SvMaU092OZgSqVgLrlPCFV8gpW4JDYNXmrrk9BLBEevLoLZK5RI75s7KQeQJNzgsiGp
 ENxZNgKYo89IaTCcnJPrINk4kOqTjoxCHq9OskDmrIjONq+XCqieqthKLASfx4CzAxNKC7
 +Qwj9aeURH+e2eOCH+W3PCsvsgzHphg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694429086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lCAnBhbhMFj6XbakM40e3beKa+py2Q7bF1srUezWOIY=;
 b=CBAQ5W90HfaCgP1gqOwHMRTO03eCUZaxWJR+Kp6NWTfF/zK20+DyyDGCZ+srXQgGxEoR32
 P0Ffow7tb4DqoXBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B0C713780;
 Mon, 11 Sep 2023 10:44:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7VhdDZ7v/mQnUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Sep 2023 10:44:46 +0000
Message-ID: <9a09dfbb-978c-4331-a49a-b9ad2d3e63bb@suse.de>
Date: Mon, 11 Sep 2023 12:44:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
 <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
 <d19e0242-da31-1e48-8ff8-7381530bd193@redhat.com>
 <3fba00ec-d4bc-e7f9-4a7c-8a6a9141a591@suse.de>
 <7b3ec46f-b9d9-9d9b-7a39-ae53193e9d32@redhat.com>
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
In-Reply-To: <7b3ec46f-b9d9-9d9b-7a39-ae53193e9d32@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------336zyDf0n1BHmABQXzARJv4L"
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
Cc: javierm@redhat.com, mripard@kernel.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------336zyDf0n1BHmABQXzARJv4L
Content-Type: multipart/mixed; boundary="------------MJO4VbwXD3J0k9CAhNdCVpjT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Cc: airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 contact@emersion.fr, dri-devel@lists.freedesktop.org
Message-ID: <9a09dfbb-978c-4331-a49a-b9ad2d3e63bb@suse.de>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
 <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
 <d19e0242-da31-1e48-8ff8-7381530bd193@redhat.com>
 <3fba00ec-d4bc-e7f9-4a7c-8a6a9141a591@suse.de>
 <7b3ec46f-b9d9-9d9b-7a39-ae53193e9d32@redhat.com>
In-Reply-To: <7b3ec46f-b9d9-9d9b-7a39-ae53193e9d32@redhat.com>

--------------MJO4VbwXD3J0k9CAhNdCVpjT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDkuMjMgdW0gMTI6MDUgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQpb
Li4uXQ0KPj4gT3B0aW1pemF0aW9uIGFsd2F5cyBkZXBlbmRzIG9uIHRoZSB3b3JrbG9hZDsg
c29tZXRoaW5nIHRoYXQgdGhlIGRyaXZlciANCj4+IGRvZXNuJ3Qga25vdy4gRm9yIGV4YW1w
bGUsIGFzIHdlIG1vc3RseSBtb3ZlIHRoZSBtb3VzZSBjdXJzb3IgYXJvdW5kIA0KPj4gdGhl
IHNjcmVlbiwgdGhlIGRhbWFnZXMgYXJlYXMgYXJlIHVzdWFsbHkgc21hbGwuIE9wdGltaXpp
bmcgdGhpcyBtaWdodCANCj4+IGJlIHBvaW50bGVzcyBpbiBhbnkgY2FzZS4NCj4gDQo+IFNv
IHlvdXIgcG9pbnQgaXMgd2Ugc2hvdWxkIG5vdCBvcHRpbWl6ZSBiZWNhdXNlIHNvbWV0aW1l
IGl0IG1pZ2h0IG5vdCBiZSANCj4gbmVjZXNzYXJ5ID8gQW5kIGV2ZW4gZm9yIGN1cnNvciB1
cGRhdGUsIHRoZSBjb252ZXJzaW9uIGlzIHN0aWxsIDI1JSBmYXN0ZXIuDQoNClllcywga2lu
ZCBvZi4gVGhvc2UgMjUlIGFyZSBtZWFuaW5nbGVzcyBpbiB0aGUgYmlnIHBpY3R1cmUuIEFu
ZCB0aGUgDQpjdXJyZW50IGNvZGUgaXMgZmFzdCBlbm91Z2ggZm9yIHdoYXQgdGhlc2UgY2hp
cHMgZG8gKHNlcnZlciBjb25zb2xlcykuIA0KU28gdGhlcmUncyBubyBwb2ludGluZyBtaWNy
by1vcHRpbWl6aW5nIGFueXRoaW5nIGhlcmUuIFNlZSBteSByZXBseSB0byANClBla2thIGZv
ciBhbiBvcHRpbWl6YXRpb24gdGhhdCBJJ2QgZmluZCBtdWNoIG1vcmUgdXNlZnVsLg0KDQpJ
ZiBJIGhhdmUgdG8gY2hvb3NlIGJldHdlZW4gZmFzdC1lbm91Z2gtYnV0LXNpbXBsZSBhbmQg
DQpmYXN0ZXItYnV0LWNvbXBsaWNhdGVkLCB0aGUgZm9ybWVyIGlzIG11Y2ggcHJlZmVyYWJs
ZS4gQW55b25lIHdobyB3YW50cyANCmZhc3QgYW5kIGJlYXV0aWZ1bCBncmFwaGljcyBoYXMg
YSBiZXR0ZXIgZ3JhcGhpY3MgY2FyZCBhbnl3YXkuDQoNCj4gDQo+Pg0KPj4+DQo+Pj4+DQo+
Pj4+IEFub3RoZXIgcG9pbnQgb2YgY29uY2VybiBpcyBDUFUgY29uc3VtcHRpb246IFNsb3cg
SS9PIGJ1c2VzIG1heSANCj4+Pj4gc3RhbGwgdGhlIGRpc3BsYXkgdGhyZWFkLCBidXQgdGhl
IENQVSBjb3VsZCBkbyBzb21ldGhpbmcgZWxzZSBpbiB0aGUgDQo+Pj4+IG1lYW50aW1lLiBE
b2luZyBmb3JtYXQgY29udmVyc2lvbiBvbiB0aGUgQ1BVIHByZXZlbnRzIHRoYXQsIGhlbmNl
IA0KPj4+PiBhZmZlY3Rpbmcgb3RoZXIgcGFydHMgb2YgdGhlIHN5c3RlbSBuZWdhdGl2ZWx5
LiBPZiBjb3Vyc2UsIHRoYXQncyANCj4+Pj4gbW9yZSBvZiBhIGd1dCBmZWVsaW5nIHRoYW4g
aGFyZCBkYXRhLg0KPj4+DQo+Pj4gSSB0aGluayBpdCdzIHRoZSByZXZlcnNlLiBXaXRob3V0
IGRyb3BwaW5nIHRoZSBYIGRhdGEsIHRoZSBDUFUgaXMgDQo+Pj4gYWN0dWFsbHkgc3RhbGxp
bmcgbXVjaCBsb25nZXIgc2VuZGluZyB1c2VsZXNzIGJ5dGVzIHRvIHRoZSBtZ2FnMjAwJ3Mg
DQo+Pj4gVlJBTS4gQW5kIHRoZSBDUFUgY2FuJ3QgZG8gYW55dGhpbmcgZWxzZSB3aGlsZSBk
b2luZyBtZW1jcHlfdG9pbygpLg0KPj4NCj4+IEh5cGVydGhyZWFkaW5nLg0KPiANCj4gSSBz
dGlsbCBkb3VidCBhIHVzZXItc3BhY2UgY29udmVyc2lvbiB3b3VsZCBkbyBhIGJldHRlciBq
b2IgdGhhbiB0aGUgDQo+IGtlcm5lbC4NCj4+DQo+PiBZb3UgYXJlIGFsc28gYXJndWluZyBh
Z2FpbnN0IFhSR0IgaW4gZ2VuZXJhbCwgd2hpY2ggaXMgYSBkaWZmZXJlbnQgdG9waWMuDQo+
IA0KPiB5ZXMsIHRoZSBpc3N1ZSBpcyBodW1hbiBleWVzIG9ubHkgc2VlcyAzIGNvbG9ycywg
YW5kIGl0J3Mgbm90IGEgcG93ZXIgb2YgDQo+IHR3by4gU28gY29tcHJvbWlzZSBoYXZlIGJl
ZW4gbWFkZSwgYW5kIHRoYXQgTWF0cm94IGNhcmQsIGlzIGZyb20gdGhlIGVyYSANCj4gb2Yg
dGhlIHRyYW5zaXRpb24gZnJvbSAxNmJpdHMgdG8gMzJiaXRzLCBhbmQgd29ya3Mgc2lnbmlm
aWNhbnRseSBiZXR0ZXIgDQo+IGluIDI0Yml0cy4gQW5kIGl0J3MgcHJvYmFibHkgdGhlIG9u
bHkgcmVtYWluaW5nIEdQVSB3aXRoIHRoaXMgcHJvYmxlbS4NCg0KTm8uIFRoZXJlJ3MgYXQg
bGVhc3QgdWRsIGhhcmR3YXJlLCB3aGljaCBkb2VzIG9ubHkgc3VwcG9ydCBSR0IxNiBhbmQg
DQpSR0IyNC4gQW5kIGZvciBzaW1wbGVkcm0gYW5kIG9mZHJtLCB3ZSBoYXZlIHRvIHRha2Ug
d2hhdGV2ZXIgdGhlIHN5c3RlbSANCnByb3ZpZGVkIHVzIHdpdGguIFRoYXQgY291bGQgYmUg
UkdCMjQuDQoNCj4gDQo+Pg0KPj4+IFVzaW5nIERNQSBpcyB0aGUgb25seSB3YXkgdG8gZnJl
ZSB0aGUgQ1BVIGR1cmluZyB0aGUgY29weSwgYnV0IGl0IA0KPj4+IGFwcGVhcnMgdG8gYmUg
ZWl0aGVyIGJyb2tlbiBvciBzaWduaWZpY2FudGx5IHNsb3dlciBvbiBtb3N0IG1nYWcyMDAg
DQo+Pj4gaGFyZHdhcmUuDQo+Pj4NCj4+PiBJIGFjdHVhbGx5IGhhdmUgbWFkZSB0aGUgd29y
ayB0byBzdXBwb3J0IERNQSwgYW5kIEknbSBhIGJpdCBzYWQgaXQgDQo+Pj4gZGlkbid0IHdv
cmsgb24gYWxsIGcyMDAsIHNvIHRoaXMgb3B0aW1pemF0aW9uIGlzIHJlYWxseSBhIGxhc3Qg
DQo+Pj4gcmVzb3J0LCBvbiBhIHJlYWxseSBicm9rZW4gaGFyZHdhcmUuDQo+Pj4NCj4+Pj4N
Cj4+Pj4gUGxlYXNlIG5vdGUgdGhhdCB0aGUga2VybmVsJ3MgY29udmVyc2lvbiBjb2RlIHVz
ZXMgbWVtb3J5IGFsbG9jYXRpb24gDQo+Pj4+IG9mIGludGVybWVkaWF0ZSBidWZmZXJzLiBX
ZSBldmVuIHJlY2VudGx5IGhhZCBhIGRpc2N1c3Npb24gYWJvdXQgDQo+Pj4+IGFsbG9jYXRp
b24gb3ZlcmhlYWQgZHVyaW5nIGRpc3BsYXkgdXBkYXRlcy4gVXNlcnNwYWNlIGNhbiBzdXJl
bHkgZG8gDQo+Pj4+IGEgYmV0dGVyIGpvYiBhdCBrZWVwaW5nIHN1Y2ggYnVmZmVycyBhcm91
bmQuDQo+Pj4+DQo+Pj4+IEFuZCBmaW5hbGx5IGEgbm90ZSB0aGUgaGFyZHdhcmUgaXRzZWxm
OiBvbiBsb3ctZW5kIGhhcmR3YXJlIGxpa2UgDQo+Pj4+IHRob3NlIE1hdHJveCBjaGlwcywg
anVzdCBzd2l0Y2ggdG8gUkdCMTYuIFRoYXQgd2lsbCBiZSBwcmV0dHkgYW5kIA0KPj4+PiBm
YXN0IGVub3VnaCBmb3IgdGhlc2UgY2hpcHMnIHNlcnZlciBzeXN0ZW1zLiBBbnlvbmUgd2hv
IGNhcmVzIGFib3V0IA0KPj4+PiBmYXN0IGFuZCBiZWF1dGlmdWwgc2hvdWxkIGJ1eSBhIHJl
YWwgZ3JhcGhpY3MgY2FyZC4NCj4+Pg0KPj4+IFRoZXJlIGFyZSBzdGlsbCBzeXNhZG1pbiB1
c2VycyB0aGF0IG9jY2FzaW9uYWxseSBoYXZlIHRvIGJyb3dzZSB0aGUgDQo+Pj4gd2ViIHRv
IGZpbmQgYW5zd2VyLCBvciByZWFkIHRoZWlyIG1haWwgaW4gYSBHVUkgY2xpZW50LiBJdCB0
dXJucyBvdXQgDQo+Pj4gdGhhdCByZ2IxNiBpcyBwcmV0dHkgdWdseSBmb3IgdG9kYXkgc3Rh
bmRhcmQsIGFuZCBidXlpbmcgYW4gZXh0ZXJuYWwgDQo+Pj4gY2FyZCB3b3VsZCBiZSBhIGJp
dCB0b28gbXVjaCwgYW5kIHdvbid0IHdvcmsgZm9yIHJlbW90ZSBjb250cm9sLg0KPj4NCj4+
IEknbSBzdXJlIHN5c2FkbWlucyBoYXZlIGEgY29tcHV0ZXIgZm9yIHdvcmsgd2l0aCBhIGRl
Y2VudCBHUFUgYW5kIA0KPj4gZG9uJ3QgbmVlZCB0byBicm93c2UgdGhlIHdlYiBvbiB0aGVp
ciBzZXJ2ZXIgc3lzdGVtcy4NCj4gDQo+IFRoZSBHVUkgYXBwbGljYXRpb25zIGFsc28gaW5j
bHVkZSBncmFwaGljYWwgaW5zdGFsbGVyLCB0aGF0IG9idmlvdXNseSANCj4geW91IGNhbid0
IHJ1biBvbiBvdGhlciBzeXN0ZW0uDQoNCj4gSSBkbyBoYXZlIGJ1ZyByZXBvcnRzLCBhbmQg
SSBhbHJlYWR5IGZpeGVkIGEgZmV3IHJlZ3Jlc3Npb25zIGluIHRoZSANCj4gbWdhZzIwMCBk
cml2ZXIgZnJvbSB0aGlzIHJlcG9ydHMuDQoNClRoaXMgaXNuJ3QgYSBkcml2ZXIgYnVnLg0K
DQo+IEJ1dCBpZiB5b3UgdGhpbmsgdGhleSBzaG91bGRuJ3QgdXNlIHRoaXMgR1BVLCB0aGVu
IHdoeSBtYWludGFpbmluZyBhIA0KPiBkcml2ZXIgaW4gdGhlIGZpcnN0IHBsYWNlID8gU2lt
cGxlZHJtIGlzIGVub3VnaCBpZiB5b3UgZG9uJ3QgdXNlIGdyYXBoaWNzLg0KDQpJJ3ZlIGRv
bmUgbXkgc2hhcmUgb2YgZ3JhcGhpYyBpbnN0YWxsYXRpb25zIG9uIHRoZXNlIGNoaXBzLiBO
ZWl0aGVyIA0KbG93LWNvbG9yIG1vZGVzIG5vciBwZXJmb3JtYW5jZSBoYXMgZXZlciBiZWVu
IGEgcHJvYmxlbS4gQW5kIGlmLCBpdCBpcyANCnN0aWxsIGJldHRlciB0byBzcGVuZCB0aGUg
dGltZSBvbiB0aGUgcmVuZGVyZXIsIHNvIHRoYXQgYWxsIGRyaXZlcnMgY2FuIA0KYmVuZWZp
dC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+DQo+PiBCZXN0IHJlZ2FyZHMN
Cj4+IFRob21hcw0KPj4NCj4+Pg0KPj4+DQo+Pj4gQmVzdCByZWdhcmRzLA0KPj4+DQo+Pg0K
PiANCj4gQmVzdCByZWdhcmRzLA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0K
R0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4g
TW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------MJO4VbwXD3J0k9CAhNdCVpjT--

--------------336zyDf0n1BHmABQXzARJv4L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT+750FAwAAAAAACgkQlh/E3EQov+A6
XBAAzqp0b6WmHlToFGFI1TPKOQ40eTvS66SPKcC2AeFg39SPBKepE63mJOXqvY9TnFnxUmptGs/l
hvnp/bll18BcXILkmFZv+uUuo8zm8Xy7Zmx9BiVLLbDnaDAai5IZLcFLjDuoKJ4eCp4flssFxlsN
DZto8czJ+LA7s2k8B2kv/0A7o0yqrIhzDgpcbqH1F8ioFewc6Zd56VTdO40h2RsOplDW4TBVYuN2
eGMX4YPAAzhOjG+kuKM3cvlAVQovU/TB3lGp2LzTLaicR+Q7j2wi20XSMkshOVq3RIA+J8UWgC70
Cj3qk+6iBW87LcD0AgcUrlhPvNgGOg3+i3nqvLA37S6y7W3xUwR+n6FSrFM32ujYhF8edRlQ9UrZ
qXuEculEYvpShqmK4bTVOImI2eral2Z+A7DfvcocX9P9qwZFmLYCTfV+pkHLS/zzU8LVKZ3frUwN
3xKyGZzbU1W7Wzdh8tZtvLAPx8U8+t2A/8hK75+Y6hWsFcVpT+X21TkXwHzPuNP0EVrchLlbbG3j
oCJETqjv1gYV8Ylus0GVrdJFkmAIWUAdS0Hw5dJmgEyu1QMxdAeVw9osvEDm8PVbHsOyEkEaHyi0
GCf52EoZwvAI8kSriyPQq67VE1LsV8gDYwFZXvrXT1ekQj8PWcBk+759UwntMmVIf8t2CUW2171t
rtQ=
=aqcH
-----END PGP SIGNATURE-----

--------------336zyDf0n1BHmABQXzARJv4L--
