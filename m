Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B2933C3A7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 18:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB1F89F63;
	Mon, 15 Mar 2021 17:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017C789F63
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 17:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id B0F583F8DF;
 Mon, 15 Mar 2021 18:10:45 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=iWDdBoWh; 
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
 with ESMTP id VTJroVv4GaUo; Mon, 15 Mar 2021 18:10:44 +0100 (CET)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 721723F603;
 Mon, 15 Mar 2021 18:10:44 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A8426360311;
 Mon, 15 Mar 2021 18:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1615828253; bh=SV+V6vdmdUjwb02NxVEz5hd5WLzmAIzQiy5eJuT+paY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=iWDdBoWhh9Q4fL8PIs28eOOrakqQ+3qXWgkDVODQGMbdqL1mlcj0ofm1Se3O+xpvT
 WnIwxnJewHR92/w832SeXSj9vlVb7WJJy4L63LmTGNo+kC517LHCPBM6AQAv0sk9Wd
 2mFjdKuQ+kxBixMBMW0YiWm7g6BuIe+HHQ1p5Vbk=
Subject: Re: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210312093810.2202-1-christian.koenig@amd.com>
 <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
 <7976df00-d82f-6634-326a-e2bec86f7a08@suse.de>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <c7f00982-8c94-128a-57b2-db2c0f4bd45c@shipmail.org>
Date: Mon, 15 Mar 2021 18:10:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7976df00-d82f-6634-326a-e2bec86f7a08@suse.de>
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

Ck9uIDMvMTUvMjEgODo0OCBBTSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGkKPgo+IEFt
IDEzLjAzLjIxIHVtIDE5OjI5IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKToKPj4g
SGksIENocmlzdGlhbgo+Pgo+PiBPbiAzLzEyLzIxIDEwOjM4IEFNLCBDaHJpc3RpYW4gS8O2bmln
IHdyb3RlOgo+Pj4gV2Ugc2VlbSB0byBoYXZlIHNvbWUgbW9yZSBkcml2ZXIgYnVncyB0aGFuIHRo
b3VnaHQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgo+Pj4gLS0tCj4+PiDCoCBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2Fw
aS5oIHwgNiArKysrLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9f
YXBpLmggCj4+PiBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPj4+IGluZGV4IDRmYjUy
M2RmYWIzMi4uZGY5ZmU1OTZlN2M1IDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19hcGkuaAo+Pj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+Pj4gQEAg
LTYwMyw5ICs2MDMsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHR0bV9ib19waW4oc3RydWN0IAo+
Pj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+Pj4gwqAgc3RhdGljIGlubGluZSB2b2lkIHR0bV9i
b191bnBpbihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+Pj4gwqAgewo+Pj4gwqDCoMKg
wqDCoCBkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFzZS5yZXN2KTsKPj4+IC3CoMKgwqAgV0FS
Tl9PTl9PTkNFKCFiby0+cGluX2NvdW50KTsKPj4+IMKgwqDCoMKgwqAgV0FSTl9PTl9PTkNFKCFr
cmVmX3JlYWQoJmJvLT5rcmVmKSk7Cj4+PiAtwqDCoMKgIC0tYm8tPnBpbl9jb3VudDsKPj4+ICvC
oMKgwqAgaWYgKGJvLT5waW5fY291bnQpCj4+PiArwqDCoMKgwqDCoMKgwqAgLS1iby0+cGluX2Nv
dW50Owo+Pj4gK8KgwqDCoCBlbHNlCj4+PiArwqDCoMKgwqDCoMKgwqAgV0FSTl9PTl9PTkNFKHRy
dWUpOwo+Pj4gwqAgfQo+Pj4gwqAgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3RydWN0IHR0bV9k
ZXZpY2UgKmJkZXYsCj4+Cj4+IFNpbmNlIEkgbm93IGhhdmUgYmVlbiBzdGFyaW5nIGZvciBoYWxm
IGEgeWVhciBhdCB0aGUgY29kZSBvZiB0aGUgCj4+IGRyaXZlciB0aGF0IG1hZGUgcGlubmluZyBh
biBhcnQsIEkgaGF2ZSBhIGNvdXBsZSBvZiBzdWdnZXN0aW9ucyBoZXJlLCAKPj4gQ291bGQgd2Ug
dXNlIGFuIGF0b21pYyBmb3IgcGluX2NvdW50LCBhbGxvd2luZyB1bmxvY2tlZCB1bnBpbm5pbmcg
YnV0IAo+PiByZXF1aXJlIHRoZSBsb2NrIG9ubHkgZm9yIHBpbl9jb3VudCB0cmFuc2l0aW9uIDAt
PjEsIChidXQgdW5sb2NrZWQgCj4+IGZvciBwaW5faWZfYWxyZWFkeV9waW5uZWQpLiBJbiBwYXJ0
aWN1bGFyIEkgdGhpbmsgdm13Z2Z4IHdvdWxkIAo+PiBiZW5lZml0IGZyb20gdW5sb2NrZWQgdW5w
aW5zLiBBbHNvIGlmIHRoZSBhdG9taWMgd2VyZSBhIHJlZmNvdW50X3QsIAo+PiB0aGF0IHdvdWxk
IHByb2JhYmx5IGdpdmUgeW91IHRoZSBhYm92ZSBiZWhhdmlvdXI/Cj4KPiBXaGF0J3MgdGhlIGJl
bmVmaXQ/Cj4KPiBJJ20gYXNraW5nIGJlY2F1c2UsIHRoZXJlJ3MgYmVlbiB0YWxrIGFib3V0IHN0
cmVhbWxpbmluZyBhbGwgdGhlIEdFTSAKPiBsb2NraW5nIGFuZCBhY3R1YWxseSBhbGxvd2luZyBk
bWEtYnVmIHJlc3YgbG9ja2luZyBpbiBwaW4gYW5kIHZtYXAgCj4gb3BlcmF0aW9ucy4gQXRvbWlj
IG9wcyBtaWdodCBub3QgY29udHJhZGljdCB0aGlzLCBidXQgYWxzbyBtaWdodCBub3QgCj4gYmUg
dXNlZnVsIGluIHRoZSBsb25nIHRlcm0uCgpUaGUgYmVuZWZpdCB3b3VsZCBiZSB0aGF0IGF0IHVu
cGlubmluZyB0aW1lIGl0IG1pZ2h0IGJlIHRyaWNreSB0byB0YWtlIAp0aGUgcmVzZXJ2YXRpb24g
bG9jaywgYmVjYXVzZSB5b3UgbWlnaHQgYmUgYWxyZWFkeSBpbiBhIHd3IHRyYW5zYWN0aW9uLgoK
QnV0IENocmlzdGlhbiBwb2ludGVkIG91dCB0aGUgTFJVIGNvbXBsaWNhdGlvbnMuLi4KCi9UaG9t
YXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
