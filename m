Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C63BCFFC59
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 00:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CF76E042;
	Sun, 17 Nov 2019 23:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BBB89F99
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 23:54:03 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAHNfsBW010428
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 18:54:01 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2waym8wjtj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 18:54:01 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <sbobroff@linux.ibm.com>;
 Sun, 17 Nov 2019 23:54:00 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 17 Nov 2019 23:53:57 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAHNrJBH25952568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 17 Nov 2019 23:53:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C527B42045;
 Sun, 17 Nov 2019 23:53:56 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7109C42041;
 Sun, 17 Nov 2019 23:53:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 17 Nov 2019 23:53:56 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F1666A02D4;
 Mon, 18 Nov 2019 10:53:53 +1100 (AEDT)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/amdgpu: fix bad DMA from INTERRUPT_CNTL2
Date: Mon, 18 Nov 2019 10:53:54 +1100
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1574034832.git.sbobroff@linux.ibm.com>
References: <cover.1574034832.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19111723-0016-0000-0000-000002C63AD0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111723-0017-0000-0000-00003327E877
Message-Id: <d7554ed7f29a5b792cfab8af5d5131271927a952.1574034832.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-17_05:2019-11-15,2019-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=1 adultscore=0
 mlxscore=0 suspectscore=1 spamscore=0 clxscore=1015 lowpriorityscore=1
 phishscore=0 mlxlogscore=605 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
bGwgYWx3YXlzCmJlIHNhZmUuCgpGaXhlczogMjdhZTEwNjQxZTljICgiZHJtL2FtZGdwdTogYWRk
IGludGVydXB0IGhhbmRsZXIgaW1wbGVtZW50YXRpb24gZm9yIHNpIHYzIikKU2lnbmVkLW9mZi1i
eTogU2FtIEJvYnJvZmYgPHNib2Jyb2ZmQGxpbnV4LmlibS5jb20+Ci0tLQp2MiAqIE5ldyBpbiB0
aGlzIHZlcnNpb24uCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfaWguYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfaWguYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NpX2loLmMKaW5kZXggNTdiYjVmOWUwOGIyLi44OGFlMjdhNWEwM2QgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpX2loLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfaWguYwpAQCAtNjQsNyArNjQsOCBAQCBzdGF0aWMgaW50
IHNpX2loX2lycV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXUzMiBpbnRlcnJ1
cHRfY250bCwgaWhfY250bCwgaWhfcmJfY250bDsKIAogCXNpX2loX2Rpc2FibGVfaW50ZXJydXB0
cyhhZGV2KTsKLQlXUkVHMzIoSU5URVJSVVBUX0NOVEwyLCBhZGV2LT5pcnEuaWguZ3B1X2FkZHIg
Pj4gOCk7CisJLyogc2V0IGR1bW15IHJlYWQgYWRkcmVzcyB0byBkdW1teSBwYWdlIGFkZHJlc3Mg
Ki8KKwlXUkVHMzIoSU5URVJSVVBUX0NOVEwyLCBhZGV2LT5kdW1teV9wYWdlX2FkZHIgPj4gOCk7
CiAJaW50ZXJydXB0X2NudGwgPSBSUkVHMzIoSU5URVJSVVBUX0NOVEwpOwogCWludGVycnVwdF9j
bnRsICY9IH5JSF9EVU1NWV9SRF9PVkVSUklERTsKIAlpbnRlcnJ1cHRfY250bCAmPSB+SUhfUkVR
X05PTlNOT09QX0VOOwotLSAKMi4yMi4wLjIxNi5nMDBhMmE5NmZjOQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
