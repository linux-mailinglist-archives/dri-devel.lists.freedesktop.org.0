Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E83F104E26
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00616EBC2;
	Thu, 21 Nov 2019 08:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECE26EBC2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:39:27 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd64d3b0000>; Thu, 21 Nov 2019 00:39:23 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 Nov 2019 00:39:27 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 Nov 2019 00:39:27 -0800
Received: from [10.2.169.101] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 08:39:26 +0000
Subject: Re: [PATCH v7 06/24] goldish_pipe: rename local pin_user_pages()
 routine
To: Christoph Hellwig <hch@infradead.org>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-7-jhubbard@nvidia.com>
 <20191121080831.GD30991@infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <ca78671b-4ce6-05f6-01ae-2d0b79810956@nvidia.com>
Date: Thu, 21 Nov 2019 00:36:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121080831.GD30991@infradead.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574325563; bh=IjAmlqSQ50mtR26fvAkI3XcKPC6M4/uU5ND8d4hZ9sk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=GJ7FLsOPPSpCRACz8ISfrqvd6vXd1a++lXIZbI549CHSZBewXeafsw0KWGYiFyEQk
 AjT450/QZ9YlyRa61hUCDn7RU+Oc8PL9dGnNibH+8bRoPgHv7Hz9Gs/GqPZ/w8xTGJ
 UkFV63r7a5GxMQEBp17Bq1eVxtVmga7DN1IyZXoIl4Zpf7mXrb2vg8FAmf6Cu6rI6y
 ak3fa9vBD/bNjvt15SEsNGr7fQAZcfHOLD1JwudJ1lf0vZTrImmtVmX/zYP64flAJZ
 dWmb9NYUnY/5E0dPUahr3TtiO6k8/kvovVBf9GgTEDfKn0Ljy0UH2gpWXn36gxJ8fZ
 1KUFjQ7Bhke0w==
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
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMjEvMTkgMTI6MDggQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE9uIFdlZCwg
Tm92IDIwLCAyMDE5IGF0IDExOjEzOjM2UE0gLTA4MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPj4g
K3N0YXRpYyBpbnQgcGluX2dvbGRmaXNoX3BhZ2VzKHVuc2lnbmVkIGxvbmcgZmlyc3RfcGFnZSwK
Pj4gKwkJCSAgICAgIHVuc2lnbmVkIGxvbmcgbGFzdF9wYWdlLAo+PiArCQkJICAgICAgdW5zaWdu
ZWQgaW50IGxhc3RfcGFnZV9zaXplLAo+PiArCQkJICAgICAgaW50IGlzX3dyaXRlLAo+PiArCQkJ
ICAgICAgc3RydWN0IHBhZ2UgKnBhZ2VzW01BWF9CVUZGRVJTX1BFUl9DT01NQU5EXSwKPj4gKwkJ
CSAgICAgIHVuc2lnbmVkIGludCAqaXRlcl9sYXN0X3BhZ2Vfc2l6ZSkKPiAKPiBXaHkgbm90IGdv
bGRmaXNoX3Bpbl9wYWdlcz8gIE5vcm1hbGx5IHdlIHB1dCB0aGUgbW9kdWxlIC8gc3Vic3lzdGVt
Cj4gaW4gZnJvbnQuCgpIZWgsIGlzIHRoYXQgaG93IGl0J3Mgc3VwcG9zZWQgdG8gZ28/ICBTdXJl
LCBJJ2xsIGNoYW5nZSBpdC4gOikKCj4gCj4gQWxzbyBjYW4gd2UgZ2V0IHRoaXMgcXVldWVkIHVw
IGZvciA1LjUgdG8gZ2V0IHNvbWUgdHJpdmlhbCBjaGFuZ2VzCj4gb3V0IG9mIHRoZSB3YXk/Cj4g
CgpJcyB0aGF0IGEgcXVlc3Rpb24gdG8gQW5kcmV3LCBvciBhIHJlcXVlc3QgZm9yIG1lIHRvIHNl
bmQgdGhpcyBhcyBhCnNlcGFyYXRlIHBhdGNoIGVtYWlsIChvciBib3RoKT8KCgp0aGFua3MsCi0t
IApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
