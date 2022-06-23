Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C0557D39
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 15:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0023610E0EA;
	Thu, 23 Jun 2022 13:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0AD10E047;
 Thu, 23 Jun 2022 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655991853; x=1687527853;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CA2GXdDU3D+RpZ84/aByoxvbAYl86vygoICUupBJQiw=;
 b=dw9r1DH2wHtyR7KOiFyseNoqzYChSsVfanrRSpX9iWUoZpFnuMvjFS8v
 BwJRpmea/EEfo5kp2ANtucSLdZSWMyRvI13AcvDRA+0xa/Xtb4GOQkVrm
 C0MoWTk5e++hoCdkDwq/PDCmBTF8BMUl63lV8skgHoUUZ1MCKD5vgMi7f
 JsXVrLHeiP/NddQs30bSoCSUUd5llgruLmWagxLzsmHW6nn7K0SG2iZa0
 lmAwSoh0juGw+pUl/YrWr7SEiZWlKwE9QuoLlgKbkXFfR12apjNPAzi+H
 0RI5+s+VZIC7AaZ2VcQM8w6J+Uuo4BYs2P9uSkMEoQKXE31+70LKR9Tb8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="263755493"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="263755493"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 06:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="615580537"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 23 Jun 2022 06:44:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 06:44:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 06:44:12 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.027;
 Thu, 23 Jun 2022 06:44:12 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "hbh25y@gmail.com" <hbh25y@gmail.com>
Subject: Re: [PATCH] drm: i915: fix a possible refcount leak in
 intel_dp_add_mst_connector()
Thread-Topic: [PATCH] drm: i915: fix a possible refcount leak in
 intel_dp_add_mst_connector()
Thread-Index: AQHYaPVOIovuOFJtuUiteEuitAUJL61dsg6A
Date: Thu, 23 Jun 2022 13:44:12 +0000
Message-ID: <2a11c3b90166cbc4a615db24f8dae75cfe31b5ae.camel@intel.com>
References: <20220516071922.22955-1-hbh25y@gmail.com>
In-Reply-To: <20220516071922.22955-1-hbh25y@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCCB86996862164C97D32C755E08D79B@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTA1LTE2IGF0IDE1OjE5ICswODAwLCBIYW5neXUgSHVhIHdyb3RlOg0KPiBJ
ZiBkcm1fY29ubmVjdG9yX2luaXQgZmFpbHMsIGludGVsX2Nvbm5lY3Rvcl9mcmVlIHdpbGwgYmUg
Y2FsbGVkIHRvIHRha2UgDQo+IGNhcmUgb2YgcHJvcGVyIGZyZWUuIFNvIGl0IGlzIG5lY2Vzc2Fy
eSB0byBkcm9wIHRoZSByZWZjb3VudCBvZiBwb3J0IA0KPiBiZWZvcmUgaW50ZWxfY29ubmVjdG9y
X2ZyZWUuDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXph
QGludGVsLmNvbT4NCg0KPiANCj4gRml4ZXM6IDA5MWE0ZjkxOTQyYSAoImRybS9pOTE1OiBIYW5k
bGUgZHJtLWxheWVyIGVycm9ycyBpbiBpbnRlbF9kcF9hZGRfbXN0X2Nvbm5lY3RvciIpDQo+IFNp
Z25lZC1vZmYtYnk6IEhhbmd5dSBIdWEgPGhiaDI1eUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyB8IDEgKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHBfbXN0LmMNCj4gaW5kZXggZTMwZTY5OGFhNjg0Li5mN2Q0NmVhM2FmYjkg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYw0K
PiBAQCAtODQxLDYgKzg0MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqaW50ZWxf
ZHBfYWRkX21zdF9jb25uZWN0b3Ioc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvDQo+ICAJcmV0ID0g
ZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yLCAmaW50ZWxfZHBfbXN0X2Nvbm5lY3Rv
cl9mdW5jcywNCj4gIAkJCQkgRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0KTsNCj4gIAlp
ZiAocmV0KSB7DQo+ICsJCWRybV9kcF9tc3RfcHV0X3BvcnRfbWFsbG9jKHBvcnQpOw0KPiAgCQlp
bnRlbF9jb25uZWN0b3JfZnJlZShpbnRlbF9jb25uZWN0b3IpOw0KPiAgCQlyZXR1cm4gTlVMTDsN
Cj4gIAl9DQoNCg==
