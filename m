Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A45291407
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EB36E29D;
	Sat, 17 Oct 2020 19:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500316E28B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 16:13:13 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id u19so4552768ion.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 09:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=HoVWWsnJtF4ldfrPYdqvQFOpOJVhRuHffI82nRexcX8=;
 b=Jw6H43NWctaQWddG+pghAvq2p766POaPQK67OavH9mxQ2H9IpE074eMaq6fsdxm87u
 mYXexOncu0xIlG+cKVY1W4nYVRMtHcVLbnVI5ef52KknoCtpuRXs939C9jhj3B3QVAGP
 qfiE26X3OtR2LAb7NWdzedtO/V/g077FEU04FmbuSzrCBv/v9wW90J90qpihp8tcjaeB
 BMuwiJgKQny9OK6blmSzlTLIH1p+HFlRKXb7bO+x9vFGa38q/jaxdoIGKFnEIX4rMxBV
 Cp6qNmIpW8jf9j8J/TJSpcYFlWo65G2qZjzlvU/KYrv8Fq4w4DyRvZP1UTYbZ2JkzHfN
 983Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HoVWWsnJtF4ldfrPYdqvQFOpOJVhRuHffI82nRexcX8=;
 b=Go9B4/vl3gFDcLLMpE3KjzLP0+NlGvhk8XzAo0dIJm0z54gnlqg5YDPXyaQRHw8Eyg
 zav7w2MxumG6QVqxDqI2mDn1rTxry6YpS8DKsOUaQHWD+mRdL+Gy3lvgFXw33uuq+03w
 4apCbhbLmNcU2Z40hltK6QcDC0jQcezNbOQXeciMXbBYj3PE1wwUmvtBJcDgrzCo08lS
 Yg2XoLFya+g3rgWtUOwx45mBEhpaZrzsjZvDxwpMOnxMujy/68WkCuwE0aI+0PXDdJwy
 1CJvUhvXoS9KQ7vy6irzjMorERNDKY8DbBkb7MLn9zXbcTLFo0WOv9tXV78azoxTHGjV
 jepw==
X-Gm-Message-State: AOAM532u4b2fzmBg81MhzKDwA2xsaNc5rTBXfYcZIdSqSXMWSMtG6XjD
 l5JkqtsJ/7r9uVJKvbOf2VwFxw==
X-Google-Smtp-Source: ABdhPJwNXo7iyWJ77FT+/0CMo9tudCck82Xc2qlsaYhuPEdloUxNeSLOdR9y5ZI15zE7xNsqmPrhXQ==
X-Received: by 2002:a6b:b413:: with SMTP id d19mr3054559iof.10.1602864792525; 
 Fri, 16 Oct 2020 09:13:12 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id m66sm2702327ill.69.2020.10.16.09.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 09:13:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kTSLu-000ecw-Lj; Fri, 16 Oct 2020 13:13:10 -0300
Date: Fri, 16 Oct 2020 13:13:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] mm: mmap: fix fput in error path v2
Message-ID: <20201016161310.GE36674@ziepe.ca>
References: <20201012085203.56119-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012085203.56119-1-christian.koenig@amd.com>
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

T24gTW9uLCBPY3QgMTIsIDIwMjAgYXQgMTA6NTI6MDJBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBQYXRjaCAiNDk1YzEwY2MxYzBjIENIUk9NSVVNOiBkbWEtYnVmOiByZXN0b3Jl
IGFyZ3MuLi4iCj4gYWRkcyBhIHdvcmthcm91bmQgZm9yIGEgYnVnIGluIG1tYXBfcmVnaW9uLgo+
IAo+IEFzIHRoZSBjb21tZW50IHN0YXRlcyAtPm1tYXAoKSBjYWxsYmFjayBjYW4gY2hhbmdlCj4g
dm1hLT52bV9maWxlIGFuZCBzbyB3ZSBtaWdodCBjYWxsIGZwdXQoKSBvbiB0aGUgd3JvbmcgZmls
ZS4KPiAKPiBSZXZlcnQgdGhlIHdvcmthcm91bmQgYW5kIHByb3BlciBmaXggdGhpcyBpbiBtbWFw
X3JlZ2lvbi4KPiAKPiB2MjogZHJvcCB0aGUgZXh0cmEgaWYgaW4gZG1hX2J1Zl9tbWFwIGFzIHdl
bGwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAyMCArKystLS0tLS0tLS0tLS0t
LS0tLQo+ICBtbS9tbWFwLmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IEphc29u
IEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+CgpQcm9iYWJseSBzaG91bGQgRml4ZXMgdGhhdCBv
dGhlciBwYXRjaCBBbmRyZXcgcG9pbnRlZCBhdAoKSmFzb24KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
