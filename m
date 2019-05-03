Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE34B12D7A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048CD89D60;
	Fri,  3 May 2019 12:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F39289D60
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:25:49 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43COb36107641;
 Fri, 3 May 2019 12:25:43 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2s6xhyxcad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 May 2019 12:25:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43CP9LD029893;
 Fri, 3 May 2019 12:25:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2s6xhhkgjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 May 2019 12:25:42 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x43CPcWG007319;
 Fri, 3 May 2019 12:25:38 GMT
Received: from mwanda (/196.104.111.181)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 03 May 2019 05:25:38 -0700
Date: Fri, 3 May 2019 15:25:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "James (Qian) Wang" <james.qian.wang@arm.com>
Subject: [PATCH] drm/komeda: Potential error pointer dereference
Message-ID: <20190503122525.GA29695@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=989
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905030078
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905030078
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=ceWt8vhd+vPLCGDRTc4L2ZdfVL6RSbvaLc1St5DpuCA=;
 b=x9yNi406P2rabVuaIqMq3eo6vORo0ZDq3txjDfB2U18tnSCi/lAqlMRtdr5I+xVwod2g
 ZBt6OuYZ1lddQbg24F7UPF6SxuHOH7yncWVy03emkI/QWpxQfx0n6FyqCEUK3VtAFm6y
 Wr72mzLnwD38NhuUjFR6Vj3pUDX0mROiyFrsrlidxu4ZvxZp5Rz3HyNmvEdNtEOECDyx
 CZPLe3l6GSoixAhxVCHPy64w4RxBfeO7HLYdh8o2eWJcOf360Bnq/M5JyQonzlNWg5UZ
 ZmtOkvT55itCPO0hDnd7IW9LRO/4wRS8sNhqF3emjLjFeDb/ZeKpYkKLkEjYFfL41/Wh Vw== 
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBjaGVjayB3aGV0aGVyIGRybV9hdG9taWNfZ2V0X2NydGNfc3RhdGUoKSByZXR1
cm5zIGFuIGVycm9yCnBvaW50ZXIgYmVmb3JlIGRlcmVmZXJlbmNpbmcgImNydGNfc3QiLgoKRml4
ZXM6IDdkMzFiOWU3YTU1MCAoImRybS9rb21lZGE6IEFkZCBrb21lZGFfcGxhbmUvcGxhbmVfaGVs
cGVyX2Z1bmNzIikKU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBv
cmFjbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3BsYW5lLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGxhbmUuYwppbmRleCAwN2VkMGNjMWJjNDQuLmM3ZTVmYzZlNTUwMCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jCkBAIC02NCw3ICs2
NCw3IEBAIGtvbWVkYV9wbGFuZV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUs
CiAJCXJldHVybiAwOwogCiAJY3J0Y19zdCA9IGRybV9hdG9taWNfZ2V0X2NydGNfc3RhdGUoc3Rh
dGUtPnN0YXRlLCBzdGF0ZS0+Y3J0Yyk7Ci0JaWYgKCFjcnRjX3N0LT5lbmFibGUpIHsKKwlpZiAo
SVNfRVJSKGNydGNfc3QpIHx8ICFjcnRjX3N0LT5lbmFibGUpIHsKIAkJRFJNX0RFQlVHX0FUT01J
QygiQ2Fubm90IHVwZGF0ZSBwbGFuZSBvbiBhIGRpc2FibGVkIENSVEMuXG4iKTsKIAkJcmV0dXJu
IC1FSU5WQUw7CiAJfQotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
