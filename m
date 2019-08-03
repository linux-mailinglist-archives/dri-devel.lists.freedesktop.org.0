Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13CC804D7
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 09:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FEE6E484;
	Sat,  3 Aug 2019 07:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A42A6E46F;
 Sat,  3 Aug 2019 07:06:52 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 756402173E;
 Sat,  3 Aug 2019 07:06:51 +0000 (UTC)
Date: Sat, 3 Aug 2019 09:06:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: john.hubbard@gmail.com
Subject: Re: [PATCH 10/34] genwqe: convert put_page() to put_user_page*()
Message-ID: <20190803070640.GB2508@kroah.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-11-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802022005.5117-11-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564816011;
 bh=fAm+JJVlEEdZsZEnQU6VmG7AlISaD9fVfUjXl/e9MGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EvBQbY6tUIAsZP4MFxGmLRqZJjlnz59fmNMbvE0jfno1B+JXE+PNryIyzSAnXbr8N
 +lgw4Y3y5zL8NJKrLYjFHjBcr6/6qlTB3yc6rbylv5fVS7aSSqYd41B1eBmWwcN4jJ
 e48QvmU3i/Btia6YyxF5rYYxbA6/qQXbJH8nGzR0=
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
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Frank Haverkamp <haver@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDc6MTk6NDFQTSAtMDcwMCwgam9obi5odWJiYXJkQGdt
YWlsLmNvbSB3cm90ZToKPiBGcm9tOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+
Cj4gCj4gRm9yIHBhZ2VzIHRoYXQgd2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCks
IHJlbGVhc2UgdGhvc2UgcGFnZXMKPiB2aWEgdGhlIG5ldyBwdXRfdXNlcl9wYWdlKigpIHJvdXRp
bmVzLCBpbnN0ZWFkIG9mIHZpYSBwdXRfcGFnZSgpIG9yCj4gcmVsZWFzZV9wYWdlcygpLgo+IAo+
IFRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmliZWQgaW4gY29t
bWl0IGZjMWQ4ZTdjY2EyZAo+ICgibW06IGludHJvZHVjZSBwdXRfdXNlcl9wYWdlKigpLCBwbGFj
ZWhvbGRlciB2ZXJzaW9ucyIpLgo+IAo+IFRoaXMgY2hhbmdlcyB0aGUgcmVsZWFzZSBjb2RlIHNs
aWdodGx5LCBiZWNhdXNlIGVhY2ggcGFnZSBzbG90IGluIHRoZQo+IHBhZ2VfbGlzdFtdIGFycmF5
IGlzIG5vIGxvbmdlciBjaGVja2VkIGZvciBOVUxMLiBIb3dldmVyLCB0aGF0IGNoZWNrCj4gd2Fz
IHdyb25nIGFueXdheSwgYmVjYXVzZSB0aGUgZ2V0X3VzZXJfcGFnZXMoKSBwYXR0ZXJuIG9mIHVz
YWdlIGhlcmUKPiBuZXZlciBhbGxvd2VkIGZvciBOVUxMIGVudHJpZXMgd2l0aGluIGEgcmFuZ2Ug
b2YgcGlubmVkIHBhZ2VzLgo+IAo+IENjOiBGcmFuayBIYXZlcmthbXAgPGhhdmVyQGxpbnV4LnZu
ZXQuaWJtLmNvbT4KPiBDYzogIkd1aWxoZXJtZSBHLiBQaWNjb2xpIiA8Z3BpY2NvbGlAbGludXgu
dm5ldC5pYm0uY29tPgo+IENjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IENjOiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9taXNjL2dlbndxZS9jYXJkX3V0aWxzLmMgfCAxNyArKystLS0tLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
