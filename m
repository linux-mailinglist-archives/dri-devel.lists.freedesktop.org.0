Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC85806AC0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6414610E09C;
	Wed,  6 Dec 2023 09:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C4510E09C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:32:47 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A09C91FD00;
 Wed,  6 Dec 2023 09:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701855165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oHRqMiiVkz6oKX+JxPiz/cDZnz4aTlDgrffTGeF72S4=;
 b=ObrWWew8+hqghZD7PBPlRiHk8s0rDvCHoCsBlE6vAHAxa0q/npuXT/IpeSiAlZW03kNIge
 kKpn6gkxknRaFr+P+NdHSEE6fiQcK+QSzqvy2TyQ61A7OwgX2PBoxzlJNZFKU9kZLP/jfn
 9MLgyOtwwnPCeUKcTbLVIssBmmrJAy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701855165;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oHRqMiiVkz6oKX+JxPiz/cDZnz4aTlDgrffTGeF72S4=;
 b=64tQZ1Wb/GH2jrJ5rJua7j2js5I1lhPEq8/xuANGGFH9Bv3Ke9lhXI6wVcapp3Jkrgxn/M
 F08esT+KCDW6+SAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 71DA1133DD;
 Wed,  6 Dec 2023 09:32:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id KEfPGb0/cGWIOQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Dec 2023 09:32:45 +0000
Message-ID: <bbd25233-3202-4a5e-994d-3245a582d38c@suse.de>
Date: Wed, 6 Dec 2023 10:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/plane: fix error handling in
 __drm_universal_plane_init
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231206072701.13276-1-dinghao.liu@zju.edu.cn>
 <77925c2e-8cb2-473b-9dd0-3ce60a909066@suse.de>
 <CAA8EJprUDgraGgiGKsh0PSVd6Zxe9L2Q+HTPrALHWFVP3hiq1Q@mail.gmail.com>
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
In-Reply-To: <CAA8EJprUDgraGgiGKsh0PSVd6Zxe9L2Q+HTPrALHWFVP3hiq1Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WOJ7igcXFDwMC4pbDokd2DRR"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.11
X-Spamd-Result: default: False [-4.11 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.02)[-0.117]; MIME_BASE64_TEXT(0.10)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WOJ7igcXFDwMC4pbDokd2DRR
Content-Type: multipart/mixed; boundary="------------i1FmaNiAcQe39WrJmOSbn4DO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dinghao Liu <dinghao.liu@zju.edu.cn>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <bbd25233-3202-4a5e-994d-3245a582d38c@suse.de>
Subject: Re: [PATCH] drm/plane: fix error handling in
 __drm_universal_plane_init
References: <20231206072701.13276-1-dinghao.liu@zju.edu.cn>
 <77925c2e-8cb2-473b-9dd0-3ce60a909066@suse.de>
 <CAA8EJprUDgraGgiGKsh0PSVd6Zxe9L2Q+HTPrALHWFVP3hiq1Q@mail.gmail.com>
In-Reply-To: <CAA8EJprUDgraGgiGKsh0PSVd6Zxe9L2Q+HTPrALHWFVP3hiq1Q@mail.gmail.com>

--------------i1FmaNiAcQe39WrJmOSbn4DO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMTIuMjMgdW0gMTA6MDkgc2NocmllYiBEbWl0cnkgQmFyeXNoa292Og0K
PiBPbiBXZWQsIDYgRGVjIDIwMjMgYXQgMTA6MjIsIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+DQo+PiBIaQ0KPj4NCj4+IEFtIDA2LjEyLjIz
IHVtIDA4OjI3IHNjaHJpZWIgRGluZ2hhbyBMaXU6DQo+Pj4gX19kcm1fdW5pdmVyc2FsX3Bs
YW5lX2luaXQoKSBmcmVlcyBwbGFuZS0+Zm9ybWF0X3R5cGVzIGFuZA0KPj4+IHBsYW5lLT5t
b2RpZmllcnMgb24gZmFpbHVyZS4gSG93ZXZlciwgc29tZXRpbWVzIGl0cyBjYWxsZXJzDQo+
Pj4gd2lsbCBmcmVlIHRoZXNlIHR3byBwb2ludGVycyBhZ2Fpbiwgd2hpY2ggbWF5IGxlYWQg
dG8gYQ0KPj4+IGRvdWJsZS1mcmVlLiBPbmUgcG9zc2libGUgY2FsbCBjaGFpbiBpczoNCj4+
Pg0KPj4+IG1kcDVfcGxhbmVfaW5pdA0KPj4+ICAgICB8LT4gZHJtX3VuaXZlcnNhbF9wbGFu
ZV9pbml0DQo+Pj4gICAgIHwgICAgIHwtPiBfX2RybV91bml2ZXJzYWxfcGxhbmVfaW5pdCAo
Zmlyc3QgZnJlZSkNCj4+PiAgICAgfA0KPj4+ICAgICB8LT4gbWRwNV9wbGFuZV9kZXN0cm95
DQo+Pj4gICAgICAgICAgIHwtPiBkcm1fcGxhbmVfY2xlYW51cCAoc2Vjb25kIGZyZWUpDQo+
Pj4NCj4+PiBGaXggdGhpcyBieSBzZXR0aW5nIHRoZSB0d28gcG9pbnRlcnMgdG8gTlVMTCBh
ZnRlciBrZnJlZS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IERpbmdoYW8gTGl1IDxkaW5n
aGFvLmxpdUB6anUuZWR1LmNuPg0KPj4NCj4+IFJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+DQo+PiB0byBnZXQgdGhlIGltbWVkaWF0
ZSBidWcgZml4ZWQuDQo+Pg0KPj4gSG93ZXZlciwgSSBkb24ndCB0aGluayBpdCdzIHRoZSBj
b3JyZWN0IHdheSBvZiBkb2luZyB0aGluZ3MgaW4gZ2VuZXJhbC4NCj4+IFBsYW5lcyBzaG91
bGQgcHJvYmFibHkgbm90IGF0dGVtcHQgdG8gZXZlbiBtYWtlIGEgY29weSwgYnV0IHVzZSB0
aGUNCj4+IHN1cHBsaWVkIHBvaW50ZXJzLiBMaWZldGltZSBvZiB0aGUgYXJyYXlzIGlzIHRo
ZSBzYW1lIGFzIG9mIHRoZSBwbGFuZS4NCj4+IFRoYXQncyBmb3IgYSBkaWZmZXJlbnQgcGF0
Y2ggc2V0LCBvZiBjb3Vyc2UuICAoSSBkaWQgbm90IHJldmlldyB0aGUgRFJNDQo+PiBjb2Rl
IHdoZXRoZXIgdGhlIGludGVybmFsIGNvcHkgaXMgcmVxdWlyZWQuKQ0KPiANCj4gQnV0IHRo
ZXJlIGlzIG5vIGludGVybmFsIGNvcHkuIFRoZSBpc3N1ZSBpcyBpbiB0aGUgbWRwNSBjb2Rl
IGNhbGxpbmcNCj4gZHJtX3BsYW5lX2NsZWFudXAgKGluZGlyZWN0bHkpIGV2ZW4gdGhvdWdo
IHRoZSBwbGFuZSBpbml0IGhhcyBmYWlsZWQuDQoNCkkga25vdy4gSXQgY2FsbHMgZHJtX3Bs
YW5lX2NsZWFudXAoKSBldmVuIHRob3VnaCBfcGxhbmVfaW5pdCgpIGRpZG4ndCANCnN1Y2Nl
ZWQuIEl0IHNob3VsZCByZWFsbHkganVzdCBmcmVlIHRoZSBwbGFuZSdzIGFsbG9jYXRlZCBt
ZW1vcnkuDQoNClRoZSBpbnRlcm5hbCBjb3B5aW5nIEknbSByZWZlcnJpbmcgdG8gaXMgaW4g
DQpfX2RybV91bml2ZXJzYWxfcGxhbmVfaW5pdCgpLiBJJ20gbm90IDEwMCUgc3VyZSwgYnV0
IGl0IHNlZW1zIA0KdW5uZWNlc3NhcnkgdG8gbWUuIE1vc3QgZHJpdmVycyBkZWNsYXJlIHRo
ZWlyIGZvcm1hdCBhbmQgbW9kaWZpZXIgYXJyYXlzIA0KYXMgc3RhdGljIGNvbnN0LiBObyBu
ZWVkIHRvIGNvcHkgdGhhdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+DQo+
PiBGb3Igbm93LCBtYXliZSBkcm1fcGxhbmVfY2xlYW51cCgpIGNvdWxkIHdhcm4gaWYgZm9y
bWF0X3R5cGVzIGVxdWFscw0KPj4gTlVMTC4gWzFdIEl0IGluZGljYXRlcyB0aGF0IHRoZSBw
bGFuZSBoYXMgbm90IGJlZW4gaW5pdGlhbGl6ZWQgY29ycmVjdGx5DQo+PiBhbmQgdGhlIGRy
aXZlcidzIG1lbW9yeSBsaWZldGltZSBoYW5kbGluZyBpcyBzb21laG93IGJyb2tlbi4NCj4+
DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+IFsxXQ0KPj4gaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3BsYW5lLmMjTDU0Mg0KPj4NCj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX3BsYW5lLmMgfCAzICsrKw0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4+PiBpbmRleCAyNGU3OTk4ZDE3
MzEuLjEzMzFiODIyNDkyMCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3BsYW5lLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4+PiBA
QCAtMzA0LDYgKzMwNCw3IEBAIHN0YXRpYyBpbnQgX19kcm1fdW5pdmVyc2FsX3BsYW5lX2lu
aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+PiAgICAgICAgaWYgKGZvcm1hdF9tb2Rp
Zmllcl9jb3VudCAmJiAhcGxhbmUtPm1vZGlmaWVycykgew0KPj4+ICAgICAgICAgICAgICAg
IERSTV9ERUJVR19LTVMoIm91dCBvZiBtZW1vcnkgd2hlbiBhbGxvY2F0aW5nIHBsYW5lXG4i
KTsNCj4+PiAgICAgICAgICAgICAgICBrZnJlZShwbGFuZS0+Zm9ybWF0X3R5cGVzKTsNCj4+
PiArICAgICAgICAgICAgIHBsYW5lLT5mb3JtYXRfdHlwZXMgPSBOVUxMOw0KPj4+ICAgICAg
ICAgICAgICAgIGRybV9tb2RlX29iamVjdF91bnJlZ2lzdGVyKGRldiwgJnBsYW5lLT5iYXNl
KTsNCj4+PiAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+PiAgICAgICAgfQ0K
Pj4+IEBAIC0zMTcsNiArMzE4LDggQEAgc3RhdGljIGludCBfX2RybV91bml2ZXJzYWxfcGxh
bmVfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPj4+ICAgICAgICBpZiAoIXBsYW5l
LT5uYW1lKSB7DQo+Pj4gICAgICAgICAgICAgICAga2ZyZWUocGxhbmUtPmZvcm1hdF90eXBl
cyk7DQo+Pj4gICAgICAgICAgICAgICAga2ZyZWUocGxhbmUtPm1vZGlmaWVycyk7DQo+Pj4g
KyAgICAgICAgICAgICBwbGFuZS0+Zm9ybWF0X3R5cGVzID0gTlVMTDsNCj4+PiArICAgICAg
ICAgICAgIHBsYW5lLT5tb2RpZmllcnMgPSBOVUxMOw0KPj4+ICAgICAgICAgICAgICAgIGRy
bV9tb2RlX29iamVjdF91bnJlZ2lzdGVyKGRldiwgJnBsYW5lLT5iYXNlKTsNCj4+PiAgICAg
ICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+PiAgICAgICAgfQ0KPj4NCj4+IC0tDQo+
PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPj4g
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBGcmFua2Vuc3RyYXNz
ZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPj4gR0Y6IEl2byBUb3RldiwgQW5k
cmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KPj4gSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo+IA0KPiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdl
cm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBC
b3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------i1FmaNiAcQe39WrJmOSbn4DO--

--------------WOJ7igcXFDwMC4pbDokd2DRR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVwP7wFAwAAAAAACgkQlh/E3EQov+A/
YQ/+NOX13ZdPsZubbShbsjqUZXQSIPRb2PxMV0w2AvBhchNsut5rSxKi6rryl1ppx/ysUWFTe/WT
cBS07t/t5Rqm/PZngkzkcymmwS78PTJjZnglSfk7zekhauQfsiAq2SdeBXRtEUr9SaDzv31KvF1E
pzJjS+0eWspK0x6EzZkpf6YhFsLwvEDsUv+xiVTehtik63X409WNXLwuSxHIfwolNZCbQWR/TfmS
eRPIPs36Bpue7qZk71jqMexhzuYDPr2s3ZpFTGisb9VN8fcxCuoMmwfAo1L4AO19/FP8S2EciuKk
5nTOgnLakb2TJcFYSEoD9ToisSJkZHfZw1jQkjf8qcK0IszzMt7ZouYPes8oanE9A2C4Wfd6mtwc
/7oCr+HefzV/5hV6A00l2pq7ilj07Qs0IhhyP/ntWTsocwW6t/THNB9QL9pIHN/17l3IIkMoPUkD
zjhCZJ5so3UUomXA4XnOsF7w8FG725n4Lgq6BOXBZXYZwGMaew9hJ3FJDWxfEC2gOBI17yyPhQIf
lcgdeS/XsrWFU155cul3FDj+MEglSu+fkUuhYxZdBsSQeTNndWzmZrkcb7G1QBjTZarDXRF2HkiQ
FZaKlOPMPryPIZSajVwd6lfVXnGR9L2EOQ0yvYS8Mn0F4c+sqOl02hXhAHXZc11UlOHZDymakltQ
5BI=
=YIBg
-----END PGP SIGNATURE-----

--------------WOJ7igcXFDwMC4pbDokd2DRR--
