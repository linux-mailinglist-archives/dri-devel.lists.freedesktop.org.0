Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEEA521004
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 10:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD9610E596;
	Tue, 10 May 2022 08:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA7F10E596
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 08:50:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1C95621C48;
 Tue, 10 May 2022 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652172627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g0IURHOoAl2M6zCSLpyMPT18KFdqoUyeDPjl0hJ99tg=;
 b=nLVA7wXSOSmDcJjrIZeUUMxWxxpiP0nwODbF4958MwRUSWet8guWCinq5YDZjQad6yjaFm
 j3aERjfh/aBvj60qmsCodmh/zjytI4jwSfKiCXNu5yLrQbgOUcWmb4xT7/+5ygozUP6cuc
 syzRP7zhCBSu0k0+grf4xqUTpi4gx1Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652172627;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g0IURHOoAl2M6zCSLpyMPT18KFdqoUyeDPjl0hJ99tg=;
 b=z9DI44p53W1bZCp1BY3XPA9xEmfmRmtEKhOc3Itu7hqfRNTDv+NP7jv/aOrF619jtWwP9L
 StJ1YBtzv96wskCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E255C13AC1;
 Tue, 10 May 2022 08:50:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8XU3NlInemKCHgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 10 May 2022 08:50:26 +0000
Message-ID: <71ebd5f7-64d0-510a-6f1b-29921fca19fa@suse.de>
Date: Tue, 10 May 2022 10:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
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
 <79aaea41-5dab-f896-ab3d-d6bc9a5de615@suse.de>
 <2d8d8583-3a39-b826-dd83-ba5bc4c5b082@redhat.com>
 <7ffd92d7-9c07-fa9c-dc95-9e82719fd237@suse.de>
In-Reply-To: <7ffd92d7-9c07-fa9c-dc95-9e82719fd237@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MHXgXaeQmCiuyyM80xVQxmIp"
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
--------------MHXgXaeQmCiuyyM80xVQxmIp
Content-Type: multipart/mixed; boundary="------------5nhp0O6fvenQ2qVUPU9Pw2Og";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <71ebd5f7-64d0-510a-6f1b-29921fca19fa@suse.de>
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
 <79aaea41-5dab-f896-ab3d-d6bc9a5de615@suse.de>
 <2d8d8583-3a39-b826-dd83-ba5bc4c5b082@redhat.com>
 <7ffd92d7-9c07-fa9c-dc95-9e82719fd237@suse.de>
In-Reply-To: <7ffd92d7-9c07-fa9c-dc95-9e82719fd237@suse.de>

--------------5nhp0O6fvenQ2qVUPU9Pw2Og
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDUuMjIgdW0gMTA6Mzcgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Ci4uLg0KPj4+DQo+Pj4gWW91IGhhdmUgdG8gZ28gdGhyb3VnaCBhbGwgRFJNIGRyaXZlcnMg
dGhhdCBjYWxsIGRybV9mYl9oZWxwZXJfZmluaSgpDQo+Pj4gYW5kIG1ha2Ugc3VyZSB0aGF0
IHRoZXkgZnJlZSBmYl9pbmZvLiBGb3IgZXhhbXBsZSBhcm1hZGEgYXBwZWFycyB0byBiZQ0K
Pj4+IGxlYWtpbmcgbm93LiBbMV0NCj4+Pg0KPj4NCj4+IEJ1dCBzaG91bGRuJ3QgZmJfaW5m
byBiZSBmcmVlZCB3aGVuIHVucmVnaXN0ZXJfZnJhbWVidWZmZXIoKSBpcyBjYWxsZWQNCj4+
IHRocm91Z2ggZHJtX2Rldl91bnJlZ2lzdGVyKCkgPyBBRkFJQ1QgdGhlIGNhbGwgY2hhaW4g
aXMgdGhlIGZvbGxvd2luZzoNCj4+DQo+PiBkcm1fcHV0X2RldigpDQo+PiDCoMKgIGRybV9k
ZXZfdW5yZWdpc3RlcigpDQo+PiDCoMKgwqDCoCBkcm1fY2xpZW50X2Rldl91bnJlZ2lzdGVy
KCkNCj4+IMKgwqDCoMKgwqDCoCBkcm1fZmJkZXZfY2xpZW50X3VucmVnaXN0ZXIoKQ0KPj4g
wqDCoMKgwqDCoMKgwqDCoCBkcm1fZmJfaGVscGVyX3VucmVnaXN0ZXJfZmJpKCkNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVucmVnaXN0ZXJfZnJhbWVidWZmZXIoKQ0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIoKQ0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwdXRfZmJfaW5mbygpDQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fZmJkZXZfZmJfZGVzdHJveSgpDQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJhbWVidWZmZXJfcmVsZWFzZSgp
DQo+Pg0KPj4gd2hpY2ggaXMgdGhlIHJlYXNvbiB3aHkgSSBiZWxpZXZlIHRoYXQgZHJtX2Zi
X2hlbHBlcl9maW5pKCkgc2hvdWxkIGJlDQo+PiBhbiBpbnRlcm5hbCBzdGF0aWMgZnVuY3Rp
b24gYW5kIG9ubHkgY2FsbGVkIGZyb20gZHJtX2ZiZGV2X2ZiX2Rlc3Ryb3koKS4NCj4+DQo+
PiBEcml2ZXJzIHNob3VsZG4ndCByZWFsbHkgZXhwbGljaXRseSBjYWxsIHRoaXMgaGVscGVy
IGluIG15IG9waW5pb24uDQoNCk9uZSBtb3JlIHN0dXBpZCBxdWVzdGlvbjogZG9lcyBhcm1h
ZGEgYWN0dWFsbHkgdXNlIA0KZHJtX2ZiZGV2X2ZiX2Rlc3Ryb3koKT8gSXQncyBzdXBwb3Nl
ZCB0byBiZSBhIGNhbGxiYWNrIGZvciBzdHJ1Y3QgDQpmYl9vcHMuIEFybWFkYSB1c2VzIGl0
J3Mgb3duIGluc3RhbmNlIG9mIGZiX29wcywgd2hpY2ggYXBwYXJlbnRseSANCmRvZXNuJ3Qg
Y29udGFpbiBmYl9kZXN0cm95LiBbMV0NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFd
IA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTcuNi9zb3VyY2UvZHJp
dmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZmJkZXYuYyNMMTkNCg0KDQo+IA0KPiBUaGFu
a3MuwqAgVGhhdCBtYWtlcyBzZW5zZS4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMN
Cj4gDQo+IA0KPj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------5nhp0O6fvenQ2qVUPU9Pw2Og--

--------------MHXgXaeQmCiuyyM80xVQxmIp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ6J1IFAwAAAAAACgkQlh/E3EQov+Dn
5g//cMbWLTZEQV4oKwTt8ao+7B/mNzQcuFG5Uof78v/C9yNDIxy/pHsS/Th/crWYY4UzkICgUlpx
tijFv0Muidxtweo+BYCJvvMQKOVQOtDzyhEqdRF2vtXKWgqEg60kR2FXeEwJDh4g3Js2aId1Fypv
Ad2dHTAQwNZaZnp2CMBeSdVPL6Kk54gzLYGYls8UsUppohfNAg1/1su+vsmdu4pLLS9Ub5nhN29q
x8IbnGajaMkV5vq3UuqrQFKQDp5pHrX78J6TFsbw9tIRPVaN3oFSqlsL9+L44KwxE8pcOEO+w9km
9CqmA2C1AAxMpB6joXJ2MB6adV5cUXK1mvEdjEQn17PCzG0EaU8LIMjNKCtzQ88pzFybuRAx9Vpo
HOWfmIgIsK8sJhgp3PzSVToZ9xGc5Vc7YWajbQ3Elj3SCWmiyxr7azCvRRC6qvRk5gAf8Y3p7oBm
dRdg20teD16JMPxFhU1ArOfJhtfRBWoWiAMBMmNaRQMIo2I2QVRsANuwpr5HDaCmjfbmGTU+co7+
WWUMZI8kTWdfJaq+4VafFN90IDTTdALS+Hn73GMU+y6lZlgI4lVuZSj79vlkWCKSHzzAKP3LDX/M
aVVwwOUi9JgFaX/vdUzYYZTy/JOY56VCN4alnPLVh4JZ49sZt4RIcmmJwE6DI+VmZ4RuUCzvU2kq
EbE=
=7eHO
-----END PGP SIGNATURE-----

--------------MHXgXaeQmCiuyyM80xVQxmIp--
