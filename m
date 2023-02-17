Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A069ABAA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DC310E094;
	Fri, 17 Feb 2023 12:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EE510E094
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 12:41:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74E871FF64;
 Fri, 17 Feb 2023 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676637681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QB2voS0w/t93vp6kJpH5DeuLwkd8qmWbgNfRYXqdO+A=;
 b=IjeeZtMRpOiA+iqy+DHRpAxyaTHKQni9KLxNkp8aVo3Yjqb0snDok1LVW8wq1en1xIlaCG
 CKFuP/brktNjQrT7zPlOZpPc8hTPkQ7N1MZ/cB0Zq4RwWMjzSVRsXWaVf2iICCG1uuBEYQ
 0BmOIA/iWPHI1cKkAPVD+tIHHw3sQZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676637681;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QB2voS0w/t93vp6kJpH5DeuLwkd8qmWbgNfRYXqdO+A=;
 b=qH48t3jjv3vYm4WaN9ninhTUZ2oN/Hv0xf96qI+DhKDuZdQMsm2vDoQDUKI8FGwpabFU98
 a2uaMyYwZNwwD/AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2DB8138E3;
 Fri, 17 Feb 2023 12:41:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a0FdOvB172NwbAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Feb 2023 12:41:20 +0000
Message-ID: <c9a099e4-7349-b02f-dd76-96c5b120b243@suse.de>
Date: Fri, 17 Feb 2023 13:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 06/11] drm/shmem-helper: Don't use vmap_use_count for
 dma-bufs
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-7-dmitry.osipenko@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230108210445.3948344-7-dmitry.osipenko@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5CdL93VU2j07cHfFJ3oqll5F"
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5CdL93VU2j07cHfFJ3oqll5F
Content-Type: multipart/mixed; boundary="------------a6h4X0oxv64uyuMO0ro5kmuV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <c9a099e4-7349-b02f-dd76-96c5b120b243@suse.de>
Subject: Re: [PATCH v10 06/11] drm/shmem-helper: Don't use vmap_use_count for
 dma-bufs
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-7-dmitry.osipenko@collabora.com>
In-Reply-To: <20230108210445.3948344-7-dmitry.osipenko@collabora.com>

--------------a6h4X0oxv64uyuMO0ro5kmuV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDEuMjMgdW0gMjI6MDQgc2NocmllYiBEbWl0cnkgT3NpcGVua286DQo+
IERNQS1idWYgY29yZSBoYXMgaXRzIG93biByZWZjb3VudGluZyBvZiB2bWFwcywgdXNlIGl0
IGluc3RlYWQgb2YgZHJtLXNobWVtDQo+IGNvdW50aW5nLiBUaGlzIGNoYW5nZSBwcmVwYXJl
cyBkcm0tc2htZW0gZm9yIGFkZGl0aW9uIG9mIG1lbW9yeSBzaHJpbmtlcg0KPiBzdXBwb3J0
IHdoZXJlIGRybS1zaG1lbSB3aWxsIHVzZSBhIHNpbmdsZSBkbWEtYnVmIHJlc2VydmF0aW9u
IGxvY2sgZm9yDQo+IGFsbCBvcGVyYXRpb25zIHBlcmZvcm1lZCBvdmVyIGRtYS1idWZzLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0cnkub3NpcGVua29A
Y29sbGFib3JhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KDQp3aXRoIG15IGNvbW1lbnRzIGJlbG93IGNvbnNpZGVyZWQu
DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMg
fCAzNSArKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
MCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jDQo+IGluZGV4IDUwMDZmN2RhN2YyZC4uMTM5MmNi
ZDNjYzAyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9o
ZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIu
Yw0KPiBAQCAtMzAxLDI0ICszMDEsMjIgQEAgc3RhdGljIGludCBkcm1fZ2VtX3NobWVtX3Zt
YXBfbG9ja2VkKHN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0sDQo+ICAgCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gJnNobWVtLT5iYXNlOw0KPiAgIAlpbnQgcmV0
ID0gMDsNCj4gICANCj4gLQlpZiAoc2htZW0tPnZtYXBfdXNlX2NvdW50KysgPiAwKSB7DQo+
IC0JCWlvc3lzX21hcF9zZXRfdmFkZHIobWFwLCBzaG1lbS0+dmFkZHIpOw0KPiAtCQlyZXR1
cm4gMDsNCj4gLQl9DQo+IC0NCj4gICAJaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkgew0KPiAg
IAkJcmV0ID0gZG1hX2J1Zl92bWFwKG9iai0+aW1wb3J0X2F0dGFjaC0+ZG1hYnVmLCBtYXAp
Ow0KPiAgIAkJaWYgKCFyZXQpIHsNCj4gICAJCQlpZiAoZHJtX1dBUk5fT04ob2JqLT5kZXYs
IG1hcC0+aXNfaW9tZW0pKSB7DQoNCkknbSBzdXJlIHRoYXQgSSBhZGRlZCB0aGlzIGxpbmUg
YXQgc29tZSBwb2ludC4gQnV0IEknbSBub3cgd29uZGVyaW5nIHdoeSANCndlJ3JlIHRlc3Rp
bmcgdGhpcyBmbGFnLiBFdmVyeXRoaW5nIHRoYXQgdXNlcyB0aGUgbWFwcGVkIGJ1ZmZlciBz
aG91bGQgDQpieSBhZ25vc3RpYyB0byBpc19pb21lbS4gSUlSQyB0aGUgb25seSByZWFzb24g
Zm9yIHRoaXMgdGVzdCBpcyBpcyB0aGF0IA0Kd2UncmUgc2V0dGluZyBzaG1lbS0+dmFkZHIg
dG8gdGhlIHJldHVybmVkIG1hcC0+dmFkZHIuIE5vdyB0aGF0IHRoZSBjb2RlIA0KaXMgZ29u
ZSwgd2UgY2FuIGFsc28gcmVtb3ZlIHRoYXQgd2hvbGUgYnJhbmNoLg0KDQo+ICAgCQkJCWRt
YV9idWZfdnVubWFwKG9iai0+aW1wb3J0X2F0dGFjaC0+ZG1hYnVmLCBtYXApOw0KPiAtCQkJ
CXJldCA9IC1FSU87DQo+IC0JCQkJZ290byBlcnJfcHV0X3BhZ2VzOw0KPiArCQkJCXJldHVy
biAtRUlPOw0KPiAgIAkJCX0NCj4gLQkJCXNobWVtLT52YWRkciA9IG1hcC0+dmFkZHI7DQo+
ICAgCQl9DQo+ICAgCX0gZWxzZSB7DQo+ICAgCQlwZ3Byb3RfdCBwcm90ID0gUEFHRV9LRVJO
RUw7DQo+ICAgDQo+ICsJCWlmIChzaG1lbS0+dm1hcF91c2VfY291bnQrKyA+IDApIHsNCj4g
KwkJCWlvc3lzX21hcF9zZXRfdmFkZHIobWFwLCBzaG1lbS0+dmFkZHIpOw0KPiArCQkJcmV0
dXJuIDA7DQo+ICsJCX0NCj4gKw0KPiAgIAkJcmV0ID0gZHJtX2dlbV9zaG1lbV9nZXRfcGFn
ZXMoc2htZW0pOw0KPiAgIAkJaWYgKHJldCkNCj4gICAJCQlnb3RvIGVycl96ZXJvX3VzZTsN
Cj4gQEAgLTM4NCwxNSArMzgyLDE1IEBAIHN0YXRpYyB2b2lkIGRybV9nZW1fc2htZW1fdnVu
bWFwX2xvY2tlZChzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtLA0KPiAgIHsN
Cj4gICAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSAmc2htZW0tPmJhc2U7DQo+ICAg
DQo+IC0JaWYgKGRybV9XQVJOX09OX09OQ0Uob2JqLT5kZXYsICFzaG1lbS0+dm1hcF91c2Vf
Y291bnQpKQ0KPiAtCQlyZXR1cm47DQo+IC0NCj4gLQlpZiAoLS1zaG1lbS0+dm1hcF91c2Vf
Y291bnQgPiAwKQ0KPiAtCQlyZXR1cm47DQo+IC0NCj4gICAJaWYgKG9iai0+aW1wb3J0X2F0
dGFjaCkgew0KPiAgIAkJZG1hX2J1Zl92dW5tYXAob2JqLT5pbXBvcnRfYXR0YWNoLT5kbWFi
dWYsIG1hcCk7DQo+ICAgCX0gZWxzZSB7DQo+ICsJCWlmIChkcm1fV0FSTl9PTl9PTkNFKG9i
ai0+ZGV2LCAhc2htZW0tPnZtYXBfdXNlX2NvdW50KSkNCj4gKwkJCXJldHVybjsNCj4gKw0K
PiArCQlpZiAoLS1zaG1lbS0+dm1hcF91c2VfY291bnQgPiAwKQ0KPiArCQkJcmV0dXJuOw0K
PiArDQo+ICAgCQl2dW5tYXAoc2htZW0tPnZhZGRyKTsNCj4gICAJCWRybV9nZW1fc2htZW1f
cHV0X3BhZ2VzKHNobWVtKTsNCj4gICAJfQ0KPiBAQCAtNjYwLDcgKzY1OCwxNCBAQCB2b2lk
IGRybV9nZW1fc2htZW1fcHJpbnRfaW5mbyhjb25zdCBzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9v
YmplY3QgKnNobWVtLA0KPiAgIAkJCSAgICAgIHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgdW5z
aWduZWQgaW50IGluZGVudCkNCj4gICB7DQo+ICAgCWRybV9wcmludGZfaW5kZW50KHAsIGlu
ZGVudCwgInBhZ2VzX3VzZV9jb3VudD0ldVxuIiwgc2htZW0tPnBhZ2VzX3VzZV9jb3VudCk7
DQo+IC0JZHJtX3ByaW50Zl9pbmRlbnQocCwgaW5kZW50LCAidm1hcF91c2VfY291bnQ9JXVc
biIsIHNobWVtLT52bWFwX3VzZV9jb3VudCk7DQo+ICsNCj4gKwlpZiAoc2htZW0tPmJhc2Uu
aW1wb3J0X2F0dGFjaCkNCj4gKwkJZHJtX3ByaW50Zl9pbmRlbnQocCwgaW5kZW50LCAidm1h
cF91c2VfY291bnQ9JXVcbiIsDQo+ICsJCQkJICBzaG1lbS0+YmFzZS5kbWFfYnVmLT52bWFw
cGluZ19jb3VudGVyKTsNCg0KVGhpcyBpcyBub3Qgdm1hcF91c2VfY291bnQgYW5kIHRoZSBi
ZXN0IHNvbHV0aW9uIGlzIHRvIGFkZCBhIHByaW50X2luZm8gDQpjYWxsYmFjayB0byBkbWFf
YnVmcy4gU28gTWF5YmUgc2ltcGx5IGlnbm9yZSBpbXBvcnRlZCBidWZmZXJzIGhlcmUuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gKwllbHNlDQo+ICsJCWRybV9wcmludGZfaW5k
ZW50KHAsIGluZGVudCwgInZtYXBfdXNlX2NvdW50PSV1XG4iLA0KPiArCQkJCSAgc2htZW0t
PnZtYXBfdXNlX2NvdW50KTsNCj4gKw0KPiAgIAlkcm1fcHJpbnRmX2luZGVudChwLCBpbmRl
bnQsICJ2YWRkcj0lcFxuIiwgc2htZW0tPnZhZGRyKTsNCj4gICB9DQo+ICAgRVhQT1JUX1NZ
TUJPTChkcm1fZ2VtX3NobWVtX3ByaW50X2luZm8pOw0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------a6h4X0oxv64uyuMO0ro5kmuV--

--------------5CdL93VU2j07cHfFJ3oqll5F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPvdfAFAwAAAAAACgkQlh/E3EQov+Ct
6xAAtP4HwT8KSbB6EbsRIjwOYLYJP5iQl2P1pQmEdtRMoIpg3WxXkEPBuNGI/ynD4Ez3bBgQMV1X
StTJE1skfX2mUNt8kMr6mwzLfDMwsBkiym1upMGsvMVrUA3AMJTco8RhrD8ANRVwm2wa6AFNl8WO
TktKOJw3wibNvkKCDcKsj4dqZ1NyEAFQOHDpi6BiWm32hoIFi/N1AQkHhGGqSS8WrwDygTQqMc9H
NSWRt8WEaAmyGlWWSaSvbG9e9rT7PWWIObNZsIXFuV/7lYyD0QGOUU/YGZS+1n6auBdHJ/8jZZWA
n1VTI0NvxJr1E3E/Y5wCew6t3jRYmf2069qZWQdF6jar4owsGa5IPgPPOLMwyBFS8HAlH4WLjcFR
mpt1RuLF7KqzSWdDM/Cxjv+ihIduuVLX5VAW3uBfSzN3JoeM8HVGJzMKBovBYHabtK6+/qH021K6
L5jTZFHxSgYvI5PlCQuZ1YOtX272vnbR3l2C4rbaWk1NXmCzjxWHKSJUT2ipXWYzFrrs9iKoW+Bj
KrzlEI9tLZnvBgShSUfLtw5GHAJ8G04U9bW2VINbOGs3yiqCN44+USn7qQXJ+Ow6GDpba70Dszue
EvPSolutJjDTHxud75tN1LGz2r3omsK9AP4BJarOLD6Js4EsKSzv6vMb08q0oezAty8uqFF/VkWH
EBk=
=jUx1
-----END PGP SIGNATURE-----

--------------5CdL93VU2j07cHfFJ3oqll5F--
