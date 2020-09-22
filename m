Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47224274530
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 17:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A16F89DEC;
	Tue, 22 Sep 2020 15:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5915389DEC;
 Tue, 22 Sep 2020 15:24:40 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08MF99uD108659;
 Tue, 22 Sep 2020 15:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=r25X6J1q+Ighced5STv1N+Q9x56TJMr0M8XmPWVmk4w=;
 b=bB8Tp/a2lSI+UwYmqXXKz5Y23TH5yE09ciN0f0sy3qt19cNhEhgksqgJ9nY6Q7FHdqr5
 Bj6NZjV37L+9k30k+sStCWjIWjb3Ku8CSL6l1POKFNXfXE7HYCIV82SAjw7MQKGPgnDR
 Kw5X2XpfKcODiRMBXcg9wFTOahB8pyoEu3wJaCPA3pS5RO6mExJgFsqXBwcDKafq5t6B
 hQMtnhiJ37dQzyVQCoh1oa9eh/nLFNekem8w4gp1vbNpKm+sEpYKhcbEqKkOoPjQ1OAn
 1TucTPU5tN6rNwjoHoSKQdXi9Gtq8zA8k12iNAEJCTzdfjm7ZqUf68EhJIGFWJhinzYg 9Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 33q5rgbsn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Sep 2020 15:24:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08MFAMQ1168760;
 Tue, 22 Sep 2020 15:24:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 33nujnbted-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Sep 2020 15:24:29 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08MFOPZn012709;
 Tue, 22 Sep 2020 15:24:25 GMT
Received: from [10.74.86.236] (/10.74.86.236)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Sep 2020 08:24:25 -0700
Subject: Re: [PATCH 6/6] x86/xen: open code alloc_vm_area in arch_gnttab_valloc
To: Christoph Hellwig <hch@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-7-hch@lst.de>
 <0833b9a8-5096-d105-a850-1336150eada1@oracle.com>
 <20200922145819.GA28420@lst.de>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <ebd69ba1-fc06-3cc7-348e-3cb0004c2a34@oracle.com>
Date: Tue, 22 Sep 2020 11:24:20 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200922145819.GA28420@lst.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220120
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

Ck9uIDkvMjIvMjAgMTA6NTggQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE9uIE1vbiwg
U2VwIDIxLCAyMDIwIGF0IDA0OjQ0OjEwUE0gLTA0MDAsIGJvcmlzLm9zdHJvdnNreUBvcmFjbGUu
Y29tIHdyb3RlOgo+PiBUaGlzIHdpbGwgZW5kIHVwIGluY3JlbWVudGluZyBhcmVhLT5wdGVzIHBv
aW50ZXIuIFNvIHBlcmhhcHMgc29tZXRoaW5nIGxpa2UKPj4KPj4KPj4gcHRlX3QgKipwdGVzID0g
YXJlYS0+cHRlczsKPj4KPj4gaWYgKGFwcGx5X3RvX3BhZ2VfcmFuZ2UoJmluaXRfbW0sICh1bnNp
Z25lZCBsb25nKWFyZWEtPmFyZWEtPmFkZHIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgUEFHRV9TSVpFICogbnJfZnJhbWVzLCBnbnR0YWJfYXBwbHks
ICZwdGVzKSkgewo+Pgo+PiDCoMKgwqDCoMKgwqAgLi4uCj4gWWVhaC4gIFdoYXQgZG8geW91IHRo
aW5rIG9mIHRoaXMgdmVyc2lvbj8gCgoKT2ggeWVzLCB0aGlzIGlzIHdheSBiZXR0ZXIuIFRoaXMg
bm93IGNhbiBhY3R1YWxseSBiZSByZWFkIHdpdGhvdXQgdHJ5aW5nIHRvIG1lbnRhbGx5IHVud2lu
ZCB0cmlwbGUgcG9pbnRlcnMuIChZb3UgcHJvYmFibHkgd2FudCB0byBpbml0aWFsaXplIGlkeCB0
byB6ZXJvIGJlZm9yZSBjYWxsaW5nIGFwcGx5X3RvX3BhZ2VfcmFuZ2UoKSwgSSBhbSBub3Qgc3Vy
ZSBpdCdzIGd1YXJhbnRlZWQgdG8gYmUgemVybykuCgoKPiAgSSB0aGluayBpdCBpcyBhIGxpdHRs
ZQo+IGNsZWFuZXIgYW5kIG1hdGNoZXMgd2hhdCB4ZW5idXMgZG9lcy4gIEF0IHRoaXMgcG9pbnQg
aXQgcHJvYmFibHkgc2hvdWxkCj4gYmUgc3BsaXQgaW50byBhIFhlbiBhbmQgYSBhbGxvY192bV9h
cmVhIHJlbW92YWwgcGF0Y2gsIHRob3VnaC4KCgpSaWdodC4KCgotYm9yaXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
