Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDCE7DDD93
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 09:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD5210E64B;
	Wed,  1 Nov 2023 08:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600B110E64B;
 Wed,  1 Nov 2023 08:11:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 132651F74D;
 Wed,  1 Nov 2023 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698826286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Rh4i1hiZh67Sa/Q2JsxafMYc9VdoEU16wpMmd8VAWaY=;
 b=YufWOyNmwa8rZblN5bgg7zBtK5oF7N/L64D3EeO9Sek0v4Bpim9gqQN4OqnfwTlqGtBk2i
 Cx9A9rERK0U6l6slQM4XZccfa0d8418E/aiXxNz4dzN1g6TnnNKykJk3KHou6J9XfSzj29
 z6Rh5wGYYncr17MxXeszRfr69YK9Ljg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698826286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Rh4i1hiZh67Sa/Q2JsxafMYc9VdoEU16wpMmd8VAWaY=;
 b=CxHou2KXGepKyz9DdkzZm+tPS+pvqaQY1NmP31nRtFK4jKnvx9QAoyD/BmWzyy0PLp7Vx3
 vJgs8CNJNIzugSBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A194D1348D;
 Wed,  1 Nov 2023 08:11:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MNx1JS0IQmUvZAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Nov 2023 08:11:25 +0000
Message-ID: <58a56618-318d-466e-afa0-0c3b1016a3ef@suse.de>
Date: Wed, 1 Nov 2023 09:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915: Initialize fbdev DRM client
 with callback functions
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Deak, Imre" <imre.deak@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20230927102808.18650-1-tzimmermann@suse.de>
 <20230927102808.18650-6-tzimmermann@suse.de>
 <62b2e622370df7557ea7d98ea65eaf2c5a09bb6e.camel@intel.com>
Content-Language: en-US
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
In-Reply-To: <62b2e622370df7557ea7d98ea65eaf2c5a09bb6e.camel@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4Kviev95cPpPlM29j1qwJk56"
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4Kviev95cPpPlM29j1qwJk56
Content-Type: multipart/mixed; boundary="------------e0qSMdCYfykkml0qMRGDA6LM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Deak, Imre" <imre.deak@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Message-ID: <58a56618-318d-466e-afa0-0c3b1016a3ef@suse.de>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915: Initialize fbdev DRM client
 with callback functions
References: <20230927102808.18650-1-tzimmermann@suse.de>
 <20230927102808.18650-6-tzimmermann@suse.de>
 <62b2e622370df7557ea7d98ea65eaf2c5a09bb6e.camel@intel.com>
In-Reply-To: <62b2e622370df7557ea7d98ea65eaf2c5a09bb6e.camel@intel.com>

--------------e0qSMdCYfykkml0qMRGDA6LM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMTAuMjMgdW0gMTA6MzYgc2NocmllYiBIb2dhbmRlciwgSm91bmk6DQo+
IEhpIFRob21hcywgT25lIG1pbm9yIGNvbW1lbnQgaW5saW5lIGJlbG93Lg0KDQpUaGFuayB5
b3Ugc28gbXVjaCBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldmlldyB0aGVzZSBwYXRjaGVz
Lg0KDQo+IA0KPiBPbiBXZWQsIDIwMjMtMDktMjcgYXQgMTI6MjYgKzAyMDAsIFRob21hcyBa
aW1tZXJtYW5uIHdyb3RlOg0KPj4gSW5pdGlhbGl6ZSBpOTE1J3MgZmJkZXYgY2xpZW50IGJ5
IGdpdmluZyBhbiBpbnN0YW5jZSBvZiBzdHJ1Y3QNCj4+IGRybV9jbGllbnRfZnVuY3MgdG8g
ZHJtX2NsaWVudF9pbml0KCkuIEFsc28gY2xlYW4gdXAgd2l0aA0KPj4gZHJtX2NsaWVudF9y
ZWxlYXNlKCkuDQo+Pg0KPj4gRG9pbmcgdGhpcyBpbiBpOTE1IHByZXZlbnRzIGZiZGV2IGhl
bHBlcnMgZnJvbSBpbml0aWFsaXppbmcgYW5kDQo+PiByZWxlYXNpbmcgdGhlIGNsaWVudCBp
bnRlcm5hbGx5IChzZWUgZHJtX2ZiX2hlbHBlcl9pbml0KCkpLiBObw0KPj4gZnVuY3Rpb25h
bCBjaGFuZ2UgeWV0OyB0aGUgY2xpZW50IGNhbGxiYWNrcyB3aWxsIGJlIGZpbGxlZCBsYXRl
ci4NCj4+DQo+PiB2MjoNCj4+ICDCoMKgwqDCoMKgwqDCoMKgKiBjYWxsIGRybV9mYl9oZWxw
ZXJfdW5wcmVwYXJlKCkgaW4gZXJyb3IgaGFuZGxpbmcgKEphbmkpDQo+PiAgwqDCoMKgwqDC
oMKgwqDCoCogZml4IHR5cG8gaW4gY29tbWl0IG1lc3NhZ2UgKFNhbSkNCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+
IC0tLQ0KPj4gIMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5j
IHwgNDMNCj4+ICsrKysrKysrKysrKysrKysrKysrLS0NCj4+ICDCoDEgZmlsZSBjaGFuZ2Vk
LCAzOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMNCj4+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5jDQo+PiBpbmRleCAyNjk1
YzY1YjU1ZGRjLi5kOWU2OTQ3MWE3ODJhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMNCj4+IEBAIC0zNzgsNiArMzc4LDcgQEAg
c3RhdGljIHZvaWQgaW50ZWxfZmJkZXZfZGVzdHJveShzdHJ1Y3QNCj4+IGludGVsX2ZiZGV2
ICppZmJkZXYpDQo+PiAgwqDCoMKgwqDCoMKgwqDCoGlmIChpZmJkZXYtPmZiKQ0KPj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2ZyYW1lYnVmZmVyX3JlbW92ZSgm
aWZiZGV2LT5mYi0+YmFzZSk7DQo+PiAgIA0KPj4gK8KgwqDCoMKgwqDCoMKgZHJtX2NsaWVu
dF9yZWxlYXNlKCZpZmJkZXYtPmhlbHBlci5jbGllbnQpOw0KPj4gIMKgwqDCoMKgwqDCoMKg
wqBkcm1fZmJfaGVscGVyX3VucHJlcGFyZSgmaWZiZGV2LT5oZWxwZXIpOw0KPj4gIMKgwqDC
oMKgwqDCoMKgwqBrZnJlZShpZmJkZXYpOw0KPj4gIMKgfQ0KPj4gQEAgLTY3MSw2ICs2NzIs
MzAgQEAgdm9pZCBpbnRlbF9mYmRldl9yZXN0b3JlX21vZGUoc3RydWN0DQo+PiBkcm1faTkx
NV9wcml2YXRlICpkZXZfcHJpdikNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGludGVsX2ZiZGV2X2ludmFsaWRhdGUoaWZiZGV2KTsNCj4+ICDCoH0NCj4+ICAgDQo+
PiArLyoNCj4+ICsgKiBGYmRldiBjbGllbnQgYW5kIHN0cnVjdCBkcm1fY2xpZW50X2Z1bmNz
DQo+PiArICovDQo+PiArDQo+PiArc3RhdGljIHZvaWQgaW50ZWxfZmJkZXZfY2xpZW50X3Vu
cmVnaXN0ZXIoc3RydWN0IGRybV9jbGllbnRfZGV2DQo+PiAqY2xpZW50KQ0KPj4gK3sgfQ0K
Pj4gKw0KPj4gK3N0YXRpYyBpbnQgaW50ZWxfZmJkZXZfY2xpZW50X3Jlc3RvcmUoc3RydWN0
IGRybV9jbGllbnRfZGV2ICpjbGllbnQpDQo+PiArew0KPj4gK8KgwqDCoMKgwqDCoMKgcmV0
dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgaW50ZWxfZmJkZXZfY2xpZW50
X2hvdHBsdWcoc3RydWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQpDQo+PiArew0KPj4gK8Kg
wqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2NsaWVudF9mdW5jcyBpbnRlbF9mYmRldl9jbGllbnRfZnVuY3MgPSB7DQo+
PiArwqDCoMKgwqDCoMKgwqAub3duZXLCoMKgwqDCoMKgwqDCoMKgwqDCoD0gVEhJU19NT0RV
TEUsDQo+PiArwqDCoMKgwqDCoMKgwqAudW5yZWdpc3RlcsKgwqDCoMKgwqA9IGludGVsX2Zi
ZGV2X2NsaWVudF91bnJlZ2lzdGVyLA0KPj4gK8KgwqDCoMKgwqDCoMKgLnJlc3RvcmXCoMKg
wqDCoMKgwqDCoMKgPSBpbnRlbF9mYmRldl9jbGllbnRfcmVzdG9yZSwNCj4+ICvCoMKgwqDC
oMKgwqDCoC5ob3RwbHVnwqDCoMKgwqDCoMKgwqDCoD0gaW50ZWxfZmJkZXZfY2xpZW50X2hv
dHBsdWcsDQo+PiArfTsNCj4+ICsNCj4+ICDCoGludCBpbnRlbF9mYmRldl9pbml0KHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpDQo+PiAgwqB7DQo+PiAgwqDCoMKgwqDCoMKgwqDCoHN0cnVj
dCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoZGV2KTsNCj4+IEBAIC02
OTIsMTYgKzcxNywyNiBAQCBpbnQgaW50ZWxfZmJkZXZfaW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KQ0KPj4gIMKgwqDCoMKgwqDCoMKgwqBlbHNlDQo+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpZmJkZXYtPnByZWZlcnJlZF9icHAgPSBpZmJkZXYtPmhlbHBl
ci5wcmVmZXJyZWRfYnBwOw0KPj4gICANCj4+ICvCoMKgwqDCoMKgwqDCoHJldCA9IGRybV9j
bGllbnRfaW5pdChkZXYsICZpZmJkZXYtPmhlbHBlci5jbGllbnQsICJpOTE1LQ0KPj4gZmJk
ZXYiLA0KPiANCj4gV2UgYXJlIGN1cnJlbnRseSB3b3JraW5nIG9uIG5ldyBkcml2ZXIgbmFt
ZWQgYXMgWGUuIER1ZSB0byB0aGlzIGl0DQoNCkkndmUgYWx3YXlzIHRob3VnaHQgdGhhdCBp
dCdzIGFuIGVudGlyZWx5IG5ldyBkcml2ZXIuIEJ1dCBJJ20gbm90IHJlYWxseSANCnVwLXRv
LWRhdGUuIFNvIHRoZSBYZSBkcml2ZXIgaXMgbG9jYXRlZCB1bmRlciBpOTE1LyBhbmQgYWxz
byBzaGFyZXMgY29kZSANCndpdGggdGhlIGV4aXN0aW5nIGk5MTUgZHJpdmVyPw0KDQo+IG1p
Z2h0IGFjdHVhbGx5IG1ha2Ugc2Vuc2UgdG8gdXNlIGludGVsLWZiZGV2IGhlcmUgcmF0aGVy
IHRoYW4gaTkxNS0NCj4gZmJkZXYuDQoNClRoYXQgY2hhbmdlIGNvdWxkIGJyZWFrIHVzZXIt
c3BhY2UgcHJvZ3JhbXMuIFNlZSB0aGUgY29tbWVudCBhdCBbMV0gYW5kIA0KdGhlIGNvbW1p
dCA4NDI0NzBjNGUyMTEgKCJSZXZlcnQgImRybS9mYi1oZWxwZXI6IGltcHJvdmUgRFJNIGZi
ZGV2IA0KZW11bGF0aW9uIGRldmljZSBuYW1lcyIiKS4gIEknZCByYXRoZXIgbGVhdmUgdGhl
IHN0cmluZyBhcyBpdCBpcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNi9zb3VyY2UvZHJpdmVycy9ncHUv
ZHJtL2RybV9mYl9oZWxwZXIuYyNMMTc1NQ0KDQo+IA0KPiBCUiwNCj4gDQo+IEpvdW5pIEjD
tmdhbmRlcg0KPiANCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAmaW50ZWxfZmJkZXZfY2xpZW50X2Z1bmNzKTsNCj4+ICvC
oMKgwqDCoMKgwqDCoGlmIChyZXQpDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZ290byBlcnJfZHJtX2ZiX2hlbHBlcl91bnByZXBhcmU7DQo+PiArDQo+PiAgwqDCoMKg
wqDCoMKgwqDCoHJldCA9IGRybV9mYl9oZWxwZXJfaW5pdChkZXYsICZpZmJkZXYtPmhlbHBl
cik7DQo+PiAtwqDCoMKgwqDCoMKgwqBpZiAocmV0KSB7DQo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKga2ZyZWUoaWZiZGV2KTsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPj4gLcKgwqDCoMKgwqDCoMKgfQ0KPj4gK8KgwqDC
oMKgwqDCoMKgaWYgKHJldCkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBn
b3RvIGVycl9kcm1fY2xpZW50X3JlbGVhc2U7DQo+PiAgIA0KPj4gIMKgwqDCoMKgwqDCoMKg
wqBkZXZfcHJpdi0+ZGlzcGxheS5mYmRldi5mYmRldiA9IGlmYmRldjsNCj4+ICDCoMKgwqDC
oMKgwqDCoMKgSU5JVF9XT1JLKCZkZXZfcHJpdi0+ZGlzcGxheS5mYmRldi5zdXNwZW5kX3dv
cmssDQo+PiBpbnRlbF9mYmRldl9zdXNwZW5kX3dvcmtlcik7DQo+PiAgIA0KPj4gIMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gMDsNCj4+ICsNCj4+ICtlcnJfZHJtX2NsaWVudF9yZWxlYXNl
Og0KPj4gK8KgwqDCoMKgwqDCoMKgZHJtX2NsaWVudF9yZWxlYXNlKCZpZmJkZXYtPmhlbHBl
ci5jbGllbnQpOw0KPj4gK2Vycl9kcm1fZmJfaGVscGVyX3VucHJlcGFyZToNCj4+ICvCoMKg
wqDCoMKgwqDCoGRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKCZpZmJkZXYtPmhlbHBlcik7DQo+
PiArwqDCoMKgwqDCoMKgwqBrZnJlZShpZmJkZXYpOw0KPj4gK8KgwqDCoMKgwqDCoMKgcmV0
dXJuIHJldDsNCj4+ICDCoH0NCj4+ICAgDQo+PiAgwqBzdGF0aWMgdm9pZCBpbnRlbF9mYmRl
dl9pbml0aWFsX2NvbmZpZyh2b2lkICpkYXRhLCBhc3luY19jb29raWVfdA0KPj4gY29va2ll
KQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3Ry
YXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5k
cmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5
IChBRyBOdWVybmJlcmcpDQo=

--------------e0qSMdCYfykkml0qMRGDA6LM--

--------------4Kviev95cPpPlM29j1qwJk56
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVCCC0FAwAAAAAACgkQlh/E3EQov+BP
gRAAg81/Xtq6HHa6X3rcLdtFZtwwcLG4Dkrp3AuXP8yn+reomGG2y1EQ3DUovBKHjoMhy1pkwBZ1
Sn8QTxkOXIGqf1ebDtiAPzMubdEENc/UcL2Mlk8d8dKRx8oGsz2emhgsa8kBKpOjRVDM5+WR4+A0
SdOEjmQz+N9sGlNvbujpcalOtT4q83ZQ66mAqYnMC/M3PVDmwQP3PmcgpmSXt8YNs6NFNUS/ZjPt
/qWJ0C2fO3px/0NSZK/SbaKpgUBzyK7AN93NmxMVVj3C8AvFB9wFv3fIXTT4ROEu9CqkWXMkFvBO
U1EoU0iT42yp//otojaprL5TVkQLDvmuk9i1l+FCn4l4JgQ38c6KvvDxjchC7HXpJklqcYAkFYfC
ecUrhtZWkSBqby1aamepsrc8rHNxdLIN8wGv0wWQh+WtIvpVgSlKL5FQTO2vSgdZzIMuAL3ermAP
N463s6fgIi+UsQYIWCQAa9QoPITSDlSIwJ/PhXo3RB8dHckolveBtmFzb5NbZVuxmtO+Cer4Qz4l
pT4oxEgpRvNQNKqDRgV15p/i6uRQnhH1DoGU05qjZPM/t3qbi2pChChvfeMRQxjn2kK74BPMuZC9
KTpoe4+ADmgL38ldehwaZHUnEDGoe9ZBZAgMH+y/YKtWGMltxuDjO8QAMudOmQ533K7nW9psxJ1N
NyQ=
=xC+y
-----END PGP SIGNATURE-----

--------------4Kviev95cPpPlM29j1qwJk56--
