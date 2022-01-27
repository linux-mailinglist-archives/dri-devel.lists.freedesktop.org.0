Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5549E52E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F42510E72B;
	Thu, 27 Jan 2022 14:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAA810E72B;
 Thu, 27 Jan 2022 14:52:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3A87218FA;
 Thu, 27 Jan 2022 14:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643295171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mp5V5xiHVb20fGZcRy3V8WfocDnQpvBDTdKSuEAyLSI=;
 b=PZq7tCVGWximUAXewRs4d/gbFKFOr2TWmzJpjZEdu1Ma7p/yM/XQ9+fjgvLFzXLYmPbCa4
 H20dGcKWafT+oIgFvR5vT9eeCIgES9D7pDLeBMZyj5ut+DavnH2AvQY0ui2M00L0QGd8ja
 Mo8CfmqH6ozie8Omsf+iMmrJMpFqJgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643295171;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mp5V5xiHVb20fGZcRy3V8WfocDnQpvBDTdKSuEAyLSI=;
 b=3UJAmgOZyG+xXmFDCKLozYGbCdxCeBdNiEWDAd7wvI5okVa+u4tL7mhcUN5tk7L+mKIKvP
 8LcBaFBkEjFdJUAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7636D13C03;
 Thu, 27 Jan 2022 14:52:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2ky/G8Ox8mG1TwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jan 2022 14:52:51 +0000
Message-ID: <456c48a1-33d3-ed6e-1fe8-322b4bfa7eb4@suse.de>
Date: Thu, 27 Jan 2022 15:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
 <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
 <YfJedaoeJjE3grum@phenom.ffwll.local>
 <20220127093332.wnkd2qy4tvwg5i5l@ldmartin-desk2>
 <YfJtLkdkh4yde20f@phenom.ffwll.local>
 <27aed6b1-b465-6a52-2b0a-d748c9798414@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <27aed6b1-b465-6a52-2b0a-d748c9798414@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------38uziK2md8n8uKMajMCYMVXI"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------38uziK2md8n8uKMajMCYMVXI
Content-Type: multipart/mixed; boundary="------------Hiqsvf8uzsVcZ40sDjMfKPte";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Message-ID: <456c48a1-33d3-ed6e-1fe8-322b4bfa7eb4@suse.de>
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
 <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
 <YfJedaoeJjE3grum@phenom.ffwll.local>
 <20220127093332.wnkd2qy4tvwg5i5l@ldmartin-desk2>
 <YfJtLkdkh4yde20f@phenom.ffwll.local>
 <27aed6b1-b465-6a52-2b0a-d748c9798414@amd.com>
In-Reply-To: <27aed6b1-b465-6a52-2b0a-d748c9798414@amd.com>

--------------Hiqsvf8uzsVcZ40sDjMfKPte
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDEuMjIgdW0gMTE6MjEgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAyNy4wMS4yMiB1bSAxMTowMCBzY2hyaWViIERhbmllbCBWZXR0ZXI6DQo+PiBPbiBU
aHUsIEphbiAyNywgMjAyMiBhdCAwMTozMzozMkFNIC0wODAwLCBMdWNhcyBEZSBNYXJjaGkg
d3JvdGU6DQo+Pj4gT24gVGh1LCBKYW4gMjcsIDIwMjIgYXQgMDk6NTc6MjVBTSArMDEwMCwg
RGFuaWVsIFZldHRlciB3cm90ZToNCj4+Pj4gT24gVGh1LCBKYW4gMjcsIDIwMjIgYXQgMDk6
MDI6NTRBTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4+Pj4+IEFtIDI3LjAx
LjIyIHVtIDA4OjU3IHNjaHJpZWIgTHVjYXMgRGUgTWFyY2hpOg0KPj4+Pj4+IE9uIFRodSwg
SmFuIDI3LCAyMDIyIGF0IDA4OjI3OjExQU0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6DQo+Pj4+Pj4+IEFtIDI2LjAxLjIyIHVtIDIxOjM2IHNjaHJpZWIgTHVjYXMgRGUgTWFy
Y2hpOg0KPj4+Pj4+Pj4gV2hlbiBkbWFfYnVmX21hcCBzdHJ1Y3QgaXMgcGFzc2VkIGFyb3Vu
ZCwgaXQncyB1c2VmdWwgdG8gYmUgYWJsZSB0bw0KPj4+Pj4+Pj4gaW5pdGlhbGl6ZSBhIHNl
Y29uZCBtYXAgdGhhdCB0YWtlcyBjYXJlIG9mIHJlYWRpbmcvd3JpdGluZyB0byBhbiANCj4+
Pj4+Pj4+IG9mZnNldA0KPj4+Pj4+Pj4gb2YgdGhlIG9yaWdpbmFsIG1hcC4NCj4+Pj4+Pj4+
DQo+Pj4+Pj4+PiBBZGQgYSBoZWxwZXIgdGhhdCBjb3BpZXMgdGhlIHN0cnVjdCBhbmQgYWRk
IHRoZSBvZmZzZXQgdG8gdGhlIA0KPj4+Pj4+Pj4gcHJvcGVyDQo+Pj4+Pj4+PiBhZGRyZXNz
Lg0KPj4+Pj4+PiBXZWxsIHdoYXQgeW91IHByb3Bvc2UgaGVyZSBjYW4gbGVhZCB0byBhbGwg
a2luZCBvZiBwcm9ibGVtcyBhbmQgaXMNCj4+Pj4+Pj4gcmF0aGVyIGJhZCBkZXNpZ24gYXMg
ZmFyIGFzIEkgY2FuIHNlZS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhlIHN0cnVjdCBkbWFfYnVm
X21hcCBpcyBvbmx5IHRvIGJlIGZpbGxlZCBpbiBieSB0aGUgZXhwb3J0ZXIgYW5kDQo+Pj4+
Pj4+IHNob3VsZCBub3QgYmUgbW9kaWZpZWQgaW4gdGhpcyB3YXkgYnkgdGhlIGltcG9ydGVy
Lg0KPj4+Pj4+IGh1bW4uLi4gbm90IHN1cmUgaWYgSSB3YXPCoCBjbGVhci4gVGhlcmUgaXMg
bm8gaW1wb3J0ZXIgYW5kIA0KPj4+Pj4+IGV4cG9ydGVyIGhlcmUuDQo+Pj4+PiBZZWFoLCBh
bmQgZXhhY3RseSB0aGF0J3Mgd2hhdCBJJ20gcG9pbnRpbmcgb3V0IGFzIHByb2JsZW0gaGVy
ZS4NCj4+Pj4+DQo+Pj4+PiBZb3UgYXJlIHVzaW5nIHRoZSBpbnRlciBkcml2ZXIgZnJhbWV3
b3JrIGZvciBzb21ldGhpbmcgaW50ZXJuYWwgdG8gdGhlDQo+Pj4+PiBkcml2ZXIuIFRoYXQg
aXMgYW4gYWJzb2x1dGVseSBjbGVhciBOQUshDQo+Pj4+Pg0KPj4+Pj4gV2UgY291bGQgZGlz
Y3VzcyB0aGF0LCBidXQgeW91IGd1eXMgYXJlIGp1c3Qgc2VuZGluZyBhcm91bmQgcGF0Y2hl
cyANCj4+Pj4+IHRvIGRvDQo+Pj4+PiB0aGlzIHdpdGhvdXQgYW55IGNvbnNlbnN1cyB0aGF0
IHRoaXMgaXMgYSBnb29kIGlkZWEuDQo+Pj4+IFVoIEkgc3VnZ2VzdGVkIHRoaXMsIGFsc28g
d2UncmUgYWxyZWFkeSB1c2luZyBkbWFfYnVmX21hcCBhbGwgb3ZlciB0aGUNCj4+Pj4gcGxh
Y2UgYXMgYSBjb252ZW5pZW50IGFic3RyYWN0aW9uLiBTbyBpbW8gdGhhdCdzIGFsbCBmaW5l
LCBpdCBzaG91bGQgDQo+Pj4+IGFsbG93DQo+Pj4+IGRyaXZlcnMgdG8gc2ltcGxpZnkgc29t
ZSBjb2RlIHdoZXJlIG9uIGlncHUgaXQncyBpbiBub3JtYWwga2VybmVsIA0KPj4+PiBtZW1v
cnkNCj4+Pj4gYW5kIG9uIGRncHUgaXQncyBiZWhpbmQgc29tZSBwY2kgYmFyLg0KPj4+Pg0K
Pj4+PiBNYXliZSB3ZSBzaG91bGQgaGF2ZSBhIGJldHRlciBuYW1lIGZvciB0aGF0IHN0cnVj
dCAoYW5kIG1heWJlIGFsc28gYQ0KPj4+PiBiZXR0ZXIgcGxhY2UpLCBidXQgd2F5IGJhY2sg
d2hlbiB3ZSBkaXNjdXNzZWQgdGhhdCBiaWtlc2hlZCBJIGRpZG4ndCANCj4+Pj4gY29tZQ0K
Pj4+PiB1cCB3aXRoIGFueXRoaW5nIGJldHRlciByZWFsbHkuDQo+Pj4gSSBzdWdnZXN0IGlv
c3lzX21hcCBzaW5jZSBpdCBhYnN0cmFjdHMgYWNjZXNzIHRvIElPIGFuZCBzeXN0ZW0gbWVt
b3J5Lg0KPj4+DQo+Pj4+Pj4gVGhlcmUgaXMgYSByb2xlIGRlbGVnYXRpb24gb24gZmlsbGlu
ZyBvdXQgYW5kIHJlYWRpbmcgYSBidWZmZXIgd2hlbg0KPj4+Pj4+IHRoYXQgYnVmZmVyIHJl
cHJlc2VudHMgYSBzdHJ1Y3QgbGF5b3V0Lg0KPj4+Pj4+DQo+Pj4+Pj4gc3RydWN0IGJsYSB7
DQo+Pj4+Pj4gwqDCoMKgwqDCoGludCBhOw0KPj4+Pj4+IMKgwqDCoMKgwqBpbnQgYjsNCj4+
Pj4+PiDCoMKgwqDCoMKgaW50IGM7DQo+Pj4+Pj4gwqDCoMKgwqDCoHN0cnVjdCBmb28gZm9v
Ow0KPj4+Pj4+IMKgwqDCoMKgwqBzdHJ1Y3QgYmFyIGJhcjsNCj4+Pj4+PiDCoMKgwqDCoMKg
aW50IGQ7DQo+Pj4+Pj4gfQ0KPj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+PiBUaGlzIGltcGxlbWVu
dGF0aW9uIGFsbG93cyB5b3UgdG8gaGF2ZToNCj4+Pj4+Pg0KPj4+Pj4+IMKgwqDCoMKgwqBm
aWxsX2ZvbyhzdHJ1Y3QgZG1hX2J1Zl9tYXAgKmJsYV9tYXApIHsgLi4uIH0NCj4+Pj4+PiDC
oMKgwqDCoMKgZmlsbF9iYXIoc3RydWN0IGRtYV9idWZfbWFwICpibGFfbWFwKSB7IC4uLiB9
DQo+Pj4+Pj4NCj4+Pj4+PiBhbmQgdGhlIGZpcnN0IHRoaW5nIHRoZXNlIGRvIGlzIHRvIG1h
a2Ugc3VyZSB0aGUgbWFwIGl0J3MgcG9pbnRpbmcgdG8NCj4+Pj4+PiBpcyByZWxhdGl2ZSB0
byB0aGUgc3RydWN0IGl0J3Mgc3VwcG9zZWQgdG8gd3JpdGUvcmVhZC4gT3RoZXJ3aXNlIA0K
Pj4+Pj4+IHlvdSdyZQ0KPj4+Pj4+IHN1Z2dlc3RpbmcgZXZlcnl0aGluZyB0byBiZSByZWxh
dGl2ZSB0byBzdHJ1Y3QgYmxhLCBvciB0byBkbyB0aGUgc2FtZQ0KPj4+Pj4+IEknbSBkb2lu
ZyBpdCwgYnV0IElNTyBtb3JlIHByb25lIHRvIGVycm9yOg0KPj4+Pj4+DQo+Pj4+Pj4gwqDC
oMKgwqDCoHN0cnVjdCBkbWFfYnVmX21hcCBtYXAgPSAqYmxhX21hcDsNCj4+Pj4+PiDCoMKg
wqDCoMKgZG1hX2J1Zl9tYXBfaW5jcihtYXAsIG9mZnNldG9mKC4uLikpOw0KPj4+PiBXcnQg
dGhlIGlzc3VlIGF0IGhhbmQgSSB0aGluayB0aGUgYWJvdmUgaXMgcGVyZmVjdGx5IGZpbmUg
Y29kZS4gVGhlIA0KPj4+PiBpZGVhDQo+Pj4+IHdpdGggZG1hX2J1Zl9tYXAgaXMgcmVhbGx5
IHRoYXQgaXQncyBqdXN0IGEgc3BlY2lhbCBwb2ludGVyLCBzbyB3cml0aW5nDQo+Pj4+IHRo
ZSBjb2RlIGV4YWN0bHkgYXMgcG9pbnRlciBjb2RlIGZlZWxzIGJlc3QuIFVuZm9ydHVuYXRl
bHkgeW91IA0KPj4+PiBjYW5ub3QgbWFrZQ0KPj4+PiB0aGVtIHR5cGVzYWZlIChiZWNhdXNl
IG9mIEMpLCBzbyB0aGUgY29kZSBzb21ldGltZXMgbG9va3MgYSBiaXQgdWdseS4NCj4+Pj4g
T3RoZXJ3aXNlIHdlIGNvdWxkIGRvIHN0dWZmIGxpa2UgY29udGFpbmVyX29mIGFuZCBhbGwg
dGhhdCB3aXRoDQo+Pj4+IHR5cGVjaGVja2luZyBpbiB0aGUgbWFjcm9zLg0KPj4+IEkgaGFk
IGV4YWN0bHkgdGhpcyBjb2RlIGFib3ZlLCBidXQgYWZ0ZXIgd3JpdHRpbmcgcXVpdGUgYSBm
ZXcgcGF0Y2hlcw0KPj4+IHVzaW5nIGl0LCBwYXJ0aWN1bGFybHkgd2l0aCBmdW5jdGlvbnMg
dGhhdCBoYXZlIHRvIHdyaXRlIHRvIDIgbWFwcyAoc2VlDQo+Pj4gcGF0Y2ggNiBmb3IgZXhh
bXBsZSksIGl0IGZlbHQgbXVjaCBiZXR0ZXIgdG8gaGF2ZSBzb21ldGhpbmcgdG8NCj4+PiBp
bml0aWFsaXplIGNvcnJlY3RseSBmcm9tIHRoZSBzdGFydA0KPj4+DQo+Pj4gwqDCoMKgwqBz
dHJ1Y3QgZG1hX2J1Zl9tYXAgb3RoZXJfbWFwID0gKmJsYV9tYXA7DQo+Pj4gwqDCoMKgwqAv
KiBwb29yIEx1Y2FzIGZvcmdldHRpbmcgZG1hX2J1Zl9tYXBfaW5jcihtYXAsIG9mZnNldG9m
KC4uLikpOyAqLw0KPj4+DQo+Pj4gaXMgZXJyb3IgcHJvbmUgYW5kIGhhcmQgdG8gZGVidWcg
c2luY2UgeW91IHdpbGwgYmUgcmVhZGluZy93cml0dGluZw0KPj4+IGZyb20vdG8gYW5vdGhl
ciBsb2NhdGlvbiByYXRoZXIgdGhhbiBleHBsb2RpbmcNCj4+Pg0KPj4+IFdoaWxlIHdpdGgg
dGhlIGNvbnN0cnVjdCBiZWxvdw0KPj4+DQo+Pj4gwqDCoMKgwqBvdGhlcl9tYXA7DQo+Pj4g
wqDCoMKgwqAuLi4NCj4+PiDCoMKgwqDCoG90aGVyX21hcCA9IElOSVRJQUxJWkVSKCkNCj4+
Pg0KPj4+IEkgY2FuIHJlbHkgb24gdGhlIGNvbXBpbGVyIGNvbXBsYWluaW5nIGFib3V0IHVu
aW5pdGlhbGl6ZWQgdmFyLiBBbmQNCj4+PiBpbiBtb3N0IG9mIHRoZSBjYXNlcyBJIGNhbiBq
dXN0IGhhdmUgdGhpcyBzaW5nbGUgbGluZSBpbiB0aGUgDQo+Pj4gYmVnZ2luaW5nIG9mIHRo
ZQ0KPj4+IGZ1bmN0aW9uIHdoZW4gdGhlIG9mZnNldCBpcyBjb25zdGFudDoNCj4+Pg0KPj4+
IMKgwqDCoMKgc3RydWN0IGRtYV9idWZfbWFwIG90aGVyX21hcCA9IElOSVRJQUxJWkVSKGJs
YV9tYXAsIG9mZnNldG9mKC4uKSk7DQo+PiBIbSB5ZWFoIHRoYXQncyBhIGdvb2QgcG9pbnQg
dGhhdCB0aGlzIGFsbG93cyB1cyB0byByZWx5IG9uIHRoZSANCj4+IGNvbXBpbGVyIHRvDQo+
PiBjaGVjayBmb3IgdW5pbml0aWFsaXplZCB2YXJpYWJsZXMuDQo+Pg0KPj4gTWF5YmUgaW5j
bHVkZSB0aGUgYWJvdmUgKHdpdGggZWRpdGluZywgYnV0IGtlZXBpbmcgdGhlIGV4YW1wbGVz
KSBpbiB0aGUNCj4+IGtlcm5lbGRvYyB0byBleHBsYWluIHdoeS9ob3cgdG8gdXNlIHRoaXM/
IFdpdGggdGhhdCB0aGUgY29uY2VwdCBhdCBsZWFzdA0KPj4gaGFzIG15DQo+Pg0KPj4gQWNr
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+Pg0KPj4g
SSdsbCBsZWF2ZSBpdCB1cCB0byB5b3UgJiBDaHJpc3RpYW4gdG8gZmluZCBhIHByZXR0aWVy
IGNvbG9yIGNob2ljZSBmb3INCj4+IHRoZSBuYW1pbmcgYmlrZXNoZWQuDQo+IA0KPiBUaGVy
ZSBpcyBvbmUgbWFqb3IgaXNzdWUgcmVtYWluaW5nIHdpdGggdGhpcyBhbmQgdGhhdCBpcyBk
bWFfYnVmX3Z1bm1hcCgpOg0KPiANCj4gdm9pZCBkbWFfYnVmX3Z1bm1hcChzdHJ1Y3QgZG1h
X2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCk7DQo+IA0KPiBIZXJlIHdl
IGV4cGVjdCB0aGUgb3JpZ2luYWwgcG9pbnRlciBhcyByZXR1cm5lZCBieSBkbWFfYnVmX21h
cCgpLCANCj4gb3RoZXJ3aXNlIHdlIHZ1bm1hcCgpIHRoZSB3cm9uZyBhcmVhIQ0KDQpJbmRl
ZWQuIEl0J3MgYWx3YXlzIGJlZW4gYSBwcm9ibGVtIHdpdGggdGhhdCBBUEksIGV2ZW4gd2hl
biBpdCBzdGlsbCANCnRvb2sgcmF3IHBvaW50ZXJzLg0KDQpUaGUgSU1ITyBjb3JyZWN0IHNv
bHV0aW9uIHdvdWxkIGRpc3Rpbmd1aXNoIGJldHdlZW4gYSBidWZmZXIgKHN0cnVjdCANCmRt
YV9idWZfbWFwKSBhbmQgYSBwb2ludGVyIGludG8gdGhhdCBidWZmZXIgKHN0cnVjdCBkbWFf
YnVmX3B0cikuDQoNCkkgZG9uJ3QgZmVlbCBsaWtlIHR5cGluZyB0aGF0Lg0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQo+IA0KPiBGb3IgYWxsIFRUTSBiYXNlZCBkcml2ZXIgdGhpcyBk
b2Vzbid0IG1hdHRlciBzaW5jZSB3ZSBrZWVwIHRoZSB2bWFwIGJhc2UgDQo+IHNlcGFyYXRl
bHkgaW4gdGhlIEJPIGFueXdheSAoSUlSQyksIGJ1dCB3ZSBoYWQgYXQgbGVhc3Qgb25lIGNh
c2Ugd2hlcmUgDQo+IHRoaXMgbWFkZSBib29tIGxhc3QgeWVhci4NCj4gDQo+IENocmlzdGlh
bi4NCj4gDQo+PiAtRGFuaWVsDQo+Pg0KPj4+IEx1Y2FzIERlIE1hcmNoaQ0KPj4+DQo+Pj4+
IC1EYW5pZWwNCj4+Pj4NCj4+Pj4+PiBJTU8gdGhpcyBjb25zdHJ1Y3QgaXMgd29yc2UgYmVj
YXVzZSBhdCBhIHBvaW50IGluIHRpbWUgaW4gdGhlIA0KPj4+Pj4+IGZ1bmN0aW9uDQo+Pj4+
Pj4gdGhlIG1hcCB3YXMgcG9pbnRpbmcgdG8gdGhlIHdyb25nIHRoaW5nIHRoZSBmdW5jdGlv
biB3YXMgc3VwcG9zZWQgdG8NCj4+Pj4+PiByZWFkL3dyaXRlLg0KPj4+Pj4+DQo+Pj4+Pj4g
SXQncyBhbHNvIHVzZWZ1bCB3aGVuIHRoZSBmdW5jdGlvbiBoYXMgZG91YmxlIGR1dHksIHVw
ZGF0aW5nIGEgZ2xvYmFsDQo+Pj4+Pj4gcGFydCBvZiB0aGUgc3RydWN0IGFuZCBhIHRhYmxl
IGluc2lkZSBpdCAoc2VlIGV4YW1wbGUgaW4gcGF0Y2ggNikNCj4+Pj4+Pg0KPj4+Pj4+IHRo
YW5rcw0KPj4+Pj4+IEx1Y2FzIERlIE1hcmNoaQ0KPj4+PiAtLSANCj4+Pj4gRGFuaWVsIFZl
dHRlcg0KPj4+PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24NCj4+Pj4g
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHAlM0ElMkYlMkZibG9nLmZmd2xsLmNoJTJGJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3Rp
YW4ua29lbmlnJTQwYW1kLmNvbSU3QzA2NTRhMTZlYTM0NDQyNzFkN2MzMDhkOWUxN2JkMzVk
JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzc4ODc0
NDIyNjgwODg3NCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURB
aUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAw
JmFtcDtzZGF0YT1RNnNvbHVCZ2xhWkxoTHN6ZGFwYVd1VVZzcU1xNXF2Sk9LaUpqTyUyQjlC
VGclM0QmYW1wO3Jlc2VydmVkPTAgDQo+Pj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------Hiqsvf8uzsVcZ40sDjMfKPte--

--------------38uziK2md8n8uKMajMCYMVXI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHyscIFAwAAAAAACgkQlh/E3EQov+D5
thAAplHCfDDAzIJMMfYRMlDqHTbDvCULccJEGFDyJeagz6PZWhj4zwVESG1EBTtL8WoPcHxIFiyM
U9doewuf5w3R40z9iHyRuWFbqwsCMbiI7mHRPin/nn/fVfV+H7JYWsmuWkYaRvK3D4hp60naEP4I
ZqBv+kEZrzx/8hCMNHj5+QcJK8FgRcLIam3VQiEHFLEZd4D9VA5R4IQFCxCgko9vYGWJBqyAc41j
yKDz2hQzkjxMOVsBhmK4fbLiAoCFVyJSrOtRinnoTgKKaicgDuCmKIvX38ElkNRa4vSJYysmyGaK
VzoRXfN8Xj2kCg4Gpx+14ij+ojAZfMjfVNZPTiAwek2hXEqf50FRiBulesRivG5X/+u3qPy2yyiG
4cxdrA0bRgzt1kIxD0OaWxNv+yI0Tbw5PmesNm0B0mryfc6UgqwSvRF2kRJUzaqxxBqcKaspLZ1R
LzQEzK99CHyEij6+17iuLXUrenwwzmhZDNjFG+cwLOIIyRj0hoBhaeT4iDKnqVKyV5txJj2uklwi
2EU7gsAnOGcskRT/WwEzQgUG8NFE+wuJcdVqh3+594aI5RzSaGU3ZgO26OR1PWu6WMGMF1sIJgKM
EY936ewwH07rL3PIbCXfK0r/xyFIf703JD+MdOEb8QpNPA/V5ryBN59LicPc8y5cIHdzPMESBL0q
omU=
=1BXc
-----END PGP SIGNATURE-----

--------------38uziK2md8n8uKMajMCYMVXI--
