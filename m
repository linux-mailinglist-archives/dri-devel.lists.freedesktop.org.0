Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7427EEFC2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 11:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B020A10E737;
	Fri, 17 Nov 2023 10:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F137E10E737
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 10:07:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 77F411F892;
 Fri, 17 Nov 2023 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700215671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GW8yAWw4MQn4qT8O2tZNeMP85s6wjbozmT5L2ph2Czk=;
 b=cbRJ1ZlqSo6MgCp3GfmJgvAxZww+hHjw404ruzES9IeFkiadzigDmMvRPOWi9tfTB93w4J
 ZTqbfFXuVx2ZeWxcSZ1fRqnvXUkLnq3ufxEITdR3rQGF3yUiD8G3rGJ2eWS8/zffaJmlSC
 vowisWENQzfgk6va9BdPFLcAv7eezus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700215671;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GW8yAWw4MQn4qT8O2tZNeMP85s6wjbozmT5L2ph2Czk=;
 b=JHjF7ZpA/FDRlVXqev7RFCAsRbYSP6akcGlARt68u1gctxQva0u+gk9KhsITyDSehbTXoh
 LBFmh1NinZ26ozDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5335F1348C;
 Fri, 17 Nov 2023 10:07:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9K5hE3c7V2WzZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Nov 2023 10:07:51 +0000
Message-ID: <e445fb5d-0cdd-4ba0-aafd-1f025bcca30b@suse.de>
Date: Fri, 17 Nov 2023 11:07:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] drm: Reuse temporary memory for format conversion
To: Maxime Ripard <mripard@kernel.org>
References: <20231009141018.11291-1-tzimmermann@suse.de>
 <skb2mpjs5hawsl4daczcunfplds65uj762vdpcvp3lurrldxdb@e65uaawi2kpu>
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
In-Reply-To: <skb2mpjs5hawsl4daczcunfplds65uj762vdpcvp3lurrldxdb@e65uaawi2kpu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Xp0NL63ngeFySfqq60SgD0aD"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.79
X-Spamd-Result: default: False [-7.79 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[8]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[];
 FREEMAIL_CC(0.00)[redhat.com, lists.freedesktop.org, riseup.net, tronnes.org,
 gmail.com]
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
Cc: jfalempe@redhat.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, noralf@tronnes.org, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Xp0NL63ngeFySfqq60SgD0aD
Content-Type: multipart/mixed; boundary="------------y5wL20YC0s7ubzF0Nk4VLttL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: jfalempe@redhat.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, noralf@tronnes.org, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net
Message-ID: <e445fb5d-0cdd-4ba0-aafd-1f025bcca30b@suse.de>
Subject: Re: [PATCH v5 0/7] drm: Reuse temporary memory for format conversion
References: <20231009141018.11291-1-tzimmermann@suse.de>
 <skb2mpjs5hawsl4daczcunfplds65uj762vdpcvp3lurrldxdb@e65uaawi2kpu>
In-Reply-To: <skb2mpjs5hawsl4daczcunfplds65uj762vdpcvp3lurrldxdb@e65uaawi2kpu>

--------------y5wL20YC0s7ubzF0Nk4VLttL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMTEuMjMgdW0gMTA6MzQgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
biBNb24sIE9jdCAwOSwgMjAyMyBhdCAwNDowNjoyOVBNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IERSTSdzIGZvcm1hdC1jb252ZXJzaW9uIGhlbHBlcnMgcmVxdWly
ZSB0ZW1wb3JhcnkgbWVtb3J5LiBQYXNzIHRoZQ0KPj4gYnVmZmVyIGZyb20gdGhlIGNhbGxl
ciB0byBhbGxvdyB0aGUgY2FsbGVyIHRvIHByZWFsbG9jYXRlIHRoZSBidWZmZXINCj4+IG1l
bW9yeS4NCj4+DQo+PiBUaGUgbW90aXZhdGlvbiBmb3IgdGhpcyBwYXRjaHNldCBpcyB0aGUg
cmVjZW50IHdvcmsgb24gYSBEUk0gcGFuaWMNCj4+IGhhbmRsZXIuIFsxXSBUaGUgcGFuaWMg
aGFuZGxlciByZXF1aXJlcyBmb3JtYXQgY29udmVyc2lvbiB0byBkaXNwbGF5IGFuDQo+PiBl
cnJvciB0byB0aGUgc2NyZWVuLiBCdXQgYWxsb2NhdGluZyBtZW1vcnkgZHVyaW5nIGEga2Vy
bmVsIHBhbmljIGlzDQo+PiBmcmFnaWxlLiBUaGUgY2hhbmdlcyBpbiB0aGlzIHBhdGNoc2V0
IGVuYWJsZSB0aGUgRFJNIHBhbmljIGhhbmRsZXIgdG8NCj4+IHByZWFsbG9jYXRlIGJ1ZmZl
ciBzdG9yYWdlIGJlZm9yZSB0aGUgcGFuaWMgb2NjdXJzLg0KPj4NCj4+IFBhdGNoIDEgYWRk
cyBzdHJ1Y3QgZHJtX2Zvcm1hdF9jb252X3N0YXRlLCBhIHNpbXBsZSBpbnRlcmZhY2UgdG8g
cGFzcw0KPj4gYXJvdW5kIHRoZSBidWZmZXIgc3RvcmFnZS4gUGF0Y2ggMiBhZGRzIGFuIGlu
c3RhbmNlIG9mIHRoZSBzdHJ1Y3QgdG8NCj4+IHRoZSBzaGFkb3ctcGxhbmUgc3RhdGUuIFBh
dGNoIDMgbW92ZXMgdGhlIGJ1ZmZlcidzIG1lbW9yeSBtYW5hZ2VtZW50DQo+PiBmcm9tIHRo
ZSBmb3JtYXQgaGVscGVycyBpbnRvIHRoZWlyIGNhbGxlcnMgd2l0aGluIHRoZSBEUk0gZHJp
dmVycy4gTW9zdA0KPj4gb2YgdGhlIGFmZmVjdGVkIGRyaXZlcnMgdXNlIHRoZSBzdGF0ZSBp
bnN0YW5jZSBzdG9yZWQgaW4gdGhlaXIgc2hhZG93LQ0KPj4gcGxhbmUgc3RhdGUuIFRoZSBz
aGFkb3ctcGxhbmUgY29kZSByZWxlYXNlcyB0aGUgYnVmZmVyIG1lbW9yeSBhdXRvbWF0aWNh
bGx5Lg0KPj4NCj4+IFBhdGNoZXMgNCB0byA3IHVwZGF0ZSB0aHJlZSBkcml2ZXJzIHRvIHBy
ZS1hbGxvY2F0ZSB0aGUgZm9ybWF0LWNvbnZlcnNpb24NCj4+IGJ1ZmZlciBpbiB0aGVpciBw
bGFuZSdzIGF0b21pY19jaGVjayBmdW5jdGlvbi4gVGhlIGRyaXZlcnMgdGh1cyBkZXRlY3Qg
T09NDQo+PiBlcnJvcnMgYmVmb3JlIHRoZSBkaXNwbGF5IHVwZGF0ZSBiZWdpbnMuDQo+Pg0K
Pj4gVGVzdGVkIHdpdGggc2ltcGxlZHJtLg0KPiANCj4gU28sIEkganVzdCBkaXNjb3ZlcmVk
IHRoYXQgeW91IG1lcmdlZCB0aGF0IHNlcmllcy4NCj4gDQo+IFlvdSd2ZSBjb21wbGFpbmVk
IGJlZm9yZSBhYm91dCAic25lYWtpbmcgcGF0Y2hlcyBpbiIsIGFuZCB3aGlsZSBJIHdhcw0K
PiBkaXNhZ3JlZWluZyB3aXRoIHlvdSB0aGVuLCB0aGlzIHBhcnRpY3VsYXIgaW5zdGFuY2Ug
aXMgZGVmaW5pdGVseSBhDQo+IHN0cm9uZyBjYXNlIGZvciBpdC4gWW91J3ZlIG1lcmdlZCBp
dCB3aXRob3V0IHRlbGxpbmcgYW55b25lLCBhbmQgZGVzcGl0ZQ0KPiBvdXIgb25nb2luZyBj
b252ZXJzYXRpb24gb24gdGhlIHY0IHRoYXQgd2FzIGFjdGl2ZSBtb3JlIHJlY2VudGx5IHRo
YW4NCj4gdGhlIHY1LiBBbmQgdGhhdCB5b3UgbmV2ZXIgcmVzcG9uZGVkIHRvLg0KPiANCj4g
QXdlc29tZS4NCg0KTXkgYXBvbG9naWVzLiBGcm9tIG15IHBvaW50IG9mIHZpZXcsIHRoYXQg
Y29udmVyc2lvbiBoYWQgZW5kZWQuIEkgbGVmdCANCnRoZSBwYXRjaCBzZXQgZm9yIGEgd2hp
bGUgdG8gd2FpdCBmb3IgZnVydGhlciBjb21tZW50cyBvciBxdWVzdGlvbnMsIGJ1dCANCm5v
dGhpbmcgaGFwcGVuZWQuIFNvIEkgbWVyZ2VkIGl0Lg0KDQpSZXZlcnQgaXQgaWYgeW91IGNh
bm5vdCBsaXZlIHdpdGggdGhlIGNoYW5nZXMuIElJUkMgeW91IGZvdW5kIHRoZSANCnJlZHVj
ZWQgbnVtYmVyIG9mIGFsbG9jL2ZyZWUgY3ljbGVzIHRvIGJlIGlycmVsZXZhbnQuIEJ1dCBl
dmVuIHRoZW4sIHRoZSANCnBhdGNoZXMgYWxsb3cgdXMgdG8gbW92ZSB0aGUgYWxsb2NhdGlv
biBmcm9tIGF0b21pY191cGRhdGUgdG8gDQphdG9taWNfY2hlY2ssIHRodXMgZGV0ZWN0aW5n
IGFsbG9jYXRpb24gZmFpbHVyZXMgZWFybHkuIFRoYXQncyBhbiANCmltcHJvdmVtZW50IHRv
IG1lLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBNYXhpbWUNCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYx
IE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRy
ZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcp
DQo=

--------------y5wL20YC0s7ubzF0Nk4VLttL--

--------------Xp0NL63ngeFySfqq60SgD0aD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVXO3YFAwAAAAAACgkQlh/E3EQov+As
zxAAhONfp/MJ3MZg4g0Vz+fqexTO3cbm4brXxt9QFVAa2FXjVPkOg3SUnKpCPQgZ2gYRUb0qARRl
QdAtWfQ/7x93YLMzNbhdr9r9uEMaS9Pfa2O3i8z1VJ3NPMobLd0rSL3sWJUpLYrw39HsxFxUcGlv
Zgn0H54/K+Y1AEWwdIVqDdczpCslMm5axDxxeH4I5ID+Oduy9ZGH1FI/gQJvGLfZTun3itRIMoKC
vQUFMJ+5N2HZhfWCtBOA2Z5yErVHLiz7+u7epTt+8FTj0tAvQNFkGsZ8PfrXgrXZMov9TmMqn4md
8CZt6isoyMBRiQ7z598Jje8FO5LFGfgsGbFBrwZ8g0xGKtp2N6gapJWTnd312kcOM6KCwcAvbBXy
Qg+Q4/0xoKRV7Bz7MecwJPvg5ZzyFdO1bNOI+76oy3EuGWj7+y+8QOF5hQD/ly3E75L/nXVTD01w
3K4iVlquUG7g/ZwJ6egMJdkjoZvAzd+TvNYJX065/8rbYDTJSA7SDAaf0tJQJ23ef+DpDlI77Bfn
7F5ZxGv15nu/1kuQArMlavtcYqcCh3zW6i4iI1cjOW7sn3kSv/dFpl0L6ybxH7u83l4TvWfVojzw
R+G4L7LQMGOe26LcePdzP8Panue8Fh987OC9mfK/Ld9g8RMKg/YXRE32GhW9Jr+P5AXJ7Nm1vXwT
FuI=
=d3oM
-----END PGP SIGNATURE-----

--------------Xp0NL63ngeFySfqq60SgD0aD--
