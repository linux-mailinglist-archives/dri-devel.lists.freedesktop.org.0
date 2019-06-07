Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B1F384FE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71E9899DB;
	Fri,  7 Jun 2019 07:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F5B899DB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 07:27:47 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577ETNn059625;
 Fri, 7 Jun 2019 07:27:43 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2sugstvm1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2019 07:27:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577RScs014230;
 Fri, 7 Jun 2019 07:27:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2swngjv44r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2019 07:27:42 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x577RgXj012463;
 Fri, 7 Jun 2019 07:27:42 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 Jun 2019 00:27:41 -0700
Date: Fri, 7 Jun 2019 10:27:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Jyri Sarha <jsarha@ti.com>
Subject: [PATCH 2/2] drm/bridge: sii902x: fix a signedness bug in
 sii902x_audio_codec_init()
Message-ID: <20190607072727.GB25229@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906070053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906070052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=R2watcWE+WmCUnKNT5wDTzofYUkyv3xsk5kFJX/aWfs=;
 b=ylIHra35LkDyTNJpTIBrxGSoH55bteNV3kj04Z1dqKvlpROpsrw6iC+/+1+LleF+MdYx
 jM7Mnkf+pJ3EUq2gMJH7M6lWjyWpP5RnU3kC6CznPRLU17J/xxfab6iDVpMjHneR9RRa
 1vg9ZvsCGJpz0BJPDC9uaf6rKytvfENtehczM06+wxuv9NIyrAKJ/e/z4KnrC9mUNuOK
 T9kcbGji5Lj8vO16BVpd7M6KlnjmG7Ni4jAS6jJZeGPLz27NSyFwYXlBGac4eD1vSTRJ
 e5X2zXzrioqCPeYWdL1eb8ZnQlWJ/rz/ijYTzEsGuJvct3Iq2N7cG3uDWOZiBZBf6LAC aA== 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJudW1fbGFuZXMiIHZhcmlhYmxlIG5lZWRzIHRvIGJlIHNpZ25lZCBmb3IgdGhlIGVycm9y
IGhhbmRsaW5nIHRvCndvcmsuICBUaGUgImkiIHZhcmlhYmxlIGNhbiBiZSBhIHJlZ3VsYXIgaW50
IGFzIHdlbGwuCgpGaXhlczogZmY1NzgxNjM0YzQxICgiZHJtL2JyaWRnZTogc2lpOTAyeDogSW1w
bGVtZW50IEhETUkgYXVkaW8gc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Np
aTkwMnguYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKaW5kZXggNmIwMzYxNmQ2YmMzLi5kZDdhYTQ2
NmIyODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCkBAIC03MTksNyArNzE5LDcgQEAgc3Rh
dGljIGludCBzaWk5MDJ4X2F1ZGlvX2NvZGVjX2luaXQoc3RydWN0IHNpaTkwMnggKnNpaTkwMngs
CiAJCS5tYXhfaTJzX2NoYW5uZWxzID0gMCwKIAl9OwogCXU4IGxhbmVzWzRdOwotCXUzMiBudW1f
bGFuZXMsIGk7CisJaW50IG51bV9sYW5lcywgaTsKIAogCWlmICghb2ZfcHJvcGVydHlfcmVhZF9i
b29sKGRldi0+b2Zfbm9kZSwgIiNzb3VuZC1kYWktY2VsbHMiKSkgewogCQlkZXZfZGJnKGRldiwg
IiVzOiBObyBcIiNzb3VuZC1kYWktY2VsbHNcIiwgbm8gYXVkaW9cbiIsCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
