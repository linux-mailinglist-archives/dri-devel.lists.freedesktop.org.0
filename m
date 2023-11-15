Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD9F7EC341
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 14:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B3010E132;
	Wed, 15 Nov 2023 13:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BED310E113;
 Wed, 15 Nov 2023 13:07:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A69DD22901;
 Wed, 15 Nov 2023 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700053638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cx9WarahJ2e2HDTwldvD0pYV1Imb9e6iRd3JiT6CSZo=;
 b=tjz68jUaECQY4GtcHhoI9YiUh42G10b6E4QIZ7/juiMyyk7bUZtYfEiIzsesfJXi3gv8+U
 hKV1ti3FxpUpZUSKkuld8LLj6QAN06sb8OBXFEQsBHCBNtDr6/EIowOwp92CnBrYM8bmXg
 mAVAjs4QrF0POkOl7XIPWsqja2IooxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700053638;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cx9WarahJ2e2HDTwldvD0pYV1Imb9e6iRd3JiT6CSZo=;
 b=4BY/WMVD00YEdnEQGx3iKWqE03V0f8SQS2iUsFj8MR39vy9EOrICg58x9SWskVKOhZiZVu
 t2dAqv4ymdQndEAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F3A413587;
 Wed, 15 Nov 2023 13:07:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id deBHFobCVGUELwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Nov 2023 13:07:18 +0000
Message-ID: <2d3de6cf-45ca-44a0-a62b-251c012d5e51@suse.de>
Date: Wed, 15 Nov 2023 14:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] drm/client: Do not acquire module reference
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20231102131056.7256-1-tzimmermann@suse.de>
 <20231102131056.7256-2-tzimmermann@suse.de>
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
In-Reply-To: <20231102131056.7256-2-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WT9tb4vGifdq5i0VWe4Ew7Ev"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.09
X-Spamd-Result: default: False [-8.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; TO_DN_NONE(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_TWELVE(0.00)[13]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,redhat.com,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WT9tb4vGifdq5i0VWe4Ew7Ev
Content-Type: multipart/mixed; boundary="------------vUqeju5vzuTAI0uDaFLMonwO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <2d3de6cf-45ca-44a0-a62b-251c012d5e51@suse.de>
Subject: Re: [PATCH v6 1/7] drm/client: Do not acquire module reference
References: <20231102131056.7256-1-tzimmermann@suse.de>
 <20231102131056.7256-2-tzimmermann@suse.de>
In-Reply-To: <20231102131056.7256-2-tzimmermann@suse.de>

--------------vUqeju5vzuTAI0uDaFLMonwO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDAyLjExLjIzIHVtIDE0OjA4IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IERvIG5vdCBhY3F1aXJlIGEgcmVmZXJlbmNlIG9uIHRoZSBtb2R1bGUgdGhhdCBwcm92aWRl
cyBhIGNsaWVudCdzDQo+IGNhbGxiYWNrIGZ1bmN0aW9ucyBpbiBkcm1fY2xpZW50X2luaXQo
KS4gVGhlIGFkZGl0aW9uYWwgcmVmZXJlbmNlDQo+IHByZXZlbnRzIHRoZSB1c2VyIGZyb20g
dW5sb2FkaW5nIHRoZSBjYWxsYmFjayBmdW5jdGlvbnMnIG1vZHVsZSBhbmQNCj4gdGh1cyBj
cmVhdGluZyBkYW5nbGluZyBwb2ludGVycy4NCj4gDQo+IFRoaXMgaXMgb25seSBuZWNlc3Nh
cnkgaWYgdGhlcmUgaXMgbm8gZGlyZWN0IGRlcGVuZGVuY3kgYmV0d2VlbiB0aGUNCj4gY2Fs
bGVyIG9mIGRybV9jbGllbnRfaW5pdCgpIGFuZCB0aGUgcHJvdmlkZXIgb2YgdGhlIGNhbGxi
YWNrcyBpbg0KPiBzdHJ1Y3QgZHJtX2NsaWVudF9mdW5jcy4gSWYgdGhpcyBjYXNlIGV2ZXIg
ZXhpc3RlZCwgaXQgaGFzIGJlZW4NCj4gcmVtb3ZlZCBmcm9tIHRoZSBEUk0gY29kZS4gQ2Fs
bGVycyBvZiBkcm1fY2xpZW50X2luaXQoKSBhbHNvIHByb3ZpZGUNCj4gdGhlIGNhbGxiYWNr
IGltcGxlbWVudGF0aW9uLiBUaGUgbGlmZXRpbWUgb2YgdGhlIGNsaWVudHMgaXMgdGllZCB0
bw0KPiB0aGUgZGVwZW5kZW5jeSBjaGFpbidzIG91dGVyLW1vc3QgbW9kdWxlLCB3aGljaCBp
cyB0aGUgaGFyZHdhcmUncw0KPiBEUk0gZHJpdmVyLiBCZWZvcmUgY2xpZW50IGhlbHBlcnMg
Y291bGQgYmUgdW5sb2FkZWQsIHRoZSBkcml2ZXIgbW9kdWxlDQo+IHdvdWxkIGhhdmUgdG8g
YmUgdW5sb2FkZWQsIHdoaWNoIGFsc28gdW5yZWdpc3RlcnMgYWxsIGNsaWVudHMuDQo+IA0K
PiBEcml2ZXIgbW9kdWxlcyB0aGF0IHNldCB1cCBEUk0gY2xpZW50cyBjYW4gbm93IGJlIHVu
bG9hZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+IEFja2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMg
PGphdmllcm1AcmVkaGF0LmNvbT4NCg0KSSd2ZSBhZGRlZCB0aGlzIHBhdGNoIHRvIGRybS1t
aXNjLW5leHQuDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYyB8
IDEyICstLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jbGllbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMNCj4gaW5kZXggYzMw
MjcxMTVkMDU1Mi4uOTQwM2IzZjU3NmY3YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9jbGllbnQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5j
DQo+IEBAIC01LDcgKzUsNiBAQA0KPiAgIA0KPiAgICNpbmNsdWRlIDxsaW51eC9pb3N5cy1t
YXAuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvbGlzdC5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4
L21vZHVsZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KPiAgICNpbmNsdWRl
IDxsaW51eC9zZXFfZmlsZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+IEBA
IC04NCwxNiArODMsMTMgQEAgaW50IGRybV9jbGllbnRfaW5pdChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCBzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCwNCj4gICAJaWYgKCFkcm1f
Y29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX01PREVTRVQpIHx8ICFkZXYtPmRyaXZl
ci0+ZHVtYl9jcmVhdGUpDQo+ICAgCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+ICAgDQo+IC0J
aWYgKGZ1bmNzICYmICF0cnlfbW9kdWxlX2dldChmdW5jcy0+b3duZXIpKQ0KPiAtCQlyZXR1
cm4gLUVOT0RFVjsNCj4gLQ0KPiAgIAljbGllbnQtPmRldiA9IGRldjsNCj4gICAJY2xpZW50
LT5uYW1lID0gbmFtZTsNCj4gICAJY2xpZW50LT5mdW5jcyA9IGZ1bmNzOw0KPiAgIA0KPiAg
IAlyZXQgPSBkcm1fY2xpZW50X21vZGVzZXRfY3JlYXRlKGNsaWVudCk7DQo+ICAgCWlmIChy
ZXQpDQo+IC0JCWdvdG8gZXJyX3B1dF9tb2R1bGU7DQo+ICsJCXJldHVybiByZXQ7DQo+ICAg
DQo+ICAgCXJldCA9IGRybV9jbGllbnRfb3BlbihjbGllbnQpOw0KPiAgIAlpZiAocmV0KQ0K
PiBAQCAtMTA1LDEwICsxMDEsNiBAQCBpbnQgZHJtX2NsaWVudF9pbml0KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50LA0KPiAgIA0KPiAg
IGVycl9mcmVlOg0KPiAgIAlkcm1fY2xpZW50X21vZGVzZXRfZnJlZShjbGllbnQpOw0KPiAt
ZXJyX3B1dF9tb2R1bGU6DQo+IC0JaWYgKGZ1bmNzKQ0KPiAtCQltb2R1bGVfcHV0KGZ1bmNz
LT5vd25lcik7DQo+IC0NCj4gICAJcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgRVhQT1JUX1NZ
TUJPTChkcm1fY2xpZW50X2luaXQpOw0KPiBAQCAtMTc3LDggKzE2OSw2IEBAIHZvaWQgZHJt
X2NsaWVudF9yZWxlYXNlKHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50KQ0KPiAgIAlk
cm1fY2xpZW50X21vZGVzZXRfZnJlZShjbGllbnQpOw0KPiAgIAlkcm1fY2xpZW50X2Nsb3Nl
KGNsaWVudCk7DQo+ICAgCWRybV9kZXZfcHV0KGRldik7DQo+IC0JaWYgKGNsaWVudC0+ZnVu
Y3MpDQo+IC0JCW1vZHVsZV9wdXQoY2xpZW50LT5mdW5jcy0+b3duZXIpOw0KPiAgIH0NCj4g
ICBFWFBPUlRfU1lNQk9MKGRybV9jbGllbnRfcmVsZWFzZSk7DQo+ICAgDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------vUqeju5vzuTAI0uDaFLMonwO--

--------------WT9tb4vGifdq5i0VWe4Ew7Ev
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVUwoUFAwAAAAAACgkQlh/E3EQov+BA
nBAAvxqvijuNlkjeBrquqvvWjyz5BIpS4nSFA0fBEsO6W1C8o6G9+iTO0dNcAflAOOtNDmvcIgGa
mPTt44K4xjJSTVKzBDIcQwGvkrBqj2z2KHmYRtnutlOXIas+V5sLxq33z29pCsCFl+O4SQbUOcTK
b6nRYjwim75vau7X5nSioJUjIo/zRT8tA7288eVLq3Um6XiVejVdmLEJpnK/ozMeT6ltls2irWG3
whSJvZ1Ncn3gSIR2r76wn89r8UIXEToXQA6itjGgxeFzwPpL0+LC+BpMKGB2pn5cWek6+T5gKuvh
bShdkUz2w4HZ3ZhOouTapHifb1zt5z2Nia2Qqtwf6RwOUzCAfT2nOXHy90b5diIUl79O4TE6a2pq
pEu3IFb9MzBxJIj6suqGKmdv9gE6D8hWXhY0gpRN07KWzGObuP4E3Ka9LO7v+Eneyd2AXQwImgLs
iTeSJFpd2+a+dmEkghkK7dvrftakGSEpZkxjTFJfLHqyIhcoILCl+3nHipHJOJGP/ITgAUbSfW3y
xmixIoIlPI5dbaG/cgTK3wyxd5vaqFkz5D7Hn2+OsdNarsbNAT0qg33TqS3TD78ItsmR5sWzr/P/
oN8w7VT9f1wwjPaR2iMKieuGgO7PCxdMQfhrs3fJlEZEO2RqX6Kvd+gjCvObuYYLS4PaXVvSxCsu
43Q=
=gJvB
-----END PGP SIGNATURE-----

--------------WT9tb4vGifdq5i0VWe4Ew7Ev--
