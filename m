Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49B1FD2E3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 03:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCC56F3DA;
	Fri, 15 Nov 2019 02:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1146 seconds by postgrey-1.36 at gabe;
 Fri, 15 Nov 2019 02:25:05 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7966F3DC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 02:25:05 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAF24kRT057764
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 21:05:56 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9jwqg2sf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 21:05:50 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <sbobroff@linux.ibm.com>;
 Fri, 15 Nov 2019 02:04:58 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Nov 2019 02:04:55 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAF24tSk46465378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 02:04:55 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E562642041;
 Fri, 15 Nov 2019 02:04:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 501984203F;
 Fri, 15 Nov 2019 02:04:54 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Nov 2019 02:04:54 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EACF1A00EC;
 Fri, 15 Nov 2019 13:04:51 +1100 (AEDT)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/radeon drm/amdgpu: fix bad DMA from INTERRUPT_CNTL2
Date: Fri, 15 Nov 2019 13:04:52 +1100
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19111502-0028-0000-0000-000003B70044
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111502-0029-0000-0000-0000247A0F91
Message-Id: <0657d1ec504d2f58de5835f4d67625b583005a09.1573783477.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_07:2019-11-14,2019-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150015
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
dCBmb3IgaW50ZXJydXB0cyBvbiBDSUsgKHY1KSIpCkZpeGVzOiAyN2FlMTA2NDFlOWMgKCJkcm0v
YW1kZ3B1OiBhZGQgaW50ZXJ1cHQgaGFuZGxlciBpbXBsZW1lbnRhdGlvbiBmb3Igc2kgdjMiKQpT
aWduZWQtb2ZmLWJ5OiBTYW0gQm9icm9mZiA8c2JvYnJvZmZAbGludXguaWJtLmNvbT4KLS0tCkEg
Y291cGxlIG9mIG5vdGVzOgotIEluaXRpYWwgZGlzY3Vzc2lvbjoKICBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1Ob3ZlbWJlci8yNDQwOTAuaHRt
bAotIEkgaGF2ZSBvbmx5IHRlc3RlZCB0aGUgY2FzZSB0aGF0IHVzZXMgcjYwMF9pcnFfaW5pdCgp
LCBidXQgdGhleSBhcmUgYWxsIHZlcnkKICBzaW1pbGFyLgotIEkndmUgaW5jbHVkZWQgYSBmaXhl
cyB0YWcgZm9yIGVhY2ggY2hhbmdlLCBidXQgSSBkb24ndCBrbm93IGlmIHRoYXQncyB0aGUKICBy
aWdodCB0aGluZyB0byBkbyBpbiB0aGlzIGNhc2UgKHBsZWFzZSBmZWVsIGZyZWUgdG8gZml4IHRo
ZW0gb24gY29tbWl0IG9yCiAgd2hhdGV2ZXIpLgoKQ2hlZXJzLApTYW0uCgogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2lfaWguYyB8IDMgKystCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Np
ay5jICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYyAgICAgIHwg
NCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMgICAgICAgIHwgNCArKy0tCiA0IGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaV9paC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc2lfaWguYwppbmRleCA1N2JiNWY5ZTA4YjIuLjg4YWUyN2E1YTAzZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfaWguYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zaV9paC5jCkBAIC02NCw3ICs2NCw4IEBAIHN0YXRpYyBpbnQgc2lf
aWhfaXJxX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJdTMyIGludGVycnVwdF9j
bnRsLCBpaF9jbnRsLCBpaF9yYl9jbnRsOwogCiAJc2lfaWhfZGlzYWJsZV9pbnRlcnJ1cHRzKGFk
ZXYpOwotCVdSRUczMihJTlRFUlJVUFRfQ05UTDIsIGFkZXYtPmlycS5paC5ncHVfYWRkciA+PiA4
KTsKKwkvKiBzZXQgZHVtbXkgcmVhZCBhZGRyZXNzIHRvIGR1bW15IHBhZ2UgYWRkcmVzcyAqLwor
CVdSRUczMihJTlRFUlJVUFRfQ05UTDIsIGFkZXYtPmR1bW15X3BhZ2VfYWRkciA+PiA4KTsKIAlp
bnRlcnJ1cHRfY250bCA9IFJSRUczMihJTlRFUlJVUFRfQ05UTCk7CiAJaW50ZXJydXB0X2NudGwg
Jj0gfklIX0RVTU1ZX1JEX09WRVJSSURFOwogCWludGVycnVwdF9jbnRsICY9IH5JSF9SRVFfTk9O
U05PT1BfRU47CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYwppbmRleCA2MmVhYjgyYTY0ZjkuLjg5NzQ0Mjc1NGZk
MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL2Npay5jCkBAIC02OTY5LDggKzY5NjksOCBAQCBzdGF0aWMgaW50IGNp
a19pcnFfaW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKIAl9CiAKIAkvKiBzZXR1cCBp
bnRlcnJ1cHQgY29udHJvbCAqLwotCS8qIFhYWCB0aGlzIHNob3VsZCBhY3R1YWxseSBiZSBhIGJ1
cyBhZGRyZXNzLCBub3QgYW4gTUMgYWRkcmVzcy4gc2FtZSBvbiBvbGRlciBhc2ljcyAqLwotCVdS
RUczMihJTlRFUlJVUFRfQ05UTDIsIHJkZXYtPmloLmdwdV9hZGRyID4+IDgpOworCS8qIHNldCBk
dW1teSByZWFkIGFkZHJlc3MgdG8gZHVtbXkgcGFnZSBhZGRyZXNzICovCisJV1JFRzMyKElOVEVS
UlVQVF9DTlRMMiwgcmRldi0+ZHVtbXlfcGFnZS5hZGRyID4+IDgpOwogCWludGVycnVwdF9jbnRs
ID0gUlJFRzMyKElOVEVSUlVQVF9DTlRMKTsKIAkvKiBJSF9EVU1NWV9SRF9PVkVSUklERT0wIC0g
ZHVtbXkgcmVhZCBkaXNhYmxlZCB3aXRoIG1zaSwgZW5hYmxlZCB3aXRob3V0IG1zaQogCSAqIElI
X0RVTU1ZX1JEX09WRVJSSURFPTEgLSBkdW1teSByZWFkIGNvbnRyb2xsZWQgYnkgSUhfRFVNTVlf
UkRfRU4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKaW5kZXggZTkzN2NjMDE5MTBkLi4wMzNiYzQ2NmE4NjIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcjYwMC5jCkBAIC0zNjk2LDggKzM2OTYsOCBAQCBpbnQgcjYwMF9pcnFf
aW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKIAl9CiAKIAkvKiBzZXR1cCBpbnRlcnJ1
cHQgY29udHJvbCAqLwotCS8qIHNldCBkdW1teSByZWFkIGFkZHJlc3MgdG8gcmluZyBhZGRyZXNz
ICovCi0JV1JFRzMyKElOVEVSUlVQVF9DTlRMMiwgcmRldi0+aWguZ3B1X2FkZHIgPj4gOCk7CisJ
Lyogc2V0IGR1bW15IHJlYWQgYWRkcmVzcyB0byBkdW1teSBwYWdlIGFkZHJlc3MgKi8KKwlXUkVH
MzIoSU5URVJSVVBUX0NOVEwyLCByZGV2LT5kdW1teV9wYWdlLmFkZHIgPj4gOCk7CiAJaW50ZXJy
dXB0X2NudGwgPSBSUkVHMzIoSU5URVJSVVBUX0NOVEwpOwogCS8qIElIX0RVTU1ZX1JEX09WRVJS
SURFPTAgLSBkdW1teSByZWFkIGRpc2FibGVkIHdpdGggbXNpLCBlbmFibGVkIHdpdGhvdXQgbXNp
CiAJICogSUhfRFVNTVlfUkRfT1ZFUlJJREU9MSAtIGR1bW15IHJlYWQgY29udHJvbGxlZCBieSBJ
SF9EVU1NWV9SRF9FTgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5jCmluZGV4IDA1ODk0ZDE5OGE3OS4uMWQ4ZWZiMGVl
ZmRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9zaS5jCkBAIC01OTk3LDggKzU5OTcsOCBAQCBzdGF0aWMgaW50IHNp
X2lycV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCX0KIAogCS8qIHNldHVwIGlu
dGVycnVwdCBjb250cm9sICovCi0JLyogc2V0IGR1bW15IHJlYWQgYWRkcmVzcyB0byByaW5nIGFk
ZHJlc3MgKi8KLQlXUkVHMzIoSU5URVJSVVBUX0NOVEwyLCByZGV2LT5paC5ncHVfYWRkciA+PiA4
KTsKKwkvKiBzZXQgZHVtbXkgcmVhZCBhZGRyZXNzIHRvIGR1bW15IHBhZ2UgYWRkcmVzcyAqLwor
CVdSRUczMihJTlRFUlJVUFRfQ05UTDIsIHJkZXYtPmR1bW15X3BhZ2UuYWRkciA+PiA4KTsKIAlp
bnRlcnJ1cHRfY250bCA9IFJSRUczMihJTlRFUlJVUFRfQ05UTCk7CiAJLyogSUhfRFVNTVlfUkRf
T1ZFUlJJREU9MCAtIGR1bW15IHJlYWQgZGlzYWJsZWQgd2l0aCBtc2ksIGVuYWJsZWQgd2l0aG91
dCBtc2kKIAkgKiBJSF9EVU1NWV9SRF9PVkVSUklERT0xIC0gZHVtbXkgcmVhZCBjb250cm9sbGVk
IGJ5IElIX0RVTU1ZX1JEX0VOCi0tIAoyLjIyLjAuMjE2LmcwMGEyYTk2ZmM5CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
