Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63B346A5F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 21:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AFC6E88F;
	Tue, 23 Mar 2021 20:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C616E88F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 77B923F8A2;
 Tue, 23 Mar 2021 21:42:24 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=sPJS18NN; 
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
 with ESMTP id LggnGvMgF1Sj; Tue, 23 Mar 2021 21:42:23 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 175623F700;
 Tue, 23 Mar 2021 21:42:21 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.198.151.43])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D723836062E;
 Tue, 23 Mar 2021 21:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616532141; bh=iPJ77EGHgOIrO9GhucTb28ntff/+vJnaRdy9R+OY4lo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sPJS18NN29rFWkVlri0remQJEnGvAMc5uNaAzOG+2DZyFbsbL6HT+f7bKV/53yxK4
 WnheLIuBVVbHA0XdXpkcfyDzrml2Z5u1SRDpR8+LtCmOWIm3FfzrkjBRAo2JodoDPC
 6eScF9gFQYOGN4xc1NDIGF120IZ74jlJsnN5mh2M=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: "Williams, Dan J" <dan.j.williams@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <ec99146c7abc35d16b245816aba3e9d14862e624.camel@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <c2239da2-c514-2c88-c671-918909cdba6b@shipmail.org>
Date: Tue, 23 Mar 2021 21:42:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ec99146c7abc35d16b245816aba3e9d14862e624.camel@intel.com>
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
Cc: "jgg@nvidia.com" <jgg@nvidia.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjMvMjEgODo1MiBQTSwgV2lsbGlhbXMsIERhbiBKIHdyb3RlOgo+IE9uIFN1biwgMjAy
MS0wMy0yMSBhdCAxOTo0NSArMDEwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSB3cm90ZToK
Pj4gVFRNIHNldHMgdXAgaHVnZSBwYWdlLXRhYmxlLWVudHJpZXMgYm90aCB0byBzeXN0ZW0tIGFu
ZCBkZXZpY2UKPj4gbWVtb3J5LAo+PiBhbmQgd2UgZG9uJ3Qgd2FudCBndXAgdG8gYXNzdW1lIHRo
ZXJlIGFyZSBhbHdheXMgdmFsaWQgYmFja2luZyBzdHJ1Y3QKPj4gcGFnZXMgZm9yIHRoZXNlLiBG
b3IgUFRFcyB0aGlzIGlzIGhhbmRsZWQgYnkgc2V0dGluZyB0aGUgcHRlX3NwZWNpYWwKPj4gYml0
LAo+PiBidXQgZm9yIHRoZSBodWdlIFBVRHMgYW5kIFBNRHMsIHdlIGhhdmUgbmVpdGhlciBwbWRf
c3BlY2lhbCBub3IKPj4gcHVkX3NwZWNpYWwuIE5vcm1hbGx5LCBodWdlIFRUTSBlbnRyaWVzIGFy
ZSBpZGVudGlmaWVkIGJ5IGxvb2tpbmcgYXQKPj4gdm1hX2lzX3NwZWNpYWxfaHVnZSgpLCBidXQg
ZmFzdCBndXAgY2FuJ3QgZG8gdGhhdCwgc28gYXMgYW4KPj4gYWx0ZXJuYXRpdmUKPj4gZGVmaW5l
IF9kZXZtYXAgZW50cmllcyBmb3Igd2hpY2ggdGhlcmUgYXJlIG5vIGJhY2tpbmcgZGV2X3BhZ2Vt
YXAgYXMKPj4gc3BlY2lhbCwgdXBkYXRlIGRvY3VtZW50YXRpb24gYW5kIG1ha2UgaHVnZSBUVE0g
ZW50cmllcyBfZGV2bWFwLAo+PiBhZnRlcgo+PiB2ZXJpZnlpbmcgdGhhdCB0aGVyZSBpcyBubyBi
YWNraW5nIGRldl9wYWdlbWFwLgo+IFBsZWFzZSBkbyBub3QgYWJ1c2UgcHttLHV9ZF9kZXZtYXAg
bGlrZSB0aGlzLiBJJ20gaW4gdGhlIHByb2Nlc3Mgb2YKPiByZW1vdmluZyBnZXRfZGV2cGFnZW1h
cCgpIGZyb20gdGhlIGd1cC1mYXN0IHBhdGggWzFdLiBJbnN0ZWFkIHRoZXJlCj4gc2hvdWxkIGJl
IHNwYWNlIGZvciBwe20sdX1kX3NwZWNpYWwgaW4gdGhlIHBhZ2UgdGFibGUgZW50cmllcyAoYXQg
bGVhc3QKPiBmb3IgeDg2LTY0KS4gU28gdGhlIGZpeCBpcyB0byByZW1vdmUgdGhhdCBvbGQgYXNz
dW1wdGlvbiB0aGF0IGh1Z2UKPiBwYWdlcyBjYW4gbmV2ZXIgYmUgc3BlY2lhbC4KPgo+IFsxXToK
PiBodHRwOi8vbG9yZS5rZXJuZWwub3JnL3IvMTYxNjA0MDUwODY2LjE0NjM3NDIuNzc1OTUyMTUx
MDM4MzU1MTA1NS5zdGdpdEBkd2lsbGlhMi1kZXNrMy5hbXIuY29ycC5pbnRlbC5jb20KPgpIbW0s
IHllcyB3aXRoIHRoYXQgcGF0Y2ggaXQgd2lsbCBvYnZpb3VzbHkgbm90IHdvcmsgYXMgaW50ZW5k
ZWQuCgpHaXZlbiB0aGF0LCBJIHRoaW5rIHdlJ2xsIG5lZWQgdG8gZGlzYWJsZSB0aGUgVFRNIGh1
Z2UgcGFnZXMgZm9yIG5vdyAKdW50aWwgd2UgY2FuIHNvcnQgb3V0IGFuZCBhZ3JlZSBvbiB1c2lu
ZyBhIHBhZ2UgdGFibGUgZW50cnkgYml0LgoKVGhhbmtzLAoKL1Rob21hcwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
