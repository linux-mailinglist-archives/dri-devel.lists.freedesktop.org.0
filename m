Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB86291406
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36B56E3E5;
	Sat, 17 Oct 2020 19:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639026EE19
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 16:13:23 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id 67so4483183iob.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 09:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SzfzkDBitQIi0dWl8hQ69VYetsUqJh1EpiO/PjfBVJ4=;
 b=jYFxSj0G8MEyNA6azgjTlI3p9WfsDHDEmQs6T3SvBZ2nPAHKqlNsKge/SQ531tHmcc
 AKcp/SO2BB1Fkw4uqOgO4xPcvAuls/is8lUdMvYQC/f3NKFiu0nmtm+Bn/y3IMI27SdB
 EVv/SiDOsylMgzjjUSuVh2dBkVf+OTtUjnLp3EDWRYIFPsNAVbZ7XEPR1ge5yEo9tPvw
 1/WhhUZywzgh4WCtd9LFge+gy+I3UA6EWus/7VeckFhN9Wh36+DPxt+JU+rla7OrDvof
 UEOc4BTCnqfvCbZ6fIrXvMvG72jUwxm1v/fpGdA22meHccsaDiS5CqNvbuhFAWPV/aO9
 7jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SzfzkDBitQIi0dWl8hQ69VYetsUqJh1EpiO/PjfBVJ4=;
 b=Ag5f2XKunWfvFusAdaYt502l+XunCOTFXjlNvYMUCDbrn5fvL/4h0aSXyl9HaypGz7
 1ssarFN0B7K5YW4/igWSlNuHK2joddRW21FsGrxI6mHHxDiMltRNoePv7xxq51gDXFGK
 9z6RyV+UojkwysFS09e3VJZN13/nAkEcJMmoXZFPodW0Y8GmRdfDIl2O74ZSklPMlMPy
 9k294a4nTD9C/QgttygirQkAHMLJJzetEz7cg0CcKAr/4pDw99D+vJvI+iasWYJnVriG
 zrlaDIG/M9371TIHackvnYxmjvtXZqLO9vNk6lTsdTWl7UisOfHALwTj0FkmbgFhi58T
 pJPQ==
X-Gm-Message-State: AOAM531xbSKTJ5UQddKYSL90ZG1wl6eB2dfUCDMTTBfYbCNd1L9marsD
 ff0TPk3+lJcaA6bdxmM50Q6iwg==
X-Google-Smtp-Source: ABdhPJzTc2rLvv4IerCZW/tHbEy8NKIi/ATblrGysyjzLvEYe0ppftMeHbv9aVUT0VxOy6SpaKvMQQ==
X-Received: by 2002:a02:b80f:: with SMTP id o15mr3153369jam.103.1602864802734; 
 Fri, 16 Oct 2020 09:13:22 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id g17sm2378255ilq.15.2020.10.16.09.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 09:13:22 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kTSM5-000edC-4i; Fri, 16 Oct 2020 13:13:21 -0300
Date: Fri, 16 Oct 2020 13:13:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] mm: introduce vma_set_file function v4
Message-ID: <20201016161321.GF36674@ziepe.ca>
References: <20201012085203.56119-1-christian.koenig@amd.com>
 <20201012085203.56119-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012085203.56119-2-christian.koenig@amd.com>
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: linmiaohe@huawei.com, jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, willy@infradead.org,
 airlied@redhat.com, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTIsIDIwMjAgYXQgMTA6NTI6MDNBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBZGQgdGhlIG5ldyB2bWFfc2V0X2ZpbGUoKSBmdW5jdGlvbiB0byBhbGxvdyBj
aGFuZ2luZwo+IHZtYS0+dm1fZmlsZSB3aXRoIHRoZSBuZWNlc3NhcnkgcmVmY291bnQgZGFuY2Uu
Cj4gCj4gdjI6IGFkZCBtb3JlIHVzZXJzIG9mIHRoaXMuCj4gdjM6IGFkZCBtaXNzaW5nIEVYUE9S
VF9TWU1CT0wsIHJlYmFzZSBvbiBtbWFwIGNsZWFudXAsCj4gICAgIGFkZCBjb21tZW50cyB3aHkg
d2UgZHJvcCB0aGUgcmVmZXJlbmNlIG9uIHR3byBvY2Nhc2lvbnMuCj4gdjQ6IG1ha2UgaXQgY2xl
YXIgdGhhdCBjaGFuZ2luZyBhbiBhbm9ueW1vdXMgdm1hIGlzIGlsbGVnYWwuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IFJl
dmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPiAodjIpCj4g
LS0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgICAgICAgICAgICAgICAgICB8ICAzICst
LQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jICAgICAgfCAgNCArLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYyB8ICAzICstLQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jICAgfCAgNSArKystLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYyAgICAgICAgICAgICAgfCAgNCArLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMgICAgICAgICB8ICAzICstLQo+ICBk
cml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jICAgICAgICAgICAgfCAgMyArLS0KPiAgZHJp
dmVycy9zdGFnaW5nL2FuZHJvaWQvYXNobWVtLmMgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGlu
Y2x1ZGUvbGludXgvbW0uaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4gIG1tL21t
YXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysrKysrKysrKwo+
ICAxMCBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKClJl
dmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPgoKSmFzb24KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
