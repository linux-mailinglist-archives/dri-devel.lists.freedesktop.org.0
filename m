Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF84911308D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 18:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32BC6E932;
	Wed,  4 Dec 2019 17:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F20D6E932
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 17:13:44 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4HDfhE068060;
 Wed, 4 Dec 2019 11:13:41 -0600
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4HDfru069280
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 4 Dec 2019 11:13:41 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 11:13:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 11:13:39 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4HDcwd085173;
 Wed, 4 Dec 2019 11:13:39 -0600
Subject: Re: [PATCH] drm/omap: fix dma_addr refcounting
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191114080343.30704-1-tomi.valkeinen@ti.com>
 <20191202123635.GE4929@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9a13214f-691f-7dfc-f68d-9927888371b4@ti.com>
Date: Wed, 4 Dec 2019 19:13:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191202123635.GE4929@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575479621;
 bh=fExYiAwEjltG1WqxH765hrWnOLyMMiFEc5MDzSESxyU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=s8kZdJ2qovCLlBzEzyoPhlaLepQxL9BTYvZeW6V9HdnLuRrccHmgcIGBKZ34CPBS6
 0QYXq4eaVgmxe9GHidKIo4Q0/1SXPHTdtQP8subnGQc9ZelSb5DMgPwMPKTNavvxqy
 9GARTTf03VuVye1k6t6vt9xgOYRo2PgTCtr30P8k=
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
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIvMTIvMjAxOSAxNDozNiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFRodSwgTm92IDE0LCAyMDE5IGF0
IDEwOjAzOjQzQU0gKzAyMDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiBjZWM0ZmE3NTExZWY3
YTczZWI2MzU4MzRlOWQ4NWIyNWE1YjQ3YTk4ICgiZHJtL29tYXA6IHVzZSByZWZjb3VudCBBUEkg
dG8KPj4gdHJhY2sgdGhlIG51bWJlciBvZiB1c2VycyBvZiBkbWFfYWRkciIpIGNoYW5nZWQgb21h
cF9nZW0uYyB0byB1c2UKPj4gcmVmY291bnRpbmcgQVBJIHRvIHRyYWNrIGRtYV9hZGRyIHVzZXMu
ICBIb3dldmVyLCB0aGUgZHJpdmVyIG9ubHkgdHJhY2tzCj4+IHRoZSByZWZjb3VudHMgZm9yIG5v
bi1jb250aWd1b3VzIGJ1ZmZlcnMsIGFuZCB0aGUgcGF0Y2ggZGlkbid0IGZ1bGx5Cj4+IHRha2Ug
dGhpcyBpbiBhY2NvdW50Lgo+Pgo+PiBBZnRlciB0aGUgcGF0Y2gsIHRoZSBkcml2ZXIgYWx3YXlz
IGRlY3JlYXNlZCByZWZjb3VudCBpbiBvbWFwX2dlbV91bnBpbiwKPj4gaW5zdGVhZCBvZiBkZWNy
ZWFzaW5nIHRoZSByZWZjb3VudCBvbmx5IGZvciBub24tY29udGlndW91cyBidWZmZXJzLiBUaGlz
Cj4+IGxlYWRzIHRvIHJlZmNvdW50aW5nIG1pc21hdGNoLgo+Pgo+PiBBcyBmb3IgdGhlIGNvbnRp
Z3VvdXMgY2FzZXMgdGhlIHJlZmNvdW50IGlzIG5ldmVyIGluY3JlYXNlZCwgZml4IHRoaXMKPj4g
aXNzdWUgYnkgcmV0dXJuaW5nIGZyb20gb21hcF9nZW1fdW5waW4gaWYgdGhlIGJ1ZmZlciBiZWlu
ZyB1bnBpbm5lZCBpcwo+PiBjb250aWd1b3VzLgo+IAo+IEhvdyBhYm91dCBhZGRpbmcgYSBGaXhl
cyBsaW5lID8KPiAKPiBGaXhlczogY2VjNGZhNzUxMWVmICgiZHJtL29tYXA6IHVzZSByZWZjb3Vu
dCBBUEkgdG8gdHJhY2sgdGhlIG51bWJlciBvZiB1c2VycyBvZiBkbWFfYWRkciIpCgpUaGFua3Mh
IEknbGwgYWRkIHRoZSBmaXhlcyBsaW5lLgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMg
RmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1
c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
