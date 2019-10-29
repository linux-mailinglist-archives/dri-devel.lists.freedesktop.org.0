Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B849E8F51
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 19:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2885E6E581;
	Tue, 29 Oct 2019 18:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D506E581
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 18:32:00 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TIOwfb171648;
 Tue, 29 Oct 2019 18:31:55 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2vve3qb4ae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 18:31:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TISme2036943;
 Tue, 29 Oct 2019 18:29:54 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2vxpfdh4tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 18:29:54 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9TITq3g015039;
 Tue, 29 Oct 2019 18:29:52 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 29 Oct 2019 11:29:51 -0700
Date: Tue, 29 Oct 2019 21:29:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 John Stultz <john.stultz@linaro.org>
Subject: [PATCH] dma-buf: Fix a warning message in dma_heap_buffer_destroy()
Message-ID: <20191029182943.GD17569@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290161
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290161
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=W5i8RaPuVxfk2wF9jP1qOXUbfa1KG3Gyj6D6MLp1DEs=;
 b=NjXdPhBDYKdqRh4Wu+tccs0Fs6vlwdxTeMtGEOX0HssoCew4FOYZNl5boTN+bpfkvgaw
 Ms5BwxZh/ABu+16yFvwO2JzCJA2MzXZ+BAlKbuKtuWGlZ5W6vUSZG28JbZqvTcbq7UPl
 RL4+BeXLYB6zBl4MEqGpfAmHy7flzJBtpKl2ecAarxa5fNlNdsM04eHMykTu/xAmAQ+A
 ZtkaVVKLeDK/T/A0WwcAU+61XwOJDBZxlS714UZvCd89pluAw6z6A/Nth8nlCYxdi94U
 2qXOie2NUdrkIqBtailmTlHCgnMkFu/h49Yuzw4R9RBbE6e4K9d4lfLMsPniYUGiTDvt vQ== 
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZpcnN0IGFyZ3VtZW50IG9mIFdBUk4oKSBpcyBhIGNvbmRpdGlvbiBzbyB0aGlzIHdpbGwg
anVzdCBwcmludCB0aGUKZnVuY3Rpb24gbmFtZSBpbnN0ZWFkIG9mIHRoZSB3aG9sZSB3YXJuaW5n
IG1lc3NhZ2UuCgpGaXhlczogN2I4N2VhNzA0ZmQ5ICgiZG1hLWJ1ZjogaGVhcHM6IEFkZCBoZWFw
IGhlbHBlcnMiKQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9y
YWNsZS5jb20+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jIGIvZHJpdmVycy9kbWEt
YnVmL2hlYXBzL2hlYXAtaGVscGVycy5jCmluZGV4IDc1MGJlZjRlOTAyZC4uYTMxNjg0YzBkNWIy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMKKysrIGIv
ZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jCkBAIC01Miw3ICs1Miw3IEBAIHN0
YXRpYyB2b2lkICpkbWFfaGVhcF9tYXBfa2VybmVsKHN0cnVjdCBoZWFwX2hlbHBlcl9idWZmZXIg
KmJ1ZmZlcikKIHN0YXRpYyB2b2lkIGRtYV9oZWFwX2J1ZmZlcl9kZXN0cm95KHN0cnVjdCBoZWFw
X2hlbHBlcl9idWZmZXIgKmJ1ZmZlcikKIHsKIAlpZiAoYnVmZmVyLT52bWFwX2NudCA+IDApIHsK
LQkJV0FSTigiJXM6IGJ1ZmZlciBzdGlsbCBtYXBwZWQgaW4gdGhlIGtlcm5lbFxuIiwgX19mdW5j
X18pOworCQlXQVJOKDEsICIlczogYnVmZmVyIHN0aWxsIG1hcHBlZCBpbiB0aGUga2VybmVsXG4i
LCBfX2Z1bmNfXyk7CiAJCXZ1bm1hcChidWZmZXItPnZhZGRyKTsKIAl9CiAKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
