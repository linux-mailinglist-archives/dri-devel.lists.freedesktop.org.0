Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788BF90D6C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 08:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BAC6E47A;
	Sat, 17 Aug 2019 06:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8736E472;
 Sat, 17 Aug 2019 06:52:12 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7H6mtdD048231;
 Sat, 17 Aug 2019 06:52:04 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2ue9hp0hd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Aug 2019 06:52:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7H6nFi3153042;
 Sat, 17 Aug 2019 06:52:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2ue9dsm3um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Aug 2019 06:52:04 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7H6pvHW029889;
 Sat, 17 Aug 2019 06:51:58 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 16 Aug 2019 23:51:57 -0700
Date: Sat, 17 Aug 2019 09:51:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][drm-next] drm/amd/display: fix a potential null pointer
 dereference
Message-ID: <20190817065146.GA4451@kadam>
References: <20190816221011.10750-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816221011.10750-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9351
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908170073
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9351
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908170073
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=sNBRZOs5LKC7xx0kA1ScFH42yymHCWiRh5XDdeQ+kxE=;
 b=D7TXpxzOWLogWmGrKsF/Tjx82bGLPIjsAr60TBoJoMSQcuQqs6VI3vVbhmKJ6FqtVoPl
 nvsDGTT4PjwCyhii8qaktPAonzV/fp8zKFbHDMBngppsr9ZOpbJPv78/mn+1ZqbFYK7Y
 bHVhL6D63srVJs+4jgYOoqiX114mbcju8qNLcY3hlQAW8zC5pcPtW9VkDR3V1ps1FDD9
 H8dIvKAAAe9gPQ/g/SR4gjFl9HMfrU8IGOHgPlqcXAzOdPa1fMMS+BtOrX5rD49N3Duf
 GU3XFJJvyi154ANpOtrUmNInHc6GOlhwIVFNyZEcxqOfG3uM/pqkxTkW4IvdsSHt9dR5 ww== 
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTE6MTA6MTFQTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IEN1cnJlbnRseSB0aGUgcG9pbnRlciBpbml0X2RhdGEgaXMgZGVyZWZlcmVuY2VkIG9uIHRoZSBh
c3NpZ25tZW50Cj4gb2YgZndfaW5mbyBiZWZvcmUgaW5pdF9kYXRhIGlzIHNhbml0eSBjaGVja2Vk
IHRvIHNlZSBpZiBpdCBpcyBudWxsLgo+IEZpeCB0ZSBwb3RlbnRpYWwgbnVsbCBwb2ludGVyIGRl
cmVmZXJlbmNlIG9uIGluaXRfZGF0YSBieSBvbmx5Cj4gcGVyZm9ybWluZyBkZXJlZmVyZW5jZSBh
ZnRlciBpdCBpcyBudWxsIGNoZWNrZWQuCj4gCj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIkRlcmVm
ZXJlbmNlIGJlZm9yZSBudWxsIGNoZWNrIikKPiBGaXhlczogOWFkYzgwNTBiZjNjICgiZHJtL2Ft
ZC9kaXNwbGF5OiBtYWtlIGZpcm13YXJlIGluZm8gb25seSBsb2FkIG9uY2UgZHVyaW5nIGRjX2Jp
b3MgY3JlYXRlIikKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
L2RjZV9jbG9ja19zb3VyY2UuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xvY2tfc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYwo+IGluZGV4IGJlZTgxYmYyODhiZS4u
OTI2OTU0YzgwNGE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZS9kY2VfY2xvY2tfc291cmNlLmMKPiBAQCAtMTIzNSw3ICsxMjM1LDcgQEAgc3Rh
dGljIGJvb2wgY2FsY19wbGxfbWF4X3Zjb19jb25zdHJ1Y3QoCj4gIAkJCXN0cnVjdCBjYWxjX3Bs
bF9jbG9ja19zb3VyY2VfaW5pdF9kYXRhICppbml0X2RhdGEpCj4gIHsKPiAgCXVpbnQzMl90IGk7
Cj4gLQlzdHJ1Y3QgZGNfZmlybXdhcmVfaW5mbyAqZndfaW5mbyA9ICZpbml0X2RhdGEtPmJwLT5m
d19pbmZvOwo+ICsJc3RydWN0IGRjX2Zpcm13YXJlX2luZm8gKmZ3X2luZm87Cj4gIAlpZiAoY2Fs
Y19wbGxfY3MgPT0gTlVMTCB8fAo+ICAJCQlpbml0X2RhdGEgPT0gTlVMTCB8fAo+ICAJCQlpbml0
X2RhdGEtPmJwID09IE5VTEwpCgppbml0X2RhdGEgY2FuJ3QgYmUgTlVMTC4gIEknbSBtb3N0bHkg
cG9pbnRpbmcgdGhpcyBvdXQgYmVjYXVzZSB0aGF0IE5VTEwKY2hlY2sgaXMgd3JpdHRlbiBzbyBo
aWdnbGVkeS1waWdnbGVkeS4gIEF0IGZpcnN0IEkgdGhvdWdodCB0aGlzIHdhcwpzdGFnaW5nIGNv
ZGUgc28gSSB3YXMgcGxhbm5pbmcgdG8gaWdub3JlIHRoZSBwYXRjaC4gIDpQCgpyZWdhcmRzLApk
YW4gY2FycGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
