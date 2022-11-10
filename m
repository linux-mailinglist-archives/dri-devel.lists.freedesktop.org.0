Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A625E623E0F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD95E10E0DC;
	Thu, 10 Nov 2022 08:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DF810E0DC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 08:55:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 53C282015D;
 Thu, 10 Nov 2022 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668070535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UrYORbb/2EGM8TKY6i8vkgmqI8qlKIOPW4j/QJZtm/c=;
 b=gqwBsmCIZdDSjdReT8YRaS9pesOZFg/26yhH5tzthQyv++GeCkLR64K+3wFjVDvyF/19TM
 t7VK4pec9wGumkwjhSxaBvRBI42VjssgnzDKGVsT8KW21Y005qQiq4Ku1MBLIt/f3Xew2q
 J4vshkwUWYMtMt2bnUsf+jPcF4gEVSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668070535;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UrYORbb/2EGM8TKY6i8vkgmqI8qlKIOPW4j/QJZtm/c=;
 b=Tkwl05EEIDknsMTrFPAw/Each/jJOrjVzFXkrNCbswBLSQP5i/jmUj4dHp+gU8Rx8Vb6lF
 9e0ntPrMxLX4vqAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C25FB1346E;
 Thu, 10 Nov 2022 08:55:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xSQdLoa8bGNOUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Nov 2022 08:55:34 +0000
Message-ID: <93359ffb-4f88-408f-054b-879b88e09326@suse.de>
Date: Thu, 10 Nov 2022 09:55:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 2/7] drm/shmem-helper: Don't use vmap_use_count for
 dma-bufs
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
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
References: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
 <20221105232719.302619-3-dmitry.osipenko@collabora.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221105232719.302619-3-dmitry.osipenko@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------INGHqK60cD0J6bcyRsgC8CTQ"
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------INGHqK60cD0J6bcyRsgC8CTQ
Content-Type: multipart/mixed; boundary="------------i0b0biUqckSAOl60Afi3uhi9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
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
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org
Message-ID: <93359ffb-4f88-408f-054b-879b88e09326@suse.de>
Subject: Re: [PATCH v8 2/7] drm/shmem-helper: Don't use vmap_use_count for
 dma-bufs
References: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
 <20221105232719.302619-3-dmitry.osipenko@collabora.com>
In-Reply-To: <20221105232719.302619-3-dmitry.osipenko@collabora.com>

--------------i0b0biUqckSAOl60Afi3uhi9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgaGF2ZSBhIGZldyBjb21tZW50cyB0aGF0IGFyZSBub3QgcmVhbGx5IHNvbWV0
aGluZyBmb3IgdGhpcyBwYXRjaC4gSSdsbCANCmNvbW1lbnQgaXQgaGVyZSBhbnl3YXkgdG8g
aGF2ZSB0aGVtIHBvc3RlZC4NCg0KQW0gMDYuMTEuMjIgdW0gMDA6Mjcgc2NocmllYiBEbWl0
cnkgT3NpcGVua286DQo+IERNQS1idWYgY29yZSBoYXMgaXRzIG93biByZWZjb3VudGluZyBv
ZiB2bWFwcywgdXNlIGl0IGluc3RlYWQgb2YgZHJtLXNobWVtDQo+IGNvdW50aW5nLiBUaGlz
IGNoYW5nZSBwcmVwYXJlcyBkcm0tc2htZW0gZm9yIGFkZGl0aW9uIG9mIG1lbW9yeSBzaHJp
bmtlcg0KPiBzdXBwb3J0IHdoZXJlIGRybS1zaG1lbSB3aWxsIHVzZSBhIHNpbmdsZSBkbWEt
YnVmIHJlc2VydmF0aW9uIGxvY2sgZm9yDQo+IGFsbCBvcGVyYXRpb25zIHBlcmZvcm1lZCBv
dmVyIGRtYS1idWZzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxk
bWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCAzNSArKysrKysrKysrKysrKystLS0tLS0t
LS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1l
bV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jDQo+
IGluZGV4IDM1MTM4ZjhhMzc1Yy4uODAxMDMzYjQ4ODkzIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPiBAQCAtMjkzLDI0ICsyOTMsMjIgQEAg
c3RhdGljIGludCBkcm1fZ2VtX3NobWVtX3ZtYXBfbG9ja2VkKHN0cnVjdCBkcm1fZ2VtX3No
bWVtX29iamVjdCAqc2htZW0sDQo+ICAgCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0g
JnNobWVtLT5iYXNlOw0KPiAgIAlpbnQgcmV0ID0gMDsNCj4gICANCj4gLQlpZiAoc2htZW0t
PnZtYXBfdXNlX2NvdW50KysgPiAwKSB7DQo+IC0JCWlvc3lzX21hcF9zZXRfdmFkZHIobWFw
LCBzaG1lbS0+dmFkZHIpOw0KPiAtCQlyZXR1cm4gMDsNCj4gLQl9DQo+IC0NCj4gICAJaWYg
KG9iai0+aW1wb3J0X2F0dGFjaCkgew0KDQpXZSBoYXZlIGEgbnVtYmVyIG9mIHN1Y2ggYnJh
bmNoZXMgaW4gdmFyaW91cyBtZW1vcnkgbWFuYWdlcnMuIEF0IHNvbWUgDQpwb2ludCB3ZSBz
aG91bGQgdGhpbmsgYWJvdXQgc29tZXRoaW5nIGxpa2UgYSBHRU0gRE1BLUJVRiBvYmplY3Qg
KG9yIGF0IA0KbGVhc3Qgc29tZSBoZWxwZXJzKSB0aGF0IHJlcHJlc2VudHMgYW4gaW1wb3J0
ZWQgYnVmZmVyLiBTdWNoIGEgdGluZyANCm1pZ2h0IGJlIHVzZWZ1bCB0byBhdm9pZCB0aGUg
ZHVwbGljYXRpb24gYW5kIGJyYW5jaGluZyB0aGF0J3MgZ29pbmcgb24gDQpoZXJlIGFuZCBp
biBvdGhlciBmdW5jdGlvbnMuDQoNCj4gICAJCXJldCA9IGRtYV9idWZfdm1hcChvYmotPmlt
cG9ydF9hdHRhY2gtPmRtYWJ1ZiwgbWFwKTsNCj4gICAJCWlmICghcmV0KSB7DQo+ICAgCQkJ
aWYgKFdBUk5fT04obWFwLT5pc19pb21lbSkpIHsNCg0KSSB0aGluayBpdCdzIE9LIHRvIGRy
b3AgdGhpcyB0ZXN0IGZvciBpc19pb21lbS4gIEl0IHdhcyB1c2VmdWwgd2hlbiB3ZSANCmRp
ZCBub3QgZGlzdGluZ3Vpc2ggYmV0d2VlbiBJL08gYW5kIHN5c3RlbSBtZW1vcnkgaW4gbW9z
dCBvZiBvdXIgDQpoZWxwZXJzLiBCdXQgdGhhdCBzaG91bGQgaGF2ZSBiZWVuIHJlc29sdmVk
IGJ5IG5vdyBhbmQgd2hhdGV2ZXIgY29kZSANCnN0aWxsIGRlcGVuZHMgb24gaXQgc2hvdWxk
IGJlIHVwZGF0ZWQgYWNjb3JkaW5nbHkuIEFsbCBoZWxwZXJzIHVzZSANCmlvc3lzX21hcCBm
dW5jdGlvbmFsaXR5IHRvIGFjY2VzcyB0aGUgbWVtb3J5Lg0KDQoNCj4gICAJCQkJZG1hX2J1
Zl92dW5tYXAob2JqLT5pbXBvcnRfYXR0YWNoLT5kbWFidWYsIG1hcCk7DQo+IC0JCQkJcmV0
ID0gLUVJTzsNCj4gLQkJCQlnb3RvIGVycl9wdXRfcGFnZXM7DQo+ICsJCQkJcmV0dXJuIC1F
SU87DQo+ICAgCQkJfQ0KPiAtCQkJc2htZW0tPnZhZGRyID0gbWFwLT52YWRkcjsNCg0KVG8g
cmVzb2x2ZSB0aGUgaXNfaW9tYXAgaXNzdWUsIHdlJ2QgaGF2ZSB0byBzdG9yZSB2YWRkciBh
cyBzdHJ1Y3QgDQppb3N5c21fbWFwIHZhbHVlLg0KDQo+ICAgCQl9DQo+ICAgCX0gZWxzZSB7
DQo+ICAgCQlwZ3Byb3RfdCBwcm90ID0gUEFHRV9LRVJORUw7DQo+ICAgDQo+ICsJCWlmIChz
aG1lbS0+dm1hcF91c2VfY291bnQrKyA+IDApIHsNCj4gKwkJCWlvc3lzX21hcF9zZXRfdmFk
ZHIobWFwLCBzaG1lbS0+dmFkZHIpOw0KPiArCQkJcmV0dXJuIDA7DQo+ICsJCX0NCj4gKw0K
PiAgIAkJcmV0ID0gZHJtX2dlbV9zaG1lbV9nZXRfcGFnZXMoc2htZW0pOw0KPiAgIAkJaWYg
KHJldCkNCj4gICAJCQlnb3RvIGVycl96ZXJvX3VzZTsNCj4gQEAgLTM3NiwxNSArMzc0LDE1
IEBAIHN0YXRpYyB2b2lkIGRybV9nZW1fc2htZW1fdnVubWFwX2xvY2tlZChzdHJ1Y3QgZHJt
X2dlbV9zaG1lbV9vYmplY3QgKnNobWVtLA0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmogPSAmc2htZW0tPmJhc2U7DQo+ICAgDQo+IC0JaWYgKFdBUk5fT05fT05D
RSghc2htZW0tPnZtYXBfdXNlX2NvdW50KSkNCj4gLQkJcmV0dXJuOw0KPiAtDQo+IC0JaWYg
KC0tc2htZW0tPnZtYXBfdXNlX2NvdW50ID4gMCkNCj4gLQkJcmV0dXJuOw0KPiAtDQo+ICAg
CWlmIChvYmotPmltcG9ydF9hdHRhY2gpIHsNCj4gICAJCWRtYV9idWZfdnVubWFwKG9iai0+
aW1wb3J0X2F0dGFjaC0+ZG1hYnVmLCBtYXApOw0KPiAgIAl9IGVsc2Ugew0KPiArCQlpZiAo
V0FSTl9PTl9PTkNFKCFzaG1lbS0+dm1hcF91c2VfY291bnQpKQ0KPiArCQkJcmV0dXJuOw0K
PiArDQo+ICsJCWlmICgtLXNobWVtLT52bWFwX3VzZV9jb3VudCA+IDApDQo+ICsJCQlyZXR1
cm47DQo+ICsNCj4gICAJCXZ1bm1hcChzaG1lbS0+dmFkZHIpOw0KPiAgIAkJZHJtX2dlbV9z
aG1lbV9wdXRfcGFnZXMoc2htZW0pOw0KPiAgIAl9DQo+IEBAIC02NDYsNyArNjQ0LDE0IEBA
IHZvaWQgZHJtX2dlbV9zaG1lbV9wcmludF9pbmZvKGNvbnN0IHN0cnVjdCBkcm1fZ2VtX3No
bWVtX29iamVjdCAqc2htZW0sDQo+ICAgCQkJICAgICAgc3RydWN0IGRybV9wcmludGVyICpw
LCB1bnNpZ25lZCBpbnQgaW5kZW50KQ0KPiAgIHsNCj4gICAJZHJtX3ByaW50Zl9pbmRlbnQo
cCwgaW5kZW50LCAicGFnZXNfdXNlX2NvdW50PSV1XG4iLCBzaG1lbS0+cGFnZXNfdXNlX2Nv
dW50KTsNCj4gLQlkcm1fcHJpbnRmX2luZGVudChwLCBpbmRlbnQsICJ2bWFwX3VzZV9jb3Vu
dD0ldVxuIiwgc2htZW0tPnZtYXBfdXNlX2NvdW50KTsNCj4gKw0KPiArCWlmIChzaG1lbS0+
YmFzZS5pbXBvcnRfYXR0YWNoKQ0KPiArCQlkcm1fcHJpbnRmX2luZGVudChwLCBpbmRlbnQs
ICJ2bWFwX3VzZV9jb3VudD0ldVxuIiwNCj4gKwkJCQkgIHNobWVtLT5iYXNlLmRtYV9idWYt
PnZtYXBwaW5nX2NvdW50ZXIpOw0KPiArCWVsc2UNCj4gKwkJZHJtX3ByaW50Zl9pbmRlbnQo
cCwgaW5kZW50LCAidm1hcF91c2VfY291bnQ9JXVcbiIsDQo+ICsJCQkJICBzaG1lbS0+dm1h
cF91c2VfY291bnQpOw0KPiArDQoNCkhlcmUncyBhbm90aGVyIGNhc2Ugd2hlcmUgYSBHRU0g
RE1BLUJVRiBvYmplY3QgbWlnaHQgYmVjb21lIGhlbHBmdWwuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gICAJZHJtX3ByaW50Zl9pbmRlbnQocCwgaW5kZW50LCAidmFkZHI9JXBc
biIsIHNobWVtLT52YWRkcik7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2dlbV9z
aG1lbV9wcmludF9pbmZvKTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------i0b0biUqckSAOl60Afi3uhi9--

--------------INGHqK60cD0J6bcyRsgC8CTQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNsvIYFAwAAAAAACgkQlh/E3EQov+A/
Tw//ZYrBzsRm/a9RnhIlqV27LiVx6btfHf+SNMWYv58P7yaZ6+h2OCa9h0pGWH5GiP9CI3P7TDRf
8ztp1VjJE9z/d4xlFV2eVm+q+T7z/kLVyt50MnNKNM6yUhFFMxx923pBxGrLkTFUqIwIf3kwca+W
kpOp3UQpZGDl6c6dt0SvIC/ek3dtGAMXZD4L6hMA537hsX3w8UEnYWy4UWCk3PH6Ic8y9ywistat
/5dq6ils5evm+j5uInSpTQPexJA6kKi6to5D1fUgrGH+MdX+bsY7+nmB5F6YsJq7IfFGLrH7c7jP
YmwnHvufRFw4ru+AhAJRg6djlxpSno6C4M3XFmcfVMuCpgOJsvJEWXUT/c8qNRGbpNH2xFPrAi9G
rC+8hZ0DFPV0RsYrokewNwan2is3JNXng3hf2Opvu0JaYFBwKrYCs/XO7oQRdgvvycjbGsTGME1J
gd0y/+aHYqcZTO5s8BvbGdcmdBOQnr52ioNmk8rL3VQ4PZlipQIwL0gfVdwhelIPbwBx5+yGmH59
aU/yf7uX2/Rvs9SSZ05EiZU4fntYjo5VHViVRcH82BK3hRII1mbt6I7zYviOM2IYhuUN/yewcD69
ZSBeJJg6v+iGyKiFb0Ym1yrlLok9sJuBiOUUY7uVqZtRKh5xd54Uv2lfhx4DHirfPeoDitrBAU+B
uQ0=
=QSh8
-----END PGP SIGNATURE-----

--------------INGHqK60cD0J6bcyRsgC8CTQ--
