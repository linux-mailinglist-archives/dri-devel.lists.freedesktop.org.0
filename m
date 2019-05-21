Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B099726608
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12CE89B97;
	Wed, 22 May 2019 14:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8603689123
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 05:28:52 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4L5MTG5015732
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 01:28:51 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sma1g27je-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 01:28:50 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <sbobroff@linux.ibm.com>;
 Tue, 21 May 2019 06:28:48 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 May 2019 06:28:45 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4L5SiV059572378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 05:28:44 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA05AAE05D;
 Tue, 21 May 2019 05:28:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88D5EAE078;
 Tue, 21 May 2019 05:28:41 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 May 2019 05:28:41 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 49FC8A01D2;
 Tue, 21 May 2019 15:28:39 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/bochs: Fix connector leak during driver unload
Date: Tue, 21 May 2019 15:28:39 +1000
X-Mailer: git-send-email 2.19.0.2.gcad72f5712
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19052105-0016-0000-0000-0000027DD57A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052105-0017-0000-0000-000032DABD87
Message-Id: <93b363ad62f4938d9ddf3e05b2a61e3f66b2dcd3.1558416473.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905210035
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB1bmxvYWRpbmcgdGhlIGJvY2hzLWRybSBkcml2ZXIsIGEgd2FybmluZyBtZXNzYWdlIGlz
IHByaW50ZWQgYnkKZHJtX21vZGVfY29uZmlnX2NsZWFudXAoKSBiZWNhdXNlIGEgcmVmZXJlbmNl
IGlzIHN0aWxsIGhlbGQgdG8gb25lIG9mCnRoZSBkcm1fY29ubmVjdG9yIHN0cnVjdHMuCgpDb3Jy
ZWN0IHRoaXMgYnkgY2FsbGluZyBkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bigpIGluCmJvY2hz
X3BjaV9yZW1vdmUoKS4KClRoZSBpc3N1ZSBpcyBjYXVzZWQgYnkgdGhlIGludGVyYWN0aW9uIG9m
IHR3byBwcmV2aW91cyBjb21taXRzLiBCb3RoCnRvZ2V0aGVyIGFyZSByZXF1aXJlZCB0byBjYXVz
ZSBpdDoKRml4ZXM6IDg0NmM3ZGZjMTE5MyAoImRybS9hdG9taWM6IFRyeSB0byBwcmVzZXJ2ZSB0
aGUgY3J0YyBlbmFibGVkIHN0YXRlIGluIGRybV9hdG9taWNfcmVtb3ZlX2ZiLCB2Mi4iKQpGaXhl
czogNjU3OWMzOTU5NGFlICgiZHJtL2JvY2hzOiBhdG9taWM6IHN3aXRjaCBwbGFuZXMgdG8gYXRv
bWljLCB3aXJlIHVwIGhlbHBlcnMuIikKClNpZ25lZC1vZmYtYnk6IFNhbSBCb2Jyb2ZmIDxzYm9i
cm9mZkBsaW51eC5pYm0uY29tPgotLS0KSGVsbG8sCgpUaGlzIHNlZW1zIHRvIGJlIHNpbWlsYXIg
dG8gYW4gaXNzdWUgSSByZWNlbnRseSBmaXhlZCBmb3IgdGhlIEFTVCBkcml2ZXI6CjFlNjEzZjNj
NjMwYyAoImRybS9hc3Q6IEZpeCBjb25uZWN0b3IgbGVhayBkdXJpbmcgZHJpdmVyIHVubG9hZCIp
CldoaWNoIGlzIHNpbWlsYXIgdG8gYXQgbGVhc3Qgb25lIG90aGVyIHJlY2VudCBmaXg6CjE5MmI0
YWY2Y2QyOCAoImRybS90ZWdyYTogU2h1dGRvd24gb24gZHJpdmVyIHVuYmluZCIpCgpUaGUgZml4
IHNlZW1zIHRvIGJlIHRoZSBzYW1lLCBidXQgdGhpcyB0aW1lIEkndmUgdHJpZWQgdG8gZGlnIGEg
bGl0dGxlIGRlZXBlcgphbmQgdXNlIGFuIGFwcHJvcHJpYXRlIEZpeGVzIHRhZyB0byBhc3Npc3Qg
YmFja3BvcnRpbmcuCgpCaXNlY3RpbmcgdGhlIGlzc3VlIGZvciBjb21taXRzIHRvIGRyaXZlcnMv
Z3B1L2RybS9ib2Nocy8gcG9pbnRzIHRvOgo2NTc5YzM5NTk0YWUgKCJkcm0vYm9jaHM6IGF0b21p
Yzogc3dpdGNoIHBsYW5lcyB0byBhdG9taWMsIHdpcmUgdXAgaGVscGVycy4iKQouLi4gYnV0IHRo
ZSBpc3N1ZSBhbHNvIHNlZW1zIHRvIGJlIGR1ZSB0byBhIGNoYW5nZSBpbiB0aGUgZ2VuZXJpYyBk
cm0gY29kZQoocmV2ZXJ0aW5nIGl0IHNlcGFyYXRlbHkgZml4ZXMgdGhlIGlzc3VlKToKODQ2Yzdk
ZmMxMTkzICgiZHJtL2F0b21pYzogVHJ5IHRvIHByZXNlcnZlIHRoZSBjcnRjIGVuYWJsZWQgc3Rh
dGUgaW4gZHJtX2F0b21pY19yZW1vdmVfZmIsIHYyLiIpCi4uLiBzbyBJJ3ZlIGluY2x1ZGVkIGJv
dGggaW4gdGhlIGNvbW1pdC4gIElzIHRoYXQgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvPwoKSSBjb3Vs
ZG4ndCBoZWxwIHdvbmRlcmluZyBpZiB3ZSBzaG91bGQgYWxzbyB1cGRhdGUgdGhlIGNvbW1lbnQg
Zm9yCmRybV9mYmRldl9nZW5lcmljX3NldHVwKCksIGJlY2F1c2UgaXQgc2F5czoKIlRoZSBmYmRl
diBpcyBkZXN0cm95ZWQgYnkgZHJtX2Rldl91bnJlZ2lzdGVyKCkiCi4uLiB3aGljaCBpbXBsaWVz
IHRvIG1lIHRoYXQgY2xlYW51cCBvbmx5IHJlcXVpcmVzIHRoYXQgY2FsbCwgYnV0IGFjdHVhbGx5
CnNpbmNlIDg0NmM3ZGZjMTE5MyB5b3Ugd2lsbCBhbHdheXMoPykgbmVlZCB0byB1c2UgZHJtX2F0
b21pY19oZWxwZXJfc2h1dGRvd24oKQphcyB3ZWxsLiAoSXMgaXQgYWN0dWFsbHkgYWx3YXlzIHRo
ZSBjYXNlPykKCkNoZWVycywKU2FtLgoKIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19kcnYu
YyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMv
Ym9jaHNfZHJ2LmMKaW5kZXggNmI2ZTAzNzI1OGMzLi43MDMxZjAxNjg3OTUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
Ym9jaHMvYm9jaHNfZHJ2LmMKQEAgLTEwLDYgKzEwLDcgQEAKICNpbmNsdWRlIDxsaW51eC9zbGFi
Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3By
b2JlX2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgogCiAjaW5j
bHVkZSAiYm9jaHMuaCIKIApAQCAtMTc0LDYgKzE3NSw3IEBAIHN0YXRpYyB2b2lkIGJvY2hzX3Bj
aV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiB7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRl
diA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAorCWRybV9hdG9taWNfaGVscGVyX3NodXRkb3du
KGRldik7CiAJZHJtX2Rldl91bnJlZ2lzdGVyKGRldik7CiAJYm9jaHNfdW5sb2FkKGRldik7CiAJ
ZHJtX2Rldl9wdXQoZGV2KTsKLS0gCjIuMTkuMC4yLmdjYWQ3MmY1NzEyCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
