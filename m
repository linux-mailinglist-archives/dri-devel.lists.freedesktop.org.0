Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0DF45E04
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 15:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B0B89893;
	Fri, 14 Jun 2019 13:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E28389893;
 Fri, 14 Jun 2019 13:21:58 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbm9T-0007v7-MV; Fri, 14 Jun 2019 13:21:55 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id DDD2E2013F73E; Fri, 14 Jun 2019 15:21:53 +0200 (CEST)
Date: Fri, 14 Jun 2019 15:21:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: christian.koenig@amd.com
Subject: Re: [PATCH 3/6] drm/gem: use new ww_mutex_(un)lock_for_each macros
Message-ID: <20190614132153.GR3436@hirez.programming.kicks-ass.net>
References: <20190614124125.124181-1-christian.koenig@amd.com>
 <20190614124125.124181-4-christian.koenig@amd.com>
 <20190614125940.GP3436@hirez.programming.kicks-ass.net>
 <6f2084ae-61d5-8cb9-c975-901456eed7e3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f2084ae-61d5-8cb9-c975-901456eed7e3@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BLef20GVw4MoTfiVzpLfCs64UYHDEIOk/MMjB+e9V0s=; b=sUp4PNm0UlGY6gGWIuw3RPxmUV
 Adb3VTZgQSN7aSag0MwXLaRvK0LiJeN7csWmb4E+CvX+R6KS0yOUwTAp70G9/HUhNmKEe5qZRyhaU
 xa/jKBkVbLf+pt2xlw+t4sbbscFf+9nFYhJvBTxSHD6dxs943UC9blcGOrKqFI2UuvD+O5HlLx0K7
 aPysM441FvEEEdCbsYthyqVghB9SFas4CbTIU9jVMHgyj+8SrqD2rCtbSYK/FBZPsY0ufzAUdrBZX
 wG6ydnj3Sj2jWTTA2TyVZ+oshoU9pSw4MjsMDNAgnPaOG0w2UrwRsZ2HsTHh8IHQND00uHzCM+WiP
 DwmBRIww==;
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
Cc: thellstrom@vmware.com, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, yuq825@gmail.com, linux+etnaviv@armlinux.org.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDM6MDY6MTBQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAxNC4wNi4xOSB1bSAxNDo1OSBzY2hyaWViIFBldGVyIFppamxzdHJhOgo+
ID4gKyNkZWZpbmUgd3dfbXV0ZXhfbG9ja19mb3JfZWFjaChsb29wLCBwb3MsIGNvbnRlbmRlZCwg
cmV0LCBpbnRyLCBjdHgpICAgXAo+ID4gKyAgICAgICBmb3IgKGNvbnRlbmRlZCA9IEVSUl9QVFIo
LUVOT0VOVCk7ICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAg
ICAgIF9fbGFiZWxfXyByZWxvY2ssIG5leHQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IC1FTk9FTlQ7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgIGlmIChjb250ZW5k
ZWQgPT0gRVJSX1BUUigtRU5PRU5UKSkgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY29udGVuZGVkID0gTlVMTDsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgIGVsc2UgaWYgKGNvbnRlbmRlZCA9PSBFUlJf
UFRSKC1FREVBRExLKSkgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgY29udGVuZGVkID0gKHBvcyk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
KyAgICAgICAgICAgICAgIGVsc2UgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0OyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAg
IGxvb3AgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGNvbnRlbmRlZCA9PSAocG9zKSkgeyAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb250ZW5kZWQgPSBOVUxMOyAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gK3JlbG9jazogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAhKGludHIpID8gd3dfbXV0ZXhfbG9j
ayhwb3MsIGN0eCkgOiAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHd3X211dGV4X2xvY2tfaW50ZXJydXB0aWJsZShwb3MsIGN0eCk7ICBcCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBpZiAocmV0ID09IC1FREVBRExLKSB7ICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHd3X211dGV4X3VubG9j
a19mb3JfZWFjaChsb29wLCBwb3MsICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250ZW5kZWQpOyAgICBcCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRlbmRlZCA9IEVSUl9QVFIoLUVERUFETEsp
OyAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gcmVs
b2NrOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAKPiA+IHdoaWxlIHJlbG9jayBo
ZXJlIGNvbnRpbnVlcyB3aGVyZSBpdCBsZWZ0IG9mIGFuZCBkb2Vzbid0IHJlc3RhcnQgQGxvb3Au
Cj4gPiBPciBhbSBJIHJlYWRpbmcgdGhpcyBtb25zdHJvc2l0eSB0aGUgd3Jvbmcgd2F5Pwo+IAo+
IGNvbnRlbmRlZCA9IEVSUl9QVFIoLUVERUFETEspIG1ha2VzIHN1cmUgdGhhdCB0aGUgd2hvbGUg
bG9vcCBpcyByZXN0YXJ0ZWQKPiBhZnRlciByZXRyeWluZyB0byBhY3F1aXJlIHRoZSBsb2NrLgo+
IAo+IFNlZSB0aGUgImlmIiBhYm92ZSAibG9vcCIuCgpBUkdILCB0aGUgbG9vcCBpbnNpZGUgdGhl
IGxvb3AuLi4gWWVhaCwgbWF5YmUsIGJyYWluIGh1cnRzLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
