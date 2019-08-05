Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E594081377
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B376E2C0;
	Mon,  5 Aug 2019 07:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F267789DE6;
 Mon,  5 Aug 2019 00:27:46 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x750PN8L099080;
 Mon, 5 Aug 2019 00:27:22 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2u527pc6va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 05 Aug 2019 00:27:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x750Mxa2125660;
 Mon, 5 Aug 2019 00:27:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 2u5232s8j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 05 Aug 2019 00:27:22 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x750RLrL130645;
 Mon, 5 Aug 2019 00:27:22 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2u5232s8hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 05 Aug 2019 00:27:21 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x750R78g009479;
 Mon, 5 Aug 2019 00:27:08 GMT
Received: from mbp2018.cdmnet.org (/82.27.120.181)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 04 Aug 2019 17:27:07 -0700
Subject: Re: [PATCH v2 31/34] fs/nfs: convert put_page() to put_user_page*()
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
 <20190804224915.28669-32-jhubbard@nvidia.com>
From: Calum Mackay <calum.mackay@oracle.com>
Organization: Oracle
Message-ID: <cf978e10-facc-ba5b-d7e4-d7fc2c3f7ebc@oracle.com>
Date: Mon, 5 Aug 2019 01:26:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:70.0)
 Gecko/20100101 Thunderbird/70.0a1
MIME-Version: 1.0
In-Reply-To: <20190804224915.28669-32-jhubbard@nvidia.com>
Content-Language: en-GB
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9339
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908050001
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=cc : subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=csR1CFI12mg4Wfl/I1DmedWmi55eZjSHDbam/aE57Lg=;
 b=UxnSselyJSkDrlgtrJqirrqIgp3f8N92FZdRzvuEzRyV0BK1GmSaf9C8PKnong3YQqHb
 MCpznjeWe33FH9kWSVMHzf3ueNmMrgta/dHNshxU+ezcH/SlcYl3T1BbtssK9RamgmgB
 uxHaAwYQYSv2zhs8xcIQpAvtnAqvLsICBKD/Oi73oWTTrzZCg0llYMmo1CN1xJK1/n6p
 FN3jH23l0bDAY+8rbi5+pi71wYYr59UK7ki0dfZmNagJqJGpCz4Dhc49Z+1r5jDxqopk
 IUz6WPSid5pJVTZGy3yYzlDcCEYZUIldAG3FEELFmfGykxTqdKwI/FpOYaMM05PGsiiD Lg== 
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDQvMDgvMjAxOSAxMTo0OSBwbSwgam9obi5odWJiYXJkQGdtYWlsLmNvbSB3cm90ZToKPiBG
cm9tOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gCj4gRm9yIHBhZ2VzIHRo
YXQgd2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFn
ZXMKPiB2aWEgdGhlIG5ldyBwdXRfdXNlcl9wYWdlKigpIHJvdXRpbmVzLCBpbnN0ZWFkIG9mIHZp
YSBwdXRfcGFnZSgpIG9yCj4gcmVsZWFzZV9wYWdlcygpLgo+IAo+IFRoaXMgaXMgcGFydCBhIHRy
ZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmliZWQgaW4gY29tbWl0IGZjMWQ4ZTdjY2EyZAo+
ICgibW06IGludHJvZHVjZSBwdXRfdXNlcl9wYWdlKigpLCBwbGFjZWhvbGRlciB2ZXJzaW9ucyIp
Lgo+IAo+IENjOiBDYWx1bSBNYWNrYXkgPGNhbHVtLm1hY2theUBvcmFjbGUuY29tPgo+IENjOiBU
cm9uZCBNeWtsZWJ1c3QgPHRyb25kLm15a2xlYnVzdEBoYW1tZXJzcGFjZS5jb20+Cj4gQ2M6IEFu
bmEgU2NodW1ha2VyIDxhbm5hLnNjaHVtYWtlckBuZXRhcHAuY29tPgo+IENjOiBsaW51eC1uZnNA
dmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgo+IC0tLQo+ICAgZnMvbmZzL2RpcmVjdC5jIHwgMTEgKystLS0tLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpSZXZpZXdl
ZC1ieTogQ2FsdW0gTWFja2F5IDxjYWx1bS5tYWNrYXlAb3JhY2xlLmNvbT4KCgo+IGRpZmYgLS1n
aXQgYS9mcy9uZnMvZGlyZWN0LmMgYi9mcy9uZnMvZGlyZWN0LmMKPiBpbmRleCAwY2I0NDI0MDYx
NjguLmMwYzFiOWYyYzA2OSAxMDA2NDQKPiAtLS0gYS9mcy9uZnMvZGlyZWN0LmMKPiArKysgYi9m
cy9uZnMvZGlyZWN0LmMKPiBAQCAtMjc2LDEzICsyNzYsNiBAQCBzc2l6ZV90IG5mc19kaXJlY3Rf
SU8oc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKml0ZXIpCj4gICAJcmV0dXJu
IG5mc19maWxlX2RpcmVjdF93cml0ZShpb2NiLCBpdGVyKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMg
dm9pZCBuZnNfZGlyZWN0X3JlbGVhc2VfcGFnZXMoc3RydWN0IHBhZ2UgKipwYWdlcywgdW5zaWdu
ZWQgaW50IG5wYWdlcykKPiAtewo+IC0JdW5zaWduZWQgaW50IGk7Cj4gLQlmb3IgKGkgPSAwOyBp
IDwgbnBhZ2VzOyBpKyspCj4gLQkJcHV0X3BhZ2UocGFnZXNbaV0pOwo+IC19Cj4gLQo+ICAgdm9p
ZCBuZnNfaW5pdF9jaW5mb19mcm9tX2RyZXEoc3RydWN0IG5mc19jb21taXRfaW5mbyAqY2luZm8s
Cj4gICAJCQkgICAgICBzdHJ1Y3QgbmZzX2RpcmVjdF9yZXEgKmRyZXEpCj4gICB7Cj4gQEAgLTUx
Miw3ICs1MDUsNyBAQCBzdGF0aWMgc3NpemVfdCBuZnNfZGlyZWN0X3JlYWRfc2NoZWR1bGVfaW92
ZWMoc3RydWN0IG5mc19kaXJlY3RfcmVxICpkcmVxLAo+ICAgCQkJcG9zICs9IHJlcV9sZW47Cj4g
ICAJCQlkcmVxLT5ieXRlc19sZWZ0IC09IHJlcV9sZW47Cj4gICAJCX0KPiAtCQluZnNfZGlyZWN0
X3JlbGVhc2VfcGFnZXMocGFnZXZlYywgbnBhZ2VzKTsKPiArCQlwdXRfdXNlcl9wYWdlcyhwYWdl
dmVjLCBucGFnZXMpOwo+ICAgCQlrdmZyZWUocGFnZXZlYyk7Cj4gICAJCWlmIChyZXN1bHQgPCAw
KQo+ICAgCQkJYnJlYWs7Cj4gQEAgLTkzNSw3ICs5MjgsNyBAQCBzdGF0aWMgc3NpemVfdCBuZnNf
ZGlyZWN0X3dyaXRlX3NjaGVkdWxlX2lvdmVjKHN0cnVjdCBuZnNfZGlyZWN0X3JlcSAqZHJlcSwK
PiAgIAkJCXBvcyArPSByZXFfbGVuOwo+ICAgCQkJZHJlcS0+Ynl0ZXNfbGVmdCAtPSByZXFfbGVu
Owo+ICAgCQl9Cj4gLQkJbmZzX2RpcmVjdF9yZWxlYXNlX3BhZ2VzKHBhZ2V2ZWMsIG5wYWdlcyk7
Cj4gKwkJcHV0X3VzZXJfcGFnZXMocGFnZXZlYywgbnBhZ2VzKTsKPiAgIAkJa3ZmcmVlKHBhZ2V2
ZWMpOwo+ICAgCQlpZiAocmVzdWx0IDwgMCkKPiAgIAkJCWJyZWFrOwo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
