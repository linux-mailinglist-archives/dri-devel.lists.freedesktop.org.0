Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E101F33C641
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 20:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AAF6E12C;
	Mon, 15 Mar 2021 19:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147D96E12C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 19:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id EBF453F9B4;
 Mon, 15 Mar 2021 20:00:32 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=miHVmOVB; 
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
 with ESMTP id dIlg2Ygl72rG; Mon, 15 Mar 2021 20:00:32 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E657C3F8D7;
 Mon, 15 Mar 2021 20:00:30 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A6FC7360311;
 Mon, 15 Mar 2021 20:00:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1615834830; bh=4X77uW7s5ngotX3+q73FMTgEeoYzwmq3VQ/XEO4Q4fc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=miHVmOVBDYuUBWq+BgudJvct+GjHCGVZJupSRf1wLBF+xIwAb5TPbv2SrNJ49TkUB
 MBIt8feKfuTFB4QqgV/A9kgHl2OHUQ+mZ42qKWZKpkLgwA8zET8x9M1oDfS1+Cr7Fe
 FEZ6bC/AZb4OyXw/uRpyd4yD6bATqoTc04GHxzhg=
Subject: Re: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210312093810.2202-1-christian.koenig@amd.com>
 <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
 <15996529-b536-28aa-644c-c57e67788c97@gmail.com>
 <cbe846bc-4b1f-fc6c-52a5-b84505a5b748@shipmail.org>
 <daafc050-33ca-90b9-0caa-c59397707291@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <6654281b-5fb4-5d5f-779e-677cc2d54bb9@shipmail.org>
Date: Mon, 15 Mar 2021 20:00:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <daafc050-33ca-90b9-0caa-c59397707291@gmail.com>
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

Ck9uIDMvMTUvMjEgNzo0NyBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPgo+Cj4gQW0gMTUu
MDMuMjEgdW0gMTg6MDggc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpOgo+Pgo+PiBP
biAzLzE1LzIxIDExOjI2IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4KPj4+Cj4+PiBB
bSAxMy4wMy4yMSB1bSAxOToyOSBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCk6Cj4+
Pj4gSGksIENocmlzdGlhbgo+Pj4+Cj4+Pj4gT24gMy8xMi8yMSAxMDozOCBBTSwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToKPj4+Pj4gV2Ugc2VlbSB0byBoYXZlIHNvbWUgbW9yZSBkcml2ZXIgYnVn
cyB0aGFuIHRob3VnaHQuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IMKgIGluY2x1ZGUv
ZHJtL3R0bS90dG1fYm9fYXBpLmggfCA2ICsrKystLQo+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAKPj4+Pj4gYi9pbmNsdWRlL2RybS90dG0vdHRt
X2JvX2FwaS5oCj4+Pj4+IGluZGV4IDRmYjUyM2RmYWIzMi4uZGY5ZmU1OTZlN2M1IDEwMDY0NAo+
Pj4+PiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4+Pj4+ICsrKyBiL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPj4+Pj4gQEAgLTYwMyw5ICs2MDMsMTEgQEAgc3RhdGlj
IGlubGluZSB2b2lkIHR0bV9ib19waW4oc3RydWN0IAo+Pj4+PiB0dG1fYnVmZmVyX29iamVjdCAq
Ym8pCj4+Pj4+IMKgIHN0YXRpYyBpbmxpbmUgdm9pZCB0dG1fYm9fdW5waW4oc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibykKPj4+Pj4gwqAgewo+Pj4+PiDCoMKgwqDCoMKgIGRtYV9yZXN2X2Fz
c2VydF9oZWxkKGJvLT5iYXNlLnJlc3YpOwo+Pj4+PiAtwqDCoMKgIFdBUk5fT05fT05DRSghYm8t
PnBpbl9jb3VudCk7Cj4+Pj4+IMKgwqDCoMKgwqAgV0FSTl9PTl9PTkNFKCFrcmVmX3JlYWQoJmJv
LT5rcmVmKSk7Cj4+Pj4+IC3CoMKgwqAgLS1iby0+cGluX2NvdW50Owo+Pj4+PiArwqDCoMKgIGlm
IChiby0+cGluX2NvdW50KQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLS1iby0+cGluX2NvdW50Owo+
Pj4+PiArwqDCoMKgIGVsc2UKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIFdBUk5fT05fT05DRSh0cnVl
KTsKPj4+Pj4gwqAgfQo+Pj4+PiDCoCDCoCBpbnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3Qg
dHRtX2RldmljZSAqYmRldiwKPj4+Pgo+Pj4+IFNpbmNlIEkgbm93IGhhdmUgYmVlbiBzdGFyaW5n
IGZvciBoYWxmIGEgeWVhciBhdCB0aGUgY29kZSBvZiB0aGUgCj4+Pj4gZHJpdmVyIHRoYXQgbWFk
ZSBwaW5uaW5nIGFuIGFydCwgSSBoYXZlIGEgY291cGxlIG9mIHN1Z2dlc3Rpb25zIAo+Pj4+IGhl
cmUsIENvdWxkIHdlIHVzZSBhbiBhdG9taWMgZm9yIHBpbl9jb3VudCwgYWxsb3dpbmcgdW5sb2Nr
ZWQgCj4+Pj4gdW5waW5uaW5nIGJ1dCByZXF1aXJlIHRoZSBsb2NrIG9ubHkgZm9yIHBpbl9jb3Vu
dCB0cmFuc2l0aW9uIDAtPjEsIAo+Pj4+IChidXQgdW5sb2NrZWQgZm9yIHBpbl9pZl9hbHJlYWR5
X3Bpbm5lZCkuIEluIHBhcnRpY3VsYXIgSSB0aGluayAKPj4+PiB2bXdnZnggd291bGQgYmVuZWZp
dCBmcm9tIHVubG9ja2VkIHVucGlucy4gQWxzbyBpZiB0aGUgYXRvbWljIHdlcmUgCj4+Pj4gYSBy
ZWZjb3VudF90LCB0aGF0IHdvdWxkIHByb2JhYmx5IGdpdmUgeW91IHRoZSBhYm92ZSBiZWhhdmlv
dXI/Cj4+Pgo+Pj4gTm9wZSwgSSd2ZSBjb25zaWRlcmVkIHRoaXMgYXMgd2VsbCB3aGlsZSBtb3Zp
bmcgdGhlIHBpbiBjb3VudCBpbnRvIFRUTS4KPj4+Cj4+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IHlv
dSBub3Qgb25seSBuZWVkIHRoZSBCTyByZXNlcnZlZCBmb3IgMC0+MSAKPj4+IHRyYW5zaXRpb25z
LCBidXQgYWxzbyBmb3IgMS0+MCB0cmFuc2l0aW9ucyB0byBtb3ZlIHRoZSBCTyBvbiB0aGUgTFJV
IAo+Pj4gY29ycmVjdGx5Lgo+Pgo+PiBBaCwgYW5kIHRoZXJlIGlzIG5vIHdheSB0byBoYXZlIHVz
IGtub3cgdGhlIGNvcnJlY3QgTFJVIGxpc3Qgd2l0aG91dCAKPj4gcmVzZXJ2YXRpb24/Cj4KPiBO
b3QgcmVhbGx5LCB0aGVyZSBpcyBhbHdheXMgdGhlIGNoYW5jZSB0aGF0IENQVSBBIGlzIHJlZHVj
aW5nIHRoZSAKPiBjb3VudCBmcm9tIDEtPjAgd2hpbGUgQ1BVIEIgaXMgZG9pbmcgMC0+MSBhbmQg
eW91IGVuZCB1cCB3aXRoIGEgTFJVIAo+IHN0YXR1cyB3aGljaCBkb2Vzbid0IG1hdGNoIHRoZSBw
aW4gY291bnQuCj4KPiBXZSBjb3VsZCB0cnkgdG8gZG8gc29tZXRoaW5nIGxpa2UgYSBsb29wIHVw
ZGF0aW5nIHRoZSBMUlUgc3RhdHVzIHVudGlsIAo+IGl0IG1hdGNoZXMgdGhlIHBpbiBjb3VudCwg
YnV0IHRoZSBpbXBsaWNhdGlvbnMgb2YgdGhhdCBhcmUgdXN1YWxseSAKPiByZWFsbHkgbmFzdHku
Cj4KT0ssIHllYWggSSB3YXMgbW9yZSB0aGlua2luZyBhbG9uZyB0aGUgbGluZXMgb2YgcHJvdGVj
dGluZyB0aGUgTFJVIApzdGF0dXMgd2l0aCB0aGUgZ2xvYmFsIGxydSBsb2NrIGFuZCB1bnBpbiB3
b3VsZCB0aGVuIGJlCgppZiAocmVmY291bnRfZGVjX2FuZF9sb2NrKCZiby0+cGluX2NvdW50LCAm
dHRtX2dsb2IubHJ1X2xvY2spKSB7CiDCoMKgwqAgYWRkX3RvX3JlbGV2YW50X2xydXMoYm8sIGJv
LT5scnVfc3RhdHVzKTsKIMKgwqDCoCBzcGluX3VubG9jaygmdHRtX2dsb2IubHJ1X2xvY2spOwp9
CgpCdXQgbG9va2luZyBhdCB0dG1fYm9fbW92ZV90b19scnVfdGFpbCgpIEkgcmVhbGl6ZSB0aGF0
J3Mgbm90IHJlYWxseSAKdHJpdmlhbCBhbnltb3JlLiBJIGhvcGUgaXQncyBkb2FibGUgYXQgc29t
ZSBwb2ludCB0aG91Z2guCgpCdXQgbWVhbndoaWxlLCBwZXJoYXBzIFRUTSBuZWVkcyB0byBhY2Nl
cHQgYW5kIHBhdmUgb3ZlciB0aGF0IGRyaXZlcnMgCmFyZSBpbiBmYWN0IGRlc3Ryb3lpbmcgcGlu
bmVkIGJ1ZmZlcnM/CgovVGhvbWFzCgoKCgoKPiBDaHJpc3RpYW4uCj4KPj4KPj4gL1Rob21hcwo+
Pgo+Pgo+Pj4KPj4+IENocmlzdGlhbi4KPj4+Cj4+Pj4KPj4+PiAvVGhvbWFzCj4+Pj4KPj4+Pgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
