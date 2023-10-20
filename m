Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B977A7D0F5D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 14:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44A810E5B4;
	Fri, 20 Oct 2023 12:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913D110E5AE
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 12:06:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD8431F8A3;
 Fri, 20 Oct 2023 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697803590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YmsWSxSPjuFLE88SEJXPbWu1MeCmpruCliCZ9KRkMXw=;
 b=Y853UzFaVN7Q5POcrpjIOqtkshkRSXJFaxivNa3gL2Fv+pykLcQUegFSYRaFbZGndksMFh
 zIJQ8vX67Vecz7XuNSt13X9Hq72GmSHdjRgMqEjMwhG5eO+7ZaEcLQWZGoCtQ7zscNekaq
 srcx5aWbHLo8dEXJtuT4X/LMMDajm6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697803590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YmsWSxSPjuFLE88SEJXPbWu1MeCmpruCliCZ9KRkMXw=;
 b=SYSbzmYMrkVDW/zszI1loRjf2JwKhRS75mP+5Mu/zj8n2xsOE7huQrz/Wy3/jKUUgxzdRL
 Q6QhkmNSSsOAf3DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D59D13584;
 Fri, 20 Oct 2023 12:06:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z5dZJUZtMmXjfQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 20 Oct 2023 12:06:30 +0000
Message-ID: <660c0260-0e22-4e9c-ab13-157adaa0b14d@suse.de>
Date: Fri, 20 Oct 2023 14:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Flush the cache to improve latency
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, daniel@ffwll.ch
References: <20231019135655.313759-1-jfalempe@redhat.com>
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
In-Reply-To: <20231019135655.313759-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ilCcIR2QPy0MADPBpjWT6vrz"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -12.09
X-Spamd-Result: default: False [-12.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 SIGNED_PGP(-2.00)[]; FROM_EQ_ENVFROM(0.00)[];
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ilCcIR2QPy0MADPBpjWT6vrz
Content-Type: multipart/mixed; boundary="------------eggBdS7q34snTXIqvx6FK0y8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, daniel@ffwll.ch
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <660c0260-0e22-4e9c-ab13-157adaa0b14d@suse.de>
Subject: Re: [PATCH] drm/mgag200: Flush the cache to improve latency
References: <20231019135655.313759-1-jfalempe@redhat.com>
In-Reply-To: <20231019135655.313759-1-jfalempe@redhat.com>

--------------eggBdS7q34snTXIqvx6FK0y8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KGNjJ2luZyBsa21sIGZvciBmZWVkYmFjaykNCg0KSGkgSm9jZWx5bg0KDQpBbSAxOS4xMC4y
MyB1bSAxNTo1NSBzY2hyaWViIEpvY2VseW4gRmFsZW1wZToNCj4gV2UgZm91bmQgYSByZWdy
ZXNzaW9uIGluIHY1LjEwIG9uIHJlYWwtdGltZSBzZXJ2ZXIsIHVzaW5nIHRoZQ0KPiBydC1r
ZXJuZWwgYW5kIHRoZSBtZ2FnMjAwIGRyaXZlci4gSXQncyBzb21lIHJlYWxseSBzcGVjaWFs
aXplZA0KPiB3b3JrbG9hZCwgd2l0aCA8MTB1cyBsYXRlbmN5IGV4cGVjdGF0aW9uIG9uIGlz
b2xhdGVkIGNvcmUuDQo+IEFmdGVyIHRoZSB2NS4xMCwgdGhlIHJlYWwgdGltZSB0YXNrcyBt
aXNzZWQgdGhlaXIgPDEwdXMgbGF0ZW5jeQ0KPiB3aGVuIHNvbWV0aGluZyBwcmludHMgb24g
dGhlIHNjcmVlbiAoZmJjb24gb3IgcHJpbnRrKQ0KDQpJJ2QgbGlrZSB0byBoZWFyIHRoZSBv
cGluaW9uIG9mIHRoZSBSVC1kZXZzIG9uIHRoaXMgcGF0Y2guIEJlY2F1c2UgQUZBSUsgDQp3
ZSBuZXZlciBkaWQgc3VjaCBhIHdvcmthcm91bmQgaW4gb3RoZXIgZHJpdmVycy4gQW5kIEFG
QUlLIHByaW50ayBpcyBhIA0KUElUQSBhbnl3YXkuDQoNCklNSE8gaWYgdGhhdCBSVCBzeXN0
ZW0gY2Fubm90IGhhbmRsZSBkaWZmZXJlbmNlcyBpbiBmcmFtZWJ1ZmZlciBjYWNoaW5nLCAN
Cml0J3MgdW5kZXItcG93ZXJlZC4gSXQncyBqdXN0IGEgbWF0dGVyIG9mIHRpbWUgdW50aWwg
c29tZXRoaW5nIGVsc2UgDQpjaGFuZ2VzIGFuZCB0aGUgcHJvYmxlbSByZXR1cm5zLiBBbmQg
KGhvbmVzdCBxdWVzdGlvbikgYXMgaXQncyBhbiANCng4Ni02NCwgaG93IGRvIHRoZXkgaGFu
ZGxlIFN5c3RlbSBNYW5hZ2VtZW50IE1vZGU/DQoNCj4gDQo+IFRoZSByZWdyZXNzaW9uIGhh
cyBiZWVuIGJpc2VjdGVkIHRvIDIgY29tbWl0czoNCj4gMGIzNGQ1OGI2YzMyICgiZHJtL21n
YWcyMDA6IEVuYWJsZSBjYWNoaW5nIGZvciBTSE1FTSBwYWdlcyIpDQo+IDQ4NjJmZmFlYzUy
MyAoImRybS9tZ2FnMjAwOiBNb3ZlIHZtYXAgb3V0IG9mIGNvbW1pdCB0YWlsIikNCj4gDQo+
IFRoZSBmaXJzdCBvbmUgY2hhbmdlZCB0aGUgc3lzdGVtIG1lbW9yeSBmcmFtZWJ1ZmZlciBm
cm9tIFdyaXRlLUNvbWJpbmUNCj4gdG8gdGhlIGRlZmF1bHQgY2FjaGluZy4NCj4gQmVmb3Jl
IHRoZSBzZWNvbmQgY29tbWl0LCB0aGUgbWdhZzIwMCBkcml2ZXIgdXNlZCB0byB1bm1hcCB0
aGUNCj4gZnJhbWVidWZmZXIgYWZ0ZXIgZWFjaCBmcmFtZSwgd2hpY2ggaW1wbGljaXRseSBk
b2VzIGEgY2FjaGUgZmx1c2guDQo+IEJvdGggcmVncmVzc2lvbnMgYXJlIGZpeGVkIGJ5IHRo
ZSBmb2xsb3dpbmcgcGF0Y2gsIHdoaWNoIGZvcmNlcyBhDQo+IGNhY2hlIGZsdXNoIGFmdGVy
IGVhY2ggZnJhbWUsIHJldmVydGluZyB0byBhbG1vc3QgdjUuOSBiZWhhdmlvci4NCg0KV2l0
aCB0aGF0IHNlY29uZCBjb21taXQsIHdlIGVzc2VudGlhbGx5IG5ldmVyIHVubWFwIGFuIGFj
dGl2ZSANCmZyYW1lYnVmZmVyIGNvbnNvbGUuIEJ1dCB3aXRoIGNvbW1pdA0KDQozNTljNjY0
OWNkOWEgKCJkcm0vZ2VtOiBJbXBsZW1lbnQgc2hhZG93LXBsYW5lIHtiZWdpbiwgZW5kfV9m
Yl9hY2Nlc3MgDQp3aXRoIHZtYXAiKQ0KDQp3ZSBub3cgYWdhaW4gdW5tYXAgdGhlIGNvbnNv
bGUgZnJhbWVidWZmZXIgYWZ0ZXIgdGhlIHBhZ2VmbGlwIGhhcHBlbmVkLg0KDQpTbyBob3cg
ZG9lcyB0aGUgbGF0ZXN0IGtlcm5lbCBiZWhhdmUgd3J0IHRvIHRoZSBwcm9ibGVtPw0KDQo+
IFRoaXMgaXMgbmVjZXNzYXJ5IG9ubHkgaWYgeW91IGhhdmUgc3Ryb25nIHJlYWx0aW1lIGNv
bnN0cmFpbnRzLCBzbyBJDQo+IHB1dCB0aGUgY2FjaGUgZmx1c2ggdW5kZXIgdGhlIENPTkZJ
R19QUkVFTVBUX1JUIGNvbmZpZyBmbGFnLg0KPiBBbHNvIGNsZmx1c2ggaXMgb25seSBhdmFp
bGFiZSBvbiB4ODYsIChhbmQgdGhpcyBpc3N1ZSBoYXMgb25seSBiZWVuDQo+IHJlcHJvZHVj
ZWQgb24geDg2XzY0KSBzbyBpdCdzIGFsc28gdW5kZXIgdGhlIENPTkZJR19YODYgY29uZmln
IGZsYWcuDQo+IA0KPiBGaXhlczogMGIzNGQ1OGI2YzMyICgiZHJtL21nYWcyMDA6IEVuYWJs
ZSBjYWNoaW5nIGZvciBTSE1FTSBwYWdlcyIpDQo+IEZpeGVzOiA0ODYyZmZhZWM1MjMgKCJk
cm0vbWdhZzIwMDogTW92ZSB2bWFwIG91dCBvZiBjb21taXQgdGFpbCIpDQo+IFNpZ25lZC1v
ZmYtYnk6IEpvY2VseW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0LmNvbT4NCj4gLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgfCA1ICsrKysrDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMNCj4gaW5kZXggYWYzY2U1YTZhNjM2Li4xMTY2
MGNkMjljZWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9k
ZS5jDQo+IEBAIC0xMyw2ICsxMyw3IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgPGRybS9kcm1f
YXRvbWljLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPg0KPiAr
I2luY2x1ZGUgPGRybS9kcm1fY2FjaGUuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9kYW1h
Z2VfaGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fZm9ybWF0X2hlbHBlci5oPg0K
PiAgICNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPg0KPiBAQCAtNDM2LDYgKzQzNywxMCBA
QCBzdGF0aWMgdm9pZCBtZ2FnMjAwX2hhbmRsZV9kYW1hZ2Uoc3RydWN0IG1nYV9kZXZpY2Ug
Km1kZXYsIGNvbnN0IHN0cnVjdCBpb3N5c19tYQ0KPiAgIA0KPiAgIAlpb3N5c19tYXBfaW5j
cigmZHN0LCBkcm1fZmJfY2xpcF9vZmZzZXQoZmItPnBpdGNoZXNbMF0sIGZiLT5mb3JtYXQs
IGNsaXApKTsNCj4gICAJZHJtX2ZiX21lbWNweSgmZHN0LCBmYi0+cGl0Y2hlcywgdm1hcCwg
ZmIsIGNsaXApOw0KPiArCS8qIE9uIFJUIHN5c3RlbXMsIGZsdXNoaW5nIHRoZSBjYWNoZSBy
ZWR1Y2VzIHRoZSBsYXRlbmN5IGZvciBvdGhlciBSVCB0YXNrcyAqLw0KPiArI2lmIGRlZmlu
ZWQoQ09ORklHX1g4NikgJiYgZGVmaW5lZChDT05GSUdfUFJFRU1QVF9SVCkNCj4gKwlkcm1f
Y2xmbHVzaF92aXJ0X3JhbmdlKHZtYXAsIGZiLT5oZWlnaHQgKiBmYi0+cGl0Y2hlc1swXSk7
DQo+ICsjZW5kaWYNCg0KWW91ciBzZWNvbmQgY29tbWl0IGlzIHBhcnQgb2YgYSBsYXJnZXIg
cGF0Y2hzZXQgdGhhdCB1cGRhdGVzIHNldmVyYWwgDQpkcml2ZXJzLiBUaGV5IG1pZ2h0IGFs
bCBiZSBhZmZlY3RlZC4gU28gaWYgYW55dGhpbmcsIHRoZSBwYXRjaCBzaG91bGQgZ28gDQpo
ZXJlIGJlZm9yZSB0aGUgdW5tYXAgY2FsbDoNCg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjYuNS9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fYXRvbWljX2hl
bHBlci5jI0wzNzcNCg0Kd2l0aCBhIG11Y2ggZXhwYW5kZWQgY29tbWVudC4NCg0KQnV0IEkn
ZCByZWFsbHkgbGlrZSB0byBoZWFyIG90aGVyIHBlb3BsZXMnIG9waW5pb25zIG9uIHRoZSBt
YXR0ZXIuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICB9DQo+ICAgDQo+ICAgLyoN
Cj4gDQo+IGJhc2UtY29tbWl0OiAyZGRlMThjZDFkOGZhYzczNTg3NWYyZTQ5ODdmMTE4MTdj
YzBiYzJjDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0
cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFu
ZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgw
OSAoQUcgTnVlcm5iZXJnKQ0K

--------------eggBdS7q34snTXIqvx6FK0y8--

--------------ilCcIR2QPy0MADPBpjWT6vrz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUybUYFAwAAAAAACgkQlh/E3EQov+Az
gQ/+Ic6JAzVE3aB39HxIuSTmrY59OYSts2kIdaSvvUxMPlsuV6TkcWCI/8TJG6LzQr3/nUD+OTjz
uaRGIFuwKOhPPy+cCqztShbTCO8XVyAtyon64aPCBPRtNG1x0nPR+XrSh5xcoIlNSggqeVjO1C2K
lrj99SmYa7XK+BRjy3qvQSMzJrDBT6As4c1kc8QTZzaH7UjoSQ/HtWDcGy7bvjHlczmszZbonFJ8
vI363dR8j7o1cjN+ZMxAOqd7xxQ5KjLtI/NAnOYOCW+NFg8hhg5dhBiVPeqXzcYfvR4UAEUERpoy
1/fjixK+F4Ew0iv/4OcI/WDQnRKbz9leSZOTtV5ucpwsbT/P0SAlKwAOwbCuZHiIx1JhWoR1fi4F
QZDVO57LCrLI8/1lDKWAgGSmyMpjzn39GOa9ksXTEatxXKkP4mB5m1UJqZrCzbEz7SNc7H7LlKaw
i+JgC/EV7+//STkZ6yMJ+AvdjxSlnsREML2vcsdGGko4g2FClLid2U5Of570+pQAiM0TumqrZjwb
lsbc+YyvhDsQsU9SWAl1JFevzLbh+vp0K0aOyNB01HBC9qxihvkyS/GCrPRmZCB5eeY6wUAZ+TMX
8ZqObhkuZbQg4wdyHuonDt0rbmdOmyvEylCXgoqhU2Q46jozsw0nn8ZZ9Ew2jt8KJAyPi5QnVblm
YdM=
=P7M3
-----END PGP SIGNATURE-----

--------------ilCcIR2QPy0MADPBpjWT6vrz--
