Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6156633C372
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 18:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A6789AC2;
	Mon, 15 Mar 2021 17:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1A789A1F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 17:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 2D4FF3F8C8;
 Mon, 15 Mar 2021 18:07:58 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=BNur24od; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvz8nQ2MtEve; Mon, 15 Mar 2021 18:07:57 +0100 (CET)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id D970D3F603;
 Mon, 15 Mar 2021 18:07:56 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 05A8D360311;
 Mon, 15 Mar 2021 18:08:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1615828086; bh=ny/B6y6Zt+joblI8lE2vQ4DZMh+NxzMLj/Bs1TPP9U0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=BNur24odZCOSt0zq01XUK7KDAyTO8fLeKDqWyGI6Ld7xedGRdrKHuWoThignKaMWF
 rjMf+v9aEJGaACJ7zViaGjoi2ztUOa5XMeo6RMqV0xZfVdTuldAC+8UwcAHOnlCHV5
 k4vK5WPEcyJsPmBBOb/I+GA9xLhPCxOVzMYocfwA=
Subject: Re: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210312093810.2202-1-christian.koenig@amd.com>
 <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
 <15996529-b536-28aa-644c-c57e67788c97@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <cbe846bc-4b1f-fc6c-52a5-b84505a5b748@shipmail.org>
Date: Mon, 15 Mar 2021 18:08:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <15996529-b536-28aa-644c-c57e67788c97@gmail.com>
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

Ck9uIDMvMTUvMjEgMTE6MjYgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4KPgo+IEFtIDEz
LjAzLjIxIHVtIDE5OjI5IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKToKPj4gSGks
IENocmlzdGlhbgo+Pgo+PiBPbiAzLzEyLzIxIDEwOjM4IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+Pj4gV2Ugc2VlbSB0byBoYXZlIHNvbWUgbW9yZSBkcml2ZXIgYnVncyB0aGFuIHRob3Vn
aHQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+Pj4gLS0tCj4+PiDCoCBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5o
IHwgNiArKysrLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBp
LmggCj4+PiBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPj4+IGluZGV4IDRmYjUyM2Rm
YWIzMi4uZGY5ZmU1OTZlN2M1IDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19hcGkuaAo+Pj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+Pj4gQEAgLTYw
Myw5ICs2MDMsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHR0bV9ib19waW4oc3RydWN0IAo+Pj4g
dHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+Pj4gwqAgc3RhdGljIGlubGluZSB2b2lkIHR0bV9ib191
bnBpbihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDC
oCBkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFzZS5yZXN2KTsKPj4+IC3CoMKgwqAgV0FSTl9P
Tl9PTkNFKCFiby0+cGluX2NvdW50KTsKPj4+IMKgwqDCoMKgwqAgV0FSTl9PTl9PTkNFKCFrcmVm
X3JlYWQoJmJvLT5rcmVmKSk7Cj4+PiAtwqDCoMKgIC0tYm8tPnBpbl9jb3VudDsKPj4+ICvCoMKg
wqAgaWYgKGJvLT5waW5fY291bnQpCj4+PiArwqDCoMKgwqDCoMKgwqAgLS1iby0+cGluX2NvdW50
Owo+Pj4gK8KgwqDCoCBlbHNlCj4+PiArwqDCoMKgwqDCoMKgwqAgV0FSTl9PTl9PTkNFKHRydWUp
Owo+Pj4gwqAgfQo+Pj4gwqAgwqAgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3RydWN0IHR0bV9k
ZXZpY2UgKmJkZXYsCj4+Cj4+IFNpbmNlIEkgbm93IGhhdmUgYmVlbiBzdGFyaW5nIGZvciBoYWxm
IGEgeWVhciBhdCB0aGUgY29kZSBvZiB0aGUgCj4+IGRyaXZlciB0aGF0IG1hZGUgcGlubmluZyBh
biBhcnQsIEkgaGF2ZSBhIGNvdXBsZSBvZiBzdWdnZXN0aW9ucyBoZXJlLCAKPj4gQ291bGQgd2Ug
dXNlIGFuIGF0b21pYyBmb3IgcGluX2NvdW50LCBhbGxvd2luZyB1bmxvY2tlZCB1bnBpbm5pbmcg
YnV0IAo+PiByZXF1aXJlIHRoZSBsb2NrIG9ubHkgZm9yIHBpbl9jb3VudCB0cmFuc2l0aW9uIDAt
PjEsIChidXQgdW5sb2NrZWQgCj4+IGZvciBwaW5faWZfYWxyZWFkeV9waW5uZWQpLiBJbiBwYXJ0
aWN1bGFyIEkgdGhpbmsgdm13Z2Z4IHdvdWxkIAo+PiBiZW5lZml0IGZyb20gdW5sb2NrZWQgdW5w
aW5zLiBBbHNvIGlmIHRoZSBhdG9taWMgd2VyZSBhIHJlZmNvdW50X3QsIAo+PiB0aGF0IHdvdWxk
IHByb2JhYmx5IGdpdmUgeW91IHRoZSBhYm92ZSBiZWhhdmlvdXI/Cj4KPiBOb3BlLCBJJ3ZlIGNv
bnNpZGVyZWQgdGhpcyBhcyB3ZWxsIHdoaWxlIG1vdmluZyB0aGUgcGluIGNvdW50IGludG8gVFRN
Lgo+Cj4gVGhlIHByb2JsZW0gaXMgdGhhdCB5b3Ugbm90IG9ubHkgbmVlZCB0aGUgQk8gcmVzZXJ2
ZWQgZm9yIDAtPjEgCj4gdHJhbnNpdGlvbnMsIGJ1dCBhbHNvIGZvciAxLT4wIHRyYW5zaXRpb25z
IHRvIG1vdmUgdGhlIEJPIG9uIHRoZSBMUlUgCj4gY29ycmVjdGx5LgoKQWgsIGFuZCB0aGVyZSBp
cyBubyB3YXkgdG8gaGF2ZSB1cyBrbm93IHRoZSBjb3JyZWN0IExSVSBsaXN0IHdpdGhvdXQgCnJl
c2VydmF0aW9uPwoKL1Rob21hcwoKCj4KPiBDaHJpc3RpYW4uCj4KPj4KPj4gL1Rob21hcwo+Pgo+
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
