Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB3269AB7A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF7310EF91;
	Fri, 17 Feb 2023 12:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914E710EF91
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 12:28:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 33E3833992;
 Fri, 17 Feb 2023 12:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676636928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W35bRMr+ZnD9v0BTJvpprTtTre4YpYiNV4Olzwh1+4s=;
 b=eh2zgQhxy5kLFKKaL7P3SbkL7K2PIQJClAShBTqej3/R0sMQc0Tlfo6UqOckm8PUHXi7Gu
 22RKHv0l0ZQ5YvWigMhsNF0wyLJ64ZYk8q8epcbmWkRXHw9Vj1OW8hB1B0mUBqThatljQ3
 4AVhB0PHQ3Qk/5f2T7+95txC77NEWgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676636928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W35bRMr+ZnD9v0BTJvpprTtTre4YpYiNV4Olzwh1+4s=;
 b=SlKXv8Xp7UoY+BllRVv2sBgoiZmbmbSTY+FY6TE+bLX82sn85ZEL3VVZAsef3Cr0PE8DCx
 qYcmXhQHc6STItCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF58713274;
 Fri, 17 Feb 2023 12:28:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Cv/NKf9y72OrZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Feb 2023 12:28:47 +0000
Message-ID: <fe549bf7-a704-abda-ac1d-221a96de344d@suse.de>
Date: Fri, 17 Feb 2023 13:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 05/11] drm/shmem: Switch to use drm_* debug helpers
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
 <20230108210445.3948344-6-dmitry.osipenko@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230108210445.3948344-6-dmitry.osipenko@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------80Pt9bKHSt0abgr9F0qb2PKU"
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
--------------80Pt9bKHSt0abgr9F0qb2PKU
Content-Type: multipart/mixed; boundary="------------VAaKY3Kb0f9rBXPZnVL0qNvW";
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
Message-ID: <fe549bf7-a704-abda-ac1d-221a96de344d@suse.de>
Subject: Re: [PATCH v10 05/11] drm/shmem: Switch to use drm_* debug helpers
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-6-dmitry.osipenko@collabora.com>
In-Reply-To: <20230108210445.3948344-6-dmitry.osipenko@collabora.com>

--------------VAaKY3Kb0f9rBXPZnVL0qNvW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjAxLjIzIHVtIDIyOjA0IHNjaHJpZWIgRG1pdHJ5IE9zaXBlbmtvOg0KPiBF
YXNlIGRlYnVnZ2luZyBvZiBhIG11bHRpLUdQVSBzeXN0ZW0gYnkgdXNpbmcgZHJtX1dBUk5f
KigpIGFuZA0KPiBkcm1fZGJnX2ttcygpIGhlbHBlcnMgdGhhdCBwcmludCBvdXQgRFJNIGRl
dmljZSBuYW1lIGNvcnJlc3BvbmRpbmcNCj4gdG8gc2htZW0gR0VNLg0KPiANCj4gU3VnZ2Vz
dGVkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gU2ln
bmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3Jh
LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hl
bHBlci5jIHwgMzggKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPiBpbmRleCBmMjFmNDc3Mzc4MTcu
LjUwMDZmN2RhN2YyZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
c2htZW1faGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1f
aGVscGVyLmMNCj4gQEAgLTE0MSw3ICsxNDEsNyBAQCB2b2lkIGRybV9nZW1fc2htZW1fZnJl
ZShzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtKQ0KPiAgIHsNCj4gICAJc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSAmc2htZW0tPmJhc2U7DQo+ICAgDQo+IC0JV0FS
Tl9PTihzaG1lbS0+dm1hcF91c2VfY291bnQpOw0KPiArCWRybV9XQVJOX09OKG9iai0+ZGV2
LCBzaG1lbS0+dm1hcF91c2VfY291bnQpOw0KPiAgIA0KPiAgIAlpZiAob2JqLT5pbXBvcnRf
YXR0YWNoKSB7DQo+ICAgCQlkcm1fcHJpbWVfZ2VtX2Rlc3Ryb3kob2JqLCBzaG1lbS0+c2d0
KTsNCj4gQEAgLTE1Niw3ICsxNTYsNyBAQCB2b2lkIGRybV9nZW1fc2htZW1fZnJlZShzdHJ1
Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtKQ0KPiAgIAkJCWRybV9nZW1fc2htZW1f
cHV0X3BhZ2VzKHNobWVtKTsNCj4gICAJfQ0KPiAgIA0KPiAtCVdBUk5fT04oc2htZW0tPnBh
Z2VzX3VzZV9jb3VudCk7DQo+ICsJZHJtX1dBUk5fT04ob2JqLT5kZXYsIHNobWVtLT5wYWdl
c191c2VfY291bnQpOw0KPiAgIA0KPiAgIAlkcm1fZ2VtX29iamVjdF9yZWxlYXNlKG9iaik7
DQo+ICAgCW11dGV4X2Rlc3Ryb3koJnNobWVtLT5wYWdlc19sb2NrKTsNCj4gQEAgLTE3NSw3
ICsxNzUsOCBAQCBzdGF0aWMgaW50IGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzX2xvY2tlZChz
dHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtKQ0KPiAgIA0KPiAgIAlwYWdlcyA9
IGRybV9nZW1fZ2V0X3BhZ2VzKG9iaik7DQo+ICAgCWlmIChJU19FUlIocGFnZXMpKSB7DQo+
IC0JCURSTV9ERUJVR19LTVMoIkZhaWxlZCB0byBnZXQgcGFnZXMgKCVsZClcbiIsIFBUUl9F
UlIocGFnZXMpKTsNCj4gKwkJZHJtX2RiZ19rbXMob2JqLT5kZXYsICJGYWlsZWQgdG8gZ2V0
IHBhZ2VzICglbGQpXG4iLA0KPiArCQkJICAgIFBUUl9FUlIocGFnZXMpKTsNCj4gICAJCXNo
bWVtLT5wYWdlc191c2VfY291bnQgPSAwOw0KPiAgIAkJcmV0dXJuIFBUUl9FUlIocGFnZXMp
Ow0KPiAgIAl9DQo+IEBAIC0yMDcsOSArMjA4LDEwIEBAIHN0YXRpYyBpbnQgZHJtX2dlbV9z
aG1lbV9nZXRfcGFnZXNfbG9ja2VkKHN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2ht
ZW0pDQo+ICAgICovDQo+ICAgaW50IGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzKHN0cnVjdCBk
cm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0pDQo+ICAgew0KPiArCXN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqID0gJnNobWVtLT5iYXNlOw0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0KPiAt
CVdBUk5fT04oc2htZW0tPmJhc2UuaW1wb3J0X2F0dGFjaCk7DQo+ICsJZHJtX1dBUk5fT04o
b2JqLT5kZXYsIG9iai0+aW1wb3J0X2F0dGFjaCk7DQo+ICAgDQo+ICAgCXJldCA9IG11dGV4
X2xvY2tfaW50ZXJydXB0aWJsZSgmc2htZW0tPnBhZ2VzX2xvY2spOw0KPiAgIAlpZiAocmV0
KQ0KPiBAQCAtMjI1LDcgKzIyNyw3IEBAIHN0YXRpYyB2b2lkIGRybV9nZW1fc2htZW1fcHV0
X3BhZ2VzX2xvY2tlZChzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtKQ0KPiAg
IHsNCj4gICAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSAmc2htZW0tPmJhc2U7DQo+
ICAgDQo+IC0JaWYgKFdBUk5fT05fT05DRSghc2htZW0tPnBhZ2VzX3VzZV9jb3VudCkpDQo+
ICsJaWYgKGRybV9XQVJOX09OX09OQ0Uob2JqLT5kZXYsICFzaG1lbS0+cGFnZXNfdXNlX2Nv
dW50KSkNCj4gICAJCXJldHVybjsNCj4gICANCj4gICAJaWYgKC0tc2htZW0tPnBhZ2VzX3Vz
ZV9jb3VudCA+IDApDQo+IEBAIC0yNjgsNyArMjcwLDkgQEAgRVhQT1JUX1NZTUJPTChkcm1f
Z2VtX3NobWVtX3B1dF9wYWdlcyk7DQo+ICAgICovDQo+ICAgaW50IGRybV9nZW1fc2htZW1f
cGluKHN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0pDQo+ICAgew0KPiAtCVdB
Uk5fT04oc2htZW0tPmJhc2UuaW1wb3J0X2F0dGFjaCk7DQo+ICsJc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmogPSAmc2htZW0tPmJhc2U7DQo+ICsNCj4gKwlkcm1fV0FSTl9PTihvYmot
PmRldiwgb2JqLT5pbXBvcnRfYXR0YWNoKTsNCj4gICANCj4gICAJcmV0dXJuIGRybV9nZW1f
c2htZW1fZ2V0X3BhZ2VzKHNobWVtKTsNCj4gICB9DQo+IEBAIC0yODMsNyArMjg3LDkgQEAg
RVhQT1JUX1NZTUJPTChkcm1fZ2VtX3NobWVtX3Bpbik7DQo+ICAgICovDQo+ICAgdm9pZCBk
cm1fZ2VtX3NobWVtX3VucGluKHN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0p
DQo+ICAgew0KPiAtCVdBUk5fT04oc2htZW0tPmJhc2UuaW1wb3J0X2F0dGFjaCk7DQo+ICsJ
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSAmc2htZW0tPmJhc2U7DQo+ICsNCj4gKwlk
cm1fV0FSTl9PTihvYmotPmRldiwgb2JqLT5pbXBvcnRfYXR0YWNoKTsNCj4gICANCj4gICAJ
ZHJtX2dlbV9zaG1lbV9wdXRfcGFnZXMoc2htZW0pOw0KPiAgIH0NCj4gQEAgLTMwMyw3ICsz
MDksNyBAQCBzdGF0aWMgaW50IGRybV9nZW1fc2htZW1fdm1hcF9sb2NrZWQoc3RydWN0IGRy
bV9nZW1fc2htZW1fb2JqZWN0ICpzaG1lbSwNCj4gICAJaWYgKG9iai0+aW1wb3J0X2F0dGFj
aCkgew0KPiAgIAkJcmV0ID0gZG1hX2J1Zl92bWFwKG9iai0+aW1wb3J0X2F0dGFjaC0+ZG1h
YnVmLCBtYXApOw0KPiAgIAkJaWYgKCFyZXQpIHsNCj4gLQkJCWlmIChXQVJOX09OKG1hcC0+
aXNfaW9tZW0pKSB7DQo+ICsJCQlpZiAoZHJtX1dBUk5fT04ob2JqLT5kZXYsIG1hcC0+aXNf
aW9tZW0pKSB7DQo+ICAgCQkJCWRtYV9idWZfdnVubWFwKG9iai0+aW1wb3J0X2F0dGFjaC0+
ZG1hYnVmLCBtYXApOw0KPiAgIAkJCQlyZXQgPSAtRUlPOw0KPiAgIAkJCQlnb3RvIGVycl9w
dXRfcGFnZXM7DQo+IEBAIC0zMjgsNyArMzM0LDcgQEAgc3RhdGljIGludCBkcm1fZ2VtX3No
bWVtX3ZtYXBfbG9ja2VkKHN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0sDQo+
ICAgCX0NCj4gICANCj4gICAJaWYgKHJldCkgew0KPiAtCQlEUk1fREVCVUdfS01TKCJGYWls
ZWQgdG8gdm1hcCBwYWdlcywgZXJyb3IgJWRcbiIsIHJldCk7DQo+ICsJCWRybV9kYmdfa21z
KG9iai0+ZGV2LCAiRmFpbGVkIHRvIHZtYXAgcGFnZXMsIGVycm9yICVkXG4iLCByZXQpOw0K
PiAgIAkJZ290byBlcnJfcHV0X3BhZ2VzOw0KPiAgIAl9DQo+ICAgDQo+IEBAIC0zNzgsNyAr
Mzg0LDcgQEAgc3RhdGljIHZvaWQgZHJtX2dlbV9zaG1lbV92dW5tYXBfbG9ja2VkKHN0cnVj
dCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0sDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaiA9ICZzaG1lbS0+YmFzZTsNCj4gICANCj4gLQlpZiAoV0FSTl9P
Tl9PTkNFKCFzaG1lbS0+dm1hcF91c2VfY291bnQpKQ0KPiArCWlmIChkcm1fV0FSTl9PTl9P
TkNFKG9iai0+ZGV2LCAhc2htZW0tPnZtYXBfdXNlX2NvdW50KSkNCj4gICAJCXJldHVybjsN
Cj4gICANCj4gICAJaWYgKC0tc2htZW0tPnZtYXBfdXNlX2NvdW50ID4gMCkNCj4gQEAgLTQ2
Myw3ICs0NjksNyBAQCB2b2lkIGRybV9nZW1fc2htZW1fcHVyZ2VfbG9ja2VkKHN0cnVjdCBk
cm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0pDQo+ICAgCXN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqID0gJnNobWVtLT5iYXNlOw0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0g
b2JqLT5kZXY7DQo+ICAgDQo+IC0JV0FSTl9PTighZHJtX2dlbV9zaG1lbV9pc19wdXJnZWFi
bGUoc2htZW0pKTsNCj4gKwlkcm1fV0FSTl9PTihvYmotPmRldiwgIWRybV9nZW1fc2htZW1f
aXNfcHVyZ2VhYmxlKHNobWVtKSk7DQo+ICAgDQo+ICAgCWRtYV91bm1hcF9zZ3RhYmxlKGRl
di0+ZGV2LCBzaG1lbS0+c2d0LCBETUFfQklESVJFQ1RJT05BTCwgMCk7DQo+ICAgCXNnX2Zy
ZWVfdGFibGUoc2htZW0tPnNndCk7DQo+IEBAIC01NTUsNyArNTYxLDcgQEAgc3RhdGljIHZt
X2ZhdWx0X3QgZHJtX2dlbV9zaG1lbV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikNCj4g
ICAJbXV0ZXhfbG9jaygmc2htZW0tPnBhZ2VzX2xvY2spOw0KPiAgIA0KPiAgIAlpZiAocGFn
ZV9vZmZzZXQgPj0gbnVtX3BhZ2VzIHx8DQo+IC0JICAgIFdBUk5fT05fT05DRSghc2htZW0t
PnBhZ2VzKSB8fA0KPiArCSAgICBkcm1fV0FSTl9PTl9PTkNFKG9iai0+ZGV2LCAhc2htZW0t
PnBhZ2VzKSB8fA0KPiAgIAkgICAgc2htZW0tPm1hZHYgPCAwKSB7DQo+ICAgCQlyZXQgPSBW
TV9GQVVMVF9TSUdCVVM7DQo+ICAgCX0gZWxzZSB7DQo+IEBAIC01NzQsNyArNTgwLDcgQEAg
c3RhdGljIHZvaWQgZHJtX2dlbV9zaG1lbV92bV9vcGVuKHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKQ0KPiAgIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9IHZtYS0+dm1fcHJp
dmF0ZV9kYXRhOw0KPiAgIAlzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtID0g
dG9fZHJtX2dlbV9zaG1lbV9vYmoob2JqKTsNCj4gICANCj4gLQlXQVJOX09OKHNobWVtLT5i
YXNlLmltcG9ydF9hdHRhY2gpOw0KPiArCWRybV9XQVJOX09OKG9iai0+ZGV2LCBvYmotPmlt
cG9ydF9hdHRhY2gpOw0KPiAgIA0KPiAgIAltdXRleF9sb2NrKCZzaG1lbS0+cGFnZXNfbG9j
ayk7DQo+ICAgDQo+IEBAIC01ODMsNyArNTg5LDcgQEAgc3RhdGljIHZvaWQgZHJtX2dlbV9z
aG1lbV92bV9vcGVuKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPiAgIAkgKiBtbWFw
J2QsIHZtX29wZW4oKSBqdXN0IGdyYWJzIGFuIGFkZGl0aW9uYWwgcmVmZXJlbmNlIGZvciB0
aGUgbmV3DQo+ICAgCSAqIG1tIHRoZSB2bWEgaXMgZ2V0dGluZyBjb3BpZWQgaW50byAoaWUu
IG9uIGZvcmsoKSkuDQo+ICAgCSAqLw0KPiAtCWlmICghV0FSTl9PTl9PTkNFKCFzaG1lbS0+
cGFnZXNfdXNlX2NvdW50KSkNCj4gKwlpZiAoIWRybV9XQVJOX09OX09OQ0Uob2JqLT5kZXYs
ICFzaG1lbS0+cGFnZXNfdXNlX2NvdW50KSkNCj4gICAJCXNobWVtLT5wYWdlc191c2VfY291
bnQrKzsNCj4gICANCj4gICAJbXV0ZXhfdW5sb2NrKCZzaG1lbS0+cGFnZXNfbG9jayk7DQo+
IEBAIC02NzcsNyArNjgzLDcgQEAgc3RydWN0IHNnX3RhYmxlICpkcm1fZ2VtX3NobWVtX2dl
dF9zZ190YWJsZShzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtKQ0KPiAgIHsN
Cj4gICAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSAmc2htZW0tPmJhc2U7DQo+ICAg
DQo+IC0JV0FSTl9PTihzaG1lbS0+YmFzZS5pbXBvcnRfYXR0YWNoKTsNCj4gKwlkcm1fV0FS
Tl9PTihvYmotPmRldiwgb2JqLT5pbXBvcnRfYXR0YWNoKTsNCj4gICANCj4gICAJcmV0dXJu
IGRybV9wcmltZV9wYWdlc190b19zZyhvYmotPmRldiwgc2htZW0tPnBhZ2VzLCBvYmotPnNp
emUgPj4gUEFHRV9TSElGVCk7DQo+ICAgfQ0KPiBAQCAtNzA4LDcgKzcxNCw3IEBAIHN0cnVj
dCBzZ190YWJsZSAqZHJtX2dlbV9zaG1lbV9nZXRfcGFnZXNfc2d0KHN0cnVjdCBkcm1fZ2Vt
X3NobWVtX29iamVjdCAqc2htZW0pDQo+ICAgCWlmIChzaG1lbS0+c2d0KQ0KPiAgIAkJcmV0
dXJuIHNobWVtLT5zZ3Q7DQo+ICAgDQo+IC0JV0FSTl9PTihvYmotPmltcG9ydF9hdHRhY2gp
Ow0KPiArCWRybV9XQVJOX09OKG9iai0+ZGV2LCBvYmotPmltcG9ydF9hdHRhY2gpOw0KPiAg
IA0KPiAgIAlyZXQgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlcyhzaG1lbSk7DQo+ICAgCWlm
IChyZXQpDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------VAaKY3Kb0f9rBXPZnVL0qNvW--

--------------80Pt9bKHSt0abgr9F0qb2PKU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPvcv8FAwAAAAAACgkQlh/E3EQov+DJ
vQ//dgmshG7YQOREMiEkjYq9+LM3I0yJfXz0YzNc3SBS8Ufjt7kL4EBrj53YxIhyLiyMNws0SKjb
R8x7yqByD4vUbVYrr8KGboILYsuYrhzwlpM56fXvc8GPxAE/LsRmUOPtRq438KI61PWnG1FehOWG
uRlqrrmflpVCWzrR9CqSUv8mtw0fV9sKITeGnkhjjkxpq4au4nKKMJj7WAlny9zf+89hxGkv6UHg
32MDmgFwBO/T6ak6zNGNcCkJGGKKMV83j7cFpUpivvTOjwqwYgxoONVwd/LsaM4aha4OMo1BUWvf
OXsnjSPCmOacB50/E3d4KGECsLzsnzpvDpzCj1+o/R/1S4o3//sdyCC/IRGZTs4K30OvdR6gDs+E
1ejZzXYfar9ErxACtgZkTb+rJjUG+NNzbSb/Sqa1I0PJLsE9k6EB/PFdtBsiVRLk1ADiC5znGydm
Cd0IVSAxSzrD5dhRGuNtCfhZqcvpZxGHxsnu/iEnI7tiX/c0aL1uUIpcocOIhzBARxOj8fqWDeRc
Br5buG9K0answ0xQ5cxGZhU9CXfgFWZgAsSyQVU8yOw8r5fAe2CGRwhPiGh3D4JAlG82iNgPm/je
ZIDkPoXs8FmE6iEC4D1aVENALvDNEVdjgJE+DXTMuzj2R+dlGWEU9GCyPVuG/6LtqMSOOktLQ1kV
dHc=
=K7zj
-----END PGP SIGNATURE-----

--------------80Pt9bKHSt0abgr9F0qb2PKU--
