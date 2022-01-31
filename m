Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF414A4021
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 11:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28A610E5AC;
	Mon, 31 Jan 2022 10:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5368810E5AC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:28:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E66DF1F380;
 Mon, 31 Jan 2022 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643624904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0hEwjjztuAMQ6HOIkBxkxvREvNlCP9wj8cSDJPQwry8=;
 b=t+amtVhFlc088/rdq+54a4AeTVyVHQsWAdSWKDpsra0FgMpFdhlbktgYg0gf7QuYsiS7gW
 sKwoYqbtn8m3vo8oOQoL2qf+k+xiA1qr96+7K8cukUE+yDh+eKojk8ZVojnbJcOISDIhun
 0CcJFQFbn1n1mLlecrFGgncC48aAOzA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643624904;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0hEwjjztuAMQ6HOIkBxkxvREvNlCP9wj8cSDJPQwry8=;
 b=m1OR1rc5ickrq7rmocSnX5yyvXJYi/lw5e8V0XL1zgbxx0qSCO/NogJZn4wiPw6WbkICLM
 MyDjhyntihHPriCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CC4013BFF;
 Mon, 31 Jan 2022 10:28:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ptYIIci592HzKgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 31 Jan 2022 10:28:24 +0000
Message-ID: <e7fbef3c-2f87-15f9-b24d-34ffaa5a2853@suse.de>
Date: Mon, 31 Jan 2022 11:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de> <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com> <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
 <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
 <ddb0f354-be19-92fe-20b3-56b00c9304ab@suse.de>
 <840ec74d-60c6-9480-709c-8cd597c6f5b0@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <840ec74d-60c6-9480-709c-8cd597c6f5b0@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xM37x5FXjsZC9MGML5heKsDI"
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xM37x5FXjsZC9MGML5heKsDI
Content-Type: multipart/mixed; boundary="------------VkA3h43xUW90kt73iiWJgW1G";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <e7fbef3c-2f87-15f9-b24d-34ffaa5a2853@suse.de>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de> <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com> <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
 <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
 <ddb0f354-be19-92fe-20b3-56b00c9304ab@suse.de>
 <840ec74d-60c6-9480-709c-8cd597c6f5b0@redhat.com>
In-Reply-To: <840ec74d-60c6-9480-709c-8cd597c6f5b0@redhat.com>

--------------VkA3h43xUW90kt73iiWJgW1G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzEuMDEuMjIgdW0gMTE6MTggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDEvMzEvMjIgMTA6MTgsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPiANCj4gW3NuaXBdDQo+IA0KPj4+IFRoZXJlIGFyZSBz
b21lIGhhY2tzIGluIHRoZSBkcml2ZXIgdGhvdWdoLiBGb3IgZXhhbXBsZSBpdCBleHBvc2Vz
IGFuIFhSR0I4ODg4DQo+Pj4gZm9ybWF0IGV2ZW4gdGhvdWdodCB0aGUgT0xFRCBkaXNwbGF5
IGlzIG1vbm9jaHJvbWF0aWMgYW5kIGhhcyAxIGJpdCBwZXIgcGl4ZWwuDQo+Pj4NCj4+PiBU
aGUgZHJpdmVyIHRoZW4gZ29lcyBhbmQgY29udmVydHMgdGhlIFhSR0I4ODg4IHBpeGVscyBm
aXJzdCB0byBncmF5c2NhbGUgYW5kDQo+Pj4gdGhlbiB0byByZXZlcnNlIG1vbm8uIEkgdG9v
ayB0aGF0IGlkZWEgZnJvbSB0aGUgcmVwYXBlciBkcml2ZXIgYnV0IHRoYXQgZ2l2ZXMNCj4+
PiB1cyB0aGUgbXVsdGlwbGUgY29waWVzIHRoYXQgR2VlcnQgd2FzIGNvbXBsYWluaW5nIGFi
b3V0Lg0KPj4NCj4+IFRoaXMgcmVxdWlyZXMgdG8gdXBkYXRlIHRoZSBjb25zb2xlIGNvZGUg
Zm9yIDEtYml0IEJXIG91dHB1dC4gVGhlIGZiY29uDQo+PiBzaWRlIGFscmVhZHkgc3VwcG9y
dHMgdGhpcyBBRkFJSy4gRFJNJ3MgZmJkZXYgbmVlZHMgYSBmZXcgbW9yZSBicmFuY2hlcw0K
Pj4gYW5kIHNvbWV0aGluZyBsaWtlIGEgRFJNX0ZPUk1BVF9DMSBmb3VyY2MuIFRoZSBYUkdC
ODg4OCBpcyByZWFsbHkgYQ0KPj4gdXNlcnNwYWNlIHJlcXVpcmVtZW50IHRoYXQgaXMgaW1w
b3NlZCBieSBtb2Rlcm4gZGVza3RvcHMuIElmIERSTSdzDQo+PiBjb25zb2xlIGhhcyBiZWVu
IHVwZGF0ZWQsIHlvdSBjb3VsZCBsZWF2ZSBpdCBvdXQgZW50aXJlbHkuDQo+Pg0KPj4gSSBj
b3VsZCBpbWFnaW5lIHRoYXQgc29tZSBzaW1wbGUgdXNlcnNwYWNlLCBzdWNoIGFzIFdlc3Rv
biwgY29tZXMgd2l0aA0KPj4gc3VwcG9ydCBmb3IgcGFsZXR0ZSBmb3JtYXRzIGFuZCBCVy4g
T3IgdGhlcmUgY291bGQgYmUgYW4gZW50aXJlbHkNCj4+IHNlcGFyYXRlIHByb2dyYW0gdGhh
dCBwdXRzIGdyYXBoaWNzIG9udG8gdGhlc2UgZGlzcGxheXMuDQo+Pg0KPiANCj4gWWVzLCBJ
IHVuZGVyc3RhbmQgdGhlIHJhdGlvbmFsZSBvZiB3aHkgdGhlIHJlcGFwZXIgZHJpdmVyIGlz
IGRvaW5nIHRoYXQgd2F5DQo+IGJ1dCB3YXMganVzdCBwb2ludGluZyBvdXQgYmVjYXVzZSBH
ZWVydCBtZW50aW9uZWQgdGhhdCBpcyBub3QgZWZmaWNpZW50Lg0KDQpJdCdzIGEgZmFpciBw
b2ludCwgSSB0aGluay4gUGVvcGxlIGFyZSBjb25jZXJuZWQgYWJvdXQgcmVzb3VyY2UgDQpj
b25zdW1wdGlvbiBvbiBsb3ctZW5kIGRldmljZXMuDQoNCj4gICANCj4gTWF5YmUgaW4gdGhl
IG1lYW50aW1lIHdlIGNhbiBhZGQgYSBkcm1fZmJfZ3JheThfdG9fbW9ub19yZXZlcnNlZCgp
IGhlbHBlciB0bw0KPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyBzaW5j
ZSB0aGVyZSBpcyBtb3JlIHRoYW4gb25lIGRyaXZlciB0aGF0DQo+IGRvZXMgdGhlIHNhbWUg
Pw0KDQpTdXJlLg0KDQo+IA0KPiBJdCdzIG5vdCBhIGJpZyBpc3N1ZSBmb3IgdGhpcyBkZXZp
Y2UgcmVhbGx5IHNpbmNlIHRoZSBJMkMgYnVzIGlzIHNsb3cgYW55d2F5cw0KPiBhbmQgdGhl
IG11bHRpcGxlIGNvcGllcyBhcmUgbm90IGEgYm90dGxlbmVjayBBRkFJQ1QuDQo+IA0KPiBJ
IGJlbGlldmUgaXMgd29ydGggdG8gcHJvcG9zZSB0aGlzIGRyaXZlciBhcyBpcyBhbmQgdGhl
biB0cnkgdG8gb3B0aW1pemUgbGF0ZXIuDQoNCkFic29sdXRlbHkuIElmIHlvdSBwb3N0IGEg
Y2xlYW5lZC11cCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCwgSSdkIHRha2UgYSBsb29rLg0KDQo+
IA0KPiBBbm90aGVyIHRoaW5nIHRoYXQncyBtaXNzaW5nIGlzIGEgRFJNX01PREVfQ09OTkVD
VE9SX0kyQywgYmVjYXVzZSBJIHVzZWQgZm9yDQo+IG5vdyBhIERSTV9NT0RFX0NPTk5FQ1RP
Ul9Vbmtub3duLg0KDQpUaGF0IG1pZ2h0IGhhdmUgaW1wbGljYXRpb25zIG9uIHVzZXJzcGFj
ZS4gTWF5YmUgYXNrIGFyb3VuZC4gKE5vdCB0aGF0IA0Kd2UgYWN0dWFsbHkgcnVuIHVzZXJz
cGFjZSBvbiB0aGUgZGV2aWNlKS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4g
QmVzdCByZWdhcmRzLA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------VkA3h43xUW90kt73iiWJgW1G--

--------------xM37x5FXjsZC9MGML5heKsDI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH3uccFAwAAAAAACgkQlh/E3EQov+BQ
bw//TbV6HobOdKEyUcaDwO7YuOGz13iBi89/XmeCQ8cdliCybMqXL0Ws5kj8ULtYqQjE+y2ndKKu
H0HtvAz6h/S/nnV13yELLT/d5Dv5HKC9Ju/jvErEvDNdr9Wbl2AHkX4GSapBaZosyu+euy4Ty5Gu
TVPUPTt2Xs1xXNj2+BxNE+CmiVTiGuPjV9NmjTb/+5zmSD8Ge4ehpPdpxVscZxq5mJPjzYMjZNQU
TRX4i7g07hIeKDSUyLry+kAco80+uBwnZMDcNTqyGEQgtPptI/J5BXA302qgQxdPKunavYk4jzwk
mna7DF7EXsQtYEtke9GpteJy4w5EwUDKoRWbMpzRsLzlfhhMEQxEPCzq3WWCwPTpoJI1AVFPD00Q
OdDzFIn1umrt+1y8OwLuZ7unv3AeO1GwW94Mzbr12+X2xEGJ7s4PLfC6BsMGRVn4/Zh2jTQMl4z1
57krrjByXt1+/IzvPuY8ietL1GfBkZx+yGz5TnANZsG0BuZnBTXtcU212lMk7Uy9CD7aF/BZE4lx
Z5ZCBOrX2AQNvW4E1F1qxa8qN49a7dBBlF4v0HW3d6ZbGvgGIPtheZboK1SoDOsVG7HCbOrYrOBW
lYeyuKO/d4zGGQGQAxr8kN4tkpQp+BAHoscs5MxhZ81DK0bIIllYOIfVP8jupuKeY8Ehza8DObpn
ZW0=
=cLqY
-----END PGP SIGNATURE-----

--------------xM37x5FXjsZC9MGML5heKsDI--
