Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966388083B2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA21910E178;
	Thu,  7 Dec 2023 09:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398BF10E115;
 Thu,  7 Dec 2023 09:01:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D50952209A;
 Thu,  7 Dec 2023 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701939658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2EKnQIrojYKaRYWLhs6n7o0XoZJGboZtenl5FLjFnbs=;
 b=VthojGgXZkKcA3B6ABDDfNB92Lq3KGYDJoCOeNwRnPjbB2ikHyUTZ8L91n5ORPQzDaNc7+
 qINq8a2CZ86rWBDXucYMqz6ZdTACOsbnyhFUVkjNH3AgdPycVctWguoI3I1LR7oUnpQuHr
 8NawUZpIAxoi6UwxzH6UjMQ0GKvzXgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701939658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2EKnQIrojYKaRYWLhs6n7o0XoZJGboZtenl5FLjFnbs=;
 b=ENE9mY7UggHuY0c0PRXnIYFh1S5ywLiyu52iNjecO0lZIsxZL5WBjkWeRkWc45XIc6ZDIe
 YHFsQfowFr1p9kBA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F6BB13907;
 Thu,  7 Dec 2023 09:00:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id OrqeIcqJcWWKOwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Dec 2023 09:00:58 +0000
Message-ID: <2041ed3c-3ee1-4b34-a24d-61a9c8a5dc37@suse.de>
Date: Thu, 7 Dec 2023 10:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND AGAIN v2 0/2] Add drm_dbg_ratelimited()
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20231206210948.106238-1-andi.shyti@linux.intel.com>
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
In-Reply-To: <20231206210948.106238-1-andi.shyti@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0rBOwfBiKfRICdPouQXhKdCK"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.69
X-Spamd-Result: default: False [0.69 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BAYES_HAM(-0.22)[71.95%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_LONG(-1.00)[-0.999];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_SPAM_SHORT(3.00)[1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[9]; SIGNED_PGP(-2.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
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
Cc: Maxime Ripard <mripard@kernel.org>, Matthew Auld <matthew.auld@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0rBOwfBiKfRICdPouQXhKdCK
Content-Type: multipart/mixed; boundary="------------ZdHq6zxX7lqDTHOIJBqhYeVm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Message-ID: <2041ed3c-3ee1-4b34-a24d-61a9c8a5dc37@suse.de>
Subject: Re: [PATCH RESEND AGAIN v2 0/2] Add drm_dbg_ratelimited()
References: <20231206210948.106238-1-andi.shyti@linux.intel.com>
In-Reply-To: <20231206210948.106238-1-andi.shyti@linux.intel.com>

--------------ZdHq6zxX7lqDTHOIJBqhYeVm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMTIuMjMgdW0gMjI6MDkgc2NocmllYiBBbmRpIFNoeXRpOg0KPiBIaSwN
Cj4gDQo+IFRoaXMgaXMgdGhlIHNlY29uZCB0aW1lIEkgYW0gcmVzZW5kaW5nIHRoaXMgc2Vy
aWVzIGluIGl0cyB2Mi4gSXQNCj4gaGFzIGJlZW4gcmV2aWV3ZCwgYWNrZWQsIGJsZXNzZWQs
IGRpc2N1c3NlZCwgcmVjdGlmaWVkLCBhc3Nlc3NlZCwNCj4gYXV0aG9yaXplZCwgdmFsaWRh
dGVkLCBnbG9yaWZpZWQsIHByYWlzZWQsIGRlbWFuZGVkLCBhcHByb3ZlZCwNCj4gYW5kIHll
dCwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBubyBvbmUgaXMgbWVyZ2luZyBpdC4NCg0KSSB0
aGluayBpdCBzaG91bGQgZ28gdGhyb3VnaCB0aGUgSW50ZWwgdHJlZS4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gVGhhbmtzLA0KPiBBbmRpDQo+IA0KPiB2MjoNCj4gcGlj
ayB0aGUgcmlnaHQgcGF0Y2ggd2l0aCB0aGUgZm9sbG93aW5nIGNoYW5nZXM6DQo+ICAgLSBh
ZGQgbW9yZSByLWIncw0KPiAgIC0gYWRkIGEgcGF0Y2ggMiB3aGVyZSB0aGUgZHJtX2RiZ19y
YXRlbGltaXRlZCBpcyBhY3R1YWxseSB1c2VkLg0KPiANCj4gTmlybW95IERhcyAoMik6DQo+
ICAgIGRybS9wcmludDogQWRkIGRybV9kYmdfcmF0ZWxpbWl0ZWQNCj4gICAgZHJtL2k5MTU6
IFJhdGVsaW1pdCBkZWJ1ZyBsb2cgaW4gdm1fZmF1bHRfdHRtDQo+IA0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0uYyB8IDUgKysrLS0NCj4gICBpbmNsdWRl
L2RybS9kcm1fcHJpbnQuaCAgICAgICAgICAgICAgICAgfCAzICsrKw0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYx
IE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRy
ZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcp
DQo=

--------------ZdHq6zxX7lqDTHOIJBqhYeVm--

--------------0rBOwfBiKfRICdPouQXhKdCK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVxicoFAwAAAAAACgkQlh/E3EQov+At
Dg//fXglVtI2Bub2MDmhMXLK3MBzSDxfD9OcjVAo13Octjk1fR81Ppa4/NDtqpyj7gUt7fpxMA45
WHRIuao/ERU3bwAvBTlr+x5P+cO3oETzAy1ooSkmEcRI/j8RJSkRZFo527gEYgXgiR1Ae8FaAdJC
Lp6Hh6KLWFsHGYIpet0LuYGjZ8cy0g7e6+5GMAgxClGLdps7RBXcTiQB3YSi3OqaIe42wWF9jA24
o2pwnjQs5ra2mXeqRGi+Q5DByRcGt2eHD25EqpeaN0apNMh65mPDwV1ocVHeSe9o9uVKlG0zRE3h
14mXxCZ9ET3dTNA9tWjyjy76sUD7ZCbIA1ZyWu5B/DoaYGPBjnlsVhUDCRwFUsYbpCLztRuXqgYc
65BaSezBQ5HZyhCqZD0YMfhxcOQBqIq0ZNCn2QXAjjahyLfK55P1iUengHhzeHFTc6JQLDV2lTvC
l2uas7/OJFsBm2Kyhd5duJr5C42x6OMLK20mebKxMOTqgQIvA4Ej++r/niOvrAiNRGsxkcW5g15w
8L0STT58S/yc+CpqSNtOkQX3tk9HAEGe1c3ZhzZEXcTNNFeYJZL/RDKL70Y9a3SLG06ddfs2lZ53
AvSi+2HwyaQX6/s/4imBoYHi0VFeJOnP8PDo+a692Zx7PJbdZKwrl39ZKvw6U+WAFWcNZjLJ9B9U
uLA=
=/PuN
-----END PGP SIGNATURE-----

--------------0rBOwfBiKfRICdPouQXhKdCK--
