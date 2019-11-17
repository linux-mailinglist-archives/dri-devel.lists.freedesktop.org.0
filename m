Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94221FFC58
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 00:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFE56E02B;
	Sun, 17 Nov 2019 23:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6897E89CA2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 23:54:03 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAHNftrX100387
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 18:54:02 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2way1yp2mh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 18:54:01 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <sbobroff@linux.ibm.com>;
 Sun, 17 Nov 2019 23:54:00 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 17 Nov 2019 23:53:57 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAHNrJOB40108386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 17 Nov 2019 23:53:19 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA3CCA405C;
 Sun, 17 Nov 2019 23:53:56 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75046A405B;
 Sun, 17 Nov 2019 23:53:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 17 Nov 2019 23:53:56 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E4648A025A;
 Mon, 18 Nov 2019 10:53:53 +1100 (AEDT)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/radeon: fix bad DMA from INTERRUPT_CNTL2
Date: Mon, 18 Nov 2019 10:53:53 +1100
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1574034832.git.sbobroff@linux.ibm.com>
References: <cover.1574034832.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19111723-0012-0000-0000-000003663539
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111723-0013-0000-0000-000021A1B852
Message-Id: <e7b71227c22e12321704f4761cd355cda418ff20.1574034832.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-17_05:2019-11-15,2019-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=790
 malwarescore=0 bulkscore=0 suspectscore=1 spamscore=0 adultscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911170227
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

VGhlIElOVEVSUlVQVF9DTlRMMiByZWdpc3RlciBleHBlY3RzIGEgdmFsaWQgRE1BIGFkZHJlc3Ms
IGJ1dCBpcwpjdXJyZW50bHkgc2V0IHdpdGggYSBHUFUgTUMgYWRkcmVzcy4gIFRoaXMgY2FuIGNh
dXNlIHByb2JsZW1zIG9uCnN5c3RlbXMgdGhhdCBkZXRlY3QgdGhlIHJlc3VsdGluZyBETUEgcmVh
ZCBmcm9tIGFuIGludmFsaWQgYWRkcmVzcwooZm91bmQgb24gYSBQb3dlcjggZ3Vlc3QpLgoKSW5z
dGVhZCwgdXNlIHRoZSBETUEgYWRkcmVzcyBvZiB0aGUgZHVtbXkgcGFnZSBiZWNhdXNlIGl0IHdp
bGwgYWx3YXlzCmJlIHNhZmUuCgpGaXhlczogZDhmNjBjZmM5MzQ1ICgiZHJtL3JhZGVvbi9rbXM6
IEFkZCBzdXBwb3J0IGZvciBpbnRlcnJ1cHRzIG9uIHI2eHgvcjd4eCBjaGlwcyAodjMpIikKRml4
ZXM6IDI1YTg1N2ZiZTk3MyAoImRybS9yYWRlb24va21zOiBhZGQgc3VwcG9ydCBmb3IgaW50ZXJy
dXB0cyBvbiBTSSIpCkZpeGVzOiBhNTk3ODFiYmU1MjggKCJkcm0vcmFkZW9uOiBhZGQgc3VwcG9y
dCBmb3IgaW50ZXJydXB0cyBvbiBDSUsgKHY1KSIpClNpZ25lZC1vZmYtYnk6IFNhbSBCb2Jyb2Zm
IDxzYm9icm9mZkBsaW51eC5pYm0uY29tPgotLS0KdjIgLSBTcGxpdCBhbWRncHUgY2hhbmdlcyBp
bnRvIHNlcGFyYXRlIHBhdGNoLgoKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgIHwgNCAr
Ky0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYyB8IDQgKystLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9zaS5jICAgfCA0ICsrLS0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
Y2lrLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jCmluZGV4IDYyZWFiODJhNjRmOS4u
ODk3NDQyNzU0ZmQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMKQEAgLTY5NjksOCArNjk2OSw4IEBAIHN0
YXRpYyBpbnQgY2lrX2lycV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCX0KIAog
CS8qIHNldHVwIGludGVycnVwdCBjb250cm9sICovCi0JLyogWFhYIHRoaXMgc2hvdWxkIGFjdHVh
bGx5IGJlIGEgYnVzIGFkZHJlc3MsIG5vdCBhbiBNQyBhZGRyZXNzLiBzYW1lIG9uIG9sZGVyIGFz
aWNzICovCi0JV1JFRzMyKElOVEVSUlVQVF9DTlRMMiwgcmRldi0+aWguZ3B1X2FkZHIgPj4gOCk7
CisJLyogc2V0IGR1bW15IHJlYWQgYWRkcmVzcyB0byBkdW1teSBwYWdlIGFkZHJlc3MgKi8KKwlX
UkVHMzIoSU5URVJSVVBUX0NOVEwyLCByZGV2LT5kdW1teV9wYWdlLmFkZHIgPj4gOCk7CiAJaW50
ZXJydXB0X2NudGwgPSBSUkVHMzIoSU5URVJSVVBUX0NOVEwpOwogCS8qIElIX0RVTU1ZX1JEX09W
RVJSSURFPTAgLSBkdW1teSByZWFkIGRpc2FibGVkIHdpdGggbXNpLCBlbmFibGVkIHdpdGhvdXQg
bXNpCiAJICogSUhfRFVNTVlfUkRfT1ZFUlJJREU9MSAtIGR1bW15IHJlYWQgY29udHJvbGxlZCBi
eSBJSF9EVU1NWV9SRF9FTgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYwppbmRleCBlOTM3Y2MwMTkxMGQuLjAz
M2JjNDY2YTg2MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKQEAgLTM2OTYsOCArMzY5Niw4IEBAIGlu
dCByNjAwX2lycV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCX0KIAogCS8qIHNl
dHVwIGludGVycnVwdCBjb250cm9sICovCi0JLyogc2V0IGR1bW15IHJlYWQgYWRkcmVzcyB0byBy
aW5nIGFkZHJlc3MgKi8KLQlXUkVHMzIoSU5URVJSVVBUX0NOVEwyLCByZGV2LT5paC5ncHVfYWRk
ciA+PiA4KTsKKwkvKiBzZXQgZHVtbXkgcmVhZCBhZGRyZXNzIHRvIGR1bW15IHBhZ2UgYWRkcmVz
cyAqLworCVdSRUczMihJTlRFUlJVUFRfQ05UTDIsIHJkZXYtPmR1bW15X3BhZ2UuYWRkciA+PiA4
KTsKIAlpbnRlcnJ1cHRfY250bCA9IFJSRUczMihJTlRFUlJVUFRfQ05UTCk7CiAJLyogSUhfRFVN
TVlfUkRfT1ZFUlJJREU9MCAtIGR1bW15IHJlYWQgZGlzYWJsZWQgd2l0aCBtc2ksIGVuYWJsZWQg
d2l0aG91dCBtc2kKIAkgKiBJSF9EVU1NWV9SRF9PVkVSUklERT0xIC0gZHVtbXkgcmVhZCBjb250
cm9sbGVkIGJ5IElIX0RVTU1ZX1JEX0VOCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3NpLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMKaW5kZXggMDU4OTRkMTk4YTc5
Li4xZDhlZmIwZWVmZGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMKQEAgLTU5OTcsOCArNTk5Nyw4IEBAIHN0
YXRpYyBpbnQgc2lfaXJxX2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJfQogCiAJ
Lyogc2V0dXAgaW50ZXJydXB0IGNvbnRyb2wgKi8KLQkvKiBzZXQgZHVtbXkgcmVhZCBhZGRyZXNz
IHRvIHJpbmcgYWRkcmVzcyAqLwotCVdSRUczMihJTlRFUlJVUFRfQ05UTDIsIHJkZXYtPmloLmdw
dV9hZGRyID4+IDgpOworCS8qIHNldCBkdW1teSByZWFkIGFkZHJlc3MgdG8gZHVtbXkgcGFnZSBh
ZGRyZXNzICovCisJV1JFRzMyKElOVEVSUlVQVF9DTlRMMiwgcmRldi0+ZHVtbXlfcGFnZS5hZGRy
ID4+IDgpOwogCWludGVycnVwdF9jbnRsID0gUlJFRzMyKElOVEVSUlVQVF9DTlRMKTsKIAkvKiBJ
SF9EVU1NWV9SRF9PVkVSUklERT0wIC0gZHVtbXkgcmVhZCBkaXNhYmxlZCB3aXRoIG1zaSwgZW5h
YmxlZCB3aXRob3V0IG1zaQogCSAqIElIX0RVTU1ZX1JEX09WRVJSSURFPTEgLSBkdW1teSByZWFk
IGNvbnRyb2xsZWQgYnkgSUhfRFVNTVlfUkRfRU4KLS0gCjIuMjIuMC4yMTYuZzAwYTJhOTZmYzkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
