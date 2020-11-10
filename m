Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C572ADA65
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 16:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C234389AA6;
	Tue, 10 Nov 2020 15:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BDD899E7;
 Tue, 10 Nov 2020 15:27:05 +0000 (UTC)
IronPort-SDR: xrRcZ3hjeX6ecXLz4EEURb7pLRnV+XCU7wg52hMxceAUnwXjZ7QQwgP0ZIQ01dS6If4FUpIFJI
 sexGOxNTphnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="170100309"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="170100309"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 07:27:02 -0800
IronPort-SDR: uvPxijs0gSJfdTQpr169c4l2/cuyPZTUX0BcNrQPQy+K7r4MGpw6hw9DTHp+9nwPbjIb3iO8MJ
 ZO31eUD8lxBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="473456486"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 10 Nov 2020 07:27:02 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Nov 2020 07:27:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Nov 2020 07:27:01 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Tue, 10 Nov 2020 07:27:01 -0800
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "bskeggs@redhat.com"
 <bskeggs@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
Subject: RE: [PATCH] drm/nouveau: Fix out-of-bounds access when deferencing
 MMU type
Thread-Topic: [PATCH] drm/nouveau: Fix out-of-bounds access when deferencing
 MMU type
Thread-Index: AQHWt2aSn1GTeNlCkEeQC226gW12GqnBfJcg
Date: Tue, 10 Nov 2020 15:27:01 +0000
Message-ID: <85758a6215f74917aee81b18d037fb82@intel.com>
References: <20201110133655.13174-1-tzimmermann@suse.de>
In-Reply-To: <20201110133655.13174-1-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Roland Scheidegger <sroland@vmware.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Huang Rui <ray.huang@amd.com>, VMware
 Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Likun Gao <Likun.Gao@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPg0KPlNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDEwLCAyMDIw
IDg6MzcgQU0NCj5UbzogYnNrZWdnc0ByZWRoYXQuY29tOyBhaXJsaWVkQGxpbnV4LmllOyBkYW5p
ZWxAZmZ3bGwuY2g7IFJ1aGwsIE1pY2hhZWwgSg0KPjxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+
OyBjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20NCj5DYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFRob21hcw0KPlppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBNYWFydGVuIExhbmtob3JzdA0KPjxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkDQo+PG1yaXBhcmRAa2VybmVs
Lm9yZz47IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+OyBHZXJkIEhvZmZtYW5uDQo+
PGtyYXhlbEByZWRoYXQuY29tPjsgQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPjsNCj5WTXdhcmUgR3JhcGhpY3MgPGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJl
LmNvbT47IFJvbGFuZA0KPlNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2FyZS5jb20+OyBIdWFuZyBS
dWkgPHJheS5odWFuZ0BhbWQuY29tPjsNCj5GZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdA
YW1kLmNvbT47IEhhd2tpbmcgWmhhbmcNCj48SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgSmFzb24g
R3VudGhvcnBlIDxqZ2dAemllcGUuY2E+OyBMaWt1biBHYW8NCj48TGlrdW4uR2FvQGFtZC5jb20+
OyB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZzsgc3BpY2UtDQo+ZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PlN1YmplY3Q6IFtQQVRDSF0gZHJtL25vdXZlYXU6IEZpeCBvdXQtb2YtYm91bmRzIGFjY2VzcyB3
aGVuIGRlZmVyZW5jaW5nDQo+TU1VIHR5cGUNCj4NCj5UaGUgdmFsdWUgb2Ygc3RydWN0IGRybV9k
ZXZpY2UudHRtLnR5cGVfdnJhbSBjYW4gYmVjb21lIC0xIGZvciB1bmtub3duDQo+dHlwZXMgb2Yg
bWVtb3J5IChzZWUgbm91dmVhdV90dG1faW5pdCgpKS4gVGhpcyBsZWFkcyB0byBhbiBvdXQtb2Yt
Ym91bmRzDQo+ZXJyb3Igd2hlbiBhY2Nlc3Npbmcgc3RydWN0IG52aWZfbW11LnR5cGVbXToNCg0K
V291bGQgdGhpcyBtYWtlIG1vcmUgc2Vuc2UgdG8ganVzdCBzZXQgdGhlIHR5cGVfdnJhbSA9IDAg
aW5zdGVhZCBvZiAtMT8NCg0KTWlrZQ0KDQo+DQo+ICBbICAgMTguMzA0MTE2XQ0KPj09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+PT09
PT09PQ0KPiAgWyAgIDE4LjMxMTY0OV0gQlVHOiBLQVNBTjogc2xhYi1vdXQtb2YtYm91bmRzIGlu
DQo+bm91dmVhdV90dG1faW9fbWVtX3Jlc2VydmUrMHgxN2EvMHg3ZTAgW25vdXZlYXVdDQo+ICBb
ICAgMTguMzIwNDE1XSBSZWFkIG9mIHNpemUgMSBhdCBhZGRyIGZmZmY4ODgxMGZmYWMxZmUgYnkg
dGFzayBzeXN0ZW1kLQ0KPnVkZXZkLzM0Mg0KPiAgWyAgIDE4LjMyNzY4MV0NCj4gIFsgICAxOC4z
MjkyMDhdIENQVTogMSBQSUQ6IDM0MiBDb21tOiBzeXN0ZW1kLXVkZXZkIFRhaW50ZWQ6IEcgICAg
ICAgICAgICBFDQo+NS4xMC4wLXJjMi0xLWRlZmF1bHQrICM1ODENCj4gIFsgICAxOC4zMzg2ODFd
IEhhcmR3YXJlIG5hbWU6IERlbGwgSW5jLiBPcHRpUGxleCA5MDIwLzBONFlDOCwgQklPUyBBMjQN
Cj4xMC8yNC8yMDE4DQo+ICBbICAgMTguMzQ2MDMyXSBDYWxsIFRyYWNlOg0KPiAgWyAgIDE4LjM0
ODUzNl0gIGR1bXBfc3RhY2srMHhhZS8weGU1DQo+ICBbICAgMTguMzUxOTE5XSAgcHJpbnRfYWRk
cmVzc19kZXNjcmlwdGlvbi5jb25zdHByb3AuMCsweDE3LzB4ZjANCj4gIFsgICAxOC4zNTc3ODdd
ICA/IG5vdXZlYXVfdHRtX2lvX21lbV9yZXNlcnZlKzB4MTdhLzB4N2UwIFtub3V2ZWF1XQ0KPiAg
WyAgIDE4LjM2MzgxOF0gIF9fa2FzYW5fcmVwb3J0LmNvbGQrMHgyMC8weDM4DQo+ICBbICAgMTgu
MzY4MDk5XSAgPyBub3V2ZWF1X3R0bV9pb19tZW1fcmVzZXJ2ZSsweDE3YS8weDdlMCBbbm91dmVh
dV0NCj4gIFsgICAxOC4zNzQxMzNdICBrYXNhbl9yZXBvcnQrMHgzYS8weDUwDQo+ICBbICAgMTgu
Mzc3Nzg5XSAgbm91dmVhdV90dG1faW9fbWVtX3Jlc2VydmUrMHgxN2EvMHg3ZTAgW25vdXZlYXVd
DQo+ICA8Li4uPg0KPiAgWyAgIDE4Ljc2NzY5MF0gQWxsb2NhdGVkIGJ5IHRhc2sgMzQyOg0KPiAg
WyAgIDE4Ljc3MzA4N10gIGthc2FuX3NhdmVfc3RhY2srMHgxYi8weDQwDQo+ICBbICAgMTguNzc4
ODkwXSAgX19rYXNhbl9rbWFsbG9jLmNvbnN0cHJvcC4wKzB4YmYvMHhkMA0KPiAgWyAgIDE4Ljc4
NTY0Nl0gIF9fa21hbGxvY190cmFja19jYWxsZXIrMHgxYmUvMHgzOTANCj4gIFsgICAxOC43OTIx
NjVdICBrc3RyZHVwX2NvbnN0KzB4NDYvMHg3MA0KPiAgWyAgIDE4Ljc5NzY4Nl0gIGtvYmplY3Rf
c2V0X25hbWVfdmFyZ3MrMHgyZi8weGIwDQo+ICBbICAgMTguODAzOTkyXSAga29iamVjdF9pbml0
X2FuZF9hZGQrMHg5ZC8weGYwDQo+ICBbICAgMTguODEwMTE3XSAgdHRtX21lbV9nbG9iYWxfaW5p
dCsweDEyYy8weDIxMCBbdHRtXQ0KPiAgWyAgIDE4LjgxNjg1M10gIHR0bV9ib19nbG9iYWxfaW5p
dCsweDRhLzB4MTYwIFt0dG1dDQo+ICBbICAgMTguODIzNDIwXSAgdHRtX2JvX2RldmljZV9pbml0
KzB4MzkvMHgyMjAgW3R0bV0NCj4gIFsgICAxOC44MzAwNDZdICBub3V2ZWF1X3R0bV9pbml0KzB4
MmMzLzB4ODMwIFtub3V2ZWF1XQ0KPiAgWyAgIDE4LjgzNjkyOV0gIG5vdXZlYXVfZHJtX2Rldmlj
ZV9pbml0KzB4MWI0LzB4M2YwIFtub3V2ZWF1XQ0KPiAgPC4uLj4NCj4gIFsgICAxOS4xMDUzMzZd
DQo+PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0NCj49PT09PT09DQo+DQo+Rml4IHRoaXMgZXJyb3IsIGJ5IG5vdCB1c2luZyB0eXBlX3Zy
YW0gYXMgYW4gaW5kZXggaWYgaXQncyBuZWdhdGl2ZS4NCj5Bc3N1bWUgZGVmYXVsdCB2YWx1ZXMg
aW5zdGVhZC4NCj4NCj5UaGUgZXJyb3Igd2FzIHNlZW4gb24gTnZpZGlhIEc3MiBoYXJkd2FyZS4N
Cj4NCj5TaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCj5GaXhlczogMWNmNjVjNDUxODNhICgiZHJtL3R0bTogYWRkIGNhY2hpbmcgc3RhdGUgdG8g
dHRtX2J1c19wbGFjZW1lbnQiKQ0KPkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+DQo+Q2M6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPg0KPkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPg0KPkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+Q2M6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPkNjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+DQo+Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4N
Cj5DYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPg0KPkNjOiBEYXZlIEFpcmxpZSA8
YWlybGllZEByZWRoYXQuY29tPg0KPkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4NCj5DYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPkNjOiAi
Q2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj5DYzogVk13YXJl
IEdyYXBoaWNzIDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+DQo+Q2M6IFJv
bGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPg0KPkNjOiBIdWFuZyBSdWkgPHJh
eS5odWFuZ0BhbWQuY29tPg0KPkNjOiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4NCj5DYzogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPkNjOiBK
YXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4NCj5DYzogTGlrdW4gR2FvIDxMaWt1bi5HYW9A
YW1kLmNvbT4NCj5DYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBub3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZw0KPkNjOiBzcGljZS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj5DYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4tLS0NCj4gZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9iby5jIHwgNSArKysrLQ0KPiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYw0KPmIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9iby5jDQo+aW5kZXggODEzMzM3N2Q4NjVkLi5mZTE1Mjk5ZDQxN2UgMTAwNjQ0DQo+LS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jDQo+KysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jDQo+QEAgLTExNDIsOSArMTE0MiwxMiBAQCBub3V2
ZWF1X3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QNCj50dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1
Y3QgdHRtX3Jlc291cmNlICpyZWcpDQo+IAlzdHJ1Y3QgbnZrbV9kZXZpY2UgKmRldmljZSA9IG52
eHhfZGV2aWNlKCZkcm0tPmNsaWVudC5kZXZpY2UpOw0KPiAJc3RydWN0IG5vdXZlYXVfbWVtICpt
ZW0gPSBub3V2ZWF1X21lbShyZWcpOw0KPiAJc3RydWN0IG52aWZfbW11ICptbXUgPSAmZHJtLT5j
bGllbnQubW11Ow0KPi0JY29uc3QgdTggdHlwZSA9IG1tdS0+dHlwZVtkcm0tPnR0bS50eXBlX3Zy
YW1dLnR5cGU7DQo+Kwl1OCB0eXBlID0gMDsNCj4gCWludCByZXQ7DQo+DQo+KwlpZiAoZHJtLT50
dG0udHlwZV92cmFtID49IDApDQo+KwkJdHlwZSA9IG1tdS0+dHlwZVtkcm0tPnR0bS50eXBlX3Zy
YW1dLnR5cGU7DQo+Kw0KPiAJbXV0ZXhfbG9jaygmZHJtLT50dG0uaW9fcmVzZXJ2ZV9tdXRleCk7
DQo+IHJldHJ5Og0KPiAJc3dpdGNoIChyZWctPm1lbV90eXBlKSB7DQo+LS0NCj4yLjI5LjINCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
