Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97DF27455B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 17:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E350689EB8;
	Tue, 22 Sep 2020 15:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7254789EB8;
 Tue, 22 Sep 2020 15:34:51 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08MFXZ4A115377;
 Tue, 22 Sep 2020 15:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=SQUZRxKbOrj7C5f6uXB0QaPDAWtQi5hHWGb3AMCGwok=;
 b=vXNxTqEaODuD+fyU1jUL8sgHm/70CoNspaljF2CVJy8YCkwoU79BXOLKh267UZHkplF8
 8gDxgeFrbFB3MPy3LpGLNkXfd1SvSHwK+Aa1BHsHL6vvwsYit9kqi55PmIfQ5VEjTtfj
 xYG2uDen9YZs91OrBwjVJcj7oFo6Mv3iUblQ43Pm81r+jgqhZ/1Tcx8D1VYYb7+x69fb
 n+qGpLjCo2XbRGqid1wVg1IbrdOhxG/60xd/nbbzTVHN4KXX5ILRDFS7r3qd1qqYr6Ez
 qQJnMwFLIBPdG4ZIkFCq9APz0yHuY8A6pTbvyMU5RcXkzUXKRKPdNqjFklU4rSPXqE1a Hw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 33ndnudj4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Sep 2020 15:34:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08MFURVL072451;
 Tue, 22 Sep 2020 15:34:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 33nujncaex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Sep 2020 15:34:41 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08MFYdJl019605;
 Tue, 22 Sep 2020 15:34:39 GMT
Received: from [10.74.86.236] (/10.74.86.236)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Sep 2020 08:34:38 -0700
Subject: Re: [PATCH 6/6] x86/xen: open code alloc_vm_area in arch_gnttab_valloc
To: Christoph Hellwig <hch@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-7-hch@lst.de>
 <0833b9a8-5096-d105-a850-1336150eada1@oracle.com>
 <20200922145819.GA28420@lst.de>
 <ebd69ba1-fc06-3cc7-348e-3cb0004c2a34@oracle.com>
 <20200922152706.GA30633@lst.de>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <a3daaf31-d1cd-2bf1-5b2f-aaae32baa7f6@oracle.com>
Date: Tue, 22 Sep 2020 11:34:35 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200922152706.GA30633@lst.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009220121
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>,
 Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMjIvMjAgMTE6MjcgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE9uIFR1ZSwg
U2VwIDIyLCAyMDIwIGF0IDExOjI0OjIwQU0gLTA0MDAsIGJvcmlzLm9zdHJvdnNreUBvcmFjbGUu
Y29tIHdyb3RlOgo+PiBPbiA5LzIyLzIwIDEwOjU4IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPj4+IE9uIE1vbiwgU2VwIDIxLCAyMDIwIGF0IDA0OjQ0OjEwUE0gLTA0MDAsIGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tIHdyb3RlOgo+Pj4+IFRoaXMgd2lsbCBlbmQgdXAgaW5jcmVtZW50
aW5nIGFyZWEtPnB0ZXMgcG9pbnRlci4gU28gcGVyaGFwcyBzb21ldGhpbmcgbGlrZQo+Pj4+Cj4+
Pj4KPj4+PiBwdGVfdCAqKnB0ZXMgPSBhcmVhLT5wdGVzOwo+Pj4+Cj4+Pj4gaWYgKGFwcGx5X3Rv
X3BhZ2VfcmFuZ2UoJmluaXRfbW0sICh1bnNpZ25lZCBsb25nKWFyZWEtPmFyZWEtPmFkZHIsCj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQQUdFX1NJ
WkUgKiBucl9mcmFtZXMsIGdudHRhYl9hcHBseSwgJnB0ZXMpKSB7Cj4+Pj4KPj4+PiDCoMKgwqDC
oMKgwqAgLi4uCj4+PiBZZWFoLiAgV2hhdCBkbyB5b3UgdGhpbmsgb2YgdGhpcyB2ZXJzaW9uPyAK
Pj4KPj4gT2ggeWVzLCB0aGlzIGlzIHdheSBiZXR0ZXIuIFRoaXMgbm93IGNhbiBhY3R1YWxseSBi
ZSByZWFkIHdpdGhvdXQgdHJ5aW5nIHRvIG1lbnRhbGx5IHVud2luZCB0cmlwbGUgcG9pbnRlcnMu
IChZb3UgcHJvYmFibHkgd2FudCB0byBpbml0aWFsaXplIGlkeCB0byB6ZXJvIGJlZm9yZSBjYWxs
aW5nIGFwcGx5X3RvX3BhZ2VfcmFuZ2UoKSwgSSBhbSBub3Qgc3VyZSBpdCdzIGd1YXJhbnRlZWQg
dG8gYmUgemVybykuCj4gQm90aCBpbnN0YW5jZXMgYXJlIHN0YXRpYyB2YXJpYWJsZXMsIHRodXMg
aW4gLmJzcyBhbmQgaW5pdGlhbGl6ZWQuCj4gU28gdW5sZXNzIHlvdSBpbnNpc3QgSSBkb24ndCB0
aGluayB3ZSBuZWVkIGEgbWFudWFsIG9uZS4KCgpZZXMsIHlvdSBhcmUgcmlnaHQuIChJIHRob3Vn
aHQgcGVyaGFwcyB0aGlzIGNvZGUgY291bGQgYmUgY2FsbGVkIG1vcmUgdGhhbiBvbmNlIGJ1dCBu
bywgaXQgY2FuJ3QpLgoKCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
