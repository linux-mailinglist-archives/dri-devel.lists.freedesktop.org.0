Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CDA8756
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 20:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5871989C25;
	Wed,  4 Sep 2019 18:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECD589C25
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 18:55:42 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84ItN8f056173;
 Wed, 4 Sep 2019 18:55:23 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2utjvt010w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Sep 2019 18:55:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84IrR9v114298;
 Wed, 4 Sep 2019 18:55:19 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2ut1hnxvbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Sep 2019 18:55:19 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x84ItFOC029349;
 Wed, 4 Sep 2019 18:55:15 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 04 Sep 2019 11:55:14 -0700
Date: Wed, 4 Sep 2019 21:55:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190904185507.GA3634@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904115057.GC4811@pendragon.ideasonboard.com>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909040189
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909040189
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=mPi6nO703By+X80rHKGWRdzW+XBHf89rfMGiRteKjEQ=;
 b=m9oJvPqBN9hxgtRUeQ2t91oqn7RJ0kjkqXsRE8iprSaSC0bXMFySr4qxRnszfr9LmXhV
 LECf5d9VqSYPTbGu9MNtFhZe60l8I/tWOgYJXInmqjxENNURXy6DG7BiV4lOclz2Tukh
 h6f60ws2Y7pkbSuueOkQ4z8FZ4+IQZDilaL6KxFiWuII29ByGnnIXiKnEcxIHecDzs/4
 kIETbZG72btaZScZj7kzIRclANeD236LDqo7ak8dROgP0bH5R9Vm2aUr9enwjm+mS3Sl
 YYVreNFDngVYOdS8uZwDQNMDVNIxx5FV3J/lPgoBup9JK7HC4WtuUdDXMlYOmKdlEK3y gw== 
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
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJsdmRzLT5iYWNrbGlnaHQiIHBvaW50ZXIgY291bGQgYmUgTlVMTCBpbiBzaXR1YXRpb25z
IHdlcmUKb2ZfcGFyc2VfcGhhbmRsZSgpIHJldHVybnMgTlVMTC4gIEFsc28gaXQncyBzbGlnaHRs
eSBjbGVhbmVyIHRvIHVzZQpiYWNrbGlnaHRfcHV0KCkgd2hpY2ggYWxyZWFkeSBoYXMgYSBjaGVj
ayBmb3IgTlVMTCBidWlsdCBpbi4KCkZpeGVzOiA3YzlkZmY1YmQ2NDMgKCJkcm06IHBhbmVsczog
QWRkIExWRFMgcGFuZWwgZHJpdmVyIikKU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBvcmFjbGUuY29tPgotLS0KdjI6IFVzZSBiYWNrbGlnaHRfcHV0KCkuICBUaGFu
a3MsIExhdXJlbnQhCgogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtbHZkcy5jCmluZGV4IGFkNDdjYzk1NDU5ZS4uMDVlODg4NWRiN2VkIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMKQEAgLTI3Miw3ICsyNzIsNyBAQCBzdGF0aWMgaW50
IHBhbmVsX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4g
MDsKIAogZXJyb3I6Ci0JcHV0X2RldmljZSgmbHZkcy0+YmFja2xpZ2h0LT5kZXYpOworCWJhY2ts
aWdodF9wdXQobHZkcy0+YmFja2xpZ2h0KTsKIAlyZXR1cm4gcmV0OwogfQogCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
