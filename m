Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AA8EBEEF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B616F74D;
	Fri,  1 Nov 2019 08:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CF16F6A8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 00:48:37 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbb80eb0000>; Thu, 31 Oct 2019 17:48:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 31 Oct 2019 17:48:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 31 Oct 2019 17:48:37 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 1 Nov
 2019 00:48:36 +0000
Subject: Re: [PATCH 19/19] Documentation/vm: add pin_user_pages.rst
To: Ira Weiny <ira.weiny@intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-20-jhubbard@nvidia.com>
 <20191031234922.GM14771@iweiny-DESK2.sc.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <8f92713c-7df8-9463-93f2-40967eba27b5@nvidia.com>
Date: Thu, 31 Oct 2019 17:48:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191031234922.GM14771@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572569323; bh=5RHzCGcb3FFZzaA/uQgYrgLcorAAk8gLyrsrWdqCg0c=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jb4OmT2UIK+29Kq6gyh3/B0GMYEYeQey6Q7av8aHODFF7iM3g87GXz+0+crrEhDuP
 ES91FHKZ2TRd6nelEsvX1Ees+632xFVXWCQcNiNfBlThFOHS+Mq1DZ+VJ6HtPA43u6
 Ynb5UhoXiX2+2DJcjRCsgJU7otXcWVOJr09yZe43vdQrzd13x1b0cKY4hBXDGaRMUL
 j+EkbcXcmrT2jSkaz6YzKoEolu/+k4osy9BAQew7kbxk+1/wC4eflk8358pt5RFQn7
 yh6waII5ieUtayl8B5UKc7eHNJXPir5mjj/cq3SpudLXylqcwjl1IrKdwtTrjKlzPg
 OjOeqmfrEDTrQ==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMzEvMTkgNDo0OSBQTSwgSXJhIFdlaW55IHdyb3RlOgo+IE9uIFdlZCwgT2N0IDMwLCAy
MDE5IGF0IDAzOjQ5OjMwUE0gLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKLi4uCj4+ICtUT0RP
OiBUaGVyZSBpcyBhbHNvIGEgc3BlY2lhbCBjYXNlIHdoZW4gdGhlIHBhZ2VzIGFyZSBEQVggcGFn
ZXM6IGluIGFkZGl0aW9uIHRvCj4+ICt0aGUgYWJvdmUgZmxhZ3MsIHRoZSBjYWxsZXIgbmVlZHMg
c29tZXRoaW5nIGxpa2UgYSBsYXlvdXQgbGVhc2Ugb24gdGhlCj4+ICthc3NvY2lhdGVkIGZpbGUu
IFRoaXMgaXMgeWV0IHRvIGJlIGltcGxlbWVudGVkLiBXaGVuIGl0IGlzIGltcGxlbWVudGVkLCBp
dCdzCj4+ICtleHBlY3RlZCB0aGF0IHRoZSBsZWFzZSB3aWxsIGJlIGEgcHJlcmVxdWlzaXRlIHRv
IHNldHRpbmcgRk9MTF9MT05HVEVSTS4KPiAKPiBGb3Igbm93IHdlIHByb2JhYmx5IHdhbnQgdG8g
bGVhdmUgdGhpcyBub3RlIG91dCB1bnRpbCB3ZSBmaWd1cmUgb3V0IGhvdyB0aGlzIGlzCj4gZ29p
bmcgdG8gd29yay4gIEJlc3QgdG8gc2F5IHNvbWV0aGluZyBsaWtlOgo+IAo+IFNvbWUgcGFnZXMs
IHN1Y2ggYXMgREFYIHBhZ2VzLCBjYW4ndCBiZSBwaW5uZWQgd2l0aCBsb25ndGVybSBwaW5zIGFu
ZCB3aWxsCj4gZmFpbC4KPiAKCk9LLCBJIGhhdmUgdGhpcyB3b3JkaW5nIHF1ZXVlZCB1cCBmb3Ig
dGhlIHYyIHBhdGNoOgoKTk9URTogU29tZSBwYWdlcywgc3VjaCBhcyBEQVggcGFnZXMsIGNhbm5v
dCBiZSBwaW5uZWQgd2l0aCBsb25ndGVybSBwaW5zLiBUaGF0J3MKYmVjYXVzZSBEQVggcGFnZXMg
ZG8gbm90IGhhdmUgYSBzZXBhcmF0ZSBwYWdlIGNhY2hlLCBhbmQgc28gInBpbm5pbmciIGltcGxp
ZXMKbG9ja2luZyBkb3duIGZpbGUgc3lzdGVtIGJsb2Nrcywgd2hpY2ggaXMgbm90ICh5ZXQpIHN1
cHBvcnRlZCBpbiB0aGF0IHdheS4KCgp0aGFua3MsCgpKb2huIEh1YmJhcmQKTlZJRElBCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
