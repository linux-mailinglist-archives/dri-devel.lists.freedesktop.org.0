Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7465A6E1D5E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 09:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9996110E0DC;
	Fri, 14 Apr 2023 07:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2E710E8F7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 07:39:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78101219A7;
 Fri, 14 Apr 2023 07:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681457951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fr1F98cDcn5ZMGIydzp6li5jtJfAHi1lKHa7E2O1pnU=;
 b=mjh22XuUEhDimzlQmGmBr1N44a26sBqhay5RMndAktCgsaaugSsgfw+YBoRXLl/waN7WHd
 jY2VS0WpZS4Mw+DJ399DZW6CAe8LxBkPbHb4nHZMj0O4h3hp6fmHrjWbko/vUvlpbxY8d8
 sZGh+pBjRt7iokkCt2YAwfW7/ObC6jQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681457951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fr1F98cDcn5ZMGIydzp6li5jtJfAHi1lKHa7E2O1pnU=;
 b=fPPHTsdYfd/FW/pUpBEaitOWFCsmtXp6ZX1sajkMlL/YMXwLPabPFIj6hpnpvdkSrzPmw+
 qJQdQmTCbfsjuUCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CA2313498;
 Fri, 14 Apr 2023 07:39:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NvmyCR8DOWQyUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Apr 2023 07:39:11 +0000
Message-ID: <456c10d0-5b0e-e32f-a242-b1c88d3e6837@suse.de>
Date: Fri, 14 Apr 2023 09:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
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
 <410baaef-bc55-cb2a-2e92-a407ce5cad04@suse.de>
In-Reply-To: <410baaef-bc55-cb2a-2e92-a407ce5cad04@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------978HrjnsL6waDHd8mX0tXnNa"
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
Cc: linux-fbdev@vger.kernel.org, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------978HrjnsL6waDHd8mX0tXnNa
Content-Type: multipart/mixed; boundary="------------KxjFHggcM8ZgkkQWgK4VIs8v";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Sui Jingfeng <15330273260@189.cn>
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 Li Yi <liyi@loongson.cn>
Message-ID: <456c10d0-5b0e-e32f-a242-b1c88d3e6837@suse.de>
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
 <410baaef-bc55-cb2a-2e92-a407ce5cad04@suse.de>
In-Reply-To: <410baaef-bc55-cb2a-2e92-a407ce5cad04@suse.de>

--------------KxjFHggcM8ZgkkQWgK4VIs8v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE0LjA0LjIzIHVtIDA5OjM0IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IEhpDQo+IA0KPiBBbSAxNC4wNC4yMyB1bSAwNzozNiBzY2hyaWViIERhbmllbCBWZXR0ZXI6
DQo+PiBPbiBGcmksIDE0IEFwciAyMDIzIGF0IDA2OjI0LCBTdWkgSmluZ2ZlbmcgPDE1MzMw
MjczMjYwQDE4OS5jbj4gd3JvdGU6DQo+Pj4NCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIDIwMjMv
NC8xNCAwNDowMSwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4+Pj4gT24gVGh1LCBBcHIgMTMs
IDIwMjMgYXQgMDk6MjA6MjNQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
Pj4+PiBIaQ0KPj4+Pj4NCj4+Pj4+IEFtIDEzLjA0LjIzIHVtIDIwOjU2IHNjaHJpZWIgRGFu
aWVsIFZldHRlcjoNCj4+Pj4+IFsuLi5dDQo+Pj4+Pj4gVGhpcyBzaG91bGQgc3dpdGNoIHRo
ZSBleGlzdGluZyBjb2RlIG92ZXIgdG8gdXNpbmcgZHJtX2ZyYW1lYnVmZmVyIA0KPj4+Pj4+
IGluc3RlYWQNCj4+Pj4+PiBvZiBmYmRldjoNCj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgDQo+Pj4+Pj4gYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+Pj4+Pj4gaW5kZXggZWY0ZWI4YjEy
NzY2Li45OWNhNjlkZDQzMmYgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYw0KPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMNCj4+Pj4+PiBAQCAtNjQ3LDIyICs2NDcsMjYgQEAgc3RhdGljIHZvaWQgZHJt
X2ZiX2hlbHBlcl9kYW1hZ2Uoc3RydWN0IA0KPj4+Pj4+IGRybV9mYl9oZWxwZXIgKmhlbHBl
ciwgdTMyIHgsIHUzMiB5LA0KPj4+Pj4+IMKgwqDCoCBzdGF0aWMgdm9pZCBkcm1fZmJfaGVs
cGVyX21lbW9yeV9yYW5nZV90b19jbGlwKHN0cnVjdCBmYl9pbmZvIA0KPj4+Pj4+ICppbmZv
LCBvZmZfdCBvZmYsIHNpemVfdCBsZW4sDQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGRybV9yZWN0ICpjbGlwKQ0KPj4+Pj4+IMKgwqDCoCB7DQo+
Pj4+Pj4gK8KgwqAgc3RydWN0IGRybV9mYl9oZWxwZXIgKmhlbHBlciA9IGluZm8tPnBhcjsN
Cj4+Pj4+PiArDQo+Pj4+Pj4gwqDCoMKgwqAgb2ZmX3QgZW5kID0gb2ZmICsgbGVuOw0KPj4+
Pj4+IMKgwqDCoMKgIHUzMiB4MSA9IDA7DQo+Pj4+Pj4gwqDCoMKgwqAgdTMyIHkxID0gb2Zm
IC8gaW5mby0+Zml4LmxpbmVfbGVuZ3RoOw0KPj4+Pj4+IC3CoMKgIHUzMiB4MiA9IGluZm8t
PnZhci54cmVzOw0KPj4+Pj4+IC3CoMKgIHUzMiB5MiA9IERJVl9ST1VORF9VUChlbmQsIGlu
Zm8tPmZpeC5saW5lX2xlbmd0aCk7DQo+Pj4+Pj4gK8KgwqAgdTMyIHgyID0gaGVscGVyLT5m
Yi0+aGVpZ2h0Ow0KPj4+Pj4+ICvCoMKgIHVuc2lnbmVkIHN0cmlkZSA9IGhlbHBlci0+ZmIt
PnBpdGNoZXNbMF07DQo+Pj4+Pj4gK8KgwqAgdTMyIHkyID0gRElWX1JPVU5EX1VQKGVuZCwg
c3RyaWRlKTsNCj4+Pj4+PiArwqDCoCBpbnQgYnBwID0gZHJtX2Zvcm1hdF9pbmZvX2JwcCho
ZWxwZXItPmZiLT5mb3JtYXQsIDApOw0KPj4+Pj4gUGxlYXNlIERPTlQgZG8gdGhhdC4gVGhl
IGNvZGUgaGVyZSBpcyBmYmRldiBjb2RlIGFuZCBzaG91bGRuJ3QgDQo+Pj4+PiBib3RoZXIg
YWJvdXQNCj4+Pj4+IERSTSBkYXRhIHN0cnVjdHVyZXMuIEFjdHVhbGx5LCBpdCBzaG91bGRu
J3QgYmUgaGVyZTogYSBudW1iZXIgb2YgZmJkZXYNCj4+Pj4+IGRyaXZlcnMgd2l0aCBkZWZl
cnJlZCBJL08gY29udGFpbiBzaW1pbGFyIGNvZGUgYW5kIHRoZSBmYmRldiBtb2R1bGUgDQo+
Pj4+PiBzaG91bGQNCj4+Pj4+IHByb3ZpZGUgdXMgd2l0aCBhIGhlbHBlci4gKEkgdGhpbmsg
SSBldmVuIGhhZCBzb21lIHBhdGNoZXMgc29tZXdoZXJlLikNCj4+Pj4gV2VsbCBteSB0aGlu
a2luZyBpcyB0aGF0IGl0J3MgYSBkcm0gZHJpdmVyLA0KPj4+DQo+Pj4gWWVzLCBJIGFjdHVh
bGx5IGFncmVlIHdpdGggdGhpcywgYW5kIHRoZSBjb2RlIGxvb2tzIHF1aXRlIGdvb2QuIEFu
ZCBJDQo+Pj4gcmVhbGx5IHdhbnQgdG8gYWRvcHQgaXQuDQo+Pj4NCj4+PiBCZWNhdXNlIGhl
cmUgaXMgRFJNLCB3ZSBzaG91bGQgZW11bGF0ZSB0aGUgZmJkZXYgaW4gdGhlIERSTSdzIHdh
eS4NCj4+Pg0KPj4+IFRoZSBEUk0gaXMgcmVhbGx5IHRoZSBiaWcgYnJvdGhlciBvbiB0aGUg
YmVoaW5kIG9mIGVtdWxhdGVkIGZiZGV2LA0KPj4+DQo+Pj4gd2hvIHByb3ZpZGUgdGhlIHJl
YWwgZGlzcGxheWFibGUgYmFja2luZyBtZW1vcnkgYW5kIHNjYW50IG91dCBlbmdpbmUgdG8N
Cj4+PiBkaXNwbGF5IHN1Y2ggYSBidWZmZXIuDQo+Pj4NCj4+Pg0KPj4+IEJ1dCBjdXJyZW50
bHksIHRoZSBmYWN0IGlzLMKgIGRybV9mYl9oZWxwZXIuYyBzdGlsbCBpbml0aWFsaXplcyBs
b3RzIG9mDQo+Pj4gZGF0YSBzdHJ1Y3R1cmUgY29tZSBmcm9tIGZiZGV2IHdvcmxkLg0KPj4+
DQo+Pj4gRm9yIGV4YW1wbGUsIHRoZSBkcm1fZmJfaGVscGVyX2ZpbGxfZml4KCkgYW5kIGRy
bV9mYl9oZWxwZXJfZmlsbF92YXIoKQ0KPj4+IGluIGRybV9mYl9oZWxwZXJfZmlsbF9pbmZv
KCkgZnVuY3Rpb24uDQo+Pj4NCj4+PiBUaGlzIHNheWluZyBpbXBsaWNpdGx5IHRoYXQgdGhl
IGZiZGV2LWdlbmVyaWMgaXMgYSBnbHVlIGxheWVyIHdoaWNoIGNvcHkNCj4+PiBkYW1hZ2Ug
ZnJhbWUgYnVmZmVyIGRhdGENCj4+Pg0KPj4+IGZyb20gdGhlIGZyb250IGVuZChmYmRldiBs
YXllcikgdG8gaXRzIGRybSBiYWNrZW5kLsKgIEl0J3Mgbm90IGEgMTAwJQ0KPj4+IHJlcGxh
Y2VtZW50IGl0cyBmYmRldiBmcm9udCBlbmQsDQo+Pj4NCj4+PiByYXRoZXIsIGl0IHJlbGF5
IG9uIGl0Lg0KPj4+DQo+Pj4NCj4+Pj4gc28gaWYgd2UgaGF2ZSBpc3N1ZSB3aXRoIGxpbWl0
DQo+Pj4+IGNoZWNrcyBibG93aW5nIHVwIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gY2hlY2sg
dGhlbSBhZ2FpbnN0IGRybSBsaW1pdHMuDQo+Pj4+IFBsdXMgYSBsb3QgbW9yZSBwZW9wbGUg
dW5kZXJzdGFuZCB0aG9zZSB0aGFuIGZiZGV2LiBUaGV5IHNob3VsZCBhbGwgDQo+Pj4+IG1h
dGNoDQo+Pj4+IGFueXdheSwgb3IgaWYgdGhleSBkb250LCB3ZSBoYXZlIGEgYnVnLg0KPj4+
DQo+Pj4gWWVzLCB0aGlzIGlzIHJlYWxseSB3aGF0IEknbSB3b3JyeSBhYm91dC4NCj4+Pg0K
Pj4+IEkgc2VlIHRoYXTCoCBtZW1iZXJzIG9mIHN0cnVjdCBmYl92YXJfc2NyZWVuaW5mbyBj
YW4gYmUgY2hhbmdlZCBieQ0KPj4+IHVzZXItc3BhY2UuIEZvciBleGFtcGxlLCB4b2Zmc2V0
IGFuZCB5b2Zmc2V0Lg0KPj4+DQo+Pj4gVGhlcmUgaXMgbm8gY2hhbmdlIGFib3V0ICdpbmZv
LT52YXIueHJlcycgYW5kICdpbmZvLT52YXIueXJlcycgZnJvbSB0aGUNCj4+PiB1c2Vyc3Bh
Y2UsDQo+Pj4NCj4+PiB0aGVyZWZvcmUsIHRoZXkgc2hvdWxkIGFsbCBtYXRjaCBpbiBwcmFj
dGljZS4NCj4+Pg0KPj4+DQo+Pj4gVXNlci1zcGFjZSBjYW4gY2hvb3NlIGEgdXNlIGEgc21h
bGxlciBkaXNwYWx5IGFyZWEgdGhhbiAndmFyLnhyZXMgeA0KPj4+IHZhci55cmVzJywNCj4+
Pg0KPj4+IGJ1dCB0aGF0IGlzIGltcGxlbWVudGVkIHdpdGggJ3Zhci54b2Zmc2V0JyBhbmQg
J3Zhci54b2Zmc2V0Jy4NCj4+Pg0KPj4+IEJ1dCBjb25zaWRlciB0aGF0IHRoZSBuYW1lICd2
YXInLCB3aGljaCBtYXkgc3RhbmQgZm9yICd2YXJpYXRpb24nIG9yDQo+Pj4gJ3ZhcnknLiBU
aGlzIGlzIHRlcnJpZnlpbmcuDQo+Pj4NCj4+PiBJIGltYWdpbmUsIHdpdGggYSBzaGFkb3cg
YnVmZmVyLCB0aGUgZnJvbnQgZW5kIGNhbiBkbyBhbnkgbW9kZXNldCBvbiB0aGUNCj4+PiBy
dW50aW1lIGZyZWVseSwNCj4+Pg0KPj4+IGluY2x1ZGluZyBjaGFuZ2UgdGhlIGZvcm1hdCBv
ZiBmcmFtZSBidWZmZXIgb24gdGhlIHJ1bnRpbWUuwqAgSnVzdCBkbyBub3QNCj4+PiBvdXQt
b2YtYm91bmQuDQo+Pj4NCj4+PiBUaGUgbWlkZGxlIGRvIHRoZSBjb252ZXJzaW9uIG9uIHRo
ZSBmbHkuDQo+Pj4NCj4+Pg0KPj4+IFdlIG1pZ2h0IGFsc28gY3JlYXRlIGRvdWJsZSBzaGFk
b3cgYnVmZmVyIHNpemUgdG8gYWxsb3cgdGhlIGZyb250IGVuZCB0bw0KPj4+IHBhbj8NCj4+
DQo+PiBZZWFoIHNvIHRoZSBmcm9udCBzaG91bGQgYmUgYWJsZSB0byBwYW4uIEFuZCB0aGUg
ZnJvbnQtZW5kIGNhbg0KPj4gYWN0dWFsbHkgbWFrZSB4cmVzL3lyZXMgc21hbGxlIHRoYW4g
ZHJtX2ZiLT5oZWlnaHQvd2lkdGgsIHNvIHdlIF9oYXZlXw0KPj4gdG8gdXNlIHRoZSBmYiBz
aWRlIG9mIHRoaW5ncy4gT3RoZXJ3aXNlIGl0J3MgYSBidWcgSSBqdXN0IHJlYWxpemVkLg0K
PiANCj4gV2hhdCBhcmUgeW91IHRhbGtpbmcgYWJvdXQ/wqAgVGhlIEdFTSBidWZmZXIgaXMg
YSBmdWxsIGZiZGV2IGZyYW1lYnVmZmVyLCANCj4gd2hpY2ggaXMgc2NyZWVuIHJlc29sdXRp
b24gbXVsdGlwbGllZCBieSB0aGUgb3ZlcmFsbCBmYWN0b3IuwqAgVGhlIHNoYWRvdyANCg0K
cy9vdmVyYWxsL292ZXJhbGxvYycNCg0KPiBidWZmZXIgaXMgZXhhY3RseSB0aGUgc2FtZSBz
aXplLiBZb3UgY2FuIGFscmVhZHkgZWFzaWx5IHBhbiB3aXRoaW4gdGhlc2UgDQo+IGJ1ZmZl
cnMuDQo+IA0KPiBUaGVyZSdzIGFsc28gbm8gbmVlZC93YXkgdG8gY2hhbmdlIHZpZGVvIG1v
ZGVzIG9yIGZvcm1hdHMgaW4gdGhlIHNoYWRvdyANCj4gYnVmZmVyLiBJZiB3ZSdkIGV2ZXIg
c3VwcG9ydCB0aGF0LCBpdCB3b3VsZCBiZSBpbXBsZW1lbnRlZCBpbiB0aGUgRFJNIA0KPiBk
cml2ZXIncyBtb2Rlc2V0dGluZy7CoCBUaGUgcmVsYXRpb25zaGlwIGJldHdlZW4gR0VNIGJ1
ZmZlciBhbmQgc2hhZG93IA0KPiBidWZmZXIgcmVtYWlucyB1bmFmZmVjdGVkIGJ5IHRoaXMu
DQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFzDQo+IA0KPj4NCj4+IFRoZSB4cmVzX3Zp
cnR1YWwveXJlc192aXJ0dWFsIHNob3VsZCBhbHdheXMgbWF0Y2ggZHJtX2ZiIHNpemVzIChi
dXQNCj4+IHdlJ3ZlIGhhZCBidWdzIGluIHRoZSBwYXN0IGZvciB0aGF0LCBvbmx5IHJlY2Vu
dGx5IGZpeGVkIGFsbCBpbg0KPj4gbGludXgtbmV4dCksIGJlY2F1c2UgdGhhdCdzIHN1cHBv
c2VkIHRvIGJlIHRoZSBtYXggc2l6ZS4gQW5kIHNpbmNlIHdlDQo+PiBuZXZlciByZWFsbG9j
YXRlIHRoZSBmYmRldiBlbXVsYXRpb24gZmIgKGF0IGxlYXN0IHdpdGggdGhlIGN1cnJlbnQN
Cj4+IGNvZGUpIHRoaXMgc2hvdWxkIG5ldmVyIGNoYW5nZS4NCj4+DQo+PiBCdXQgZnVuZGFt
ZW50YWxseSB5b3UncmUgYnJpbmdpbmcgdXAgYSB2ZXJ5IGdvb2QgcG9pbnQsIHdlJ3ZlIGhh
ZA0KPj4gcGlsZXMgb2YgYnVncyBpbiB0aGUgcGFzdCB3aXRoIG5vdCBwcm9wZXJseSB2YWxp
ZGF0aW5nIHRoZSBmYmRldiBzaWRlDQo+PiBpbmZvcm1hdGlvbiBpbiBpbmZvLT52YXIsIGFu
ZCBhIGJ1bmNoIG9mIHJlc3VsdGluZyBidWdzLiBTbyB2YWxpZGF0aW5nDQo+PiBhZ2FpbnN0
IHRoZSBkcm0gc2lkZSBvZiB0aGluZ3Mgc2hvdWxkIGJlIGEgYml0IG1vcmUgcm9idXN0Lg0K
Pj4NCj4+IEl0J3Mga2luZGEgdGhlIHNhbWUgd2UgZG8gZm9yIGxlZ2FjeSBrbXMgaW9jdGxz
OiBXZSB0cmFuc2xhdGUgdGhhdCB0bw0KPj4gYXRvbWljIGttcyBhcyBmYXN0IGFzIHBvc3Np
YmxlLCBhbmQgdGhlbiBkbyB0aGUgZW50aXJlIHN1YnNlcXVlbnQNCj4+IHZhbGlkYXRpb24g
d2l0aCBhdG9taWMga21zIGRhdGEgc3RydWN0dXJlcy4NCj4+IC1EYW5pZWwNCj4+DQo+Pj4+
IFRoZSB0aGluZyBpcywgaWYgeW91IGNoYW5nZSB0aGlzDQo+Pj4+IGZ1cnRoZXIgdG8ganVz
dCBwYXNzIHRoZSBkcm1fZnJhbWVidWZmZXIsIHRoZW4gdGhpcyAxMDAlIGJlY29tZXMgYSBk
cm0NCj4+Pj4gZnVuY3Rpb24sIHdoaWNoIGNvdWxkIGJlIHVzZWQgYnkgYW55dGhpbmcgaW4g
ZHJtIHJlYWxseS4NCj4+Pg0KPj4+IEkgYWdyZWUgd2l0aCB5b3UuDQo+Pj4NCj4+PiBJZiBJ
IHVzZSBmYl93aWR0aC9mYl9oZWlnaHQgZGlyZWN0bHkgYW5kIGJ5cGFzc2luZyAnaW5mby0+
dmFyLnhyZXMiIGFuZA0KPj4+ICJpbmZvLT52YXIueXJlcyIsDQo+Pj4NCj4+PiB0aGUgY29k
ZSBzdHlsZSBkaXZlcmdlZCB0aGVuLiBBcyBmYXIgYXMgSSBhbSB1bmRlcnN0YW5kaW5nLMKg
IHRoZSBjbGlwDQo+Pj4gaGFwcGVuIG9uIHRoZSBmcm9udCBlbmQsDQo+Pj4NCj4+PiB0aGUg
YWN0dWFsIGRhbWFnZSB1cGRhdGUgaGFwcGVuIGF0IGJhY2sgZW5kLg0KPj4+DQo+Pj4gVXNp
bmcgdGhlIGRhdGEgc3RydWN0dXJlIGNvbWUgd2l0aCB0aGUgZnJvbnQgZW5kIGlzIG1vcmUg
cmVhc29uYWJsZSBmb3INCj4+PiBjdXJyZW50IGltcGxlbWVudC4NCj4+Pg0KPj4+PiBCdXQg
YWxzbyAqc2hydWcqLg0KPj4+DQo+Pj4gSSBjYW4gY29udmVydCB0aGlzIHNpbmdsZSBmdW5j
dGlvbiB0byAxMDAlIGRybSB3aXRoIGFub3RoZXIgcGF0Y2guDQo+Pj4NCj4+PiBCdXQsIG1h
eWJlIHRoZXJlIGFsc28gaGF2ZSBvdGhlciBmdW5jdGlvbnMgYXJlIG5vdCAxMDAlIGRybQ0K
Pj4+DQo+Pj4gSSB3b3VsZCBsaWtlIGRvIHNvbWV0aGluZyB0byBoZWxwIGFjaGlldmUgdGhp
cyBpbiB0aGUgZnV0dXJlLA0KPj4+DQo+Pj4gbGV0IG1lIGhlbHAgdG8gZml4IHRoaXMgYnVn
IGZpcnN0Pw0KPj4+DQo+Pj4+IC1EYW5pZWwNCj4+DQo+Pg0KPj4NCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------KxjFHggcM8ZgkkQWgK4VIs8v--

--------------978HrjnsL6waDHd8mX0tXnNa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ5Ax4FAwAAAAAACgkQlh/E3EQov+Ac
dg//WuD8Gz7uhSYjd72bQRbguk3/SAzPLkd7xDoJT8/5KSPJR9Y30jKUaBfT4adQaFDugGhd1weH
hcvK24I8k8d0cxxU1dpD2iwv5WDVCF+6oeAs+AmaJBr93i/TZ4bsV6GhwMhbU2bLaPW9XclFz8Mq
+2HmwtQuaIIQp/SyxbxjEVrmSXIHJGBJh3yYFRp6rViQZMqHEGy2CJ5HAkAjaLiKkjbrvRLvL7xi
G3WvwU8DQrMZq7N49AW/iovrfHfMr43VT7jC0ND2Nv41OQ4ovIvjjbDiM4fucXLBNQecC9Dty8fw
tCPr+WoQehmpqUwMkpCtqGQsC8auUzTWTT2WgD/KCgHxTvX/xvxlM8eLG1pnLTsz/3WIWpH+FHYO
IdaccD41YWgS37TXqci4wWhgdAwXDGYwTTITVjEcJtVGj4Jg4FTrYURae28dTzyn8t2Vra1Rsdv2
R+1LOQ22oQdehcqs6nVc3qMWz1sZQvEIOyRoOjbPqal1jgXUH4+bkY9pAgDBWWN0iIrasCyhn65Q
tyT+veWUsUZ23eEF2XJVfVe7AcTFkwT813Wr6VQmt+gY4b/0CNWUCpoOUnIm6H58ULfje/Z5Ufep
kot3g/BGYT5+f05uzTQeF/mkx7vH1OZnKws5xG+tYDgktoT5/1bBdLxJLs8IPn7bCymn6EKooqLA
4Kc=
=D9Ey
-----END PGP SIGNATURE-----

--------------978HrjnsL6waDHd8mX0tXnNa--
