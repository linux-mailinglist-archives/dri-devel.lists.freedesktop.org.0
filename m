Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B251126C2DC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 14:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045166E06D;
	Wed, 16 Sep 2020 12:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB2D6E06D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 12:42:03 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id i17so7897315oig.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=czd653EAQqRd9y6KWSclqvh0oWs0wM7+eL3iGSU/nsI=;
 b=Lu3BjPbRiC/AX011FfwezqvylAv3ZKt1PhgO2s9ivkaAdFT+L+aU0tlTbH9aGB3QdD
 ZRH99A3CPlO3UqmOgNoRm+sYa3H4f9liy9wkSbTEbzeH6grEkhQUdoV/KEkl0b+7g6Fl
 aZYv0CeL8ooRR1NM3VZWi8l0zPzoTUe7oUQL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=czd653EAQqRd9y6KWSclqvh0oWs0wM7+eL3iGSU/nsI=;
 b=gnzAYcwAYmhTOJ17HhRCk2/CUCUShH6+WMz1kioFjteDpaCmHe5xouJmKTkZ1K3Tzn
 fTmFl5nl18fmVi2urpxGzqIWYKeYPmhmflVvMnTOLIDLi1PkHfH2hh3MzF4yUp5CMfkU
 /vmSU3/jM9M5I+fr0RBH2vtdn1wYvPyKS7J9UyCaGNvYspJq/oVpKWyE60aAW2k78WTJ
 ol0fYWo/xy4epsuoxawB1g1v2z1HkdertdWr0Nc0qbQrSJBl9u4ylXFbT6ZTv1PpoWLE
 JAhbzcNnmE3CgOLwNr4E0QthuT+8NRBs5B3upmB8ucrjYYIpDDq2Fj2ofcMARp+oSCkZ
 nSNw==
X-Gm-Message-State: AOAM531JO+nGMH2TZIhj8u6Df3+NdCMgB9eTazlEC0Xv3Bz3OHjSMy8O
 GKAV1NMjcIdrbDZeh91TayGX31yHGj+eqSY6vpqQww==
X-Google-Smtp-Source: ABdhPJwB+2iScSnSRjswx0wBN3crEjmROMPJs/KcyWAFLMOIPP9Nlf6b8MzVFM61WOlkTuWWi8Wacl+i3PJJq3k7BoM=
X-Received: by 2002:aca:6083:: with SMTP id u125mr3033440oib.14.1600260122457; 
 Wed, 16 Sep 2020 05:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local>
 <fc8f2af7-9fc2-cb55-3065-75a4060b7c82@amd.com>
 <b621db68-30b9-cc3f-c2c0-237a7fe4db09@amd.com>
In-Reply-To: <b621db68-30b9-cc3f-c2c0-237a7fe4db09@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 16 Sep 2020 14:41:51 +0200
Message-ID: <CAKMK7uGJVMj6Sb1nDTBoY8SsXc55y2ypUEsGhNLOkbbjFLuYfw@mail.gmail.com>
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Linux MM <linux-mm@kvack.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTYsIDIwMjAgYXQgMTo0NSBQTSBDaHJpc3RpYW4gS8O2bmlnCjxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gW1NOSVBdCj4KPiBCdXQgSmFzb24gcG9pbnRl
ZCBtZSB0byB0aGUgcmlnaHQgcGllY2Ugb2YgY29kZS4gU2VlIHRoaXMgY29tbWVudCBpbiBpbiBt
bWFwX3JlZ2lvbigpOgo+Cj4gLyogLT5tbWFwKCkgY2FuIGNoYW5nZSB2bWEtPnZtX2ZpbGUsIGJ1
dCBtdXN0IGd1YXJhbnRlZSB0aGF0Cj4gKiB2bWFfbGluaygpIGJlbG93IGNhbiBkZW55IHdyaXRl
LWFjY2VzcyBpZiBWTV9ERU5ZV1JJVEUgaXMgc2V0Cj4gKiBhbmQgbWFwIHdyaXRhYmx5IGlmIFZN
X1NIQVJFRCBpcyBzZXQuIFRoaXMgdXN1YWxseSBtZWFucyB0aGUKPiAqIG5ldyBmaWxlIG11c3Qg
bm90IGhhdmUgYmVlbiBleHBvc2VkIHRvIHVzZXItc3BhY2UsIHlldC4KPiAqLwo+IHZtYS0+dm1f
ZmlsZSA9IGdldF9maWxlKGZpbGUpOwo+IGVycm9yID0gY2FsbF9tbWFwKGZpbGUsIHZtYSk7Cj4K
Pgo+IFNvIGNoYW5naW5nIHZtYS0+dm1fZmlsZSBpcyBhbGxvd2VkIGF0IGxlYXN0IHVuZGVyIGNl
cnRhaW4gY2lyY3Vtc3RhbmNlcy4KPgo+IE9ubHkgdGhlICJmaWxlIG11c3Qgbm90IGhhdmUgYmVl
biBleHBvc2VkIHRvIHVzZXItc3BhY2UsIHlldCIgcGFydCBzdGlsbCBuZWVkcyBkb3VibGUgY2hl
Y2tpbmcuIEN1cnJlbnRseSB3b3JraW5nIG9uIHRoYXQuCj4KPgo+IE9rLCBJIHRoaW5rIHdlIGNh
biBndWFyYW50ZWUgZm9yIGFsbCBETUEtYnVmcyB3aGF0IGlzIHJlcXVpcmVkIGhlcmUuCj4KPiBX
aGlsZSBzZWFyY2hpbmcgdGhlIGNvZGUgSSd2ZSBmb3VuZCB0aGF0IGF0IGxlYXN0IHZnZW1fcHJp
bWVfbW1hcCgpIGFuZCBpOTE1X2dlbV9kbWFidWZfbW1hcCgpIGFyZSBkb2luZyB0aGUgc2FtZSB0
aGluZyBvZiBtb2RpZnlpbmcgdm1hLT52bV9maWxlLgo+Cj4gU28gSSdtIGxlYW5pbmcgdG93YXJk
cyB0aGF0IHRoaXMgd29ya3MgYXMgZXhwZWN0ZWQgYW5kIHdlIHNob3VsZCBqdXN0IGRvY3VtZW50
IHRoaXMgcHJvcGVybHkuCj4KPiBEYW5pZWwgYW5kIEphc29uIHdoYXQgZG8geW91IHRoaW5rPwoK
V2VsbCBJIGNhbiBjbGFpbSBJIHN0YXJ0ZWQgdGhpcywgc28gSSBzdGFydGVkIG91dCB3aXRoIG5h
aXZlbHkKYXNzdW1pbmcgdGhhdCBpdCBKdXN0IFdvcmtzIDotKQoKSSB0aGluayB3ZSBhbHJlYWR5
IGhhdmUgdmdlbS9pOTE1IHByaW1lIHRlc3RjYXNlcyBpbiBpZ3Qgd2hpY2ggdHJ5IHRvCmV4Y2Vy
Y2lzZSB0aGlzIG1tYXAgZm9yd2FyZGluZywgaW5jbHVkaW5nIHByb3Zva2luZyBwdGUgc2hvb3Qt
ZG93bnMuClNvIEkgdGhpbmsgYmVzdCB3b3VsZCBiZSBpZiB5b3UgY291bGQgYWxzbyBhZGQgYSB2
YXJpYW50IGZvciBhbWRncHUsCnRvIG1ha2Ugc3VyZSB0aGlzIHJlYWxseSB3b3JrcyBhbmQga2Vl
cHMgd29ya2luZy4KClBsdXMgb2ZjIHRoZSBkb2N1bWVudGF0aW9uIHBhdGNoIHNvIHRoYXQgY29y
ZSBtbSBmb2xrcyBjYW4gb2ZmaWNpYWxseQphY2sgdGhpcyBhcyBsZWdpdC4KLURhbmllbAotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
