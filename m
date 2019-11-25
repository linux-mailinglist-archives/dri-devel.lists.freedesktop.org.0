Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E20410948E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 21:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C2989F61;
	Mon, 25 Nov 2019 20:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278DF89F61
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 20:13:57 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ddc36070000>; Mon, 25 Nov 2019 12:14:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 25 Nov 2019 12:13:56 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 25 Nov 2019 12:13:56 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 20:13:55 +0000
Subject: Re: [PATCH 07/19] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: kbuild test robot <lkp@intel.com>
References: <20191125042011.3002372-8-jhubbard@nvidia.com>
 <201911251639.UWS3hE3Y%lkp@intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <3989f406-c333-59f8-027a-e3506af59028@nvidia.com>
Date: Mon, 25 Nov 2019 12:13:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <201911251639.UWS3hE3Y%lkp@intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574712840; bh=xIrvhzi9FQlGBM90SU8S2M4hsd9JLL89vrPzYePQebc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=nLQ5e77gFGxdvd47gRiRGHQbc1wVG8bwNbuGbyST1Q+jBowT4WflUsZ9otzD54lLB
 J2wcW1AWxZ1vtAVadAvnnzHYEB9/RMQVx2Q02xRhkx6jKeVYJqp1Vzd24M3MZT/KvC
 2r/IXfhmoHhQNFs1s+Ijlm3sbCcfcCTqQLXfh/u6EJodBjYv13WjZ+5uA/qpRqF5KJ
 cgfhkSAYwIIVs+guU8WDjo4g7p8fk0VqKWKusesTvojs5xnlpb4TJcK/V2onbK8LWW
 ksqnqfXGTA8sAX8XklRUC+OhMkFBYvdHQY7BxmxtkVVkFbYIpBRqVJEp1i5QjV+FwU
 IkbF7UmcnHQ6g==
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>, Jens Axboe <axboe@kernel.dk>,
 kbuild-all@lists.01.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMjUvMTkgMTI6NDQgQU0sIGtidWlsZCB0ZXN0IHJvYm90IHdyb3RlOgo+IEhpIEpvaG4s
Cj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2ghIFlldCBzb21ldGhpbmcgdG8gaW1wcm92ZToK
PiAKPiBbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIHJkbWEvZm9yLW5leHRdCj4gW2Nhbm5vdCBh
cHBseSB0byB2NS40IG5leHQtMjAxOTExMjJdCj4gW2lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0
byB0aGUgd3JvbmcgZ2l0IHRyZWUsIHBsZWFzZSBkcm9wIHVzIGEgbm90ZSB0byBoZWxwCj4gaW1w
cm92ZSB0aGUgc3lzdGVtLiBCVFcsIHdlIGFsc28gc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgb3B0
aW9uIHRvIHNwZWNpZnkgdGhlCj4gYmFzZSB0cmVlIGluIGdpdCBmb3JtYXQtcGF0Y2gsIHBsZWFz
ZSBzZWUgaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9hLzM3NDA2OTgyXQo+IAo+IHVybDogICAg
aHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0cy9Kb2huLUh1YmJhcmQvcGlu
X3VzZXJfcGFnZXMtcmVkdWNlZC1yaXNrLXNlcmllcy1mb3ItTGludXgtNS01LzIwMTkxMTI1LTEy
NTYzNwo+IGJhc2U6ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvcmRtYS9yZG1hLmdpdCBmb3ItbmV4dAo+IGNvbmZpZzogYXJtLXJhbmRjb25maWctYTAw
MS0yMDE5MTEyNSAoYXR0YWNoZWQgYXMgLmNvbmZpZykKPiBjb21waWxlcjogYXJtLWxpbnV4LWdu
dWVhYmktZ2NjIChHQ0MpIDcuNC4wCj4gcmVwcm9kdWNlOgo+ICAgICAgICAgd2dldCBodHRwczov
L3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaW50ZWwvbGtwLXRlc3RzL21hc3Rlci9zYmluL21h
a2UuY3Jvc3MgLU8gfi9iaW4vbWFrZS5jcm9zcwo+ICAgICAgICAgY2htb2QgK3ggfi9iaW4vbWFr
ZS5jcm9zcwo+ICAgICAgICAgIyBzYXZlIHRoZSBhdHRhY2hlZCAuY29uZmlnIHRvIGxpbnV4IGJ1
aWxkIHRyZWUKPiAgICAgICAgIEdDQ19WRVJTSU9OPTcuNC4wIG1ha2UuY3Jvc3MgQVJDSD1hcm0g
Cj4gCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZwo+IFJl
cG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiAKPiBBbGwgZXJy
b3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6Cj4gCj4gICAgbW0vZ3VwLm86IEluIGZ1bmN0
aW9uIGBwaW5fdXNlcl9wYWdlc19yZW1vdGUnOgo+Pj4gbW0vZ3VwLmM6MjUyODogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgZ2V0X3VzZXJfcGFnZXNfcmVtb3RlJwo+IAo+IHZpbSArMjUyOCBtbS9n
dXAuYwoKClRoaXMsIGFuZCB0aGUgb3RoZXIgKHNoKSByZXBvcnQsIGlzIGR1ZSB0byAhQ09ORklH
X01NVSBsYWNraW5nIGEgZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKCksIApidXQgcGluX3VzZXJfcGFn
ZXNfcmVtb3RlKCkgbmVlZHMgaXQgZm9yIGEgKHRlbXBvcmFyeSkgaW1wbGVtZW50YXRpb24uIEkn
bGwgcG9zdCB0aGUgZml4LCAKaW4gdjIuCgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJ
QQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
