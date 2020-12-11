Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 143332D93F9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4836B6E0E3;
	Mon, 14 Dec 2020 08:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 11 Dec 2020 22:28:47 UTC
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071B96E5CC;
 Fri, 11 Dec 2020 22:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1607725727;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=SlMSeRdV/lwxDX3djLyqBMWP9qBV06XtN2qLgsx2f6c=;
 b=JzokaaH6QuR/BE2MlQvmAThn1HSUBCUoTJlJYYG2dHJZbgEjX/hz4w7d
 yGj78VmYM1CalDNKmImAZH/CqZyUkd3jGl82cVgMKIBSYFzjNcEEStswh
 Wh7llnbkOHhGZtgDTqG/nHiIU/r2amL2ULmlUzaQCS0pB6hokpke1op6Q E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zxKa8rgyFeg2y8fCG3oi7VnW2gUpr9OYlkvCF/sBtRwerKcGUj3U846xesB6P0sd8TbXpQL30D
 M+yqnl9FyOSn4AVTQICd1n20O7aUuBZJHO1hO49Y7WMuixViLEiIv7JOWQDh2eVZ9soCVAFoQW
 vfrc7AECE95KCs5m0z0M9zvfWWGUs6ClwL+l6kwP1ibvxZE1mGugR63NagsSn+AjDypKzJbLJy
 9z6mlpc3fKmjPgHdEEba0IFcfG0cgQo5L6XZQsW65QXYXuCPJHzmXpVX8QCySh2BtbtSv6z0yL
 eso=
X-SBRS: 5.2
X-MesageID: 33047865
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,412,1599537600"; d="scan'208";a="33047865"
Subject: Re: [patch 27/30] xen/events: Only force affinity mask for percpu
 interrupts
To: Thomas Gleixner <tglx@linutronix.de>, <boris.ostrovsky@oracle.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, LKML
 <linux-kernel@vger.kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194045.250321315@linutronix.de>
 <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com>
 <2164a0ce-0e0d-c7dc-ac97-87c8f384ad82@suse.com>
 <871rfwiknd.fsf@nanos.tec.linutronix.de>
 <9806692f-24a3-4b6f-ae55-86bd66481271@oracle.com>
 <877dpoghio.fsf@nanos.tec.linutronix.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <edbedd7a-4463-d934-73c9-fa046c19cf6d@citrix.com>
Date: Fri, 11 Dec 2020 22:21:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <877dpoghio.fsf@nanos.tec.linutronix.de>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Karthikeyan
 Mitran <m.karthikeyan@mobiveil.co.in>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Will Deacon <will@kernel.org>, Michal
 Simek <michal.simek@xilinx.com>, linux-s390@vger.kernel.org, afzal
 mohammed <afzal.mohd.ma@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Leon
 Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>, Russell
 King <linux@armlinux.org.uk>, Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Heiko Carstens <hca@linux.ibm.com>, Wambui Karuga <wambui.karugax@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-gpio@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 intel-gfx@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTIvMjAyMCAyMToyNywgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE9uIEZyaSwgRGVj
IDExIDIwMjAgYXQgMDk6MjksIGJvcmlzIG9zdHJvdnNreSB3cm90ZToKPgo+PiBPbiAxMi8xMS8y
MCA3OjM3IEFNLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+PiBPbiBGcmksIERlYyAxMSAyMDIw
IGF0IDEzOjEwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+IE9uIDExLjEyLjIwIDAwOjIwLCBi
b3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbSB3cm90ZToKPj4+Pj4gT24gMTIvMTAvMjAgMjoyNiBQ
TSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+Pj4+Pj4gQ2hhbmdlIHRoZSBpbXBsZW1lbnRhdGlv
biBzbyB0aGF0IHRoZSBjaGFubmVsIGlzIGJvdW5kIHRvIENQVTAgYXQgdGhlIFhFTgo+Pj4+Pj4g
bGV2ZWwgYW5kIGxlYXZlIHRoZSBhZmZpbml0eSBtYXNrIGFsb25lLiBBdCBzdGFydHVwIG9mIHRo
ZSBpbnRlcnJ1cHQKPj4+Pj4+IGFmZmluaXR5IHdpbGwgYmUgYXNzaWduZWQgb3V0IG9mIHRoZSBh
ZmZpbml0eSBtYXNrIGFuZCB0aGUgWEVOIGJpbmRpbmcgd2lsbAo+Pj4+Pj4gYmUgdXBkYXRlZC4K
Pj4+Pj4gSWYgdGhhdCdzIHRoZSBjYXNlIHRoZW4gSSB3b25kZXIgd2hldGhlciB3ZSBuZWVkIHRo
aXMgY2FsbCBhdCBhbGwgYW5kIGluc3RlYWQgYmluZCBhdCBzdGFydHVwIHRpbWUuCj4+Pj4gQWZ0
ZXIgc29tZSBkaXNjdXNzaW9uIHdpdGggVGhvbWFzIG9uIElSQyBhbmQgeGVuLWRldmVsIGFyY2hh
ZW9sb2d5IHRoZQo+Pj4+IHJlc3VsdCBpczogdGhpcyB3aWxsIGJlIG5lZWRlZCBlc3BlY2lhbGx5
IGZvciBzeXN0ZW1zIHJ1bm5pbmcgb24gYQo+Pj4+IHNpbmdsZSB2Y3B1IChlLmcuIHNtYWxsIGd1
ZXN0cyksIGFzIHRoZSAuaXJxX3NldF9hZmZpbml0eSgpIGNhbGxiYWNrCj4+Pj4gd29uJ3QgYmUg
Y2FsbGVkIGluIHRoaXMgY2FzZSB3aGVuIHN0YXJ0aW5nIHRoZSBpcnEuCj4+IE9uIFVQIGFyZSB3
ZSBub3QgdGhlbiBnb2luZyB0byBlbmQgdXAgd2l0aCBhbiBlbXB0eSBhZmZpbml0eSBtYXNrPyBP
cgo+PiBhcmUgd2UgZ3VhcmFudGVlZCB0byBoYXZlIGl0IHNldCB0byAxIGJ5IGludGVycnVwdCBn
ZW5lcmljIGNvZGU/Cj4gQW4gVVAga2VybmVsIGRvZXMgbm90IGV2ZXIgbG9vayBvbiB0aGUgYWZm
aW5pdHkgbWFzay4gVGhlCj4gY2hpcDo6aXJxX3NldF9hZmZpbml0eSgpIGNhbGxiYWNrIGlzIG5v
dCBpbnZva2VkIHNvIHRoZSBtYXNrIGlzCj4gaXJyZWxldmFudC4KPgo+IEEgU01QIGtlcm5lbCBv
biBhIFVQIG1hY2hpbmUgc2V0cyBDUFUwIGluIHRoZSBtYXNrIHNvIGFsbCBpcyBnb29kLgo+Cj4+
IFRoaXMgaXMgYWN0dWFsbHkgd2h5IEkgYnJvdWdodCB0aGlzIHVwIGluIHRoZSBmaXJzdCBwbGFj
ZSAtLS0gYQo+PiBwb3RlbnRpYWwgbWlzbWF0Y2ggYmV0d2VlbiB0aGUgYWZmaW5pdHkgbWFzayBh
bmQgWGVuLXNwZWNpZmljIGRhdGEKPj4gKGUuZy4gaW5mby0+Y3B1IGFuZCB0aGVuIHByb3RvY29s
LXNwZWNpZmljIGRhdGEgaW4gZXZlbnQgY2hhbm5lbAo+PiBjb2RlKS4gRXZlbiBpZiB0aGV5IGFy
ZSByZS1zeW5jaHJvbml6ZWQgbGF0ZXIsIGF0IHN0YXJ0dXAgdGltZSAoZm9yCj4+IFNNUCkuCj4g
V2hpY2ggaXMgbm90IGEgcHJvYmxlbSBlaXRoZXIuIFRoZSBhZmZpbml0eSBtYXNrIGlzIG9ubHkg
cmVsZXZhbnQgZm9yCj4gc2V0dGluZyB0aGUgYWZmaW5pdHksIGJ1dCBpdCdzIG5vdCByZWxldmFu
dCBmb3IgZGVsaXZlcnkgYW5kIG5ldmVyIGNhbgo+IGJlLgo+Cj4+IEkgZG9uJ3Qgc2VlIGFueXRo
aW5nIHRoYXQgd291bGQgY2F1c2UgYSBwcm9ibGVtIHJpZ2h0IG5vdyBidXQgSSB3b3JyeQo+PiB0
aGF0IHRoaXMgaW5jb25zaXN0ZW5jeSBtYXkgY29tZSB1cCBhdCBzb21lIHBvaW50Lgo+IEFzIGxv
bmcgYXMgdGhlIGFmZmluaXR5IG1hc2sgYmVjb21lcyBub3QgcGFydCBvZiB0aGUgZXZlbnQgY2hh
bm5lbCBtYWdpYwo+IHRoaXMgc2hvdWxkIG5ldmVyIG1hdHRlci4KPgo+IExvb2sgYXQgaXQgZnJv
bSBoYXJkd2FyZToKPgo+IGludGVycnVwdCBpcyBhZmZpbmUgdG8gQ1BVMAo+Cj4gICAgICBDUFUw
IHJ1bnM6Cj4gICAgICAKPiAgICAgIHNldF9hZmZpbml0eShDUFUwIC0+IENQVTEpCj4gICAgICAg
ICBsb2NhbF9pcnFfZGlzYWJsZSgpCj4gICAgICAgICAKPiAgLS0+IGludGVycnVwdCBpcyByYWlz
ZWQgaW4gaGFyZHdhcmUgYW5kIHBlbmRpbmcgb24gQ1BVMAo+Cj4gICAgICAgICBpcnEgaGFyZHdh
cmUgaXMgcmVjb25maWd1cmVkIHRvIGJlIGFmZmluZSB0byBDUFUxCj4KPiAgICAgICAgIGxvY2Fs
X2lycV9lbmFibGUoKQo+Cj4gIC0tPiBpbnRlcnJ1cHQgaXMgaGFuZGxlZCBvbiBDUFUwCj4KPiB0
aGUgbmV4dCBpbnRlcnJ1cHQgd2lsbCBiZSByYWlzZWQgb24gQ1BVMQo+Cj4gU28gaW5mby0+Y3B1
IHdoaWNoIGlzIHJlZ2lzdGVyZWQgdmlhIHRoZSBoeXBlcmNhbGwgYmluZHMgdGhlICdoYXJkd2Fy
ZQo+IGRlbGl2ZXJ5JyBhbmQgd2hlbmV2ZXIgdGhlIG5ldyBhZmZpbml0eSBpcyB3cml0dGVuIGl0
IGlzIHJlYm91bmQgdG8gc29tZQo+IG90aGVyIENQVSBhbmQgdGhlIG5leHQgaW50ZXJydXB0IGlz
IHRoZW4gcmFpc2VkIG9uIHRoaXMgb3RoZXIgQ1BVLgo+Cj4gSXQncyBub3QgYW55IGRpZmZlcmVu
dCBmcm9tIHRoZSBoYXJkd2FyZSBleGFtcGxlIGF0IGxlYXN0IG5vdCBhcyBmYXIgYXMKPiBJIHVu
ZGVyc3Rvb2QgdGhlIGNvZGUuCgpYZW4ncyBldmVudCBjaGFubmVscyBkbyBoYXZlIGEgY291cGxl
IG9mIHF1aXJrcy4KCkJpbmRpbmcgYW4gZXZlbnQgY2hhbm5lbCBhbHdheXMgcmVzdWx0cyBpbiBv
bmUgc3B1cmlvdXMgZXZlbnQgYmVpbmcKZGVsaXZlcmVkLsKgIFRoaXMgaXMgdG8gY292ZXIgbm90
aWZpY2F0aW9ucyB3aGljaCBjYW4gZ2V0IGxvc3QgZHVyaW5nIHRoZQpiaWRpcmVjdGlvbmFsIHNl
dHVwLCBvciByZS1zZXR1cHMgaW4gY2VydGFpbiBjb25maWd1cmF0aW9ucy4KCkJpbmRpbmcgYW4g
aW50ZXJkb21haW4gb3IgcGlycSBldmVudCBjaGFubmVsIGFsd2F5cyBkZWZhdWx0cyB0byB2Q1BV
MC7CoApUaGVyZSBpcyBubyB3YXkgdG8gYXRvbWljYWxseSBzZXQgdGhlIGFmZmluaXR5IHdoaWxl
IGJpbmRpbmcuwqAgSSBiZWxpZXZlCnRoZSBBUEkgcHJlZGF0ZXMgU01QIGd1ZXN0IHN1cHBvcnQg
aW4gWGVuLCBhbmQgbm9vbmUgaGFzIGZpeGVkIGl0IHVwIHNpbmNlLgoKQXMgYSBjb25zZXF1ZW5j
ZSwgdGhlIGd1ZXN0IHdpbGwgb2JzZXJ2ZSB0aGUgZXZlbnQgcmFpc2VkIG9uIHZDUFUwIGFzCnBh
cnQgb2Ygc2V0dGluZyB1cCB0aGUgZXZlbnQsIGV2ZW4gaWYgaXQgYXR0ZW1wdHMgdG8gc2V0IGEg
ZGlmZmVyZW50CmFmZmluaXR5IGltbWVkaWF0ZWx5IGFmdGVyd2FyZHMuwqAgQSBsaXR0bGUgYml0
IG9mIGNhcmUgbmVlZHMgdG8gYmUgdGFrZW4Kd2hlbiBiaW5kaW5nIGFuIGV2ZW50IGNoYW5uZWwg
b24gdkNQVXMgb3RoZXIgdGhhbiAwLCB0byBlbnN1cmUgdGhhdCB0aGUKY2FsbGJhY2sgaXMgc2Fm
ZSB3aXRoIHJlc3BlY3QgdG8gYW55IHJlbWFpbmluZyBzdGF0ZSBuZWVkaW5nIGluaXRpYWxpc2F0
aW9uLgoKQmV5b25kIHRoaXMsIHRoZXJlIGlzIG5vdGhpbmcgbWFnaWMgSSdtIGF3YXJlIG9mLgoK
V2UgaGF2ZSBzZWVuIHNvZnQgbG9ja3VwcyBiZWZvcmUgaW4gY2VydGFpbiBzY2VuYXJpb3MsIHNp
bXBseSBkdWUgdG8gdGhlCnF1YW50aXR5IG9mIGV2ZW50cyBoaXR0aW5nIHZDUFUwIGJlZm9yZSBp
cnFiYWxhbmNlIGdldHMgYXJvdW5kIHRvCnNwcmVhZGluZyB0aGUgbG9hZC7CoCBUaGlzIGlzIHdo
eSB0aGVyZSBpcyBhbiBhdHRlbXB0IHRvIHJvdW5kLXJvYmluIHRoZQp1c2Vyc3BhY2UgZXZlbnQg
Y2hhbm5lbCBhZmZpbml0aWVzIGJ5IGRlZmF1bHQsIGJ1dCBJIHN0aWxsIGRvbid0IHNlZSB3aHkK
dGhpcyB3b3VsZCBuZWVkIGN1c3RvbSBhZmZpbml0eSBsb2dpYyBpdHNlbGYuCgpUaGFua3MsCgp+
QW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
