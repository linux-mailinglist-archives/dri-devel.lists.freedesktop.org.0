Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6B6F41B5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F766F86C;
	Fri,  8 Nov 2019 08:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13806F7A6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 20:36:31 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id o49so3858882qta.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 12:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=71LM+xH1wkNpW127vr6ZxQkFrR5SvDtsBzUQHq660ZY=;
 b=dZ7KW96ugV2btAJy9KefEXY3QOLKeeI2YsRo+9EQy7X+6NOsRC+l4+3Yl5ROvAbC5e
 EQ4ejY/002Us9IQOIwdqCMuh0+9vW0l+DqddtBP4SUcvYlDFYPDTPTqHZSMFnnvOWzPT
 C+GYJmKDuJ2LD8I61C9QnBmMWAz64NP8Zt6t2TVWiHeTkeDzfTODkLFcMA5Hgyo4CjTl
 4KFBBlmCs44WjgWMe41/g/MwOwoFUA5MvNyDCbWsrORjoABaQfVHxQu6ez5ZIEFD+9aq
 3u88q2KtVG5dlE9U5WIQ95Kl+POP8zmrSFXHtw11fOIpFY/zG8fdICJO5upJSs7JYHYh
 NcWA==
X-Gm-Message-State: APjAAAVoK/erWF73OncE84yhcE9TCFFXdBv+OARzOwFr0cxzFgAtUBrP
 4gYFsEdvOenMx4KJyIQLHgG7sw==
X-Google-Smtp-Source: APXvYqyNBsBryLeEi7SIRoAPqzH4cK3zfUarxZiwLJPOIp00fgPi4tyHDHRm5q/vs9/sR4SDhwZ/Hw==
X-Received: by 2002:ac8:67d9:: with SMTP id r25mr6108730qtp.7.1573158991013;
 Thu, 07 Nov 2019 12:36:31 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id q17sm2194836qtq.58.2019.11.07.12.36.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 Nov 2019 12:36:30 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iSoW5-0000Io-Qj; Thu, 07 Nov 2019 16:36:29 -0400
Date: Thu, 7 Nov 2019 16:36:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 09/15] xen/gntdev: use mmu_range_notifier_insert
Message-ID: <20191107203629.GF6730@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-10-jgg@ziepe.ca>
 <3938b588-c6c5-3bd1-8ea9-47e4d5b2045c@oracle.com>
 <20191105023108.GN22766@mellanox.com>
 <a62e58f6-d98b-1feb-d0ca-fb8210f3e831@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a62e58f6-d98b-1feb-d0ca-fb8210f3e831@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=71LM+xH1wkNpW127vr6ZxQkFrR5SvDtsBzUQHq660ZY=;
 b=D3bFpO22vYKzoP0y0kJzENmUIyEWWuBeZdrbWOd1NSHyV6jshwYAek9v0UQlPVNFPm
 gMM8Mo2Kxc8gRUHzzjxaadcVCTPEcRYvCbAIX8OusFUjw7o9YpFUkiK3RoQQUeow2ms9
 eGazhDIo9mJpashFsikQQIbjd6TISyD1pZmFKifpX4Zhcl//XXhGcH3+Zo5Kzt51FlB3
 w1yAflYz0ICBGX3upadZlsBXvu1aRMmxOCzSLHPZYss2G0V4O2B7ESmEO3vtegVYkAKW
 tSKEpqMzverpHSnG3I+axEeI7kQum6AfY8LA3KuUKxqL3srA0wFn9Z1ou/8PeWVKM40a
 a1yA==
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
Cc: Juergen Gross <jgross@suse.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTA6MTY6NDZBTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgoKPiA+IFNvLCBJIHN1cHBvc2UgaXQgY2FuIGJlIHJlbGF4ZWQgdG8gYSBudWxsIHRl
c3QgYW5kIGEgV0FSTl9PTiB0aGF0IGl0Cj4gPiBoYXNuJ3QgY2hhbmdlZD8KPiAKPiBZb3UgbWVh
bgo+IAo+IGlmICh1c2VfcHRlbW9kKSB7Cj4gwqDCoMKgwqDCoMKgwqAgV0FSTl9PTihtYXAtPnZt
YSAhPSB2bWEpOwo+IMKgwqDCoMKgwqDCoMKgIC4uLgo+IAo+IAo+IFllcywgdGhhdCBzb3VuZHMg
Z29vZC4KCkkgYW1lbmRlZCBteSBjb3B5IG9mIHRoZSBwYXRjaCB3aXRoIHRoZSBhYm92ZSwgaGFz
IHRoaXMgcmV3b3JrIHNob3duCnNpZ25zIG9mIHdvcmtpbmc/CgpAQCAtNDM2LDcgKzQzNiw4IEBA
IHN0YXRpYyB2b2lkIGdudGRldl92bWFfY2xvc2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
CiAgICAgICAgc3RydWN0IGdudGRldl9wcml2ICpwcml2ID0gZmlsZS0+cHJpdmF0ZV9kYXRhOwog
CiAgICAgICAgcHJfZGVidWcoImdudGRldl92bWFfY2xvc2UgJXBcbiIsIHZtYSk7Ci0gICAgICAg
aWYgKHVzZV9wdGVtb2QgJiYgbWFwLT52bWEgPT0gdm1hKSB7CisgICAgICAgaWYgKHVzZV9wdGVt
b2QpIHsKKyAgICAgICAgICAgICAgIFdBUk5fT04obWFwLT52bWEgIT0gdm1hKTsKICAgICAgICAg
ICAgICAgIG1tdV9yYW5nZV9ub3RpZmllcl9yZW1vdmUoJm1hcC0+bm90aWZpZXIpOwogICAgICAg
ICAgICAgICAgbWFwLT52bWEgPSBOVUxMOwogICAgICAgIH0KCkphc29uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
