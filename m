Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D923E87F0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 13:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F68C6E26F;
	Tue, 29 Oct 2019 12:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57C06E267;
 Tue, 29 Oct 2019 12:19:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 05:19:25 -0700
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="203547917"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.206.224])
 ([10.254.206.224])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 29 Oct 2019 05:19:21 -0700
Subject: Re: [PATCH v2 06/15] RDMA/hfi1: Use mmu_range_notifier_inset for
 user_exp_rcv
To: Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-7-jgg@ziepe.ca>
From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <a8644875-9133-9667-c04b-b40c296d68eb@intel.com>
Date: Tue, 29 Oct 2019 08:19:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028201032.6352-7-jgg@ziepe.ca>
Content-Language: en-US
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
Cc: Juergen Gross <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMjgvMjAxOSA0OjEwIFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gRnJvbTogSmFz
b24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IFRoaXMgY29udmVydHMgb25lIG9m
IHRoZSB0d28gdXNlcnMgb2YgbW11X25vdGlmaWVycyB0byB1c2UgdGhlIG5ldyBBUEkuCj4gVGhl
IGNvbnZlcnNpb24gaXMgZmFpcmx5IHN0cmFpZ2h0Zm9yd2FyZCwgaG93ZXZlciB0aGUgZXhpc3Rp
bmcgdXNlIG9mCj4gbm90aWZpZXJzIGhlcmUgc2VlbXMgdG8gYmUgcmFjZXkuCj4gCj4gQ2M6IE1p
a2UgTWFyY2luaXN6eW4gPG1pa2UubWFyY2luaXN6eW5AaW50ZWwuY29tPgo+IENjOiBEZW5uaXMg
RGFsZXNzYW5kcm8gPGRlbm5pcy5kYWxlc3NhbmRyb0BpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKSSB0ZXN0ZWQgdjEsIGFuZCBy
ZXBsaWVkIHRvIGl0IFsxXS4gSSBjYW4gcmUtdGVzdCB3aXRoIHRoaXMgdmVyc2lvbiBpZiAKeW91
IGxpa2UgYXMgd2VsbC4KClsxXSBodHRwczovL21hcmMuaW5mby8/bD1saW51eC1yZG1hJm09MTU3
MjM1MTMwNjA2NDEyJnc9MgoKLURlbm55Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
