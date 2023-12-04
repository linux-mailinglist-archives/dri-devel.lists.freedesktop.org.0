Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72541802CA0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 09:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567AA10E2E0;
	Mon,  4 Dec 2023 08:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6B410E2D4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 08:03:20 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CAE421FE4F;
 Mon,  4 Dec 2023 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701676997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RUuECgJkxyZWkJhHJh0g2qWzQo+zTm/8J5lSNezlHgw=;
 b=aUjYduaLVT8H89SmW0hLKRA+kkmnLzDX/uPa5RAdL+r1DwRXm7WqX94Njfq5vJVMud4gF4
 iygCQmU664fN/9AQYeagnTj7cIw2PllZJt7V62PwOAc1GRlaGTnq2tTBMHtA8xg86Ms5qa
 1/07Bd7r4PVdqK9497+ymICy/+lxklQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701676997;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RUuECgJkxyZWkJhHJh0g2qWzQo+zTm/8J5lSNezlHgw=;
 b=f66A/vhocYSUyRiK1jJDtyI2DzMosApulM4osw+BcMtATI2itqNkEIcf9tXYqWW+HiQrh7
 GgU1vTgwGK9HcKDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9741F139E2;
 Mon,  4 Dec 2023 08:03:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id W6/GI8WHbWU1FwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Dec 2023 08:03:17 +0000
Message-ID: <8036d161-b560-44ab-b073-1c05cb7fbec5@suse.de>
Date: Mon, 4 Dec 2023 09:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/atomic-helpers: Invoke end_fb_access while owning
 plane state
To: Alyssa Ross <hi@alyssa.is>
References: <20231128090158.15564-1-tzimmermann@suse.de>
 <87r0k3c8d0.fsf@alyssa.is>
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
In-Reply-To: <87r0k3c8d0.fsf@alyssa.is>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6XEoc1S13996EFo8pzFSFFtt"
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spamd-Result: default: False [-5.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; BAYES_HAM(-3.00)[100.00%];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,ffwll.ch:email,alyssa.is:email]; 
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -5.29
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
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com, mripard@kernel.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6XEoc1S13996EFo8pzFSFFtt
Content-Type: multipart/mixed; boundary="------------Lqdobx2e1xlW12V1QBUOguFI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alyssa Ross <hi@alyssa.is>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com
Message-ID: <8036d161-b560-44ab-b073-1c05cb7fbec5@suse.de>
Subject: Re: [PATCH v3] drm/atomic-helpers: Invoke end_fb_access while owning
 plane state
References: <20231128090158.15564-1-tzimmermann@suse.de>
 <87r0k3c8d0.fsf@alyssa.is>
In-Reply-To: <87r0k3c8d0.fsf@alyssa.is>

--------------Lqdobx2e1xlW12V1QBUOguFI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMTIuMjMgdW0gMjE6NTcgc2NocmllYiBBbHlzc2EgUm9zczoNCj4gVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyaXRlczoNCj4gDQo+PiBJ
bnZva2UgZHJtX3BsYW5lX2hlbHBlcl9mdW5jcy5lbmRfZmJfYWNjZXNzIGJlZm9yZQ0KPj4g
ZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X2h3X2RvbmUoKS4gVGhlIGxhdHRlciBmdW5jdGlv
biBoYW5kcyBvdmVyDQo+PiBvd25lcnNoaXAgb2YgdGhlIHBsYW5lIHN0YXRlIHRvIHRoZSBm
b2xsb3dpbmcgY29tbWl0LCB3aGljaCBtaWdodA0KPj4gZnJlZSBpdC4gUmVsZWFzaW5nIHJl
c291cmNlcyBpbiBlbmRfZmJfYWNjZXNzIHRoZW4gb3BlcmF0ZXMgb24gdW5kZWZpbmVkDQo+
PiBzdGF0ZS4gVGhpcyBidWcgaGFzIGJlZW4gb2JzZXJ2ZWQgd2l0aCBub24tYmxvY2tpbmcg
Y29tbWl0cyB3aGVuIHRoZXkNCj4+IGFyZSBiZWluZyBxdWV1ZWQgdXAgcXVpY2tseS4NCj4+
DQo+PiBIZXJlIGlzIGFuIGV4YW1wbGUgc3RhY2sgdHJhY2UgZnJvbSB0aGUgYnVnIHJlcG9y
dC4gVGhlIHBsYW5lIHN0YXRlIGhhcw0KPj4gYmVlbiBmcmVlJ2QgYWxyZWFkeSwgc28gdGhl
IHBhZ2VzIGZvciBkcm1fZ2VtX2ZiX3Z1bm1hcCgpIGFyZSBnb25lLg0KPj4NCj4+IFVuYWJs
ZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyAw
MDAwMDAwMTAwMDAwMDQ5DQo+PiBbLi4uXQ0KPj4gICBkcm1fZ2VtX2ZiX3Z1bm1hcCsweDE4
LzB4NzQNCj4+ICAgZHJtX2dlbV9lbmRfc2hhZG93X2ZiX2FjY2VzcysweDFjLzB4MmMNCj4+
ICAgZHJtX2F0b21pY19oZWxwZXJfY2xlYW51cF9wbGFuZXMrMHg1OC8weGQ4DQo+PiAgIGRy
bV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsKzB4OTAvMHhhMA0KPj4gICBjb21taXRfdGFp
bCsweDE1Yy8weDE4OA0KPj4gICBjb21taXRfd29yaysweDE0LzB4MjANCj4+DQo+PiBGaXgg
dGhpcyBieSBydW5uaW5nIGVuZF9mYl9hY2Nlc3MgaW1tZWRpYXRlbHkgYWZ0ZXIgdXBkYXRp
bmcgYWxsIHBsYW5lcw0KPj4gaW4gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5lcygp
LiBUaGUgZXhpc3RpbmcgY2xlYW4tdXAgaGVscGVyDQo+PiBkcm1fYXRvbWljX2hlbHBlcl9j
bGVhbnVwX3BsYW5lcygpIG5vdyBvbmx5IGhhbmRsZXMgY2xlYW51cF9mYi4NCj4+DQo+PiBG
b3IgYWJvcnRlZCBjb21taXRzLCByb2xsIGJhY2sgZnJvbSBkcm1fYXRvbWljX2hlbHBlcl9w
cmVwYXJlX3BsYW5lcygpDQo+PiBpbiB0aGUgbmV3IGhlbHBlciBkcm1fYXRvbWljX2hlbHBl
cl91bnByZXBhcmVfcGxhbmVzKCkuIFRoaXMgY2FzZSBpcw0KPj4gZGlmZmVyZW50IGZyb20g
cmVndWxhciBjbGVhbnVwLCBhcyB3ZSBoYXZlIHRvIHJlbGVhc2UgdGhlIG5ldyBzdGF0ZTsN
Cj4+IHJlZ3VsYXIgY2xlYW51cCByZWxlYXNlcyB0aGUgb2xkIHN0YXRlLiBUaGUgbmV3IGhl
bHBlciBhbHNvIGludm9rZXMNCj4+IGNsZWFudXBfZmIgZm9yIGFsbCBwbGFuZXMuDQo+Pg0K
Pj4gVGhlIGNoYW5nZXMgbW9zdGx5IGludm9sdmUgRFJNJ3MgYXRvbWljIGhlbHBlcnMuIE9u
bHkgdHdvIGRyaXZlcnMsIGk5MTUNCj4+IGFuZCBub3V2ZWF1LCBpbXBsZW1lbnQgdGhlaXIg
b3duIGNvbW1pdCBmdW5jdGlvbi4gVXBkYXRlIHRoZW0gdG8gaW52b2tlDQo+PiBkcm1fYXRv
bWljX2hlbHBlcl91bnByZXBhcmVfcGxhbmVzKCkuIERyaXZlcnMgd2l0aCBjdXN0b20gY29t
bWl0X3RhaWwNCj4+IGZ1bmN0aW9uIGRvIG5vdCByZXF1aXJlIGNoYW5nZXMuDQo+Pg0KPj4g
djM6DQo+PiAJKiBhZGQgZHJtX2F0b21pY19oZWxwZXJfdW5wcmVwYXJlX3BsYW5lcygpIGZv
ciByb2xsaW5nIGJhY2sNCj4+IAkqIHVzZSBjb3JyZWN0IHN0YXRlIGZvciBlbmRfZmJfYWNj
ZXNzDQo+PiB2MjoNCj4+IAkqIGZpeCB0ZXN0IGluIGRybV9hdG9taWNfaGVscGVyX2NsZWFu
dXBfcGxhbmVzKCkNCj4+DQo+PiBSZXBvcnRlZC1ieTogQWx5c3NhIFJvc3MgPGhpQGFseXNz
YS5pcz4NCj4+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzg3
bGVhem0weWEuZnNmQGFseXNzYS5pcy8NCj4+IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPg0KPj4gRml4ZXM6IDk0ZDg3OWVhZjdmYiAoImRybS9hdG9t
aWMtaGVscGVyOiBBZGQge2JlZ2luLGVuZH1fZmJfYWNjZXNzIHRvIHBsYW5lIGhlbHBlcnMi
KQ0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQo+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjYuMisNCj4gDQo+
IEkndmUgYmVlbiBydW5uaW5nIHRoaXMgZm9yIGRheXMgbm93LCBhbmQgaGF2ZW4ndCBoYWQg
YSBzaW5nbGUgT29wcy4NCj4gR2l2ZW4gdGhlIHJhdGUgd2l0aCB3aGljaCBJIGVuY291bnRl
cmVkIHRoZW0gYmVmb3JlIGluIHRoaXMNCj4gY29uZmlndXJhdGlvbiwgaXQgbG9va3MgdmVy
eSBsaWtlbHkgdGhhdCB0aGUgaXNzdWUgaXMgcmVzb2x2ZWQuDQo+IA0KPiBUZXN0ZWQtYnk6
IEFseXNzYSBSb3NzIDxoaUBhbHlzc2EuaXM+DQo+IA0KPiBBbmQsIG9uY2UgdGhlIHdyb25n
IHBhcmFtZXRlciBuYW1lIGluIHRoZSBrZXJuZWxkb2MgaWRlbnRpZmllZCBieSB0aGUNCj4g
a2VybmVsIHRlc3Qgcm9ib3QgaXMgcmVzb2x2ZWQsDQo+IA0KPiBSZXZpZXdlZC1ieTogQWx5
c3NhIFJvc3MgPGhpQGFseXNzYS5pcz4NCg0KR3JlYXQuIEknbGwgcHJlcGFyZSBhbm90aGVy
IHVwZGF0ZSBzbyB0aGlzIGZpeCBjYW4gbGFuZCBiZWZvcmUgdGhlIG5leHQgDQotZml4ZXMg
UFIuIFRoYW5rcyBhIGxvdCENCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51
ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcg
TWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=


--------------Lqdobx2e1xlW12V1QBUOguFI--

--------------6XEoc1S13996EFo8pzFSFFtt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVth8UFAwAAAAAACgkQlh/E3EQov+CG
Dg//YS3NkbEHcIgoLXSJEMoA+qd/W4WzzeWSqCbQKge8v6/5Q8ViqXwjsPma1aWgXr1Bv59u9TBv
LvBuPChY8yK51CszdOJUeBLZQEyfl8Cw1PawaUBvdeZmhw+1wKuWT7pfbi7NSxq2KLq2hxLUauEG
M1A96NgVtQwVMgPRwR5sbPOM6mEzQwTGm6biAGKIbYBTeJAcSwTnqkvuYUABqyGGH4rybxJERfpb
ZtiX9+XIl8XWd0L6Z4j+/58rXJ+gGdBsUHX8uGuDlu+uk4B0BOq6uxumjNqZCA5izN1JEbVG/2sV
ue2ogE/4I2N1zpQ4vxwFNzTO9o+H3wVpvZqxya7wxdDNbjWxguuEEW1zAugUgUMFnrGAVe2Mu0+U
h/Ws7ZOphqiPpXQIbeZVB5+rvaF/ApTMntDiwFEe6B03Z5uwWItcfouuVrUC0w7uBBfrUNmIJbLp
8PCKJnzcNaxEVrY2b44iTwcWqQhNAdPUYZvWicox3SnT4JvecOg/tJb74tsXEotRELyZ9MHF4YBT
azbskKFmaIY79UINwOI4o2WwpHM1QLcEz41zQVRLpNp4BSSSYnLfsP8WSuoxJ8FCJtwWctJ5M6nQ
geOoe4wCTJilRxiuUYWDx0P3gVv+XEpI//1JEvD3LoM8/v0u2lR1N6/pNZYOKba3OCSAcJIumw8e
NJw=
=Bd4M
-----END PGP SIGNATURE-----

--------------6XEoc1S13996EFo8pzFSFFtt--
