Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC54127FB49
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F376E86A;
	Thu,  1 Oct 2020 08:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4689589DB8;
 Wed, 30 Sep 2020 15:40:26 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f74a6830001>; Wed, 30 Sep 2020 08:38:43 -0700
Received: from [172.27.13.156] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 15:40:18 +0000
Subject: Re: [PATCH rdma-next v4 4/4] RDMA/umem: Move to allocate SG table
 from pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20200927064647.3106737-1-leon@kernel.org>
 <20200927064647.3106737-5-leon@kernel.org>
 <20200929195929.GA803555@nvidia.com> <20200930095321.GL3094@unreal>
 <20200930114527.GE816047@nvidia.com>
 <80c49ff1-52c7-638f-553f-9de8130b188d@nvidia.com>
 <20200930115837.GF816047@nvidia.com>
 <7e09167f-c57a-cdfe-a842-c920e9421e53@nvidia.com>
 <20200930151406.GM816047@nvidia.com>
From: Maor Gottlieb <maorg@nvidia.com>
Message-ID: <086a82d3-fd3a-7160-dba4-c7b223585b88@nvidia.com>
Date: Wed, 30 Sep 2020 18:40:15 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200930151406.GM816047@nvidia.com>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601480324; bh=q/MX2HPw+Rl/oCY6oRvBsm/gn1tjQ5WhgRmOnWsAgQA=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=WaVIxgyVk3b9bgUcy85wupDJhbbDtGuPqHhr8jyeRr1uTOTwPSn80cEQrT2VOHqgO
 V22dizW+QUZgEduNkEJDaPoCQxGyxuLgvEVVDNSShG1qgWKQng8Nm/usd/GFlZRFfx
 CnNMioOZOhW8AYxa+gyh+TiWnPzfJSgsIotUhHtpoxBcs2LEsS/xvvCBS441nIJT+9
 jDa9BufMDv2CW7O5OP72rhLeXweRy1sB/RbvVFOvruWdozkaqS2TG6T5EAs+xAnf/a
 uWEk9j6KrRowRZKFMYqnJXa6UqzUJr/iKZUhLABwhFOi4SxRKt8TxXB7eS2LlK/kWc
 zJqt9g7z1xCJw==
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, Tvrtko
 Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMzAvMjAyMCA2OjE0IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2VkLCBT
ZXAgMzAsIDIwMjAgYXQgMDY6MDU6MTVQTSArMDMwMCwgTWFvciBHb3R0bGllYiB3cm90ZToKPj4g
VGhpcyBpcyByaWdodCBvbmx5IGZvciB0aGUgbGFzdCBpdGVyYXRpb24uIEUuZy4gaW4gdGhlIGZp
cnN0IGl0ZXJhdGlvbiBpbgo+PiBjYXNlIHRoYXQgdGhlcmUgYXJlIG1vcmUgcGFnZXMgKGxlZnRf
cGFnZXMpLCB0aGVuIHdlIGFsbG9jYXRlCj4+IFNHX01BWF9TSU5HTEVfQUxMT0MuwqAgV2UgZG9u
J3Qga25vdyBob3cgbWFueSBwYWdlcyBmcm9tIHRoZSBzZWNvbmQgaXRlcmF0aW9uCj4+IHdpbGwg
YmUgc3F1YXNoZWQgdG8gdGhlIFNHRSBmcm9tIHRoZSBmaXJzdCBpdGVyYXRpb24uCj4gV2VsbCwg
aXQgaXMgMCBvciAxIFNHRSdzLiBDaGVjayBpZiB0aGUgZmlyc3QgcGFnZSBpcyBtZXJnYWJsZSBh
bmQKPiBzdWJ0cmFjdCBvbmUgZnJvbSB0aGUgcmVxdWlyZWQgbGVuZ3RoPwo+Cj4gSSBkaXNsaWtl
IHRoaXMgc2dfbWFya19lbmQoKSBpdCBpcyBzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUgaW50ZXJu
YWwsCj4gSU1ITy4KCkkgY2FuIG1vdmUgaXQgdG8gX19zZ19hbGxvY190YWJsZV9mcm9tX3BhZ2Vz
OgoKIMKgwqDCoMKgwqDCoMKgIHNndC0+bmVudHMgPSB0bXBfbmVudHM7CisgaWYgKCFsZWZ0X3Bh
Z2VzKQorwqDCoMKgwqDCoMKgwqDCoCBzZ19tYXJrX2VuZChzKTsKIMKgb3V0OgogwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIHM7Cgo+Cj4gSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
