Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABF58135B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF2889F73;
	Mon,  5 Aug 2019 07:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB466E312;
 Sat,  3 Aug 2019 01:30:37 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x731TjiM041024;
 Sat, 3 Aug 2019 01:30:14 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2u0f8rn4cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 03 Aug 2019 01:30:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x731SCbQ177888;
 Sat, 3 Aug 2019 01:28:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 2u50aa8apf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 03 Aug 2019 01:28:12 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x731SC7W177834;
 Sat, 3 Aug 2019 01:28:12 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2u50aa8ap0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 03 Aug 2019 01:28:12 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x731S6LT032689;
 Sat, 3 Aug 2019 01:28:06 GMT
Received: from mbp2018.cdmnet.org (/82.27.120.181)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 02 Aug 2019 18:28:05 -0700
Subject: Re: [PATCH 31/34] nfs: convert put_page() to put_user_page*()
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-32-jhubbard@nvidia.com>
From: Calum Mackay <calum.mackay@oracle.com>
Organization: Oracle
Message-ID: <1738cb1e-15d8-0bbe-5362-341664f6efc8@oracle.com>
Date: Sat, 3 Aug 2019 02:27:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:70.0)
 Gecko/20100101 Thunderbird/70.0a1
MIME-Version: 1.0
In-Reply-To: <20190802022005.5117-32-jhubbard@nvidia.com>
Content-Language: en-GB
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9337
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908030013
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=cc : subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=PzG5W+xMCPCqX5V/WwOxL0iZTAvQCXHlqgOKkoOg1MQ=;
 b=2UsMaGPWcwZDgPtPG4vvO4o2+XprVDs5YewZlGJ99NG/oeu5neHqgRolXDdQUDZF8YMI
 IxYI2JZfBcSTSH5fID80qQTk2RWiC2i2+JKhPWGaFknkpOXtRCnVCla7UCXQjDJ07TcC
 Y8zIof10PGpETzEquU4Ep6o2lM98f1fWi0d++c5eyIcbTbo8lM/F3e4I2lqnL2U/DsCA
 8mUjAebH6kYb0xf2V8EwArlSIvwpZUBAi4UxsNctBmeyR2rpJRijKuOrdEc0RMfPWfzX
 anPCkdDrm0pEBpPwYOnfJAsFmVDpXvcG9fkUEJAY/0LPZMTheZ3JVp0D915Q7k5fKIRC kQ== 
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
 calum.mackay@oracle.com, devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, Dan Williams <dan.j.williams@intel.com>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIvMDgvMjAxOSAzOjIwIGFtLCBqb2huLmh1YmJhcmRAZ21haWwuY29tIHdyb3RlOgo+IEZy
b206IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiAKPiBGb3IgcGFnZXMgdGhh
dCB3ZXJlIHJldGFpbmVkIHZpYSBnZXRfdXNlcl9wYWdlcyooKSwgcmVsZWFzZSB0aG9zZSBwYWdl
cwo+IHZpYSB0aGUgbmV3IHB1dF91c2VyX3BhZ2UqKCkgcm91dGluZXMsIGluc3RlYWQgb2Ygdmlh
IHB1dF9wYWdlKCkgb3IKPiByZWxlYXNlX3BhZ2VzKCkuCj4gCj4gVGhpcyBpcyBwYXJ0IGEgdHJl
ZS13aWRlIGNvbnZlcnNpb24sIGFzIGRlc2NyaWJlZCBpbiBjb21taXQgZmMxZDhlN2NjYTJkCj4g
KCJtbTogaW50cm9kdWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIiku
Cj4gCj4gQ2M6IFRyb25kIE15a2xlYnVzdCA8dHJvbmQubXlrbGVidXN0QGhhbW1lcnNwYWNlLmNv
bT4KPiBDYzogQW5uYSBTY2h1bWFrZXIgPGFubmEuc2NodW1ha2VyQG5ldGFwcC5jb20+Cj4gQ2M6
IGxpbnV4LW5mc0B2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQg
PGpodWJiYXJkQG52aWRpYS5jb20+Cj4gLS0tCj4gICBmcy9uZnMvZGlyZWN0LmMgfCA0ICstLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZnMvbmZzL2RpcmVjdC5jIGIvZnMvbmZzL2RpcmVjdC5jCj4gaW5kZXggMGNi
NDQyNDA2MTY4Li5iMDBiODlkZGEzYzUgMTAwNjQ0Cj4gLS0tIGEvZnMvbmZzL2RpcmVjdC5jCj4g
KysrIGIvZnMvbmZzL2RpcmVjdC5jCj4gQEAgLTI3OCw5ICsyNzgsNyBAQCBzc2l6ZV90IG5mc19k
aXJlY3RfSU8oc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKml0ZXIpCj4gICAK
PiAgIHN0YXRpYyB2b2lkIG5mc19kaXJlY3RfcmVsZWFzZV9wYWdlcyhzdHJ1Y3QgcGFnZSAqKnBh
Z2VzLCB1bnNpZ25lZCBpbnQgbnBhZ2VzKQo+ICAgewo+IC0JdW5zaWduZWQgaW50IGk7Cj4gLQlm
b3IgKGkgPSAwOyBpIDwgbnBhZ2VzOyBpKyspCj4gLQkJcHV0X3BhZ2UocGFnZXNbaV0pOwo+ICsJ
cHV0X3VzZXJfcGFnZXMocGFnZXMsIG5wYWdlcyk7Cj4gICB9CgpTaW5jZSBpdCdzIHN0YXRpYywg
YW5kIG9ubHkgY2FsbGVkIHR3aWNlLCBtaWdodCBpdCBiZSBiZXR0ZXIgdG8gY2hhbmdlIAppdHMg
dHdvIGNhbGxlcnMgW25mc19kaXJlY3Rfe3JlYWQsd3JpdGV9X3NjaGVkdWxlX2lvdmVjKCldIHRv
IGNhbGwgCnB1dF91c2VyX3BhZ2VzKCkgZGlyZWN0bHksIGFuZCByZW1vdmUgbmZzX2RpcmVjdF9y
ZWxlYXNlX3BhZ2VzKCkgZW50aXJlbHk/Cgp0aGFua3MsCmNhbHVtLgoKCj4gICAKPiAgIHZvaWQg
bmZzX2luaXRfY2luZm9fZnJvbV9kcmVxKHN0cnVjdCBuZnNfY29tbWl0X2luZm8gKmNpbmZvLAo+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
