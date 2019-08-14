Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D05B8D5AA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 16:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D521089CA2;
	Wed, 14 Aug 2019 14:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA32D89CA2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 14:09:43 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7EE8iD0111886;
 Wed, 14 Aug 2019 14:09:39 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2u9nvpd66q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 14:09:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7EE8kN1031842;
 Wed, 14 Aug 2019 14:09:38 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2ubwqt8xrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 14:09:38 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7EE9aX4032695;
 Wed, 14 Aug 2019 14:09:36 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 14 Aug 2019 07:09:36 -0700
Date: Wed, 14 Aug 2019 17:09:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: james.qian.wang@arm.com
Subject: [bug report] drm/komeda: Add writeback support
Message-ID: <20190814140930.GA31850@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=769
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908140147
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=816 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908140147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=Djd9vSNgN/HS4SprHKpfnXnOlYpxa/3RyaXfdXUPVTo=;
 b=MwZcVFwlm+O8srRxSzZzCV8Cs9FYYSHDBvF0QMNsuIu0L5a9aZ68n1NFfljIXCouWYqH
 w3NaCGVnQ3ebKVrjXW5+toakbnb+SdZOezbM1BbvGd8S3RrDOh8Y0KpZhj3+VmggYlaE
 /X6AEAjlgHqfSeL0HnPtVZftbXl0oYxxvFSalBU6zqPIawqgRSqnX5/GSFsaNYsyDMY4
 BcfUk/0Pn794jy7mATGp4K+INMKHHQLvRw7GWtTnuKfzK3+7wMy5VYw5daBdAclQ9Nun
 Sku/1CqkoFCVPJK6fvGRho6xROMB/HDd/szh7MvBnTNB74yDPzOPHw82JrOMC8KEWnMQ Xg== 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSksCgpUaGUgcGF0Y2gg
NWQ1MWY2YzBkYTFiOiAiZHJtL2tvbWVkYTogQWRkIHdyaXRlYmFjayBzdXBwb3J0IiBmcm9tIE1h
eQoyMywgMjAxOSwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBzdGF0aWMgY2hlY2tlciB3YXJuaW5n
OgoKCWRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rv
ci5jOjE1MSBrb21lZGFfd2JfY29ubmVjdG9yX2FkZCgpCgllcnJvcjogbm90IGFsbG9jYXRpbmcg
ZW5vdWdoIGRhdGEgMTU5MiB2cyAxNTg0Cgpkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwogICAxMzkgIHN0YXRpYyBpbnQga29tZWRhX3diX2Nv
bm5lY3Rvcl9hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCiAgIDE0MCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga29tZWRhX2NydGMgKmtjcnRjKQogICAx
NDEgIHsKICAgMTQyICAgICAgICAgIHN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0ga21zLT5iYXNl
LmRldl9wcml2YXRlOwogICAxNDMgICAgICAgICAgc3RydWN0IGtvbWVkYV93Yl9jb25uZWN0b3Ig
Kmt3Yl9jb25uOwogICAxNDQgICAgICAgICAgc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9y
ICp3Yl9jb25uOwogICAxNDUgICAgICAgICAgdTMyICpmb3JtYXRzLCBuX2Zvcm1hdHMgPSAwOwog
ICAxNDYgICAgICAgICAgaW50IGVycjsKICAgMTQ3ICAKICAgMTQ4ICAgICAgICAgIGlmICgha2Ny
dGMtPm1hc3Rlci0+d2JfbGF5ZXIpCiAgIDE0OSAgICAgICAgICAgICAgICAgIHJldHVybiAwOwog
ICAxNTAgIAogICAxNTEgICAgICAgICAga3diX2Nvbm4gPSBremFsbG9jKHNpemVvZigqd2JfY29u
biksIEdGUF9LRVJORUwpOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXl5eXl5eXgpUaGlzIHNob3VsZCBwcm9iYWJseSBiZSAia3diX2Nvbm4iIHdpdGggYSBrPwoK
ICAgMTUyICAgICAgICAgIGlmICgha3diX2Nvbm4pCiAgIDE1MyAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PTUVNOwogICAxNTQgIAogICAxNTUgICAgICAgICAga3diX2Nvbm4tPndiX2xheWVy
ID0ga2NydGMtPm1hc3Rlci0+d2JfbGF5ZXI7CiAgIDE1NiAgCiAgIDE1NyAgICAgICAgICB3Yl9j
b25uID0gJmt3Yl9jb25uLT5iYXNlOwogICAxNTggICAgICAgICAgd2JfY29ubi0+ZW5jb2Rlci5w
b3NzaWJsZV9jcnRjcyA9IEJJVChkcm1fY3J0Y19pbmRleCgma2NydGMtPmJhc2UpKTsKICAgMTU5
ICAKICAgMTYwICAgICAgICAgIGZvcm1hdHMgPSBrb21lZGFfZ2V0X2xheWVyX2ZvdXJjY19saXN0
KCZtZGV2LT5mbXRfdGJsLAogICAxNjEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAga3diX2Nvbm4tPndiX2xheWVyLT5sYXllcl90eXBlLAogICAxNjIgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm5fZm9ybWF0cyk7
CgpyZWdhcmRzLApkYW4gY2FycGVudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
