Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528835C739
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 15:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F6A6E3C6;
	Mon, 12 Apr 2021 13:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A6166E3C6;
 Mon, 12 Apr 2021 13:12:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFAFD1063;
 Mon, 12 Apr 2021 06:12:31 -0700 (PDT)
Received: from [10.57.58.164] (unknown [10.57.58.164])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FDDA3F73B;
 Mon, 12 Apr 2021 06:12:27 -0700 (PDT)
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
To: David Hildenbrand <david@redhat.com>, Arnd Bergmann <arnd@arndb.de>
References: <20210409112035.27221-1-david@redhat.com>
 <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
 <53ec94ac-ffe3-d0bc-d081-3489fa03daa1@redhat.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <34350446-0e0e-6947-40bd-fabdccdc835f@arm.com>
Date: Mon, 12 Apr 2021 14:12:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <53ec94ac-ffe3-d0bc-d081-3489fa03daa1@redhat.com>
Content-Language: en-GB
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Christoph Hellwig <hch@lst.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-MM <linux-mm@kvack.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wNC0wOSAxNDozOSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMDkuMDQu
MjEgMTU6MzUsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+IE9uIEZyaSwgQXByIDksIDIwMjEgYXQg
MToyMSBQTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gCj4+IHdyb3RlOgo+
Pj4KPj4+IFJhbmRvbSBkcml2ZXJzIHNob3VsZCBub3Qgb3ZlcnJpZGUgYSB1c2VyIGNvbmZpZ3Vy
YXRpb24gb2YgY29yZSBrbm9icwo+Pj4gKGUuZy4sIENPTkZJR19ETUFfQ01BPW4pLiBBcHBsaWNh
YmxlIGRyaXZlcnMgd291bGQgbGlrZSB0byB1c2UgRE1BX0NNQSwKPj4+IHdoaWNoIGRlcGVuZHMg
b24gQ01BLCBpZiBwb3NzaWJsZTsgaG93ZXZlciwgdGhlc2UgZHJpdmVycyBhbHNvIGhhdmUgdG8K
Pj4+IHRvbGVyYXRlIGlmIERNQV9DTUEgaXMgbm90IGF2YWlsYWJsZS9mdW5jdGlvbmluZywgZm9y
IGV4YW1wbGUsIGlmIG5vIENNQQo+Pj4gYXJlYSBmb3IgRE1BX0NNQSB1c2UgaGFzIGJlZW4gc2V0
dXAgdmlhICJjbWE9WCIuIEluIHRoZSB3b3JzdCBjYXNlLCB0aGUKPj4+IGRyaXZlciBjYW5ub3Qg
ZG8gaXQncyBqb2IgcHJvcGVybHkgaW4gc29tZSBjb25maWd1cmF0aW9ucy4KPj4+Cj4+PiBGb3Ig
ZXhhbXBsZSwgY29tbWl0IDYzZjU2Nzc1NDRiMyAoImRybS9ldG5hdml2OiBzZWxlY3QgQ01BIGFu
ZCAKPj4+IERNQV9DTUEgaWYKPj4+IGF2YWlsYWJsZSIpIGRvY3VtZW50cwo+Pj4gwqDCoMKgwqDC
oMKgwqDCoCBXaGlsZSB0aGlzIGlzIG5vIGJ1aWxkIGRlcGVuZGVuY3ksIGV0bmF2aXYgd2lsbCBv
bmx5IHdvcmsgCj4+PiBjb3JyZWN0bHkKPj4+IMKgwqDCoMKgwqDCoMKgwqAgb24gbW9zdCBzeXN0
ZW1zIGlmIENNQSBhbmQgRE1BX0NNQSBhcmUgZW5hYmxlZC4gU2VsZWN0IGJvdGggCj4+PiBvcHRp
b25zCj4+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIGF2YWlsYWJsZSB0byBhdm9pZCB1c2VycyBlbmRp
bmcgdXAgd2l0aCBhIG5vbi13b3JraW5nIEdQVSAKPj4+IGR1ZSB0bwo+Pj4gwqDCoMKgwqDCoMKg
wqDCoCBhIGxhY2tpbmcga2VybmVsIGNvbmZpZy4KPj4+IFNvIGV0bmF2aXYgcmVhbGx5IHdhbnRz
IHRvIGhhdmUgRE1BX0NNQSwgaG93ZXZlciwgY2FuIGRlYWwgd2l0aCBzb21lIAo+Pj4gY2FzZXMK
Pj4+IHdoZXJlIGl0IGlzIG5vdCBhdmFpbGFibGUuCj4+Pgo+Pj4gTGV0J3MgaW50cm9kdWNlIFdB
TlRfRE1BX0NNQSBhbmQgdXNlIGl0IGluIG1vc3QgY2FzZXMgd2hlcmUgZHJpdmVycwo+Pj4gc2Vs
ZWN0IENNQS9ETUFfQ01BLCBvciBkZXBlbmQgb24gRE1BX0NNQSAoaW4gYSB3cm9uZyB3YXkgdmlh
IENNQSBiZWNhdXNlCj4+PiBvZiByZWN1cnNpdmUgZGVwZW5kZW5jeSBpc3N1ZXMpLgo+Pj4KPj4+
IFdlJ2xsIGFzc3VtZSB0aGF0IGFueSBkcml2ZXIgdGhhdCBzZWxlY3RzIERSTV9HRU1fQ01BX0hF
TFBFUiBvcgo+Pj4gRFJNX0tNU19DTUFfSEVMUEVSIHdvdWxkIGxpa2UgdG8gdXNlIERNQV9DTUEg
aWYgcG9zc2libGUuCj4+Pgo+Pj4gV2l0aCB0aGlzIGNoYW5nZSwgZGlzdHJpYnV0aW9ucyBjYW4g
ZGlzYWJsZSBDT05GSUdfQ01BIG9yCj4+PiBDT05GSUdfRE1BX0NNQSwgd2l0aG91dCBpdCBzaWxl
bnRseSBnZXR0aW5nIGVuYWJsZWQgYWdhaW4gYnkgcmFuZG9tCj4+PiBkcml2ZXJzLiBBbHNvLCB3
ZSdsbCBub3cgYXV0b21hdGljYWxseSB0cnkgdG8gZW5hYmxlZCBib3RoLCBDT05GSUdfQ01BCj4+
PiBhbmQgQ09ORklHX0RNQV9DTUEgaWYgdGhleSBhcmUgdW5zcGVjaWZpZWQgYW5kIGFueSBkcml2
ZXIgaXMgYXJvdW5kIHRoYXQKPj4+IHNlbGVjdHMgV0FOVF9ETUFfQ01BIC0tIGFsc28gaW1wbGlj
aXRseSB2aWEgRFJNX0dFTV9DTUFfSEVMUEVSIG9yCj4+PiBEUk1fS01TX0NNQV9IRUxQRVIuCj4+
Pgo+Pj4gRm9yIGV4YW1wbGUsIGlmIGFueSBkcml2ZXIgc2VsZWN0cyBXQU5UX0RNQV9DTUEgYW5k
IHdlIGRvIGEKPj4+ICJtYWtlIG9sZGRlZmNvbmZpZyI6Cj4+Pgo+Pj4gMS4gV2l0aCAiIyBDT05G
SUdfQ01BIGlzIG5vdCBzZXQiIGFuZCBubyBzcGVjaWZpY2F0aW9uIG9mCj4+PiDCoMKgwqAgIkNP
TkZJR19ETUFfQ01BIgo+Pj4KPj4+IC0+IENPTkZJR19ETUFfQ01BIHdvbid0IGJlIHBhcnQgb2Yg
LmNvbmZpZwo+Pj4KPj4+IDIuIFdpdGggbm8gc3BlY2lmaWNhdGlvbiBvZiBDT05GSUdfQ01BIG9y
IENPTkZJR19ETUFfQ01BCj4+Pgo+Pj4gQ29udGlndW91cyBNZW1vcnkgQWxsb2NhdG9yIChDTUEp
IFtZL24vP10gKE5FVykKPj4+IERNQSBDb250aWd1b3VzIE1lbW9yeSBBbGxvY2F0b3IgKERNQV9D
TUEpIFtZL24vP10gKE5FVykKPj4+Cj4+PiAzLiBXaXRoICIjIENPTkZJR19DTUEgaXMgbm90IHNl
dCIgYW5kICIjIENPTkZJR19ETUFfQ01BIGlzIG5vdCBzZXQiCj4+Pgo+Pj4gLT4gQ09ORklHX0RN
QV9DTUEgd2lsbCBiZSByZW1vdmVkIGZyb20gLmNvbmZpZwo+Pj4KPj4+IE5vdGU6IGRyaXZlcnMv
cmVtb3RlcHJvYyBzZWVtcyB0byBiZSBzcGVjaWFsOyBjb21taXQgYzUxZTg4MmNkNzExCj4+PiAo
InJlbW90ZXByb2MvZGF2aW5jaTogVXBkYXRlIEtjb25maWcgdG8gZGVwZW5kIG9uIERNQV9DTUEi
KSBleHBsYWlucyAKPj4+IHRoYXQKPj4+IHRoZXJlIGlzIGEgcmVhbCBkZXBlbmRlbmN5IHRvIERN
QV9DTUEgZm9yIGl0IHRvIHdvcms7IGxlYXZlIHRoYXQgCj4+PiBkZXBlbmRlbmN5Cj4+PiBpbiBw
bGFjZSBhbmQgZG9uJ3QgY29udmVydCBpdCB0byBhIHNvZnQgZGVwZW5kZW5jeS4KPj4KPj4gSSBk
b24ndCB0aGluayB0aGlzIGRlcGVuZGVuY3kgaXMgZnVuZGFtZW50YWxseSBkaWZmZXJlbnQgZnJv
bSB0aGUgb3RoZXJzLAo+PiB0aG91Z2ggZGF2aW5jaSBtYWNoaW5lcyB0ZW5kIHRvIGhhdmUgbGVz
cyBtZW1vcnkgdGhhbiBhIGxvdCBvZiB0aGUKPj4gb3RoZXIgbWFjaGluZXMsIHNvIGl0J3MgbW9y
ZSBsaWtlbHkgdG8gZmFpbCB3aXRob3V0IENNQS4KPj4KPiAKPiBJIHdhcyBhbHNvIHVuc3VyZSAt
IGFuZCBMdWNhcyBoYWQgc2ltaWxhciB0aG91Z2h0cy4gSWYgeW91IHdhbnQsIEkgY2FuIAo+IHNl
bmQgYSB2NCBhbHNvIHRha2luZyBjYXJlIG9mIHRoaXMuCgpUQkggSSB0aGluayBpdCBzaG91bGQg
YWxsIGp1c3QgYmUgcmVtb3ZlZC4gRE1BX0NNQSBpcyBlZmZlY3RpdmVseSBhbiAKaW50ZXJuYWwg
ZmVhdHVyZSBvZiB0aGUgRE1BIEFQSSwgYW5kIGRyaXZlcnMgd2hpY2ggc2ltcGx5IHVzZSB0aGUg
RE1BIApBUEkgc2hvdWxkbid0IHJlYWxseSBiZSB0cnlpbmcgdG8gYXNzdW1lICpob3cqIHRoaW5n
cyBtaWdodCBiZSBhbGxvY2F0ZWQgCmF0IHJ1bnRpbWUgLSBDTUEgaXMgaGFyZGx5IHRoZSBvbmx5
IHdheS4gUGxhdGZvcm0tbGV2ZWwgYXNzdW1wdGlvbnMgCmFib3V0IHRoZSBwcmVzZW5jZSBvciBu
b3Qgb2YgSU9NTVVzLCBtZW1vcnkgY2FydmVvdXRzLCBldGMuLCBhbmQgd2hldGhlciAKaXQgZXZl
biBtYXR0ZXJzIC0gZS5nLiBhIGRldmljZSB3aXRoIGEgdGlueSBMQ0QgbWF5IG9ubHkgbmVlZCBk
aXNwbGF5IApidWZmZXJzIHdoaWNoIHN0aWxsIGZpdCBpbiBhIHJlZ3VsYXIgTUFYX09SREVSIGFs
bG9jYXRpb24gLSBjb3VsZCBnbyBpbiAKcGxhdGZvcm0tc3BlY2lmaWMgY29uZmlncywgYnV0IEkg
cmVhbGx5IGRvbid0IHRoaW5rIHRoZXkgYmVsb25nIGF0IHRoZSAKZ2VuZXJpYyBzdWJzeXN0ZW0g
bGV2ZWwuCgpXZSBhbHJlYWR5IGhhdmUgdmFyaW91cyBleGFtcGxlcyBsaWtlIEkyUyBkcml2ZXJz
IHRoYXQgd29uJ3QgZXZlbiBwcm9iZSAKd2l0aG91dCBhIGRtYWVuZ2luZSBwcm92aWRlciBiZWlu
ZyBwcmVzZW50LCBvciBob3N0IGNvbnRyb2xsZXIgZHJpdmVycyAKd2hpY2ggYXJlIHVzZWxlc3Mg
d2l0aG91dCB0aGVpciBjb3JyZXNwb25kaW5nIHBoeSBkcml2ZXIgKGFuZCBJJ20gCmd1ZXNzaW5n
IHlvdSBjYW4gcHJvYmFibHkgYWxzbyBkbyBoaWdoZXItbGV2ZWwgdGhpbmdzIGxpa2UgaW5jbHVk
ZSB0aGUgCmJsb2NrIGxheWVyIGJ1dCBvbWl0IGFsbCBmaWxlc3lzdGVtIGRyaXZlcnMpLiBJIGRv
bid0IGJlbGlldmUgaXQncyAKS2NvbmZpZydzIGpvYiB0byB0cnkgdG8gZ3Vlc3Mgd2hldGhlciBh
IGdpdmVuIGNvbmZpZ3VyYXRpb24gaXMgKnVzZWZ1bCosIApvbmx5IHRvIGVuZm9yY2UgdGhhdCdz
IGl0J3MgdmFsaWQgdG8gYnVpbGQuCgpSb2Jpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
