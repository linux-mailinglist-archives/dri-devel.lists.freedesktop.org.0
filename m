Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC295A0C5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 18:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7CE6E963;
	Fri, 28 Jun 2019 16:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BD96E963
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 16:27:55 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id z23so6520856ote.13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 09:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1m5eUNW/8O3Uia+UgF1DOs7nZbA/5lPFN6ZbyXe0/Ls=;
 b=avp0rqW4ewheRBqjY5Ys2SbCX40aXrH39KhvMzSoziuzWgGdpLGH0p6aUCfwCRflMj
 ole0B/PhDB+7EU78Fas2N48T91zFJ1NLtt4fZZWGJKKUWRS8WDjhm0Iq1LnMH1l65p+I
 Nv0shqh7brKYi8vADsWeX2aLDhuJV1QLCbOegEsT98DDPe8IEhK2mfjyGAzel8Y1Y2eh
 ZVsgoHOBI3zlU2tpJafoFaPsYDc6q6ho4/hRhSb5L2ggvCI2swdaEHVhCLihd1haSaf5
 gr/aHA2vTJZjSMkQqOYpb0E6YGelm75OgdJVKkM7hjSotvy8LYrKKpXChflIKN5H2G9F
 lLew==
X-Gm-Message-State: APjAAAUPEUOmWsEfcBN0HmIPF7uZkBT7y/9HoYzoJ+caaV+f0BTK6dM2
 Uw1oMKNASXB0hESpZ4B4J5W84rmuWY9ExuunRsSdjQ==
X-Google-Smtp-Source: APXvYqzpE+Kqyx1ivu95dqxD5Xmw+1dAtjgOIlYl2JIyAfPlIWR3aLAm88Jb4Ju/vM/swOByZ/3NEnMvyOQmHp503wY=
X-Received: by 2002:a9d:7248:: with SMTP id a8mr9100984otk.363.1561739275009; 
 Fri, 28 Jun 2019 09:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
In-Reply-To: <20190628153827.GA5373@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Jun 2019 09:27:44 -0700
Message-ID: <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
Subject: Re: [PATCH 16/25] device-dax: use the dev_pagemap internal refcount
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1m5eUNW/8O3Uia+UgF1DOs7nZbA/5lPFN6ZbyXe0/Ls=;
 b=cOaWk12t9PR+wM1gV05bVlfR0S1JSjfvb0hJ6JHo5ppfgDNgrz3BIflcx5b+w4agLb
 brYamehqIiFRGAjIKCUe6+Q53dn3hCuKVsdvquxg1/zCaxiJNgcnspoK9aZ9PKMXCUax
 piwsxxk5ZVG0/OrqNggRtsNENyTRYeAIsTv0w6rRIv8xEx0MB8nULTH+IB0NC3xJ3BeI
 w9h4nLRfPNokhqWP61aJrHtY0lfJBXalafI60Q5aBVAiBp99b8Xbt//EkmWeTAvVPTH8
 cyXy8F6iRDlqKv+0BbiPuN3y3R6N6GvMZWeSpv1agBiqh/rGomhhdkAUvQejKMcw69mS
 wn1A==
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgODozOSBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDI6Mjc6MTVQTSAr
MDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBUaGUgZnVuY3Rpb25hbGl0eSBpcyBp
ZGVudGljYWwgdG8gdGhlIG9uZSBjdXJyZW50bHkgb3BlbiBjb2RlZCBpbgo+ID4gZGV2aWNlLWRh
eC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
PiA+IFJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL2RheC9kYXgtcHJpdmF0ZS5oIHwgIDQgLS0tLQo+ID4gIGRyaXZlcnMvZGF4
L2RldmljZS5jICAgICAgfCA0MyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQ3IGRlbGV0aW9ucygtKQo+Cj4gRGFuVzogSSB0aGlu
ayB0aGlzIHNlcmllcyBoYXMgcmVhY2hlZCBlbm91Z2ggcmV2aWV3LCBkaWQgeW91IHdhbnQKPiB0
byBhY2svdGVzdCBhbnkgZnVydGhlcj8KPgo+IFRoaXMgbmVlZHMgdG8gbGFuZCBpbiBobW0uZ2l0
IHNvb24gdG8gbWFrZSB0aGUgbWVyZ2Ugd2luZG93LgoKSSB3YXMgYXdhaXRpbmcgYSBkZWNpc2lv
biBhYm91dCByZXNvbHZpbmcgdGhlIGNvbGxpc2lvbiB3aXRoIElyYSdzCnBhdGNoIGJlZm9yZSB0
ZXN0aW5nIHRoZSBmaW5hbCByZXN1bHQgYWdhaW4gWzFdLiBZb3UgY2FuIGdvIGFoZWFkIGFuZAph
ZGQgbXkgcmV2aWV3ZWQtYnkgZm9yIHRoZSBzZXJpZXMsIGJ1dCBteSB0ZXN0ZWQtYnkgc2hvdWxk
IGJlIG9uIHRoZQpmaW5hbCBzdGF0ZSBvZiB0aGUgc2VyaWVzLgoKWzFdOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sL0NBUGN5djRnVE9mK0VXelNHckZyaDJHclRadDVIVlI9ZSt4aWNVS0Vw
aXk1N3B4OEord0BtYWlsLmdtYWlsLmNvbS8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
