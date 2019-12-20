Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEBC1292D8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF46D6E222;
	Mon, 23 Dec 2019 08:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CACF6EC1E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 12:01:45 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191220120143euoutp02691c3c2bc7e543a1352838378f7ad95c~iEqFLGi5U3254932549euoutp02U
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 12:01:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191220120143euoutp02691c3c2bc7e543a1352838378f7ad95c~iEqFLGi5U3254932549euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576843303;
 bh=PQklDJqR/G6046e9NnfXXWwzMEr/Gk3W/jdjCm+h/+Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K3P5ULxmMoUdKXz/BOCOK3/CSXGX0hHreWRDT/UZBvtFy4YLrZzfreJ/Ob8HvBGi/
 AH37qqH02KibFeByDSLRqlmBkDGoZ4vLyb1ABS5+hsaZDJg0MNl59uxQ5zuF1F5hPw
 u6RX1PYdC/bMSIl/PRxC+tsDPS/mixxG/wm0PMSE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191220120143eucas1p17aa32b17eca0ed2bc744c6b98950424e~iEqE6wuLk1903419034eucas1p1S;
 Fri, 20 Dec 2019 12:01:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 2E.FE.61286.728BCFD5; Fri, 20
 Dec 2019 12:01:43 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191220120142eucas1p1f43c7a862d9c0faa72e14b21d7d697e9~iEqEeIr4u1904419044eucas1p1M;
 Fri, 20 Dec 2019 12:01:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191220120142eusmtrp2e910750d60d4180ce0814f512362bffe~iEqEdfqBq2149221492eusmtrp2t;
 Fri, 20 Dec 2019 12:01:42 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-da-5dfcb8276ad7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id AF.58.07950.628BCFD5; Fri, 20
 Dec 2019 12:01:42 +0000 (GMT)
Received: from AMDC3555.digital.local (unknown [106.120.51.67]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191220120141eusmtip2c7b8b86d637d9087cdf254161b9d59b0~iEqDmY0oK2848028480eusmtip2c;
 Fri, 20 Dec 2019 12:01:41 +0000 (GMT)
From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 2/7] interconnect: Relax requirement in
 of_icc_get_from_provider()
Date: Fri, 20 Dec 2019 12:56:48 +0100
Message-Id: <20191220115653.6487-3-a.swigon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220115653.6487-1-a.swigon@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e0+Hc2uy+poLxpU9FSx4CeFGImsIogiKENq1s1ZPmpXe0H4
 iGqammmhTkvtoaKJbT6aUhFzpb20VqmlsvKRuDAr3R9aal5vWf99zznfz3nAYQllC+XJhkfF
 8LooTYSKlpM1T0aaVy8z/wrxrhljsf36OYSN2RUUbh3uo3C+tYnCb52DNM56YKJxhj2dxM3N
 dxlc0vmdwqbuFgq/qcuj8VCqFeHs5ocyXG7tZHB7QgmNszP76QBObSpNotUdLfdptf1ig0xd
 eStObfxqlqnTqkqResi0cDsTLN9wkI8IP87rvPz3y7VXLA7yaDpz0n6vg4xHiXQycmGBWwuG
 Lj1KRnJWyZUgsL7sJ6RgGEGhs5yWgiEEQ1e7ppHCRpNMKhQj6O4YkE0jH8puU6KL5jZCxtWP
 jFhw56wIMgsGSTEguDwZ6JOKSdE1i9sLRpuRETXJLYHaxzlTtILDkJIkriXOWwRldx8Ronbh
 /KDtnY2QPG7wNKdnqg8x6TlbnTu1OXBOBlrH6gkJDoQL1amkpGeBo6GKkfR8mKjNl0lagN5a
 OyXB8QhMRdY/8HroaBqdvJqdnLAcKuq8pPRG6PziYMQ0cK7QNuAm7eAKGTVZhJRWgP68UpIq
 qMtxlUCAxLKWP73V0Jd4mUpHiw3/HWP47xjDv7EFiChFc/lYITKMF3yi+BNrBE2kEBsVtuZA
 dKQJTX7b8/GGH2bktIVaEMci1QxFwKGfIUpKc1w4FWlBwBIqd0W7fiREqTioOXWa10Xv08VG
 8IIFzWNJ1VyF743+ECUXponhj/D8UV73typjXTzj0RZ5230L3Ak6rJ3I8CsNthmPrZxQ8h53
 9niFjsc+KU+67Kj0n7Mpl/wc81E/e7T31beEnrbMM3He/W+9s599KvLZPLJA6xHW+lAI9X3t
 pA4F3TOnmV8ErrLB7p0p7jtuXiK7A+u3vV/o2GU4UbN6qy+/DhW1VxhnLq26xtc2+mgbVaSg
 1fisIHSC5jcKXt4iaQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xe7pqO/7EGjzdp2pxf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C3WHH3I6vFpsfXWC0u75rDZvG59wij
 xYzz+5gs1h65y25xu3EFm8WMyS/ZHAQ8Nq3qZPO4c20Pm8f97uNMHpuX1HtsfLeDyaNvyypG
 j8+b5ALYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/Tt
 EvQyphx6xVIwgb3i/vY7LA2MTWxdjJwcEgImEgtPbGLqYuTiEBJYyijx4fEndoiEhMTH9TdY
 IWxhiT/Xutggij4xSlzcepEFJMEm4CgxaeoDdpCEiMApRomty8+BjWUWWMEk0T9HuIuRg0NY
 IFJixjFOkDCLgKrEzqMzwYbyClhI9HR2MEIskJdYveEAM4jNKWApcePqJTBbCKhm5+c+Joh6
 QYmTM5+wgIxkFlCXWD9PCGKTvETz1tnMExgFZyGpmoVQNQtJ1QJG5lWMIqmlxbnpucVGesWJ
 ucWleel6yfm5mxiB0brt2M8tOxi73gUfYhTgYFTi4XVI+x0rxJpYVlyZe4hRgoNZSYT3dsfP
 WCHelMTKqtSi/Pii0pzU4kOMpkCvTWSWEk3OByaSvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFC
 AumJJanZqakFqUUwfUwcnFINjNsZlmubZ7td/ePXn5WeNmOj3fuixkWlufJOU5/ZXL0p9979
 vOO7mgePPlkY1ai8a5nybpH4mdW5DaGrPyqbMp3WnbvTb8KqFxOOrVSZtaF9Rq+Y+1GLV19N
 7ZXPxKZstC6vlz6ckxLfsOXOFv6L58q+2ob8+2MmVyfQIFZwylOPqXmBpt3iX0osxRmJhlrM
 RcWJAMrn8RrsAgAA
X-CMS-MailID: 20191220120142eucas1p1f43c7a862d9c0faa72e14b21d7d697e9
X-Msg-Generator: CA
X-RootMTR: 20191220120142eucas1p1f43c7a862d9c0faa72e14b21d7d697e9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191220120142eucas1p1f43c7a862d9c0faa72e14b21d7d697e9
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120142eucas1p1f43c7a862d9c0faa72e14b21d7d697e9@eucas1p1.samsung.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>, krzk@kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 georgi.djakov@linaro.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCByZWxheGVzIHRoZSBjb25kaXRpb24gaW4gb2ZfaWNjX2dldF9mcm9tX3Byb3Zp
ZGVyKCkgc28gdGhhdCBpdAppcyBubyBsb25nZXIgcmVxdWlyZWQgdG8gc2V0ICNpbnRlcmNvbm5l
Y3QtY2VsbHMgPSA8MT4gaW4gdGhlIERULiBJbiBjYXNlCm9mIHRoZSBkZXZmcmVxIGRyaXZlciBm
b3IgZXh5bm9zLWJ1cywgI2ludGVyY29ubmVjdC1jZWxscyBpcyBhbHdheXMgemVyby4KClNpZ25l
ZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KQWNrZWQtYnk6
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2ludGVy
Y29ubmVjdC9jb3JlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2ludGVyY29ubmVjdC9jb3JlLmMgYi9k
cml2ZXJzL2ludGVyY29ubmVjdC9jb3JlLmMKaW5kZXggZTYwMzVjMTk5MzY5Li43NGM2ODg5OGEz
NTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW50ZXJjb25uZWN0L2NvcmUuYworKysgYi9kcml2ZXJz
L2ludGVyY29ubmVjdC9jb3JlLmMKQEAgLTMzNSw3ICszMzUsNyBAQCBzdHJ1Y3QgaWNjX25vZGUg
Km9mX2ljY19nZXRfZnJvbV9wcm92aWRlcihzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzICpzcGVjKQog
CXN0cnVjdCBpY2Nfbm9kZSAqbm9kZSA9IEVSUl9QVFIoLUVQUk9CRV9ERUZFUik7CiAJc3RydWN0
IGljY19wcm92aWRlciAqcHJvdmlkZXI7CiAKLQlpZiAoIXNwZWMgfHwgc3BlYy0+YXJnc19jb3Vu
dCAhPSAxKQorCWlmICghc3BlYykKIAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CiAKIAltdXRl
eF9sb2NrKCZpY2NfbG9jayk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
