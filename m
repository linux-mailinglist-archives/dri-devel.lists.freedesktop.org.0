Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DED7EE50
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D656ECEB;
	Fri,  2 Aug 2019 08:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9118F6E8BE;
 Fri,  2 Aug 2019 08:06:23 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1htSZZ-0007h0-0W; Fri, 02 Aug 2019 08:05:57 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8B3D42029F4CB; Fri,  2 Aug 2019 10:05:54 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:05:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: john.hubbard@gmail.com
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
Message-ID: <20190802080554.GD2332@hirez.programming.kicks-ass.net>
References: <20190802021653.4882-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802021653.4882-1-jhubbard@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oQGkgX+xjP5mcvxvnZUNTJDjzsROZ8JGq6RAdmO4uPA=; b=Kn7zyiwFYY1w4GG19f5Z+fxXG
 rpdCjyayz/9gviyRYspgLpeSBWC2GfVoCY+63/ODQnmLa1Ss8JkqUpftu3V0chMAiw/KlU2kDYgEh
 oR5YKgy/zWb5/EAWdvNxCcTyybQ/h6IZloFk2u58KpdWjALZ6VxSlYgO9NyD6ORVH0k4+/SJs5gc5
 s9u9DnNkq+UczyxB+jcY/9wLHc7m1xooYunausG0HwlgSx5YAgAGjYk+/D776D8302Y3gySch17HH
 NqaNqFjlPIzia2+bWk3vao3mV6/a02u4eJ9MN9jE/yE1oy7yiEOCMpBpQIwm2mrZk60vD3Q8D3Ve6
 97+ImnTKw==;
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDc6MTY6MTlQTSAtMDcwMCwgam9obi5odWJiYXJkQGdt
YWlsLmNvbSB3cm90ZToKCj4gVGhpcyBpcyBwYXJ0IGEgdHJlZS13aWRlIGNvbnZlcnNpb24sIGFz
IGRlc2NyaWJlZCBpbiBjb21taXQgZmMxZDhlN2NjYTJkCj4gKCJtbTogaW50cm9kdWNlIHB1dF91
c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuIFRoYXQgY29tbWl0Cj4gaGFzIGFu
IGV4dGVuc2l2ZSBkZXNjcmlwdGlvbiBvZiB0aGUgcHJvYmxlbSBhbmQgdGhlIHBsYW5uZWQgc3Rl
cHMgdG8KPiBzb2x2ZSBpdCwgYnV0IHRoZSBoaWdobGl0ZXMgYXJlOgoKVGhhdCBpcyBvbmUgaG9y
cmlkbHkgbWFuZ2xlZCBDaGFuZ2Vsb2cgdGhlcmUgOi0vIEl0IGxvb2tzIGxpa2UgaXQncwpwYXJ0
aWFsbHkgZHVwbGljYXRlZC4KCkFueXdheTsgbm8gb2JqZWN0aW9ucyB0byBhbnkgb2YgdGhhdCwg
YnV0IEkganVzdCB3YW50ZWQgdG8gbWVudGlvbiB0aGF0CnRoZXJlIGFyZSBvdGhlciBwcm9ibGVt
cyB3aXRoIGxvbmcgdGVybSBwaW5uaW5nIHRoYXQgaGF2ZW4ndCBiZWVuCm1lbnRpb25lZCwgbm90
YWJseSB0aGV5IGluaGliaXQgY29tcGFjdGlvbi4KCkEgbG9uZyB0aW1lIGFnbyBJIHByb3Bvc2Vk
IGFuIGludGVyZmFjZSB0byBtYXJrIHBhZ2VzIGFzIHBpbm5lZCwgc3VjaAp0aGF0IHdlIGNvdWxk
IHJ1biBjb21wYWN0aW9uIGJlZm9yZSB3ZSBhY3R1YWxseSBkaWQgdGhlIHBpbm5pbmcuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
