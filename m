Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3314F7EF405
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 15:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1AD10E12E;
	Fri, 17 Nov 2023 14:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DD710E097
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 14:08:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 15AAA2187D;
 Fri, 17 Nov 2023 14:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700230082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AyXr3aW4o5WoSLir+O/B3uzYs4okmAw2sLEeUpf4dAk=;
 b=JBR7lOf4ViEiNJdDLQGKhiF0YXuL92LsqeiGLaujciPXZXafF4yjrhGE3bgIMplc6HglQ9
 a9qnvOkZC3H8bQiWVpJtFeB6CgzFvZulvCQkpSOOnnS0r0/zCBZMD3R7s1SX5tvBiKKHiT
 O6nSljO7nT0HrbmD+NVo186uKOGJ/Ic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700230082;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AyXr3aW4o5WoSLir+O/B3uzYs4okmAw2sLEeUpf4dAk=;
 b=6dfFYS82PDLvl9Ijlt50yDN64muxpFLzMWZvp1jkNxpfStDjyXJA4gdDAdn4hZhbHDb2dW
 GmWaXkVR+zaV91DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F03A31341F;
 Fri, 17 Nov 2023 14:08:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4V9hOcFzV2V8awAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Nov 2023 14:08:01 +0000
Message-ID: <ba5c6bda-1512-4155-ad8a-de5dc5fe1f2b@suse.de>
Date: Fri, 17 Nov 2023 15:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Use after free with GEM shadow-buffered planes
To: Alyssa Ross <hi@alyssa.is>, dri-devel@lists.freedesktop.org
References: <87leazm0ya.fsf@alyssa.is>
Content-Language: en-US
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
In-Reply-To: <87leazm0ya.fsf@alyssa.is>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0MN2WB9rvEA5093eWw6O0vtI"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.29
X-Spamd-Result: default: False [-6.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[99.99%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.983]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_TWO(0.00)[2]; SIGNED_PGP(-2.00)[];
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0MN2WB9rvEA5093eWw6O0vtI
Content-Type: multipart/mixed; boundary="------------jSia9gFj9eJ3I0bUh7hqkh5A";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alyssa Ross <hi@alyssa.is>, dri-devel@lists.freedesktop.org
Message-ID: <ba5c6bda-1512-4155-ad8a-de5dc5fe1f2b@suse.de>
Subject: Re: Use after free with GEM shadow-buffered planes
References: <87leazm0ya.fsf@alyssa.is>
In-Reply-To: <87leazm0ya.fsf@alyssa.is>

--------------jSia9gFj9eJ3I0bUh7hqkh5A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTEuMjMgdW0gMTc6MzIgc2NocmllYiBBbHlzc2EgUm9zczoNCj4gW09y
aWdpbmFsbHkgcmVwb3J0ZWQgYXQgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2Ry
bS9taXNjLy0vaXNzdWVzLzMzXQ0KPiANCj4gVGhlIGZvbGxvd2luZyBoYXBwZW5zIGluIGEg
Y3ljbGU6DQo+IA0KPiAgIOKAoiBBbiBhdG9taWMgc3RhdGUgaXMgYWxsb2NhdGVkDQo+ICAg
4oCiIEEgcGxhbmUgc3RhdGUgaXMgYWxsb2NhdGVkIChkcm1fZ2VtX2R1cGxpY2F0ZV9zaGFk
b3dfcGxhbmVfc3RhdGUoKSkNCj4gICDigKIgQ29tbWl0IChkcm1fYXRvbWljX2hlbHBlcl9j
b21taXQoKSwgcG9zc2libHkgbm9uYmxvY2tpbmcgLyBhc3luY2hyb25vdXNseSkNCj4gICDi
gKIgVGhlIHByZXZpb3VzIHBsYW5lIHN0YXRlIGlzIGZyZWVkIChkcm1fZ2VtX2Rlc3Ryb3lf
c2hhZG93X3BsYW5lX3N0YXRlKCkpDQo+ICAg4oCiIFRoZSBhdG9taWMgc3RhdGUgaXMgcHV0
DQoNCldlIGFjcXVpcmUgYSByZWZlcmVuY2Ugb24gdGhlIHN0YXRlIGF0DQoNCiANCmh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjUvc291cmNlL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fYXRvbWljX2hlbHBlci5jI0wyMDU3DQoNCmFuZCByZWxlYXNlIGl0IGF0DQoNCiAN
Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjUvc291cmNlL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jI0wxODMzDQoNCkFsbCBuZXcgc3ViLXN0YXRl
LCBzdWNoIGFzIGZvciBwbGFuZXMsIHNob3VsZCBiZSBrZXB0IGFsbG9jYXRlZCBkdXJpbmcg
DQp0aGF0IHRpbWUuDQoNCj4gDQo+IEJ1dCB3aGF0IGhhcHBlbnMgaWYgYSBub25ibG9ja2lu
ZyBjb21taXQgZG9lc24ndCBnZXQgc2NoZWR1bGVkIHVudGlsIGENCj4gY291cGxlIG9mIGl0
ZXJhdGlvbnMgbGF0ZXIgaW4gdGhlIGN5Y2xlPyAgUGxhbmUgc3RhdGVzIGFyZSBub3QNCj4g
cmVmY291bnRlZCwgc28gYnkgdGhhdCBwb2ludCwgdGhlIHBsYW5lIHN0YXRlIGhhcyBiZWVu
IGZyZWVkLCBhbmQgc28NCj4gY29tbWl0X3RhaWwoKSB3aWxsIGVuY291bnRlciBhIHVzZSBh
ZnRlciBmcmVlIHdoZW4gaXQgYWNjZXNzZXMgdGhlIHBsYW5lDQo+IHN0YXRlLg0KDQpJIHRo
aW5rIGl0J3MgYXNzdW1lZCB0aGF0IHRoZSBvbGQgcGxhbmUgc3RhdGUgY2FuIGJlIGdvbmUg
YnkgdGhlIHRpbWUgDQp0aGUgY29tbWl0IGhhcHBlbnMuIEJ1dCB3aHkgd291bGQgdGhlIG5l
dyBwbGFuZSBzdGF0ZT8gRGlkIHlvdSBmaWd1cmUgDQp0aGlzIG91dCBpbiB5b3VyIGFuYWx5
c2lzPw0KDQo+IA0KPiBJIGVuY291bnRlcmVkIHRoaXMgaXNzdWUgdXNpbmcgc2ltcGxlZHJt
IG9uIHRoZSBBc2FoaSBrZXJuZWwgYmFzZWQgb24NCj4gdjYuNSwgYnV0IG5vbmUgb2YgdGhl
IGZpbGVzIEkgZXhhbWluZWQgdG8gZGV0ZXJtaW5lIHRoYXQgdGhpcyBpcyBhDQo+IHVzZS1h
ZnRlci1mcmVlIGhhdmUgYmVlbiBtb2RpZmllZCBmcm9tIG1haW5saW5lLiAgSSd2ZSBhbHNv
IHJldmlld2VkIHRoZQ0KPiBkaWZmIGJldHdlZW4gbXkga2VybmVsIGFuZCB0aXAgb2YgbWFp
bmxpbmUgKDhmNmY3NmE2YTI5ZiksIGFuZCBkaWRuJ3QNCj4gc2VlIGFueXRoaW5nIHRoYXQg
d291bGQgYWZmZWN0IHRoaXMgaXNzdWUuDQoNCkl0IGNvdWxkIGJlIHRoYXQgd2UncmUgcGFz
c2luZyB0aGUgd3Jvbmcgc3RhdGUgYXQNCg0KIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjYuNS9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVy
LmMjTDI5MTkNCg0KaW4gc29tZSBjb3JuZXIgY2FzZSwgYnV0IEkgcmVhbGx5IGRvbid0IHNl
ZSBob3cuDQoNCkF0IGxlYXN0IHRoYXQncyBob3cgaXQncyBzdXBwb3NlZCB0byB3b3JrLiBJ
J20gc3RpbGwgdHJ5aW5nIHRvIGdldCBhbiANCmlkZWEgaG93IHlvdSBlbmQgdXAgd2l0aCBh
biBpbnZhbGlkIHBsYW5lIHN0YXRlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
PiBIZXJlJ3MgYW4gZXhhbXBsZSBvZiBhIHVzZSBhZnRlciBmcmVlLiAgSXQncyBiZWVuIGEg
Y291cGxlIG9mIHdlZWtzDQo+IHNpbmNlIEkgdGhvcm91Z2hseSBpbnZlc3RpZ2F0ZWQgdGhp
cywgYnV0IGZyb20gbWVtb3J5LCBpbiB0aGlzIGNhc2UsIHRoZQ0KPiBwbGFuZSBzdGF0ZSBo
YXMgYmVlbiBvdmVyd3JpdHRlbiBieSBhIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZS4NCj4gDQo+
IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRk
cmVzcyAwMDAwMDAwMTAwMDAwMDQ5DQo+IE1lbSBhYm9ydCBpbmZvOg0KPiAgICBFU1IgPSAw
eDAwMDAwMDAwOTYwMDAwMDUNCj4gICAgRUMgPSAweDI1OiBEQUJUIChjdXJyZW50IEVMKSwg
SUwgPSAzMiBiaXRzDQo+ICAgIFNFVCA9IDAsIEZuViA9IDANCj4gICAgRUEgPSAwLCBTMVBU
VyA9IDANCj4gICAgRlNDID0gMHgwNTogbGV2ZWwgMSB0cmFuc2xhdGlvbiBmYXVsdA0KPiBE
YXRhIGFib3J0IGluZm86DQo+ICAgIElTViA9IDAsIElTUyA9IDB4MDAwMDAwMDUsIElTUzIg
PSAweDAwMDAwMDAwDQo+ICAgIENNID0gMCwgV25SID0gMCwgVG5EID0gMCwgVGFnQWNjZXNz
ID0gMA0KPiAgICBHQ1MgPSAwLCBPdmVybGF5ID0gMCwgRGlydHlCaXQgPSAwLCBYcyA9IDAN
Cj4gdXNlciBwZ3RhYmxlOiAxNmsgcGFnZXMsIDQ4LWJpdCBWQXMsIHBnZHA9MDAwMDAwMDgw
ZTBlMzFiMA0KPiBbMDAwMDAwMDEwMDAwMDA0OV0gcGdkPTA4MDAwMDA4M2QzOTAwMDMsIHA0
ZD0wODAwMDAwODNkMzkwMDAzLCBwdWQ9MDgwMDAwMDgzZGI5YzAwMywgcG1kPTAwMDAwMDAw
MDAwMDAwMDANCj4gSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDAwMDAwMDAwOTYwMDAwMDUgWyMx
XSBQUkVFTVBUIFNNUA0KPiBNb2R1bGVzIGxpbmtlZCBpbjogb3ZlcmxheSB1YXMgdXNiX3N0
b3JhZ2UgdXNiaGlkIHJmY29tbSBzbmRfc2VxX2R1bW15IHNuZF9ocnRpbWVyIHNuZF9zZXEg
c25kX3NlcV9kZXZpY2UgYm5lcCBkZXNfZ2VuZXJpYyBsaWJkZXMgbWQ0IGJyY21mbWFjX3dj
YyBqb3lkZXYgaGNpX2JjbTQzNzcgYmx1ZXRvb3RoIGJyY21mbWFjIGJyY211dGlsIGNmZzgw
MjExIGhpZF9tYWdpY21vdXNlIGVjZGhfZ2VuZXJpYyBlY2MgcmZraWxsIHNuZF9zb2NfbWFj
YXVkaW8gbWFjc21jX2hpZCBtYWNzbWNfcG93ZXIgbWFjc21jX3JlYm9vdCBvZnBhcnQgc3Bp
X25vciBhcHBsZV9pc3AgdmlkZW9idWYyX2RtYV9zZyBzbmRfc29jX2NzNDJsODQgc25kX3Nv
Y190YXMyNzY0IHZpZGVvYnVmMl9tZW1vcHMgY2xrX2FwcGxlX25jbyBzbmRfc29jX2FwcGxl
X21jYSBhcHBsZV9hZG1hYyB2aWRlb2J1ZjJfdjRsMiB2aWRlb2RldiB2aWRlb2J1ZjJfY29t
bW9uIG1jIGhpZF9hcHBsZSBwd21fYXBwbGUgbGVkc19wd20gYXBwbGVfc29jX2NwdWZyZXEg
eHRfY29ubnRyYWNrIG5mX2Nvbm50cmFjayBuZl9kZWZyYWdfaXB2NiBuZl9kZWZyYWdfaXB2
NCBpcDZ0X3JwZmlsdGVyIGlwdF9ycGZpbHRlciB4dF9wa3R0eXBlIHh0X0xPRyBuZl9sb2df
c3lzbG9nIG5mdF9jb21wYXQgbmZfdGFibGVzIG5mbmV0bGluayBsb29wIHR1biB0YXAgbWFj
dmxhbiBicmlkZ2Ugc3RwIGxsYyBmdXNlIHpzdGQgenJhbSBkbV9jcnlwdCB4aGNpX3BsYXRf
aGNkIHhoY2lfaGNkIG52bWVtX3NwbWlfbWZkIHJ0Y19tYWNzbWMgZ3Bpb19tYWNzbWMgdHBz
NjU5OHggZG9ja2NoYW5uZWxfaGlkIHNpbXBsZV9tZmRfc3BtaSByZWdtYXBfc3BtaSBudm1l
X2FwcGxlIHBoeV9hcHBsZV9hdGMgZHdjMyBwY2llX2FwcGxlIHR5cGVjIHBjaV9ob3N0X2Nv
bW1vbiB1ZGNfY29yZSBhcHBsZV9zYXJ0IG1hY3NtY19ydGtpdCBhcHBsZV9ydGtpdF9oZWxw
ZXIgYXBwbGVfZG9ja2NoYW5uZWwgbWFjc21jIGFwcGxlX3J0a2l0IG1mZF9jb3JlDQo+ICAg
c3BtaV9hcHBsZV9jb250cm9sbGVyIG52bWVtX2FwcGxlX2VmdXNlcyBwaW5jdHJsX2FwcGxl
X2dwaW8gc3BpX2FwcGxlIGkyY19hcHBsZSBhcHBsZV9kYXJ0IGFwcGxlX21haWxib3ggYnRy
ZnMgeG9yIHhvcl9uZW9uIHJhaWQ2X3BxDQo+IENQVTogMCBQSUQ6IDEwOTUwNzQgQ29tbTog
a3dvcmtlci91MTY6MTEgVGFpbnRlZDogRyBTICAgICAgICAgICAgICAgICA2LjUuMC1hc2Fo
aSAjMS1OaXhPUw0KPiBIYXJkd2FyZSBuYW1lOiBBcHBsZSBNYWNCb29rIFBybyAoMTMtaW5j
aCwgTTIsIDIwMjIpIChEVCkNCj4gV29ya3F1ZXVlOiBldmVudHNfdW5ib3VuZCBjb21taXRf
d29yaw0KPiBwc3RhdGU6IDIxNDAwMDA5IChuekN2IGRhaWYgK1BBTiAtVUFPIC1UQ08gK0RJ
VCAtU1NCUyBCVFlQRT0tLSkNCj4gcGMgOiBkcm1fZ2VtX2ZiX3Z1bm1hcCsweDE4LzB4NzQN
Cj4gbHIgOiBkcm1fZ2VtX2VuZF9zaGFkb3dfZmJfYWNjZXNzKzB4MWMvMHgyYw0KPiBzcCA6
IGZmZmY4MDAwODdlYTNkMDANCj4geDI5OiBmZmZmODAwMDg3ZWEzZDAwIHgyODogMDAwMDAw
MDAwMDAwMDAwMCB4Mjc6IDAwMDAwMDAwMDAwMDAwMDANCj4geDI2OiBmZmZmODAwMDgxMzI1
MDAwIHgyNTogMDAwMDAwMDBmZmZmZmVmNyB4MjQ6IGZmZmYwMDAwNDZjNWI1NjANCj4geDIz
OiBmZmZmMDAwMDAxZmNhYTA1IHgyMjogMDAwMDAwMDAwMDAwMDAwMCB4MjE6IDAwMDAwMDAx
MDAwMDAwMDENCj4geDIwOiBmZmZmMDAwMDQ2YzViNTAwIHgxOTogMDAwMDAwMDAwMDAwMDAw
MSB4MTg6IDAwMDAwMDAwMDAwMDAwMDANCj4geDE3OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjog
MDAwMDAwMDAwMDAwMDAwMCB4MTU6IDAwMDBmZmZmMmUyZDVhYjANCj4geDE0OiAwMDAwMDAw
MDAwMDAwMTk1IHgxMzogMDAwMDAwMDAwMDAwMDAwMCB4MTI6IGZmZmY4MDAwODEzMTBhODAN
Cj4geDExOiAwMDAwMDAwMDAwMDAwMDAxIHgxMDogMTQ0NGU3ZTIzZjA4Mzg5NyB4OSA6IDZl
ODJmMGI3NjA1ZjI5MmYNCj4geDggOiBmZmZmMDAwMTI0OWUwZjQ4IHg3IDogMDAwMDAwMDAw
MDAwMDAwNCB4NiA6IDAwMDAwMDAwMDAwMDAxOTANCj4geDUgOiAwMDAwMDAwMDAwMDAwMDAx
IHg0IDogZmZmZjAwMDA5M2M1NDQ0MCB4MyA6IGZmZmYwMDAwMGU5NjgwMDANCj4geDIgOiBm
ZmZmODAwMDgwNzc4ODNjIHgxIDogZmZmZjAwMDA5Y2UzNzQ5OCB4MCA6IDAwMDAwMDAxMDAw
MDAwMDENCj4gQ2FsbCB0cmFjZToNCj4gICBkcm1fZ2VtX2ZiX3Z1bm1hcCsweDE4LzB4NzQN
Cj4gICBkcm1fZ2VtX2VuZF9zaGFkb3dfZmJfYWNjZXNzKzB4MWMvMHgyYw0KPiAgIGRybV9h
dG9taWNfaGVscGVyX2NsZWFudXBfcGxhbmVzKzB4NTgvMHhkOA0KPiAgIGRybV9hdG9taWNf
aGVscGVyX2NvbW1pdF90YWlsKzB4OTAvMHhhMA0KPiAgIGNvbW1pdF90YWlsKzB4MTVjLzB4
MTg4DQo+ICAgY29tbWl0X3dvcmsrMHgxNC8weDIwDQo+ICAgcHJvY2Vzc19vbmVfd29yaysw
eDFlMC8weDM0NA0KPiAgIHdvcmtlcl90aHJlYWQrMHg2OC8weDQyNA0KPiAgIGt0aHJlYWQr
MHhmNC8weDEwMA0KPiAgIHJldF9mcm9tX2ZvcmsrMHgxMC8weDIwDQo+IENvZGU6IDkxMDAw
M2ZkIGE5MDE1M2YzIGY5MDAxM2Y1IGFhMDAwM2Y1IChmOTQwMjQwMCkNCj4gLS0tWyBlbmQg
dHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1h
bnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3Vk
aWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------jSia9gFj9eJ3I0bUh7hqkh5A--

--------------0MN2WB9rvEA5093eWw6O0vtI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVXc8EFAwAAAAAACgkQlh/E3EQov+As
TxAAqC/3CUcoZoZSMoijDdz4DQXUHzDwKC8bCFTf1D59Sqn0W6WNEGpPo0MUSYRU01Q7hsz+G8CM
QPzX1eAR91y1O4+7NZgfPV4RJR5TKSPZLWLV8D7PftNKgdatZLIukBqQ/8xvXnDHZ4HfJGAESRCF
ArF5RH3zI0BYnmKM8xvn4d2KuJzoRhnYpi48ObQ/naNoHvIltm+2bGTG3SeY/xHkSfuEd9luRwoq
ZbV9LVibYsx7HpG1kRO2NPTJHR2trZXPARJQ1CKRaWRrSAZ6SkGGbU7W0DAWmmTk6szAZPhLWqtH
5wa4/FJDBCoICKq99f004YYwcLTgaLwXreuml432oRs1TJQo/EB3FX72v5GArfhYdhWBMF19qbs5
O5XNkNz46BRyt2ajXCU/NUaFoci7dhUMLVkpEMjPcX3V502CyJVSuxnchbEnkKBduy7tuShEloPe
zcfBbe9F+X5fq/GoT62f8CUdWrQoMY7G4GKkWs9A8jfxfOygrdlH19X6dF7PJNKUbF6Eb64iUOWI
MTWOk/ObxYqNIQmkqxTIBuh4CeH7v73CQE3gUuETrfp9eoDBld+kgufQUn+0WHfDTJoDtbKxQs2q
0rV5YHS9uIYlTypPE7EcFFI1epMb1nF6JxW8KXxnuP01SEPZsr0AXzAlFNivCu99VRfjBtYTEMhE
tr4=
=lb7z
-----END PGP SIGNATURE-----

--------------0MN2WB9rvEA5093eWw6O0vtI--
