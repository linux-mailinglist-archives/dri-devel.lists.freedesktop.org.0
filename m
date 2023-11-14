Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0FB7EB3F0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9711010E221;
	Tue, 14 Nov 2023 15:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1126D10E221
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:41:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A634020292;
 Tue, 14 Nov 2023 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699976460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HlKJwJwbkvn8CVCt9tJ50RwvruPmU0ls+jBVFbTXQSs=;
 b=MqJBHt7HpUpC72tXaxADkMsEOh7xii44d3ZNsHMgHo+wecdI2jFsHHpIoQIrCCL76/4fAE
 Bxd/0fKbnZl6R4yVnF2nxmC6Hx4ZQK9709BVKk+M+jDeSR8QmOeS9BbTQqKvcS+jDUpxpH
 0xLo+AiLhNiEJyGRmPx+DPrC9EpRg7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699976460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HlKJwJwbkvn8CVCt9tJ50RwvruPmU0ls+jBVFbTXQSs=;
 b=qp1ocROcWVcyfokDcmxMCAQZ+gkPyw8ydI02stzPa21teJGFRFx+7Xj/HPlJvL6JJ6Yk4c
 jpVDIjsEEPoFXnAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 485BB13460;
 Tue, 14 Nov 2023 15:41:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id krlREAyVU2V8VwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Nov 2023 15:41:00 +0000
Message-ID: <9296c184-22c1-4d71-8b11-2d26f49a5790@suse.de>
Date: Tue, 14 Nov 2023 16:40:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm: Allow the damage helpers to handle buffer damage
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20231109172449.1599262-1-javierm@redhat.com>
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
In-Reply-To: <20231109172449.1599262-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5YCjGXD3oNwS5CkagncGMU0C"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: *
X-Spam-Score: 1.51
X-Spamd-Result: default: False [1.51 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 BAYES_SPAM(5.10)[100.00%]; XM_UA_NO_VERSION(0.01)[];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 SIGNED_PGP(-2.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; MID_RHS_MATCH_FROM(0.00)[];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[21]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[];
 FREEMAIL_CC(0.00)[emersion.fr, ffwll.ch, collabora.com, kernel.org, redhat.com,
 gmail.com, chromium.org, lwn.net, linux.intel.com, vmware.com,
 lists.freedesktop.org, vger.kernel.org, lists.linux-foundation.org]
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
 Bilal Elmoussaoui <belmouss@redhat.com>, linux-doc@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sima Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5YCjGXD3oNwS5CkagncGMU0C
Content-Type: multipart/mixed; boundary="------------HZJCdyCPyn0A1rzDfgunjj8L";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Simon Ser <contact@emersion.fr>, Sima Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Erico Nunes <nunes.erico@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org
Message-ID: <9296c184-22c1-4d71-8b11-2d26f49a5790@suse.de>
Subject: Re: [PATCH 0/6] drm: Allow the damage helpers to handle buffer damage
References: <20231109172449.1599262-1-javierm@redhat.com>
In-Reply-To: <20231109172449.1599262-1-javierm@redhat.com>

--------------HZJCdyCPyn0A1rzDfgunjj8L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA5LjExLjIzIHVtIDE4OjI0IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBIZWxsbywNCj4gDQo+IFRoaXMgc2VyaWVzIGlzIHRvIGZpeCBh
biBpc3N1ZSB0aGF0IHN1cmZhY2VkIGFmdGVyIGRhbWFnZSBjbGlwcGluZyB3YXMNCj4gZW5h
YmxlZCBmb3IgdGhlIHZpcnRpby1ncHUgYnkgY29tbWl0IDAxZjA1OTQwYTlhNyAoImRybS92
aXJ0aW86IEVuYWJsZQ0KPiBmYiBkYW1hZ2UgY2xpcHMgcHJvcGVydHkgZm9yIHRoZSBwcmlt
YXJ5IHBsYW5lIikuDQo+IA0KPiBBZnRlciB0aGF0IGNoYW5nZSwgZmxpY2tlcmluZyBhcnRp
ZmFjdHMgd2FzIHJlcG9ydGVkIHRvIGJlIHByZXNlbnQgd2l0aA0KPiBib3RoIHdlc3RvbiBh
bmQgd2xyb290cyB3YXlsYW5kIGNvbXBvc2l0b3JzIHdoZW4gcnVubmluZyBpbiBhIHZpcnR1
YWwNCj4gbWFjaGluZS4gVGhlIGNhdXNlIHdhcyBpZGVudGlmaWVkIGJ5IFNpbWEgVmV0dGVy
LCB3aG8gcG9pbnRlZCBvdXQgdGhhdA0KPiB2aXJ0aW8tZ3B1IGRvZXMgcGVyLWJ1ZmZlciB1
cGxvYWRzIGFuZCBmb3IgdGhpcyByZWFzb24gaXQgbmVlZHMgdG8gZG8NCj4gYSBidWZmZXIg
ZGFtYWdlIGhhbmRsaW5nLCBpbnN0ZWFkIG9mIGZyYW1lIGRhbWFnZSBoYW5kbGluZy4NCg0K
SSdtIGhhdmluZyBwcm9ibGVtIHVuZGVyc3RhbmRpbmcgdGhlIHR5cGVzIG9mIGRhbWFnZS4g
WW91IG5ldmVyIHNheSB3aGF0IA0KYnVmZmVyIGRhbWFnZSBpcy4gSSBhbHNvIGRvbid0IGtu
b3cgd2hhdCBhIGZyYW1lIGlzIGluIHRoaXMgY29udGV4dC4NCg0KUmVndWxhciBkYW1hZ2Ug
aGFuZGxpbmcgbWFya3MgcGFydHMgb2YgYSBwbGFuZSBhcyBkaXJ0eS9kYW1hZ2VkLiBUaGF0
IGlzIA0KcGVyLXBsYW5lIGRhbWFnZSBoYW5kbGluZy4gVGhlIGluZGl2aWR1YWwgcGxhbmVz
IG1vcmUgb3IgbGVzcyANCmluZGVwZW5kZW50IGZyb20gZWFjaCBvdGhlci4NCg0KQnVmZmVy
IGRhbWFnZSwgSSBndWVzcywgbWFya3MgdGhlIHVuZGVybHlpbmcgYnVmZmVyIGFzIGRpcnR5
IGFuZCANCnJlcXVpcmVzIHN5bmNocm9uaXphdGlvbiBvZiB0aGUgYnVmZmVyIHdpdGggc29t
ZSBiYWNraW5nIHN0b3JhZ2UuIFRoZSANCnBsYW5lcyB1c2luZyB0aGF0IGJ1ZmZlciBhcmUg
dGhlbiB1cGRhdGVkIG1vcmUgb3IgbGVzcyBhdXRvbWF0aWNhbGx5Lg0KDQpJcyB0aGF0IHJp
Z2h0Pw0KDQpBbmQgd2h5IGRvZXMgaXQgZmxpY2tlcj8gSXMgdGhlcmUgb2xkIGRhdGEgc3Rv
cmVkIHNvbWV3aGVyZT8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gVGhlaXIg
c3VnZ2VzdGlvbiB3YXMgdG8gZXh0ZW5kIHRoZSBkYW1hZ2UgaGVscGVycyB0byBjb3ZlciB0
aGF0IGNhc2UNCj4gYW5kIGdpdmVuIHRoYXQgdGhlcmUncyBpc24ndCBhIGJ1ZmZlciBkYW1h
Z2UgYWNjdW11bGF0aW9uIGFsZ29yaXRobQ0KPiAoZS5nOiBidWZmZXIgYWdlKSwganVzdCBk
byBhIGZ1bGwgcGxhbmUgdXBkYXRlIGlmIHRoZSBmcmFtZWJ1ZmZlciB0aGF0DQo+IGlzIGF0
dGFjaGVkIHRvIGEgcGxhbmUgY2hhbmdlZCBzaW5jZSB0aGUgbGFzdCBwbGFuZSB1cGRhdGUg
KHBhZ2UtZmxpcCkuDQo+IA0KPiBQYXRjaCAjMSBpcyBqdXN0IGEgcmVmYWN0b3JpbmcgdG8g
YWxsb3cgdGhlIGxvZ2ljIG9mIHRoZSBmcmFtZSBkYW1hZ2UNCj4gaGVscGVycyB0byBiZSBz
aGFyZWQgYnkgdGhlIGJ1ZmZlciBkYW1hZ2UgaGVscGVycy4NCj4gDQo+IFBhdGNoICMyIGFk
ZHMgdGhlIGhlbHBlcnMgdGhhdCBhcmUgbmVlZGVkIGZvciBidWZmZXIgZGFtYWdlIGhhbmRs
aW5nLg0KPiANCj4gUGF0Y2ggIzMgZml4ZXMgdGhlIHZpcnRpby1ncHUgZGFtYWdlIGhhbmRs
aW5nIGxvZ2ljIGJ5IHVzaW5nIHRoZQ0KPiBoZWxwZXIgdGhhdCBpcyByZXF1aXJlZCBieSBk
cml2ZXJzIHRoYXQgbmVlZCB0byBoYW5kbGUgYnVmZmVyIGRhbWFnZS4NCj4gDQo+IFBhdGNo
ICM0IGZpeGVzIHRoZSB2bXdnZnggc2ltaWxhcmx5LCBzaW5jZSB0aGF0IGRyaXZlciBhbHNv
IG5lZWRzIHRvDQo+IGhhbmRsZSBidWZmZXIgZGFtYWdlIGFuZCBzaG91bGQgaGF2ZSB0aGUg
c2FtZSBpc3N1ZSAoYWx0aG91Z2ggSSBoYXZlDQo+IG5vdCB0ZXN0ZWQgaXQgZHVlIG5vdCBo
YXZpbmcgYSBWTVdhcmUgc2V0dXApLg0KPiANCj4gUGF0Y2ggIzUgYWRkcyB0byB0aGUgS01T
IGRhbWFnZSB0cmFja2luZyBrZXJuZWwtZG9jIHNvbWUgcGFyYWdyYXBocw0KPiBhYm91dCBk
YW1hZ2UgdHJhY2tpbmcgdHlwZXMgYW5kIHJlZmVyZW5jZXMgdG8gbGlua3MgdGhhdCBleHBs
YWluDQo+IGZyYW1lIGRhbWFnZSB2cyBidWZmZXIgZGFtYWdlLg0KPiANCj4gRmluYWxseSBw
YXRjaCAjNiBhZGRzIGFuIGl0ZW0gdG8gdGhlIERSTS9LTVMgdG9kbywgYWJvdXQgdGhlIG5l
ZWQgdG8NCj4gaW1wbGVtZW50IHNvbWUgYnVmZmVyIGRhbWFnZSBhY2N1bXVsYXRpb24gYWxn
b3JpdGhtIGluc3RlYWQgb2YganVzdA0KPiBkb2luZyBhIGZ1bGwgcGxhbmUgdXBkYXRlIGlu
IHRoaXMgY2FzZS4NCj4gDQo+IEJlY2F1c2UgY29tbWl0IDAxZjA1OTQwYTlhNyBsYW5kZWQg
aW4gdjYuNCwgdGhlIGZpcnN0IHRocmVlIHBhdGNoZXMNCj4gYXJlIG1hcmtlZCBhcyBGaXhl
cyBhbmQgQ2Mgc3RhYmxlLg0KPiANCj4gSSd2ZSB0ZXN0ZWQgdGhpcyBvbiBhIFZNIHdpdGgg
d2VzdG9uLCB3YXMgYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlDQo+IHJlcG9ydGVkIGFu
ZCB0aGUgcGF0Y2hlcyBkaWQgZml4IHRoZSBwcm9ibGVtLg0KPiANCj4gUGxlYXNlIGxldCBt
ZSBrbm93IHdoYXQgeW91IHRoaW5rLiBTcGVjaWFsbHkgb24gdGhlIHdvcmRpbmcgc2luY2Ug
Y291bGQNCj4gbWFkZSBtaXN0YWtlcyBkdWUganVzdCBsZWFybmluZyBhYm91dCB0aGVzZSBj
b25jZXB0cyB5ZXN0ZXJkYXkgdGhhbmtzIHRvDQo+IFNpbWEsIFNpbW9uIGFuZCBQZWtrYS4N
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gSmF2aWVyDQo+IA0KPiANCj4gSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzICg2KToNCj4gICAgZHJtOiBNb3ZlIGRybV9hdG9taWNfaGVscGVyX2Rh
bWFnZV97aXRlcl9pbml0LG1lcmdlZH0oKSB0byBoZWxwZXJzDQo+ICAgIGRybTogQWRkIGRy
bV9hdG9taWNfaGVscGVyX2J1ZmZlcl9kYW1hZ2Vfe2l0ZXJfaW5pdCxtZXJnZWR9KCkgaGVs
cGVycw0KPiAgICBkcm0vdmlydGlvOiBVc2UgZHJtX2F0b21pY19oZWxwZXJfYnVmZmVyX2Rh
bWFnZV9tZXJnZWQoKSBmb3IgYnVmZmVyDQo+ICAgICAgZGFtYWdlDQo+ICAgIGRybS92bXdn
Zng6IFVzZSBkcm1fYXRvbWljX2hlbHBlcl9idWZmZXJfZGFtYWdlX2l0ZXJfaW5pdCgpIGZv
ciBidWZmZXINCj4gICAgICBkYW1hZ2UNCj4gICAgZHJtL3BsYW5lOiBFeHRlbmQgZGFtYWdl
IHRyYWNraW5nIGtlcm5lbC1kb2MNCj4gICAgZHJtL3RvZG86IEFkZCBlbnRyeSBhYm91dCBp
bXBsZW1lbnRpbmcgYnVmZmVyIGFnZSBmb3IgZGFtYWdlIHRyYWNraW5nDQo+IA0KPiAgIERv
Y3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0ICAgICAgICAgICAgIHwgIDIwICsrKw0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jICAgIHwgMTY2ICsrKysrKysrKysr
KysrKysrKystLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgICAgICAg
ICAgICB8ICAyMiArKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3Bs
YW5lLmMgfCAgIDIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMu
YyAgICB8ICAgMiArLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmggICAg
ICAgIHwgICA3ICsrDQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCAxNzMgaW5zZXJ0aW9ucygrKSwg
NDYgZGVsZXRpb25zKC0pDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjog
SXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2Vy
bWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------HZJCdyCPyn0A1rzDfgunjj8L--

--------------5YCjGXD3oNwS5CkagncGMU0C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVTlQsFAwAAAAAACgkQlh/E3EQov+AU
exAAnBXx599cv0UeRemGJTExKkAR7gmTXTnqLNbocwONLfWRngHRYw5l7+m+V/1KH4B/FKb5OUib
/GyB64BWvvRAVNjG/4yVmK6kIb78lFxXwSc4zOSx5trNhTAPjEgP0UJ6oufF6F0Ap4Vw5pW7fq23
F7HZca4AkH/naE6EPB1LUgAdkolC8v7n5pcjwaKsIWbxVtq7rNIbjwpy8yg7NWZ4TbUjjC5tnEUA
DXEbZOP6g3ECy1d2HvLDVY2E490BKZg0qM5CH6H7uogMO1VXsMy1T5ZQnRyNSTzCm710QmU8FS9X
CQBRVMtudqrJXBvWqEz+OJ75XZGxZiFgNd7JrzKNx54wcNNwOY5AjVvxKAPyIer7ge/TcAq9fZI9
jIt+6sLt/0OmAGdMK78RbjQ1hpi1F7VeE9/kR2CUdlJyW96UrWLJeh6Oo1I0hIS8O18F1t84xGcK
m2td0Gn7cNMV1uWi2q3pFr3GHCXxFTB2ThffDZzoXqe9DYX62/9VoaQgqFlXCcD/LRuPbhnaW458
SZ7c25qQTkfDmd6QTkcHQBDdt/nJmvojoHDCAuhKDXtSMGy7w32LQaIeEuSSJGbA8BHHSBICIXTL
LXmZzaPx+SvbyOVaAOh7FCfm9L3ZntoWFWD9D+kDbEyYC6maXPpLTwlF+BuMkWTBnmtF/UrjhId0
wgE=
=nZv3
-----END PGP SIGNATURE-----

--------------5YCjGXD3oNwS5CkagncGMU0C--
