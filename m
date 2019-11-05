Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D238F05F7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3885D6EB67;
	Tue,  5 Nov 2019 19:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0677C6E049;
 Tue,  5 Nov 2019 15:13:53 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA5FB6HZ020516;
 Tue, 5 Nov 2019 15:13:31 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2w11rpy5s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Nov 2019 15:13:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA5FB6tt027055;
 Tue, 5 Nov 2019 15:13:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2w35pp2pd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Nov 2019 15:13:30 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA5FDSHx018497;
 Tue, 5 Nov 2019 15:13:29 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Nov 2019 07:13:28 -0800
Subject: Re: [PATCH v2 09/15] xen/gntdev: use mmu_range_notifier_insert
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-10-jgg@ziepe.ca>
 <3938b588-c6c5-3bd1-8ea9-47e4d5b2045c@oracle.com>
 <20191105023108.GN22766@mellanox.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <a62e58f6-d98b-1feb-d0ca-fb8210f3e831@oracle.com>
Date: Tue, 5 Nov 2019 10:16:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191105023108.GN22766@mellanox.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911050126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911050126
X-Mailman-Approved-At: Tue, 05 Nov 2019 19:26:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=IS23bB3dvrDkb9+06HwcoH/lIKWxN9p5igxhiyurBKo=;
 b=GV+k4R8sw6t1Yt7enHJveBGuTNPYGPdxhAKVqoJ6ySbC3nV3vnHPcFzyApY4gNhapbO6
 dd1TgMCPWZGUx67dpf+HjPX7LGqfh3A6TPKBaywdde80jIFzJngIaLAFeLGEFZGWikDH
 2PvVdOW96ljYQVSQufKxOzbj+uR7L3ARQRtZc920e3rHmdgQA3uh8rmVLY5Znwjm8mO9
 d14zZHTbCkFl4M6pyjtKV/8V63pNpRwqGGHwlIEuR2zfagn9NjrrYio1Lgk7N2jOzjmY
 5fCVnNGqeNtW7vsIRgUQggfSOuGnh+0ZMHTjEZ3yVWbCzDKVj2NUsF8vdlgDwVptFxyF NQ== 
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvNC8xOSA5OjMxIFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gTW9uLCBOb3Yg
MDQsIDIwMTkgYXQgMDU6MDM6MzFQTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBP
biAxMC8yOC8xOSA0OjEwIFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+PiBAQCAtNDQ1LDE3
ICs0MzgsOSBAQCBzdGF0aWMgdm9pZCBnbnRkZXZfdm1hX2Nsb3NlKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hKQo+Pj4gIAlzdHJ1Y3QgZ250ZGV2X3ByaXYgKnByaXYgPSBmaWxlLT5wcml2YXRl
X2RhdGE7Cj4+PiAgCj4+PiAgCXByX2RlYnVnKCJnbnRkZXZfdm1hX2Nsb3NlICVwXG4iLCB2bWEp
Owo+Pj4gLQlpZiAodXNlX3B0ZW1vZCkgewo+Pj4gLQkJLyogSXQgaXMgcG9zc2libGUgdGhhdCBh
biBtbXUgbm90aWZpZXIgY291bGQgYmUgcnVubmluZwo+Pj4gLQkJICogY29uY3VycmVudGx5LCBz
byB0YWtlIHByaXYtPmxvY2sgdG8gZW5zdXJlIHRoYXQgdGhlIHZtYSB3b24ndAo+Pj4gLQkJICog
dmFuaXNoaW5nIGR1cmluZyB0aGUgdW5tYXBfZ3JhbnRfcGFnZXMgY2FsbCwgc2luY2Ugd2Ugd2ls
bAo+Pj4gLQkJICogc3BpbiBoZXJlIHVudGlsIHRoYXQgY29tcGxldGVzLiBTdWNoIGEgY29uY3Vy
cmVudCBjYWxsIHdpbGwKPj4+IC0JCSAqIG5vdCBkbyBhbnkgdW5tYXBwaW5nLCBzaW5jZSB0aGF0
IGhhcyBiZWVuIGRvbmUgcHJpb3IgdG8KPj4+IC0JCSAqIGNsb3NpbmcgdGhlIHZtYSwgYnV0IGl0
IG1heSBzdGlsbCBpdGVyYXRlIHRoZSB1bm1hcF9vcHMgbGlzdC4KPj4+IC0JCSAqLwo+Pj4gLQkJ
bXV0ZXhfbG9jaygmcHJpdi0+bG9jayk7Cj4+PiArCWlmICh1c2VfcHRlbW9kICYmIG1hcC0+dm1h
ID09IHZtYSkgewo+Pgo+PiBJcyBpdCBwb3NzaWJsZSBmb3IgbWFwLT52bWEgbm90IHRvIGJlIGVx
dWFsIHRvIHZtYT8KPiBJdCBjb3VsZCBiZSBOVUxMIGF0IGxlYXN0IGlmIHVzZV9wdGVtb2QgaXMg
bm90IHNldC4KPgo+IE90aGVyd2lzZSwgSSdtIG5vdCBzdXJlLCB0aGUgY29uZnVzaW5nIGJpdCBp
cyB0aGF0IHRoZSBtYXAgY29tZXMgZnJvbQo+IGhlcmU6Cj4KPiAgICAgICAgIG1hcCA9IGdudGRl
dl9maW5kX21hcF9pbmRleChwcml2LCBpbmRleCwgY291bnQpOwo+Cj4gSXQgbG9va3MgbGlrZSB0
aGUgaW50ZW50IGlzIHRoYXQgdGhlIG1hcC0+dm1hIGlzIGFsd2F5cyBzZXQgdG8gdGhlCj4gb25s
eSB2bWEgdGhhdCBoYXMgdGhlIG1hcCBhcyBwcml2YXRlX2RhdGEuCgpJIGFtIG5vdCBzdXJlIGhv
dyB0aGlzIGNhbiB3b3JrIG90aGVyd2lzZS4gV2Ugc3Rhc2ggbWFwIHBvaW50ZXIgaW4gdm0ncwp2
bV9wcml2YXRlX2RhdGEgYW5kIHZpY2UgdmVyc2EgKGZvciB1c2VfcHRlbW9kKSBnbnRkZXZfbW1h
cCgpIHNvIGlmIHRoZXkKaGF2ZSB0byBtYXRjaC4KClRoYXQncyB3aHkgSSB3YXMgYXNraW5nIHlv
dSB0byBzZWUgaWYgeW91IGhhZCBzb21ldGhpbmcgcGFydGljdWxhciBpbgptaW5kIHdoZW4geW91
IGFkZGVkIHRoaXMgdGVzdC4KCj4gU28sIEkgc3VwcG9zZSBpdCBjYW4gYmUgcmVsYXhlZCB0byBh
IG51bGwgdGVzdCBhbmQgYSBXQVJOX09OIHRoYXQgaXQKPiBoYXNuJ3QgY2hhbmdlZD8KCllvdSBt
ZWFuCgppZiAodXNlX3B0ZW1vZCkgewrCoMKgwqDCoMKgwqDCoCBXQVJOX09OKG1hcC0+dm1hICE9
IHZtYSk7CsKgwqDCoMKgwqDCoMKgIC4uLgoKClllcywgdGhhdCBzb3VuZHMgZ29vZC4KCgotYm9y
aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
