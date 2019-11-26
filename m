Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D0B109D97
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 13:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9166E098;
	Tue, 26 Nov 2019 12:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D516E098;
 Tue, 26 Nov 2019 12:10:51 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQC8qZ8110998;
 Tue, 26 Nov 2019 12:10:44 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2wevqq6dgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 12:10:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQC8Q6a089316;
 Tue, 26 Nov 2019 12:10:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2wgvfjdere-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 12:10:43 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAQCAeCV016379;
 Tue, 26 Nov 2019 12:10:40 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 26 Nov 2019 04:10:40 -0800
Date: Tue, 26 Nov 2019 15:10:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Subject: [PATCH] drm/amdgpu: Fix a bug in jpeg_v1_0_start()
Message-ID: <20191126121029.3tye7e3gyduxryfr@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=891
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=953 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260110
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=TcAyC+jPBlqbP92yV0gCUneIcEuu+5m1qwO8ZfDeIJw=;
 b=PQwQJaxDKY5PB0CpooI7CQU/g3FC1KqC1IQJ1G5oKDmRQ8YUkHR+XNeiGJ0zGb4ERceJ
 4XooYBajnj6/nZV/HZwvGrCz1VZ7b7iEjFkGPotLMdsV0JatLinyf4ITJfSKkAcbWAaV
 T31pDLQcFxYa0IQbBHDHJiVjHfkIxcCauHG5DaFZBxWKpSiDb52aC90ZNlQs+YbvvQMh
 ktK4BKucKG0xzHeWGQvNyXpUTUhniTP/7hXE0mVBeF2GHQnwngghNOzNJttfnI1hYLmC
 YuxqsRrOwG8rrb6E1evVPPKqbPh8WBmRutemxnWls8qPW82UaKXNU9xPwbPc4Pxfha4/ +g== 
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Christian K??nig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3JpZ2luYWxseSB0aGUgbGFzdCBXUkVHMzJfU09DMTUoKSB3YXMgYSBwYXJ0IG9mIHRoZSBpZiBz
dGF0ZW1lbnQgYmxvY2sKYnV0IHRoZSBjdXJseSBicmFjZXMgYXJlIG9uIHRoZSB3cm9uZyBsaW5l
LgoKRml4ZXM6IGJiMGRiNzBmM2Y3NSAoImRybS9hbWRncHU6IHNlcGFyYXRlIEpQRUcxLjAgY29k
ZSBvdXQgZnJvbSBWQ04xLjAiKQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2Fy
cGVudGVyQG9yYWNsZS5jb20+Ci0tLQpGcm9tIHN0YXRpYyBhbmFseXNpcyAoU21hdGNoKS4gIE5v
dCB0ZXN0ZWQuCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFfMC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmMKaW5kZXggNTUzNTA2ZGYwNzdkLi5hMTQxNDA4
ZGZiMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFfMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFfMC5jCkBAIC01MjIsNyAr
NTIyLDggQEAgdm9pZCBqcGVnX3YxXzBfc3RhcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IGludCBtb2RlKQogCQlXUkVHMzJfU09DMTUoSlBFRywgMCwgbW1VVkRfTE1JX0pSQkNfUkJfNjRC
SVRfQkFSX0hJR0gsIHVwcGVyXzMyX2JpdHMocmluZy0+Z3B1X2FkZHIpKTsKIAkJV1JFRzMyX1NP
QzE1KEpQRUcsIDAsIG1tVVZEX0pSQkNfUkJfUlBUUiwgMCk7CiAJCVdSRUczMl9TT0MxNShKUEVH
LCAwLCBtbVVWRF9KUkJDX1JCX1dQVFIsIDApOwotCX0JV1JFRzMyX1NPQzE1KEpQRUcsIDAsIG1t
VVZEX0pSQkNfUkJfQ05UTCwgVVZEX0pSQkNfUkJfQ05UTF9fUkJfUlBUUl9XUl9FTl9NQVNLKTsK
KwkJV1JFRzMyX1NPQzE1KEpQRUcsIDAsIG1tVVZEX0pSQkNfUkJfQ05UTCwgVVZEX0pSQkNfUkJf
Q05UTF9fUkJfUlBUUl9XUl9FTl9NQVNLKTsKKwl9CiAKIAkvKiBpbml0aWFsaXplIHdwdHIgKi8K
IAlyaW5nLT53cHRyID0gUlJFRzMyX1NPQzE1KEpQRUcsIDAsIG1tVVZEX0pSQkNfUkJfV1BUUik7
Ci0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
