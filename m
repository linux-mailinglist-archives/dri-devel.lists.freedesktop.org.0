Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC9046203
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 17:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1B8892A0;
	Fri, 14 Jun 2019 15:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7C56892A0;
 Fri, 14 Jun 2019 15:05:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E8F2344;
 Fri, 14 Jun 2019 08:05:37 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B1F93F246;
 Fri, 14 Jun 2019 08:05:34 -0700 (PDT)
Subject: Re: [PATCH 16/16] dma-mapping: use exact allocation in
 dma_alloc_contiguous
To: 'Christoph Hellwig' <hch@lst.de>, David Laight <David.Laight@ACULAB.COM>
References: <20190614134726.3827-1-hch@lst.de>
 <20190614134726.3827-17-hch@lst.de>
 <a90cf7ec5f1c4166b53c40e06d4d832a@AcuMS.aculab.com>
 <20190614145001.GB9088@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <4113cd5f-5c13-e9c7-bc5e-dcf0b60e7054@arm.com>
Date: Fri, 14 Jun 2019 16:05:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190614145001.GB9088@lst.de>
Content-Language: en-GB
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Intel Linux Wireless <linuxwifi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Ian Abbott <abbotti@mev.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDYvMjAxOSAxNTo1MCwgJ0NocmlzdG9waCBIZWxsd2lnJyB3cm90ZToKPiBPbiBGcmks
IEp1biAxNCwgMjAxOSBhdCAwMjoxNTo0NFBNICswMDAwLCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4+
IERvZXMgdGhpcyBzdGlsbCBndWFyYW50ZWUgdGhhdCByZXF1ZXN0cyBmb3IgMTZrIHdpbGwgbm90
IGNyb3NzIGEgMTZrIGJvdW5kYXJ5Pwo+PiBJdCBsb29rcyBsaWtlIHlvdSBhcmUgbG9zaW5nIHRo
ZSBhbGlnbm1lbnQgcGFyYW1ldGVyLgo+IAo+IFRoZSBETUEgQVBJIG5ldmVyIGdhdmUgeW91IGFs
aWdubWVudCBndWFyYW50ZWVzIHRvIHN0YXJ0IHdpdGgsCj4gYW5kIHlvdSBjYW4gZ2V0IG5vdCBu
YXR1cmFsbHkgYWxpZ25lZCBtZW1vcnkgZnJvbSBtYW55IG9mIG91cgo+IGN1cnJlbnQgaW1wbGVt
ZW50YXRpb25zLgoKV2VsbCwgYXBhcnQgZnJvbSB0aGUgYml0IGluIERNQS1BUEktSE9XVE8gd2hp
Y2ggaGFzIHNhaWQgdGhpcyBzaW5jZSAKZm9yZXZlciAod2VsbCwgYmVmb3JlIEdpdCBoaXN0b3J5
LCBhdCBsZWFzdCk6CgoiVGhlIENQVSB2aXJ0dWFsIGFkZHJlc3MgYW5kIHRoZSBETUEgYWRkcmVz
cyBhcmUgYm90aApndWFyYW50ZWVkIHRvIGJlIGFsaWduZWQgdG8gdGhlIHNtYWxsZXN0IFBBR0Vf
U0laRSBvcmRlciB3aGljaAppcyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gdGhlIHJlcXVlc3Rl
ZCBzaXplLiAgVGhpcyBpbnZhcmlhbnQKZXhpc3RzIChmb3IgZXhhbXBsZSkgdG8gZ3VhcmFudGVl
IHRoYXQgaWYgeW91IGFsbG9jYXRlIGEgY2h1bmsKd2hpY2ggaXMgc21hbGxlciB0aGFuIG9yIGVx
dWFsIHRvIDY0IGtpbG9ieXRlcywgdGhlIGV4dGVudCBvZiB0aGUKYnVmZmVyIHlvdSByZWNlaXZl
IHdpbGwgbm90IGNyb3NzIGEgNjRLIGJvdW5kYXJ5LiIKClRoYXQgc2FpZCwgSSBkb24ndCBiZWxp
ZXZlIHRoaXMgcGFydGljdWxhciBwYXRjaCBzaG91bGQgbWFrZSBhbnkgCmFwcHJlY2lhYmxlIGRp
ZmZlcmVuY2UgLSBhbGxvY19wYWdlc19leGFjdCgpIGlzIHN0aWxsIGdvaW5nIHRvIGdpdmUgYmFj
ayAKdGhlIHNhbWUgYmFzZSBhZGRyZXNzIGFzIHRoZSByb3VuZGVkIHVwIG92ZXItYWxsb2NhdGlv
biB3b3VsZCwgYW5kIApQQUdFX0FMSUdOKClpbmcgdGhlIHNpemUgcGFzc2VkIHRvIGdldF9vcmRl
cigpIGFscmVhZHkgc2VlbWVkIHRvIGJlIApwb2ludGxlc3MuCgpSb2Jpbi4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
