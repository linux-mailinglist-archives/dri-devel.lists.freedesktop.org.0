Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D399945627
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0615B8982E;
	Fri, 14 Jun 2019 07:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993E1892E4;
 Fri, 14 Jun 2019 01:46:33 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d02fc790000>; Thu, 13 Jun 2019 18:46:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 13 Jun 2019 18:46:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 13 Jun 2019 18:46:33 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 01:46:30 +0000
Subject: Re: [PATCH 04/22] mm: don't clear ->mapping in hmm_devmem_free
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe
 <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-5-hch@lst.de>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b0584ac6-72e3-08d3-6b76-1ac5e5b3bb4f@nvidia.com>
Date: Thu, 13 Jun 2019 18:46:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613094326.24093-5-hch@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:22:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560476793; bh=aWY+o31YpTUXYNCWR/tUiybGk+oQfQT9Eqi8enXkBOQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=hZ/DTJ5kKqWdpCL12ZwwtnQNfLWFCFSPcl2k46LOsH4pNokmtsOInOl9+GJ8FKmKO
 hXZGdDzxG+P+INltKZYs7MH3/UvgeCnHg5hunwwq2bHUiutlLY5os0Z0ZWt+qrOuk9
 K1Cep9JhG5g0OourqoO6QLKWzZukRM6NdlGEbmjrnoEWvH3YVwufa/VDbhQJ2OHW1T
 paLBoqcpz6yETgLWr50DBrY8lfihmvAJXfVj+3zCeNHjlAyMFyqJD9rLf7d5TUXr4L
 SqhY59v6TJmTfzJl0WQ5JTwHaXZZRXMzmrFJGWFYPUDt0cJm6MdR4wx/+QlT3y9K7k
 1VdCdX4iXd9+w==
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMy8xOSAyOjQzIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiAtPm1hcHBpbmcg
aXNuJ3QgZXZlbiB1c2VkIGJ5IEhNTSB1c2VycywgYW5kIHRoZSBmaWVsZCBhdCB0aGUgc2FtZSBv
ZmZzZXQKPiBpbiB0aGUgem9uZV9kZXZpY2UgcGFydCBvZiB0aGUgdW5pb24gaXMgZGVjbGFyZWQg
YXMgcGFkLiAgKFdoaWNoIGJ0dyBpcwo+IHJhdGhlciBjb25mdXNpbmcsIGFzIERBWCB1c2VzIC0+
cGdtYXAgYW5kIC0+bWFwcGluZyBmcm9tIHR3byBkaWZmZXJlbnQKPiBzaWRlcyBvZiB0aGUgdW5p
b24sIGJ1dCBEQVggZG9lc24ndCB1c2UgaG1tX2Rldm1lbV9mcmVlKS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgbW0vaG1tLmMgfCAy
IC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9t
bS9obW0uYyBiL21tL2htbS5jCj4gaW5kZXggMGM2MjQyNmQxMjU3Li5lMWRjOTg0MDdlN2IgMTAw
NjQ0Cj4gLS0tIGEvbW0vaG1tLmMKPiArKysgYi9tbS9obW0uYwo+IEBAIC0xMzQ3LDggKzEzNDcs
NiBAQCBzdGF0aWMgdm9pZCBobW1fZGV2bWVtX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UsIHZvaWQg
KmRhdGEpCj4gIHsKPiAgCXN0cnVjdCBobW1fZGV2bWVtICpkZXZtZW0gPSBkYXRhOwo+ICAKPiAt
CXBhZ2UtPm1hcHBpbmcgPSBOVUxMOwo+IC0KPiAgCWRldm1lbS0+b3BzLT5mcmVlKGRldm1lbSwg
cGFnZSk7Cj4gIH0KPiAgCj4gCgpZZXMsIEkgdGhpbmsgdGhhdCBsaW5lIHdhcyB1bm5lY2Vzc2Fy
eS4gSSBzZWUgZnJvbSBnaXQgaGlzdG9yeSB0aGF0IGl0IHdhcwpvcmlnaW5hbGx5IGJlaW5nIHNl
dCB0byBOVUxMIGZyb20gd2l0aGluIF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UoKSwgYW5kIHRo
ZW4KaW4gY29tbWl0IDJmYTE0N2JkYmY2NzJjNTMzODZhOGY1ZjJjN2ZlMzU4MDA0YzNlZjgsIERh
biBtb3ZlZCBpdCBvdXQgb2YgdGhlcmUsCmFuZCBzdGFzaGVkIGluIHNwZWNpZmljYWxseSBoZXJl
LiBCdXQgaXQgYXBwZWFycyB0byBoYXZlIGJlZW4gdW5uZWNlc3NhcnkgZnJvbQp0aGUgYmVnaW5u
aW5nLgoKUmV2aWV3ZWQtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4gCgp0
aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
