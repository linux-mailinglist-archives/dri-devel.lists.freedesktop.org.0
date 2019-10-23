Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCBCE200B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1776EB37;
	Wed, 23 Oct 2019 15:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C62F6EB37
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:59:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 3so20200310wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 08:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=DpQNk5GKVU5HAVsS2lfnhXVgbc1C81TBtl7IJMFJUG8=;
 b=HAA3eDmIRSmirI2zAZxWPw5KUsGzfmY/8o/4D90FXvWYwCknfQ/XfJEfnPt7wv+Wem
 CQneskwANfxx5VjS/hxr545FQEPLFCey5WhWkyGjPoAkjw8ctIKHwugf9AwVndH9JDj6
 3cGNcrXyYzMCIROPfvUyj10mAUHEF6Q58DHDoU8IJiuwrIw6SsR6QHE1t7Sjjk57Xdfs
 oVCHaFN2b40fKIcs0BuQLpr5XkyiAXotyG1kH9q/lyYaTaYFu2FqcGjcKugKSlQIINjW
 m6AAbko2+gPlA01KdSVBqW04lOVhlT3BHLEhPHrOkANbkJbLOKZTLQhWyROfL1fMz0LR
 LyWA==
X-Gm-Message-State: APjAAAXCskBypSff6cRfZjAXPiR0kqTrLgJJ4zjL5Es3/WHPO3ZPSOu/
 Yhibv1E/gpOsQ76lok+KkWNa+A==
X-Google-Smtp-Source: APXvYqzob3uuDq3TFZkNHOCeq0PFX5T7ZcEi/y3ER2QZCW7dJ9tFg56NrLMyL5UAu8N+qEXNbsanQQ==
X-Received: by 2002:a1c:f714:: with SMTP id v20mr579631wmh.55.1571846384525;
 Wed, 23 Oct 2019 08:59:44 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a186sm21168572wmd.3.2019.10.23.08.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:59:43 -0700 (PDT)
Date: Wed, 23 Oct 2019 16:59:41 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
Message-ID: <20191023155941.q563d3cfizre4zvt@holly.lan>
References: <20191022083630.28175-1-brgl@bgdev.pl>
 <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=DpQNk5GKVU5HAVsS2lfnhXVgbc1C81TBtl7IJMFJUG8=;
 b=xgJXyFrIzYnIAL+3S/Laa0OGiram8c8HjJSo+AWxlLoq3e7mq7LkHGOB915fkNp8wD
 lG+QPGOP7/luA8dnleq8N8ayCsR5GEydJ+rS8AbUobNeUpV/V0jgZP27qayuOLKKVv9M
 DoBDrmBhvfkSVLHfEcXBdR/JRaOZziHAcOwuy+I9HkjEe6+w8KvFfy4HOhYRcugrS0I1
 cXa4xJLf+OoeE+QLEGOYloarE798piBCSZHBJ8Rs80mpA8Bqj6IWhLzYbqVFHX1V6rwG
 T/2VbdGlZ821+osz4ww0BDRxzk5d6+wdSasO20trH//+HIpg886tg+Jqw+LufgO10cir
 KUbQ==
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
Cc: Jacopo Mondi <jacopo@jmondi.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTE6Mjk6NTRBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiB3dC4sIDIyIHBhxbogMjAxOSBvIDEwOjM2IEJhcnRvc3ogR29sYXN6ZXdz
a2kgPGJyZ2xAYmdkZXYucGw+IG5hcGlzYcWCKGEpOgo+ID4KPiA+IEZyb206IEJhcnRvc3ogR29s
YXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gPgo+ID4gV2hpbGUgd29ya2lu
ZyBvbiBteSBvdGhlciBzZXJpZXMgcmVsYXRlZCB0byBncGlvLWJhY2tsaWdodFsxXSBJIG5vdGlj
ZWQKPiA+IHRoYXQgd2UgY291bGQgc2ltcGxpZnkgdGhlIGRyaXZlciBpZiB3ZSBtYWRlIHRoZSBv
bmx5IHVzZXIgb2YgcGxhdGZvcm0KPiA+IGRhdGEgdXNlIEdQSU8gbG9va3VwcyBhbmQgZGV2aWNl
IHByb3BlcnRpZXMuIFRoaXMgc2VyaWVzIHRyaWVzIHRvIGRvCj4gPiB0aGF0Lgo+ID4KPiA+IEZp
cnN0IHR3byBwYXRjaGVzIGNvbnRhaW4gbWlub3IgZml4ZXMuIFRoaXJkIHBhdGNoIG1ha2VzIHRo
ZSBkcml2ZXIKPiA+IGV4cGxpY2l0bHkgZHJpdmUgdGhlIEdQSU8gbGluZS4gRm91cnRoIHBhdGNo
IGFkZHMgYWxsIG5lY2Vzc2FyeSBkYXRhCj4gPiBzdHJ1Y3R1cmVzIHRvIGVjb3ZlYzI0LiBQYXRj
aCA1LzkgdW5pZmllcyBtdWNoIG9mIHRoZSBjb2RlIGZvciBib3RoCj4gPiBwZGF0YSBhbmQgbm9u
LXBkYXRhIGNhc2VzLiBQYXRjaGVzIDYtNy85IHJlbW92ZSB1bnVzZWQgcGxhdGZvcm0gZGF0YQo+
ID4gZmllbGRzLiBMYXN0IHR3byBwYXRjaGVzIGNvbnRhaW4gYWRkaXRpb25hbCBpbXByb3ZlbWVu
dHMgZm9yIHRoZSBHUElPCj4gPiBiYWNrbGlnaHQgZHJpdmVyIHdoaWxlIHdlJ3JlIGFscmVhZHkg
bW9kaWZ5aW5nIGl0Lgo+ID4KPiA+IEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhpcyBIVyBidXQg
aG9wZWZ1bGx5IHRoaXMgd29ya3MuIE9ubHkgY29tcGlsZQo+ID4gdGVzdGVkLgo+ID4KPiA+IFsx
XSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS82LzI1LzkwMAo+ID4KPiA+IHYxIC0+IHYyOgo+
ID4gLSByZWJhc2VkIG9uIHRvcCBvZiB2NS4zLXJjMSBhbmQgYWRqdXN0ZWQgdG8gdGhlIHJlY2Vu
dCBjaGFuZ2VzIGZyb20gQW5keQo+ID4gLSBhZGRlZCBhZGRpdGlvbmFsIHR3byBwYXRjaGVzIHdp
dGggbWlub3IgaW1wcm92ZW1lbnRzCj4gPgo+ID4gdjIgLT4gdjM6Cj4gPiAtIGluIHBhdGNoIDcv
NzogdXNlZCBpbml0aWFsaXplcnMgdG8gc2V0IHZhbHVlcyBmb3IgcGRhdGEgYW5kIGRldiBsb2Nh
bCB2YXJzCj4gPgo+ID4gdjMgLT4gdjQ6Cj4gPiAtIHJlYmFzZWQgb24gdG9wIG9mIHY1LjQtcmMx
Cj4gPiAtIHJlbW92ZWQgY2hhbmdlcyB0aGF0IGFyZSBubyBsb25nZXIgcmVsZXZhbnQgYWZ0ZXIg
Y29tbWl0IGVjNjY1Yjc1NmU2Zgo+ID4gICAoImJhY2tsaWdodDogZ3Bpby1iYWNrbGlnaHQ6IENv
cnJlY3QgaW5pdGlhbCBwb3dlciBzdGF0ZSBoYW5kbGluZyIpCj4gPiAtIGFkZGVkIHBhdGNoIDcv
Nwo+ID4KPiA+IHY0IC0+IHY1Ogo+ID4gLSBpbiBwYXRjaCA3Lzc6IGFkZGVkIGEgY29tbWVudCBy
ZXBsYWNpbmcgdGhlIG5hbWUgb2YgdGhlIGZ1bmN0aW9uIGJlaW5nCj4gPiAgIHB1bGxlZCBpbnRv
IHByb2JlKCkKPiA+Cj4gPiB2NSAtPiB2NjoKPiA+IC0gYWRkZWQgYSBwYXRjaCBtYWtpbmcgdGhl
IGRyaXZlciBleHBsaWNpdGx5IHNldCB0aGUgZGlyZWN0aW9uIG9mIHRoZSBHUElPCj4gPiAgIHRv
IG91dHB1dAo+ID4gLSBhZGRlZCBhIHBhdGNoIHJlbW92aW5nIGEgcmVkdW5kYW50IG5ld2xpbmUK
PiA+Cj4gPiB2NiAtPiB2NzoKPiA+IC0gcmVuYW1lZCB0aGUgZnVuY3Rpb24gY2FsY3VsYXRpbmcg
dGhlIG5ldyBHUElPIHZhbHVlIGZvciBzdGF0dXMgdXBkYXRlCj4gPiAtIGNvbGxlY3RlZCBtb3Jl
IHRhZ3MKPiA+Cj4gPiBCYXJ0b3N6IEdvbGFzemV3c2tpICg5KToKPiA+ICAgYmFja2xpZ2h0OiBn
cGlvOiByZW1vdmUgdW5uZWVkZWQgaW5jbHVkZQo+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92
ZSBzdHJheSBuZXdsaW5lCj4gPiAgIGJhY2tsaWdodDogZ3BpbzogZXhwbGljaXRseSBzZXQgdGhl
IGRpcmVjdGlvbiBvZiB0aGUgR1BJTwo+ID4gICBzaDogZWNvdmVjMjQ6IGFkZCBhZGRpdGlvbmFs
IHByb3BlcnRpZXMgdG8gdGhlIGJhY2tsaWdodCBkZXZpY2UKPiA+ICAgYmFja2xpZ2h0OiBncGlv
OiBzaW1wbGlmeSB0aGUgcGxhdGZvcm0gZGF0YSBoYW5kbGluZwo+ID4gICBzaDogZWNvdmVjMjQ6
IGRvbid0IHNldCB1bnVzZWQgZmllbGRzIGluIHBsYXRmb3JtIGRhdGEKPiA+ICAgYmFja2xpZ2h0
OiBncGlvOiByZW1vdmUgdW51c2VkIGZpZWxkcyBmcm9tIHBsYXRmb3JtIGRhdGEKPiA+ICAgYmFj
a2xpZ2h0OiBncGlvOiB1c2UgYSBoZWxwZXIgdmFyaWFibGUgZm9yICZwZGV2LT5kZXYKPiA+ICAg
YmFja2xpZ2h0OiBncGlvOiBwdWxsIGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3RhdGUo
KSBpbnRvIHByb2JlCj4gPgo+ID4gIGFyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAu
YyAgICAgICAgIHwgIDMzICsrKy0tCj4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19i
YWNrbGlnaHQuYyAgICAgfCAxMjggKysrKysrKy0tLS0tLS0tLS0tLQo+ID4gIGluY2x1ZGUvbGlu
dXgvcGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5oIHwgICAzIC0KPiA+ICAzIGZpbGVzIGNo
YW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDk1IGRlbGV0aW9ucygtKQo+ID4KPiA+IC0tCj4gPiAy
LjIzLjAKPiA+Cj4gCj4gTGVlLCBEYW5pZWwsIEppbmdvbywKPiAKPiBKYWNvcG8gaXMgdHJhdmVs
bGluZyB1bnRpbCBOb3ZlbWJlciAxc3QgYW5kIHdvbid0IGJlIGFibGUgdG8gdGVzdCB0aGlzCj4g
YWdhaW4gYmVmb3JlIHRoaXMgZGF0ZS4gRG8geW91IHRoaW5rIHlvdSBjYW4gcGljayBpdCB1cCBh
bmQgaW4gY2FzZQo+IGFueXRoaW5nJ3MgYnJva2VuIG9uIFNILCB3ZSBjYW4gZml4IGl0IGFmdGVy
IHY1LjUtcmMxLCBzbyB0aGF0IGl0Cj4gZG9lc24ndCBtaXNzIGFub3RoZXIgbWVyZ2Ugd2luZG93
PwoKT3V0c2lkZSBvZiBob2xpZGF5cyBhbmQgb3RoZXIgZW1lcmdlbmNpZXMgTGVlIHVzdWFsbHkg
Y29sbGVjdHMgdXAgdGhlCnBhdGNoZXMgZm9yIGJhY2tsaWdodC4gSSdtIG5vdCBzdXJlIHdoZW4g
aGUgcGxhbnMgdG8gY2xvc2UgdGhpbmdzIGZvcgp2NS41IC4KCgpEYW5pZWwuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
