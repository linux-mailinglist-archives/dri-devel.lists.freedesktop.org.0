Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AF952112A
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382E310E03C;
	Tue, 10 May 2022 09:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC88B10E03C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 09:39:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 735B91F45F;
 Tue, 10 May 2022 09:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652175578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OteHJkuIhNqIOiapSJLhMk6mw7w8TgJo/S2yjbeQnOw=;
 b=eoZLLoSS+49GGuKDz9vaDTRzNArtoNN5yFNEsj5o1PwMEcfKJQeYA3OPJtNxjl3zSjG0Lv
 dTcysndLw6oHjvJhlFn639xETOO54QloiFeQw9KJtLBHnTa74dKUUFShxXjFTAvAOcMvD/
 AbTEELQqGXfe6Fm/RBYeQFM4qhPnJcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652175578;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OteHJkuIhNqIOiapSJLhMk6mw7w8TgJo/S2yjbeQnOw=;
 b=nFVRv94eH8ILY7iQiISXz3IxUobatGLQvimDnsd7gZg27xtBtaRRAehysKZdhryvJj5uA8
 lvoW6Q5q8ExbazDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4984213AA5;
 Tue, 10 May 2022 09:39:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hfHVENoyemK8NgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 10 May 2022 09:39:38 +0000
Message-ID: <23ae6eaa-c281-9fc1-2c64-dd953ad2f5f1@suse.de>
Date: Tue, 10 May 2022 11:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
 <79aaea41-5dab-f896-ab3d-d6bc9a5de615@suse.de>
 <2d8d8583-3a39-b826-dd83-ba5bc4c5b082@redhat.com>
 <7ffd92d7-9c07-fa9c-dc95-9e82719fd237@suse.de>
 <71ebd5f7-64d0-510a-6f1b-29921fca19fa@suse.de>
 <35ffd96d-3cbe-12dd-c1ea-878299ec173c@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <35ffd96d-3cbe-12dd-c1ea-878299ec173c@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Pr0hBfL67iKQw76eSiX70wuZ"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Pr0hBfL67iKQw76eSiX70wuZ
Content-Type: multipart/mixed; boundary="------------RMriG2XPeJByxqDDiiYDx0DK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <23ae6eaa-c281-9fc1-2c64-dd953ad2f5f1@suse.de>
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
 <79aaea41-5dab-f896-ab3d-d6bc9a5de615@suse.de>
 <2d8d8583-3a39-b826-dd83-ba5bc4c5b082@redhat.com>
 <7ffd92d7-9c07-fa9c-dc95-9e82719fd237@suse.de>
 <71ebd5f7-64d0-510a-6f1b-29921fca19fa@suse.de>
 <35ffd96d-3cbe-12dd-c1ea-878299ec173c@redhat.com>
In-Reply-To: <35ffd96d-3cbe-12dd-c1ea-878299ec173c@redhat.com>

--------------RMriG2XPeJByxqDDiiYDx0DK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDEwLjA1LjIyIHVtIDExOjA2IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBPbiA1LzEwLzIyIDEwOjUw
LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4gDQo+IFtzbmlwXQ0KPiANCj4+Pj4gRHJp
dmVycyBzaG91bGRuJ3QgcmVhbGx5IGV4cGxpY2l0bHkgY2FsbCB0aGlzIGhlbHBlciBpbiBt
eSBvcGluaW9uLg0KPj4NCj4+IE9uZSBtb3JlIHN0dXBpZCBxdWVzdGlvbjogZG9lcyBhcm1h
ZGEgYWN0dWFsbHkgdXNlDQo+PiBkcm1fZmJkZXZfZmJfZGVzdHJveSgpPyBJdCdzIHN1cHBv
c2VkIHRvIGJlIGEgY2FsbGJhY2sgZm9yIHN0cnVjdA0KPj4gZmJfb3BzLiBBcm1hZGEgdXNl
cyBpdCdzIG93biBpbnN0YW5jZSBvZiBmYl9vcHMsIHdoaWNoIGFwcGFyZW50bHkNCj4+IGRv
ZXNuJ3QgY29udGFpbiBmYl9kZXN0cm95LiBbMV0NCj4+DQo+IA0KPiBObyBzdHVwaWQgcXVl
c3Rpb24gYXQgYWxsLiBZb3UgYXJlIGNvcnJlY3Qgb24gdGhpcy4gU28gSSBndWVzcyB3ZSBz
dGlsbA0KPiBuZWVkIHRoaXMgY2FsbCBpbiB0aGUgZHJpdmVycyB0aGF0IGRvbid0IHByb3Zp
ZGUgYSAuZmJfZGVzdHJveSgpIGhhbmRsZXIuDQo+IA0KPiBJIHNlZSBtYW55IG9wdGlvbnMg
aGVyZToNCj4gDQo+IDEpIERvY3VtZW50IGluIGRybV9mYl9oZWxwZXJfYWxsb2NfZmJpKCkg
dGhhdCBkcml2ZXJzIG9ubHkgbmVlZCB0byBjYWxsDQo+ICAgICBkcm1fZmJfaGVscGVyX2Zp
bmkoKSBleHBsaWNpdGx5IGlmIHRoZXkgYXJlIG5vdCBzZXR0aW5nIHVwIGEgZmJkZXYNCj4g
ICAgIHdpdGggZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKSwgb3RoZXJ3aXNlIGlzIG5vdCBu
ZWVkZWQuDQo+IA0KPiAyKSBNYWtlIGRybV9mYmRldl9mYl9kZXN0cm95KCkgYW4gZXhwb3J0
ZWQgc3ltYm9sIHNvIGRyaXZlcnMgdGhhdCBoYXZlDQo+ICAgICBjdXN0b20gZmJfb3BzIGNh
biB1c2UgaXQuDQo+IA0KPiAzKSBTZXQgLmZiX2Rlc3Ryb3kgdG8gZHJtX2ZiZGV2X2ZiX2Rl
c3Ryb3koKSBpZiBpc24ndCBzZXQgYnkgZHJpdmVycyB3aGVuDQo+ICAgICB0aGV5IGNhbGwg
ZHJtX2ZiX2hlbHBlcl9pbml0aWFsX2NvbmZpZygpIG9yIGRybV9mYl9oZWxwZXJfZmlsbF9p
bmZvKCkuDQo+IA0KPiBJJ20gbGVhbmluZyB0b3dhcmRzIG9wdGlvbiAoMykuIFRoZW4gdGhl
IGZiX2luZm8gcmVsZWFzZSB3aWxsIGJlIGF1dG9tYXRpYw0KPiB3aGV0aGVyIGRyaXZlcnMg
YXJlIHVzaW5nIHRoZSBnZW5lcmljIHNldHVwIG9yIGEgY3VzdG9tIG9uZS4NCg0KSU1ITyB0
aGlzIHdvdWxkIGp1c3QgYmUgYW5vdGhlciBnbGl0Y2ggdG8gcGFwZXIgb3ZlciBhbGwgdGhl
IGJyb2tlbiANCmNvZGUuIEFuZCBpZiB5b3UgZm9sbG93IHRocm91Z2ggZHJtX2ZiZGV2X2Zi
X2hlbHBlcigpLCBbMV0gaXQnbGwgY2FsbCANCl9maW5pIGF0IHNvbWUgcG9pbnQgYW5kIHBy
b2JhYmx5IGJsb3cgdXAgaW4gc29tZSBvdGhlciB3YXkuIEluc3RhbmNlcyBvZiANCnN0cnVj
dCBmYl9vcHMgYXJlIGFsc28gdXN1YWxseSBjb25zdC4NCg0KVGhlIG9ubHkgcmVsaWFibGUg
d2F5IEFGQUlDVCBpcyB0byBkbyB3aGF0IGdlbmVyaWMgZmJkZXYgZG9lczogdXNlIA0KdW5y
ZWdpc3Rlcl9mcmFtZWJ1ZmZlciBhbmQgZG8gdGhlIHNvZnR3YXJlIGNsZWFudXAgc29tZXdo
ZXJlIHdpdGhpbiANCmZiX2Rlc3Ryb3kuIEFuZCB0aGVuIGZpeCBhbGwgZHJpdmVycyB0byB1
c2UgdGhhdCBwYXR0ZXJuLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xNy42L3NvdXJjZS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jI0wyMDgyDQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------RMriG2XPeJByxqDDiiYDx0DK--

--------------Pr0hBfL67iKQw76eSiX70wuZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ6MtkFAwAAAAAACgkQlh/E3EQov+B8
ABAAmOlPG+zQT0HBwlB0JVRJG+cYfU8cwS5kJpxC5knB3RdmAEPYHBJsiIUJ3SGE4MZ4OlWWpdA+
vNjOncwKkAcXkmyrfYtNdVO7LpS4B61HnsL97VZfziEXGuz/ceHOFZAaBvPe/RPHKrINhsOr2qD8
NBL9EXjXtvhG9a2flyTJGCJIAtueZQqkmxx9yqNeiJ6AlKMx9B7zg1QnVEr2Iff0mKmyy+eD9RQ/
biM7/ioAKduLUb/ATIASz/6EJsorvHPKheuRlM2vJ6LShqBxeNb0XzeCKF3n/JLzUlO1HBueZT+3
k0LgEFm/LBBO04EFpP/HXCt5naKtPXYb5vMRwWdE0ILYcNFCzbdsOKN6SDlULQP208+BIo4JFq70
GfeLyyZoJxtOOdn8YSPfQdUh59pubkUOrQQjTwDP+M85+/MCop32K1xFpllfviV1gY6Cc5rn/KiL
PYk50YtisPcKrYEXjXZ+3cAV81WT+YZV1Nxc4+JARgpN11gQpSbZhBluI9OO7VUYfnAOp3OdaoVK
7/YnzZBOfwpxjfTCunL3e9hdfLhVkX/C4O6k+WZfpw6LgChjR7sKCH/QVL1IhjxZ5ACoqQCUepke
m4wb+y0uGATmkcPCzKi2PEWEfqnOeHxo+w5d22jvZrSXvZ6ZAoBGjRjr1RWj8IQTDIIAvgPzDZkC
Wyw=
=Rqge
-----END PGP SIGNATURE-----

--------------Pr0hBfL67iKQw76eSiX70wuZ--
