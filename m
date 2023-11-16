Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 554117EE05F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 13:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF5D10E5C7;
	Thu, 16 Nov 2023 12:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC36210E5C7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 12:07:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08BDC22944;
 Thu, 16 Nov 2023 12:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700136475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SdmFJRr4Si5h0PIb8OUUGx3aM3YL7HZjF2KKvaXWYpo=;
 b=LU5Xmw6ajCwHu9Il/zU/lEWWAN7qqJPIVcsgFEnq200tlrHx5PlZwDONUbv0jZUHdShyT7
 +d0Fk4JUapKT2Qrvbd8exfVCQUwndELJaGg8ljrcdB9XM0Skm2/hmNAPc/qL4DiUouCG4A
 JVksZYOT13RXtfudBaG72JdaH83xtUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700136475;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SdmFJRr4Si5h0PIb8OUUGx3aM3YL7HZjF2KKvaXWYpo=;
 b=+U0iK3dI2BhFGoIMIyjvRF9IfteLG88eNCFfSTOAqye8Lu8gsx3MufEE54SusBvQp/HBUz
 jg+xrz36s2A3hXCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79B3A1377E;
 Thu, 16 Nov 2023 12:07:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CMydGhoGVmXCYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Nov 2023 12:07:54 +0000
Message-ID: <95ba4d72-441d-4bb2-8fcd-39b748f1eb37@suse.de>
Date: Thu, 16 Nov 2023 13:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm: Allow the damage helpers to handle buffer
 damage
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20231115131549.2191589-1-javierm@redhat.com>
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
In-Reply-To: <20231115131549.2191589-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VD60tmeiTEWkm1bJy0V0MmyH"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.05
X-Spamd-Result: default: False [0.05 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 BAYES_SPAM(4.84)[99.35%]; XM_UA_NO_VERSION(0.01)[];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 SIGNED_PGP(-2.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; MID_RHS_MATCH_FROM(0.00)[];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[21]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[];
 FREEMAIL_CC(0.00)[kernel.org, redhat.com, emersion.fr, gmail.com, collabora.com,
 ffwll.ch, chromium.org, lwn.net, linux.intel.com, vmware.com,
 lists.freedesktop.org, vger.kernel.org, lists.linux.dev]
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VD60tmeiTEWkm1bJy0V0MmyH
Content-Type: multipart/mixed; boundary="------------49dyl47sZl0hpVGsE90avT3q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 Bilal Elmoussaoui <belmouss@redhat.com>, Simon Ser <contact@emersion.fr>,
 Erico Nunes <nunes.erico@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Chia-I Wu <olvaffe@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux.dev
Message-ID: <95ba4d72-441d-4bb2-8fcd-39b748f1eb37@suse.de>
Subject: Re: [PATCH v2 0/5] drm: Allow the damage helpers to handle buffer
 damage
References: <20231115131549.2191589-1-javierm@redhat.com>
In-Reply-To: <20231115131549.2191589-1-javierm@redhat.com>

--------------49dyl47sZl0hpVGsE90avT3q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyLA0KDQpwbGVhc2UgdGFrZSBteQ0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCmZvciB0aGUgd2hvbGUgcGF0Y2gg
c2V0LiBNYXliZSBjb25zaWRlciBteSBjb21tZW50IG9uIHBhdGNoIDQuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCkFtIDE1LjExLjIzIHVtIDE0OjE1IHNjaHJpZWIgSmF2aWVyIE1h
cnRpbmV6IENhbmlsbGFzOg0KPiBIZWxsbywNCj4gDQo+IFRoaXMgc2VyaWVzIGlzIHRvIGZp
eCBhbiBpc3N1ZSB0aGF0IHN1cmZhY2VkIGFmdGVyIGRhbWFnZSBjbGlwcGluZyB3YXMNCj4g
ZW5hYmxlZCBmb3IgdGhlIHZpcnRpby1ncHUgYnkgY29tbWl0IDAxZjA1OTQwYTlhNyAoImRy
bS92aXJ0aW86IEVuYWJsZQ0KPiBmYiBkYW1hZ2UgY2xpcHMgcHJvcGVydHkgZm9yIHRoZSBw
cmltYXJ5IHBsYW5lIikuDQo+IA0KPiBBZnRlciB0aGF0IGNoYW5nZSwgZmxpY2tlcmluZyBh
cnRpZmFjdHMgd2FzIHJlcG9ydGVkIHRvIGJlIHByZXNlbnQgd2l0aA0KPiBib3RoIHdlc3Rv
biBhbmQgd2xyb290cyB3YXlsYW5kIGNvbXBvc2l0b3JzIHdoZW4gcnVubmluZyBpbiBhIHZp
cnR1YWwNCj4gbWFjaGluZS4gVGhlIGNhdXNlIHdhcyBpZGVudGlmaWVkIGJ5IFNpbWEgVmV0
dGVyLCB3aG8gcG9pbnRlZCBvdXQgdGhhdA0KPiB2aXJ0aW8tZ3B1IGRvZXMgcGVyLWJ1ZmZl
ciB1cGxvYWRzIGFuZCBmb3IgdGhpcyByZWFzb24gaXQgbmVlZHMgdG8gZG8NCj4gYSBidWZm
ZXIgZGFtYWdlIGhhbmRsaW5nLCBpbnN0ZWFkIG9mIGZyYW1lIGRhbWFnZSBoYW5kbGluZy4N
Cj4gDQo+IFRoZWlyIHN1Z2dlc3Rpb24gd2FzIHRvIGV4dGVuZCB0aGUgZGFtYWdlIGhlbHBl
cnMgdG8gY292ZXIgdGhhdCBjYXNlDQo+IGFuZCBnaXZlbiB0aGF0IHRoZXJlJ3MgaXNuJ3Qg
YSBidWZmZXIgZGFtYWdlIGFjY3VtdWxhdGlvbiBhbGdvcml0aG0NCj4gKGUuZzogYnVmZmVy
IGFnZSksIGp1c3QgZG8gYSBmdWxsIHBsYW5lIHVwZGF0ZSBpZiB0aGUgZnJhbWVidWZmZXIg
dGhhdA0KPiBpcyBhdHRhY2hlZCB0byBhIHBsYW5lIGNoYW5nZWQgc2luY2UgdGhlIGxhc3Qg
cGxhbmUgdXBkYXRlIChwYWdlLWZsaXApLg0KPiANCj4gSXQgaXMgYSB2MiB0aGF0IGFkZHJl
c3NlcyBpc3N1ZXMgcG9pbnRlZCBvdXQgYnkgVGhvbWFzIFppbW1lcm1hbm4gaW4gdjE6DQo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDIz
LU5vdmVtYmVyLzQzMDEzOC5odG1sDQo+IA0KPiBQYXRjaCAjMSBhZGRzIGEgaWdub3JlX2Rh
bWFnZV9jbGlwcyBmaWVsZCB0byBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlIHRvIGJlDQo+IHNl
dCBieSBkcml2ZXJzIHRoYXQgd2FudCB0aGUgZGFtYWdlIGhlbHBlcnMgdG8gaWdub3JlIHRo
ZSBkYW1hZ2UgY2xpcHMuDQo+IA0KPiBQYXRjaCAjMiBmaXhlcyB0aGUgdmlydGlvLWdwdSBk
YW1hZ2UgaGFuZGxpbmcgbG9naWMgYnkgYXNraW5nIHRoZSBkYW1hZ2UNCj4gaGVscGVyIHRv
IGlnbm9yZSB0aGUgZGFtYWdlIGNsaXBzIGlmIHRoZSBmcmFtZWJ1ZmZlciBhdHRhY2hlZCB0
byBhIHBsYW5lDQo+IGhhcyBjaGFuZ2VkIHNpbmNlIHRoZSBsYXN0IHBhZ2UtZmxpcC4NCj4g
DQo+IFBhdGNoICMzIGRvZXMgdGhlIHNhbWUgYnV0IGZvciB0aGUgdm13Z2Z4IGRyaXZlciB0
aGF0IGFsc28gbmVlZHMgdG8gaGFuZGxlDQo+IGJ1ZmZlciBkYW1hZ2UgYW5kIHNob3VsZCBo
YXZlIHRoZSBzYW1lIGlzc3VlIChhbHRob3VnaCBJIGhhdmVuJ3QgdGVzdGVkIGl0DQo+IGR1
ZSBub3QgaGF2aW5nIGEgVk1XYXJlIHNldHVwKS4NCj4gDQo+IFBhdGNoICM0IGFkZHMgdG8g
dGhlIEtNUyBkYW1hZ2UgdHJhY2tpbmcga2VybmVsLWRvYyBzb21lIHBhcmFncmFwaHMgYWJv
dXQNCj4gZGFtYWdlIHRyYWNraW5nIHR5cGVzIGFuZCByZWZlcmVuY2VzIHRvIGxpbmtzIHRo
YXQgZXhwbGFpbiBmcmFtZSBkYW1hZ2UgdnMNCj4gYnVmZmVyIGRhbWFnZS4NCj4gDQo+IEZp
bmFsbHkgcGF0Y2ggIzUgYWRkcyBhbiBpdGVtIHRvIHRoZSBEUk0gdG9kbywgYWJvdXQgdGhl
IG5lZWQgdG8gaW1wbGVtZW50DQo+IHNvbWUgYnVmZmVyIGRhbWFnZSBhY2N1bXVsYXRpb24g
YWxnb3JpdGhtIGluc3RlYWQgb2YganVzdCBkb2luZyBmdWxsIHBsYW5lDQo+IHVwZGF0ZXMg
aW4gdGhpcyBjYXNlLg0KPiANCj4gQmVjYXVzZSBjb21taXQgMDFmMDU5NDBhOWE3IGxhbmRl
ZCBpbiB2Ni40LCB0aGUgZmlyc3QgMiBwYXRjaGVzIGFyZSBtYXJrZWQNCj4gYXMgRml4ZXMg
YW5kIENjIHN0YWJsZS4NCj4gDQo+IEkndmUgdGVzdGVkIHRoaXMgb24gYSBWTSB3aXRoIHdl
c3Rvbiwgd2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZQ0KPiByZXBvcnRlZCBhbmQg
dGhlIHBhdGNoZXMgZGlkIGZpeCB0aGUgcHJvYmxlbS4NCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cj4gSmF2aWVyDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIEFkZCBhIHN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgLmlnbm9yZV9kYW1hZ2VfY2xpcHMgdG8gc2V0IGluIHRoZSBwbGFuZSdz
DQo+ICAgIC5hdG9taWNfY2hlY2ssIGluc3RlYWQgb2YgaGF2aW5nIGRpZmZlcmVudCBoZWxw
ZXJzIChUaG9tYXMgWmltbWVybWFubikuDQo+IC0gU2V0IHN0cnVjdCBkcm1fcGxhbmVfc3Rh
dGUgLmlnbm9yZV9kYW1hZ2VfY2xpcHMgaW4gdmlydGlvLWdwdSBwbGFuZSdzDQo+ICAgIC5h
dG9taWNfY2hlY2sgaW5zdGVhZCBvZiB1c2luZyBhIGRpZmZlcmVudCBoZWxwZXJzIChUaG9t
YXMgWmltbWVybWFubikuDQo+IC0gU2V0IHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgLmlnbm9y
ZV9kYW1hZ2VfY2xpcHMgaW4gdm13Z2Z4IHBsYW5lJ3MNCj4gICAgLmF0b21pY19jaGVjayBp
bnN0ZWFkIG9mIHVzaW5nIGEgZGlmZmVyZW50IGhlbHBlcnMgKFRob21hcyBaaW1tZXJtYW5u
KS4NCj4gDQo+IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyAoNSk6DQo+ICAgIGRybTogQWxs
b3cgZHJpdmVycyB0byBpbmRpY2F0ZSB0aGUgZGFtYWdlIGhlbHBlcnMgdG8gaWdub3JlIGRh
bWFnZQ0KPiAgICAgIGNsaXBzDQo+ICAgIGRybS92aXJ0aW86IERpc2FibGUgZGFtYWdlIGNs
aXBwaW5nIGlmIEZCIGNoYW5nZWQgc2luY2UgbGFzdCBwYWdlLWZsaXANCj4gICAgZHJtL3Zt
d2dmeDogRGlzYWJsZSBkYW1hZ2UgY2xpcHBpbmcgaWYgRkIgY2hhbmdlZCBzaW5jZSBsYXN0
IHBhZ2UtZmxpcA0KPiAgICBkcm0vcGxhbmU6IEV4dGVuZCBkYW1hZ2UgdHJhY2tpbmcga2Vy
bmVsLWRvYw0KPiAgICBkcm0vdG9kbzogQWRkIGVudHJ5IGFib3V0IGltcGxlbWVudGluZyBi
dWZmZXIgYWdlIGZvciBkYW1hZ2UgdHJhY2tpbmcNCj4gDQo+ICAgRG9jdW1lbnRhdGlvbi9n
cHUvdG9kby5yc3QgICAgICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKw0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jICAgIHwgIDMgKystDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jICAgICAgICAgICAgfCAyMCArKysrKysrKysr
KysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5j
IHwgMTAgKysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2tt
cy5jICAgIHwgMTEgKysrKysrKysrKysNCj4gICBpbmNsdWRlL2RybS9kcm1fcGxhbmUuaCAg
ICAgICAgICAgICAgICB8ICA4ICsrKysrKysrDQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCA3MSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBH
ZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwg
Qm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------49dyl47sZl0hpVGsE90avT3q--

--------------VD60tmeiTEWkm1bJy0V0MmyH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVWBhoFAwAAAAAACgkQlh/E3EQov+Aa
5g/+Jevsj8sedobQpP3DVRHU9EreRChHbIu+D4QCWXAM6OcWB361EIMh0+E0KyMoKd2HGGeM0Vsr
wiNZyfT77r3AC9VBhmyPYkeSy2kfQ+Oy9x7ev9igz6TCCBGq9u9kaHZebbsQaTKHQ/k9lWdJabAz
jh9ijYbhdHGO6tNtSgsUndDymFSSJSV445fgZ4Y0oaMbQ1mqRYu9ipLRpKT2r3VcAHr8pqPCbDvJ
DegAJzTIFKffR0foL0SHDU1T20IvO/ANWF2LRoh6+aACDfXutgKLy9d0/f15A5Po7yeqiBfDwIse
6hh6xqsnz+zSE9/FtCajr3m/U4dbGpZOeBibDBkx/XimqNgk35RwS3MjBtkjYWNeeTaWq00fEJP5
EmsUclsHNfwV2CyhH3BZ8o7/4gBGGE1hhq4xMB4SuIBese018G7/qaoE/LrqYNDNWbryZ597AB/c
kCVyfHPuiRyXsjyZ0txjCpuKWI9Kgi/4o/VpbvSex6TKHOORdhNEBWiobQ0Nw6AJoT3AiT5ME1oA
o5iqJWpLMZP4rSy+iuFcneyu6Yfml9CzzJVw8xv+YBvydaPBF3LmZscFHKjVYlq7vl1rsRWmpzf5
u572YlGCYN5AXEqe9urOlf+xDtZ/1y7BZZb49fAcflKeJSM11Hkb8Ehwo7/yzUX5vQWh/TVmR8hl
uwk=
=j5Mu
-----END PGP SIGNATURE-----

--------------VD60tmeiTEWkm1bJy0V0MmyH--
