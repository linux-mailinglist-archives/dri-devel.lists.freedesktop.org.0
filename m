Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CF49CE8E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 13:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F1389C97;
	Mon, 26 Aug 2019 11:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C89B89C97
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 11:50:18 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7QBoC11045817;
 Mon, 26 Aug 2019 06:50:12 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7QBoC4N010669
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Aug 2019 06:50:12 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 26
 Aug 2019 06:50:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 26 Aug 2019 06:50:11 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7QBoA6s036091;
 Mon, 26 Aug 2019 06:50:10 -0500
Subject: Re: [PATCH v2 29/50] drm/omap: hdmi4: Move mode set, enable and
 disable operations to bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-30-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1cefaf9e-7937-cb3b-33bf-797395576649@ti.com>
Date: Mon, 26 Aug 2019 14:50:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820011721.30136-30-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1566820212;
 bh=5blO5qVtvdMRp0aFJvMLFOACTA4ufuroWaMERPZ8vSM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=YKDY5rz4NitBqoUS9W+QCMmvKVhosul264qizB80NfIHYR9xRCl74FIgHPunWPWx2
 FHcLXDS4lHOYZ9y/4IjtgFlQIrdKyi4lzJayKB17mgvUDldXM+SnjUV6MKgTClAMOg
 w3ugb9MfaIGOmFLyvRf0HHuLukYPy+ZU68pj1E7A=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAvMDgvMjAxOSAwNDoxNywgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBNb3ZlIHRoZSBv
bWFwX2Rzc19kZXZpY2UgLnNldF90aW1pbmdzKCksIC5lbmFibGUoKSBhbmQgLmRpc2FibGUoKQo+
IG9wZXJhdGlvbnMgdG8gdGhlIGRybV9icmlkZ2UgZnVuY3Rpb25zLiBBcyB0aGUgZHJtX2JyaWRn
ZSBmb3IgdGhlIEhETUkKPiBlbmNvZGVyIGlzIHVuY29uZGl0aW9uYWxseSByZWdpc3RlcmVkIGFu
ZCBhdHRhY2hlZCwgdGhvc2Ugb3BlcmF0aW9ucwo+IHdpbGwgYmUgY2FsbGVkIGF0IHRoZSBhcHBy
b3ByaWF0ZSB0aW1lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL2Rzcy9oZG1pNC5jIHwgMjAxICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxMDYgaW5zZXJ0aW9ucygrKSwgOTUgZGVsZXRpb25zKC0pCgpzZXRf
aGRtaV9tb2RlIGFuZCBzZXRfaW5mb2ZyYW1lIHNlZW0gdG8gZ2V0IG1lcmdlZCBpbnRvIGJyaWRn
ZV9lbmFibGUuIEkgCnRoaW5rIHRoYXQncyB3b3J0aCBtZW50aW9uaW5nIGluIHRoZSBkZXNjLiAo
Zm9yIHRoZSBuZXh0IHBhdGNoIHRvbykKCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZp
bmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNp
bmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
