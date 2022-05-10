Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2113520F5E
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 10:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF0610F01E;
	Tue, 10 May 2022 08:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B8B10F01E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 08:04:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 377E221C34;
 Tue, 10 May 2022 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652169873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DaQLdPptUk26qMkMuzbu1HRoCL7MeOl3shsW3JAMmI8=;
 b=omWV6hdGLPgMStAGX94Vf9968qCTzQzuRKTcgTwr6HwAfFwNxOL7ku6USJPQAO3akb3fdR
 /I70zGS27HAbrCBbgmW54qHHRcWPBleHl3BwoVDoCwT4yC7PyIA6YUeGxpph86sUctJwvx
 YKo26ThqUXerqK0A3Vft+HBQb4Ue5wM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652169873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DaQLdPptUk26qMkMuzbu1HRoCL7MeOl3shsW3JAMmI8=;
 b=BTO4NYGUJPHtJWV2R0NAIEyQBnQAGPeOku4A8oKd5T0PeHVtdZn3tg1xWHgYwptt55EPyC
 vwFDtG4WGIw21HDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07DFC13AC1;
 Tue, 10 May 2022 08:04:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id toLEAJEcemIrCQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 10 May 2022 08:04:33 +0000
Message-ID: <79aaea41-5dab-f896-ab3d-d6bc9a5de615@suse.de>
Date: Tue, 10 May 2022 10:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------F05FZlZtegh5MeM9Wf0NHUAa"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------F05FZlZtegh5MeM9Wf0NHUAa
Content-Type: multipart/mixed; boundary="------------CHyi4votx1xHWFO90ogx0cZu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <79aaea41-5dab-f896-ab3d-d6bc9a5de615@suse.de>
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
In-Reply-To: <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>

--------------CHyi4votx1xHWFO90ogx0cZu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDUuMjIgdW0gMDA6NDIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDUvMTAvMjIgMDA6MjIsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6DQo+IA0K
PiBbc25pcF0NCj4gDQo+Pj4gICAgc3RhdGljIHZvaWQgZHJtX2ZiZGV2X2ZiX2Rlc3Ryb3ko
c3RydWN0IGZiX2luZm8gKmluZm8pDQo+Pj4gICAgew0KPj4+ICsgICAgICAgaWYgKGluZm8t
PmNtYXAubGVuKQ0KPj4+ICsgICAgICAgICAgICAgICBmYl9kZWFsbG9jX2NtYXAoJmluZm8t
PmNtYXApOw0KPj4+ICsNCj4+PiAgICAgICAgICAgZHJtX2ZiZGV2X3JlbGVhc2UoaW5mby0+
cGFyKTsNCj4+PiArICAgICAgIGZyYW1lYnVmZmVyX3JlbGVhc2UoaW5mbyk7DQo+Pg0KPj4g
SSB3b3VsZCBwdXQgZHJtX2ZiZGV2X3JlbGVhc2UgYXQgdGhlIGJlZ2lubmluZyAtIGl0IGNh
bmNlbHMgd29ya2Vycw0KPj4gd2hpY2ggY291bGQgZXhwZWN0IGNtYXAgdG8gYmUgc3RpbGwg
dmFsaWQuDQo+Pg0KPiANCj4gSW5kZWVkLCB5b3UgYXJlIGNvcnJlY3QgYWdhaW4uIFswXSBp
cyB0aGUgZmluYWwgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggSSd2ZQ0KPiBidXQgZG9uJ3QgaGF2
ZSBhbiBpOTE1IHRlc3QgbWFjaGluZSB0byBnaXZlIGl0IGEgdHJ5LiBJJ2xsIHRlc3QgdG9t
b3Jyb3cNCj4gb24gbXkgdGVzdCBzeXN0ZW1zIHRvIHZlcmlmeSB0aGF0IGl0IGRvZXNuJ3Qg
Y2F1c2UgYW55IHJlZ3Jlc3Npb25zIHNpbmNlDQo+IHdpdGggb3RoZXIgRFJNIGRyaXZlcnMu
DQoNCllvdSBoYXZlIHRvIGdvIHRocm91Z2ggYWxsIERSTSBkcml2ZXJzIHRoYXQgY2FsbCBk
cm1fZmJfaGVscGVyX2ZpbmkoKSANCmFuZCBtYWtlIHN1cmUgdGhhdCB0aGV5IGZyZWUgZmJf
aW5mby4gRm9yIGV4YW1wbGUgYXJtYWRhIGFwcGVhcnMgdG8gYmUgDQpsZWFraW5nIG5vdy4g
WzFdDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y1LjE3LjYvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEv
YXJtYWRhX2ZiZGV2LmMjTDE1Mg0KDQo+IA0KPiBJIHRoaW5rIHRoYXQgYmVzaWRlcyB0aGlz
IHBhdGNoLCBkcml2ZXJzIHNob3VsZG4ndCBuZWVkIHRvIGNhbGwgdG8gdGhlDQo+IGRybV9m
Yl9oZWxwZXJfZmluaSgpIGZ1bmN0aW9uIGRpcmVjdGx5LiBTaW5jZSB0aGF0IHdvdWxkIGJl
IGNhbGxlZCBkdXJpbmcNCj4gZHJtX2ZiZGV2X2ZiX2Rlc3Ryb3koKSBhbnl3YXlzLg0KPiAN
Cj4gV2Ugc2hvdWxkIHByb2JhYmx5IHJlbW92ZSB0aGF0IGNhbGwgaW4gYWxsIGRyaXZlcnMg
YW5kIG1ha2UgdGhpcyBoZWxwZXINCj4gZnVuY3Rpb24gc3RhdGljIGFuZCBqdXN0IHByaXZh
dGUgdG8gZHJtX2ZiX2hlbHBlciBmdW5jdGlvbnMuDQo+IA0KPiBPciBhbSBJIG1pc3Npbmcg
c29tZXRoaW5nIGhlcmUgPw0KPiANCj4gWzBdOg0KPiAgRnJvbSA1MTcwY2FmY2YyOTM2ZGE4
ZjFjNTMyMzFlM2JhYTdkN2EyYjE2YzYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiBG
cm9tOiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4g
RGF0ZTogVHVlIE1heSAxMCAwMDozOTo1NSAyMDIyICswMjAwDQo+IFN1YmplY3Q6IFtSRlQg
UEFUQ0hdIGRybS9mYi1oZWxwZXI6IERvbid0IGRlYWxsb2NhdGUgZmIgY29sb3JtYXAgYW5k
IGZyZWUgZmIgaW5mbw0KPiAgIHRvbyBlYXJseQ0KPiANCj4gQ3VycmVudGx5IHRoZXNlIGFy
ZSBkb25lIGluIGRybV9mYl9oZWxwZXJfZmluaSgpIGJ1dCB0aGlzIGhlbHBlciBpcyBjYWxs
ZWQNCj4gYnkgZHJpdmVycyBpbiB0aGVpciAucmVtb3ZlIGNhbGxiYWNrLCB3aGljaCBjb3Vs
ZCBsZWFkIHRvIGEgdXNlLWFmdGVyLWZyZWUNCj4gaWYgYSBwcm9jZXNzIGhhcyBvcGVuZWQg
dGhlIGVtdWxhdGVkIGZiZGV2IG5vZGUgd2hpbGUgYSBkcml2ZXIgaXMgcmVtb3ZlZC4NCj4g
DQo+IEZvciBleGFtcGxlLCBpbiBpOTE1IGRyaXZlciB0aGUgY2FsbCBjaGFpbiBkdXJpbmcg
cmVtb3ZlIGlzIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiBzdHJ1Y3QgcGNpX2RyaXZlciBpOTE1
X3BjaV9kcml2ZXIgPSB7DQo+IC4uLg0KPiAgICAgICAgICAucmVtb3ZlID0gaTkxNV9wY2lf
cmVtb3ZlLA0KPiAuLi4NCj4gfTsNCj4gDQo+IGk5MTVfcGNpX3JlbW92ZQ0KPiAgICBpOTE1
X2RyaXZlcl9yZW1vdmUNCj4gICAgICBpbnRlbF9tb2Rlc2V0X2RyaXZlcl9yZW1vdmVfbm9p
cnENCj4gICAgICAgIGludGVsX2ZiZGV2X2ZpbmkNCj4gICAgICAgICAgaW50ZWxfZmJkZXZf
ZGVzdHJveQ0KPiAgICAgICAgICAgIGRybV9mYl9oZWxwZXJfZmluaQ0KPiAgICAgICAgICAg
ICAgZnJhbWVidWZmZXJfcmVsZWFzZQ0KPiANCj4gTGF0ZXIgdGhlIHByb2Nlc3Mgd2lsbCBj
bG9zZSB0aGUgZmJkZXYgbm9kZSBmaWxlIGRlc2NyaXB0b3IgbGVhZGluZyB0byB0aGUNCj4g
bWVudGlvbmVkIHVzZS1hZnRlci1mcmVlIGJ1ZyBpbiBkcm1fZmJkZXZfZmJfZGVzdHJveSgp
LCBkdWUgdGhlIGZvbGxvd2luZzoNCj4gDQo+IGRybV9mYmRldl9mYl9kZXN0cm95DQo+ICAg
IGRybV9mYmRldl9yZWxlYXNlKGluZm8tPnBhcik7IDwtLSBpbmZvIHdhcyBhbHJlYWR5IGZy
ZWVkIG9uIC5yZW1vdmUNCj4gDQo+IFRvIHByZXZlbnQgdGhhdCwgbGV0J3MgbW92ZSB0aGUg
ZnJhbWVidWZmZXJfcmVsZWFzZSgpIGNhbGwgdG8gdGhlIGVuZCBvZg0KPiB0aGUgZHJtX2Zi
ZGV2X2ZiX2Rlc3Ryb3koKSBmdW5jdGlvbi4NCj4gDQo+IEFsc28sIHRoZSBjYWxsIHRvIGZi
X2RlYWxsb2NfY21hcCgpIGluIGRybV9mYl9oZWxwZXJfZmluaSgpIGlzIHRvbyBlYXJseQ0K
PiBhbmQgaXMgbW9yZSBjb3JyZWN0IHRvIGRvIGl0IGluIGRybV9mYmRldl9mYl9kZXN0cm95
KCkgYXMgd2VsbC4gQWZ0ZXIgYQ0KPiBjYWxsIHRvIGRybV9mYmRldl9yZWxlYXNlKCkgaGFz
IGJlZW4gbWFkZS4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBBbmRyemVqIEhhamRhIDxhbmRyemVq
LmhhamRhQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENh
bmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmJfaGVscGVyLmMgfCA5ICsrKy0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJf
aGVscGVyLmMNCj4gaW5kZXggZDI2NWE3MzMxM2M5Li43Mjg4ZmJkMjZiY2MgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiBAQCAtNjI3LDEyICs2MjcsNiBAQCB2b2lk
IGRybV9mYl9oZWxwZXJfZmluaShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyKQ0K
PiAgIAljYW5jZWxfd29ya19zeW5jKCZmYl9oZWxwZXItPnJlc3VtZV93b3JrKTsNCj4gICAJ
Y2FuY2VsX3dvcmtfc3luYygmZmJfaGVscGVyLT5kYW1hZ2Vfd29yayk7DQo+ICAgDQo+IC0J
aW5mbyA9IGZiX2hlbHBlci0+ZmJkZXY7DQo+IC0JaWYgKGluZm8pIHsNCj4gLQkJaWYgKGlu
Zm8tPmNtYXAubGVuKQ0KPiAtCQkJZmJfZGVhbGxvY19jbWFwKCZpbmZvLT5jbWFwKTsNCj4g
LQkJZnJhbWVidWZmZXJfcmVsZWFzZShpbmZvKTsNCj4gLQl9DQo+ICAgCWZiX2hlbHBlci0+
ZmJkZXYgPSBOVUxMOw0KPiAgIA0KPiAgIAltdXRleF9sb2NrKCZrZXJuZWxfZmJfaGVscGVy
X2xvY2spOw0KPiBAQCAtMjExMiw2ICsyMTA2LDkgQEAgc3RhdGljIHZvaWQgZHJtX2ZiZGV2
X3JlbGVhc2Uoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcikNCj4gICBzdGF0aWMg
dm9pZCBkcm1fZmJkZXZfZmJfZGVzdHJveShzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gICB7
DQo+ICAgCWRybV9mYmRldl9yZWxlYXNlKGluZm8tPnBhcik7DQo+ICsJaWYgKGluZm8tPmNt
YXAubGVuKQ0KPiArCQlmYl9kZWFsbG9jX2NtYXAoJmluZm8tPmNtYXApOw0KPiArCWZyYW1l
YnVmZmVyX3JlbGVhc2UoaW5mbyk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgZHJt
X2ZiZGV2X2ZiX21tYXAoc3RydWN0IGZiX2luZm8gKmluZm8sIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hKQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------CHyi4votx1xHWFO90ogx0cZu--

--------------F05FZlZtegh5MeM9Wf0NHUAa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ6HJAFAwAAAAAACgkQlh/E3EQov+BA
XxAAlKvMKE3F5e7yBblYycBRvs9vPCTY/3QHQyPYB9rG9PUu5aIKPOoOUbLfT/Jd6dvoVNU9/2UR
4921JB/E+ez/kHOL8LhWRufvN7cNL7o6VPjtKj/VIdxzBMAQXF+TCdgA/R2DQ+K+/zcXSwJWITlv
CmkgCgBrwQoP+poSHp7MMPFneZ7eJSnz9MTk1bjnXPteLd3qU6X0Kc2gMoSrmyHt/umygaa5H2Mz
mLWEsZE7cWizaiskvmTBV30h7cwU5atErQAD5U888widRTSDOxOVi9KvRXrnXo3Rm2hY2jBaXrcN
jgj0MhMEKnXtlF0btgfd7bOOna1T2Rd6oRRqR38IsSDL3K3+K/y9eX7Xle6LBIZgvcJxUwwMkRla
Cz5veJ7BfCvwlnp+obJREY7hwz6/5L3n16ftEF7uvBjiIX5LnAatWOc/AbDF7J0ESPJcksVmTety
KB/bldFM1Y4xbozFyDxLfGtYsunCv4nmwtfnFInOwT6SrDyTnRPoVG61LSEyG+qe/D1IUIyxMe0Y
PagQlmD1HOLCB5at4pLQ2dMl+qTiH/9Kuazxf++WE6iPOFv8U3AUosQnMgJqbZ5fmqLDzvXR/B0n
vdrXmxSEL4TPXBWiPTVePtW/m2HQmMhe+/C3fw/ZGHXeEzdt/B5noWtIB3A6DrvVHSrhHibIiU3J
o4c=
=IMRo
-----END PGP SIGNATURE-----

--------------F05FZlZtegh5MeM9Wf0NHUAa--
