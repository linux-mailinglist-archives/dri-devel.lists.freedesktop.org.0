Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3D3105177
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 12:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E656EDD3;
	Thu, 21 Nov 2019 11:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1360B6E0A6;
 Thu, 21 Nov 2019 11:32:10 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id f10so2620313oto.3;
 Thu, 21 Nov 2019 03:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f3k4Aw80bkAO/6lAcOnkrOVE0ZhJFwvrlGzBabrShVQ=;
 b=fBiX7lTsQ1sr50LYDLegjog2fd/+RAO6D7QtnCThfaQLa44PTCDiFPQodfx2fHVQ3n
 j5l6EjhlTUMT0f9CO1gsnCsLvdyoLwsVFFC4/W3wjcvPWKmIaJWwMaFj3phDxGq/Uik4
 J+q7CiSCLMZWGLVyZ2de9tDmY2yCuOrMVYg2xKTWtuiqrlmiZraXEA4ciuADVHh+fmAY
 +tgOKM/4hE9VNSioOBsPZ6WPmFyNub2D7G/fHXGNQE35dw4VewEV195C50kBmRDqKOKZ
 xdKFjuBlzDuO3v+0Uwz7SnzI364bgBYJtlWdXFHxMWbp6GIbTZHQo6pCgMxHBvj1uG9M
 OqWQ==
X-Gm-Message-State: APjAAAUlR2l2PSDD0cGToDsAVUGdizeBL5tjmINjcjrOzPp/57Fa95oX
 4h2NuEXGW0WOrnAQCgTj3vQKz+9QiWkrhRhK/Uo=
X-Google-Smtp-Source: APXvYqyCvKoq/cebzpfoCwlOfAUaYaxdKEecqatFjILqmn5JZJGCEgUqfxdBRzz6K72JW/bHFhwWpS917aNaWsJQbzY=
X-Received: by 2002:a9d:4c85:: with SMTP id m5mr5838389otf.118.1574335929309; 
 Thu, 21 Nov 2019 03:32:09 -0800 (PST)
MIME-Version: 1.0
References: <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <20191120162306.GM11621@lahna.fi.intel.com>
 <CACO55tsvTG2E7_3nn1sTdPQXzxaZA96k+gmSBBXjPvei6v=kxg@mail.gmail.com>
 <20191121101423.GQ11621@lahna.fi.intel.com>
 <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
 <20191121111739.GT11621@lahna.fi.intel.com>
In-Reply-To: <20191121111739.GT11621@lahna.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 21 Nov 2019 12:31:57 +0100
Message-ID: <CAJZ5v0h=c2d6G04kPnLzTLZ6Xn8bLfg3=F73Dz+o6fQ3w4tfPQ@mail.gmail.com>
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

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MTcgUE0gTWlrYSBXZXN0ZXJiZXJnCjxtaWthLndl
c3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDEy
OjAzOjUyUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gVGh1LCBOb3Yg
MjEsIDIwMTkgYXQgMTE6MTQgQU0gTWlrYSBXZXN0ZXJiZXJnCj4gPiA8bWlrYS53ZXN0ZXJiZXJn
QGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDEw
OjM2OjMxUE0gKzAxMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+ID4gPiB3aXRoIHRoZSBicmFu
Y2ggYW5kIHBhdGNoIGFwcGxpZWQ6Cj4gPiA+ID4gaHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250
ZW50LmNvbS9rYXJvbGhlcmJzdC8wM2M0YzgxNDFiMGZhMjkyZDc4MWJhZGZhMTg2NDc5ZS9yYXcv
NWM2MjY0MGFmYmM1N2Q2ZTY5ZWE5MjRjMzM4YmQyODM2ZTc3MGQwMi9naXN0ZmlsZTEudHh0Cj4g
PiA+Cj4gPiA+IFRoYW5rcyBmb3IgdGVzdGluZy4gVG9vIGJhZCBpdCBkaWQgbm90IGhlbHAgOigg
SSBzdXBwb3NlIHRoZXJlIGlzIG5vCj4gPiA+IGNoYW5nZSBpZiB5b3UgaW5jcmVhc2UgdGhlIGRl
bGF5IHRvIHNheSAxcz8KPiA+Cj4gPiBXZWxsLCBsb29rIGF0IHRoZSBvcmlnaW5hbCBwYXRjaCBp
biB0aGlzIHRocmVhZC4KPiA+Cj4gPiBXaGF0IGl0IGRvZXMgaXMgdG8gcHJldmVudCB0aGUgZGV2
aWNlIChHUFUgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UpCj4gPiBmcm9tIGdvaW5nIGludG8gYSBQ
Q0kgbG93LXBvd2VyIHN0YXRlIGJlZm9yZSBpbnZva2luZyBBTUwgdG8gcG93ZXIgaXQKPiA+IGRv
d24gKHRoZSBBTUwgaXMgc3RpbGwgaW52b2tlZCBhZnRlciB0aGlzIHBhdGNoIEFGQUlDUyksIHNv
IHdoeSB3b3VsZAo+ID4gdGhhdCBoYXZlIGFueXRoaW5nIHRvIGRvIHdpdGggdGhlIGRlbGF5cz8K
Pgo+IFllcywgSSBrbm93IHdoYXQgaXQgZG9lcyA6KSBJIHdhcyBqdXN0IHRoaW5raW5nIHRoYXQg
bWF5YmUgaXQncyBzdGlsbAo+IHRoZSBsaW5rIHRoYXQgZG9lcyBub3QgY29tZSB1cCB3aGVuIHdl
IGdvIGJhY2sgdG8gRDAgSSBndWVzcyB0aGF0J3Mgbm90Cj4gdGhlIGNhc2UgaGVyZS4KCkknbSBu
b3Qgc3VyZSB3aHkgdGhhdCB3b3VsZCBiZSByZWxhdGVkIHRvIHB1dHRpbmcgdGhlIGRldmljZSBp
bnRvLApzYXksIFBDSSBEMyBiZWZvcmUgaW52b2tpbmcgQU1MIHRvIHJlbW92ZSBwb3dlciBmcm9t
IGl0LiAgSWYgaXQgaXMgbm90CmluIFBDSSBEMyBhdCB0aGlzIHBvaW50LCB0aGUgQU1MIHN0aWxs
IHJ1bnMgYW5kIHN0aWxsIHJlbW92ZXMgcG93ZXIKZnJvbSBpdCBJSVVDLCBzbyBvbiB0aGUgd2F5
IGJhY2sgdGhlIHNpdHVhdGlvbiBpcyB0aGUgc2FtZSByZWdhcmRsZXNzOgp0aGUgZGV2aWNlIGhh
cyBubyBwb3dlciB3aGljaCAoYWdhaW4pIG5lZWRzIHRvIGJlIHJlc3RvcmVkIGJ5IEFNTC4KVGhh
dCAoaW4gcHJpbmNpcGxlKSBzaG91bGQgbm90IGRlcGVuZCBvbiB3aGF0IGhhcHBlbmVkIHRvIHRo
ZSBkZXZpY2UKYmVmb3JlIGl0IGxvc3QgcG93ZXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
