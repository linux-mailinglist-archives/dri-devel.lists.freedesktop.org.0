Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE726C3594
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 15:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AE66E79A;
	Tue,  1 Oct 2019 13:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46066E799;
 Tue,  1 Oct 2019 13:27:22 +0000 (UTC)
Received: from localhost (173-25-83-245.client.mchsi.com [173.25.83.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74D8A205F4;
 Tue,  1 Oct 2019 13:27:22 +0000 (UTC)
Date: Tue, 1 Oct 2019 08:27:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [RFC PATCH] pci: prevent putting pcie devices into lower device
 states on certain intel bridges
Message-ID: <20191001132721.GA46491@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tuk4SA6-xUtJ-oRePy8MPXYAp2cfmSPxwW3J5nQuX3y2g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569936442;
 bh=hvuSU/zgSxL7X5McKtfL/85CgXAWQjA1PQjtADmotiw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=PVl8ichgRH2Kry9emAcsBbZ3LVJ+BXT3BKBgqVD7LlciVOm0Yy/aHX7MX1Rjp1MC+
 txtKjbJ6YDnqZQPdw+SBr8J/Hw6rzAM1gCdbOzNkFgzG9wKOHKa064QGC0f4zR5Mq/
 gohadmur2spYz1z4zJEil6lV6/IG6t4VzozqcEAA=
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDY6MzY6MTJQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IE9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDY6MzAgUE0gTWlrYSBXZXN0ZXJiZXJnCj4g
PG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
U2VwIDMwLCAyMDE5IGF0IDA2OjA1OjE0UE0gKzAyMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+
ID4gc3RpbGwgaGFwcGVucyB3aXRoIHlvdXIgcGF0Y2ggYXBwbGllZC4gVGhlIG1hY2hpbmUgc2lt
cGx5IGdldHMgc2h1dCBkb3duLgo+ID4gPgo+ID4gPiBkbWVzZyBjYW4gYmUgZm91bmQgaGVyZToK
PiA+ID4gaHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250ZW50LmNvbS9rYXJvbGhlcmJzdC80MGVi
MDkxYzdiN2IzM2VmOTkzNTI1ZGU2NjBmMWEzYi9yYXcvMjM4MGUzMWY1NjZlOTNlNWJhN2M4N2Vm
NTQ1NDIwOTY1ZDRjNDkyYy9naXN0ZmlsZTEudHh0Cj4gPgo+ID4gTG9va2luZyB5b3VyIGRtZXNn
Ogo+ID4KPiA+IFNlcCAzMCAxNzoyNDoyNyBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBE
Uk06IERDQiB2ZXJzaW9uIDQuMQo+ID4gU2VwIDMwIDE3OjI0OjI3IGtlcm5lbDogbm91dmVhdSAw
MDAwOjAxOjAwLjA6IERSTTogTU06IHVzaW5nIENPUFkgZm9yIGJ1ZmZlciBjb3BpZXMKPiA+IFNl
cCAzMCAxNzoyNDoyNyBrZXJuZWw6IFtkcm1dIEluaXRpYWxpemVkIG5vdXZlYXUgMS4zLjEgMjAx
MjA4MDEgZm9yIDAwMDA6MDE6MDAuMCBvbiBtaW5vciAxCj4gPgo+ID4gSSB3b3VsZCBhc3N1bWUg
aXQgcnVudGltZSBzdXNwZW5kcyBoZXJlLiBUaGVuIGl0IHdha2VzIHVwIGJlY2F1c2Ugb2YgUENJ
Cj4gPiBhY2Nlc3MgZnJvbSB1c2Vyc3BhY2U6Cj4gPgo+ID4gU2VwIDMwIDE3OjI0OjQyIGtlcm5l
bDogcGNpX3Jhd19zZXRfcG93ZXJfc3RhdGU6IDU2IGNhbGxiYWNrcyBzdXBwcmVzc2VkCj4gPgo+
ID4gYW5kIGZvciBzb21lIHJlYXNvbiBpdCBkb2VzIG5vdCBnZXQgcmVzdW1lZCBwcm9wZXJseS4g
VGhlcmUgYXJlIGFsc28gZmV3Cj4gPiB3YXJuaW5ncyBmcm9tIEFDUEkgdGhhdCBtaWdodCBiZSBy
ZWxldmFudDoKPiA+Cj4gPiBTZXAgMzAgMTc6MjQ6Mjcga2VybmVsOiBBQ1BJIFdhcm5pbmc6IFxf
U0IuUENJMC5HRlgwLl9EU006IEFyZ3VtZW50ICM0IHR5cGUgbWlzbWF0Y2ggLSBGb3VuZCBbQnVm
ZmVyXSwgQUNQSSByZXF1aXJlcyBbUGFja2FnZV0gKDIwMTkwNTA5L25zYXJndW1lbnRzLTU5KQo+
ID4gU2VwIDMwIDE3OjI0OjI3IGtlcm5lbDogQUNQSSBXYXJuaW5nOiBcX1NCLlBDSTAuUEVHMC5Q
RUdQLl9EU006IEFyZ3VtZW50ICM0IHR5cGUgbWlzbWF0Y2ggLSBGb3VuZCBbQnVmZmVyXSwgQUNQ
SSByZXF1aXJlcyBbUGFja2FnZV0gKDIwMTkwNTA5L25zYXJndW1lbnRzLTU5KQo+IAo+IGFmYWlr
IHRoaXMgaXMgdGhlIGNhc2UgZm9yIGVzc2VudGlhbGx5IGV2ZXJ5IGxhcHRvcCBvdXQgdGhlcmUu
CgpJIHRoaW5rIHdlIHNob3VsZCBsb29rIGludG8gdGhpcyBhIGxpdHRsZSBiaXQuCmFjcGlfbnNf
Y2hlY2tfYXJndW1lbnRfdHlwZXMoKSBjaGVja3MgdGhlIGFyZ3VtZW50IHR5cGUgYW5kIHByaW50
cwp0aGlzIG1lc3NhZ2UsIGJ1dCBBRkFJQ1QgaXQgZG9lc24ndCBhY3R1YWxseSBmaXggYW55dGhp
bmcgb3IgcHJldmVudApleGVjdXRpb24gb2YgdGhlIG1ldGhvZCwgc28gSSBoYXZlIG5vIGlkZWEg
d2hhdCBoYXBwZW5zIHdoZW4gd2UKYWN0dWFsbHkgZXhlY3V0ZSB0aGUgX0RTTS4KCklmIHdlIGV4
ZWN1dGUgdGhpcyBfRFNNIGFzIHBhcnQgb2YgcG93ZXIgbWFuYWdlbWVudCwgYW5kIHRoZSBfRFNN
CmRvZXNuJ3Qgd29yayByaWdodCwgaXQgd291bGQgYmUgbm8gc3VycHJpc2UgdGhhdCB3ZSBoYXZl
IHByb2JsZW1zLgoKTWF5YmUgd2UgY291bGQgbGVhcm4gc29tZXRoaW5nIGJ5IHR1cm5pbmcgb24g
QUNQSV9EQl9QQVJTRSBvdXRwdXQgKHNlZQpEb2N1bWVudGF0aW9uL2Zpcm13YXJlLWd1aWRlL2Fj
cGkvZGVidWcucnN0KS4KCllvdSBtdXN0IGhhdmUgYW4gYWNwaWR1bXAgYWxyZWFkeSBmcm9tIGFs
bCB5b3VyIGludmVzdGlnYXRpb24uICBDYW4KeW91IHB1dCBpdCBzb21ld2hlcmUsIGUuZy4sIGJ1
Z3ppbGxhLmtlcm5lbC5vcmcsIGFuZCBpbmNsdWRlIGEgVVJMPwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
