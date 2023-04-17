Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5906B6E4085
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEF210E272;
	Mon, 17 Apr 2023 07:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9853D10E272
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:17:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1CFEC21A43;
 Mon, 17 Apr 2023 07:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681715845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mlHm/FZ1rHFHsWok7oMfEp5R5t1KE7mzb/Y7qq5IQyQ=;
 b=Yh3ZIVm/dhA03l6PPhIbhgX5FWxgQtv9XwYGEEADPjRxtMlAFQ+kSOHMMO6dldO4SxWjOR
 gemyq8ECz/d8rYRvX5oK0xcTpaE77PTgzSCvDHOyq0aVMoPBC8n0eIVEEjn2qeu4ihMj8/
 aAN5m8kOo19UK+nVQn+yHyjDqXPgBQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681715845;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mlHm/FZ1rHFHsWok7oMfEp5R5t1KE7mzb/Y7qq5IQyQ=;
 b=oGrh6UEwdn/cj3xwtrX2fimxyJ1f5ZrksH6IWvT75NPHB42euwY70P4iQmcTNw0wPjHwq/
 jvaXBSnJyZIqFKDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D11C813319;
 Mon, 17 Apr 2023 07:17:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jSnSMYTyPGSgGwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 07:17:24 +0000
Message-ID: <2061666b-3978-d117-5acd-71d0d10b0af6@suse.de>
Date: Mon, 17 Apr 2023 09:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
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
 <CAKMK7uGZUJh7JoqPSj=WJeRPDkPrxmNJGVoKcGZGy75=9AWCMA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAKMK7uGZUJh7JoqPSj=WJeRPDkPrxmNJGVoKcGZGy75=9AWCMA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------V6bfjhQPBIZJisTVt052EytK"
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-fbdev@vger.kernel.org,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Sui Jingfeng <15330273260@189.cn>,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------V6bfjhQPBIZJisTVt052EytK
Content-Type: multipart/mixed; boundary="------------6vbnjkWA6597NBOFZJTblbt3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
Message-ID: <2061666b-3978-d117-5acd-71d0d10b0af6@suse.de>
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
 <CAKMK7uGZUJh7JoqPSj=WJeRPDkPrxmNJGVoKcGZGy75=9AWCMA@mail.gmail.com>
In-Reply-To: <CAKMK7uGZUJh7JoqPSj=WJeRPDkPrxmNJGVoKcGZGy75=9AWCMA@mail.gmail.com>

--------------6vbnjkWA6597NBOFZJTblbt3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDQuMjMgdW0gMDk6NTYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBGcmksIDE0IEFwciAyMDIzIGF0IDA5OjM0LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQpbLi4uXQ0KPj4NCj4+IFRoZXJlJ3MgYWxzbyBubyBu
ZWVkL3dheSB0byBjaGFuZ2UgdmlkZW8gbW9kZXMgb3IgZm9ybWF0cyBpbiB0aGUgc2hhZG93
DQo+PiBidWZmZXIuIElmIHdlJ2QgZXZlciBzdXBwb3J0IHRoYXQsIGl0IHdvdWxkIGJlIGlt
cGxlbWVudGVkIGluIHRoZSBEUk0NCj4+IGRyaXZlcidzIG1vZGVzZXR0aW5nLiAgVGhlIHJl
bGF0aW9uc2hpcCBiZXR3ZWVuIEdFTSBidWZmZXIgYW5kIHNoYWRvdw0KPj4gYnVmZmVyIHJl
bWFpbnMgdW5hZmZlY3RlZCBieSB0aGlzLg0KPiANCj4gVHJ5IGl0IGFuZCBiZSBhbWF6ZWQg
Oi0pDQoNCkl0J3Mgbm90IHN1cHBvcnRlZC4gSSBkb24ndCBrbm93IGlmIHdlIGNhdGNoIGFs
bCB0aGUgY2FzZXMsIGJ1dCBhdCBsZWFzdCANCndlIHRyeS4gQW5kIEkgZG9uJ3QgdGhpbmsg
d2Ugd2lsbCBldmVyIHN1cHBvcnQgY2hhbmdlcyB0byB0aGUgdmlkZW8gDQptb2RlLiBUaGUg
ZnJhbWVidWZmZXIgd2lkdGgvaGVpZ2h0IGJpbmRzIHVzIHRvIGNlcnRhaW4gY29uc3RyYWlu
cyBkdXJpbmcgDQp0aGUgZGFtYWdlIGhhbmRsaW5nLiAgRmlndXJpbmcgYWxsIHRoaXMgb3V0
IGlzIHByb2JhYmx5IG5vdCB3b3J0aCB0aGUgDQplZmZvcnQuDQoNCj4gSSd2ZSBzZWVuIGVu
b3VnaCBzeXprYWxsZXIgYnVncyBhbmQgc2NyZWFtZWQNCj4gYXQgdGhlbSB0aGF0IHllcyB3
ZSBkbyB0aGlzLiBBbHNvIHhyZXMveXJlcyBpcyB0aGUgd3JvbmcgdGhpbmcgZXZlbiBpZg0K
PiB5b3UgZG9uJ3QgdXNlIGZiIGlvY3RsIHRvIGNoYW5nZSB0aGluZ3MgdXAgaW4gbXVsdGkt
bW9uaXRvciBjYXNlcyAod2UNCj4gYWxsb2NhdGUgdGhlIGRybV9mYi9mYmRldiB2aXJ0dWFs
IHNpemUgdG8gbWF0Y2ggdGhlIGJpZ2dlc3QNCj4gcmVzb2x1dGlvbiwgYnV0IHRoZW4gc2V0
IGZiaW5mby0+dmFyLngveXJlcyB0byBtYXRjaCB0aGUgc21hbGxlc3QgdG8NCj4gbWFrZSBz
dXJlIGZiY29uIGlzIGZ1bGx5IHZpc2libGUgZXZlcnl3aGVyZSkuDQo+IA0KPiBJIHRoaW5r
IHlvdSdyZSBjb25mdXNpb24gaXMgdGhlIHBlcmZlY3QgY2FzZSBmb3Igd2h5IHdlIHJlYWxs
eSBzaG91bGQNCj4gdXNlIGZiLT5oZWlnaHQvd2lkdGgvcGl0Y2hlc1swXSBoZXJlLg0KDQpJ
IHJlYWxseSBkb24ndCBzZWUgdGhlIHBvaW50IG9mIGJ1aWxkaW5nIGEgRFJNLW9ubHkgdmFy
aWFudCB3aGVuIHRoZXJlJ3MgDQp0aGUgc2FtZSBjb2RlIGluIGZiZGV2IGRyaXZlcnMuIFJl
cXVpcmVkIGluZm9ybWF0aW9uIGlzIGFsbCBzdG9yZWQgaW4gDQp0aGUgZmJfaW5mby4gVGhl
IGhlbHBlciBjb2RlIHNob3VsZCBiZSBzZWVuIGFzIHBhcnQgb2YgZmJkZXYncyBkZWZlcnJl
ZCBJL08uDQoNClRoaXMsIGhvd2V2ZXIsIGlzIGluZGVwZW5kZW50IGZyb20gdGhlIGxpbWl0
YXRpb24gd2hlcmUgdGhlIG1lbW9yeSBzaXplIA0KaGFzIHRvIGJlIGEgbXVsdGlwbGUgb2Yg
dGhlIGZyYW1lYnVmZmVyIHJlc29sdXRpb24uIFRoYXQncyBhIGxpbWl0YXRpb24gDQppbXBv
c2VkIGJ5IERSTS4gUGxlYXNlIGFsc28gbm90ZSB0aGF0IHRoaXMgaXMgb25seSByZWxldmFu
dCBmb3IgDQpmYmRldi1nZW5lcmljLiBJIGludGVudCB0byBtb3ZlIHNvbWUgb2YgdGhvc2Ug
ZGFtYWdlIGhlbHBlcnMgdGhlcmUuIEknZCANCmFzc3VtZSB0aGF0IHdpbGwgbWFrZSB0aGUg
d2hvbGUgdGhpbmcgYSBiaXQgbW9yZSB1bmRlcnN0YW5kYWJsZS4gDQooVW5mb3J0dW5hdGVs
eSwgdGhlIGZiZGV2IGVtdWxhdGlvbiBoYXMgYmVlbiBhIHZpY3RpbSBvZiBmYWxzZSBzdGFy
dHMgDQphbmQgY29tcGxleGl0eS4gSXQgdGFrZXMgdGltZSB0byBmaXggYWxsIHRoaXMuKQ0K
DQpJJ20gbm90IHN1cmUgd2h5IHlvdSByZWZlciB0byB4cmVzL3lyZXM7IEkgdGhpbmssIHRo
ZSBzbWVtX2xlbmd0aCBhbmQgDQpsaW5lX2xlbmd0aCBpcyB3aGF0IHdlJ2QgbmVlZCBpbiBt
b3N0IGNhc2VzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC1EYW5pZWwNCj4gDQo+
Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+Pj4NCj4+PiBUaGUgeHJlc192
aXJ0dWFsL3lyZXNfdmlydHVhbCBzaG91bGQgYWx3YXlzIG1hdGNoIGRybV9mYiBzaXplcyAo
YnV0DQo+Pj4gd2UndmUgaGFkIGJ1Z3MgaW4gdGhlIHBhc3QgZm9yIHRoYXQsIG9ubHkgcmVj
ZW50bHkgZml4ZWQgYWxsIGluDQo+Pj4gbGludXgtbmV4dCksIGJlY2F1c2UgdGhhdCdzIHN1
cHBvc2VkIHRvIGJlIHRoZSBtYXggc2l6ZS4gQW5kIHNpbmNlIHdlDQo+Pj4gbmV2ZXIgcmVh
bGxvY2F0ZSB0aGUgZmJkZXYgZW11bGF0aW9uIGZiIChhdCBsZWFzdCB3aXRoIHRoZSBjdXJy
ZW50DQo+Pj4gY29kZSkgdGhpcyBzaG91bGQgbmV2ZXIgY2hhbmdlLg0KPj4+DQo+Pj4gQnV0
IGZ1bmRhbWVudGFsbHkgeW91J3JlIGJyaW5naW5nIHVwIGEgdmVyeSBnb29kIHBvaW50LCB3
ZSd2ZSBoYWQNCj4+PiBwaWxlcyBvZiBidWdzIGluIHRoZSBwYXN0IHdpdGggbm90IHByb3Bl
cmx5IHZhbGlkYXRpbmcgdGhlIGZiZGV2IHNpZGUNCj4+PiBpbmZvcm1hdGlvbiBpbiBpbmZv
LT52YXIsIGFuZCBhIGJ1bmNoIG9mIHJlc3VsdGluZyBidWdzLiBTbyB2YWxpZGF0aW5nDQo+
Pj4gYWdhaW5zdCB0aGUgZHJtIHNpZGUgb2YgdGhpbmdzIHNob3VsZCBiZSBhIGJpdCBtb3Jl
IHJvYnVzdC4NCj4+Pg0KPj4+IEl0J3Mga2luZGEgdGhlIHNhbWUgd2UgZG8gZm9yIGxlZ2Fj
eSBrbXMgaW9jdGxzOiBXZSB0cmFuc2xhdGUgdGhhdCB0bw0KPj4+IGF0b21pYyBrbXMgYXMg
ZmFzdCBhcyBwb3NzaWJsZSwgYW5kIHRoZW4gZG8gdGhlIGVudGlyZSBzdWJzZXF1ZW50DQo+
Pj4gdmFsaWRhdGlvbiB3aXRoIGF0b21pYyBrbXMgZGF0YSBzdHJ1Y3R1cmVzLg0KPj4+IC1E
YW5pZWwNCj4+Pg0KPj4+Pj4gVGhlIHRoaW5nIGlzLCBpZiB5b3UgY2hhbmdlIHRoaXMNCj4+
Pj4+IGZ1cnRoZXIgdG8ganVzdCBwYXNzIHRoZSBkcm1fZnJhbWVidWZmZXIsIHRoZW4gdGhp
cyAxMDAlIGJlY29tZXMgYSBkcm0NCj4+Pj4+IGZ1bmN0aW9uLCB3aGljaCBjb3VsZCBiZSB1
c2VkIGJ5IGFueXRoaW5nIGluIGRybSByZWFsbHkuDQo+Pj4+DQo+Pj4+IEkgYWdyZWUgd2l0
aCB5b3UuDQo+Pj4+DQo+Pj4+IElmIEkgdXNlIGZiX3dpZHRoL2ZiX2hlaWdodCBkaXJlY3Rs
eSBhbmQgYnlwYXNzaW5nICdpbmZvLT52YXIueHJlcyIgYW5kDQo+Pj4+ICJpbmZvLT52YXIu
eXJlcyIsDQo+Pj4+DQo+Pj4+IHRoZSBjb2RlIHN0eWxlIGRpdmVyZ2VkIHRoZW4uIEFzIGZh
ciBhcyBJIGFtIHVuZGVyc3RhbmRpbmcsICB0aGUgY2xpcA0KPj4+PiBoYXBwZW4gb24gdGhl
IGZyb250IGVuZCwNCj4+Pj4NCj4+Pj4gdGhlIGFjdHVhbCBkYW1hZ2UgdXBkYXRlIGhhcHBl
biBhdCBiYWNrIGVuZC4NCj4+Pj4NCj4+Pj4gVXNpbmcgdGhlIGRhdGEgc3RydWN0dXJlIGNv
bWUgd2l0aCB0aGUgZnJvbnQgZW5kIGlzIG1vcmUgcmVhc29uYWJsZSBmb3INCj4+Pj4gY3Vy
cmVudCBpbXBsZW1lbnQuDQo+Pj4+DQo+Pj4+PiBCdXQgYWxzbyAqc2hydWcqLg0KPj4+Pg0K
Pj4+PiBJIGNhbiBjb252ZXJ0IHRoaXMgc2luZ2xlIGZ1bmN0aW9uIHRvIDEwMCUgZHJtIHdp
dGggYW5vdGhlciBwYXRjaC4NCj4+Pj4NCj4+Pj4gQnV0LCBtYXliZSB0aGVyZSBhbHNvIGhh
dmUgb3RoZXIgZnVuY3Rpb25zIGFyZSBub3QgMTAwJSBkcm0NCj4+Pj4NCj4+Pj4gSSB3b3Vs
ZCBsaWtlIGRvIHNvbWV0aGluZyB0byBoZWxwIGFjaGlldmUgdGhpcyBpbiB0aGUgZnV0dXJl
LA0KPj4+Pg0KPj4+PiBsZXQgbWUgaGVscCB0byBmaXggdGhpcyBidWcgZmlyc3Q/DQo+Pj4+
DQo+Pj4+PiAtRGFuaWVsDQo+Pj4NCj4+Pg0KPj4+DQo+Pg0KPj4gLS0NCj4+IFRob21hcyBa
aW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4gR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0KPiANCj4gDQo+IA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------6vbnjkWA6597NBOFZJTblbt3--

--------------V6bfjhQPBIZJisTVt052EytK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ88oQFAwAAAAAACgkQlh/E3EQov+B/
ZRAAys9T1aWZBALxOCyTl9qUQOa851YsJ++8RgZ8VJ9WAp7u6J+FbqKwqYAshgzGVQ2KeBWszLk8
vAEwAwpAwANK2WPd4rKwNyEtiQp+Ox+K/c3T0k3KM5P1WjepycgrGf6BreubJN+5C9p7bTzc9TcG
Nrv1RBlffK3svVkaAIsmRxjGh9l4abzZX2Fs7/Ad/WWh6po+O1K4/SpsZUI1stdZzkKZRI36TquD
u86Cx6FohGieL9dfX+UPkfkYLy+9KKsZAghcTnpRGDb04M4r64mUeu38soKeRZmsfowwffOUyB0G
I4QdLkt10nAsQQT+FRlCqOhDCA2Q4t7DymtefwaEG0FKm5v9a2m0Q1/Ub1A42rvtOzo3RPcAhVbv
X8pcUq9aAJppTQHkbdB2HJlvZs5IwB9QEdJOpFgBdWfFNNzyVdPgmRgboCk8Co5GeET/mkElmCD9
0KI8dc/iPksGc5hxsyuki4NbKnuRUdPUAplP3rcAUZSLlSwEXSfK0cr2aFPAK6pRD/jGYokyEiSj
8OXbGMDHFZbudkZwk+Sh0WDVAxiCQiWbCsLtqPSQ4M/9UDQ/dr7qSzH+pDuvz8YT89rCAtmTLF8e
MRCMQsTxlR9ofeFFle0JC6pNkj0EapFrxjlGPqdrzxIjnkyX9tMsh0slhzYBFgAFSbiJD+z/WIAN
M6Q=
=hQTA
-----END PGP SIGNATURE-----

--------------V6bfjhQPBIZJisTVt052EytK--
