Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E42A0FBE0A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 03:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DDD6E159;
	Thu, 14 Nov 2019 02:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1022 seconds by postgrey-1.36 at gabe;
 Thu, 14 Nov 2019 02:53:14 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034416E159
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 02:53:14 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAE2XrAL096159
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 21:36:08 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w7qdc1k24-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 21:36:08 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <dri-devel@lists.freedesktop.org> from <sbobroff@linux.ibm.com>;
 Thu, 14 Nov 2019 02:36:06 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 14 Nov 2019 02:36:05 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAE2a4BQ42205452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 02:36:04 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BE424C046
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 02:36:04 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B0834C04E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 02:36:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 02:36:04 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7407DA0150
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 13:36:01 +1100 (AEDT)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 1/1] drm/radeon: fix bad DMA from INTERRUPT_CNTL2
Date: Thu, 14 Nov 2019 13:36:02 +1100
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19111402-4275-0000-0000-0000037D8B0C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111402-4276-0000-0000-00003890EEFF
Message-Id: <7251833ab9439f4e34ba3fb2c5daf6c9e01b6551.1573698927.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911140021
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

Q3VycmVudGx5LCBiaW5kaW5nIHRoZSByYWRlb24gZHJpdmVyIHRvIGEgUmFkZW9uIEZpcmVQcm8g
KFBDSQoxMDAyOjY4ZjIpIHRoYXQgaGFzIGJlZW4gcGFzc2VkIHRocm91Z2ggdG8gYSBndWVzdCBv
biBhIFBvd2VyOCBtYWNoaW5lCmNhdXNlcyBhIGJhZCBETUEgcmVhZCB3aGljaCBjYXVzZXMgdGhl
IGRldmljZSB0byBiZSBmcm96ZW4sIGxlYWRpbmcgdG8KdGhlIGRyaXZlciBmYWlsaW5nIHRvIGJp
bmQgYW5kIG90aGVyIHByb2JsZW1zLgoKVGhlIGJhZCBETUEgaXMgdG8gdGhlIGFkZHJlc3Mgd3Jp
dHRlbiBpbnRvIHRoZSBJTlRFUlJVUFRfQ05UTDIKcmVnaXN0ZXIgZHVyaW5nIHI2MDBfaXJxX2lu
aXQoKSwgYW5kIGl0IGNhbiBiZSBmaXhlZCBieSBzdWJzdGl0dXRpbmcgYQp2YWxpZCAoZHVtbXkp
IERNQSBhZGRyZXNzLgotLS0KSGVsbG8sCgpJJ3ZlIGJlZW4gdHJhY2tpbmcgZG93biBhIGJ1Zywg
ZGVzY3JpYmVkIGFib3ZlLCBhbmQgSSd2ZSBiZWVuIGFibGUgdG8gaGFjawppbiBhIHdvcmthcm91
bmQgYnV0IEkgY291bGQgdXNlIHNvbWUgaGVscCB1bmRlcnN0YW5kaW5nIGhvdyB0byBmaXggaXQK
cHJvcGVybHkuCgpXaGF0IHNlZW1zIHRvIGJlIGhhcHBlbmluZyBpcyB0aGF0IHdoZW4gdGhlIGZp
cnN0IENSVEMgaXMgZW5hYmxlZCAod2hlbgpldmVyZ3JlZW5faXJxX3NldCgpIHdyaXRlcyB0byBH
UlBIX0lOVF9DT05UUk9MKSB0aGUgZGV2aWNlIGltbWVkaWF0ZWx5CnBlcmZvcm1zIGEgRE1BIHJl
YWQgZnJvbSB0aGUgYWRkcmVzcyB0aGF0J3MgYmVlbiBwcm9ncmFtbWVkIGludG8KSU5URVJSVVBU
X0NOVEwyIGJ5IHI2MDBfaXJxX2luaXQoKS4KClRoYXQgYWRkcmVzcyBpc24ndCBhIHZhbGlkIERN
QSBhZGRyZXNzLCBzbyBpdCB0cmlnZ2VycyB0aGUgcHJvYmxlbS4gVGhlCmFkZHJlc3MgY29tZXMg
ZnJvbSByZGV2LT5paC5ncHVfYWRkciwgd2hpY2ggc2VlbXMgdG8gYmUgYSAnbGluZWFyIEdQVQph
ZGRyZXNzJywgY2FsY3VsYXRlZCBmcm9tIHRoZSBzaXplIG9mIHRoZSBjYXJkJ3MgVlJBTS4gSXQg
ZGVmaW5pdGVseSBoYXNuJ3QKY29tZSBmcm9tIGEgRE1BIG1hcHBpbmcgb3BlcmF0aW9uLgoKQmFz
ZWQgb24gdGhlIG5lYXJieSBjb21tZW50LCAic2V0IGR1bW15IHJlYWQgYWRkcmVzcyB0byByaW5n
IGFkZHJlc3MiLCBJCnRyaWVkIHN1YnN0aXR1dGluZyBhIHZhbGlkIGR1bW15IERNQSBhZGRyZXNz
ICh1c2luZyB0aGUgYWRkcmVzcyBtYXBwZWQgdG8KdGhlICdkdW1teSBwYWdlJyB1c2VkIGJ5IHRo
ZSBHQVJUKSBhbmQgaXQgZG9lcyBwcmV2ZW50IHRoZSBwcm9ibGVtLgpIb3dldmVyLCBJIGRvbid0
IGtub3cgd2hhdCB0aGF0IHJlZ2lzdGVyIGlzIHN1cHBvc2VkIHRvIGRvIG9yIHdoYXQKaW5mb3Jt
YXRpb24gdGhlIGRldmljZSBtaWdodCBiZSBjb21tdW5pY2F0aW5nIHZpYSB0aGF0IERNQSwgc28g
cHJlc3VtYWJseQppdCBicmVha3Mgc29tZXRoaW5nLgoKTm90ZTogSSBoYXZlIHRyaWVkIGxvYWRp
bmcgdGhlIHBhdGNoZWQgZHJpdmVyIHdpdGggInRlc3Q9MSIgYW5kIGFsbCB0aGUKc2VsZiB0ZXN0
cyBzdWNjZWVkLgoKQ291bGQgYW55b25lIG9mZmVyIHNvbWUgaW5zaWdodCBpbnRvIHRoaXMgcHJv
YmxlbT8KV2hhdCBkb2VzIHRoYXQgcmVnaXN0ZXIgZG8/IFdoYXQga2luZCBvZiBhZGRyZXNzIGlz
IGl0IGV4cGVjdGluZz8KV2hhdCBtaWdodCBiZSBhIGdvb2Qgd2F5IG9mIGZpeGluZyBpdD8KClRo
YW5rcyBpbiBhZHZhbmNlLApTYW0uCgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3I2MDAuYwppbmRleCBlOTM3Y2MwMTkxMGQuLjAzM2JjNDY2YTg2MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yNjAwLmMKQEAgLTM2OTYsOCArMzY5Niw4IEBAIGludCByNjAwX2lycV9pbml0KHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCX0KIAogCS8qIHNldHVwIGludGVycnVwdCBjb250
cm9sICovCi0JLyogc2V0IGR1bW15IHJlYWQgYWRkcmVzcyB0byByaW5nIGFkZHJlc3MgKi8KLQlX
UkVHMzIoSU5URVJSVVBUX0NOVEwyLCByZGV2LT5paC5ncHVfYWRkciA+PiA4KTsKKwkvKiBzZXQg
ZHVtbXkgcmVhZCBhZGRyZXNzIHRvIGR1bW15IHBhZ2UgYWRkcmVzcyAqLworCVdSRUczMihJTlRF
UlJVUFRfQ05UTDIsIHJkZXYtPmR1bW15X3BhZ2UuYWRkciA+PiA4KTsKIAlpbnRlcnJ1cHRfY250
bCA9IFJSRUczMihJTlRFUlJVUFRfQ05UTCk7CiAJLyogSUhfRFVNTVlfUkRfT1ZFUlJJREU9MCAt
IGR1bW15IHJlYWQgZGlzYWJsZWQgd2l0aCBtc2ksIGVuYWJsZWQgd2l0aG91dCBtc2kKIAkgKiBJ
SF9EVU1NWV9SRF9PVkVSUklERT0xIC0gZHVtbXkgcmVhZCBjb250cm9sbGVkIGJ5IElIX0RVTU1Z
X1JEX0VOCi0tIAoyLjIyLjAuMjE2LmcwMGEyYTk2ZmM5CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
