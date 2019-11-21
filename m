Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D7510511D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 12:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4F26EDB5;
	Thu, 21 Nov 2019 11:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292226E098;
 Thu, 21 Nov 2019 11:08:44 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id o12so2778813oic.9;
 Thu, 21 Nov 2019 03:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J3Cy3tfrJiIUlL+D9Jr0kFLFrHhJQwh4Hdb4cuVFpa8=;
 b=erHjzxwS4JsNP7EcyDNXF1kNzW+1aFjhfXFDOjyE9y+7cv7xqOWIryP7dilG03aYPm
 gAAcZwC9C0O91xXmEdxyyGS993Y9QhmYni4tolqwWrHK2jNiDNHuCxn82POVzxupv+U1
 mZYiWn1XxYtB86tGHGKbiYFgvzhBZBZgqcSovBEnPyeSs5gScNMaVvkyotXeTRY8ibd6
 JdTODlvCaJafiIzTxOADF35hqNY1NRp8vHbG9ItJ58930ci2ErRXbtbScFwkIGANOf55
 0f8qHP165n4SE1cPvllCoAv1CDFz96vAoH64rgP/yZgMwwCv2M/qbDEmoeOhjbWPeiiG
 VB9w==
X-Gm-Message-State: APjAAAWC0ENf1OFPQQWyovLWgVWq7WdcxupxjFiRmN5wt0b8LFBp33+i
 W0EAl0DBU/OcGFTQwqtpY3SBfu4Qkcor33TnhgY975Vh
X-Google-Smtp-Source: APXvYqxlqz4qNEUm0jTv4bAaBARGWgCnBqt/66UTTeVhGXft7P2C40EC7WWo0izyYaTsvvvl2QWLzkuMrcwnoaF2ur8=
X-Received: by 2002:a05:6808:901:: with SMTP id
 w1mr7358488oih.57.1574334523139; 
 Thu, 21 Nov 2019 03:08:43 -0800 (PST)
MIME-Version: 1.0
References: <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <20191120162306.GM11621@lahna.fi.intel.com>
 <CACO55tsvTG2E7_3nn1sTdPQXzxaZA96k+gmSBBXjPvei6v=kxg@mail.gmail.com>
 <20191121101423.GQ11621@lahna.fi.intel.com>
 <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
In-Reply-To: <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 21 Nov 2019 12:08:31 +0100
Message-ID: <CAJZ5v0jjwaQpYR0P0TPPTGM-1zObm7w1y4bj=7MDvPL78jOz5w@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MDMgUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDExOjE0IEFN
IE1pa2EgV2VzdGVyYmVyZwo+IDxtaWthLndlc3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPiA+
Cj4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMDozNjozMVBNICswMTAwLCBLYXJvbCBIZXJi
c3Qgd3JvdGU6Cj4gPiA+IHdpdGggdGhlIGJyYW5jaCBhbmQgcGF0Y2ggYXBwbGllZDoKPiA+ID4g
aHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250ZW50LmNvbS9rYXJvbGhlcmJzdC8wM2M0YzgxNDFi
MGZhMjkyZDc4MWJhZGZhMTg2NDc5ZS9yYXcvNWM2MjY0MGFmYmM1N2Q2ZTY5ZWE5MjRjMzM4YmQy
ODM2ZTc3MGQwMi9naXN0ZmlsZTEudHh0Cj4gPgo+ID4gVGhhbmtzIGZvciB0ZXN0aW5nLiBUb28g
YmFkIGl0IGRpZCBub3QgaGVscCA6KCBJIHN1cHBvc2UgdGhlcmUgaXMgbm8KPiA+IGNoYW5nZSBp
ZiB5b3UgaW5jcmVhc2UgdGhlIGRlbGF5IHRvIHNheSAxcz8KPgo+IFdlbGwsIGxvb2sgYXQgdGhl
IG9yaWdpbmFsIHBhdGNoIGluIHRoaXMgdGhyZWFkLgo+Cj4gV2hhdCBpdCBkb2VzIGlzIHRvIHBy
ZXZlbnQgdGhlIGRldmljZSAoR1BVIGluIHRoaXMgcGFydGljdWxhciBjYXNlKQo+IGZyb20gZ29p
bmcgaW50byBhIFBDSSBsb3ctcG93ZXIgc3RhdGUgYmVmb3JlIGludm9raW5nIEFNTCB0byBwb3dl
ciBpdAo+IGRvd24gKHRoZSBBTUwgaXMgc3RpbGwgaW52b2tlZCBhZnRlciB0aGlzIHBhdGNoIEFG
QUlDUyksIHNvIHdoeSB3b3VsZAo+IHRoYXQgaGF2ZSBhbnl0aGluZyB0byBkbyB3aXRoIHRoZSBk
ZWxheXM/Cj4KPiBUaGUgb25seSByZWFzb24gd291bGQgYmUgdGhlIEFNTCBydW5uaW5nIHRvbyBl
YXJseSwgYnV0IHRoYXQgZG9lc24ndAo+IHNlZW0gbGlrZWx5LiAgSU1PIG1vcmUgbGlrZWx5IGlz
IHRoYXQgdGhlIEFNTCBkb2VzIHNvbWV0aGluZyB3aGljaAo+IGNhbm5vdCBiZSBkb25lIHRvIGEg
ZGV2aWNlIGluIGEgUENJIGxvdy1wb3dlciBzdGF0ZS4KCkJUVywgSSdtIHdvbmRlcmluZyBpZiBh
bnlvbmUgaGFzIHRyaWVkIHRvIHNraXAgdGhlIEFNTCBpbnN0ZWFkIG9mCnNraXBwaW5nIHRoZSBQ
Q0kgUE0gaW4gdGhpcyBjYXNlIChhcyBvZiA1LjQtcmMgdGhhdCB3b3VsZCBiZSBhIHNpbWlsYXIK
cGF0Y2ggdG8gc2tpcCB0aGUgaW52b2NhdGlvbnMgb2YKX19wY2lfc3RhcnQvY29tcGxldGVfcG93
ZXJfdHJhbnNpdGlvbigpIGluIHBjaV9zZXRfcG93ZXJfc3RhdGUoKSBmb3IKdGhlIGFmZmVjdGVk
IGRldmljZSkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
