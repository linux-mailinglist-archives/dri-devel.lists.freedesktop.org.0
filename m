Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A24B1039A5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638AA6E489;
	Wed, 20 Nov 2019 12:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4216E447;
 Wed, 20 Nov 2019 12:11:48 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c19so20959874otr.11;
 Wed, 20 Nov 2019 04:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OeFNReHTu2Z/wmOhc+6rykSX19PAp/KecxFvBbcF5xE=;
 b=Iu9ikRQWCJNhKHjjkOV4GaqdCAfgoLs+zHXO2Jy2RBI8070I50b34Ck5X2c0uGnc93
 jfV77XWtOzue9w7vyrsLmcejG0GCwu1HGzqJFlM3QP3GzgUsow6fG62nGcv3NF8kWEhC
 ZxYqW27AWzuRHbUfQWM2dtvQ+9hN4TFkjzu+6qlyQVS02/ZE2lEJkEp67DO+UsdnffqG
 DDX49rx3vzkJes4dWRdw/J8puWIvzo2nmN3P/FUX1AbGrtNUDKL3QuBxe9V+g4qSzkC+
 lkouZfIp+ZGvBIHi247KC3s3ztfebrNcbUSFLxDzA0UUxBlXFwQvdLExy6+EeaudEE/G
 0q3w==
X-Gm-Message-State: APjAAAXr4m4Gz895lpxcXiXqIlAoBlsRSExHXEdGbyKJT5PxnMgfAf7m
 9rNyYZzzELJL9c3PX0yrnhH8Lq2j1yxUn8IRYvjYxpbF
X-Google-Smtp-Source: APXvYqyrkRK0kaVt5Z4vrt370dqRdCmzFhxyhg+9v0spLlBL7ZERizh4DCBBV+SYsNe6NGTAKOmu24BP4l9rb4a+3xk=
X-Received: by 2002:a9d:7d01:: with SMTP id v1mr1670717otn.167.1574251907511; 
 Wed, 20 Nov 2019 04:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <CAJZ5v0in4VSULsfLshHxhNLf+NZxVQM0xx=hzdNa2X3FW=V7DA@mail.gmail.com>
 <CACO55tsjj+xkDjubz1J=fsPecW4H_J8AaBTeaMm+NYjp8Kiq8g@mail.gmail.com>
 <CAJZ5v0ithxMPK2YxfTUx_Ygpze2FMDJ6LwKwJb2vx89dfgHX_A@mail.gmail.com>
In-Reply-To: <CAJZ5v0ithxMPK2YxfTUx_Ygpze2FMDJ6LwKwJb2vx89dfgHX_A@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 20 Nov 2019 13:11:36 +0100
Message-ID: <CAJZ5v0hYLrmFup61kzQL_rUuRy9yb+3L-BdRUGfSKqkGpm-utw@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Karol Herbst <kherbst@redhat.com>,
 Mika Westerberg <mika.westerberg@intel.com>
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTowNiBQTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVs
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NTEgUE0g
S2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
Tm92IDIwLCAyMDE5IGF0IDEyOjQ4IFBNIFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDEyOjIyIFBN
IE1pa2EgV2VzdGVyYmVyZwo+ID4gPiA8bWlrYS53ZXN0ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6
Cj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMTo1MjoyMkFNICswMTAw
LCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4gPiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5
IGF0IDExOjE4IEFNIE1pa2EgV2VzdGVyYmVyZwo+ID4gPiA+ID4gPG1pa2Eud2VzdGVyYmVyZ0Bp
bnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPgo+Cj4gW2N1dF0KPgo+ID4gPiA+ID4KPiA+ID4g
PiA+IE9oLCBzbyBkb2VzIGl0IGxvb2sgbGlrZSB3ZSBhcmUgdHJ5aW5nIHRvIHdvcmsgYXJvdW5k
IEFNTCB0aGF0IHRyaWVkCj4gPiA+ID4gPiB0byB3b3JrIGFyb3VuZCBzb21lIHByb2JsZW1hdGlj
IGJlaGF2aW9yIGluIExpbnV4IGF0IG9uZSBwb2ludD8KPiA+ID4gPgo+ID4gPiA+IFllcywgaXQg
bG9va3MgbGlrZSBzbyBpZiBJIHJlYWQgdGhlIEFTTCByaWdodC4KPiA+ID4KPiA+ID4gT0ssIHNv
IHRoYXQgd291bGQgY2FsbCBmb3IgYSBETUktYmFzZWQgcXVpcmsgYXMgdGhlIHJlYWwgY2F1c2Ug
Zm9yIHRoZQo+ID4gPiBpc3N1ZSBzZWVtcyB0byBiZSB0aGUgQU1MIGluIHF1ZXN0aW9uLCB3aGlj
aCBtZWFucyBhIGZpcm13YXJlIHByb2JsZW0uCj4gPiA+Cj4gPgo+ID4gQW5kIEkgZGlzYWdyZWUg
YXMgdGhpcyBpcyBhIGxpbnV4IHNwZWNpZmljIHdvcmthcm91bmQgYW5kIHdpbmRvd3MgZ29lcwo+
ID4gdGhhdCBwYXRoIGFuZCBzdWNjZWVkcy4gVGhpcyBmaXJtd2FyZSBiYXNlZCB3b3JrYXJvdW5k
IHdhcyBhZGRlZCwKPiA+IGJlY2F1c2UgaXQgYnJva2Ugb24gTGludXguCj4KPiBBcHBhcmVudGx5
IHNvIGF0IHRoZSB0aW1lIGl0IHdhcyBhZGRlZCwgYnV0IHdvdWxkIGl0IHN0aWxsIGJyZWFrIGFm
dGVyCj4gdGhlIGtlcm5lbCBjaGFuZ2VzIG1hZGUgc2luY2UgdGhlbj8KPgo+IE1vcmVvdmVyLCBo
YXMgaXQgbm90IGJlY29tZSBoYXJtZnVsIG5vdz8gIElPVywgd291bGRuJ3QgaXQgd29yayBhZnRl
cgo+IHJlbW92aW5nIHRoZSAiTGludXggd29ya2Fyb3VuZCIgZnJvbSB0aGUgQU1MPwo+Cj4gVGhl
IG9ubHkgd2F5IHRvIHZlcmlmeSB0aGF0IEkgY2FuIHNlZSB3b3VsZCBiZSB0byBydW4gdGhlIHN5
c3RlbSB3aXRoCj4gY3VzdG9tIEFDUEkgdGFibGVzIHdpdGhvdXQgdGhlICJMaW51eCB3b3JrYXJv
dW5kIiBpbiB0aGUgQU1MIGluCj4gcXVlc3Rpb24uCgpPciBydW5uaW5nIGl0IHdpdGggYWNwaV9y
ZXZfb3ZlcnJpZGUgYXMgc3VnZ2VzdGVkIGJ5IE1pa2EsIHdoaWNoCmVmZmVjdGl2ZWx5IHdvdWxk
IGJlIHRoZSBzYW1lIHRoaW5nLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
