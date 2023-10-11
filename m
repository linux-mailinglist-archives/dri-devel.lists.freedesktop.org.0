Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 538FF7C5099
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 12:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD7010E694;
	Wed, 11 Oct 2023 10:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E2210E694
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 10:53:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5164A21860;
 Wed, 11 Oct 2023 10:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697021595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cBHKXCH7hQsVinOZBWVy9CnDDWZp0lSWO39QsmtF/bM=;
 b=f/rfD4d9bICbaBx1lFp46WkZiQlrU8Gpw7GDvPt65GhA/AbdcZHPJj8uvlyyR+JkO2No5R
 j4qpA/l594sY9wAWMyJRmeHWC4yX0oCL61p7B/NtyAVs3IpVZagldysMl0nlvZly/2IweN
 jk0JzlUxgNkM0Fg0calEbIaJuyW8op4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697021595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cBHKXCH7hQsVinOZBWVy9CnDDWZp0lSWO39QsmtF/bM=;
 b=vxzRpq/Zwxi5yK3Bl4tSihUNmm/Ewdy3Wo1eAQpQ8zyEnYW7CLrzMEJN2qgK9w3+6hu4Zs
 EfyN+iWtrKBP4lAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26891138EF;
 Wed, 11 Oct 2023 10:53:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X3q4BZt+JmXUcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Oct 2023 10:53:15 +0000
Message-ID: <edea5e48-2723-49ea-ad03-8cd3d9aa53b3@suse.de>
Date: Wed, 11 Oct 2023 12:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
 <20231011092051.640422-1-daniel.vetter@ffwll.ch>
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
In-Reply-To: <20231011092051.640422-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Rm0HvTT5ecjNvSDAmSzR2XqI"
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Manasi Navare <navaremanasi@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Rm0HvTT5ecjNvSDAmSzR2XqI
Content-Type: multipart/mixed; boundary="------------bjGXlzbwPv2PTp00Etp0mSEd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Manasi Navare <navaremanasi@google.com>
Message-ID: <edea5e48-2723-49ea-ad03-8cd3d9aa53b3@suse.de>
Subject: Re: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
References: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
 <20231011092051.640422-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20231011092051.640422-1-daniel.vetter@ffwll.ch>

--------------bjGXlzbwPv2PTp00Etp0mSEd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTAuMjMgdW0gMTE6MjAgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBt
c20gaXMgYXV0b21hZ2ljYWxseSB1cGdyYWRpbmcgbm9ybWFsIGNvbW1pdHMgdG8gZnVsbCBt
b2Rlc2V0cywgYW5kDQoNCkNhbiB5b3UgZ2l2ZSBjb250ZXh0IG9yIHBvaW50ZXJzIGhlcmU/
DQoNCj4gdGhhdCdzIGEgYmlnIG5vLW5vOg0KPiANCj4gLSBmb3Igb25lIHRoaXMgcmVzdWx0
cyBpbiBmdWxsIG9uLT5vZmYtPm9uIHRyYW5zaXRpb25zIG9uIGFsbCB0aGVzZQ0KPiAgICBj
cnRjLCBhdCBsZWFzdCBpZiB5b3UncmUgdXNpbmcgdGhlIHVzdWFsIGhlbHBlcnMuIFdoaWNo
IHNlZW1zIHRvIGJlDQo+ICAgIHRoZSBjYXNlLCBhbmQgaXMgYnJlYWtpbmcgdWFwaQ0KPiAN
Cj4gLSBmdXJ0aGVyIGV2ZW4gaWYgdGhlIGN0bSBjaGFuZ2UgaXRzZWxmIHdvdWxkIG5vdCBy
ZXN1bHQgaW4gZmxpY2tlciwNCj4gICAgdGhpcyBjYW4gaGlkZSBtb2Rlc2V0cyBmb3Igb3Ro
ZXIgcmVhc29ucy4gV2hpY2ggYWdhaW4gYnJlYWtzIHRoZQ0KPiAgICB1YXBpDQo+IA0KPiB2
MjogSSBmb3Jnb3QgdGhlIGNhc2Ugb2YgYWRkaW5nIHVucmVsYXRlZCBjcnRjIHN0YXRlLiBB
ZGQgdGhhdCBjYXNlDQo+IGFuZCBsaW5rIHRvIHRoZSBleGlzdGluZyBrZXJuZWxkb2MgZXhw
bGFpbmVycy4gVGhpcyBoYXMgY29tZSB1cCBpbiBhbg0KPiBpcmMgZGlzY3Vzc2lvbiB3aXRo
IE1hbmFzaSBhbmQgVmlsbGUgYWJvdXQgaW50ZWwncyBiaWdqb2luZXIgbW9kZS4NCj4gQWxz
byBjYyBldmVyeW9uZSBpbnZvbHZlZCBpbiB0aGUgbXNtIGlyYyBkaXNjdXNzaW9uLCBtb3Jl
IHBlb3BsZQ0KPiBqb2luZWQgYWZ0ZXIgSSBzZW50IG91dCB2MS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBDYzog
TWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4N
Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4gQ2M6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGdtYWlsLmNvbT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4NCj4gQ2M6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBjb2xsYWJvcmEu
Y29tPg0KPiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPg0KPiBDYzogU2lt
b24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPg0KPiBDYzogTWFuYXNpIE5hdmFyZSA8bmF2
YXJlbWFuYXNpQGdvb2dsZS5jb20+DQo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogQWJoaW5hdiBLdW1hciA8cXVpY19hYmhp
bmF2a0BxdWljaW5jLmNvbT4NCj4gQ2M6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5
c2hrb3ZAbGluYXJvLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4NCj4gLS0tDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2F0b21p
Yy5oIHwgMjMgKysrKysrKysrKysrKysrKysrKysrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fYXRvbWljLmggYi9pbmNsdWRlL2RybS9kcm1fYXRvbWljLmgNCj4g
aW5kZXggY2Y4ZTEyMjBhNGFjLi41NDVjNDg1NDU0MDIgMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9hdG9taWMuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fYXRvbWljLmgN
Cj4gQEAgLTM3Miw4ICszNzIsMjcgQEAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgew0KPiAg
IAkgKg0KPiAgIAkgKiBBbGxvdyBmdWxsIG1vZGVzZXQuIFRoaXMgaXMgdXNlZCBieSB0aGUg
QVRPTUlDIElPQ1RMIGhhbmRsZXIgdG8NCj4gICAJICogaW1wbGVtZW50IHRoZSBEUk1fTU9E
RV9BVE9NSUNfQUxMT1dfTU9ERVNFVCBmbGFnLiBEcml2ZXJzIHNob3VsZA0KPiAtCSAqIG5l
dmVyIGNvbnN1bHQgdGhpcyBmbGFnLCBpbnN0ZWFkIGxvb2tpbmcgYXQgdGhlIG91dHB1dCBv
Zg0KPiAtCSAqIGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KCkuDQo+ICsJICogbm90
IGNvbnN1bHQgdGhpcyBmbGFnLCBpbnN0ZWFkIGxvb2tpbmcgYXQgdGhlIG91dHB1dCBvZg0K
PiArCSAqIGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KCkuIFRoZSBkZXRhaWxlZCBy
dWxlcyBhcmU6DQoNCkNvbW1lbnRzIG9uIHRoZSB0ZXh0IGZyb20gYSBub24tbmF0aXZlIHNw
ZWFrZXI6DQoNCg0KSSBhc3N1bWUgdGhhdCB5b3UgZm9sbG93IFJGQyAyMTE5LiBJJ2QgbGVh
dmUgb3V0IHRoZSBuZXcgc2VudGVuY2UgDQooJ3Nob3VsZCBub3QnKSwgYXMgaXQgaXMgd2Vh
a2VyIHRoYW4gdGhlIGFjdHVhbCBydWxlcy4gTWF5YmUgbGlzdCB0aGUgDQpydWxlcyBkaXJl
Y3RseS4gU29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZiAiRHJpdmVycyBjb25zdWx0aW5n
IHRoaXMgDQpmbGFnIG11c3QgZm9sbG93IHRoZSBmb2xsb3dpbmcgcnVsZXMiLg0KDQo+ICsJ
ICoNCj4gKwkgKiAtIERyaXZlcnMgbXVzdCBub3QgY29uc3VsdCBAYWxsb3dfbW9kZXNldCBp
biB0aGUgYXRvbWljIGNvbW1pdCBwYXRoLA0KDQonYXRvbWljLWNvbW1pdCcgYmVjYXVzZSBp
dCdzIHRoZSBjb2RlIHBhdGggZm9yIGF0b21pYyBjb21taXRzLg0KDQo+ICsJICogICBhbmQg
aW5zdGVhZCB1c2UgZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQoKS4NCj4gKwkgKg0K
PiArCSAqIC0gRHJpdmVycyBtYXkgY29uc3VsdCBAYWxsb3dfbW9kZXNldCBpbiB0aGUgYXRv
bWljIGNoZWNrIHBhdGgsIGlmDQoNCidhdG9taWMtY2hlY2snDQoNCj4gKwkgKiAgIHRoZXkg
aGF2ZSB0aGUgY2hvaWNlIGJldHdlZW4gYW4gb3B0aW1hbCBoYXJkd2FyZSBjb25maWd1cmF0
aW9uDQoNCmNvbW1hIGFmdGVyIGNvbmZpZ3VyYXRpb24NCg0KPiArCSAqICAgd2hpY2ggcmVx
dWlyZXMgYSBtb2Rlc2V0LCBhbmQgYSBsZXNzIG9wdGltYWwgY29uZmlndXJhdGlvbiB3aGlj
aA0KDQonbGVzcy1vcHRpbWFsJw0KDQo+ICsJICogICBjYW4gYmUgY29tbWl0dGVkIHdpdGhv
dXQgYSBtb2Rlc2V0LiBBbiBleGFtcGxlIHdvdWxkIGJlIHN1Ym9wdGltYWwNCj4gKwkgKiAg
IHNjYW5vdXQgRklGTyBhbGxvY2F0aW9uIHJlc3VsdGluZyBpbiBpbmNyZWFzZWQgaWRsZSBw
b3dlcg0KVGhpcyBzZW50ZW5jZSBpcyBoYXJkIHRvIHVuZGVyc3RhbmQgZm9yIG1lLiBJcyBp
dCAnc2Nhbm91dCBGSUZPIA0KYWxsb2NhdGlvbicgb3IgJ3NjYW5vdXQtRklGTyBhbGxvY2F0
aW9uJz8gTWF5YmUgYWxzbyB0cnkgcHV0dGluZyBhIGNvbW1hIA0KYWZ0ZXIgJ2FsbG9jYXRp
b24nLg0KDQo+ICsJICogICBjb25zdW1wdGlvbi4gVGhpcyBhbGxvd3MgdXNlcnNwYWNlIHRv
IGF2b2lkIGZsaWNrZXJpbmcgYW5kIGRlbGF5cw0KPiArCSAqICAgZm9yIHRoZSBub3JtYWwg
Y29tcG9zaXRpb24gbG9vcCBhdCByZWFzb25hYmxlIGNvc3QuDQo+ICsJICoNCj4gKwkgKiAt
IERyaXZlcnMgbXVzdCBjb25zdWx0IEBhbGxvd19tb2Rlc2V0IGJlZm9yZSBhZGRpbmcgdW5y
ZWxhdGVkIHN0cnVjdA0KPiArCSAqICAgZHJtX2NydGNfc3RhdGUgdG8gdGhpcyBjb21taXQg
YnkgY2FsbGluZw0KPiArCSAqICAgZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0ZSgpLiBTZWUg
YWxzbyB0aGUgd2FybmluZyBpbiB0aGUNCj4gKwkgKiAgIGRvY3VtZW50YXRpb24gZm9yIHRo
YXQgZnVuY3Rpb24uDQo+ICsJICoNCj4gKwkgKiAtIERyaXZlcnMgbXVzdCBuZXZlciBjaGFu
Z2UgdGhpcyBmbGFnLCBpdCBpcyBvbmx5IHVuZGVyIHRoZSBjb250cm9sDQoNCk1heWJlIHRy
eSAnaXQgaXMgdW5kZXIgZXhjbHVzaXZlIGNvbnRyb2wgb2YgdXNlciBzcGFjZScgPw0KDQo+
ICsJICogICBvZiB1c2Vyc3BhY2UuDQoNCkknZCBhbHNvIG9yZGVyIHRoZXNlIHBvaW50cyBs
aWtlIHRoYXQNCg0KICAgLSBtdXN0IG5vdCBjaGFuZ2UNCiAgIC0gbXVzdCBub3QgdXNlIGl0
IGluIGF0b21pY19jb21taXQNCiAgIC0gbXVzdA0KICAgLSBtYXkNCg0Kc28gdGhhdCB0aGUg
J2Rvbid0IGRvcycgYXJlIGZpcnN0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAg
CSAqLw0KPiAgIAlib29sIGFsbG93X21vZGVzZXQgOiAxOw0KPiAgIAkvKioNCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYx
IE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRy
ZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcp
DQo=

--------------bjGXlzbwPv2PTp00Etp0mSEd--

--------------Rm0HvTT5ecjNvSDAmSzR2XqI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUmfpoFAwAAAAAACgkQlh/E3EQov+A2
hBAAuR2lXkpGHsc8G6EvinuRVrH+qfzFW97M/pX4m6Jmrx0epnaYARr8EhXFSHqB5Frv7DlrEobK
o5J9atR6yUbqplXX6Gbz24rG/Gh0N7LC+b5GiVil+g0cKEKzDzZXh5+9OnHqoWeDxzuJ5vu9U5DA
BwCs4WIon8Q1VV7Gk4kgOtBvPB/TBSPslSEr+eXr2TMewj1c/+SbOstpkuZXGagaWs/Imuxe5GGm
Bh2aMeq4vdllP+CfD3fWbnyX6/1qfQC3D6BUi7NtZCgO2awUVu6TUHuuEofec0is3RHheSP/Sjpt
IzZsHQvSXcRZmYlBt7oqob+H75VHoOjM8SIYc2/oaX4uJEemL9TGdV+XqtLnomh8mmGdLXEwwT37
4kICaI9OYbO68iqxRNKpyhbJ4w6WFuId43sPNb3kw3RIlUx+DGUJY16qtrJ4V4f3jt6x3OMCyLdc
x6b7+sCdbVk97V30U6bUw7pT9MPZkonYFZfZFca5fwQAFVcqcKBsFh1XHplLAt6fTknwPQ1/WNWy
pWUUbRBWs2OXPAtHSpmUCYC9IiSD4fsJ68WV62u/Dy+9QnnVDJuGRE+2aIZLUXgA+EbX1+hDBQnC
tipOatXmE3zAWP2OhGk3vfL4PcXla3azl7nnAIQ/BHRdPAtzufkUC9Ao0HpjgRZVXeLX99o/MLxy
Sww=
=v8mN
-----END PGP SIGNATURE-----

--------------Rm0HvTT5ecjNvSDAmSzR2XqI--
