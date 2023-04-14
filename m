Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A5A6E1D45
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 09:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C0810E05E;
	Fri, 14 Apr 2023 07:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D5410E05E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 07:34:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CFC2E21941;
 Fri, 14 Apr 2023 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681457675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BJiWYfEUzJ3ePqpzg7w/xiu2jUy6ofI7ipE2GAuOpJg=;
 b=kSS6ecCWJSJWvUrnwSwxevEeX34F5Q+Ov4+1GlhHzXZgl+ZKxOUFqQXJl9cWFY98BWNhhX
 pBL63dSJ4SGUxPgPYt20P4GFya116fCEegN0CeA4viAcMs1K5ertimbx9dbLz7E5Q7s4zo
 tRdr2VKiCghfHtaT9JSvLpKUVOseEVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681457675;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BJiWYfEUzJ3ePqpzg7w/xiu2jUy6ofI7ipE2GAuOpJg=;
 b=aEw+JG2sQAK94OCZ8dzBGa1ZzjsC0FRpyaBoDHCDh7F5BLitkvunbj++HGSXYx9dpYha7H
 WYeIUn1bn/4OHnAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7875513498;
 Fri, 14 Apr 2023 07:34:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9kJBHAsCOWQgTwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Apr 2023 07:34:35 +0000
Message-ID: <410baaef-bc55-cb2a-2e92-a407ce5cad04@suse.de>
Date: Fri, 14 Apr 2023 09:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Sui Jingfeng <15330273260@189.cn>
References: <20230409132110.494630-1-15330273260@189.cn>
 <ZDV0Te65tSh4Q/vc@phenom.ffwll.local>
 <42f16d0d-4e1a-a016-f4cc-af24efa75f1c@189.cn>
 <ZDbuCWKfFlWyiOGp@phenom.ffwll.local>
 <dbac96b2-0fea-591b-517d-2a23cc36b8de@189.cn>
 <CAKMK7uG_h7htCDARudZpHOOMG4iOOLZmz0_WskvWGf+DKGwU1w@mail.gmail.com>
 <531f0bdf-2ae8-0361-183b-57b40df6345f@189.cn>
 <ZDhQW6El6ztyHK4M@phenom.ffwll.local>
 <1bbc7228-c2fe-0af0-c15c-b378bc4d111c@suse.de>
 <ZDhfkq92hbGc630z@phenom.ffwll.local>
 <1b44a3b5-5053-f121-ee62-de83d505759e@189.cn>
 <CAKMK7uHRWy=7m3=eEQz324kKOh9AM8J3Rma=KgBic0pRmW1NBQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAKMK7uHRWy=7m3=eEQz324kKOh9AM8J3Rma=KgBic0pRmW1NBQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------B3rPO6fLnaigaOoHxcQ8mTA1"
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 Li Yi <liyi@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------B3rPO6fLnaigaOoHxcQ8mTA1
Content-Type: multipart/mixed; boundary="------------0YRNgJZqkqDtptV83BkbirKI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Sui Jingfeng <15330273260@189.cn>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
Message-ID: <410baaef-bc55-cb2a-2e92-a407ce5cad04@suse.de>
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
References: <20230409132110.494630-1-15330273260@189.cn>
 <ZDV0Te65tSh4Q/vc@phenom.ffwll.local>
 <42f16d0d-4e1a-a016-f4cc-af24efa75f1c@189.cn>
 <ZDbuCWKfFlWyiOGp@phenom.ffwll.local>
 <dbac96b2-0fea-591b-517d-2a23cc36b8de@189.cn>
 <CAKMK7uG_h7htCDARudZpHOOMG4iOOLZmz0_WskvWGf+DKGwU1w@mail.gmail.com>
 <531f0bdf-2ae8-0361-183b-57b40df6345f@189.cn>
 <ZDhQW6El6ztyHK4M@phenom.ffwll.local>
 <1bbc7228-c2fe-0af0-c15c-b378bc4d111c@suse.de>
 <ZDhfkq92hbGc630z@phenom.ffwll.local>
 <1b44a3b5-5053-f121-ee62-de83d505759e@189.cn>
 <CAKMK7uHRWy=7m3=eEQz324kKOh9AM8J3Rma=KgBic0pRmW1NBQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHRWy=7m3=eEQz324kKOh9AM8J3Rma=KgBic0pRmW1NBQ@mail.gmail.com>

--------------0YRNgJZqkqDtptV83BkbirKI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDQuMjMgdW0gMDc6MzYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBGcmksIDE0IEFwciAyMDIzIGF0IDA2OjI0LCBTdWkgSmluZ2ZlbmcgPDE1MzMwMjczMjYw
QDE4OS5jbj4gd3JvdGU6DQo+Pg0KPj4gSGksDQo+Pg0KPj4gT24gMjAyMy80LzE0IDA0OjAx
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+IE9uIFRodSwgQXByIDEzLCAyMDIzIGF0IDA5
OjIwOjIzUE0gKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+PiBIaQ0KPj4+
Pg0KPj4+PiBBbSAxMy4wNC4yMyB1bSAyMDo1NiBzY2hyaWViIERhbmllbCBWZXR0ZXI6DQo+
Pj4+IFsuLi5dDQo+Pj4+PiBUaGlzIHNob3VsZCBzd2l0Y2ggdGhlIGV4aXN0aW5nIGNvZGUg
b3ZlciB0byB1c2luZyBkcm1fZnJhbWVidWZmZXIgaW5zdGVhZA0KPj4+Pj4gb2YgZmJkZXY6
DQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4+Pj4g
aW5kZXggZWY0ZWI4YjEyNzY2Li45OWNhNjlkZDQzMmYgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+Pj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+Pj4+PiBAQCAtNjQ3LDIyICs2NDcsMjYgQEAgc3Rh
dGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9kYW1hZ2Uoc3RydWN0IGRybV9mYl9oZWxwZXIgKmhl
bHBlciwgdTMyIHgsIHUzMiB5LA0KPj4+Pj4gICAgIHN0YXRpYyB2b2lkIGRybV9mYl9oZWxw
ZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAoc3RydWN0IGZiX2luZm8gKmluZm8sIG9mZl90IG9m
Ziwgc2l6ZV90IGxlbiwNCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGRybV9yZWN0ICpjbGlwKQ0KPj4+Pj4gICAgIHsNCj4+Pj4+
ICsgICBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyID0gaW5mby0+cGFyOw0KPj4+Pj4g
Kw0KPj4+Pj4gICAgICBvZmZfdCBlbmQgPSBvZmYgKyBsZW47DQo+Pj4+PiAgICAgIHUzMiB4
MSA9IDA7DQo+Pj4+PiAgICAgIHUzMiB5MSA9IG9mZiAvIGluZm8tPmZpeC5saW5lX2xlbmd0
aDsNCj4+Pj4+IC0gICB1MzIgeDIgPSBpbmZvLT52YXIueHJlczsNCj4+Pj4+IC0gICB1MzIg
eTIgPSBESVZfUk9VTkRfVVAoZW5kLCBpbmZvLT5maXgubGluZV9sZW5ndGgpOw0KPj4+Pj4g
KyAgIHUzMiB4MiA9IGhlbHBlci0+ZmItPmhlaWdodDsNCj4+Pj4+ICsgICB1bnNpZ25lZCBz
dHJpZGUgPSBoZWxwZXItPmZiLT5waXRjaGVzWzBdOw0KPj4+Pj4gKyAgIHUzMiB5MiA9IERJ
Vl9ST1VORF9VUChlbmQsIHN0cmlkZSk7DQo+Pj4+PiArICAgaW50IGJwcCA9IGRybV9mb3Jt
YXRfaW5mb19icHAoaGVscGVyLT5mYi0+Zm9ybWF0LCAwKTsNCj4+Pj4gUGxlYXNlIERPTlQg
ZG8gdGhhdC4gVGhlIGNvZGUgaGVyZSBpcyBmYmRldiBjb2RlIGFuZCBzaG91bGRuJ3QgYm90
aGVyIGFib3V0DQo+Pj4+IERSTSBkYXRhIHN0cnVjdHVyZXMuIEFjdHVhbGx5LCBpdCBzaG91
bGRuJ3QgYmUgaGVyZTogYSBudW1iZXIgb2YgZmJkZXYNCj4+Pj4gZHJpdmVycyB3aXRoIGRl
ZmVycmVkIEkvTyBjb250YWluIHNpbWlsYXIgY29kZSBhbmQgdGhlIGZiZGV2IG1vZHVsZSBz
aG91bGQNCj4+Pj4gcHJvdmlkZSB1cyB3aXRoIGEgaGVscGVyLiAoSSB0aGluayBJIGV2ZW4g
aGFkIHNvbWUgcGF0Y2hlcyBzb21ld2hlcmUuKQ0KPj4+IFdlbGwgbXkgdGhpbmtpbmcgaXMg
dGhhdCBpdCdzIGEgZHJtIGRyaXZlciwNCj4+DQo+PiBZZXMsIEkgYWN0dWFsbHkgYWdyZWUg
d2l0aCB0aGlzLCBhbmQgdGhlIGNvZGUgbG9va3MgcXVpdGUgZ29vZC4gQW5kIEkNCj4+IHJl
YWxseSB3YW50IHRvIGFkb3B0IGl0Lg0KPj4NCj4+IEJlY2F1c2UgaGVyZSBpcyBEUk0sIHdl
IHNob3VsZCBlbXVsYXRlIHRoZSBmYmRldiBpbiB0aGUgRFJNJ3Mgd2F5Lg0KPj4NCj4+IFRo
ZSBEUk0gaXMgcmVhbGx5IHRoZSBiaWcgYnJvdGhlciBvbiB0aGUgYmVoaW5kIG9mIGVtdWxh
dGVkIGZiZGV2LA0KPj4NCj4+IHdobyBwcm92aWRlIHRoZSByZWFsIGRpc3BsYXlhYmxlIGJh
Y2tpbmcgbWVtb3J5IGFuZCBzY2FudCBvdXQgZW5naW5lIHRvDQo+PiBkaXNwbGF5IHN1Y2gg
YSBidWZmZXIuDQo+Pg0KPj4NCj4+IEJ1dCBjdXJyZW50bHksIHRoZSBmYWN0IGlzLCAgZHJt
X2ZiX2hlbHBlci5jIHN0aWxsIGluaXRpYWxpemVzIGxvdHMgb2YNCj4+IGRhdGEgc3RydWN0
dXJlIGNvbWUgZnJvbSBmYmRldiB3b3JsZC4NCj4+DQo+PiBGb3IgZXhhbXBsZSwgdGhlIGRy
bV9mYl9oZWxwZXJfZmlsbF9maXgoKSBhbmQgZHJtX2ZiX2hlbHBlcl9maWxsX3ZhcigpDQo+
PiBpbiBkcm1fZmJfaGVscGVyX2ZpbGxfaW5mbygpIGZ1bmN0aW9uLg0KPj4NCj4+IFRoaXMg
c2F5aW5nIGltcGxpY2l0bHkgdGhhdCB0aGUgZmJkZXYtZ2VuZXJpYyBpcyBhIGdsdWUgbGF5
ZXIgd2hpY2ggY29weQ0KPj4gZGFtYWdlIGZyYW1lIGJ1ZmZlciBkYXRhDQo+Pg0KPj4gZnJv
bSB0aGUgZnJvbnQgZW5kKGZiZGV2IGxheWVyKSB0byBpdHMgZHJtIGJhY2tlbmQuICBJdCdz
IG5vdCBhIDEwMCUNCj4+IHJlcGxhY2VtZW50IGl0cyBmYmRldiBmcm9udCBlbmQsDQo+Pg0K
Pj4gcmF0aGVyLCBpdCByZWxheSBvbiBpdC4NCj4+DQo+Pg0KPj4+IHNvIGlmIHdlIGhhdmUg
aXNzdWUgd2l0aCBsaW1pdA0KPj4+IGNoZWNrcyBibG93aW5nIHVwIGl0IG1ha2VzIG1vcmUg
c2Vuc2UgdG8gY2hlY2sgdGhlbSBhZ2FpbnN0IGRybSBsaW1pdHMuDQo+Pj4gUGx1cyBhIGxv
dCBtb3JlIHBlb3BsZSB1bmRlcnN0YW5kIHRob3NlIHRoYW4gZmJkZXYuIFRoZXkgc2hvdWxk
IGFsbCBtYXRjaA0KPj4+IGFueXdheSwgb3IgaWYgdGhleSBkb250LCB3ZSBoYXZlIGEgYnVn
Lg0KPj4NCj4+IFllcywgdGhpcyBpcyByZWFsbHkgd2hhdCBJJ20gd29ycnkgYWJvdXQuDQo+
Pg0KPj4gSSBzZWUgdGhhdCAgbWVtYmVycyBvZiBzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8g
Y2FuIGJlIGNoYW5nZWQgYnkNCj4+IHVzZXItc3BhY2UuIEZvciBleGFtcGxlLCB4b2Zmc2V0
IGFuZCB5b2Zmc2V0Lg0KPj4NCj4+IFRoZXJlIGlzIG5vIGNoYW5nZSBhYm91dCAnaW5mby0+
dmFyLnhyZXMnIGFuZCAnaW5mby0+dmFyLnlyZXMnIGZyb20gdGhlDQo+PiB1c2Vyc3BhY2Us
DQo+Pg0KPj4gdGhlcmVmb3JlLCB0aGV5IHNob3VsZCBhbGwgbWF0Y2ggaW4gcHJhY3RpY2Uu
DQo+Pg0KPj4NCj4+IFVzZXItc3BhY2UgY2FuIGNob29zZSBhIHVzZSBhIHNtYWxsZXIgZGlz
cGFseSBhcmVhIHRoYW4gJ3Zhci54cmVzIHgNCj4+IHZhci55cmVzJywNCj4+DQo+PiBidXQg
dGhhdCBpcyBpbXBsZW1lbnRlZCB3aXRoICd2YXIueG9mZnNldCcgYW5kICd2YXIueG9mZnNl
dCcuDQo+Pg0KPj4gQnV0IGNvbnNpZGVyIHRoYXQgdGhlIG5hbWUgJ3ZhcicsIHdoaWNoIG1h
eSBzdGFuZCBmb3IgJ3ZhcmlhdGlvbicgb3INCj4+ICd2YXJ5Jy4gVGhpcyBpcyB0ZXJyaWZ5
aW5nLg0KPj4NCj4+IEkgaW1hZ2luZSwgd2l0aCBhIHNoYWRvdyBidWZmZXIsIHRoZSBmcm9u
dCBlbmQgY2FuIGRvIGFueSBtb2Rlc2V0IG9uIHRoZQ0KPj4gcnVudGltZSBmcmVlbHksDQo+
Pg0KPj4gaW5jbHVkaW5nIGNoYW5nZSB0aGUgZm9ybWF0IG9mIGZyYW1lIGJ1ZmZlciBvbiB0
aGUgcnVudGltZS4gIEp1c3QgZG8gbm90DQo+PiBvdXQtb2YtYm91bmQuDQo+Pg0KPj4gVGhl
IG1pZGRsZSBkbyB0aGUgY29udmVyc2lvbiBvbiB0aGUgZmx5Lg0KPj4NCj4+DQo+PiBXZSBt
aWdodCBhbHNvIGNyZWF0ZSBkb3VibGUgc2hhZG93IGJ1ZmZlciBzaXplIHRvIGFsbG93IHRo
ZSBmcm9udCBlbmQgdG8NCj4+IHBhbj8NCj4gDQo+IFllYWggc28gdGhlIGZyb250IHNob3Vs
ZCBiZSBhYmxlIHRvIHBhbi4gQW5kIHRoZSBmcm9udC1lbmQgY2FuDQo+IGFjdHVhbGx5IG1h
a2UgeHJlcy95cmVzIHNtYWxsZSB0aGFuIGRybV9mYi0+aGVpZ2h0L3dpZHRoLCBzbyB3ZSBf
aGF2ZV8NCj4gdG8gdXNlIHRoZSBmYiBzaWRlIG9mIHRoaW5ncy4gT3RoZXJ3aXNlIGl0J3Mg
YSBidWcgSSBqdXN0IHJlYWxpemVkLg0KDQpXaGF0IGFyZSB5b3UgdGFsa2luZyBhYm91dD8g
IFRoZSBHRU0gYnVmZmVyIGlzIGEgZnVsbCBmYmRldiBmcmFtZWJ1ZmZlciwgDQp3aGljaCBp
cyBzY3JlZW4gcmVzb2x1dGlvbiBtdWx0aXBsaWVkIGJ5IHRoZSBvdmVyYWxsIGZhY3Rvci4g
IFRoZSBzaGFkb3cgDQpidWZmZXIgaXMgZXhhY3RseSB0aGUgc2FtZSBzaXplLiBZb3UgY2Fu
IGFscmVhZHkgZWFzaWx5IHBhbiB3aXRoaW4gdGhlc2UgDQpidWZmZXJzLg0KDQpUaGVyZSdz
IGFsc28gbm8gbmVlZC93YXkgdG8gY2hhbmdlIHZpZGVvIG1vZGVzIG9yIGZvcm1hdHMgaW4g
dGhlIHNoYWRvdyANCmJ1ZmZlci4gSWYgd2UnZCBldmVyIHN1cHBvcnQgdGhhdCwgaXQgd291
bGQgYmUgaW1wbGVtZW50ZWQgaW4gdGhlIERSTSANCmRyaXZlcidzIG1vZGVzZXR0aW5nLiAg
VGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIEdFTSBidWZmZXIgYW5kIHNoYWRvdyANCmJ1ZmZl
ciByZW1haW5zIHVuYWZmZWN0ZWQgYnkgdGhpcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiANCj4gVGhlIHhyZXNfdmlydHVhbC95cmVzX3ZpcnR1YWwgc2hvdWxkIGFsd2F5cyBt
YXRjaCBkcm1fZmIgc2l6ZXMgKGJ1dA0KPiB3ZSd2ZSBoYWQgYnVncyBpbiB0aGUgcGFzdCBm
b3IgdGhhdCwgb25seSByZWNlbnRseSBmaXhlZCBhbGwgaW4NCj4gbGludXgtbmV4dCksIGJl
Y2F1c2UgdGhhdCdzIHN1cHBvc2VkIHRvIGJlIHRoZSBtYXggc2l6ZS4gQW5kIHNpbmNlIHdl
DQo+IG5ldmVyIHJlYWxsb2NhdGUgdGhlIGZiZGV2IGVtdWxhdGlvbiBmYiAoYXQgbGVhc3Qg
d2l0aCB0aGUgY3VycmVudA0KPiBjb2RlKSB0aGlzIHNob3VsZCBuZXZlciBjaGFuZ2UuDQo+
IA0KPiBCdXQgZnVuZGFtZW50YWxseSB5b3UncmUgYnJpbmdpbmcgdXAgYSB2ZXJ5IGdvb2Qg
cG9pbnQsIHdlJ3ZlIGhhZA0KPiBwaWxlcyBvZiBidWdzIGluIHRoZSBwYXN0IHdpdGggbm90
IHByb3Blcmx5IHZhbGlkYXRpbmcgdGhlIGZiZGV2IHNpZGUNCj4gaW5mb3JtYXRpb24gaW4g
aW5mby0+dmFyLCBhbmQgYSBidW5jaCBvZiByZXN1bHRpbmcgYnVncy4gU28gdmFsaWRhdGlu
Zw0KPiBhZ2FpbnN0IHRoZSBkcm0gc2lkZSBvZiB0aGluZ3Mgc2hvdWxkIGJlIGEgYml0IG1v
cmUgcm9idXN0Lg0KPiANCj4gSXQncyBraW5kYSB0aGUgc2FtZSB3ZSBkbyBmb3IgbGVnYWN5
IGttcyBpb2N0bHM6IFdlIHRyYW5zbGF0ZSB0aGF0IHRvDQo+IGF0b21pYyBrbXMgYXMgZmFz
dCBhcyBwb3NzaWJsZSwgYW5kIHRoZW4gZG8gdGhlIGVudGlyZSBzdWJzZXF1ZW50DQo+IHZh
bGlkYXRpb24gd2l0aCBhdG9taWMga21zIGRhdGEgc3RydWN0dXJlcy4NCj4gLURhbmllbA0K
PiANCj4+PiBUaGUgdGhpbmcgaXMsIGlmIHlvdSBjaGFuZ2UgdGhpcw0KPj4+IGZ1cnRoZXIg
dG8ganVzdCBwYXNzIHRoZSBkcm1fZnJhbWVidWZmZXIsIHRoZW4gdGhpcyAxMDAlIGJlY29t
ZXMgYSBkcm0NCj4+PiBmdW5jdGlvbiwgd2hpY2ggY291bGQgYmUgdXNlZCBieSBhbnl0aGlu
ZyBpbiBkcm0gcmVhbGx5Lg0KPj4NCj4+IEkgYWdyZWUgd2l0aCB5b3UuDQo+Pg0KPj4gSWYg
SSB1c2UgZmJfd2lkdGgvZmJfaGVpZ2h0IGRpcmVjdGx5IGFuZCBieXBhc3NpbmcgJ2luZm8t
PnZhci54cmVzIiBhbmQNCj4+ICJpbmZvLT52YXIueXJlcyIsDQo+Pg0KPj4gdGhlIGNvZGUg
c3R5bGUgZGl2ZXJnZWQgdGhlbi4gQXMgZmFyIGFzIEkgYW0gdW5kZXJzdGFuZGluZywgIHRo
ZSBjbGlwDQo+PiBoYXBwZW4gb24gdGhlIGZyb250IGVuZCwNCj4+DQo+PiB0aGUgYWN0dWFs
IGRhbWFnZSB1cGRhdGUgaGFwcGVuIGF0IGJhY2sgZW5kLg0KPj4NCj4+IFVzaW5nIHRoZSBk
YXRhIHN0cnVjdHVyZSBjb21lIHdpdGggdGhlIGZyb250IGVuZCBpcyBtb3JlIHJlYXNvbmFi
bGUgZm9yDQo+PiBjdXJyZW50IGltcGxlbWVudC4NCj4+DQo+Pj4gQnV0IGFsc28gKnNocnVn
Ki4NCj4+DQo+PiBJIGNhbiBjb252ZXJ0IHRoaXMgc2luZ2xlIGZ1bmN0aW9uIHRvIDEwMCUg
ZHJtIHdpdGggYW5vdGhlciBwYXRjaC4NCj4+DQo+PiBCdXQsIG1heWJlIHRoZXJlIGFsc28g
aGF2ZSBvdGhlciBmdW5jdGlvbnMgYXJlIG5vdCAxMDAlIGRybQ0KPj4NCj4+IEkgd291bGQg
bGlrZSBkbyBzb21ldGhpbmcgdG8gaGVscCBhY2hpZXZlIHRoaXMgaW4gdGhlIGZ1dHVyZSwN
Cj4+DQo+PiBsZXQgbWUgaGVscCB0byBmaXggdGhpcyBidWcgZmlyc3Q/DQo+Pg0KPj4+IC1E
YW5pZWwNCj4gDQo+IA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------0YRNgJZqkqDtptV83BkbirKI--

--------------B3rPO6fLnaigaOoHxcQ8mTA1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ5AgoFAwAAAAAACgkQlh/E3EQov+D8
Gg/8CsO5n3D0mrLE8kNfcqow/EgwMmHvDWfXPG8xF7VLpiGMspe9J9roTNGWut2LXLs6rj7eamaH
JJlhqv7byrVXeWeG2fNj3whbcGUGYcNGjuIf0G8oP1WBxKR3xeQPSIqb4TWFj3IdKLzKahI2zRQ2
3va5R4md1+VRfUdvUXR8JKltUoENahaeqZ6F2667mF8ZZpkaw+JgOlHYJHDK7RdLS4+0nrxohomR
Yt8nAB4hHByG7TzzUDUI3uibj4kc/DuQ5cCHeh0r3xX0t9dvVInSVXVS2jUbtxl5jgsvToR8JuRP
rT1cINq4Yzfq90YF4oZU5Fi1T2lxMCgeHb4Sv+RIzTm/leQaV/zOXcC9OFHnXP0IjzbnIgngpklP
6tfmBdUOuswEEg2B5LlQPj7vnWg+dDYJ1nDB9ssklszqSwXzdi1baMaWL228qnYlVdLVocn9tn9a
yhSZ+dw0oEdaZrDU8Ke56f+nPvuaA0EM7Eq1TNpkNUGGp2xve4bGz2PzfXaF6dIstmm8cN3YJAEa
g5bGOR5FN1BlOZKTf5TR/PbhCqy3JbObHKYtqe8YpQHEiKjSgWPkRLydMXxNrW90GwRDSlUFeYIh
gTjt9lyNC2MmEn+eagPIJzwalybPPj7SxojMBZr2YBw+BK9v0uvrJsiyl5J30FWgW17AITZWUh/V
ytk=
=WCMt
-----END PGP SIGNATURE-----

--------------B3rPO6fLnaigaOoHxcQ8mTA1--
