Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD463465EA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EED6E920;
	Tue, 23 Mar 2021 17:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA35A6E920
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 17:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id EF5CD3FF00;
 Tue, 23 Mar 2021 18:06:57 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=OIPzPWVW; 
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
 with ESMTP id 4vXE_RuP9_af; Tue, 23 Mar 2021 18:06:57 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 58FE63FEFF;
 Tue, 23 Mar 2021 18:06:56 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7C82636062E;
 Tue, 23 Mar 2021 18:06:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616519216; bh=9C1/LIiOMgsGwjfQyFQT7VzzQnBpGQRxEf4hDMfEMQI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OIPzPWVW/hOP84Aexusd08oV1ihkh2Q54GfQNCXWiaAmRUTIhMp6sprBTnzrN7WOq
 U8mSrmSG9//Y9cwdRAkmFH0vAilzHWB9jL1OrKJ+oM59wTCCCbWCgbsnko/zZACsSM
 dgSvTW/IU3jgcflSVkFOj8Iq++820R6HVr1m/+ws=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <YFnST5VLcEgv9q+s@phenom.ffwll.local>
 <314fc020-d243-dbf0-acb3-ecfcc9c2443c@shipmail.org>
 <20210323163715.GJ2356281@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <5824b731-ca6a-92fd-e314-d986b6a7b101@shipmail.org>
Date: Tue, 23 Mar 2021 18:06:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323163715.GJ2356281@nvidia.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjMvMjEgNTozNyBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFR1ZSwgTWFy
IDIzLCAyMDIxIGF0IDA1OjM0OjUxUE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
d3JvdGU6Cj4KPj4+PiBAQCAtMjEwLDYgKzIxMSwyMCBAQCBzdGF0aWMgdm1fZmF1bHRfdCB0dG1f
Ym9fdm1faW5zZXJ0X2h1Z2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCj4+Pj4gICAgCWlmICgocGZu
ICYgKGZhdWx0X3BhZ2Vfc2l6ZSAtIDEpKSAhPSAwKQo+Pj4+ICAgIAkJZ290byBvdXRfZmFsbGJh
Y2s7Cj4+Pj4gKwkvKgo+Pj4+ICsJICogSHVnZSBlbnRyaWVzIG11c3QgYmUgc3BlY2lhbCwgdGhh
dCBpcyBtYXJraW5nIHRoZW0gYXMgZGV2bWFwCj4+Pj4gKwkgKiB3aXRoIG5vIGJhY2tpbmcgZGV2
aWNlIG1hcCByYW5nZS4gSWYgdGhlcmUgaXMgYSBiYWNraW5nCj4+Pj4gKwkgKiByYW5nZSwgRG9u
J3QgaW5zZXJ0IGEgaHVnZSBlbnRyeS4KPj4+PiArCSAqIElmIHRoaXMgY2hlY2sgdHVybnMgb3V0
IHRvIGJlIHRvbyBtdWNoIG9mIGEgcGVyZm9ybWFuY2UgaGl0LAo+Pj4+ICsJICogd2UgY2FuIGlu
c3RlYWQgaGF2ZSBkcml2ZXJzIGluZGljYXRlIHdoZXRoZXIgdGhleSBtYXkgaGF2ZQo+Pj4+ICsJ
ICogYmFja2luZyBkZXZpY2UgbWFwIHJhbmdlcyBhbmQgaWYgbm90LCBza2lwIHRoaXMgbG9va3Vw
Lgo+Pj4+ICsJICovCj4+PiBJIHRoaW5rIHdlIGNhbiBkbyB0aGlzIHN0YXRpY2FsbHk6Cj4+PiAt
IGlmIGl0J3Mgc3lzdGVtIG1lbW9yeSB3ZSBrbm93IHRoZXJlJ3Mgbm8gZGV2bWFwIGZvciBpdCwg
YW5kIHdlIGRvIHRoZQo+Pj4gICAgIHRyaWNrIHRvIGJsb2NrIGd1cF9mYXN0Cj4+IFllcywgdGhh
dCBzaG91bGQgd29yay4KPj4+IC0gaWYgaXQncyBpb21lbSwgd2Uga25vdyBndXBfZmFzdCB3b250
IHdvcmsgYW55d2F5IGlmIGRvbid0IHNldCBQRk5fREVWLAo+Pj4gICAgIHNvIG1pZ2h0IGFzIHdl
bGwgbm90IGRvIHRoYXQKPj4gSSB0aGluayBndXBfZmFzdCB3aWxsIHVuZm9ydHVuYXRlbHkgbWlz
dGFrZSBhIGh1Z2UgaW9tZW0gcGFnZSBmb3IgYW4KPj4gb3JkaW5hcnkgcGFnZSBhbmQgdHJ5IHRv
IGFjY2VzcyBhIG5vbi1leGlzdGFudCBzdHJ1Y3QgcGFnZSBmb3IgaXQsIHVubGVzcyB3ZQo+PiBk
byB0aGUgZGV2bWFwIHRyaWNrLgo+Pgo+PiBBbmQgdGhlIGxvb2t1cCB3b3VsZCB0aGVuIGJlIGZv
ciB0aGUgcmFyZSBjYXNlIHdoZXJlIGEgZHJpdmVyIHdvdWxkIGhhdmUKPj4gYWxyZWFkeSByZWdp
c3RlcmVkIGEgZGV2X3BhZ2VtYXAgZm9yIGFuIGlvbWVtIGFyZWEgd2hpY2ggbWF5IGFsc28gYmUg
bWFwcGVkCj4+IHRocm91Z2ggVFRNIChsaWtlIHRoZSBwYXRjaCBmcm9tIEZlbGl4IGEgY291cGxl
IG9mIHdlZWtzIGFnbykuIElmIGEgZHJpdmVyCj4+IGNhbiBwcm9taXNlIG5vdCB0byBkbyB0aGF0
LCB0aGVuIHdlIGNhbiBzYWZlbHkgcmVtb3ZlIHRoZSBsb29rdXAuCj4gSXNuJ3QgdGhlIGRldm1h
cCBQVEUgZmxhZyBhcmNoIG9wdGlvbmFsPyBEb2VzIHRoaXMgZmFsbCBiYWNrIHRvIG5vdAo+IHVz
aW5nIGh1Z2UgcGFnZXMgb24gYXJjaGVzIHRoYXQgZG9uJ3Qgc3VwcG9ydCBpdD8KCkdvb2QgcG9p
bnQuIE5vLCBjdXJyZW50bHkgaXQncyBvbmx5IGNvbmRpdGlvbmVkIG9uIHRyYW5zaHVnZSBwYWdl
IHN1cHBvcnQuCk5lZWQgdG8gY29uZGl0aW9uIGl0IG9uIGFsc28gZGV2bWFwIHN1cHBvcnQuCgo+
Cj4gQWxzbywgSSBmZWVsIGxpa2UgdGhpcyBjb2RlIHRvIGluc3RhbGwgInB0ZV9zcGVjaWFsIiBo
dWdlIHBhZ2VzIGRvZXMKPiBub3QgYmVsb25nIGluIHRoZSBkcm0gc3Vic3lzdGVtLi4KCkkgY291
bGQgYWRkIGhlbHBlcnMgaW4gaHVnZV9tZW1vcnkuYzoKCnZtZl9pbnNlcnRfcGZuX3BtZF9wcm90
X3NwZWNpYWwoKSBhbmQKdm1mX2luc2VydF9wZm5fcHVkX3Byb3Rfc3BlY2lhbCgpCgovVGhvbWFz
Cgo+Cj4gSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
