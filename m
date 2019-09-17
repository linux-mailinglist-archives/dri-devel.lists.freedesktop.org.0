Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23EBB4F61
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 15:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185BF6EC7D;
	Tue, 17 Sep 2019 13:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983426EC7D;
 Tue, 17 Sep 2019 13:36:46 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBE97206C2;
 Tue, 17 Sep 2019 13:36:40 +0000 (UTC)
Date: Tue, 17 Sep 2019 14:36:37 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v3 0/2] iommu: handle drivers that manage iommu directly
Message-ID: <20190917133637.urqphz5drzmugern@willie-the-truck>
References: <20190906214409.26677-1-robdclark@gmail.com>
 <c43de10f-7768-592c-0fd8-6fb64b3fd43e@arm.com>
 <CAF6AEGv5WtwOuUE-+koL3SxuoXxcT5n=EooD7G_4YRh34HFTwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGv5WtwOuUE-+koL3SxuoXxcT5n=EooD7G_4YRh34HFTwQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568727406;
 bh=Ql3S5LeLxQu05wGmhaTM95fv1AHLxdIM1bfELOE4N7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sar6QHXnAAyU7CqcX6S4XEMZKCw1XqlFh7JOPCZcEm7NSSw7o9n4M4YTyIEluCTr+
 PlHd+kmgg4Vr/dK3w6I2fdh2OfNlJWZ1RrBSnCix074v+q0zWCpWT1ivxI6TO8Oge1
 wto9mDPRvI0UPcufLj8FL+blmnWYDbjxJUHoo8rI=
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Clark <robdclark@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bruce Wang <bzwang@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Allison Randal <allison@lohutok.net>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMTA6MTA6NDlBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFR1ZSwgU2VwIDEwLCAyMDE5IGF0IDk6MzQgQU0gUm9iaW4gTXVycGh5IDxyb2Jpbi5t
dXJwaHlAYXJtLmNvbT4gd3JvdGU6Cj4gPiBPbiAwNi8wOS8yMDE5IDIyOjQ0LCBSb2IgQ2xhcmsg
d3JvdGU6Cj4gPiA+IE5PVEUgdGhhdCBpbiBkaXNjdXNzaW9uIG9mIHByZXZpb3VzIHJldmlzaW9u
cywgUk1SUiBjYW1lIHVwLiAgVGhpcyBpcwo+ID4gPiBub3QgcmVhbGx5IGEgcmVwbGFjZW1lbnQg
Zm9yIFJNUlIgKG5vciBkb2VzIFJNUlIgcmVhbGx5IHByb3ZpZGUgYW55Cj4gPiA+IG1vcmUgaW5m
b3JtYXRpb24gdGhhbiB3ZSBhbHJlYWR5IGdldCBmcm9tIEVGSSBHT1AsIG9yIERUIGluIHRoZQo+
ID4gPiBzaW1wbGVmYiBjYXNlKS4gIEkgYWxzbyBkb24ndCBzZWUgaG93IFJNUlIgY291bGQgaGVs
cCB3LyBTTU1VIGhhbmRvdmVyCj4gPiA+IG9mIENCL1NNUiBjb25maWcgKEJqb3JuJ3MgcGF0Y2hz
ZXRbMV0pIHdpdGhvdXQgZGVmaW5pbmcgbmV3IHRhYmxlcy4KPiA+Cj4gPiBUaGUgcG9pbnQgb2Yg
Uk1SUi1saWtlLXRoaW5ncyBpcyB0aGF0IHRoZXkgaWRlbnRpZnkgbm90IGp1c3QgdGhlIG1lbW9y
eQo+ID4gcmVnaW9uIGJ1dCBhbHNvIHRoZSBzcGVjaWZpYyBkZXZpY2UgYWNjZXNzaW5nIHRoZW0s
IHdoaWNoIG1lYW5zIHRoZQo+ID4gSU9NTVUgZHJpdmVyIGtub3dzIHVwLWZyb250IHdoaWNoIElE
cyBldGMuIGl0IG11c3QgYmUgY2FyZWZ1bCBub3QgdG8KPiA+IGRpc3J1cHQuIE9idmlvdXNseSBm
b3IgU01NVSB0aGF0ICp3b3VsZCogYmUgc29tZSBuZXcgdGFibGUgKGRlc2lnbmVkIHRvCj4gPiBl
bmNvbXBhc3MgZXZlcnl0aGluZyByZWxldmFudCkgc2luY2UgbGl0ZXJhbCBSTVJScyBhcmUgc3Bl
Y2lmaWNhbGx5IGFuCj4gPiBJbnRlbCBWVC1kIHRoaW5nLgo+IAo+IFBlcmhhcHMgSSdtIG5vdCBs
b29raW5nIGluIHRoZSByaWdodCBwbGFjZSwgYnV0IHRoZSBleHRlbnQgb2Ygd2hhdCBJCj4gY291
bGQgZmluZCBhYm91dCBSTVJSIHRhYmxlcyB3YXM6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL3Rp
YW5vY29yZS9lZGsyL2Jsb2IvbWFzdGVyL01kZVBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQv
RG1hUmVtYXBwaW5nUmVwb3J0aW5nVGFibGUuaCNMMTIyCj4gCj4gSSBjb3VsZG4ndCByZWFsbHkg
c2VlIGhvdyB0aGF0IHNwZWNpZmllcyB0aGUgZGV2aWNlLiAgQnV0IGVudGlyZWx5Cj4gcG9zc2li
bGUgdGhhdCBJJ20gbm90IHNlZWluZyB0aGUgd2hvbGUgcGljdHVyZS4KCkkgZG9uJ3QgdGhpbmsg
YW55Ym9keSB3YXMgcGxhbm5pbmcgdG8gaW1wbGVtZW50IFJNUlIgImFzLWlzIiBmb3IgYXJtNjQs
IHNvCnlvdSBtaWdodCBiZSBiZXR0ZXIgb2ZmIGxvb2tpbmcgYXQgdGhlIHByb3Bvc2FsIGZyb20g
VGhpZXJyeSwgYWx0aG91Z2ggaXQKaGFzIHNvbWUgaXNzdWVzIHRoYXQgYXJlIHN0aWxsIHRvIGJl
IHJlc29sdmVkOgoKaHR0cDovL2xrbWwua2VybmVsLm9yZy9yLzIwMTkwODI5MTExNDA3LjE3MTkx
LTEtdGhpZXJyeS5yZWRpbmdAZ21haWwuY29tCgpXaWxsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
