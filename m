Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5D32D7154
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D1D6ECA9;
	Fri, 11 Dec 2020 08:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F666E578;
 Fri, 11 Dec 2020 00:07:01 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607645220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QO8ZPs/aGTq6EeeiALBW4EwIli8xcBfNVbHQE3SuKNs=;
 b=gGpzgKDIdOJvLB57zkDYdB5nPR7tx5lmvyUREbAkcjTKLREnSTar6ATS+ovX5gwzQX+6as
 +gKXjZ78+gchUrT83h8ptRu8KDTcmgA5V5jrxe+Iroa2IR3dW4mzdsbfdAz67KCaNXJRFh
 HyT/Fqjz1nJPJbfByhhTG/yrTVt1YV6bo+ZpfwQUI97MYBpnXtPk3xo0rt3TJ6ElYxaC8x
 LYoOgKlBWXABRporT9mN8YQ9yVhNAWvziSIf5Q/k/u/zwNWg/xf9bb8eHNApJHV92yI6Fh
 8Vq/6Agy+63spk92uys0SUp9GgNSiQePxXptHhOLRD+usYLs0evVgfm0CC10Uw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607645220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QO8ZPs/aGTq6EeeiALBW4EwIli8xcBfNVbHQE3SuKNs=;
 b=fI8WyKpmQQfuF7v98I0m9jYr52j6v9il/Y1kYa+Nz5btUfOeJehvfvrp82h91pkkXnG/cc
 g+EFTi6ulxrthHDw==
To: boris.ostrovsky@oracle.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch 27/30] xen/events: Only force affinity mask for percpu
 interrupts
In-Reply-To: <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com>
References: <20201210192536.118432146@linutronix.de>
 <20201210194045.250321315@linutronix.de>
 <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com>
Date: Fri, 11 Dec 2020 01:06:59 +0100
Message-ID: <87ft4di4t8.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:07 +0000
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
 Chris Wilson <chris@chris-wilson.co.uk>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
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
 Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 intel-gfx@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgMTAgMjAyMCBhdCAxODoyMCwgYm9yaXMgb3N0cm92c2t5IHdyb3RlOgo+IE9u
IDEyLzEwLzIwIDI6MjYgUE0sIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4gQWxsIGV2ZW50IGNo
YW5uZWwgc2V0dXBzIGJpbmQgdGhlIGludGVycnVwdCBvbiBDUFUwIG9yIHRoZSB0YXJnZXQgQ1BV
IGZvcgo+PiBwZXJjcHUgaW50ZXJydXB0cyBhbmQgb3ZlcndyaXRlIHRoZSBhZmZpbml0eSBtYXNr
IHdpdGggdGhlIGNvcnJlc3BvbmRpbmcKPj4gY3B1bWFzay4gVGhhdCBkb2VzIG5vdCBtYWtlIHNl
bnNlLgo+Pgo+PiBUaGUgWEVOIGltcGxlbWVudGF0aW9uIG9mIGlycWNoaXA6OmlycV9zZXRfYWZm
aW5pdHkoKSBhbHJlYWR5IHBpY2tzIGEKPj4gc2luZ2xlIHRhcmdldCBDUFUgb3V0IG9mIHRoZSBh
ZmZpbml0eSBtYXNrIGFuZCB0aGUgYWN0dWFsIHRhcmdldCBpcyBzdG9yZWQKPj4gaW4gdGhlIGVm
ZmVjdGl2ZSBDUFUgbWFzaywgc28gZGVzdHJveWluZyB0aGUgdXNlciBjaG9zZW4gYWZmaW5pdHkg
bWFzawo+PiB3aGljaCBtaWdodCBjb250YWluIG1vcmUgdGhhbiBvbmUgQ1BVIGlzIHdyb25nLgo+
Pgo+PiBDaGFuZ2UgdGhlIGltcGxlbWVudGF0aW9uIHNvIHRoYXQgdGhlIGNoYW5uZWwgaXMgYm91
bmQgdG8gQ1BVMCBhdCB0aGUgWEVOCj4+IGxldmVsIGFuZCBsZWF2ZSB0aGUgYWZmaW5pdHkgbWFz
ayBhbG9uZS4gQXQgc3RhcnR1cCBvZiB0aGUgaW50ZXJydXB0Cj4+IGFmZmluaXR5IHdpbGwgYmUg
YXNzaWduZWQgb3V0IG9mIHRoZSBhZmZpbml0eSBtYXNrIGFuZCB0aGUgWEVOIGJpbmRpbmcgd2ls
bAo+PiBiZSB1cGRhdGVkLiAKPgo+IElmIHRoYXQncyB0aGUgY2FzZSB0aGVuIEkgd29uZGVyIHdo
ZXRoZXIgd2UgbmVlZCB0aGlzIGNhbGwgYXQgYWxsIGFuZAo+IGluc3RlYWQgYmluZCBhdCBzdGFy
dHVwIHRpbWUuCgpJIHdhcyB3b25kZXJpbmcgYWJvdXQgdGhhdCwgYnV0IG15IGtub3dsZWRnZSBh
Ym91dCB0aGUgWGVuIGludGVybmFsCnJlcXVpcmVtZW50cyBpcyBwcmV0dHkgbGltaXRlZC4gVGhl
IGN1cnJlbnQgc2V0IGF0IGxlYXN0IHN1cnZpdmVkIGJhc2ljCnRlc3RpbmcgYnkgSsO8cmdlbi4K
ClRoYW5rcywKCiAgICAgICAgdGdseApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
