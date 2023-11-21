Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22537F2828
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863EF10E2B4;
	Tue, 21 Nov 2023 08:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB1F10E2A8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 08:55:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9FFA62191A;
 Tue, 21 Nov 2023 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700556918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CTV6ndlczfT4TlJVW1+NX9VdkkC3DHuxTE/CuAWfhZ4=;
 b=N0CQo+ssbxSG66oET4ARVDBrETRyffme/MZVQr9e1l+Oim1kU8BezitG9H4UL1ACcPcRNp
 u8zDzGg/EMA2E22NM+LLoV7Jr8wdkYK1HqaqPn6dXj2zYElkXzdk713bbPjL8u9ewleUfK
 T7uINjJGJl+5eSmn8RIgCsjPg5V/vIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700556918;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CTV6ndlczfT4TlJVW1+NX9VdkkC3DHuxTE/CuAWfhZ4=;
 b=iXxln9r7K38rUj482BTrF//AwDQfdeITZp5lP55Wk1VgqkB68ATJ46gQ1H1jc0RGmqXQ9J
 gaPdToViZXnnCCDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5684E139FD;
 Tue, 21 Nov 2023 08:55:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yWMJE3ZwXGV+GAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Nov 2023 08:55:18 +0000
Message-ID: <3844e6e8-4c65-441a-ac57-a1d4e8635977@suse.de>
Date: Tue, 21 Nov 2023 09:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Disconnect BMC if physical connector is connected
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch
References: <20231116130217.22931-1-tzimmermann@suse.de>
 <f5780fd6-ebfd-4fa9-afa0-412775c820c7@redhat.com>
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
In-Reply-To: <f5780fd6-ebfd-4fa9-afa0-412775c820c7@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YUs47jPZ45nWOKGUfnWbq4nX"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.28
X-Spamd-Result: default: False [-2.28 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-2.81)[99.18%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_LONG(-1.00)[-0.999];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_SPAM_SHORT(2.62)[0.874];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[7];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YUs47jPZ45nWOKGUfnWbq4nX
Content-Type: multipart/mixed; boundary="------------u5m0gt0EADHsZT4L48Uh6c6V";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <3844e6e8-4c65-441a-ac57-a1d4e8635977@suse.de>
Subject: Re: [PATCH] drm/ast: Disconnect BMC if physical connector is
 connected
References: <20231116130217.22931-1-tzimmermann@suse.de>
 <f5780fd6-ebfd-4fa9-afa0-412775c820c7@redhat.com>
In-Reply-To: <f5780fd6-ebfd-4fa9-afa0-412775c820c7@redhat.com>

--------------u5m0gt0EADHsZT4L48Uh6c6V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMTEuMjMgdW0gMTQ6NDMgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDE2LzExLzIwMjMgMTQ6MDIsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gTWFu
eSB1c2VyLXNwYWNlIGNvbXBvc2l0b3JzIGZhaWwgd2l0aCBtb2RlIHNldHRpbmcgaWYgYSBD
UlRDIGhhcw0KPj4gbW9yZSB0aGFuIG9uZSBjb25uZWN0ZWQgY29ubmVjdG9yLiBUaGlzIGlz
IHRoZSBjYXNlIHdpdGggdGhlIEJNQw0KPj4gb24gQXNwZWVkIHN5c3RlbXMuIFdvcmsgYXJv
dW5kIHRoaXMgcHJvYmxlbSBieSBzZXR0aW5nIHRoZSBCTUMncw0KPj4gY29ubmVjdG9yIHN0
YXR1cyB0byBkaXNjb25uZWN0ZWQgd2hlbiB0aGUgcGh5c2ljYWwgY29ubmVjdG9yIGhhcw0K
Pj4gYSBkaXNwbGF5IGF0dGFjaGVkLiBUaGlzIHdheSBjb21wb3NpdG9ycyB3aWxsIG9ubHkg
c2VlIG9uZSBjb25uZWN0ZWQNCj4+IGNvbm5lY3RvciBhdCBhIHRpbWU7IGVpdGhlciB0aGUg
cGh5c2ljYWwgb25lIG9yIHRoZSBCTUMuDQo+IA0KPiANCj4gVGhhbmtzIGZvciB0aGUgcGF0
Y2guDQo+IEkgY2FuJ3QgdGVzdCBpdCBiZWNhdXNlIEkgZG9uJ3QgaGF2ZSBwaHlzaWNhbCBh
Y2Nlc3MgdG8gYSBtYWNoaW5lIHdpdGggDQo+IGFzcGVlZCBHUFUsIGJ1dCBpdCBsb29rcyBn
b29kIHRvIG1lLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEpvY2VseW4gRmFsZW1wZSA8amZhbGVt
cGVAcmVkaGF0LmNvbT4NCj4gDQoNClRoYW5rcy4gVGhlIHBhdGNoIGlzIG5vdyBpbiBkcm0t
bWlzYy1maXhlcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVy
ZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25h
bGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------u5m0gt0EADHsZT4L48Uh6c6V--

--------------YUs47jPZ45nWOKGUfnWbq4nX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVccHUFAwAAAAAACgkQlh/E3EQov+Cn
1xAAq/maC4DethDUl/4oXf3sIxF4b68a+/axx2CUkrP8YVl8KipFRMJqPN2swv2fW57j4Vg3M+oq
PsvBJ48mg3Gkpxcmd6qgyVEYqwJU5MUXu0zINta+ydMw15QTjVCmfJGmCfCIhV+7tuZPOtubAgd6
hv/0wOasOyEnGeGSJp5ONfdAQdV47mCMVbPxudeh4yjHF0ppHs5WReFijTAXmoHRHTs0BNcawhzb
kd0XNpbF1HZLoP1N0h00qofHMUg/hP4iI5Qz7Hxhs9tz8c/ykmp6huEmpiXAEFINy5qOv+O99jls
qXkSfkyyntVT0eW8yDKbsRzmfcXp++r7+KgBeBF6WIn6uzI9v+BMYS22zWmQZzIW10b6T55Ykg6r
P1pThRamh3b2sJu7wCIbZGpneUABuLptC/ZnXes5xQUGLOo6UIvwkLkyk+WEy7KqPCyCdZrmAG0J
ADWsCncUe2Ll607VaHQjjhDaYgi2QKD82MK0ptEEsS46BT/ZNRmKg4syAbOwKXLHGlM5I9fSuP68
DpyOp+OrwpIeCoWTValhKl8UQwtCmaV4MelUyrKJwRXeHl3e4yugKbNl72HVHkTe23w1bFsRCNUR
o5sdxOpEZBqlULbIXMWJQMfVbUffR7AuW9WJ6rOLYGHlLT1hBcXv7CgOB8c5h0iX1tBm7NkmdAHB
Er4=
=uOmK
-----END PGP SIGNATURE-----

--------------YUs47jPZ45nWOKGUfnWbq4nX--
