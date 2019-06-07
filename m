Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C299384FA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08429899EA;
	Fri,  7 Jun 2019 07:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE68899DC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 07:27:29 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577EjJS060387;
 Fri, 7 Jun 2019 07:27:21 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2sugstvm04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2019 07:27:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x577QbRU086473;
 Fri, 7 Jun 2019 07:27:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2swnhb61mr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jun 2019 07:27:21 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x577REfP027068;
 Fri, 7 Jun 2019 07:27:14 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 Jun 2019 00:27:13 -0700
Date: Fri, 7 Jun 2019 10:27:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Jyri Sarha <jsarha@ti.com>
Subject: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent out
 of bounds read
Message-ID: <20190607072704.GA25229@mwanda>
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
 engine=8.0.1-1810050000 definitions=main-1906070052
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9280
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906070052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=1l1gN+Cj3gB+hD12RqqJU++Iob/ZFBye8FgdiJ1WcTY=;
 b=nyE5axnLNNk26ju6uKOs//yJIaWmh1aqyalk/ZKyGELzA5uJtQWCILPkIgIMXkhLVTf0
 owqz/ZaTN9sH1exi+fP1bepa33ZUNPy7Jc+1zuO8JDD0Js0dqy4bKULs7c+UUSEO3efA
 hapXXp0gLA8piyN7ZM1FSoM37g9TWMtX1v5J0jlwR2S5hx7jYLsAzNByTQsQhMV7vEoe
 BThx23S1bPlCtd/i0lKo9RBrwjbkPkqPDgD57PvzMkqCtWBoV5sldaAT8bXVqVARI1ih
 9ILP+tnzyMr5wtOedIlwiEB+ydbE+smZHR9G0mN7owSI1LzZGNc0U/yVJVOR1lVelN8+ Qw== 
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

VGhpcyBzaG91bGQgY2hlY2sgdGhhdCAiaSIgaXMgd2l0aGluIGJvdW5kcyBiZWZvcmUgY2hlY2tp
bmcgcmVhZGluZyBmcm9tCnRoZSBhcnJheS4KCkZpeGVzOiBmZjU3ODE2MzRjNDEgKCJkcm0vYnJp
ZGdlOiBzaWk5MDJ4OiBJbXBsZW1lbnQgSERNSSBhdWRpbyBzdXBwb3J0IikKU2lnbmVkLW9mZi1i
eTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKaW5kZXgg
ZDZmOThkMzg4YWMyLi42YjAzNjE2ZDZiYzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc2lpOTAyeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCkBA
IC01ODksOCArNTg5LDggQEAgc3RhdGljIGludCBzaWk5MDJ4X2F1ZGlvX2h3X3BhcmFtcyhzdHJ1
Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAKLQlm
b3IgKGkgPSAwOyBzaWk5MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5jZVtpXSAmJgotCQkgICAg
IGkgPCBBUlJBWV9TSVpFKHNpaTkwMngtPmF1ZGlvLmkyc19maWZvX3NlcXVlbmNlKTsgaSsrKQor
CWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNpaTkwMngtPmF1ZGlvLmkyc19maWZvX3NlcXVl
bmNlKSAmJgorCQkgICAgc2lpOTAyeC0+YXVkaW8uaTJzX2ZpZm9fc2VxdWVuY2VbaV07IGkrKykK
IAkJcmVnbWFwX3dyaXRlKHNpaTkwMngtPnJlZ21hcCwKIAkJCSAgICAgU0lJOTAyWF9UUElfSTJT
X0VOQUJMRV9NQVBQSU5HX1JFRywKIAkJCSAgICAgc2lpOTAyeC0+YXVkaW8uaTJzX2ZpZm9fc2Vx
dWVuY2VbaV0pOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
