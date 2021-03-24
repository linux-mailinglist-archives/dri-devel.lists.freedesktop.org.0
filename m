Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3553482C6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 21:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442A96EA88;
	Wed, 24 Mar 2021 20:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D09C6EA88
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 20:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id EC54F401A9;
 Wed, 24 Mar 2021 21:22:21 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=mUke6Mhz; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uwy-0R5DIGEx; Wed, 24 Mar 2021 21:22:21 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 4B8D8401B9;
 Wed, 24 Mar 2021 21:22:18 +0100 (CET)
Received: from [10.249.254.166] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0695836062E;
 Wed, 24 Mar 2021 21:22:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616617338; bh=mjVvc9eC6YajJlFKKvLl6cV8/6/08eBr/yysRCc8+Ew=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=mUke6Mhz/EjBhy6BxSLI+hGZTe4KitrU8n1Pxt95MkZiPi5Xaj0ccLhSugRHrlkid
 c5l5Met3bKk5lcIOYNIsJ8e6VhhsCuXzyomxA7AgZvKPQ+HCRzrg7wutbtNWqVL7jI
 7SeKGdvhdhVdi7t/HTqMy1m6XG491Oz5w46LWXqQ=
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
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <e5199438-9a0d-2801-f9f6-ceb13d7a9c61@shipmail.org>
Date: Wed, 24 Mar 2021 21:22:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <75423f64-adef-a2c4-8e7d-2cb814127b18@intel.com>
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

Ck9uIDMvMjQvMjEgNTozNCBQTSwgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4gT24gMy8yNC8yMSAzOjA1
IEFNLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIHdyb3RlOgo+PiBZZXMsIEkgYWdyZWUuIFNl
ZW1zIGxpa2UgdGhlIHNwZWNpYWwgKFNXMSkgaXMgYXZhaWxhYmxlIGFsc28gZm9yIGh1Z2UKPj4g
cGFnZSB0YWJsZSBlbnRyaWVzIG9uIHg4NiBBRkFJQ1QsIGFsdGhvdWdoIGp1c3Qgbm90IGltcGxl
bWVudGVkLgo+PiBPdGhlcndpc2UgdGhlIFNXIGJpdHMgYXBwZWFyIGNvbXBsZXRlbHkgdXNlZCB1
cC4KPiBBbHRob3VnaCB0aGUgX1BBR0VfQklUX1NPRlRXKiBiaXRzIGFyZSB1c2VkIHVwLCB0aGVy
ZSdzIHBsZW50eSBvZiByb29tCj4gaW4gdGhlIGhhcmR3YXJlIFBURXMuICBCaXRzIDUyLT41OCBh
cmUgc29mdHdhcmUtYXZhaWxhYmxlLCBhbmQgd2UncmUKPiBvbmx5IHVzaW5nIDU4IGF0IHRoZSBt
b21lbnQuCj4KPiBXZSBhbHNvIGhhdmUgbm90IGJlZW4gY2FyZWZ1bCBhdCAqYWxsKiBhYm91dCBo
b3cgX1BBR0VfQklUX1NPRlRXKiBhcmUKPiB1c2VkLiAgSXQncyBxdWl0ZSBwb3NzaWJsZSB3ZSBj
YW4gZW5jb2RlIGFub3RoZXIgdXNlIGV2ZW4gaW4gdGhlCj4gZXhpc3RpbmcgYml0cy4KPgo+IFBl
cnNvbmFsbHksIEknZCBqdXN0IHRyeToKPgo+ICNkZWZpbmUgX1BBR0VfQklUX1NPRlRXNSAgICAg
ICAgNTcgICAgICAvKiBhdmFpbGFibGUgZm9yIHByb2dyYW1tZXIgKi8KPgpPSywgSSdsbCBmb2xs
b3cgeW91ciBhZHZpc2UgaGVyZS4gRldJVyBJIGdyZXBwZWQgZm9yIFNXMSBhbmQgaXQgc2VlbXMg
CnVzZWQgaW4gYSBzZWxmdGVzdCwgYnV0IG9ubHkgZm9yIFBURXMgQUZBSUNULgoKT2gsIGFuZCB3
ZSBkb24ndCBjYXJlIGFib3V0IDMyLWJpdCBtdWNoIGFueW1vcmU/CgovVGhvbWFzCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
