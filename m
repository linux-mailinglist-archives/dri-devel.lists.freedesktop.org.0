Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD382D93F5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD886E0F6;
	Mon, 14 Dec 2020 08:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4D06EDCC;
 Fri, 11 Dec 2020 12:37:12 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607690230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeKMIUUY7UN7nseclqb6capkWQKCLYLlFPvEsM/avAA=;
 b=3520JJ+cuub+0iUSOK2WXjhkvCbFqeJNnWTo2fJ47aLTUyErKzNfEkULJPsX3Qa7RkBVwA
 4q6jw5fcFuYyZr/ciqFHaAnQVfC1Alp3kCIzCyANWRIH5wkikSXOxsM9LH0a3lH+xiAa45
 f0/UcyAfqGDvjb7eJDdGBHj9hJNdTg1RDGpqvbSImr23oJWz9hqAB7upD/U8t27689mDeg
 F/Tz1FEjoqnkk1C0t4mKGVaykVWwH0Pu53ShxAoYAYxl3sBd5Q86Au5G3wKiLThho8mDJo
 PrspxrgGCxFQ2+rt5HHBAUWr3eImu1NL/lsNiVCRl0iT/SNo3u6jwsn7CYROBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607690230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeKMIUUY7UN7nseclqb6capkWQKCLYLlFPvEsM/avAA=;
 b=BclOyliY9++BXeKdFZCu5z1BEMLnNc8fqr8CcstXRZSRH4lrLjensrS/wg9nxh2q1FTvD5
 HDIGPJaNNIgQp/DQ==
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 boris.ostrovsky@oracle.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch 27/30] xen/events: Only force affinity mask for percpu
 interrupts
In-Reply-To: <2164a0ce-0e0d-c7dc-ac97-87c8f384ad82@suse.com>
References: <20201210192536.118432146@linutronix.de>
 <20201210194045.250321315@linutronix.de>
 <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com>
 <2164a0ce-0e0d-c7dc-ac97-87c8f384ad82@suse.com>
Date: Fri, 11 Dec 2020 13:37:10 +0100
Message-ID: <871rfwiknd.fsf@nanos.tec.linutronix.de>
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

T24gRnJpLCBEZWMgMTEgMjAyMCBhdCAxMzoxMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAx
MS4xMi4yMCAwMDoyMCwgYm9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20gd3JvdGU6Cj4+IAo+PiBP
biAxMi8xMC8yMCAyOjI2IFBNLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+PiBBbGwgZXZlbnQg
Y2hhbm5lbCBzZXR1cHMgYmluZCB0aGUgaW50ZXJydXB0IG9uIENQVTAgb3IgdGhlIHRhcmdldCBD
UFUgZm9yCj4+PiBwZXJjcHUgaW50ZXJydXB0cyBhbmQgb3ZlcndyaXRlIHRoZSBhZmZpbml0eSBt
YXNrIHdpdGggdGhlIGNvcnJlc3BvbmRpbmcKPj4+IGNwdW1hc2suIFRoYXQgZG9lcyBub3QgbWFr
ZSBzZW5zZS4KPj4+Cj4+PiBUaGUgWEVOIGltcGxlbWVudGF0aW9uIG9mIGlycWNoaXA6OmlycV9z
ZXRfYWZmaW5pdHkoKSBhbHJlYWR5IHBpY2tzIGEKPj4+IHNpbmdsZSB0YXJnZXQgQ1BVIG91dCBv
ZiB0aGUgYWZmaW5pdHkgbWFzayBhbmQgdGhlIGFjdHVhbCB0YXJnZXQgaXMgc3RvcmVkCj4+PiBp
biB0aGUgZWZmZWN0aXZlIENQVSBtYXNrLCBzbyBkZXN0cm95aW5nIHRoZSB1c2VyIGNob3NlbiBh
ZmZpbml0eSBtYXNrCj4+PiB3aGljaCBtaWdodCBjb250YWluIG1vcmUgdGhhbiBvbmUgQ1BVIGlz
IHdyb25nLgo+Pj4KPj4+IENoYW5nZSB0aGUgaW1wbGVtZW50YXRpb24gc28gdGhhdCB0aGUgY2hh
bm5lbCBpcyBib3VuZCB0byBDUFUwIGF0IHRoZSBYRU4KPj4+IGxldmVsIGFuZCBsZWF2ZSB0aGUg
YWZmaW5pdHkgbWFzayBhbG9uZS4gQXQgc3RhcnR1cCBvZiB0aGUgaW50ZXJydXB0Cj4+PiBhZmZp
bml0eSB3aWxsIGJlIGFzc2lnbmVkIG91dCBvZiB0aGUgYWZmaW5pdHkgbWFzayBhbmQgdGhlIFhF
TiBiaW5kaW5nIHdpbGwKPj4+IGJlIHVwZGF0ZWQuCj4+IAo+PiAKPj4gSWYgdGhhdCdzIHRoZSBj
YXNlIHRoZW4gSSB3b25kZXIgd2hldGhlciB3ZSBuZWVkIHRoaXMgY2FsbCBhdCBhbGwgYW5kIGlu
c3RlYWQgYmluZCBhdCBzdGFydHVwIHRpbWUuCj4KPiBBZnRlciBzb21lIGRpc2N1c3Npb24gd2l0
aCBUaG9tYXMgb24gSVJDIGFuZCB4ZW4tZGV2ZWwgYXJjaGFlb2xvZ3kgdGhlCj4gcmVzdWx0IGlz
OiB0aGlzIHdpbGwgYmUgbmVlZGVkIGVzcGVjaWFsbHkgZm9yIHN5c3RlbXMgcnVubmluZyBvbiBh
Cj4gc2luZ2xlIHZjcHUgKGUuZy4gc21hbGwgZ3Vlc3RzKSwgYXMgdGhlIC5pcnFfc2V0X2FmZmlu
aXR5KCkgY2FsbGJhY2sKPiB3b24ndCBiZSBjYWxsZWQgaW4gdGhpcyBjYXNlIHdoZW4gc3RhcnRp
bmcgdGhlIGlycS4KClRoYXQncyByaWdodCwgYnV0IG5vdCBsaW1pdGVkIHRvIEFSTS4gVGhlIHNh
bWUgcHJvYmxlbSBleGlzdHMgb24geDg2IFVQLgpTbyB5ZXMsIHRoZSBjYWxsIG1ha2VzIHNlbnNl
LCBidXQgdGhlIGNoYW5nZWxvZyBpcyBub3QgcmVhbGx5IHVzZWZ1bC4KTGV0IG1lIGFkZCBhIGNv
bW1lbnQgdG8gdGhpcy4KClRoYW5rcywKCiAgICAgICAgdGdseApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
