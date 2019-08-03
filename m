Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC0F804D4
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 09:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86E96E46E;
	Sat,  3 Aug 2019 07:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C266E46E;
 Sat,  3 Aug 2019 07:06:49 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08D01206A2;
 Sat,  3 Aug 2019 07:06:49 +0000 (UTC)
Date: Sat, 3 Aug 2019 09:06:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: john.hubbard@gmail.com
Subject: Re: [PATCH 15/34] staging/vc04_services: convert put_page() to
 put_user_page*()
Message-ID: <20190803070621.GA2508@kroah.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-16-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802022005.5117-16-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564816009;
 bh=pPLKovyN1NMpp946XJreXv1Y0yg1S4P9Y162ukSMn64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rlojk96gVoiyivb+U7yrIkDTuHtioqnhmcEmMjAk1MQVJmXSmgcGRpi/2JLag+Dd6
 M19hr//PiOu9iNAJPJwAfgv2wtT5dx2nyCeRHoSIIHS1qKxvoiJQ2X4AR13zqgfnZk
 KxaPAYdBHbY01Ff9SDG1UhnB5NnA5pYpWqC1XkA0=
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
 sparclinux@vger.kernel.org, Suniel Mahesh <sunil.m@techveda.org>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
 Mihaela Muraru <mihaela.muraru21@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 Sidong Yang <realwakka@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, Kishore KP <kishore.p@techveda.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDc6MTk6NDZQTSAtMDcwMCwgam9obi5odWJiYXJkQGdt
YWlsLmNvbSB3cm90ZToKPiBGcm9tOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+
Cj4gCj4gRm9yIHBhZ2VzIHRoYXQgd2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCks
IHJlbGVhc2UgdGhvc2UgcGFnZXMKPiB2aWEgdGhlIG5ldyBwdXRfdXNlcl9wYWdlKigpIHJvdXRp
bmVzLCBpbnN0ZWFkIG9mIHZpYSBwdXRfcGFnZSgpIG9yCj4gcmVsZWFzZV9wYWdlcygpLgo+IAo+
IFRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmliZWQgaW4gY29t
bWl0IGZjMWQ4ZTdjY2EyZAo+ICgibW06IGludHJvZHVjZSBwdXRfdXNlcl9wYWdlKigpLCBwbGFj
ZWhvbGRlciB2ZXJzaW9ucyIpLgo+IAo+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0
Pgo+IENjOiBTdGVmYW4gV2FocmVuIDxzdGVmYW4ud2FocmVuQGkyc2UuY29tPgo+IENjOiBHcmVn
IEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBNaWhhZWxh
IE11cmFydSA8bWloYWVsYS5tdXJhcnUyMUBnbWFpbC5jb20+Cj4gQ2M6IFN1bmllbCBNYWhlc2gg
PHN1bmlsLm1AdGVjaHZlZGEub3JnPgo+IENjOiBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9y
Zy51az4KPiBDYzogU2lkb25nIFlhbmcgPHJlYWx3YWtrYUBnbWFpbC5jb20+Cj4gQ2M6IEtpc2hv
cmUgS1AgPGtpc2hvcmUucEB0ZWNodmVkYS5vcmc+Cj4gQ2M6IGxpbnV4LXJwaS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBDYzogZGV2ZWxAZHJpdmVyZGV2Lm9zdW9zbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gLS0tCj4gIC4uLi92YzA0X3NlcnZpY2Vz
L2ludGVyZmFjZS92Y2hpcV9hcm0vdmNoaXFfMjgzNV9hcm0uYyB8IDEwICsrLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCkFja2VkLWJ5
OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
