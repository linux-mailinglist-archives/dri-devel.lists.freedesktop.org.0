Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7457297B6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 13:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEA110E689;
	Fri,  9 Jun 2023 11:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E9910E687
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 11:04:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B33001FDF2;
 Fri,  9 Jun 2023 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686308681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LmIQETcpjUbM263ry+EU0Ay3u/Cgq6udS0zNLLtlWYI=;
 b=yhsXPyrbAbJa0O8yP39YWo997vH3976e1Aa4xiPb3epb2IkOm644zr4XQPO3KP7t74RsBz
 lC/u6bHopQ2F6JacLOkJ1tsx31LzhJZ1whHBB8B1u/stRMPNFvXY2EEzrtJz1uMps3yoKq
 hrgjV405BLe9M60t4Id2GR20p+YBwA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686308681;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LmIQETcpjUbM263ry+EU0Ay3u/Cgq6udS0zNLLtlWYI=;
 b=Y/W1q+89Akp77qLSFMC48O3vAqRfvE7NZPYuTgOThzdroiXeUYz34iNKRKt82vMwzOTKhH
 /LFjWjb2g9InNTCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7437313A47;
 Fri,  9 Jun 2023 11:04:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W8Q+G0kHg2RAIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Jun 2023 11:04:41 +0000
Message-ID: <66548126-e39f-72a6-60bc-ed6d0cc82ae7@suse.de>
Date: Fri, 9 Jun 2023 13:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
 <CAMuHMdWrTairp5h-fmkG9+xwzna+T4QmPuMeshd0UB8ZhQF8Sg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdWrTairp5h-fmkG9+xwzna+T4QmPuMeshd0UB8ZhQF8Sg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PuKHaph1N7KnnozKG1i85TG7"
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PuKHaph1N7KnnozKG1i85TG7
Content-Type: multipart/mixed; boundary="------------BAqyKTXApkRxE91d0lS5mZLP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: daniel.thompson@linaro.org, lee@kernel.org, linux-sh@vger.kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Message-ID: <66548126-e39f-72a6-60bc-ed6d0cc82ae7@suse.de>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
 <CAMuHMdWrTairp5h-fmkG9+xwzna+T4QmPuMeshd0UB8ZhQF8Sg@mail.gmail.com>
In-Reply-To: <CAMuHMdWrTairp5h-fmkG9+xwzna+T4QmPuMeshd0UB8ZhQF8Sg@mail.gmail.com>

--------------BAqyKTXApkRxE91d0lS5mZLP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDYuMjMgdW0gMTE6MTQgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQpbLi4uXQ0KPiANCj4+PiBXaGF0IGRvIHlvdSB0aGluayBsb3ctZW5kIGVtYmVkZGVkIGRl
dmljZXMgd2l0aCBhbiBvdXQtb2YtdHJlZVsqXQ0KPj4+IGZiZGV2IGRyaXZlciBhcmUgdXNp
bmc/DQo+Pg0KPj4gQW5kIHRob3NlIGRvIG5vdCBjb3VudCBlaXRoZXIuIElJUkMgQW5kcm9p
ZCB1c2VkIHRvIGJlIGJ1aWx0IG9uIHRvcCBvZg0KPj4gZmJkZXYgZGV2aWNlcy4gSSdtIG5v
dCBzdXJlIGlmIHRoZXkgaGF2ZSBtb3ZlZCB0byBEUk0gYnkgbm93LiBCdXQNCj4+IGVtYmVk
ZGVkIHVzZXMgZGVkaWNhdGVkIGtlcm5lbHMgYW5kIGtlcm5lbCBjb25maWdzLiAgSXQncyBl
YXN5IGZvciB0aGVtDQo+PiB0byBzZXQgRkJfREVWSUNFPXkuICBXZSdyZSBub3QgZ29pbmcg
dG8gdGFrZSBhd2F5IHRoZSBmYmRldiBkZXZpY2UgZW50aXJlbHkuDQo+IA0KPiBUaGUgcG9p
bnQgaXMgdGhhdCB3ZSBkbyBub3Qgc3VkZGVubHkgZGlzYWJsZSBmdW5jdGlvbmFsaXR5IHRo
YXQgdXNlcnMNCj4gbWF5IGRlcGVuZCBvbi4gV2hpbGUgIm1ha2Ugb2xkY29uZmlnIiB3aWxs
IHNob3cgdXNlcnMgdGhlIG5ldw0KPiBGQl9ERVZJQ0UgcXVlc3Rpb24sIChhbmQgaG9wZWZ1
bGx5IHRoZXknbGwgbm90aWNlKSwgIm1ha2Ugb2xkZGVmY29uZmlnIg0KPiBhbmQgIm1ha2Ug
PGZvbz5fZGVmY29uZmlnIiB3b24ndCwgcG9zc2libHkgY2F1c2luZyByZWdyZXNzaW9ucy4N
Cj4gV2l0aG91dCBhIHN1aXRhYmxlIGRlZmF1bHQsIHlvdSBzaG91bGQgSU1ITyBhdCBsZWFz
dCB1cGRhdGUgYWxsDQo+IGRlZmNvbmZpZ3MgdGhhdCBlbmFibGUgYW55IGZiZGV2IGRyaXZl
cnMuDQoNCkRpZG4ndCBJIGFscmVhZHkgc2F5IHRoYXQgd2Ugc2hvdWxkIG1ha2UgaXQgImRl
ZmF1bHQgeSIgaWYgdGhhdCdzIA0KcHJlZmVyYWJsZSBpbiBwcmFjdGljZT8NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gSSBndWVzcyB5b3UgZG8gcmVtZW1iZXIgdGhlIGZh
bGwtb3V0IGZyb20gZjYxMWIxZTc2MjRjY2RiZCAoImRybToNCj4gQXZvaWQgY2lyY3VsYXIg
ZGVwZW5kZW5jaWVzIGZvciBDT05GSUdfRkIiKSwgYWZ0ZXIgd2hpY2ggbG90cyBvZiBkZWZj
b25maWdzDQo+IGhhZCB0byBnYWluIENPTkZJR19GQj15Pw0KPiANCj4gR3J7b2V0amUsZWV0
aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5
MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywg
QW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5i
ZXJnKQ0K

--------------BAqyKTXApkRxE91d0lS5mZLP--

--------------PuKHaph1N7KnnozKG1i85TG7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSDB0gFAwAAAAAACgkQlh/E3EQov+Aq
ZA/9Gs/3oAxv3dNKEax+m32mmoz3thINFT43kVq59/3SO0+c99yYEnPzb+0FohtWWlgWWcW0hmpK
Pq0BuHzV5MbH9YzM9E0sHVNMsMqRp+dpJD1ZeSGUZTvenPUcXfwrlULKoh5Qk9HE5OhjiH33GTWB
0vnPoHWz/97DKftoua723zPzsF5mHJrcS1D6oJPIA9230V91T5GpSXkjxx9sArgz5SvyqJUIFIyW
LrvSwP1MkQ8Mc1S5orRLh7/eFdSjO/JXsL/ZZW/7S8PGB8l72ktYJtoQpp+gXzugYT9JoXA/typy
Kp794jt+SQZlgRpxG8j9ntdbHi2ANnH/w8Tg0vhK1t44vkCokfoSh+qCZNRaItI7SIt/TLQqiZbm
4VXX2sDiqrFNr+lojLFJNPIbJYVPA7dFGfHe1j5daHKE1mvCLEuAqwIihKHGzD05Vv9ps+LlxZTs
E4vUyUt5ITCoQ/l7DnpyIEDI+u6umD2kYgj0DWYLgwYs0hUB2E+lM/3jE08PLlzt/1ya2QCGx05u
28JPqn3TsefZ69aLAxcN2T8MmPC6uBaR99zcpoTJQZZ+VAILD/O2NdvNtEkR3DWrkPmbwuXa0GPF
fJsBtJZ40S6xb3/pGK7VcSTHdMtVIIGRjdNruksvXbZpZbekOvAQRazGcuvNrd0lttfmiWXQmz1n
z/4=
=RH5b
-----END PGP SIGNATURE-----

--------------PuKHaph1N7KnnozKG1i85TG7--
