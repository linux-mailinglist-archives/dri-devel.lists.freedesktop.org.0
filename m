Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E362D93F1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3AB6E0DB;
	Mon, 14 Dec 2020 08:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E126ECA3;
 Fri, 11 Dec 2020 21:27:45 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607722064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RPMMCIZpTkbwn/vpPbbWIvtIfsdUJZbFWGvj4XBXX/8=;
 b=Kc/FVw++R6e2tySXtGXcjxUCfxzjuTQFTglr5qIAHuhSnqpTp+Ikj+7Hq7mXQTlJIhQso1
 GzueGJq666vDoGnyl7z+R0hqgzUE1QvEz7r/C1zoUW/uJEMWoH29CdDJSk0WUoP2avCyFO
 CRX7sZOyAR4dgW8urx4t099te3vzsLBebYBFzSZHvt/ir/v+j+DUtH3KLF65BJZt70WJkw
 AE4vdTRQhanAKvsPxu5Ss601VFRMIT6sTuiXwTfT17QUlJMwNoTmBl7avya6WCOOi1pn/V
 ZDVRxzcxQEEpw+Wd6+ymYN074dQBF+mj2DWvKS0m9PZ0lY8tuhofO6ggRZ9GJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607722064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RPMMCIZpTkbwn/vpPbbWIvtIfsdUJZbFWGvj4XBXX/8=;
 b=tFwThmGQdDL1Ql7epJregGVf1InSk/8mJJwiaGupYZNmlO1tti86n4xUB3jqi7xZFrdYET
 SNdr5SpWVlT7QnDA==
To: boris.ostrovsky@oracle.com, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch 27/30] xen/events: Only force affinity mask for percpu
 interrupts
In-Reply-To: <9806692f-24a3-4b6f-ae55-86bd66481271@oracle.com>
References: <20201210192536.118432146@linutronix.de>
 <20201210194045.250321315@linutronix.de>
 <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com>
 <2164a0ce-0e0d-c7dc-ac97-87c8f384ad82@suse.com>
 <871rfwiknd.fsf@nanos.tec.linutronix.de>
 <9806692f-24a3-4b6f-ae55-86bd66481271@oracle.com>
Date: Fri, 11 Dec 2020 22:27:43 +0100
Message-ID: <877dpoghio.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:40 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Will Deacon <will@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-s390@vger.kernel.org,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Heiko Carstens <hca@linux.ibm.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-gpio@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 intel-gfx@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgMTEgMjAyMCBhdCAwOToyOSwgYm9yaXMgb3N0cm92c2t5IHdyb3RlOgoKPiBP
biAxMi8xMS8yMCA3OjM3IEFNLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+IE9uIEZyaSwgRGVj
IDExIDIwMjAgYXQgMTM6MTAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+PiBPbiAxMS4xMi4yMCAw
MDoyMCwgYm9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20gd3JvdGU6Cj4+Pj4gT24gMTIvMTAvMjAg
MjoyNiBQTSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+Pj4+PiBDaGFuZ2UgdGhlIGltcGxlbWVu
dGF0aW9uIHNvIHRoYXQgdGhlIGNoYW5uZWwgaXMgYm91bmQgdG8gQ1BVMCBhdCB0aGUgWEVOCj4+
Pj4+IGxldmVsIGFuZCBsZWF2ZSB0aGUgYWZmaW5pdHkgbWFzayBhbG9uZS4gQXQgc3RhcnR1cCBv
ZiB0aGUgaW50ZXJydXB0Cj4+Pj4+IGFmZmluaXR5IHdpbGwgYmUgYXNzaWduZWQgb3V0IG9mIHRo
ZSBhZmZpbml0eSBtYXNrIGFuZCB0aGUgWEVOIGJpbmRpbmcgd2lsbAo+Pj4+PiBiZSB1cGRhdGVk
Lgo+Pj4+Cj4+Pj4gSWYgdGhhdCdzIHRoZSBjYXNlIHRoZW4gSSB3b25kZXIgd2hldGhlciB3ZSBu
ZWVkIHRoaXMgY2FsbCBhdCBhbGwgYW5kIGluc3RlYWQgYmluZCBhdCBzdGFydHVwIHRpbWUuCj4+
PiBBZnRlciBzb21lIGRpc2N1c3Npb24gd2l0aCBUaG9tYXMgb24gSVJDIGFuZCB4ZW4tZGV2ZWwg
YXJjaGFlb2xvZ3kgdGhlCj4+PiByZXN1bHQgaXM6IHRoaXMgd2lsbCBiZSBuZWVkZWQgZXNwZWNp
YWxseSBmb3Igc3lzdGVtcyBydW5uaW5nIG9uIGEKPj4+IHNpbmdsZSB2Y3B1IChlLmcuIHNtYWxs
IGd1ZXN0cyksIGFzIHRoZSAuaXJxX3NldF9hZmZpbml0eSgpIGNhbGxiYWNrCj4+PiB3b24ndCBi
ZSBjYWxsZWQgaW4gdGhpcyBjYXNlIHdoZW4gc3RhcnRpbmcgdGhlIGlycS4KPgo+IE9uIFVQIGFy
ZSB3ZSBub3QgdGhlbiBnb2luZyB0byBlbmQgdXAgd2l0aCBhbiBlbXB0eSBhZmZpbml0eSBtYXNr
PyBPcgo+IGFyZSB3ZSBndWFyYW50ZWVkIHRvIGhhdmUgaXQgc2V0IHRvIDEgYnkgaW50ZXJydXB0
IGdlbmVyaWMgY29kZT8KCkFuIFVQIGtlcm5lbCBkb2VzIG5vdCBldmVyIGxvb2sgb24gdGhlIGFm
ZmluaXR5IG1hc2suIFRoZQpjaGlwOjppcnFfc2V0X2FmZmluaXR5KCkgY2FsbGJhY2sgaXMgbm90
IGludm9rZWQgc28gdGhlIG1hc2sgaXMKaXJyZWxldmFudC4KCkEgU01QIGtlcm5lbCBvbiBhIFVQ
IG1hY2hpbmUgc2V0cyBDUFUwIGluIHRoZSBtYXNrIHNvIGFsbCBpcyBnb29kLgoKPiBUaGlzIGlz
IGFjdHVhbGx5IHdoeSBJIGJyb3VnaHQgdGhpcyB1cCBpbiB0aGUgZmlyc3QgcGxhY2UgLS0tIGEK
PiBwb3RlbnRpYWwgbWlzbWF0Y2ggYmV0d2VlbiB0aGUgYWZmaW5pdHkgbWFzayBhbmQgWGVuLXNw
ZWNpZmljIGRhdGEKPiAoZS5nLiBpbmZvLT5jcHUgYW5kIHRoZW4gcHJvdG9jb2wtc3BlY2lmaWMg
ZGF0YSBpbiBldmVudCBjaGFubmVsCj4gY29kZSkuIEV2ZW4gaWYgdGhleSBhcmUgcmUtc3luY2hy
b25pemVkIGxhdGVyLCBhdCBzdGFydHVwIHRpbWUgKGZvcgo+IFNNUCkuCgpXaGljaCBpcyBub3Qg
YSBwcm9ibGVtIGVpdGhlci4gVGhlIGFmZmluaXR5IG1hc2sgaXMgb25seSByZWxldmFudCBmb3IK
c2V0dGluZyB0aGUgYWZmaW5pdHksIGJ1dCBpdCdzIG5vdCByZWxldmFudCBmb3IgZGVsaXZlcnkg
YW5kIG5ldmVyIGNhbgpiZS4KCj4gSSBkb24ndCBzZWUgYW55dGhpbmcgdGhhdCB3b3VsZCBjYXVz
ZSBhIHByb2JsZW0gcmlnaHQgbm93IGJ1dCBJIHdvcnJ5Cj4gdGhhdCB0aGlzIGluY29uc2lzdGVu
Y3kgbWF5IGNvbWUgdXAgYXQgc29tZSBwb2ludC4KCkFzIGxvbmcgYXMgdGhlIGFmZmluaXR5IG1h
c2sgYmVjb21lcyBub3QgcGFydCBvZiB0aGUgZXZlbnQgY2hhbm5lbCBtYWdpYwp0aGlzIHNob3Vs
ZCBuZXZlciBtYXR0ZXIuCgpMb29rIGF0IGl0IGZyb20gaGFyZHdhcmU6CgppbnRlcnJ1cHQgaXMg
YWZmaW5lIHRvIENQVTAKCiAgICAgQ1BVMCBydW5zOgogICAgIAogICAgIHNldF9hZmZpbml0eShD
UFUwIC0+IENQVTEpCiAgICAgICAgbG9jYWxfaXJxX2Rpc2FibGUoKQogICAgICAgIAogLS0+IGlu
dGVycnVwdCBpcyByYWlzZWQgaW4gaGFyZHdhcmUgYW5kIHBlbmRpbmcgb24gQ1BVMAoKICAgICAg
ICBpcnEgaGFyZHdhcmUgaXMgcmVjb25maWd1cmVkIHRvIGJlIGFmZmluZSB0byBDUFUxCgogICAg
ICAgIGxvY2FsX2lycV9lbmFibGUoKQoKIC0tPiBpbnRlcnJ1cHQgaXMgaGFuZGxlZCBvbiBDUFUw
Cgp0aGUgbmV4dCBpbnRlcnJ1cHQgd2lsbCBiZSByYWlzZWQgb24gQ1BVMQoKU28gaW5mby0+Y3B1
IHdoaWNoIGlzIHJlZ2lzdGVyZWQgdmlhIHRoZSBoeXBlcmNhbGwgYmluZHMgdGhlICdoYXJkd2Fy
ZQpkZWxpdmVyeScgYW5kIHdoZW5ldmVyIHRoZSBuZXcgYWZmaW5pdHkgaXMgd3JpdHRlbiBpdCBp
cyByZWJvdW5kIHRvIHNvbWUKb3RoZXIgQ1BVIGFuZCB0aGUgbmV4dCBpbnRlcnJ1cHQgaXMgdGhl
biByYWlzZWQgb24gdGhpcyBvdGhlciBDUFUuCgpJdCdzIG5vdCBhbnkgZGlmZmVyZW50IGZyb20g
dGhlIGhhcmR3YXJlIGV4YW1wbGUgYXQgbGVhc3Qgbm90IGFzIGZhciBhcwpJIHVuZGVyc3Rvb2Qg
dGhlIGNvZGUuCgpUaGFua3MsCgogICAgICAgIHRnbHgKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
