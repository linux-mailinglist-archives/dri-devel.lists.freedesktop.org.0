Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F53469AAF0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A4410EF87;
	Fri, 17 Feb 2023 12:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC0D10EF87
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 12:02:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B68851FED9;
 Fri, 17 Feb 2023 12:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676635326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mACMKGkLVmKwIhmiDATfkCj3naoi5sDdPp3jNtiu0xk=;
 b=LUT4lxNqEsBXOTmxZ0r0+wIBOi2SFEFLYmIMr82dOXCd86PrSQL9UKJfhtjaZXPzk5u02L
 FQp6xAQthq/Rp3KDNY1vsK704sIOGnmH1IHPqQmMpbjitXZhBH4J53oEXChM6PvVlUsHtV
 ry+UyvqnjhiXujNlFih7KG9k9VwPeqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676635326;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mACMKGkLVmKwIhmiDATfkCj3naoi5sDdPp3jNtiu0xk=;
 b=kVCqF0xbW5oEImKQPZOMVnp0q7ESbx6zmAyUXmSeFKrj28IaIYux5CMmvWGZGPnI7+dGEB
 YomSGMt59GjBOwDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40AE213274;
 Fri, 17 Feb 2023 12:02:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id POrZDr5s72OIWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Feb 2023 12:02:06 +0000
Message-ID: <d1c560f1-0201-7b41-bb27-d6bcb332b8d4@suse.de>
Date: Fri, 17 Feb 2023 13:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 01/11] drm/msm/gem: Prevent blocking within shrinker
 loop
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
 <20230108210445.3948344-2-dmitry.osipenko@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230108210445.3948344-2-dmitry.osipenko@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------60HqKSDbPSUan7IgnM30CTcf"
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
--------------60HqKSDbPSUan7IgnM30CTcf
Content-Type: multipart/mixed; boundary="------------tqyCR4qpxrZiJIdETyfv5uk0";
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
Message-ID: <d1c560f1-0201-7b41-bb27-d6bcb332b8d4@suse.de>
Subject: Re: [PATCH v10 01/11] drm/msm/gem: Prevent blocking within shrinker
 loop
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-2-dmitry.osipenko@collabora.com>
In-Reply-To: <20230108210445.3948344-2-dmitry.osipenko@collabora.com>

--------------tqyCR4qpxrZiJIdETyfv5uk0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDEuMjMgdW0gMjI6MDQgc2NocmllYiBEbWl0cnkgT3NpcGVua286DQo+
IENvbnNpZGVyIHRoaXMgc2NlbmFyaW86DQo+IA0KPiAxLiBBUFAxIGNvbnRpbnVvdXNseSBj
cmVhdGVzIGxvdHMgb2Ygc21hbGwgR0VNcw0KPiAyLiBBUFAyIHRyaWdnZXJzIGBkcm9wX2Nh
Y2hlc2ANCj4gMy4gU2hyaW5rZXIgc3RhcnRzIHRvIGV2aWN0IEFQUDEgR0VNcywgd2hpbGUg
QVBQMSBwcm9kdWNlcyBuZXcgcHVyZ2VhYmxlDQo+ICAgICBHRU1zDQo+IDQuIG1zbV9nZW1f
c2hyaW5rZXJfc2NhbigpIHJldHVybnMgbm9uLXplcm8gbnVtYmVyIG9mIGZyZWVkIHBhZ2Vz
DQo+ICAgICBhbmQgY2F1c2VzIHNocmlua2VyIHRvIHRyeSBzaHJpbmsgbW9yZQ0KPiA1LiBt
c21fZ2VtX3Nocmlua2VyX3NjYW4oKSByZXR1cm5zIG5vbi16ZXJvIG51bWJlciBvZiBmcmVl
ZCBwYWdlcyBhZ2FpbiwNCj4gICAgIGdvdG8gNA0KPiA2LiBUaGUgQVBQMiBpcyBibG9ja2Vk
IGluIGBkcm9wX2NhY2hlc2AgdW50aWwgQVBQMSBzdG9wcyBwcm9kdWNpbmcNCj4gICAgIHB1
cmdlYWJsZSBHRU1zDQo+IA0KPiBUbyBwcmV2ZW50IHRoaXMgYmxvY2tpbmcgc2NlbmFyaW8s
IGNoZWNrIG51bWJlciBvZiByZW1haW5pbmcgcGFnZXMNCj4gdGhhdCBHUFUgc2hyaW5rZXIg
Y291bGRuJ3QgcmVsZWFzZSBkdWUgdG8gYSBHRU0gbG9ja2luZyBjb250ZW50aW9uDQo+IG9y
IHNocmlua2luZyByZWplY3Rpb24uIElmIHRoZXJlIGFyZSBubyByZW1haW5pbmcgcGFnZXMg
bGVmdCB0byBzaHJpbmssDQo+IHRoZW4gdGhlcmUgaXMgbm8gbmVlZCB0byBmcmVlIHVwIG1v
cmUgcGFnZXMgYW5kIHNocmlua2VyIG1heSBicmVhayBvdXQNCj4gZnJvbSB0aGUgbG9vcC4N
Cj4gDQo+IFRoaXMgcHJvYmxlbSB3YXMgZm91bmQgZHVyaW5nIHNocmlua2VyL21hZHZpc2Ug
SU9DVEwgdGVzdGluZyBvZg0KPiB2aXJ0aW8tZ3B1IGRyaXZlci4gVGhlIE1TTSBkcml2ZXIg
aXMgYWZmZWN0ZWQgaW4gdGhlIHNhbWUgd2F5Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IFJvYiBD
bGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4NCj4gRml4ZXM6IGIzNTJiYTU0YTgyMCAoImRy
bS9tc20vZ2VtOiBDb252ZXJ0IHRvIHVzaW5nIGRybV9nZW1fbHJ1IikNCj4gU2lnbmVkLW9m
Zi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4N
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAgICAgICAgICAgICAgfCA5
ICsrKysrKystLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zaHJpbmtlci5j
IHwgOCArKysrKystLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9nZW0uaCAgICAgICAgICAgICAg
ICAgIHwgNCArKystDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+IGluZGV4IDU5YTBiYjVlYmQ4
NS4uYzZiY2E1YWM2ZTBmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMNCj4gQEAgLTEzODgsMTAg
KzEzODgsMTMgQEAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX2xydV9tb3ZlX3RhaWwpOw0KPiAg
ICAqDQo+ICAgICogQGxydTogVGhlIExSVSB0byBzY2FuDQo+ICAgICogQG5yX3RvX3NjYW46
IFRoZSBudW1iZXIgb2YgcGFnZXMgdG8gdHJ5IHRvIHJlY2xhaW0NCj4gKyAqIEByZW1haW5p
bmc6IFRoZSBudW1iZXIgb2YgcGFnZXMgbGVmdCB0byByZWNsYWltDQo+ICAgICogQHNocmlu
azogQ2FsbGJhY2sgdG8gdHJ5IHRvIHNocmluay9yZWNsYWltIHRoZSBvYmplY3QuDQo+ICAg
ICovDQo+ICAgdW5zaWduZWQgbG9uZw0KPiAtZHJtX2dlbV9scnVfc2NhbihzdHJ1Y3QgZHJt
X2dlbV9scnUgKmxydSwgdW5zaWduZWQgbnJfdG9fc2NhbiwNCj4gK2RybV9nZW1fbHJ1X3Nj
YW4oc3RydWN0IGRybV9nZW1fbHJ1ICpscnUsDQo+ICsJCSB1bnNpZ25lZCBpbnQgbnJfdG9f
c2NhbiwNCj4gKwkJIHVuc2lnbmVkIGxvbmcgKnJlbWFpbmluZywNCj4gICAJCSBib29sICgq
c2hyaW5rKShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikpDQo+ICAgew0KPiAgIAlzdHJ1
Y3QgZHJtX2dlbV9scnUgc3RpbGxfaW5fbHJ1Ow0KPiBAQCAtMTQzMCw4ICsxNDMzLDEwIEBA
IGRybV9nZW1fbHJ1X3NjYW4oc3RydWN0IGRybV9nZW1fbHJ1ICpscnUsIHVuc2lnbmVkIG5y
X3RvX3NjYW4sDQo+ICAgCQkgKiBoaXQgc2hyaW5rZXIgaW4gcmVzcG9uc2UgdG8gdHJ5aW5n
IHRvIGdldCBiYWNraW5nIHBhZ2VzDQo+ICAgCQkgKiBmb3IgdGhpcyBvYmogKGllLiB3aGls
ZSBpdCdzIGxvY2sgaXMgYWxyZWFkeSBoZWxkKQ0KPiAgIAkJICovDQo+IC0JCWlmICghZG1h
X3Jlc3ZfdHJ5bG9jayhvYmotPnJlc3YpKQ0KPiArCQlpZiAoIWRtYV9yZXN2X3RyeWxvY2so
b2JqLT5yZXN2KSkgew0KPiArCQkJKnJlbWFpbmluZyArPSBvYmotPnNpemUgPj4gUEFHRV9T
SElGVDsNCj4gICAJCQlnb3RvIHRhaWw7DQo+ICsJCX0NCj4gICANCj4gICAJCWlmIChzaHJp
bmsob2JqKSkgew0KPiAgIAkJCWZyZWVkICs9IG9iai0+c2l6ZSA+PiBQQUdFX1NISUZUOw0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3Nocmlua2VyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc2hyaW5rZXIuYw0KPiBpbmRleCAwNTFi
ZGJjMDkzY2YuLmI3YzEyNDIwMTRlYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZ2VtX3Nocmlua2VyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZ2VtX3Nocmlua2VyLmMNCj4gQEAgLTExNiwxMiArMTE2LDE0IEBAIG1zbV9nZW1fc2hy
aW5rZXJfc2NhbihzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyLCBzdHJ1Y3Qgc2hyaW5rX2Nv
bnRyb2wgKnNjKQ0KPiAgIAl9Ow0KPiAgIAlsb25nIG5yID0gc2MtPm5yX3RvX3NjYW47DQo+
ICAgCXVuc2lnbmVkIGxvbmcgZnJlZWQgPSAwOw0KPiArCXVuc2lnbmVkIGxvbmcgcmVtYWlu
aW5nID0gMDsNCj4gICANCj4gICAJZm9yICh1bnNpZ25lZCBpID0gMDsgKG5yID4gMCkgJiYg
KGkgPCBBUlJBWV9TSVpFKHN0YWdlcykpOyBpKyspIHsNCj4gICAJCWlmICghc3RhZ2VzW2ld
LmNvbmQpDQo+ICAgCQkJY29udGludWU7DQo+ICAgCQlzdGFnZXNbaV0uZnJlZWQgPQ0KPiAt
CQkJZHJtX2dlbV9scnVfc2NhbihzdGFnZXNbaV0ubHJ1LCBuciwgc3RhZ2VzW2ldLnNocmlu
ayk7DQo+ICsJCQlkcm1fZ2VtX2xydV9zY2FuKHN0YWdlc1tpXS5scnUsIG5yLCAmcmVtYWlu
aW5nLA0KDQpUaGlzIGZ1bmN0aW9uIHJlbGllcyBpbiByZW1haW5pbmcgYmVpbmcgcHJlLWlu
aXRpYWxpemVkLiBUaGF0J3Mgbm90IA0Kb2J2aW91cyBhbmQgZXJyb3IgcHJvbmUuIEF0IGxl
YXN0LCBwYXNzLWluIHNvbWV0aGluZyBsaWtlIA0KJnN0YWdlc1tpXS5yZW1haW5pbmcgdGhh
dCBpcyB0aGVuIGluaXRpYWxpemVkIGludGVybmFsbHkgYnkgDQpkcm1fZ2VtX2xydV9zY2Fu
KCkgdG8gemVyby4gQW5kIHNpbWlsYXIgdG8gZnJlZWQsIHN1bSB1cCB0aGUgaW5kaXZpZHVh
bCANCnN0YWdlcycgcmVtYWluaW5nIGhlcmUuDQoNClRCSCBJIHNvbWVob3cgZG9uJ3QgbGlr
ZSB0aGUgb3ZlcmFsbCBkZXNpZ24gb2YgaG93IGFsbCB0aGVzZSBmdW5jdGlvbnMgDQppbnRl
cmFjdCB3aXRoIGVhY2ggb3RoZXIuIEJ1dCBJIGFsc28gY2FuJ3QgcmVhbGx5IHBvaW50IHRv
IHRoZSBhY3R1YWwgDQpwcm9ibGVtLiBTbyBpdCdzIGJlc3QgdG8gdGFrZSB3aGF0IHlvdSBo
YXZlIGhlcmU7IG1heWJlIHdpdGggdGhlIGNoYW5nZSANCkkgcHJvcG9zZWQuDQoNClJldmll
d2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiArCQkJCQkgc3RhZ2VzW2ldLnNocmluayk7DQo+ICAg
CQluciAtPSBzdGFnZXNbaV0uZnJlZWQ7DQo+ICAgCQlmcmVlZCArPSBzdGFnZXNbaV0uZnJl
ZWQ7DQo+ICAgCX0NCj4gQEAgLTEzMiw3ICsxMzQsNyBAQCBtc21fZ2VtX3Nocmlua2VyX3Nj
YW4oc3RydWN0IHNocmlua2VyICpzaHJpbmtlciwgc3RydWN0IHNocmlua19jb250cm9sICpz
YykNCj4gICAJCQkJICAgICBzdGFnZXNbM10uZnJlZWQpOw0KPiAgIAl9DQo+ICAgDQo+IC0J
cmV0dXJuIChmcmVlZCA+IDApID8gZnJlZWQgOiBTSFJJTktfU1RPUDsNCj4gKwlyZXR1cm4g
KGZyZWVkID4gMCAmJiByZW1haW5pbmcgPiAwKSA/IGZyZWVkIDogU0hSSU5LX1NUT1A7DQo+
ICAgfQ0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfREVCVUdfRlMNCj4gQEAgLTE4MiwxMCAr
MTg0LDEyIEBAIG1zbV9nZW1fc2hyaW5rZXJfdm1hcChzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sg
Km5iLCB1bnNpZ25lZCBsb25nIGV2ZW50LCB2b2lkICpwdHIpDQo+ICAgCQlOVUxMLA0KPiAg
IAl9Ow0KPiAgIAl1bnNpZ25lZCBpZHgsIHVubWFwcGVkID0gMDsNCj4gKwl1bnNpZ25lZCBs
b25nIHJlbWFpbmluZyA9IDA7DQo+ICAgDQo+ICAgCWZvciAoaWR4ID0gMDsgbHJ1c1tpZHhd
ICYmIHVubWFwcGVkIDwgdm1hcF9zaHJpbmtfbGltaXQ7IGlkeCsrKSB7DQo+ICAgCQl1bm1h
cHBlZCArPSBkcm1fZ2VtX2xydV9zY2FuKGxydXNbaWR4XSwNCj4gICAJCQkJCSAgICAgdm1h
cF9zaHJpbmtfbGltaXQgLSB1bm1hcHBlZCwNCj4gKwkJCQkJICAgICAmcmVtYWluaW5nLA0K
PiAgIAkJCQkJICAgICB2bWFwX3Nocmluayk7DQo+ICAgCX0NCj4gICANCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaCBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaA0KPiBp
bmRleCA3NzJhNGFkZjUyODcuLmYxZjAwZmMyZGJhNiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX2dlbS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaA0KPiBAQCAt
NDc2LDcgKzQ3Niw5IEBAIGludCBkcm1fZ2VtX2R1bWJfbWFwX29mZnNldChzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbGUsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAgdm9pZCBkcm1fZ2Vt
X2xydV9pbml0KHN0cnVjdCBkcm1fZ2VtX2xydSAqbHJ1LCBzdHJ1Y3QgbXV0ZXggKmxvY2sp
Ow0KPiAgIHZvaWQgZHJtX2dlbV9scnVfcmVtb3ZlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqKTsNCj4gICB2b2lkIGRybV9nZW1fbHJ1X21vdmVfdGFpbChzdHJ1Y3QgZHJtX2dlbV9s
cnUgKmxydSwgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOw0KPiAtdW5zaWduZWQgbG9u
ZyBkcm1fZ2VtX2xydV9zY2FuKHN0cnVjdCBkcm1fZ2VtX2xydSAqbHJ1LCB1bnNpZ25lZCBu
cl90b19zY2FuLA0KPiArdW5zaWduZWQgbG9uZyBkcm1fZ2VtX2xydV9zY2FuKHN0cnVjdCBk
cm1fZ2VtX2xydSAqbHJ1LA0KPiArCQkJICAgICAgIHVuc2lnbmVkIGludCBucl90b19zY2Fu
LA0KPiArCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgKnJlbWFpbmluZywNCj4gICAJCQkgICAg
ICAgYm9vbCAoKnNocmluaykoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopKTsNCj4gICAN
Cj4gICAjZW5kaWYgLyogX19EUk1fR0VNX0hfXyAqLw0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------tqyCR4qpxrZiJIdETyfv5uk0--

--------------60HqKSDbPSUan7IgnM30CTcf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPvbL0FAwAAAAAACgkQlh/E3EQov+CM
2A//Uo45QtEGjAxG+/XhSjINQQnVlwRSOUKHHWkC+fzXekjz3UiViw8+XFoq7MOVtC8k+1jWbizy
oHTo5XQLVDIWeQsjeKOhjZbBtkHGJmuIeulByY1CiRDdyFN/zdbnUWFph6Rbe9gg77PhV5XfzcHy
CWIJro5s7hifW4pLWo0lSzKzoRHzNeAQdBlxCkhUn+zp6arIG3WTkkTiy3Mv7L1VReqed5g2asnT
YQ5tt/giKFTCVH7hgnELDKHhvXGukbOfa6qielkpC+B4TSpjIsV0VV1vvmcNp1bIzo/qSIChOAnq
RKx8HprQX4dxIvdFJyHQqBe3keP9B3eZn0G3YtmfrNHHZXAqHFkbezRP4a7W0MkppwesYWkILbB6
wSJrFjkakiiNpmfJ5Y86eXeop6i47rW+GLZos24DtViz9x971athhdb7p2Y/agEIcZ/5+nLBrdAG
nUe6K5Qjj8Ht1HGfOq19YNvZhtBbUdWa8G1HYAz1HgdrnKPEZ7ZuIQPgDfIec+nlc0nz8j2RDXL/
y2e/fOHpaesTqtL9c6uGEbiZoVQVy1VSTrkQMDVoLy8Cs7ZABuXazJYb41I4LA9+hder099va3Og
wrB/Cr/IXvwnwcUaA6kf5ReY2yfTr/0qqRhZ1g2yidByDIz1biJReuZnj5mkRdiIWOq0GPvqkYV9
uSY=
=w/RX
-----END PGP SIGNATURE-----

--------------60HqKSDbPSUan7IgnM30CTcf--
