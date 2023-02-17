Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D45569AB6D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458B710EF99;
	Fri, 17 Feb 2023 12:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B2310EF99
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 12:25:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C8681FF52;
 Fri, 17 Feb 2023 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676636702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hLMo50QHe1/PwBNhh35jJJlZiJq9HSkFtUHWmmDswvc=;
 b=vALWS+5UaT4smrFbUIlQo3wAuzKf0G/92iwK6IOM9D14fvvvAnfzzSR+U/RUwmIaTRTK3Q
 8CxaNTcOy2SOVoDmcS71F9vUq+EENlOOvaPTqd7Yh6EBFnZLoS9+pOnopjrFhbpgp1PnC5
 Y5SxKtcgCBVcGC5evr/Q/qiet/CQhoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676636702;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hLMo50QHe1/PwBNhh35jJJlZiJq9HSkFtUHWmmDswvc=;
 b=jRDQC2Uzm9DoaxKSe49EmNjdjMl4IuluZmDmxDJnmkix0vM2IQo0kca2ED3LMjbFYiDwEq
 VGvYDjoOHyyIdtBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D55C13274;
 Fri, 17 Feb 2023 12:25:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f3BfIR1y72OhZAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Feb 2023 12:25:01 +0000
Message-ID: <dcff3189-8696-4988-616a-98a4fd82d417@suse.de>
Date: Fri, 17 Feb 2023 13:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 04/11] drm/shmem: Put booleans in the end of struct
 drm_gem_shmem_object
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
 <20230108210445.3948344-5-dmitry.osipenko@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230108210445.3948344-5-dmitry.osipenko@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------riziz0OPTF37QY0nWKvApQMA"
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
--------------riziz0OPTF37QY0nWKvApQMA
Content-Type: multipart/mixed; boundary="------------vpCueKlwgQtbZlPhyDtpeZZ6";
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
Message-ID: <dcff3189-8696-4988-616a-98a4fd82d417@suse.de>
Subject: Re: [PATCH v10 04/11] drm/shmem: Put booleans in the end of struct
 drm_gem_shmem_object
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-5-dmitry.osipenko@collabora.com>
In-Reply-To: <20230108210445.3948344-5-dmitry.osipenko@collabora.com>

--------------vpCueKlwgQtbZlPhyDtpeZZ6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjAxLjIzIHVtIDIyOjA0IHNjaHJpZWIgRG1pdHJ5IE9zaXBlbmtvOg0KPiBH
cm91cCBhbGwgMS1iaXQgYm9vbGVhbiBtZW1iZXJzIG9mIHN0cnVjdCBkcm1fZ2VtX3NobWVt
X29iamVjdCBpbiB0aGUgZW5kDQo+IG9mIHRoZSBzdHJ1Y3R1cmUsIGFsbG93aW5nIGNvbXBp
bGVyIHRvIHBhY2sgZGF0YSBiZXR0ZXIgYW5kIG1ha2luZyBjb2RlIHRvDQo+IGxvb2sgbW9y
ZSBjb25zaXN0ZW50Lg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtv
IDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiAgIGluY2x1
ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmggfCAzMCArKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbV9z
aG1lbV9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmgNCj4g
aW5kZXggYTIyMDFiMjQ4OGM1Li41OTk0ZmVkNWUzMjcgMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X2dlbV9zaG1lbV9oZWxwZXIuaA0KPiBAQCAtNjAsMjAgKzYwLDYgQEAgc3RydWN0IGRybV9n
ZW1fc2htZW1fb2JqZWN0IHsNCj4gICAJICovDQo+ICAgCXN0cnVjdCBsaXN0X2hlYWQgbWFk
dl9saXN0Ow0KPiAgIA0KPiAtCS8qKg0KPiAtCSAqIEBwYWdlc19tYXJrX2RpcnR5X29uX3B1
dDoNCj4gLQkgKg0KPiAtCSAqIE1hcmsgcGFnZXMgYXMgZGlydHkgd2hlbiB0aGV5IGFyZSBw
dXQuDQo+IC0JICovDQo+IC0JdW5zaWduZWQgaW50IHBhZ2VzX21hcmtfZGlydHlfb25fcHV0
ICAgIDogMTsNCj4gLQ0KPiAtCS8qKg0KPiAtCSAqIEBwYWdlc19tYXJrX2FjY2Vzc2VkX29u
X3B1dDoNCj4gLQkgKg0KPiAtCSAqIE1hcmsgcGFnZXMgYXMgYWNjZXNzZWQgd2hlbiB0aGV5
IGFyZSBwdXQuDQo+IC0JICovDQo+IC0JdW5zaWduZWQgaW50IHBhZ2VzX21hcmtfYWNjZXNz
ZWRfb25fcHV0IDogMTsNCj4gLQ0KPiAgIAkvKioNCj4gICAJICogQHNndDogU2NhdHRlci9n
YXRoZXIgdGFibGUgZm9yIGltcG9ydGVkIFBSSU1FIGJ1ZmZlcnMNCj4gICAJICovDQo+IEBA
IC05NywxMCArODMsMjQgQEAgc3RydWN0IGRybV9nZW1fc2htZW1fb2JqZWN0IHsNCj4gICAJ
ICovDQo+ICAgCXVuc2lnbmVkIGludCB2bWFwX3VzZV9jb3VudDsNCj4gICANCj4gKwkvKioN
Cj4gKwkgKiBAcGFnZXNfbWFya19kaXJ0eV9vbl9wdXQ6DQo+ICsJICoNCj4gKwkgKiBNYXJr
IHBhZ2VzIGFzIGRpcnR5IHdoZW4gdGhleSBhcmUgcHV0Lg0KPiArCSAqLw0KPiArCWJvb2wg
cGFnZXNfbWFya19kaXJ0eV9vbl9wdXQgOiAxOw0KPiArDQo+ICsJLyoqDQo+ICsJICogQHBh
Z2VzX21hcmtfYWNjZXNzZWRfb25fcHV0Og0KPiArCSAqDQo+ICsJICogTWFyayBwYWdlcyBh
cyBhY2Nlc3NlZCB3aGVuIHRoZXkgYXJlIHB1dC4NCj4gKwkgKi8NCj4gKwlib29sIHBhZ2Vz
X21hcmtfYWNjZXNzZWRfb25fcHV0IDogMTsNCj4gKw0KPiAgIAkvKioNCj4gICAJICogQG1h
cF93YzogbWFwIG9iamVjdCB3cml0ZS1jb21iaW5lZCAoaW5zdGVhZCBvZiB1c2luZyBzaG1l
bSBkZWZhdWx0cykuDQo+ICAgCSAqLw0KPiAtCWJvb2wgbWFwX3djOw0KPiArCWJvb2wgbWFw
X3djIDogMTsNCj4gICB9Ow0KPiAgIA0KPiAgICNkZWZpbmUgdG9fZHJtX2dlbV9zaG1lbV9v
Ymoob2JqKSBcDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------vpCueKlwgQtbZlPhyDtpeZZ6--

--------------riziz0OPTF37QY0nWKvApQMA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPvchwFAwAAAAAACgkQlh/E3EQov+DD
wRAAyr2BPnhokho5Mjgb/1SUFEYo3FSKRY6iLVJ81cZt0bTeVVJmQW7Gye+S/x4tRCkdDRGNi1xm
ZgnpEZqw/zi+hlLWZkbKxcX/IbCPjE66T4hqiK2kHhjJK1yRX2KrQdLeu0jd3r6ZluIkWB7eeen7
UWS89neNa4cUOjBqFPHzsPymNCT3bufIY0p7CLCYYok9q4jqRL7O7Byw1gztPQrBVU8So5dS1DS+
0fGgbwaCkFyFrq+s+2WX3gUnFDvgs2DZ58YzTJuQtAObwLA55wZ0atiBXLLnqm7plyHG0XUAr+KI
uDNvUAaMEBNXqgEydx+kN3rCjFmDuobwHz42MwTM4obmadukzhnQkFXRQAOjgp6HwvpFYr9tMdkc
1IKR/IWYWCLORo6AoO8JYO/VO5lZyDZArtXXK8ailvezipn6y9kuRi6nzITLXqiCupgPpMJu9//H
TbXKOGOg9kX6CUf8o8O1SPZuSmaW4ZhGwga/e+ZjojAk0DmuNd6kQMkH7jk4LvRKUdAjb7RYkYRj
jKQkW3HnBx3AE/BX/JvMGcT+lXiHtO+stIYSNMRzB4+T4FItXepwVonQEe10WRXN2yPFVReKwpxT
HRhJbO8gLh3w0cgcmjZG7wzstTAW1I4MQWbZ9Vd2KXuBjP/UkfmGAiwhV9vorUJOEwQiRAkdJQVh
xjA=
=vfTJ
-----END PGP SIGNATURE-----

--------------riziz0OPTF37QY0nWKvApQMA--
