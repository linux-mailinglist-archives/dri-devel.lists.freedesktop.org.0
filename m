Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1132B2733BC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 22:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C370289F1B;
	Mon, 21 Sep 2020 20:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CEF89F1B;
 Mon, 21 Sep 2020 20:44:38 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08LKdCRp085819;
 Mon, 21 Sep 2020 20:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=7ujMtTvfd+IOkCnn7iI/GoTDPJ8pxvj1u7VSyDhDIiE=;
 b=TgUfJcvqhnH4X5TErTOA7ctRXSXQGoVSuGYWQLux1TS6gP/EFUFQnZPW1RbI+0E3cL3B
 in/KONvWNSkpL0McwdWOCYcEE71inohanA9TuEaBwbVsC+zymxPchZWkmSx8xBtSpz45
 n4nSBlQUHVmHXIe079bdqGiphbvhJyNT4NA7Zc1AGj/hU0sZ8Gjz7k8rSC1nxwxqxoDc
 M/3OmSs0Xen7YIDCD5IseKHAjxpvC1Wd93RKD+UTZE2zo/tF5x3Gs3ujB2MuqgPbpVVb
 G2l9kt0/DZBWdfye+7ecmzj4ylCxjUBE6JtHlfJDOmpinNW39aF0e9JhEBK/pXjcS2Z0 kg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 33n9xks3vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Sep 2020 20:44:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08LKdmAx065052;
 Mon, 21 Sep 2020 20:44:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 33nuw1usdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 20:44:24 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08LKiFvM023808;
 Mon, 21 Sep 2020 20:44:20 GMT
Received: from [10.74.86.189] (/10.74.86.189)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 21 Sep 2020 13:44:14 -0700
Subject: Re: [PATCH 6/6] x86/xen: open code alloc_vm_area in arch_gnttab_valloc
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-7-hch@lst.de>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <0833b9a8-5096-d105-a850-1336150eada1@oracle.com>
Date: Mon, 21 Sep 2020 16:44:10 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200918163724.2511-7-hch@lst.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9751
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 suspectscore=2 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009210152
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9751
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 suspectscore=2 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009210152
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
 xen-devel@lists.xenproject.org, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMTgvMjAgMTI6MzcgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ICAKPiArc3Rh
dGljIGludCBnbnR0YWJfYXBwbHkocHRlX3QgKnB0ZSwgdW5zaWduZWQgbG9uZyBhZGRyLCB2b2lk
ICpkYXRhKQo+ICt7Cj4gKwlwdGVfdCAqKipwID0gZGF0YTsKPiArCj4gKwkqKnAgPSBwdGU7Cj4g
KwkoKnApKys7Cj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIGludCBhcmNoX2dudHRh
Yl92YWxsb2Moc3RydWN0IGdudHRhYl92bV9hcmVhICphcmVhLCB1bnNpZ25lZCBucl9mcmFtZXMp
Cj4gIHsKPiAgCWFyZWEtPnB0ZXMgPSBrbWFsbG9jX2FycmF5KG5yX2ZyYW1lcywgc2l6ZW9mKCph
cmVhLT5wdGVzKSwgR0ZQX0tFUk5FTCk7Cj4gIAlpZiAoYXJlYS0+cHRlcyA9PSBOVUxMKQo+ICAJ
CXJldHVybiAtRU5PTUVNOwo+IC0KPiAtCWFyZWEtPmFyZWEgPSBhbGxvY192bV9hcmVhKFBBR0Vf
U0laRSAqIG5yX2ZyYW1lcywgYXJlYS0+cHRlcyk7Cj4gLQlpZiAoYXJlYS0+YXJlYSA9PSBOVUxM
KSB7Cj4gLQkJa2ZyZWUoYXJlYS0+cHRlcyk7Cj4gLQkJcmV0dXJuIC1FTk9NRU07Cj4gLQl9Cj4g
LQo+ICsJYXJlYS0+YXJlYSA9IGdldF92bV9hcmVhKFBBR0VfU0laRSAqIG5yX2ZyYW1lcywgVk1f
SU9SRU1BUCk7Cj4gKwlpZiAoIWFyZWEtPmFyZWEpCj4gKwkJZ290byBvdXRfZnJlZV9wdGVzOwo+
ICsJaWYgKGFwcGx5X3RvX3BhZ2VfcmFuZ2UoJmluaXRfbW0sICh1bnNpZ25lZCBsb25nKWFyZWEt
PmFyZWEtPmFkZHIsCj4gKwkJCVBBR0VfU0laRSAqIG5yX2ZyYW1lcywgZ250dGFiX2FwcGx5LCAm
YXJlYS0+cHRlcykpCgoKVGhpcyB3aWxsIGVuZCB1cCBpbmNyZW1lbnRpbmcgYXJlYS0+cHRlcyBw
b2ludGVyLiBTbyBwZXJoYXBzIHNvbWV0aGluZyBsaWtlCgoKcHRlX3QgKipwdGVzID0gYXJlYS0+
cHRlczsKCmlmIChhcHBseV90b19wYWdlX3JhbmdlKCZpbml0X21tLCAodW5zaWduZWQgbG9uZylh
cmVhLT5hcmVhLT5hZGRyLArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFBBR0VfU0laRSAqIG5yX2ZyYW1lcywgZ250dGFiX2FwcGx5LCAmcHRlcykpIHsKCsKg
wqDCoMKgwqDCoCAuLi4KCn0KCgotYm9yaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
