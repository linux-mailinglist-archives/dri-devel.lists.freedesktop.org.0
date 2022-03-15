Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183E4D9FD1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 17:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AFF89104;
	Tue, 15 Mar 2022 16:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C07B89104;
 Tue, 15 Mar 2022 16:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647361190; x=1678897190;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TLLJPtNzJci6zetFIMLyQeNE1h8BPdbb5BhzFGsLOUg=;
 b=HR40kB21lHM3vpiAOUbgTCvb9nrW2mXgxnBoWKcYM3bmgGzrQU2vdxoD
 JrLmVF4qnpUHLAPwAgvfp3PZAXWOb759FXxaB1JBcfP9zfQ0+wrlFAE+e
 OjXDJkwlN4apEaWbVH5H0XxAJA6rsE7GB9jS9uou5VFAJx1CyPLKbsfLE
 2PgqWb+l3eIg6/LJU4I0Qm8iCPnTPigg117bmWntYUjlv2P7pOCm5yoSr
 zjjOR0H/+l44NGoGmmcxixoKfLGhOyU5A9GkZFE4NTnKrD4O6jxmZM+0z
 ZBrwgI6zs5tFn0J5rj6KU1afd4uK5BmB4K5zbF6eU8s0Fh7KeB5//pZ3y A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="319568318"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="319568318"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 09:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="634642905"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2022 09:19:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 09:19:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 09:19:48 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.021;
 Tue, 15 Mar 2022 09:19:48 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Reduce stack usage in debugfs due
 to SSEU
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: Reduce stack usage in debugfs due
 to SSEU
Thread-Index: AQHYOBGJjwIlFDtQbkGt5IC5W7GTgazBFn0A
Date: Tue, 15 Mar 2022 16:19:48 +0000
Message-ID: <1a82098487506f424ce468ad5e5fa73eb0c1c77c.camel@intel.com>
References: <20220315020805.844962-1-matthew.d.roper@intel.com>
In-Reply-To: <20220315020805.844962-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB94A5A73C7FC048A61F8924C6DF1C9C@intel.com>
Content-Transfer-Encoding: base64
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTAzLTE0IGF0IDE5OjA4IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBG
cm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KPiANCj4gc3Nl
dV9kZXZfaW5mbyBpcyBhbHJlYWR5IGEgcHJldHR5IGxhcmdlIHN0cnVjdHVyZSB3aGljaCB3aWxs
IGxpa2VseQ0KPiBjb250aW51ZSB0byBncm93IHdoZW4gZnV0dXJlIHBsYXRmb3JtcyBpbmNyZWFz
ZSBwb3RlbnRpYWwgRFNTIGFuZCBFVQ0KPiBjb3VudHMuICBMZXQncyBzd2l0Y2ggdGhlIHN0YWNr
IHBsYWNlbWVudCBvZiB0aGlzIHN0cnVjdHVyZSBpbiBkZWJ1Z2ZzDQo+IHdpdGggYSBkeW5hbWlj
IGFsbG9jYXRpb24uDQo+IA0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8
am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIYXJyaXNvbiA8
Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWF0dCBSb3BlciA8
bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC9pbnRlbF9zc2V1X2RlYnVnZnMuYyB8IDIyICsrKysrKysrKysrKystLS0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9zc2V1X2RlYnVnZnMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3NzZXVfZGVidWdmcy5jDQo+IGluZGV4IDZi
OTQ0ZGU0ODY2Ni4uMmQ1ZDAxMWUwMWRiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9pbnRlbF9zc2V1X2RlYnVnZnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC9pbnRlbF9zc2V1X2RlYnVnZnMuYw0KPiBAQCAtMjQ4LDcgKzI0OCw3IEBAIGludCBpbnRl
bF9zc2V1X3N0YXR1cyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHN0cnVjdCBpbnRlbF9ndCAqZ3QpDQo+
ICB7DQo+ICAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBndC0+aTkxNTsNCj4gIAlj
b25zdCBzdHJ1Y3QgaW50ZWxfZ3RfaW5mbyAqaW5mbyA9ICZndC0+aW5mbzsNCj4gLQlzdHJ1Y3Qg
c3NldV9kZXZfaW5mbyBzc2V1Ow0KPiArCXN0cnVjdCBzc2V1X2Rldl9pbmZvICpzc2V1Ow0KPiAg
CWludGVsX3dha2VyZWZfdCB3YWtlcmVmOw0KPiAgDQo+ICAJaWYgKEdSQVBISUNTX1ZFUihpOTE1
KSA8IDgpDQo+IEBAIC0yNTgsMjMgKzI1OCwyOSBAQCBpbnQgaW50ZWxfc3NldV9zdGF0dXMoc3Ry
dWN0IHNlcV9maWxlICptLCBzdHJ1Y3QgaW50ZWxfZ3QgKmd0KQ0KPiAgCWk5MTVfcHJpbnRfc3Nl
dV9pbmZvKG0sIHRydWUsIEhBU19QT09MRURfRVUoaTkxNSksICZpbmZvLT5zc2V1KTsNCj4gIA0K
PiAgCXNlcV9wdXRzKG0sICJTU0VVIERldmljZSBTdGF0dXNcbiIpOw0KPiAtCW1lbXNldCgmc3Nl
dSwgMCwgc2l6ZW9mKHNzZXUpKTsNCj4gLQlpbnRlbF9zc2V1X3NldF9pbmZvKCZzc2V1LCBpbmZv
LT5zc2V1Lm1heF9zbGljZXMsDQo+ICsNCj4gKwlzc2V1ID0ga3phbGxvYyhzaXplb2YoKnNzZXUp
LCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIXNzZXUpDQo+ICsJCXJldHVybiAtRU5PTUVNOw0KPiAr
DQo+ICsJaW50ZWxfc3NldV9zZXRfaW5mbyhzc2V1LCBpbmZvLT5zc2V1Lm1heF9zbGljZXMsDQo+
ICAJCQkgICAgaW5mby0+c3NldS5tYXhfc3Vic2xpY2VzLA0KPiAgCQkJICAgIGluZm8tPnNzZXUu
bWF4X2V1c19wZXJfc3Vic2xpY2UpOw0KPiAgDQo+ICAJd2l0aF9pbnRlbF9ydW50aW1lX3BtKCZp
OTE1LT5ydW50aW1lX3BtLCB3YWtlcmVmKSB7DQo+ICAJCWlmIChJU19DSEVSUllWSUVXKGk5MTUp
KQ0KPiAtCQkJY2hlcnJ5dmlld19zc2V1X2RldmljZV9zdGF0dXMoZ3QsICZzc2V1KTsNCj4gKwkJ
CWNoZXJyeXZpZXdfc3NldV9kZXZpY2Vfc3RhdHVzKGd0LCBzc2V1KTsNCj4gIAkJZWxzZSBpZiAo
SVNfQlJPQURXRUxMKGk5MTUpKQ0KPiAtCQkJYmR3X3NzZXVfZGV2aWNlX3N0YXR1cyhndCwgJnNz
ZXUpOw0KPiArCQkJYmR3X3NzZXVfZGV2aWNlX3N0YXR1cyhndCwgc3NldSk7DQo+ICAJCWVsc2Ug
aWYgKEdSQVBISUNTX1ZFUihpOTE1KSA9PSA5KQ0KPiAtCQkJZ2VuOV9zc2V1X2RldmljZV9zdGF0
dXMoZ3QsICZzc2V1KTsNCj4gKwkJCWdlbjlfc3NldV9kZXZpY2Vfc3RhdHVzKGd0LCBzc2V1KTsN
Cj4gIAkJZWxzZSBpZiAoR1JBUEhJQ1NfVkVSKGk5MTUpID49IDExKQ0KPiAtCQkJZ2VuMTFfc3Nl
dV9kZXZpY2Vfc3RhdHVzKGd0LCAmc3NldSk7DQo+ICsJCQlnZW4xMV9zc2V1X2RldmljZV9zdGF0
dXMoZ3QsIHNzZXUpOw0KPiAgCX0NCj4gIA0KPiAtCWk5MTVfcHJpbnRfc3NldV9pbmZvKG0sIGZh
bHNlLCBIQVNfUE9PTEVEX0VVKGk5MTUpLCAmc3NldSk7DQo+ICsJaTkxNV9wcmludF9zc2V1X2lu
Zm8obSwgZmFsc2UsIEhBU19QT09MRURfRVUoaTkxNSksIHNzZXUpOw0KPiArDQo+ICsJa2ZyZWUo
c3NldSk7DQo+ICANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCg0K
