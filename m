Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6E633727D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 13:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499126EC31;
	Thu, 11 Mar 2021 12:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE3F6EC2F;
 Thu, 11 Mar 2021 12:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2F9E041653;
 Thu, 11 Mar 2021 13:24:56 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="IU0b+gs1";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xe7DiJsaVjtQ; Thu, 11 Mar 2021 13:24:52 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 0FF273F39B;
 Thu, 11 Mar 2021 13:24:50 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7130E360133;
 Thu, 11 Mar 2021 13:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1615465490; bh=J4GFvQsApCHbaF8LRAPlj2yQA+rhQWbfccw18gipJUo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IU0b+gs1hPAzwHsf85mewmcQOy0WEwqO3qLGWOV3Y5WuiOzOB4H0PQ5VP1TBxFDiU
 WsbexFUj5rw3/qhc5QsPh25G67ryBt/xx4PRuGkvSlpmN27qq/+Nc7i6+KS5dH9OxI
 s1Y2xjddekjYEc58oXWpqqoaNm5O5zEKQR0SQM4g=
Subject: Re: [PATCH 17/35] drm/amdkfd: register HMM device private zone
To: Felix Kuehling <felix.kuehling@amd.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <20210107030127.20393-18-Felix.Kuehling@amd.com>
 <CAKMK7uEd9KZAmeNd9Z9GF9p0yUButHc+8_PERRuNR79+uqAhbQ@mail.gmail.com>
 <7f837938-3ad8-6ecf-d2b7-952b177cffb8@shipmail.org>
 <db2d652b-8a6e-d38f-8c08-2ac3a070f4be@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <cd34e4cb-9cc5-8526-bd17-cf7591c756d8@shipmail.org>
Date: Thu, 11 Mar 2021 13:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <db2d652b-8a6e-d38f-8c08-2ac3a070f4be@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvNC8yMSA2OjU4IFBNLCBGZWxpeCBLdWVobGluZyB3cm90ZToKPiBBbSAyMDIxLTAzLTAx
IHVtIDM6NDYgYS5tLiBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCk6Cj4+IE9uIDMv
MS8yMSA5OjMyIEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4gT24gV2VkLCBKYW4gMDYsIDIw
MjEgYXQgMTA6MDE6MDlQTSAtMDUwMCwgRmVsaXggS3VlaGxpbmcgd3JvdGU6Cj4+Pj4gRnJvbTog
UGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Cj4+Pj4KPj4+PiBSZWdpc3RlciB2cmFt
IG1lbW9yeSBhcyBNRU1PUllfREVWSUNFX1BSSVZBVEUgdHlwZSByZXNvdXJjZSwgdG8KPj4+PiBh
bGxvY2F0ZSB2cmFtIGJhY2tpbmcgcGFnZXMgZm9yIHBhZ2UgbWlncmF0aW9uLgo+Pj4+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+PiBT
byBtYXliZSBJJ20gZ2V0dGluZyB0aGlzIGFsbCB3cm9uZywgYnV0IEkgdGhpbmsgdGhhdCB0aGUg
Y3VycmVudCB0dG0KPj4+IGZhdWx0IGNvZGUgcmVsaWVzIG9uIGRldm1hcCBwdGUgZW50cmllcyAo
ZXNwZWNpYWxseSBmb3IgaHVnZXB0ZSBlbnRyaWVzKQo+Pj4gdG8gc3RvcCBnZXRfdXNlcl9wYWdl
cy4gQnV0IHRoaXMgb25seSB3b3JrcyBpZiB0aGUgcHRlIGhhcHBlbnMgdG8gbm90Cj4+PiBwb2lu
dCBhdCBhIHJhbmdlIHdpdGggZGV2bWFwIHBhZ2VzLgo+PiBJIGRvbid0IHRoaW5rIHRoYXQncyBp
biBUVE0geWV0LCBidXQgdGhlIHByb3Bvc2VkIGZpeCwgeWVzIChzZWUgZW1haWwKPj4gSSBqdXN0
IHNlbnQgaW4gYW5vdGhlciB0aHJlYWQpLAo+PiBidXQgb25seSBmb3IgaHVnZSBwdGVzLgo+Pgo+
Pj4gVGhpcyBwYXRjaCBoZXJlIGNoYW5nZXMgdGhhdCwgYW5kIHNvIHByb2JhYmx5IGJyZWFrcyB0
aGlzIGRldm1hcCBwdGUKPj4+IGhhY2sKPj4+IHR0bSBpcyB1c2luZz8KPj4+Cj4+PiBJZiBJJ20g
bm90IHdyb25nIGhlcmUgdGhlbiBJIHRoaW5rIHdlIG5lZWQgdG8gZmlyc3QgZml4IHVwIHRoZSB0
dG0KPj4+IGNvZGUgdG8KPj4+IG5vdCB1c2UgdGhlIGRldm1hcCBoYWNrIGFueW1vcmUsIGJlZm9y
ZSBhIHR0bSBiYXNlZCBkcml2ZXIgY2FuCj4+PiByZWdpc3RlciBhCj4+PiBkZXZfcGFnZW1hcC4g
QWxzbyBhZGRpbmcgVGhvbWFzIHNpbmNlIHRoYXQganVzdCBjYW1lIHVwIGluIGFub3RoZXIKPj4+
IGRpc2N1c3Npb24uCj4+IEl0IGRvZXNuJ3QgYnJlYWsgdGhlIHR0bSBkZXZtYXAgaGFjayBwZXIg
c2UsIGJ1dCBpdCBpbmRlZWQgYWxsb3dzIGd1cAo+PiB0byB0aGUgcmFuZ2UgcmVnaXN0ZXJlZCwg
YnV0IGhlcmUncyB3aGVyZSBteSBsYWNrIG9mIHVuZGVyc3RhbmRpbmcgd2h5Cj4+IHdlIGNhbid0
IGFsbG93IGd1cC1pbmcgVFRNIHB0ZXMgaWYgdGhlcmUgaW5kZWVkIGlzIGEgYmFja2luZwo+PiBz
dHJ1Y3QtcGFnZT8gQmVjYXVzZSByZWdpc3RlcmluZyBNRU1PUllfREVWSUNFX1BSSVZBVEUgaW1w
bGllcyB0aGF0LAo+PiByaWdodD8KPiBJIHdhc24ndCBhd2FyZSB0aGF0IFRUTSB1c2VkIGRldm1h
cCBhdCBhbGwuIElmIGl0IGRvZXMsIHdoYXQgdHlwZSBvZgo+IG1lbW9yeSBkb2VzIGl0IHVzZT8K
Pgo+IE1FTU9SWV9ERVZJQ0VfUFJJVkFURSBpcyBsaWtlIHN3YXBwZWQgb3V0IG1lbW9yeS4gSXQg
Y2Fubm90IGJlIG1hcHBlZCBpbgo+IHRoZSBDUFUgcGFnZSB0YWJsZS4gR1VQIHdvdWxkIGNhdXNl
IGEgcGFnZSBmYXVsdCB0byBzd2FwIGl0IGJhY2sgaW50bwo+IHN5c3RlbSBtZW1vcnkuIFdlIGFy
ZSBsb29raW5nIGludG8gdXNlIE1FTU9SWV9ERVZJQ0VfR0VORVJJQyBmb3IgYQo+IGZ1dHVyZSBj
b2hlcmVudCBtZW1vcnkgYXJjaGl0ZWN0dXJlLCB3aGVyZSBkZXZpY2UgbWVtb3J5IGNhbiBiZQo+
IGNvaGVyZW50bHkgYWNjZXNzZWQgYnkgdGhlIENQVSBhbmQgR1BVLgo+Cj4gQXMgSSB1bmRlcnN0
YW5kIGl0LCBvdXIgREVWSUNFX1BSSVZBVEUgcmVnaXN0cmF0aW9uIGlzIG5vdCB0aWVkIHRvIGFu
Cj4gYWN0dWFsIHBoeXNpY2FsIGFkZHJlc3MuIFRodXMgeW91ciBkZXZtYXAgcmVnaXN0cmF0aW9u
IGFuZCBvdXIgZGV2bWFwCj4gcmVnaXN0cmF0aW9uIGNvdWxkIHByb2JhYmx5IGNvZXhpc3Qgd2l0
aG91dCBhbnkgY29uZmxpY3QuIFlvdSdsbCBqdXN0Cj4gaGF2ZSB0aGUgb3ZlcmhlYWQgb2YgdHdv
IHNldHMgb2Ygc3RydWN0IHBhZ2VzIGZvciB0aGUgc2FtZSBtZW1vcnkuCj4KPiBSZWdhcmRzLAo+
ICDCoCBGZWxpeAoKSGksIEZlbGl4LiBUVE0gZG9lc24ndCB1c2UgZGV2bWFwIHlldCwgYnV0IHRo
aW5raW5nIG9mIHVzaW5nIGl0IGZvciAKZmFraW5nIHBtZF9zcGVjaWFsKCkgd2hpY2ggaXNuJ3Qg
YXZhaWxhYmxlLiBUaGF0IHdvdWxkIG1lYW4gcG1kX2Rldm1hcCgpIAorIG5vX3JlZ2lzdGVyZWRf
ZGV2X3BhZ2VtYXAgbWVhbmluZyBzcGVjaWFsIGluIHRoZSBzZW5zZSBkb2N1bWVudGVkIGJ5IAp2
bV9ub3JtYWxfcGFnZSgpLiBUaGUgaW1wbGljYXRpb24gaGVyZSB3b3VsZCBiZSB0aGF0IGlmIHlv
dSByZWdpc3RlciAKbWVtb3J5IGxpa2UgYWJvdmUsIFRUTSB3b3VsZCBuZXZlciBiZSBhYmxlIHRv
IHNldCB1cCBhIGh1Z2UgcGFnZSB0YWJsZSAKZW50cnkgdG8gaXQuIEJ1dCBpdCBzb3VuZHMgbGlr
ZSB0aGF0J3Mgbm90IGFuIGlzc3VlPwoKL1Rob21hcwoKPgo+PiAvVGhvbWFzCj4+Cj4+PiAtRGFu
aWVsCj4+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
