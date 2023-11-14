Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BC37EB4FD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AB410E477;
	Tue, 14 Nov 2023 16:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D0C10E476
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:36:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B38BB228B6;
 Tue, 14 Nov 2023 16:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699979793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=STBLIvd9B3Ka4YzSlK5W5SFOf7AEgrvcpAECA4YCEs4=;
 b=rr719crZT6KmbfClOmXqvcv1I0ApIZ9wYJfvjYyuAAWVqpHR1IQtfPCnVq6W3T/It7mQEV
 GUc7IA00qw5XEXvS7wyhMoKDJjaoQ1vIaNmXLlHBfwZjcD4c1nf/8/xxJ5b40fCLRwaSrP
 i1XQw1WP/qaFkgxRSmBs5Qul/i8HO6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699979793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=STBLIvd9B3Ka4YzSlK5W5SFOf7AEgrvcpAECA4YCEs4=;
 b=amgPPgLuamsTPmmJ0rqgZUoCljtdc5AHVKiH783+nLMCNMcERXwj6nbGF4XsnFQ/3rVq7B
 IioHXyouJz8whRAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72EE813416;
 Tue, 14 Nov 2023 16:36:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8CNBGxGiU2V3dQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Nov 2023 16:36:33 +0000
Message-ID: <c28b6e4a-aea0-4de4-a194-aa1024a93476@suse.de>
Date: Tue, 14 Nov 2023 17:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm: Allow the damage helpers to handle buffer damage
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20231109172449.1599262-1-javierm@redhat.com>
 <9296c184-22c1-4d71-8b11-2d26f49a5790@suse.de>
 <87wmuk5mfj.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87wmuk5mfj.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nM3V1XERUOB4F0ASvZZgUSoi"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -10.59
X-Spamd-Result: default: False [-10.59 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 SIGNED_PGP(-2.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[15]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[];
 FREEMAIL_CC(0.00)[collabora.com, lists.freedesktop.org, lwn.net, redhat.com,
 vger.kernel.org, kernel.org, chromium.org, vmware.com, ffwll.ch,
 lists.linux-foundation.org, gmail.com]
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
Cc: Erico Nunes <nunes.erico@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, linux-doc@vger.kernel.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nM3V1XERUOB4F0ASvZZgUSoi
Content-Type: multipart/mixed; boundary="------------hyk6vUikYz4urD9DYhCPRNuI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 Bilal Elmoussaoui <belmouss@redhat.com>, linux-doc@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sima Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Erico Nunes <nunes.erico@gmail.com>
Message-ID: <c28b6e4a-aea0-4de4-a194-aa1024a93476@suse.de>
Subject: Re: [PATCH 0/6] drm: Allow the damage helpers to handle buffer damage
References: <20231109172449.1599262-1-javierm@redhat.com>
 <9296c184-22c1-4d71-8b11-2d26f49a5790@suse.de>
 <87wmuk5mfj.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87wmuk5mfj.fsf@minerva.mail-host-address-is-not-set>

--------------hyk6vUikYz4urD9DYhCPRNuI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMTEuMjMgdW0gMTc6Mjggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPj4gSGkgSmF2aWVyDQo+Pg0KPj4gQW0gMDkuMTEuMjMgdW0gMTg6MjQgc2No
cmllYiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXM6DQo+Pj4gSGVsbG8sDQo+Pj4NCj4+PiBU
aGlzIHNlcmllcyBpcyB0byBmaXggYW4gaXNzdWUgdGhhdCBzdXJmYWNlZCBhZnRlciBkYW1h
Z2UgY2xpcHBpbmcgd2FzDQo+Pj4gZW5hYmxlZCBmb3IgdGhlIHZpcnRpby1ncHUgYnkgY29t
bWl0IDAxZjA1OTQwYTlhNyAoImRybS92aXJ0aW86IEVuYWJsZQ0KPj4+IGZiIGRhbWFnZSBj
bGlwcyBwcm9wZXJ0eSBmb3IgdGhlIHByaW1hcnkgcGxhbmUiKS4NCj4+Pg0KPj4+IEFmdGVy
IHRoYXQgY2hhbmdlLCBmbGlja2VyaW5nIGFydGlmYWN0cyB3YXMgcmVwb3J0ZWQgdG8gYmUg
cHJlc2VudCB3aXRoDQo+Pj4gYm90aCB3ZXN0b24gYW5kIHdscm9vdHMgd2F5bGFuZCBjb21w
b3NpdG9ycyB3aGVuIHJ1bm5pbmcgaW4gYSB2aXJ0dWFsDQo+Pj4gbWFjaGluZS4gVGhlIGNh
dXNlIHdhcyBpZGVudGlmaWVkIGJ5IFNpbWEgVmV0dGVyLCB3aG8gcG9pbnRlZCBvdXQgdGhh
dA0KPj4+IHZpcnRpby1ncHUgZG9lcyBwZXItYnVmZmVyIHVwbG9hZHMgYW5kIGZvciB0aGlz
IHJlYXNvbiBpdCBuZWVkcyB0byBkbw0KPj4+IGEgYnVmZmVyIGRhbWFnZSBoYW5kbGluZywg
aW5zdGVhZCBvZiBmcmFtZSBkYW1hZ2UgaGFuZGxpbmcuDQo+Pg0KPj4gSSdtIGhhdmluZyBw
cm9ibGVtIHVuZGVyc3RhbmRpbmcgdGhlIHR5cGVzIG9mIGRhbWFnZS4gWW91IG5ldmVyIHNh
eSB3aGF0DQo+PiBidWZmZXIgZGFtYWdlIGlzLiBJIGFsc28gZG9uJ3Qga25vdyB3aGF0IGEg
ZnJhbWUgaXMgaW4gdGhpcyBjb250ZXh0Lg0KPj4NCj4+IFJlZ3VsYXIgZGFtYWdlIGhhbmRs
aW5nIG1hcmtzIHBhcnRzIG9mIGEgcGxhbmUgYXMgZGlydHkvZGFtYWdlZC4gVGhhdCBpcw0K
Pj4gcGVyLXBsYW5lIGRhbWFnZSBoYW5kbGluZy4gVGhlIGluZGl2aWR1YWwgcGxhbmVzIG1v
cmUgb3IgbGVzcw0KPj4gaW5kZXBlbmRlbnQgZnJvbSBlYWNoIG90aGVyLg0KPj4NCj4+IEJ1
ZmZlciBkYW1hZ2UsIEkgZ3Vlc3MsIG1hcmtzIHRoZSB1bmRlcmx5aW5nIGJ1ZmZlciBhcyBk
aXJ0eSBhbmQNCj4+IHJlcXVpcmVzIHN5bmNocm9uaXphdGlvbiBvZiB0aGUgYnVmZmVyIHdp
dGggc29tZSBiYWNraW5nIHN0b3JhZ2UuIFRoZQ0KPj4gcGxhbmVzIHVzaW5nIHRoYXQgYnVm
ZmVyIGFyZSB0aGVuIHVwZGF0ZWQgbW9yZSBvciBsZXNzIGF1dG9tYXRpY2FsbHkuDQo+Pg0K
Pj4gSXMgdGhhdCByaWdodD8NCj4+DQo+IA0KPiBJbiBib3RoIGNhc2VzIHRoZSBkYW1hZ2Ug
dHJhY2tpbmcgaW5mb3JtYXRpb24gaXMgdGhlIHNhbWUsIHRoZXkgbWFyaw0KPiB0aGUgZGFt
YWdlZCByZWdpb25zIG9uIHRoZSBwbGFuZSBpbiBmcmFtZWJ1ZmZlciBjb29yZGluYXRlcyBv
ZiB0aGUNCj4gZnJhbWVidWZmZXIgYXR0YWNoZWQgdG8gdGhlIHBsYW5lLg0KPiANCj4gVGhl
IHByb2JsZW0gYXMgZmFyIGFzIEkgdW5kZXJzdGFuZCBpcyB3aGV0aGVyIHRoZSBkcml2ZXIg
ZXhwZWN0cyB0aGF0DQo+IHRvIGRldGVybWluZSB0aGUgYXJlYSB0aGF0IGNoYW5nZWQgaW4g
dGhlIHBsYW5lIChhbmQgYSBwbGFuZSBmbHVzaCBpcw0KPiBlbm91Z2gpIG9yIHRoZSBhcmVh
IHRoYXQgY2hhbmdlZCBzaW5jZSB0aGF0IHNhbWUgYnVmZmVyIHdhcyBsYXN0IHVzZWQuDQo+
IA0KPj4gQW5kIHdoeSBkb2VzIGl0IGZsaWNrZXI/IElzIHRoZXJlIG9sZCBkYXRhIHN0b3Jl
ZCBzb21ld2hlcmU/DQo+Pg0KPiANCj4gSXQgZmxpY2tlcnMgYmVjYXVzZSB0aGUgZnJhbWVi
dWZmZXIgY2hhbmdlZCBhbmQgc28gdGhlIGRhbWFnZSB0cmFja2luZw0KPiBpcyBub3QgdXNl
ZCBjb3JyZWN0bHkgdG8gZmx1c2ggdGhlIGRhbWFnZWQgYXJlYXMgdG8gdGhlIGJhY2tpbmcg
c3RvcmFnZS4NCg0KSSB0aGluayBJIGdvdCBpdCBmcm9tIHRoZSBsaW5rcyBpbiBwYXRjaCA1
LiAgSW4gb3V0IG90aGVyIGRyaXZlcnMsIA0KdGhlcmUncyBhIHNpbmdsZSBiYWNraW5nIHN0
b3JhZ2UgZm9yIGVhY2ggcGxhbmUgKGZvciBleGFtcGxlIGluIHRoZSANCnZpZGVvIG1lbW9y
eSkuIEhlcmUsIHRoZXJlJ3MgYSBiYWNraW5nIHN0b3JhZ2UgZm9yIGVhY2ggYnVmZmVyLiBP
biBwYWdlIA0KZmxpcHMsIHRoZSBwbGFuZSBjaGFuZ2VzIGl0cyBiYWNraW5nIHN0b3JhZ2Uu
ICBPdXIgR0VNIGJ1ZmZlciBpcyB1cCB0byANCmRhdGUsIGJ1dCB0aGUgcmVzcGVjdGl2ZSBi
YWNraW5nIHN0b3JhZ2UgaXMgbWlzc2luZyBhbGwgdGhlIGludGVybWVkaWF0ZSANCmNoYW5n
ZXMuDQoNCklmIEknbSBub3QgbWlzdGFrZW4sIGFuIGVudGlyZWx5IGRpZmZlcmVudCBzb2x1
dGlvbiB3b3VsZCBiZSB0byANCmltcGxlbWVudCBhIHBlci1wbGFuZSBiYWNrIHN0b3JhZ2Ug
aW4gdGhlc2UgZHJpdmVycy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gVGhp
cyBpcyBteSB1bmRlcnN0YW5kaW5nIGF0IGxlYXN0LCBwbGVhc2UgU2ltYSBvciBTaW1vbiBj
b3JyZWN0IG1lIGlmIEkNCj4gZ290IHRoaXMgd3JvbmcuDQo+IA0KPj4gQmVzdCByZWdhcmRz
DQo+PiBUaG9tYXMNCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjog
SXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2Vy
bWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------hyk6vUikYz4urD9DYhCPRNuI--

--------------nM3V1XERUOB4F0ASvZZgUSoi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVTohEFAwAAAAAACgkQlh/E3EQov+Cm
9Q//YM7s4S48GCkvptjMkdQR1mz/PNRB30C519mmog3CnwWNv5rzHTMPZopk7jZqECsvxkOMTFXY
mPnk/lgJkWPJTboOcLuwwiAMzmzSubqlhNeP/MQv6ly9eSBVabFC1qlWvRg3OveZfZfWa0GwvamR
LyXBJ39X80ighFNIf/i4Q9SCYRczs/TvU/Eskg0Ywn4NJwcjzYnOJQBtJdqGpOLq/TolWeIRl7Ag
cKnZUhA32rFvl+10oN6FNrBN0JXVJ3MHUkkzhe4bGOJ58BKW8HXXBI98CbB/klMaEo73bOKnIk8h
+JL3MgTRc5cvm879wgUtZoxS/99OdSROIL53DDYkrOAPgyrjJ3e8tLx/W4rI26F2FcqkmXUGATOL
qEdN/qegBEsIsxZY2jD52RlzL90tttwtHPakHGOBobwivr8uJpu5DUnNepVURnytXtCRi7170VbS
McHexDQQSFiR4oyzjbc1O62FlkgzZ0eLnmhCAt5ImEJUXgn2JMfWeXuzOvx/iU3EtY1dYm6WN2el
Ahxnf0C7l5wCc47nBW8T6FMuUc2VZT+dUGEtZd/irOFE/0phkONwfBpl3h9h8Yfbo2en6a4ntWPf
hIuY8GV3hm93XU/rRUgcq0BTjTdg7OdDOV4KmSunt/V8LXd9ifeu1FCRa2yLZX66eFgkzCJvsfn7
LgQ=
=ySGi
-----END PGP SIGNATURE-----

--------------nM3V1XERUOB4F0ASvZZgUSoi--
