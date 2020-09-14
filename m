Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363FA269F2B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BA16E847;
	Tue, 15 Sep 2020 07:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A195789E36
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 14:06:35 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id t13so16816726ile.9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1e7EGdpnwDvG5r/s0x2CkKUWWFCbx737ZFsalB8mkco=;
 b=a39sUxr3jeP/BLuXvYZo5sQYTUREOKDSpSwalRJaZBhMGYM+lo31MmddPsUALNOng5
 /pZZXE7TPZHU3Szy3pZ0M+Y7rQU5RZzpYMQik6eioTzucTKTD+y67pI5dGdksh+4k+fZ
 YrXO59uQCWgPiDFnRS4rhoWXqM0kmjSKBsbv15/QISxk14r7m+ZcNfvQ/z6PVkxyIoJy
 UbnYIurXjHDP+sSpVVlq9lVeKT91leZtIS+xsjXHznwlopScLnrz8829U/bsElTDP4YP
 /IGmxLr/+zpukVDvwgZ00Fe6hMFMlGuwgSNLlOKiT95ofedRBEkBwZuwNBkv2+haVnAW
 jlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1e7EGdpnwDvG5r/s0x2CkKUWWFCbx737ZFsalB8mkco=;
 b=k3T3U4TO95nnyG3OxZwpTtQWeKJZmZQTe85BmGW4IixExawHDTwY7oAtc+0CWceLQB
 aUeWjbaCOgz9FthPG0QcNw6tn9KNFQU2ZO2LMZnP1CAryEqkeuGJtnytGQknCDRzosuL
 Y+/apfsskLqm5JHWM/KRjbTNgg9paJtU0TvQschFPc16krXI1kq1HN6aeZx3ZV4hq+KL
 7WZCiZ/omTMDf3+lwUtY1J3A37lt9Jbx0X/epgNeTHOGp+PcCn/ldAUSDIeRRp+KDagx
 rNG6NzA0cQadhpksilZ1sgaaU623JatvF0YD1tuMuABsBk6r5olTRHaYTQgg91W6JHsR
 8u/g==
X-Gm-Message-State: AOAM530MICYTJ5dLrlsddTcIQRpfwXd6drTyLVBjNqZLdJiS19R/RyDm
 54SyxSzJcs9UGebIGgInXL8Tew==
X-Google-Smtp-Source: ABdhPJyF/sDYVopZg/BDQqrwTkESVkwSEOqsuOwDOcgGLzbWX7RzPa41tgaMCaw6uC7C6w4gVaxWqg==
X-Received: by 2002:a05:6e02:5a5:: with SMTP id
 k5mr11987669ils.28.1600092394945; 
 Mon, 14 Sep 2020 07:06:34 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id v14sm5988511iol.17.2020.09.14.07.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 07:06:34 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kHp7o-005y7Z-Sl; Mon, 14 Sep 2020 11:06:32 -0300
Date: Mon, 14 Sep 2020 11:06:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200914140632.GD1221970@ziepe.ca>
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:07:18 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMTQsIDIwMjAgYXQgMDM6MzA6NDdQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAxNC4wOS4yMCB1bSAxNToyOSBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6
Cj4gPiBIaSBBbmRyZXcsCj4gPiAKPiA+IEknbSB0aGUgbmV3IERNQS1idWYgbWFpbnRhaW5lciBh
bmQgRGFuaWVsIGFuZCBvdGhlcnMgY2FtZSB1cCB3aXRoCj4gPiBwYXRjaGVzIGV4dGVuZGluZyB0
aGUgdXNlIG9mIHRoZSBkbWFfYnVmX21tYXAoKSBmdW5jdGlvbi4KPiA+IAo+ID4gTm93IHRoaXMg
ZnVuY3Rpb24gaXMgZG9pbmcgc29tZXRoaW5nIGEgYml0IG9kZCBieSBjaGFuZ2luZyB0aGUKPiA+
IHZtYS0+dm1fZmlsZSB3aGlsZSBpbnN0YWxsaW5nIGEgVk1BIGluIHRoZSBtbWFwKCkgc3lzdGVt
IGNhbGwKCkl0IGRvZXNuJ3QgbG9vayBvYnZpb3VzbHkgc2FmZSBhcyBtbWFwX3JlZ2lvbigpIGhh
cyBhbiBpbnRlcmVzdGluZyBtaXgKb2YgZmlsZSBhbmQgdm1hLT5maWxlCgpFZyBpdCBjYWxscyBt
YXBwaW5nX3VubWFwX3dyaXRhYmxlKCkgdXNpbmcgYm90aCByb3V0ZXMKCldoYXQgYWJvdXQgc2Vj
dXJpdHk/IElzIGl0IE9LIHRoYXQgc29tZSBvdGhlciByYW5kb20gZmlsZSwgbWF5YmUgaW4KYW5v
dGhlciBwcm9jZXNzLCBpcyBiZWluZyBsaW5rZWQgdG8gdGhpcyBtbWFwPwoKPiA+IFRoZSBiYWNr
Z3JvdW5kIGhlcmUgaXMgdGhhdCBETUEtYnVmIGFsbG93cyBkZXZpY2UgZHJpdmVycyB0bwo+ID4g
ZXhwb3J0IGJ1ZmZlciB3aGljaCBhcmUgdGhlbiBpbXBvcnRlZCBpbnRvIGFub3RoZXIgZGV2aWNl
Cj4gPiBkcml2ZXIuIFRoZSBtbWFwKCkgaGFuZGxlciBvZiB0aGUgaW1wb3J0aW5nIGRldmljZSBk
cml2ZXIgdGhlbgo+ID4gZmluZCB0aGF0IHRoZSBwZ29mZiBiZWxvbmdzIHRvIHRoZSBleHBvcnRp
bmcgZGV2aWNlIGFuZCBzbwo+ID4gcmVkaXJlY3RzIHRoZSBtbWFwKCkgY2FsbCB0aGVyZS4KClNv
IHRoZSBwZ29mZiBpcyBzb21lIHZpcnR1YWxpemVkIHRoaW5nPwoKSmFzb24KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
