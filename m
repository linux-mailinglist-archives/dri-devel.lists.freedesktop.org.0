Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D758430
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 16:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4728C6E41D;
	Thu, 27 Jun 2019 14:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D756E41D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:06:47 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5RDxJoH194016;
 Thu, 27 Jun 2019 14:06:43 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2t9brtgk8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 14:06:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5RE5wGZ174134;
 Thu, 27 Jun 2019 14:06:43 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2t99f51gkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 14:06:43 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5RE6fra004894;
 Thu, 27 Jun 2019 14:06:41 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 27 Jun 2019 07:06:41 -0700
Date: Thu, 27 Jun 2019 17:06:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: christian.koenig@amd.com
Subject: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Message-ID: <20190627140626.GA6027@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906270165
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270165
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2018-07-02;
 bh=503YGQGnJ5VoROL6WcZZgvVyfV6c9OGuUyVuXkKsyaM=;
 b=WWuETcFblT5kf0PhsgyyTd00el8cq1aqA05BMX1WQZuM1FPB/duXuSVLJlFoAWOAvMAe
 aipt9LRxtm6BiEQvtwHVvaK1ks31pz+3nc2+zNilBpM4g9xS5Dbx+C2wSy5Q/WTACPnA
 s2rEQCtqWrbfOvJTwJchFn8ZmKHdSWB0OGIFOBXIletowjX5sQIlzejhAvlDOnK0rtBF
 jDUO+sTF64VZ89RFEM0K1A0JVZIhfCgcawXcoWWN/PgQ1FkXiipO4Ml5Hq1YBdxkToj6
 QeeaXGqzCjlowZ0w2pYeJETq7sc22+mONlQUlSDIlrvkhdCwMzlTEa2PdDjzkgXxzznQ Rw== 
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
Cc: Christoph Hellwig <hch@lst.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gQ2hyaXN0aWFuIEvDtm5pZywKClRoZSBwYXRjaCA2NDhiYzM1NzQ3MTY6ICJkcm0vdHRt
OiBhZGQgdHJhbnNwYXJlbnQgaHVnZSBwYWdlIHN1cHBvcnQKZm9yIERNQSBhbGxvY2F0aW9ucyB2
MiIgZnJvbSBKdWwgNiwgMjAxNywgbGVhZHMgdG8gdGhlIGZvbGxvd2luZwpzdGF0aWMgY2hlY2tl
ciB3YXJuaW5nOgoKCWRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmM6MzE0
IF9fdHRtX2RtYV9hbGxvY19wYWdlKCkKCWVycm9yOiAndmFkZHInIGNhbWUgZnJvbSBkbWFfYWxs
b2NfY29oZXJlbnQoKSBzbyB3ZSBjYW4ndCBkbyB2aXJ0X3RvX3BoeXMoKQoKZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fcGFnZV9hbGxvY19kbWEuYwogICAyOTUgIHN0YXRpYyBzdHJ1Y3QgZG1hX3Bh
Z2UgKl9fdHRtX2RtYV9hbGxvY19wYWdlKHN0cnVjdCBkbWFfcG9vbCAqcG9vbCkKICAgMjk2ICB7
CiAgIDI5NyAgICAgICAgICBzdHJ1Y3QgZG1hX3BhZ2UgKmRfcGFnZTsKICAgMjk4ICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgYXR0cnMgPSAwOwogICAyOTkgICAgICAgICAgdm9pZCAqdmFkZHI7CiAg
IDMwMCAgCiAgIDMwMSAgICAgICAgICBkX3BhZ2UgPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgZG1h
X3BhZ2UpLCBHRlBfS0VSTkVMKTsKICAgMzAyICAgICAgICAgIGlmICghZF9wYWdlKQogICAzMDMg
ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKICAgMzA0ICAKICAgMzA1ICAgICAgICAgIGlm
IChwb29sLT50eXBlICYgSVNfSFVHRSkKICAgMzA2ICAgICAgICAgICAgICAgICAgYXR0cnMgPSBE
TUFfQVRUUl9OT19XQVJOOwogICAzMDcgIAogICAzMDggICAgICAgICAgdmFkZHIgPSBkbWFfYWxs
b2NfYXR0cnMocG9vbC0+ZGV2LCBwb29sLT5zaXplLCAmZF9wYWdlLT5kbWEsCiAgIDMwOSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb29sLT5nZnBfZmxhZ3MsIGF0dHJzKTsKICAg
MzEwICAgICAgICAgIGlmICh2YWRkcikgewogICAzMTEgICAgICAgICAgICAgICAgICBpZiAoaXNf
dm1hbGxvY19hZGRyKHZhZGRyKSkKICAgMzEyICAgICAgICAgICAgICAgICAgICAgICAgICBkX3Bh
Z2UtPnAgPSB2bWFsbG9jX3RvX3BhZ2UodmFkZHIpOwogICAzMTMgICAgICAgICAgICAgICAgICBl
bHNlCiAgIDMxNCAgICAgICAgICAgICAgICAgICAgICAgICAgZF9wYWdlLT5wID0gdmlydF90b19w
YWdlKHZhZGRyKTsKCkNocmlzdG9waCB3YXMgZXhwbGFpbmluZyB0aGlzIGVhcmxpZXIgYW5kIEkg
ZG9uJ3QgdGhpbmsgaXQncyBzdWZmaWNpZW50CnRvIGp1c3QgY2hlY2sgaXNfdm1hbGxvY19hZGRy
KCkuICBTZWUgaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNi8xNy8xNTUKQXBwYXJlbnRseSB0
aGUgdmFkZHIgbWlnaHQgbm90IGhhdmUgYSBwYWdlIGJhY2tpbmcuLi4KCihJIGFtIGEgbmV3Ymll
IHRvIHRoaXMgc28gSSBtYXkgYmUgd3Jvbmcgb3IgaGF2ZSBtaXN1bmRlcnN0b29kIGFsc28pLgoK
ICAgMzE1ICAgICAgICAgICAgICAgICAgZF9wYWdlLT52YWRkciA9ICh1bnNpZ25lZCBsb25nKXZh
ZGRyOwogICAzMTYgICAgICAgICAgICAgICAgICBpZiAocG9vbC0+dHlwZSAmIElTX0hVR0UpCiAg
IDMxNyAgICAgICAgICAgICAgICAgICAgICAgICAgZF9wYWdlLT52YWRkciB8PSBWQUREUl9GTEFH
X0hVR0VfUE9PTDsKICAgMzE4ICAgICAgICAgIH0gZWxzZSB7CiAgIDMxOSAgICAgICAgICAgICAg
ICAgIGtmcmVlKGRfcGFnZSk7CiAgIDMyMCAgICAgICAgICAgICAgICAgIGRfcGFnZSA9IE5VTEw7
CiAgIDMyMSAgICAgICAgICB9CiAgIDMyMiAgICAgICAgICByZXR1cm4gZF9wYWdlOwogICAzMjMg
IH0KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
