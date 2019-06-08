Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2117839C18
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 11:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272D0892A8;
	Sat,  8 Jun 2019 09:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4227589269;
 Sat,  8 Jun 2019 09:24:16 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x589IQg0042082;
 Sat, 8 Jun 2019 09:24:11 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 2t02he8vnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Jun 2019 09:24:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x589OA4T019708;
 Sat, 8 Jun 2019 09:24:10 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2t0aa900ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 08 Jun 2019 09:24:10 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x589O7cj030247;
 Sat, 8 Jun 2019 09:24:07 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 08 Jun 2019 02:24:06 -0700
Date: Sat, 8 Jun 2019 12:23:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>, xinhui pan <xinhui.pan@amd.com>
Subject: [PATCH] drm/amdgpu: Fix bounds checking in amdgpu_ras_is_supported()
Message-ID: <20190608092357.GB28890@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906080071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906080071
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=UEF3RcNQbMOhraajwl43bUezUG05vQzOtXc/1mdAqAk=;
 b=HbS9hhY4LusW456YSOonTNPlWmqlBq701uOKqKe7BGWLQ38L/UyPxqt/5+y9oBKb9p7Q
 T9ovTncV1/xBFq7I9rUdC0ND0WvpnDUnqaMD77IfzyfdLN46cfRl8U67wBMry4AD9saW
 SH1b6cFPZr4mElF9AK+IDFPnyVhceYPSxAMdtSZLPTriz6h5mycidljdn4sgda0mtIvE
 DknS82qxTT5wNWyhOV8liIkdwcuzGpdfqWZKP28ihIzBLQ5M59zT9n60VkC8iwKuYxPc
 1Sv+tOSO5HtpG0BxbU4Azr9W3C0OyLWRGlPgKt7Nj3oCMvQnoE2E+JvgNgBoSuA8iMks Kw== 
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
Cc: Evan Quan <evan.quan@amd.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, James Zhu <James.Zhu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJibG9jayIgdmFyaWFibGUgY2FuIGJlIHNldCBieSB0aGUgdXNlciB0aHJvdWdoIGRlYnVn
ZnMsIHNvIGl0IGNhbgpiZSBxdWl0ZSBsYXJnZSB3aGljaCBsZWFkcyB0byBzaGlmdCB3cmFwcGlu
ZyBoZXJlLiAgVGhpcyBtZWFucyB3ZSByZXBvcnQKYSAiYmxvY2siIGFzIHN1cHBvcnRlZCB3aGVu
IGl0J3Mgbm90LCBhbmQgdGhhdCBsZWFkcyB0byBhcnJheSBvdmVyZmxvd3MKbGF0ZXIgb24uCgpU
aGlzIGJ1ZyBpcyBub3QgcmVhbGx5IGEgc2VjdXJpdHkgaXNzdWUgaW4gcmVhbCBsaWZlLCBiZWNh
dXNlIGRlYnVnZnMgaXMKZ2VuZXJhbGx5IHJvb3Qgb25seS4KCkZpeGVzOiAzNmVhMWJkMmQwODQg
KCJkcm0vYW1kZ3B1OiBhZGQgZGVidWdmcyBjdHJsIG5vZGUiKQpTaWduZWQtb2ZmLWJ5OiBEYW4g
Q2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAppbmRleCBjNmIz
NGZiZDY5NWYuLjk0YzY1MmY1MjY1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuaApAQCAtMTczLDYgKzE3Myw4IEBAIHN0YXRpYyBpbmxpbmUgaW50IGFtZGdwdV9yYXNf
aXNfc3VwcG9ydGVkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogewogCXN0cnVjdCBhbWRn
cHVfcmFzICpyYXMgPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpOwogCisJaWYgKGJsb2Nr
ID49IEFNREdQVV9SQVNfQkxPQ0tfQ09VTlQpCisJCXJldHVybiAwOwogCXJldHVybiByYXMgJiYg
KHJhcy0+c3VwcG9ydGVkICYgKDEgPDwgYmxvY2spKTsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
