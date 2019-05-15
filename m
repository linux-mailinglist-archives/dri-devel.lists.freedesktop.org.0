Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D586E1EB6E
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 11:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16C6897E8;
	Wed, 15 May 2019 09:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F99897E8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 09:51:47 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4F9iIYM108706;
 Wed, 15 May 2019 09:51:43 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2sdnttuph6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 May 2019 09:51:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4F9pMKt020222;
 Wed, 15 May 2019 09:51:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2sggdur2nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 May 2019 09:51:42 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4F9pdcq005716;
 Wed, 15 May 2019 09:51:39 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 15 May 2019 02:51:39 -0700
Date: Wed, 15 May 2019 12:51:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>
Subject: [PATCH] drm/amd/powerplay: fix locking in smu_feature_set_supported()
Message-ID: <20190515095130.GF3409@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905150063
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905150063
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=hTSKDL8zkeZ4HUn7umTph6LN7jixr5+DzfTaKalFJUg=;
 b=oG7eN65wu9iqD+5CbxfZghtCGh+tzsvaQy7ytoPvzLlmC2lA+bx75unguEMMJd+OghgY
 QkH20/NOAnRsuzhYUNAXOwAl+YlrwpzS6topKKvaDHmJ+Guwd6FoR+WHI8yHzhfhj5Tq
 jHjbYpRxG+vBMGVhteYO2Y1vayR2wxyNvoFvz9fKa8x9+s3XHhNCMOSNPNn9Kq7fUrWX
 UhToDeHcaqhPTsv5CvSulGupHL/BG6FDE1GQKNwJEQGz8FeM8GT2x53cDIjwBRWJjAkS
 HUFFyyUc0Pl8RDxa/bMblLY0GG5qI0WjAVfY7jqsUUP33f5jJMEIPV6BXjXwQEBEPgcS bQ== 
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
Cc: Chengming Gui <Jack.Gui@amd.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Likun Gao <Likun.Gao@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgYSB0eXBvIHNvIHRoZSBjb2RlIHVubG9ja3MgdHdpY2UgaW5zdGVhZCBvZiB0YWtp
bmcgdGhlIGxvY2sgYW5kCnRoZW4gcmVsZWFzaW5nIGl0LgoKRml4ZXM6IGYxNGEzMjNkYjViMCAo
ImRybS9hbWQvcG93ZXJwbGF5OiBpbXBsZW1lbnQgdXBkYXRlIGVuYWJsZWQgZmVhdHVyZSBzdGF0
ZSB0byBzbWMgZm9yIHNtdTExIikKU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNh
cnBlbnRlckBvcmFjbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRl
eCA1MmQ5MTlhOGI3MGEuLjg1YWMyOWFmNTM2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtMzEwLDcgKzMxMCw3IEBAIGludCBzbXVfZmVhdHVyZV9z
ZXRfc3VwcG9ydGVkKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBpbnQgZmVhdHVyZV9pZCwKIAog
CVdBUk5fT04oZmVhdHVyZV9pZCA+IGZlYXR1cmUtPmZlYXR1cmVfbnVtKTsKIAotCW11dGV4X3Vu
bG9jaygmZmVhdHVyZS0+bXV0ZXgpOworCW11dGV4X2xvY2soJmZlYXR1cmUtPm11dGV4KTsKIAlp
ZiAoZW5hYmxlKQogCQl0ZXN0X2FuZF9zZXRfYml0KGZlYXR1cmVfaWQsIGZlYXR1cmUtPnN1cHBv
cnRlZCk7CiAJZWxzZQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
