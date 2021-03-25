Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764D434989F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 18:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8B66EDE6;
	Thu, 25 Mar 2021 17:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C822F6EDE6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 17:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D83553F6BE;
 Thu, 25 Mar 2021 18:51:32 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=JBnbqbi6; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kY9Ut-ckC-Gq; Thu, 25 Mar 2021 18:51:32 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 4EE033F6BD;
 Thu, 25 Mar 2021 18:51:30 +0100 (CET)
Received: from [10.249.254.165] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0260136059E;
 Thu, 25 Mar 2021 18:51:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616694689; bh=yIsgeu3PLt8B2VGA2PrEalyxmaXCbDHFpjtAUnLL9Yw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=JBnbqbi6vAuhfNq/HXjPBCfOFBgsOv10wheSeNLjPxUBRzniauAhbotYnLpZKS5of
 VzDkBxo66te4Sj4rNot5UYM51RfgpdnJ2dg9WoEkck6bv5nBae6UuIPg0WTyScmDLV
 TQpYoEl+eJeA1RqYhIszPNut6dMI2YjHDODfaDpY=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Dave Hansen <dave.hansen@intel.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <ec99146c7abc35d16b245816aba3e9d14862e624.camel@intel.com>
 <c2239da2-c514-2c88-c671-918909cdba6b@shipmail.org>
 <YFsNRIUYrwVQanVF@phenom.ffwll.local>
 <a1fa7fa2-914b-366d-9902-e5b784e8428c@shipmail.org>
 <75423f64-adef-a2c4-8e7d-2cb814127b18@intel.com>
 <e5199438-9a0d-2801-f9f6-ceb13d7a9c61@shipmail.org>
 <6b0de827-738d-b3c5-fc79-8ca9047bad35@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <9f789d64-940f-c728-8d5e-aab74d562fb6@shipmail.org>
Date: Thu, 25 Mar 2021 18:51:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6b0de827-738d-b3c5-fc79-8ca9047bad35@intel.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjQvMjEgOToyNSBQTSwgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4gT24gMy8yNC8yMSAxOjIy
IFBNLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIHdyb3RlOgo+Pj4gV2UgYWxzbyBoYXZlIG5v
dCBiZWVuIGNhcmVmdWwgYXQgKmFsbCogYWJvdXQgaG93IF9QQUdFX0JJVF9TT0ZUVyogYXJlCj4+
PiB1c2VkLsKgIEl0J3MgcXVpdGUgcG9zc2libGUgd2UgY2FuIGVuY29kZSBhbm90aGVyIHVzZSBl
dmVuIGluIHRoZQo+Pj4gZXhpc3RpbmcgYml0cy4KPj4+Cj4+PiBQZXJzb25hbGx5LCBJJ2QganVz
dCB0cnk6Cj4+Pgo+Pj4gI2RlZmluZSBfUEFHRV9CSVRfU09GVFc1wqDCoMKgwqDCoMKgwqAgNTfC
oMKgwqDCoMKgIC8qIGF2YWlsYWJsZSBmb3IgcHJvZ3JhbW1lciAqLwo+Pj4KPj4gT0ssIEknbGwg
Zm9sbG93IHlvdXIgYWR2aXNlIGhlcmUuIEZXSVcgSSBncmVwcGVkIGZvciBTVzEgYW5kIGl0IHNl
ZW1zCj4+IHVzZWQgaW4gYSBzZWxmdGVzdCwgYnV0IG9ubHkgZm9yIFBURXMgQUZBSUNULgo+Pgo+
PiBPaCwgYW5kIHdlIGRvbid0IGNhcmUgYWJvdXQgMzItYml0IG11Y2ggYW55bW9yZT8KPiBPbiB4
ODYsIHdlIGhhdmUgNjQtYml0IFBURXMgd2hlbiBydW5uaW5nIDMyLWJpdCBrZXJuZWxzIGlmIFBB
RSBpcwo+IGVuYWJsZWQuICBJT1csIHdlIGNhbiBoYW5kbGUgdGhlIG1ham9yaXR5IG9mIDMyLWJp
dCBDUFVzIG91dCB0aGVyZS4KPgo+IEJ1dCwgeWVhaCwgd2UgZG9uJ3QgY2FyZSBhYm91dCAzMi1i
aXQuIDopCgpIbW0sCgpBY3R1YWxseSBpdCBtYWtlcyBzb21lIHNlbnNlIHRvIHVzZSBTVzEsIHRv
IG1ha2UgaXQgZW5kIHVwIGluIHRoZSBzYW1lIApkd29yZCBhcyB0aGUgUFNFIGJpdCwgYXMgZnJv
bSB3aGF0IEkgY2FuIHRlbGwsIHJlYWRpbmcgb2YgYSA2NC1iaXQgcG1kX3QgCm9uIDMyLWJpdCBQ
QUUgaXMgbm90IGF0b21pYywgc28gaW4gdGhlb3J5IGEgaHVnZSBwbWQgY291bGQgYmUgbW9kaWZp
ZWQgCndoaWxlIHJlYWRpbmcgdGhlIHBtZF90IG1ha2luZyB0aGUgZHdvcmRzIGluY29uc2lzdGVu
dC4uLi4gSG93IGRvZXMgdGhhdCAKd29yayB3aXRoIGZhc3QgZ3VwIGFueXdheT8KCkluIGFueSBj
YXNlLCB3aGF0IHdvdWxkIGJlIHRoZSBiZXN0IGNhdXNlIG9mIGFjdGlvbiBoZXJlPyBVc2UgU1cx
IG9yIApkaXNhYmxlIGNvbXBsZXRlbHkgZm9yIDMyLWJpdD8KCi9UaG9tYXMKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
