Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F24F1349222
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 13:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0445E6EB5A;
	Thu, 25 Mar 2021 12:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE666EB5A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 12:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id F1DC33F6BE;
 Thu, 25 Mar 2021 13:36:41 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=gD78SScH; 
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
 with ESMTP id 3veBufnIduPG; Thu, 25 Mar 2021 13:36:40 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 7512A3F2E2;
 Thu, 25 Mar 2021 13:36:39 +0100 (CET)
Received: from [10.249.254.165] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1EC303600A8;
 Thu, 25 Mar 2021 13:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616675798; bh=nuPktcMhKejdFp1Z/65E+GhLl3FbivLnSEFyMbRaI34=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gD78SScHSDRZD6sZd6WmUqUYAPn6X5Tt4UXq1JrQzfL49ycTmMGvRTXvfvvPj7mUU
 F+3wIzfxWZJzfC0zV1G88pkACeP50q6Zj1axpvO/rYFy0U6cOMzSd9hhqsmO3bZpjq
 B8A4geR/ERcWYbNnKqxN1dPfXAmjDKyct20ex0ao=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
 <20210324163812.GJ2356281@nvidia.com>
 <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
 <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
 <20210324231419.GR2356281@nvidia.com>
 <607ecbeb-e8a5-66e9-6fe2-9a8d22f12bc2@shipmail.org>
 <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
 <20210325113023.GT2356281@nvidia.com>
 <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
 <20210325120103.GV2356281@nvidia.com>
 <a0d0ffd7-3c34-5002-f4fe-cb9d4ba0279e@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <d8c5b688-ede1-b952-1bc9-f2aae870a7a6@shipmail.org>
Date: Thu, 25 Mar 2021 13:36:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a0d0ffd7-3c34-5002-f4fe-cb9d4ba0279e@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjUvMjEgMTowOSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyNS4wMy4y
MSB1bSAxMzowMSBzY2hyaWViIEphc29uIEd1bnRob3JwZToKPj4gT24gVGh1LCBNYXIgMjUsIDIw
MjEgYXQgMTI6NTM6MTVQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSAKPj4gd3Jv
dGU6Cj4+Cj4+PiBOb3BlLiBUaGUgcG9pbnQgaGVyZSB3YXMgdGhhdCBpbiB0aGlzIGNhc2UsIHRv
IG1ha2Ugc3VyZSBtbWFwIHVzZXMgdGhlCj4+PiBjb3JyZWN0IFZBIHRvIGdpdmUgdXMgYSByZWFz
b25hYmxlIGNoYW5jZSBvZiBhbGlnbmVtZW50LCB0aGUgZHJpdmVyIAo+Pj4gbWlnaHQKPj4+IG5l
ZWQgdG8gYmUgYXdhcmUgb2YgYW5kIGRvIHRyaWNrZXJ5IHdpdGggdGhlIGh1Z2UgcGFnZS10YWJs
ZS1lbnRyeSAKPj4+IHNpemVzCj4+PiBhbnl3YXksIGFsdGhvdWdoIEkgdGhpbmsgaW4gbW9zdCBj
YXNlcyBhIHN0YW5kYXJkIGhlbHBlciBmb3IgdGhpcyAKPj4+IGNhbiBiZQo+Pj4gc3VwcGxpZWQu
Cj4+IE9mIGNvdXJzZSB0aGUgZHJpdmVyIG5lZWRzIHNvbWUgd2F5IHRvIGluZmx1ZW5jZSB0aGUg
VkEgbW1hcCB1c2VzLAo+PiBnZXJuYWxseSBpdCBzaG91bGQgYWxpZ24gdG8gdGhlIG5hdHVyYWwg
cGFnZSBzaXplIG9mIHRoZSBkZXZpY2UKPgo+IFdlbGwgYSBtbWFwKCkgbmVlZHMgdG8gYmUgYWxp
Z25lZCB0byB0aGUgcGFnZSBzaXplIG9mIHRoZSBDUFUsIGJ1dCBub3QgCj4gbmVjZXNzYXJpbHkg
dG8gdGhlIG9uZSBvZiB0aGUgZGV2aWNlLgo+Cj4gU28gSSdtIHByZXR0eSBzdXJlIHRoZSBkZXZp
Y2UgZHJpdmVyIHNob3VsZCBub3QgYmUgaW52b2x2ZWQgaW4gYW55IHdheSAKPiB0aGUgY2hvb3Np
bmcgb2YgdGhlIFZBIGZvciB0aGUgQ1BVIG1hcHBpbmcuCj4KPiBDaHJpc3RpYW4uCj4KV2UndmUg
aGFkIHRoaXMgZGlzY3Vzc2lvbiBiZWZvcmUgYW5kIGF0IHRoYXQgdGltZSBJIG1hbmFnZWQgdG8g
Y29udmluY2UgCnlvdSBieSBwb2ludGluZyB0byB0aGUgc2htZW0gaGVscGVyIGZvciB0aGlzLCBz
aG1lbV9nZXRfdW1hcHBlZF9hcmVhKCkuCgpCYXNpY2FsbHkgdGhlcmUgYXJlIHR3byB3YXlzIHRv
IGRvIHRoaXMuIEVpdGhlciB1c2UgYSBzdGFuZGFyZCBoZWxwZXIgCnNpbWlsYXIgdG8gc2htZW0n
cywgYW5kIHRoZW4gdGhlIGRyaXZlciBuZWVkcyB0byBhbGlnbiBwaHlzaWNhbCAoZGV2aWNlKSAK
aHVnZSBwYWdlIGJvdW5kYXJpZXMgdG8gYWRkcmVzcyBzcGFjZSBvZmZzZXQgaHVnZSBwYWdlIGJv
dW5kYXJpZXMuIElmIAp5b3UgZG9uJ3QgZG8gdGhhdCB5b3UgY2FuIGp1c3QgYXMgd2VsbCB1c2Ug
YSBjdXN0b20gZnVuY3Rpb24gdGhhdCAKYWRqdXN0cyBmb3IgeW91IG5vdCBkb2luZyB0aGF0IChk
cm1fZ2V0X3VubWFwcGVkX2FyZWEoKSkuIEJvdGggcmVxdWlyZSAKZHJpdmVyIGtub3dsZWRnZSBv
ZiB0aGUgc2l6ZSBvZiBodWdlIHBhZ2VzLgoKV2l0aG91dCBhIGZ1bmN0aW9uIHRvIGFkanVzdCwg
bW1hcCB3aWxsIHVzZSBpdCdzIGRlZmF1bHQgKDE2IGJ5dGU/KSAKYWxpZ25tZW50IGFuZCBjaGFu
Y2Ugb2YgYWxpZ25tZW50IGJlY29tZXMgdmVyeSBzbWFsbC4KCi9UaG9tYXMKCgo+Pgo+PiBKYXNv
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
