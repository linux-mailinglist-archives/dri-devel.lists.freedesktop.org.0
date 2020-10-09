Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A27289FD2
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B06A6EEAB;
	Sat, 10 Oct 2020 10:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D80B6ECAB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 15:15:42 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d1so8177400qtr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 08:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XeahOZa88YOWCvFbh6+bgMvAS5KgvoSIrQZEwsz1AvI=;
 b=fiL8LqVIzi0BjC3AqpEniGWmtrH2e79DZDkKidQOoBdeBwwAF9glihw+P1udtUiRiR
 dTk+zv6qfOMRvAe+t3ZpstOPjWPwltaqd/54uMwnhyMbGimWYP6wjQZSPDPRSBLDMEq3
 jODLb9NnENznI2EjlVY8eeeQyOUt4wDCUBVw5E4o4CtxhrkZCvZljgQal96XAy815jPH
 RDf/kD1jB8E0S7A8xBT0hfridv/3aaapdFgFp0DMdGUAYVCsNNXdo32vpE1si8aOY0qD
 6JQLnOXMhIaPxpkffwZ3sgo12yyxh9cXcLPNx5AWVvptt5wn10sWuE/osKnMQoWVJT4F
 EMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XeahOZa88YOWCvFbh6+bgMvAS5KgvoSIrQZEwsz1AvI=;
 b=G3h5bvpiJFBLqAcdYUxwnbGQijlkSj90kT1aqOUU+5Q6ykDyUmstk6801j2aDtYGQS
 B0CNBwGqNzNqcPvSMGwqAztLm4Nvos0jEDMPtYvo6IfMCSWrUxJKmYK59ZxyNJqv7TgB
 ywPz2WcHDMrAEPD2oWRRQJeOi6El+9mX3Q5A+VEuPEFXhgpDjcmwCsLZDHxAQKxKh3s7
 rAZJVgdtIi2Uh8csiQdRMH+cKCPYM9jFwPAgA3fYFIAFzZYRrO0k3/ggOtz9iXqiZBu5
 LPR/RN8jYzFi7YJXD19S4IBFXIZmtyYBvcZ9V5TJbQeLBgG32FYE9i9Qq+7SS7CHQfe5
 LArA==
X-Gm-Message-State: AOAM530qbAcXcdI3P4fsPKDpTjZdII0FkaLCL2q3b2qVUrHcpMYtpSm4
 3S2MJ7+HVEqPqJLvMWKeapIp+A==
X-Google-Smtp-Source: ABdhPJxmLOKDbXxWMI0YoJdQfdZgk6XHAKS3TkXBLEezFKBn9UGmtIW842jk7ARXlak9j8uix2/hmg==
X-Received: by 2002:ac8:545a:: with SMTP id d26mr14359060qtq.124.1602256541398; 
 Fri, 09 Oct 2020 08:15:41 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id s123sm6228708qkd.128.2020.10.09.08.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 08:15:40 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQu7Q-0020Yl-8k; Fri, 09 Oct 2020 12:15:40 -0300
Date: Fri, 9 Oct 2020 12:15:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/6] mm: mmap: fix fput in error path
Message-ID: <20201009151540.GX5177@ziepe.ca>
References: <20201009150342.1979-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009150342.1979-1-christian.koenig@amd.com>
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
Cc: jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, willy@infradead.org,
 airlied@redhat.com, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDksIDIwMjAgYXQgMDU6MDM6MzdQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBQYXRjaCAiNDk1YzEwY2MxYzBjIENIUk9NSVVNOiBkbWEtYnVmOiByZXN0b3Jl
IGFyZ3MuLi4iCj4gYWRkcyBhIHdvcmthcm91bmQgZm9yIGEgYnVnIGluIG1tYXBfcmVnaW9uLgo+
IAo+IEFzIHRoZSBjb21tZW50IHN0YXRlcyAtPm1tYXAoKSBjYWxsYmFjayBjYW4gY2hhbmdlCj4g
dm1hLT52bV9maWxlIGFuZCBzbyB3ZSBtaWdodCBjYWxsIGZwdXQoKSBvbiB0aGUgd3JvbmcgZmls
ZS4KPiAKPiBSZXZlcnQgdGhlIHdvcmthcm91bmQgYW5kIHByb3BlciBmaXggdGhpcyBpbiBtbWFw
X3JlZ2lvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4gIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAyMiArKysrKy0t
LS0tLS0tLS0tLS0tLS0tCj4gIG1tL21tYXAuYyAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1h
LWJ1Zi5jCj4gaW5kZXggYTZiYTRkNTk4ZjBlLi5lZGQ1NzQwMmE0OGEgMTAwNjQ0Cj4gKysrIGIv
ZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+IEBAIC0xMTQzLDkgKzExNDMsNiBAQCBFWFBPUlRf
U1lNQk9MX0dQTChkbWFfYnVmX2VuZF9jcHVfYWNjZXNzKTsKPiAgaW50IGRtYV9idWZfbW1hcChz
dHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAgCQkg
dW5zaWduZWQgbG9uZyBwZ29mZikKPiAgewo+IC0Jc3RydWN0IGZpbGUgKm9sZGZpbGU7Cj4gLQlp
bnQgcmV0Owo+IC0KPiAgCWlmIChXQVJOX09OKCFkbWFidWYgfHwgIXZtYSkpCj4gIAkJcmV0dXJu
IC1FSU5WQUw7Cj4gIAo+IEBAIC0xMTYzLDIyICsxMTYwLDEzIEBAIGludCBkbWFfYnVmX21tYXAo
c3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gIAkJ
cmV0dXJuIC1FSU5WQUw7Cj4gIAo+ICAJLyogcmVhZGp1c3QgdGhlIHZtYSAqLwo+IC0JZ2V0X2Zp
bGUoZG1hYnVmLT5maWxlKTsKPiAtCW9sZGZpbGUgPSB2bWEtPnZtX2ZpbGU7Cj4gLQl2bWEtPnZt
X2ZpbGUgPSBkbWFidWYtPmZpbGU7Cj4gLQl2bWEtPnZtX3Bnb2ZmID0gcGdvZmY7Cj4gKwlpZiAo
dm1hLT52bV9maWxlKQo+ICsJCWZwdXQodm1hLT52bV9maWxlKTsKClRoaXMgaWYgaXMgcmVkdW5k
YW50IHRvbwoKQnV0IG90aGVyd2lzZQoKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdn
QG52aWRpYS5jb20+CgpUaGFua3MsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
