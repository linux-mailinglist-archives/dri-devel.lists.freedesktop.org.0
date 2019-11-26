Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B7E109E49
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 13:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4AD6E11B;
	Tue, 26 Nov 2019 12:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD15C89D57;
 Tue, 26 Nov 2019 12:50:18 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQCnLEo128298;
 Tue, 26 Nov 2019 12:50:15 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2wewdr6fcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 12:50:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQCiXo7172077;
 Tue, 26 Nov 2019 12:50:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2wgvfjf04n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 12:50:14 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAQCoC3Q005686;
 Tue, 26 Nov 2019 12:50:12 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 26 Nov 2019 04:50:12 -0800
Date: Tue, 26 Nov 2019 15:50:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>
Subject: [PATCH] drm/i915: unmap the correct pointer in
 i915_error_object_create()
Message-ID: <20191126125003.zpczouqpyr7njwha@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260114
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260115
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=1tULCOdZtJgAhl4pLWcZ8NHA5tNDVBdmjjDfGzHnUHA=;
 b=LdevkYMY5O3MGyGpN8JaDGmkK8LUs4mjeCIhMyoDUhdFs5HfI7Ta1IFw5KTMENHtB0ut
 kQ3r6GMa3Q1BZ0z9NAgXlBGlqfb7mNADWpXhJjB+sk1uj2XPlVNYPo4KvH+viJjOfEOk
 OSaXnqkAtiEYTkrjqt3keA+/ZTdcogOCALgIYXV2OlJtdg+KP8q6lcRK4OtlBj/gtDtS
 IFMfwlxYtG0qGA1rUkRymVPmIRm+Git6CX+9bgqJf1K9a+bv4G8rLMcVkL1QuLoCqAI6
 dpvCYqEwk7Isa2LqwqVj8HwOZFGjQGcU3E0sYTnqsPeEbsGZtc1eyxGfmNd2ikOZ5mOm BA== 
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugc2hvdWxkIGJlIHVubWFwcGluZyAicGFnZSIgaW5zdGVhZCBvZiAicyIuICBUaGlzIGNvZGUg
b3JpZ2luYWxseSB1c2VkCmttYXBfYXRvbWljKCkgYmVmb3JlIGl0IHdhcyBjaGFuZ2VkIHRvIGtt
YXAoKS4gIFRoZSB0d28gbWFwcGluZwpmdW5jdGlvbnMgYXJlIGRpZmZlcmVudCB3aGljaCBsZWFk
cyB0byB0aGlzIGNvbW1vbiBtaXN0YWtlLgoKRml4ZXM6IDNlNzQ5ZjUxOTllMSAoImRybS9pOTE1
OiBBdm9pZCBhdG9taWMgY29udGV4dCBmb3IgZXJyb3IgY2FwdHVyZSIpClNpZ25lZC1vZmYtYnk6
IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2dwdV9lcnJvci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9ncHVfZXJyb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ3B1X2Vycm9y
LmMKaW5kZXggM2M4NWNiMGVlOTlmLi42ZmUyMzQ0NjMwM2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfZ3B1X2Vycm9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9ncHVfZXJyb3IuYwpAQCAtMTA0NSw3ICsxMDQ1LDcgQEAgaTkxNV9lcnJvcl9vYmplY3Rf
Y3JlYXRlKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1LAogCiAJCQlzID0ga21hcChwYWdl
KTsKIAkJCXJldCA9IGNvbXByZXNzX3BhZ2UoY29tcHJlc3MsIHMsIGRzdCk7Ci0JCQlrdW5tYXAo
cyk7CisJCQlrdW5tYXAocGFnZSk7CiAKIAkJCWRybV9jbGZsdXNoX3BhZ2VzKCZwYWdlLCAxKTsK
IAotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
