Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9D84A59CB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B3B10E5B8;
	Tue,  1 Feb 2022 10:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA1410E5B8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 10:17:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D1AA01F380;
 Tue,  1 Feb 2022 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643710646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lN5Bj4ODW/k5Aex5ROPL2/y1svMh2OVOB2Q/9nurJMU=;
 b=wnl4XfayhbfWy2iFg5JKTxtnOybGU9t1WDqp60+c7ViF0rxoBJPcdjLKxiYEpW1M2zxK7D
 zixcg1TRf9itNipVWSWscehaLvIySwt8pe1SShLlOWzIwZnxOPlTRze8U4mIuGstSrzooI
 28lHIXwulZO6I4Pw0jEmga+uNPF6Wr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643710646;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lN5Bj4ODW/k5Aex5ROPL2/y1svMh2OVOB2Q/9nurJMU=;
 b=4PRexQKBgM/A1jyK/4nwGqBPhMr/d6So7KLk3bfYRXLk5SaAtsBT51BNaBwxtfUy7vBmHe
 GHx79BNj8JbZzFDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A34E13B3D;
 Tue,  1 Feb 2022 10:17:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BP+eHLYI+WF/CgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Feb 2022 10:17:26 +0000
Message-ID: <561104af-33c5-f9af-1047-ecef4fe01189@suse.de>
Date: Tue, 1 Feb 2022 11:17:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <tIMIWqepcZGntnez-1ss4Kn4K8btXnzDRL7EWd19-745WK90YIC19E_4di9RNvB3gtx-PzWEjBEGQLPNJE_x0T1yyyaWFCoFcCiG4StR9RU=@emersion.fr>
 <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
 <CAMuHMdXKZ=BkvVqdpiNPNJgxm9SzQ3Z0n4SqV2-4oPRveybd6g@mail.gmail.com>
 <qmhzv6kqs6QdAOP3bNB39glOpc8eeJ6flgjfjcaBniT-shDKZkxo5uB71weGOUKxPE6dq_WBhtHmY5vMmuYwqMoHgtMWnX0ESE5R1Y5g5F8=@emersion.fr>
 <CAMuHMdUHhUkPhq8M0d=p5EgH8bBz6EtH4drajKtQHE0121V1uQ@mail.gmail.com>
 <ce283de9-7412-472e-f72c-cb6a35ede426@suse.de>
 <csqnu2U_Kr-XE5p7ObjXsYbWDrfxh-j9CQE60lMJSxK0tF0SjlbZQkdjmAWpPRKYJoRLOCKtBgY-0AeIGdbr-SKjuyDKUTOTcI_PPV_bsWk=@emersion.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <csqnu2U_Kr-XE5p7ObjXsYbWDrfxh-j9CQE60lMJSxK0tF0SjlbZQkdjmAWpPRKYJoRLOCKtBgY-0AeIGdbr-SKjuyDKUTOTcI_PPV_bsWk=@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ux3AJwUqXAdtHOzuRSJy9fxH"
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ux3AJwUqXAdtHOzuRSJy9fxH
Content-Type: multipart/mixed; boundary="------------EqnCunEa0tneKEUu8EEBCQtD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <maxime@cerno.tech>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <561104af-33c5-f9af-1047-ecef4fe01189@suse.de>
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
References: <20220131201225.2324984-1-javierm@redhat.com>
 <tIMIWqepcZGntnez-1ss4Kn4K8btXnzDRL7EWd19-745WK90YIC19E_4di9RNvB3gtx-PzWEjBEGQLPNJE_x0T1yyyaWFCoFcCiG4StR9RU=@emersion.fr>
 <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
 <CAMuHMdXKZ=BkvVqdpiNPNJgxm9SzQ3Z0n4SqV2-4oPRveybd6g@mail.gmail.com>
 <qmhzv6kqs6QdAOP3bNB39glOpc8eeJ6flgjfjcaBniT-shDKZkxo5uB71weGOUKxPE6dq_WBhtHmY5vMmuYwqMoHgtMWnX0ESE5R1Y5g5F8=@emersion.fr>
 <CAMuHMdUHhUkPhq8M0d=p5EgH8bBz6EtH4drajKtQHE0121V1uQ@mail.gmail.com>
 <ce283de9-7412-472e-f72c-cb6a35ede426@suse.de>
 <csqnu2U_Kr-XE5p7ObjXsYbWDrfxh-j9CQE60lMJSxK0tF0SjlbZQkdjmAWpPRKYJoRLOCKtBgY-0AeIGdbr-SKjuyDKUTOTcI_PPV_bsWk=@emersion.fr>
In-Reply-To: <csqnu2U_Kr-XE5p7ObjXsYbWDrfxh-j9CQE60lMJSxK0tF0SjlbZQkdjmAWpPRKYJoRLOCKtBgY-0AeIGdbr-SKjuyDKUTOTcI_PPV_bsWk=@emersion.fr>

--------------EqnCunEa0tneKEUu8EEBCQtD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDIuMjIgdW0gMTE6MTEgc2NocmllYiBTaW1vbiBTZXI6DQo+IE9uIFR1
ZXNkYXksIEZlYnJ1YXJ5IDFzdCwgMjAyMiBhdCAxMTowOCwgVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4+IEFtIDAxLjAyLjIyIHVtIDA5
OjM2IHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOg0KPj4NCj4+PiBJJ2QgZXhwZWN0IDgt
Yml0IGdyYXlzY2FsZSB0byBiZSBZOCBpbnN0ZWFkLg0KPj4NCj4+IEkgbGlrZSB0aGlzIG5h
bWluZywgYnV0IERSTV9GT1JNQVRfUjggaXMgdWFwaSBhbHJlYWR5LiA6LyBJZiBhbnl0aGlu
ZywNCj4+IHdlIGNvdWxkIGFkZCBZbiBmb3JtYXRzIGluIGFkZGl0aW9uIHRvIGV4aXN0aW5n
IFJuIGZvcm1hdHMuDQo+IA0KPiBOZWVkIHRvIGJlIGEgYml0IGNhcmVmdWwsIGUuZy4gWTIx
MCBleGlzdHMgYW5kIGlzbid0IGEgZ3JheXNjYWxlIGZvcm1hdC4NCj4gVGhpcyBjb3VsZCBi
ZSBjb25mdXNpbmcuDQoNCldlbGwsIG9rLiAgSG93IGFib3V0ICdJJyBhcyBpbiAnaW50ZW5z
aXR5Jz8gVGhlcmUgYXJlbid0IHRvbyBtYW55IA0KZHJpdmVycyBzdXBwb3J0aW5nIHRoaXMg
eWV0LiBTbyBpZiB3ZSB3YW50IHRvIGZpbmQgYSBiZXR0ZXIgbmFtZSwgbm93J3MgDQp0aGUg
dGltZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------EqnCunEa0tneKEUu8EEBCQtD--

--------------ux3AJwUqXAdtHOzuRSJy9fxH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH5CLUFAwAAAAAACgkQlh/E3EQov+Cu
LRAAgjI1gDkkO+vJTYvGJwx9f9mWQJRiaH2vRAa1o9EcsC3D9dpdSUkCI86AVJA8dKvQwEeVC0Zt
TTuXsQ9rh3iCItU0DedMKddlfFE4PVR1mduxjegwVzzSQR1wxQDx6bpHZ7MEgpo6WN52P9miAzYk
GTva9Q3dX1HM9KxFSjHP9JqqGWGaO1Il8qGCPhCZSwPi46UHe+ZUjy4+Z4kGqwBfymTaOviNAvlY
lVOUlP1oe1QtMEQkmXjlNaCM5Mke3ddLffQC9B8ek1hOBJJnfsf5hnlReT3ZVoUh04jCyu4Uccg2
jHNswjxktkHpIu9i0tQ6DFTxh3VpI5Ivfdynxm5HpU4xgKyQdmY83SYTXjiH2D42ncc2wt652vBK
LLUpGxvVqyzb3UlKSWaVydC83UEahsO6eURXDqn/HZqOVmXMQrEZ7WrmtPjT56rd1MTVn/eMihLQ
L9RJRJAvnfhA3MaBV2SuP+Uxbpog7ax8/VWRljp3BtPSZxL2AtHv9VVBYPlhlMMioyX9VXVGSe6y
KDsR5HkIjbojhujFUcf2gemkfdkoXAIog7TUIRHoDB0w4Hwsc2zkKrqlyCvEB6TtY0jPyVZJs646
w2Zfbt0eDpdA2HLBQntgab+zLKDQtIldL6IslJhB9FD8XluUE8WqD67FLKT/SbGhJ4nLHqikQTar
3lQ=
=hIZq
-----END PGP SIGNATURE-----

--------------ux3AJwUqXAdtHOzuRSJy9fxH--
