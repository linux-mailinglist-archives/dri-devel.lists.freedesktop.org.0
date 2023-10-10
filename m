Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B87BF68E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 10:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3794910E32E;
	Tue, 10 Oct 2023 08:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF41510E32E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:55:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5EEF61F45E;
 Tue, 10 Oct 2023 08:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696928110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wah3mBH7z7NJisWcCv2VZKAJxw3qTOLC9gLpgk4RKYQ=;
 b=kXv7G7PaHtuXtIYDfMM8z05Pp9M0pPl5GY+OnrtEcb+yvCsr3CuL2YF8PHyLnw85PWlLh1
 p4OCD5sDsR6J/x3t+kJOSRP8QmUMp/VWV2z6ZXRZGSzKX3cQaP1G9ovFKR7xxE5QDRGIoD
 D//CKGrFXM4k6Uc2Dv/u3vGc9jBnXzY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696928110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wah3mBH7z7NJisWcCv2VZKAJxw3qTOLC9gLpgk4RKYQ=;
 b=bpidXIrV/NoQs4rdxhMJsWhXz8ksspb0qE+Atyaia/h2xmPNskvBCXHOyOEdSkKYMwDeat
 HHig+Sj30dRJkHCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2EAF11358F;
 Tue, 10 Oct 2023 08:55:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2yb9CG4RJWU1agAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Oct 2023 08:55:10 +0000
Message-ID: <cd54b5ab-5ac8-4569-991c-bf6e062e6400@suse.de>
Date: Tue, 10 Oct 2023 10:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
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
In-Reply-To: <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------k6kZZP4AicKujyhNiEHvZzTv"
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------k6kZZP4AicKujyhNiEHvZzTv
Content-Type: multipart/mixed; boundary="------------cU0peUro3vHlem97dYh4jh7Y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, airlied@redhat.com
Message-ID: <cd54b5ab-5ac8-4569-991c-bf6e062e6400@suse.de>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
 <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
 <bd880231-f161-0773-63f7-ded6cb3fddc1@tronnes.org>
 <b4aadfb4-9393-d6b6-e876-a420afcf2b36@redhat.com>
 <wupxw7bs6yu4gtsbmuvdxhwpd4vkxvvl4aa6w7fumqekzvl7v7@akv2tifgsihl>
 <b764a8a7-db48-fd3b-6241-f3a07009e7dd@redhat.com>
 <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>
In-Reply-To: <xutxpbk476iogtgfbcxbebnud7t3oq6dlbhpniimna2uz2p2nb@hbrrwn4y3x6s>

--------------cU0peUro3vHlem97dYh4jh7Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMTAuMjMgdW0gMTM6MzMgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KWy4u
Ll0NCj4+PiBBbmQgeW91IGRvbid0IG5lZWQgdG8gc3VwcG9ydCBhbGwga2luZHMgb2YgdGls
aW5nLCBZVVYgb3IgUkdCIHZhcmlhbnRzLg0KDQpXZSBzaG91bGQgaW5kZWVkIG5vdCB1c2Ug
WVVWIGF0IGFsbC4gRm9yIFJHQiwgd2UgYWxyZWFkeSBoYXZlIHBsZW50eSBvZiANCmNvbnZl
cnNpb24gY29kZSBmcm9tIFhSR0I4ODg4LXRvLTx3aGF0ZXZlcj4sIHNvIHdlIGFyZSBtb3Jl
IGZsZXhpYmxlIHRoZXJlLg0KDQo+Pg0KPj4gU28gaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3Rs
eSwgZHJtX3BhbmljIHdvdWxkIHByZS1hbGxvY2F0ZSBhIHBsYW5lL2NvbW1pdCwNCj4+IGFu
ZCB1c2UgdGhhdCB3aGVuIGEgcGFuaWMgb2NjdXJzID8NCj4gDQo+IEFuZCBoYXZlIGl0IGNo
ZWNrZWQgYWxyZWFkeSwgeWVzLiBXZSB3b3VsZCBvbmx5IHdhaXQgZm9yIGEgcGFuaWMgdG8N
Cj4gaGFwcGVuIHRvIHB1bGwgdGhlIHRyaWdnZXIgb24gdGhlIGNvbW1pdC4NCj4gDQo+PiBJ
IGhhdmUgdHdvIGNvbmNlcm4gYWJvdXQgdGhpcyBhcHByb2FjaDoNCj4+IC0gSG93IG11Y2gg
bWVtb3J5IHdvdWxkIGJlIGFsbG9jYXRlZCBmb3IgdGhpcyA/IGEgd2hvbGUgZnJhbWVidWZm
ZXIgY2FuIGJlDQo+PiBiaWcgZm9yIGp1c3QgdGhpcyB1c2UgY2FzZS4NCg0KQXMgSSBvdXRs
aW5lZCBpbiBteSBlbWFpbCBhdCBbMV0sIHRoZXJlIGFyZSBhIG51bWJlciBvZiBkaWZmZXJl
bnQgDQpzY2VuYXJpb3MuIFRoZSBxdWVzdGlvbiBvZiBhdG9taWMgc3RhdGUgYW5kIGNvbW1p
dHMgaXMgZW50aXJlbHkgc2VwYXJhdGUgDQpmcm9tIHRoZSBEUk0gcGFuaWMgaGFuZGxlci4g
V2Ugc2hvdWxkIG5vdCB0aHJvdyB0aGVtIHRvZ2V0aGVyLiBXaGF0ZXZlciANCmlzIG5lY2Vz
c2FyeSBpcyBnZXQgYSBzY2Fub3V0IGJ1ZmZlciwgc2hvdWxkIGhhcHBlbiBvbiB0aGUgZHJp
dmVyIHNpZGUgDQpvZiBnZXRfc2Nhbm91dF9idWZmZXIsIG5vdCBvbiB0aGUgZHJtX3Bhbmlj
IHNpZGUuDQoNClsxXSANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8zOWJk
NGMzNS04YTYxLTQyZWUtODY3NS1jY2VhNGY1ZDRhYzZAc3VzZS5kZS9ULyNtMjJmMTE2ZTk0
MzhlMDBhNWYwYTlkYzQzOTg3ZDQxNTM0MjRmOGJlMQ0KDQo+IA0KPiBJJ2RkIGV4cGVjdCBh
IHdob2xlIGZyYW1lYnVmZmVyIGZvciB0aGUgY3VycmVudA0KPiBjb25maWd1cmF0aW9uL3Jl
c29sdXRpb24uIEl0IHdvdWxkIGJlIHR5cGljYWxseSA0TUIgZm9yIGEgZnVsbC1IRCBzeXN0
ZW0NCj4gd2hpY2ggaXNuJ3QgYSBsb3QgcmVhbGx5IGFuZCBJIGd1ZXNzIHdlIGNhbiBhbHdh
eXMgYWRkIGFuIG9wdGlvbiB0bw0KPiBkaXNhYmxlIHRoZSBtZWNoYW5pc20gaWYgbmVlZGVk
Lg0KPiANCj4+IC0gSSBmaW5kIGl0IHJpc2t5IHRvIGNvbXBsZXRlbHkgcmVjb25maWd1cmUg
dGhlIGhhcmR3YXJlIGluIGEgcGFuaWMgaGFuZGxlci4NCj4gDQo+IEkgd291bGQgZXhwZWN0
IHRvIG9ubHkgY2hhbmdlIHRoZSBmb3JtYXQgYW5kIGJhc2UgYWRkcmVzcyBvZiB0aGUNCj4g
ZnJhbWVidWZmZXIuIEkgZ3Vlc3MgaXQgY2FuIGZhaWwsIGJ1dCBpdCBkb2Vzbid0IHNlZW0g
dGhhdCBkaWZmZXJlbnQgdG8NCj4gdGhlIGFzeW5jIHBsYW5lIHVwZGF0ZSB3ZSBhbHJlYWR5
IGhhdmUgYW5kIHdvcmtzIHdlbGwuDQoNClRoZSBvbmUgdGhpbmcgSSBkb24ndCB1bmRlcnN0
YW5kIGlzOiBXaHkgc2hvdWxkIHdlIHVzZSBhdG9taWMgY29tbWl0cyBpbiANCnRoZSBmaXJz
dCBwbGFjZT8gSXQgZG9lc24ndCBtYWtlIHNlbnNlIGZvciBmaXJtd2FyZS1iYXNlZCBkcml2
ZXJzLiBJbiANCnNvbWUgZHJpdmVycywgZXZlbiB0aGUgc2ltcGxlIGFzdCwgd2UgaG9sZCBs
b2NrcyBkdXJpbmcgdGhlIHJlZ3VsYXIgDQpjb21taXQuIFRyeWluZyB0byBydW4gdGhlIHBh
bmljIGNvbW1pdCBjb25jdXJyZW50bHkgd2lsbCBsaWtlbHkgZ2l2ZSBhIA0KZGVhZGxvY2su
DQoNCkluIHRoZSBlbmQgaXQncyBhIHBlci1kcml2ZXIgZGVjaXNpb24sIGJ1dCBpbiBtb3N0
IGNhc2VzLCB0aGUgZHJpdmVyIGNhbiANCmVhc2lseSBzd2l0Y2ggdG8gYSBkZWZhdWx0IG1v
ZGUgd2l0aCBzb21lIGFkLWhvYyBjb2RlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KPj4gQWxzbyBob3cgbWFueSBkcml2ZXJzIHdvdWxkIG5lZWQgdGhpcyA/DQo+Pg0KPj4g
Q3VycmVudGx5IEkgd2FzIG1vc3RseSBjb25zaWRlcmluZyB4ODYgcGxhdGZvcm0sIHNvOg0K
Pj4NCj4+IHNpbXBsZWRybS9hc3QvbWdhZzIwMCB3aGljaCB3b3JrcyB3ZWxsIHdpdGggdGhl
IGdldF9zY2Fub3V0X2J1ZmZlcigpLg0KPj4NCj4+IGk5MTUvYW1kZ3B1L25vdXZlYXUsIHdo
aWNoIGFyZSBxdWl0ZSBjb21wbGV4LCBhbmQgd2lsbCBuZWVkIHRvIGRvIHRoZWlyIG93bg0K
Pj4gdGhpbmcgYW55d2F5Lg0KPiANCj4gSSBndWVzcyB3ZSdyZSBub3QgZW50aXJlbHkgYWxp
Z25lZCB0aGVyZSB0aGVuLiBJIHdvdWxkIGV4cGVjdCB0aGF0DQo+IG1lY2hhbmlzbSB0byB3
b3JrIHdpdGggYW55IGF0b21pYyBLTVMgZHJpdmVyLiBZb3UgYXJlIHJpZ2h0IHRoYXQgaTkx
NSwNCj4gYW1kZ3B1IGFuZCBub3V2ZWF1IGFyZSBzcGVjaWFsIGVub3VnaCB0aGF0IHNvbWUg
ZXh0cmEgaW50ZXJuYWwgcGx1bWJpbmcNCj4gaXMgZ29pbmcgdG8gYmUgcmVxdWlyZWQsIGJ1
dCBJJ2QgZXhwZWN0IGl0IHRvIGJlIGVhc3kgdG8gc3VwcG9ydCB3aXRoDQo+IGFueSBvdGhl
ciBkcml2ZXIgZm9yIGEgbWVtb3J5LW1hcHBlZCBkZXZpY2UuDQo+IA0KPiBJIGd1ZXNzIHdo
YXQgSSdtIHRyeWluZyB0byBzYXkgaXMsIGV2ZW4gdGhvdWdoIGl0J3MgdG90YWxseSBmaW5l
IHRoYXQNCj4geW91IG9ubHkgc3VwcG9ydCB0aG9zZSBkcml2ZXJzIGF0IGZpcnN0LCBzdXBw
b3J0aW5nIGluIHZjNCBmb3IgZXhhbXBsZQ0KPiBzaG91bGRuJ3QgcmVxdWlyZSB0byByZXdy
aXRlIHRoZSB3aG9sZSB0aGluZy4NCj4gDQo+Pj4+IEknbSBtb3JlIGluIGZhdm9yIG9mIGFu
IGVtZXJnZW5jeSBmdW5jdGlvbiwgdGhhdCBlYWNoIGRyaXZlciBoYXMgdG8NCj4+Pj4gaW1w
bGVtZW50LCBhbmQgdXNlIHdoYXQgdGhlIGhhcmR3YXJlIGNhbiBkbyB0byBkaXNwbGF5IGEg
c2ltcGxlIGZyYW1lDQo+Pj4+IHF1aWNrbHkuIGdldF9zY2Fub3V0X2J1ZmZlcigpIGlzIGEg
Z29vZCBzdGFydCBmb3Igc2ltcGxlIGRyaXZlciwgYnV0DQo+Pj4+IHdpbGwgbmVlZCByZWZh
Y3RvcmluZyBmb3IgdGhlIG1vcmUgY29tcGxleCBjYXNlLCBsaWtlIGFkZGluZyBhDQo+Pj4+
IGNhbGxiYWNrIHRvIHdyaXRlIHBpeGVscyBvbmUgYnkgb25lLCBpZiB0aGVyZSBpcyBubyBt
ZW1vcnkgbWFwcGVkDQo+Pj4+IGJ1ZmZlciBhdmFpbGFibGUuDQo+Pj4NCj4+PiBTb3JyeSwg
SSdtIG5vdCBxdWl0ZSBzdXJlIHdoYXQgeW91IG1lYW4gdGhlcmUsIHdoZXJlIHdvdWxkIHlv
dSB3cml0ZSB0aGUNCj4+PiBwaXhlbCB0bz8NCj4+DQo+PiBJdCB3YXMgbWVudGlvbmVkIGJ5
IE5vcmFsZiwgYWJvdXQgdGhlIGFtZGdwdSBkcml2ZXI6DQo+Pg0KPj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvZHJpLWRldmVsL2QyMzNjMzc2LWVkMDctMjEyNy02MDg0LTgyOTJkMzEz
ZGFjN0BhbWQuY29tLw0KPj4NCj4+IFRoZXkgaGF2ZSBhIHNsb3cgImRlYnVnIGludGVyZmFj
ZSIgdGhhdCB5b3UgY2FuIHdyaXRlIHRvLCBhbmQgY2FuIGJlIHVzZWQNCj4+IGZvciB0aGUg
cGFuaWMgaGFuZGxlci4gSXQncyBub3QgbWVtb3J5IG1hcHBlZCwgc28geW91IGhhdmUgdG8g
d3JpdGUgcGl4ZWxzDQo+PiBvbmUgYnkgb25lLg0KPj4NCj4+IFNvIGZvciB0aGUgc3RydWN0
IGRybV9zY2Fub3V0X2J1ZmZlciwgSSBjYW4gYWRkIGEgZnVuY3Rpb24gcG9pbnRlciB0byBh
DQo+PiB3cml0ZV9waXhlbCh1MzIgeCwgdTMyIHksIHUzMiBjb2xvcikNCj4+IFNvIGlmIHRo
ZSBpb3N5cyBtYXAgaXMgbnVsbCwgaXQgd2lsbCB1c2UgdGhhdCBpbnN0ZWFkLg0KPiANCj4g
SXQgd291bGQgYmUgbmljZSB0byBzdXBwb3J0IGluZGVlZCwgYnV0IGl0J3MgYSBmYWlybHkg
cmFyZSBmZWF0dXJlIGFmYWlrDQo+IHNvIEknZCByYXRoZXIgZm9jdXMgb24gZ2V0dGluZyBz
b21ldGhpbmcgdGhhdCBjYW4gd29yayBmb3IgZXZlcnlvbmUgZmlyc3QNCj4gDQo+IE1heGlt
ZQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3Nl
IDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcg
TXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFH
IE51ZXJuYmVyZykNCg==

--------------cU0peUro3vHlem97dYh4jh7Y--

--------------k6kZZP4AicKujyhNiEHvZzTv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUlEW0FAwAAAAAACgkQlh/E3EQov+Bs
tRAAtM7rpuY76bgUQNyLbg9HMcuncXlwa68mu4MdEBLT8VDG8sMdlXD4zidHNdTmbGzXacTq5jCq
5w1a726eADo2/xOuNODzdmRbnauwANj7tzKIzNh1kw/IyOKi1qvSPDnSgP1fA+ronbp7MDD7dWqj
ynMR+SuRNxG6xe0iOn+3CzRRCRuZUZUrlxkX7uQrioY/3v5G/fAazLqreYggTipsAbcwRhm5faXJ
KY1aM7GlACV5v+c0CkaIHYKCHVzpQO+h/rUZv36xHkFzuxk1t0GOvvpMlJoriG1WxVLkioXDgmnp
msb+eMr6frPkvF6WPabc8U51xVBFI3i5h8LcTrj29IYw2+WE/wW+jekZUyOJmsT3L3HcBy++B1yt
Y0yTYwfdI18vEeJw180J5t9zcM4oggmCml/D4VvoVUjSKca4E5x7i3L13rIAE9bLwtpH7+kvlfe1
+t4P7ptt2R1JPzrWSyhgWluk/Bxftd+4lQs8Ddaf/i/RAiu2m0eQCGZ35eE2qHPX/+eLSRPQlIoM
waVRQliLbo4zYKIZCX7bVwAJLIZcrWP1BToaUGBbWiVKqSt56W19ggwteqdqsB2lp0OG17GghizR
2+gChJ1pfpFnmdCyuKcaIbsz8IglzBNDVYEEao+Hqp5RayyzTwOHyrrb5pemsV2vHlAYQ9x4VRgR
IwA=
=EUgd
-----END PGP SIGNATURE-----

--------------k6kZZP4AicKujyhNiEHvZzTv--
