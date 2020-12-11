Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C63872D93FC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8E96E08E;
	Mon, 14 Dec 2020 08:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CAC892DC;
 Fri, 11 Dec 2020 22:56:42 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607727400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMdJ5cNpvG94MqmN/2d6QVEWUP/YrLyBgV8MUkzsNlA=;
 b=0WcDMUhLUE5DmQJjljMHI2zWwird6I5Vzppg/zn6AZ6e1OM3STU+JeGE05b5oqLFOvFfmh
 CDXWZX+LKXvz41MQk+jw0mabsf/xLxFNSlsc7D+IqZgppXn+tyA6NewoUrmvCeXtmt2AST
 EViRmHdbhCgpLeje9DpFYTQlqeoEtc+eq14ZwN+Y4G4vhAzpgACbffqabmLR4OWIgQ5TkH
 0732UhUwEAjs3Gs9iSFScNlfSc9uVrpQKD7eElRAgICAQIyVgSIk6IrtHhKDjUooShlbLw
 6lnH9jzEFDJiTz3F4zTjotppmf5h8vHSXnbS356QRRnsZMAn1kegUSilRX0RVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607727400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMdJ5cNpvG94MqmN/2d6QVEWUP/YrLyBgV8MUkzsNlA=;
 b=ljcajSXupjVbHPbFKhUP57PPTY2aSW+D5nnua5xYh57kSUlRXkx3yzKeC3jH07q5vSS64l
 BGsVaGm3g05BhRAQ==
To: Andrew Cooper <andrew.cooper3@citrix.com>, boris.ostrovsky@oracle.com,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [patch 27/30] xen/events: Only force affinity mask for percpu
 interrupts
In-Reply-To: <edbedd7a-4463-d934-73c9-fa046c19cf6d@citrix.com>
References: <20201210192536.118432146@linutronix.de>
 <20201210194045.250321315@linutronix.de>
 <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com>
 <2164a0ce-0e0d-c7dc-ac97-87c8f384ad82@suse.com>
 <871rfwiknd.fsf@nanos.tec.linutronix.de>
 <9806692f-24a3-4b6f-ae55-86bd66481271@oracle.com>
 <877dpoghio.fsf@nanos.tec.linutronix.de>
 <edbedd7a-4463-d934-73c9-fa046c19cf6d@citrix.com>
Date: Fri, 11 Dec 2020 23:56:40 +0100
Message-ID: <87y2i4eytz.fsf@nanos.tec.linutronix.de>
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

QW5kcmV3LAoKT24gRnJpLCBEZWMgMTEgMjAyMCBhdCAyMjoyMSwgQW5kcmV3IENvb3BlciB3cm90
ZToKPiBPbiAxMS8xMi8yMDIwIDIxOjI3LCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+IEl0J3Mg
bm90IGFueSBkaWZmZXJlbnQgZnJvbSB0aGUgaGFyZHdhcmUgZXhhbXBsZSBhdCBsZWFzdCBub3Qg
YXMgZmFyIGFzCj4+IEkgdW5kZXJzdG9vZCB0aGUgY29kZS4KPgo+IFhlbidzIGV2ZW50IGNoYW5u
ZWxzIGRvIGhhdmUgYSBjb3VwbGUgb2YgcXVpcmtzLgoKV2h5IGFtIEkgbm90IHN1cnByaXNlZD8K
Cj4gQmluZGluZyBhbiBldmVudCBjaGFubmVsIGFsd2F5cyByZXN1bHRzIGluIG9uZSBzcHVyaW91
cyBldmVudCBiZWluZwo+IGRlbGl2ZXJlZC7CoCBUaGlzIGlzIHRvIGNvdmVyIG5vdGlmaWNhdGlv
bnMgd2hpY2ggY2FuIGdldCBsb3N0IGR1cmluZyB0aGUKPiBiaWRpcmVjdGlvbmFsIHNldHVwLCBv
ciByZS1zZXR1cHMgaW4gY2VydGFpbiBjb25maWd1cmF0aW9ucy4KPgo+IEJpbmRpbmcgYW4gaW50
ZXJkb21haW4gb3IgcGlycSBldmVudCBjaGFubmVsIGFsd2F5cyBkZWZhdWx0cyB0byB2Q1BVMC7C
oAo+IFRoZXJlIGlzIG5vIHdheSB0byBhdG9taWNhbGx5IHNldCB0aGUgYWZmaW5pdHkgd2hpbGUg
YmluZGluZy7CoCBJIGJlbGlldmUKPiB0aGUgQVBJIHByZWRhdGVzIFNNUCBndWVzdCBzdXBwb3J0
IGluIFhlbiwgYW5kIG5vb25lIGhhcyBmaXhlZCBpdCB1cAo+IHNpbmNlLgoKVGhhdCdzIGZpbmUu
IEknbSBub3QgY2hhbmdpbmcgdGhhdC4KCldoYXQgSSdtIGNoYW5naW5nIGlzIHRoZSB1bndhbnRl
ZCBhbmQgdW5uZWNlc3Nhcnkgb3ZlcndyaXRpbmcgb2YgdGhlCmFjdHVhbCBhZmZpbml0eSBtYXNr
LgoKV2UgaGF2ZSBhIHNpbWlsYXIgaXNzdWUgb24gcmVhbCBoYXJkd2FyZSB3aGVyZSB3ZSBjYW4g
b25seSB0YXJnZXQgX29uZV8KQ1BVIGFuZCBub3QgYWxsIENQVXMgaW4gdGhlIGFmZmluaXR5IG1h
c2suIFNvIHdlIHN0aWxsIGNhbiBwcmVzZXJ2ZSB0aGUKKHVzZXIpIHJlcXVlc3RlZCBtYXNrIGFu
ZCBqdXN0IGFmZmluZSBpdCB0byBvbmUgQ1BVIHdoaWNoIGlzIHJlZmxlY3RlZAppbiB0aGUgZWZm
ZWN0aXZlIGFmZmluaXR5IG1hc2suIFRoaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGZvciB0d28K
cmVhc29uczoKCiAgIDEpIEl0IGFsbG93cyBwcm9wZXIgaW50ZXJydXB0IGRpc3RyaWJ1dGlvbgoK
ICAgMikgSXQgZG9lcyBub3QgYnJlYWsgKHVzZXIpIHJlcXVlc3RlZCBhZmZpbml0eSB3aGVuIHRo
ZSBlZmZlY3RpdmUKICAgICAgdGFyZ2V0IENQVSBnb2VzIG9mZmxpbmUgYW5kIHRoZSBhZmZpbml0
eSBtYXNrIHN0aWxsIGNvbnRhaW5zCiAgICAgIG9ubGluZSBDUFVzLiBJZiB5b3Ugb3ZlcndyaXRl
IGl0IHlvdSBsb3N0IHRyYWNrIG9mIHRoZSByZXF1ZXN0ZWQKICAgICAgYnJvYWRlciBtYXNrLgoK
PiBBcyBhIGNvbnNlcXVlbmNlLCB0aGUgZ3Vlc3Qgd2lsbCBvYnNlcnZlIHRoZSBldmVudCByYWlz
ZWQgb24gdkNQVTAgYXMKPiBwYXJ0IG9mIHNldHRpbmcgdXAgdGhlIGV2ZW50LCBldmVuIGlmIGl0
IGF0dGVtcHRzIHRvIHNldCBhIGRpZmZlcmVudAo+IGFmZmluaXR5IGltbWVkaWF0ZWx5IGFmdGVy
d2FyZHMuwqAgQSBsaXR0bGUgYml0IG9mIGNhcmUgbmVlZHMgdG8gYmUgdGFrZW4KPiB3aGVuIGJp
bmRpbmcgYW4gZXZlbnQgY2hhbm5lbCBvbiB2Q1BVcyBvdGhlciB0aGFuIDAsIHRvIGVuc3VyZSB0
aGF0IHRoZQo+IGNhbGxiYWNrIGlzIHNhZmUgd2l0aCByZXNwZWN0IHRvIGFueSByZW1haW5pbmcg
c3RhdGUgbmVlZGluZwo+IGluaXRpYWxpc2F0aW9uLgoKVGhhdCdzIHByZXNlcnZlZCBmb3IgYWxs
IG5vbiBwZXJjcHUgaW50ZXJydXB0cy4gVGhlIHBlcmNwdSB2YXJpYW50IG9mClZJUlEgYW5kIElQ
SXMgZGlkIGJpbmRpbmcgdG8gdkNQVSAhPSAwIGFscmVhZHkgYmVmb3JlIHRoaXMgY2hhbmdlLgoK
PiBCZXlvbmQgdGhpcywgdGhlcmUgaXMgbm90aGluZyBtYWdpYyBJJ20gYXdhcmUgb2YuCj4KPiBX
ZSBoYXZlIHNlZW4gc29mdCBsb2NrdXBzIGJlZm9yZSBpbiBjZXJ0YWluIHNjZW5hcmlvcywgc2lt
cGx5IGR1ZSB0byB0aGUKPiBxdWFudGl0eSBvZiBldmVudHMgaGl0dGluZyB2Q1BVMCBiZWZvcmUg
aXJxYmFsYW5jZSBnZXRzIGFyb3VuZCB0bwo+IHNwcmVhZGluZyB0aGUgbG9hZC7CoCBUaGlzIGlz
IHdoeSB0aGVyZSBpcyBhbiBhdHRlbXB0IHRvIHJvdW5kLXJvYmluIHRoZQo+IHVzZXJzcGFjZSBl
dmVudCBjaGFubmVsIGFmZmluaXRpZXMgYnkgZGVmYXVsdCwgYnV0IEkgc3RpbGwgZG9uJ3Qgc2Vl
IHdoeQo+IHRoaXMgd291bGQgbmVlZCBjdXN0b20gYWZmaW5pdHkgbG9naWMgaXRzZWxmLgoKSnVz
dCB0aGUgcHJldmlvdXMgYXR0ZW1wdCBtYWtlcyBubyBzZW5zZSBmb3IgdGhlIHJlYXNvbnMgSSBv
dXRsaW5lZCBpbgp0aGUgY2hhbmdlbG9nLiBTbyBub3cgd2l0aCB0aGlzIG5ldyBzcHJlYWRpbmcg
bWVjaGFuaWNzIHlvdSBnZXQgdGhlCmRpc3RyaWJ1dGlvbiBmb3IgYWxsIGNhc2VzOgoKICAxKSBQ
b3N0IHNldHVwIHVzaW5nIGFuZCByZXNwZWN0aW5nIHRoZSBkZWZhdWx0IGFmZmluaXR5IG1hc2sg
d2hpY2ggY2FuCiAgICAgYmUgc2V0IGFzIGEga2VybmVsIGNvbW1hbmRsaW5lIHBhcmFtZXRlci4K
CiAgMikgUnVudGltZSAodXNlcikgcmVxdWVzdGVkIGFmZmluaXR5IGNoYW5nZSB3aXRoIGEgbWFz
ayB3aGljaCBjb250YWlucwogICAgIG1vcmUgdGhhbiBvbmUgdkNQVS4gVGhlIHByZXZpb3VzIGxv
Z2ljIGFsd2F5cyBjaG9zZSB0aGUgZmlyc3Qgb25lCiAgICAgaW4gdGhlIG1hc2suCgogICAgIFNv
IGFzc3VtZSB1c2Vyc3BhY2UgYWZmaW5lcyA0IGlycXMgdG8gYSBDUFUgMC0zIGFuZCA0IGlycXMg
dG8gQ1BVCiAgICAgNC03IHRoZW4gNCBpcnFzIGVuZCB1cCBvbiBDUFUwIGFuZCA0IG9uIENQVTQK
CiAgICAgVGhlIG5ldyBhbGdvcml0aG0gd2hpY2ggaXMgc2ltaWxhciB0byB3aGF0IHdlIGhhdmUg
b24geDg2IChtaW51cwogICAgIHRoZSB2ZWN0b3Igc3BhY2UgbGltaXRhdGlvbikgcGlja3MgdGhl
IENQVSB3aGljaCBoYXMgdGhlIGxlYXN0CiAgICAgbnVtYmVyIG9mIGNoYW5uZWxzIGFmZmluZSB0
byBpdCBhdCB0aGF0IG1vbWVudC4gSWYgZS5nLiBhbGwgOCBDUFVzCiAgICAgaGF2ZSB0aGUgc2Ft
ZSBudW1iZXIgb2YgdmVjdG9ycyBiZWZvcmUgdGhhdCBjaGFuZ2UgdGhlbiBpbiB0aGUKICAgICBl
eGFtcGxlIGFib3ZlIHRoZSBmaXJzdCA0IGFyZSBzcHJlYWQgdG8gQ1BVMC0zIGFuZCB0aGUgc2Vj
b25kIDQgdG8KICAgICBDUFU0LTcKClRoYW5rcywKCiAgICAgICAgdGdseAogICAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
