Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40117B2D32
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 09:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C2010E6C8;
	Fri, 29 Sep 2023 07:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC4810E6C8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 07:46:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E236A1F8C0;
 Fri, 29 Sep 2023 07:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695973592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=B5geqEnBYRzOW2twuca4kV8yYYvb+KJO+NtEndiCXHk=;
 b=mR4GJ++9OG+xZbHo4EuYCLRQiSxIaumgeoETKwVzaMiHEX+LzRpqRI2Nw5bPvnUit6vAXG
 I0fVIo9A01RBR3KUa7iFaD1JyruLw2ZWiG4xi8Ww5xHG6bZRYJFP6pmPOXY5z3G4uTg1sg
 rsSafO9l+EKfvI6HFOvD82nWLrd37oc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695973592;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=B5geqEnBYRzOW2twuca4kV8yYYvb+KJO+NtEndiCXHk=;
 b=IXMtDIjbHfTYn17dAnwJIbxJ5OrgEGqt+2rb5pfbrBeg/QBh7Ylh9XY/Guas2LSdt1eha0
 G72YQT+7Kv1ONZDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A37841390A;
 Fri, 29 Sep 2023 07:46:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DZ8VJtiAFmXGVQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Sep 2023 07:46:32 +0000
Message-ID: <709a1b3d-a9fe-4b7e-a199-c5d9e27eefbe@suse.de>
Date: Fri, 29 Sep 2023 09:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC 3/3] drm: Split drm_modeset_helper_vtables.h
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1695903065.git.geert+renesas@glider.be>
 <0f0eae276da4f8ed44cd1a15ffa138879d27b148.1695903065.git.geert+renesas@glider.be>
 <d9020d20-f512-42e6-8259-a7377c3d0d58@suse.de>
 <CAMuHMdUXnT61Hj8JwPenD+x_0-k_wU3bUtj8k9wh7Dd+kN4_Dw@mail.gmail.com>
 <9af0ab00-7afd-493b-848a-a433e9b9e182@suse.de>
 <CAMuHMdXWRgL0uxLXt7geDCuHdQ=CDPhOzE7WCa4f4wRFvD50sw@mail.gmail.com>
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
In-Reply-To: <CAMuHMdXWRgL0uxLXt7geDCuHdQ=CDPhOzE7WCa4f4wRFvD50sw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tRSQAKWO04xfrYymuYJZ0ACJ"
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tRSQAKWO04xfrYymuYJZ0ACJ
Content-Type: multipart/mixed; boundary="------------wtNtaA3FDa0dLGJJDEcGXM7E";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Message-ID: <709a1b3d-a9fe-4b7e-a199-c5d9e27eefbe@suse.de>
Subject: Re: [PATCH/RFC 3/3] drm: Split drm_modeset_helper_vtables.h
References: <cover.1695903065.git.geert+renesas@glider.be>
 <0f0eae276da4f8ed44cd1a15ffa138879d27b148.1695903065.git.geert+renesas@glider.be>
 <d9020d20-f512-42e6-8259-a7377c3d0d58@suse.de>
 <CAMuHMdUXnT61Hj8JwPenD+x_0-k_wU3bUtj8k9wh7Dd+kN4_Dw@mail.gmail.com>
 <9af0ab00-7afd-493b-848a-a433e9b9e182@suse.de>
 <CAMuHMdXWRgL0uxLXt7geDCuHdQ=CDPhOzE7WCa4f4wRFvD50sw@mail.gmail.com>
In-Reply-To: <CAMuHMdXWRgL0uxLXt7geDCuHdQ=CDPhOzE7WCa4f4wRFvD50sw@mail.gmail.com>

--------------wtNtaA3FDa0dLGJJDEcGXM7E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDkuMjMgdW0gMDk6MzMgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIEZyaSwgU2VwIDI5LCAyMDIzIGF0IDk6MTHigK9B
TSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+PiBB
bSAyOC4wOS4yMyB1bSAxNzozMiBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoNCj4+PiBP
biBUaHUsIFNlcCAyOCwgMjAyMyBhdCAzOjU54oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4+PiBBbSAyOC4wOS4yMyB1bSAxNDoxNiBz
Y2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoNCj4+Pj4+IDxkcm0vZHJtX21vZGVzZXRfaGVs
cGVyX3Z0YWJsZXMuaD4gaXMgdGhlIHNlY29uZCBsYXJnZXN0IGhlYWRlciBmaWxlIGluDQo+
Pj4+PiB0aGUgRFJNIHN1YnN5c3RlbSwgYW5kIGRlY2xhcmVzIGhlbHBlcnMgdnRhYmxlcyBm
b3IgdmFyaW91cyBEUk0NCj4+Pj4+IGNvbXBvbmVudHMuICBTZXZlcmFsIHZ0YWJsZXMgY29u
dGFpbiBtZXRob2RzIHdpdGggdGhlIHNhbWUgbmFtZSwgYW5kIGFsbA0KPj4+Pj4gYnV0IG9u
ZSB2dGFibGUgZG8gbm90IGZpdCBvbiB0aGUgc2NyZWVuLCBtYWtpbmcgaXQgaGFyZCB0byBu
YXZpZ2F0ZSB0bw0KPj4+Pj4gdGhlIGFjdHVhbCBtZXRob2Qgb25lIGlzIGludGVyZXN0ZWQg
aW4uDQo+Pj4+Pg0KPj4+Pj4gTWFrZSBpdCBlYXNpZXIgZm9yIHRoZSBjYXN1YWwgcmV2aWV3
ZXIgdG8ga2VlcCB0cmFjayBieSBzcGxpdHRpbmcNCj4+Pj4+IDxkcm0vZHJtX21vZGVzZXRf
aGVscGVyX3Z0YWJsZXMuaD4gaW4gbXVsdGlwbGUgaGVhZGVyIGZpbGVzLCBvbmUgcGVyIERS
TQ0KPj4+Pj4gY29tcG9uZW50Lg0KPj4+Pg0KPj4+PiBJIG5ldmVyIGxpa2VkIHRoaXMgaGVh
ZGVyIGVpdGhlciwgYnV0IGRvIHdlIG5lZWQgbmV3IGhlYWRlciBmaWxlcz8gRWFjaA0KPj4+
PiBzdHJ1Y3QgY291bGQgYmUgYXBwZW5kZWQgdG8gdGhlIGVuZCBvZiB0aGUgcmVndWxhciBo
ZWFkZXI6IHN0cnVjdA0KPj4+PiBkcm1fcGxhbmVfaGVscGVyX2Z1bmNzIHRvIGRybV9wbGFu
ZS5oLCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jIHRvDQo+Pj4+IGRybV9jb25uZWN0b3Iu
aCBhbmQgc28gb24uDQo+Pj4NCj4+PiBUaGF0IHdvdWxkIHdvcmsgZm9yIG1lLCB0b28uICBC
dXQgcGVyaGFwcyB3ZSB3YW50IHRvIG1haW50YWluIGEgY2xlYXINCj4+PiBzZXBhcmF0aW9u
IGJldHdlZW4gY29yZSBhbmQgaGVscGVycz8NCj4+Pg0KPj4+IE5vdGUgdGhhdCBtb3Zpbmcg
dGhlIGNvbnRlbnRzIHRvICpfaGVscGVyLmggd291bGQgYmUgYW5vdGhlciBvcHRpb24sDQo+
Pj4gZHJtX2NydGNfaGVscGVyLmggYW5kIGRybV9wbGFuZV9oZWxwZXIuaCBhbHJlYWR5IGV4
aXN0Lg0KPj4NCj4+IEkndmUgdGFrZW4gYSBjbG9zZXIgbG9vayBhdCB0aGUgdXNlcnMgb2Yg
dGhlIF92dGFibGVzIGhlYWRlci4gVGhlcmUncw0KPj4gY29kZSBpbiBkcm1fYXRvbWljX2hl
bHBlci5jIG9yIGRybV9wcm9iZV9oZWxwZXIuYyB0aGF0IGludm9rZXMgdGhlDQo+PiBjYWxs
YmFjayBmdW5jdGlvbnMuDQo+Pg0KPj4gVGhlIGRyaXZlcnMgZmlsbCB0aGUgcG9pbnRlcnMg
d2l0aCBjb2RlIHRoYXQgb2Z0ZW4gY29tZXMgZnJvbSBvdGhlcg0KPj4gaGVscGVyIG1vZHVs
ZXMuIFRoYXQgY29kZSBpcyBpbiBmaWxlcyBsaWtlIGRybV9wbGFuZV9oZWxwZXIuYyBvcg0K
Pj4gZHJtX2NydGNfaGVscGVyLmMuIFRoZXJlIGhlYWRlciBmaWxlcyBhcmUgZHJtX3BsYW5l
X2hlbHBlci5oLCBldGMuDQo+Pg0KPj4gSW4gdGhhdCBjb250ZXh0LCB0aGUgX3Z0YWJsZXMg
aGVhZGVyIG1ha2VzIHNlbnNlLCBhcyBpdCBzZXBhcmF0ZXMgdGhlDQo+PiBjYWxsZXJzIGZy
b20gdGhlIGNhbGxlZXMuIFB1dHRpbmcgdGhlIHN0cnVjdHMgaW50byBoZWFkZXJzIGxpa2UN
Cj4+IGRybV9wbGFuZV9oZWxwZXIuaCB3b3VsZCBtb3ZlIGl0IHRvIHRoZSBjYWxsZWUgc2lk
ZS4NCj4+DQo+PiBJIHN1Z2dlc3QgdG8gbGVhdmUgdGhlIGhlYWRlciBhcyBpdCBpcy4gVGhl
IGZhbGxvdXQgdG8gdGhlIGNvZGUgYmFzZQ0KPj4gZnJvbSByZWZhY3RvcmluZyBzZWVtcyB3
b3JzZSB0aGFuIHRoZSBjdXJyZW50IHN0YXRlLg0KPiANCj4gVG8gY2xhcmlmeTogZG8geW91
IG1lYW4ga2VlcGluZyB0aGUgc2luZ2xlIGJpZyBkcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxl
cy5oLA0KPiBvciB0aGUgc3BsaXQgZHJtXypfaGVscGVyX3Z0YWJsZS5oIHNldD8NCg0KSSBt
ZWFudCB0byBrZWVwIHRoZSBzaW5nbGUgYmlnIGRybV9tb2Rlc2V0X2hlbHBlcl92dGFibGVz
LmguIEl0J3Mgbm90IA0KbmljZSB0byBsb29rIGF0LCBidXQgSSB0aGluayB3ZSBtaWdodCBl
YXNpbHkgbWVzcyB1cCB0aGUgaGVhZGVyIA0KZGVwZW5kZW5jaWVzIHdpdGggYW55IGNoYW5n
ZXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRoYW5rcyENCj4gDQo+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPg0KPj4+Pj4gLS0tDQo+Pj4+PiBSRkMsIGEgZnV0dXJlIHBhdGNoIGNvdWxkIHJl
cGxhY2UgaW5jbHVzaW9uIG9mDQo+Pj4+PiA8ZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFi
bGVzLmg+IGJ5IGluY2x1c2lvbiBvZiBvbmUgb3IgbW9yZSBvZiB0aGUNCj4+Pj4+IG5ldyBm
aWxlcywgYW5kIHJlZHVjZSBjb21waWxhdGlvbiB0aW1lLg0KPj4+Pj4gLS0tDQo+Pj4+PiAg
ICAgaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfdnRhYmxlLmggICB8ICAzNjQg
KysrKysNCj4+Pj4+ICAgICBpbmNsdWRlL2RybS9kcm1fY3J0Y19oZWxwZXJfdnRhYmxlLmgg
ICAgICAgIHwgIDQ4MyArKysrKysNCj4+Pj4+ICAgICBpbmNsdWRlL2RybS9kcm1fZW5jb2Rl
cl9oZWxwZXJfdnRhYmxlLmggICAgIHwgIDM4MSArKysrKw0KPj4+Pj4gICAgIGluY2x1ZGUv
ZHJtL2RybV9tb2RlX2NvbmZpZ19oZWxwZXJfdnRhYmxlLmggfCAgIDk3ICsrDQo+Pj4+PiAg
ICAgaW5jbHVkZS9kcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaCAgICB8IDE0NjYg
Ky0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+Pj4gICAgIGluY2x1ZGUvZHJtL2RybV9wbGFuZV9o
ZWxwZXJfdnRhYmxlLmggICAgICAgfCAgMjk3ICsrKysNCj4+Pj4+ICAgICA2IGZpbGVzIGNo
YW5nZWQsIDE2MjcgaW5zZXJ0aW9ucygrKSwgMTQ2MSBkZWxldGlvbnMoLSkNCj4+Pj4+ICAg
ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvcl9oZWxwZXJf
dnRhYmxlLmgNCj4+Pj4+ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kcm0vZHJt
X2NydGNfaGVscGVyX3Z0YWJsZS5oDQo+Pj4+PiAgICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvZHJtL2RybV9lbmNvZGVyX2hlbHBlcl92dGFibGUuaA0KPj4+Pj4gICAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWdfaGVscGVyX3Z0YWJs
ZS5oDQo+Pj4+PiAgICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2RybV9wbGFu
ZV9oZWxwZXJfdnRhYmxlLmgNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBH
ZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwg
Qm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------wtNtaA3FDa0dLGJJDEcGXM7E--

--------------tRSQAKWO04xfrYymuYJZ0ACJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUWgNgFAwAAAAAACgkQlh/E3EQov+Cz
kA/8C9Sziy/bNtmP26QnpV6IUDER+g3qU/UgrkEnXrix+AFRRrWyhM21isIYNdsEuZf6fVXkGW4X
RKlA5RYn+FNc7vtYkTIwL0X5oij8itpYNpNBnXKO8keqpaW0ZPx6p4YOzVyA3Ro2/3XElnCK9xa4
wfFitzIUuVR9dmHCaFN4IeLSVw9PUd8XpreD84vTfVI4tnfTioXhHNLTXfUxW5OdPGODzrx8MuLf
VkNRwmlCloPrIKW0XzWZzOMu8W88cQ79OySh+mL1SdPF6lvgRxs3bdzo9wjwfMgu+BP1TozFeamQ
HofXjc1BTUIg8glVxHDtm0Wjxo71+GovdaUKGpu+pm5pe21sPm8DbRfwW1dL4TSRSEmbGNz8bBo2
FJMNOIwc/9I1GacEykOjiUv+y0jaQ/ijXLyU7tCzZMybDCj8OWQm+3LipDW8VTlXi7vkiW09muG0
oWZjdC5GRrjmvoAMUOgmZLQTPrLNwj9pIIIIbE9RbjaRQaKd5wCwjIQ3Z9+UGAmy8g5reUmy7xVH
orfNPL4jFy3R93YtlxVHkgH6uuT3oDtlomOE24rZjceMry5KrZnlDpLnrRdCZBupruRZM9EwUDF5
ZeE4ir50luMIx8VNtEE4b3MgKFsW1IZbgYv7um3GaHywOdLSYXktGWtcjiKPdIXxPrh93Gy2XzLP
G6Q=
=HTUQ
-----END PGP SIGNATURE-----

--------------tRSQAKWO04xfrYymuYJZ0ACJ--
