Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056CB359D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92926E85A;
	Mon, 16 Sep 2019 07:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A56C89B18
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 17:34:43 +0000 (UTC)
Received: from p200300ccff4ebd001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff4e:bd00:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i9YPu-0006G5-NN; Sun, 15 Sep 2019 19:34:31 +0200
Date: Sun, 15 Sep 2019 19:34:29 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] backlight: lm3630a: add an enable gpio for the HWEN
 pin
Message-ID: <20190915193429.5feef312@aktux>
In-Reply-To: <20190915165204.GA4857@bug>
References: <20190908203704.30147-1-andreas@kemnade.info>
 <20190908203704.30147-2-andreas@kemnade.info>
 <20190909105729.w5552rtop7rhghy2@holly.lan>
 <20190909221349.46ca5a1f@aktux>
 <20190910102156.vmprsjebmlphkv34@holly.lan>
 <20190910210648.3594912d@kemnade.info> <20190915165204.GA4857@bug>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RH3Ef5d/v7AONt/7OCwGtfOGl/ZPOxk/BNLO7+WUrvc=; b=AuCxOItxAXXy3fGbF9/x8IzmSv
 tGCuMHC05jD9iNfKoMUQAl2DaePaOtKeIV2WoW4pKb9DOiNSCpZGbLl6lEiZPYmbJ53XsWH/0niWw
 /PlR7DJNY3//d+JYjmNl5bFRFeDib33HA0PqO6TzET64gY137rJbQ53i/585fHhMSLK4=;
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, linux-fbdev@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBTdW4sIDE1IFNlcCAyMDE5IDE4OjUyOjA0ICswMjAwClBhdmVsIE1hY2hlayA8cGF2
ZWxAdWN3LmN6PiB3cm90ZToKCj4gSGkhCj4gCj4gPiA+ID4gPiBJcyB0aGlzIG5lZWRlZD8KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gVGhpcyBpcyBhIHJlbW92ZSBwYXRoLCBub3QgYSBwb3dlciBtYW5h
Z2VtZW50IHBhdGgsIGFuZCB3ZSBoYXZlIG5vIGlkZWEKPiA+ID4gPiA+IHdoYXQgdGhlIG9yaWdp
bmFsIHN0YXR1cyBvZiB0aGUgcGluIHdhcyBhbnl3YXk/Cj4gPiA+ID4gPiAgICAgCj4gPiA+ID4g
Cj4gPiA+ID4gTG9va2luZyBhdCBJc2hkbiBvbiBwYWdlIDUgb2YgdGhlIGRhdGFzaGVldCwgc3dp
dGNoaW5nIGl0IG9mZiBldmVyeXRpbWUKPiA+ID4gPiBwb3NzaWJsZSBzZWVtcyBub3QgbmVlZGVk
LiBXZSB3b3VsZCBuZWVkIHRvIGNhbGwgY2hpcF9pbml0KCkgZXZlcnl0aW1lCj4gPiA+ID4gd2Ug
ZW5hYmxlIHRoZSBncGlvIG9yIGxpdmUgd2l0aCBkZWZhdWx0IHZhbHVlcy4KPiA+ID4gPiBUaGVy
ZWZvcmUgSSBkaWQgZGVjaWRlIHRvIG5vdCBwdXQgaXQgaW50byBhbnkgcG93ZXIgbWFuYWdlbWVu
dCBwYXRoLgo+ID4gPiA+IEJ1dCBzd2l0Y2hpbmcgaXQgb24gYW5kIG5vdCBzd2l0Y2hpbmcgaXQg
b2ZmIGZlZWxzIHNvIHVuYmFsYW5jZWQuICAgICAKPiA+ID4gCj4gPiA+IEVpdGhlciB0aGUgcG93
ZXIgY29uc3VtZWQgYnkgdGhlIGNvbnRyb2xsZXIgd2hlbiBzdHJpbmdzIGFyZW4ndCBsaXQgdXAK
PiA+ID4gbWF0dGVycywgaW4gd2hpY2ggY2FzZSB0aGUgZHJpdmVyIHNob3VsZCBpbXBsZW1lbnQg
cHJvcGVyIHBvd2VyCj4gPiA+IG1hbmFnZW1lbnQgb3IgaXQgZG9lc24ndCBtYXR0ZXIgYW5kIGNo
YW5naW5nIHRoZSBwaW4gc3RhdGUgaXNuJ3QgbmVlZGVkLgo+ID4gPiAKPiA+ID4gSSdtIGhhcHB5
IHdpdGggZWl0aGVyIG9mIHRoZSBhYm92ZSBidXQgdGhpcyBsb29rcyBsaWtlIGEgdGhpcmQgd2F5
LAo+ID4gPiB3aGVyZSBlYWdlciB1c2VycyBjb3VsZCBoYWNrIGluIGEgYml0IG9mIGV4dHJhIHBv
d2VyIG1hbmFnZW1lbnQgYnkKPiA+ID4gZm9yY2luZyBkcml2ZXJzIHRvIHVuYmluZC4gCj4gPiA+
ICAgCj4gPiBJIHRoaW5rIEkgd2lsbCB0YWtlIHRoZSBzaW1wbGUgd2F5LiBJIGFtIHF1aXRlIHN1
cmUgdGhhdCB0aGUgcG93ZXIKPiA+IGNvbnN1bXB0aW9uIHdpdGggSFdFTiBvbiBhbmQgbGVkcyBv
ZmYgZG9lcyBub3QgbWF0dGVyLiBJZiBzb21lb25lCj4gPiBsYXRlciBjb21lcyB1cCBhbmQgZmlu
ZHMgb3V0IHRoYXQgSSBtaXNyZWFkIHRoZSBkYXRhc2hlZXQsIHRoaW5ncwo+ID4gYXJlIHByZXBh
cmVkIHRvIGJlIGltcHJvdmVkLiAgCj4gCj4gRHVubm8uLiBpZiB0aGUgcG93ZXIgY29uc3VtcHRp
b24gZG9lcyBub3QgbWF0dGVyLCB3aHkgZG9lcyB0aGUgY2hpcCBoYXZlIHRoZSBlbmFibGUKPiBw
aW4gaW4gdGhlIGZpcnN0IHBsYWNlLCBhbmQgd2h5IGRvIHdlIGJvdGhlciBzdXBwb3J0aW5nIGl0
PyBXZSBjb3VsZCBoYXJkY29kZSB0aGUKPiBwaW4gdG8gZW5hYmxlZCBhcyB3ZWxsLi4KCldlbGws
IEkgYWdyZWUgaGF2aW5nIHRoZSBwaW4gYW5kIG5vIHBvd2VyIHNhdmluZyBzZWVtcyBub3QgdG8g
bWFrZQpzZW5zZS4gVHdvIHBvaW50cyBoZXJlOiBJIHRoaW5rIGl0IGlzIGEgZ29vZCBpZGVhIHRv
IHByb3Blcmx5IGRlc2NyaWJlCnRoZSBoYXJkd2FyZSBpbiB0aGUgZGV2aWNldHJlZS4gV2hhdCB0
byBkbyB3aXRoIHRoYXQgaW5mb3JtYXRpb24gaXMKYW5vdGhlciB0aGluZy4KQSBwcm9ibGVtIGlz
IHRoYXQgYXQgdGhlIG1vbWVudCBJIGNhbm5vdCBlYXNpbHkgbWVhc3VyZSBjb25zdW1wdGlvbgpv
ZiB0aGUgY2hpcC4gSG1tLCBldmVuIHRlc3RpbmcgYSBzb2x1dGlvbiB3aGljaCBkaXNhYmxlcyB0
aGUgcGluIHdoaWxlCnRoZSBjaGlwIGlzIG5vdCBpbiB1c2UsIGlzIG5vdCBzbyBlYXN5LgpCdXQg
d2FpdC4uLgpJIGNvdWxkIHVzZSBhIHdyb25nIGdwaW8gYnV0IG9uZSB0aGF0IEkgY2FuIGVhc2ls
eSBtb25pdG9yIHRvIGNoZWNrIGlmCnRoZSBwaW4gaXMgdG9nZ2xlZC4gQW5kIHNldCB0aGUgcmVh
bCBwaW4gdG8gaGlnaCBieSBzb21lIG90aGVyIG1lYW5zLgpBbmQgdGhlbiB1c2UgdGhlIHJlYWwg
Z3BpbyB0byBjaGVjayBpZiB0aW1pbmdzIGFyZSBjb3JyZWN0ICh3YWl0aW5nCmVub3VnaCBhZnRl
ciBlbmFibGluZyB0aGUgY2hpcCwgZS5nLgoKUmVnYXJkcywKQW5kcmVhcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
