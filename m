Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D887AEE86
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 16:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7679A10E3EF;
	Tue, 26 Sep 2023 14:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225F610E137;
 Tue, 26 Sep 2023 14:46:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A23AF21857;
 Tue, 26 Sep 2023 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695739613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NPFpRw40YGFhSZ0dkJaS5uu5x5ldrJSDLdzG+izQHrc=;
 b=WVmOtb+29itRxhXNqD/8cA/b4Uhh1aEX0qLCJJ7mJ8XAerCMn8fl7K5XrjOp8569eyovFO
 0UJk0UcuLW9ME0OOYTAbX4LluAb5i5ayDVv820yW5btAfDEwdY6UklQNK/327tqi0PZ0Y+
 Hn4dNOhOYsYLQcWvW4/y6lbxWARzkDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695739613;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NPFpRw40YGFhSZ0dkJaS5uu5x5ldrJSDLdzG+izQHrc=;
 b=rbpsKkCyKRi6ITQqjCv8OwMEsZZZwaGAzDq8J755JBXImKh/LD+7DlGBtTpXHkr8+8rSRX
 AaGd27yENlE1gQBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E936C13434;
 Tue, 26 Sep 2023 14:46:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vZnlNdzuEmWFZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Sep 2023 14:46:52 +0000
Message-ID: <ab0a74be-3723-4803-89fa-826298a38679@suse.de>
Date: Tue, 26 Sep 2023 16:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 0/2] drm: Refactor plane size calculation by
 core helper functions
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230926141519.9315-1-gcarlos@disroot.org>
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
In-Reply-To: <20230926141519.9315-1-gcarlos@disroot.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ks5BiOLYs0vh0jmHiB1L5bxB"
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Maira Canal <mairacanal@riseup.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ks5BiOLYs0vh0jmHiB1L5bxB
Content-Type: multipart/mixed; boundary="------------sbIFnpCcqBy9s2RCAy0DDNHu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Maira Canal <mairacanal@riseup.net>, Arthur Grillo
 <arthurgrillo@riseup.net>, Tales Aparecida <tales.aparecida@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Clint Taylor <clinton.a.taylor@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ab0a74be-3723-4803-89fa-826298a38679@suse.de>
Subject: Re: [RESEND PATCH v2 0/2] drm: Refactor plane size calculation by
 core helper functions
References: <20230926141519.9315-1-gcarlos@disroot.org>
In-Reply-To: <20230926141519.9315-1-gcarlos@disroot.org>

--------------sbIFnpCcqBy9s2RCAy0DDNHu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDkuMjMgdW0gMTY6MTUgc2NocmllYiBDYXJsb3MgRWR1YXJkbyBHYWxs
byBGaWxobzoNCj4gVGhlcmUncyBkdXBsaWNhdGVkIGZ1bmN0aW9ucyBvbiBkcm0gdGhhdCBk
byB0aGUgc2FtZSBqb2Igb2YgY2FsY3VsYXRpbmcNCj4gdGhlIHNpemUgb2YgcGxhbmVzIGZy
b20gYSBkcm1fZm9ybWF0X2luZm8gYW5kIHRoZSBzaXplIG9mIGl0cyBmaXJzdA0KPiBwbGFu
ZS4gU28gdGhpcyBwYXRjaHNldCB0aHJvdyBhd2F5IHRoZSBtb3JlIHNwZWNpZmljIHZlcnNp
b24gaW50ZW5kZWQNCj4gdG8gYmUgdXNlZCBmcm9tIGEgZ2l2ZW4gZnJhbWVidWZmZXIgYW5k
IG1ha2UgdGhlIGdlbmVyaWMgdmVyc2lvbiB3YXkNCj4gbW9yZSBwb3J0YWJsZSBhZ2FpbnN0
IHRoZSBkcml2ZXJzLg0KDQpGb3IgYm90aCBwYXRjaGVzDQoNClJldmlld2VkLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4gVGhhbmtzLA0KPiBDYXJsb3MNCj4gDQo+IC0tLQ0KPiB2MjoNCj4g
ICAgLSBOZXcgcGF0Y2ggIltQQVRDSCB2MiAxLzJdIGRybTogUmVtb3ZlIHBsYW5lIGhzdWIv
dnN1YiBhbGlnbm1lbnQgcmVxdWlyZW1lbnQNCj4gICAgICBmb3IgY29yZSBoZWxwZXJzIi4N
Cj4gDQo+IENhcmxvcyBFZHVhcmRvIEdhbGxvIEZpbGhvICgyKToNCj4gICAgZHJtOiBSZW1v
dmUgcGxhbmUgaHN1Yi92c3ViIGFsaWdubWVudCByZXF1aXJlbWVudCBmb3IgY29yZSBoZWxw
ZXJzDQo+ICAgIGRybTogUmVwbGFjZSBkcm1fZnJhbWVidWZmZXIgcGxhbmUgc2l6ZSBmdW5j
dGlvbnMgd2l0aCBpdHMgZXF1aXZhbGVudHMNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9mcmFtZWJ1ZmZlci5jICAgICAgIHwgNjQgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmIuYyB8ICAyICstDQo+
ICAgaW5jbHVkZS9kcm0vZHJtX2ZvdXJjYy5oICAgICAgICAgICAgICAgIHwgIDUgKy0NCj4g
ICBpbmNsdWRlL2RybS9kcm1fZnJhbWVidWZmZXIuaCAgICAgICAgICAgfCAgNSAtLQ0KPiAg
IDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2OCBkZWxldGlvbnMoLSkNCj4g
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2Ug
MTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBN
eWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcg
TnVlcm5iZXJnKQ0K

--------------sbIFnpCcqBy9s2RCAy0DDNHu--

--------------ks5BiOLYs0vh0jmHiB1L5bxB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUS7twFAwAAAAAACgkQlh/E3EQov+Bz
MxAAkqBvT6Uwh3P/b4qfGDlo/dlOGShngjBLRAOcIxTqNGppptskijN4X7FyYW/XWSZCpv44zo/2
uZefYRxNw62NSoxlgNlrsCZL2xUK0wcXqx9OiuuEaWfx5aSX+S2QR8NqePKJkcwmeanQG3G4neLb
X5raLeSbuuM4UQEp5fJelGcxzPIEeruJe3do9EpQufujPfPAiSBNL7IH6izQzwHTMBKD963LFv5O
EIjf9En9eubRGRSwDFLNTNxlambwBL+dkYU/kb1tGxtwrxmSd1uM7S3fExBQQJpcOoLB35M/im7h
21hL29UVRdi0rcMB4TuG7Iw30ws2oe32joVl+pGfcKInzrHC5GCE7mf8X7rmgkD3e9ZQx4RcDDPk
c03Mm61jGr9Y2lwtrceodo3GM8WDuPB4jUJqjq9i441RWfQ03qgzRBot5k01p1GtQY/czM5/4uzu
2LZlDWrIkBsT5CyXLWn+TsKSIaGBy6MIFrx7FoamgHm9FEfEI2pQBXiHPbb5NQsMIlU1+FjbohAj
jLLJ4PWhZ1QjKACRSjESl/Tfdev2eIIUZZUmS6R9GYW9pFZKXcNf5HchhcDIy/dsKkT7F+1pXb9l
Y4WPhL09R/y12jHqst+fCkTcBgmm43ins5i38PU9bMa8+XKJli/xhdzV3lSp+qUUveXwkb2GQvGI
0pU=
=+q7s
-----END PGP SIGNATURE-----

--------------ks5BiOLYs0vh0jmHiB1L5bxB--
