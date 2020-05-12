Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB221CF0A2
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6176E8F9;
	Tue, 12 May 2020 09:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9706E8EA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:21 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090119euoutp02b77aef4e35caf1da8dd56e64c9de1d33~OPFrnUuV00304403044euoutp02X
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:01:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200512090119euoutp02b77aef4e35caf1da8dd56e64c9de1d33~OPFrnUuV00304403044euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274079;
 bh=0yI0kIf+rYJ6UoNyoIt+TrT7+zi+gmpMibLIv1/8Mcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pttrtXnu5Lr6oh0ZOZ5MlxdrlDccvm7mLfETe4QXKs85WK4131Lub/EuDHzqDHcu1
 1/6DLrZle8CpjArk+CwTGzHM52+IOkcJ2NsXb+Xa5/q/offSk7EpGAtQ9lVkXNsbxH
 0QLTJyhrc9ar0TWIPHZFMyw+eJkNg4jGoLBpsWzc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200512090119eucas1p11940982db9c164db4d85642968ef9c3d~OPFrXu7Le2839628396eucas1p1J;
 Tue, 12 May 2020 09:01:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5C.22.60679.FD56ABE5; Tue, 12
 May 2020 10:01:19 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200512090119eucas1p2c0db485fddf17f15135f8e69e46fc097~OPFrDcV3u3099730997eucas1p2B;
 Tue, 12 May 2020 09:01:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512090119eusmtrp2cdd0ea0f62af7fa84d5f0f1dbe87ba24~OPFrCCJxt0472504725eusmtrp2O;
 Tue, 12 May 2020 09:01:19 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-b0-5eba65dfa81b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 73.45.08375.ED56ABE5; Tue, 12
 May 2020 10:01:18 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090118eusmtip1a596717f01754987556461b66c9eb4e1~OPFqdyOKg1352513525eusmtip1K;
 Tue, 12 May 2020 09:01:18 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 20/38] drm: radeon: fix common struct sg_table related
 issues
Date: Tue, 12 May 2020 11:00:40 +0200
Message-Id: <20200512090058.14910-20-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm27nsbDU9boYfFpWDsoLUtB8HFCuQOP0rIQJJa9lpjnTJjrOU
 IFNntWV5icolKWJpc14zm1NLrbSLrVIbk8zbxBuIhZdIdLbjsfLfc/3e94WPQKQDmC+hUicx
 GrUiXo6L0YaO37a9g4w1JijnjozKtr0TUHf7mzDqUfVVIVV7vxqjpgfddKUhF6F652dw6knF
 GwFV/DKUmusdFlB1TjtG9VgLcary9Xch1fZjFDvoQeu6l3Ha/NAM6JaFYpR+vjCE0YOGTgH9
 tPQK/c3lROh8Rxmgm/rScPpWvQnQs3Vbj26IEoedZeJVyYwmMPy0OM5e2CFMdPpcmvyyIkgD
 LpkeiAhI7ocWhwXVAzEhJcsBLCm9AXgyB+DYTKuAJ7MATnzSCf9W0ntNa0YZgK+azThnrFbe
 f43mME7ug/pp/aruTeoAfJu9kSsgZCkCS/tfoJwhIyNhR9UEpgcEgZI7YPe3AE6WkOHQsmBG
 +WHbYEVNK8JhkVsfLFpC+YwXfFcwuooRdybj2QOEex+Sy0JoWVxa2zQC/u4w4DyWwanO+jV9
 C1xpLBLwhQwAh22VQp7cBLAn/T7gU6Gw37aIc9sh5G5YbQ3k5UOwZITbiHBjD+iY9uKX8IB5
 DffWZAm8niXl0zuhsbPq39i2z90Ij2k4tTKK5QA/47pzjOvOMf6fWwwQE/BhtGyCkmGD1czF
 AFaRwGrVyoDYCwl1wP3rPrg65yzAunSmHZAEkG+UBAU1xkgxRTKbktAOIIHIvSWZKrckOatI
 SWU0F05ptPEM2w42E6jcRxJSMhktJZWKJOY8wyQymr+ugBD5pgGG9XF01Ys8R6LKz78tH4io
 z+rq98+fDIu87hJT/vNC5UV7c5ff7ZeHfWPUy5vyPqKILvK4rW+XY+bckbG9iyHjgbGPr9k9
 C2p+GYc0Jm+vnO3PfA0HqmYnDKm1r/yPtZjH2QOXDdp5WYbBmVmp+lkQk5t4QnX8ZMPDocbC
 4JQSOcrGKfbtQTSs4g+Xn4NZcQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsVy+t/xu7r3UnfFGUxebm3Re+4kk8W0O7tZ
 LZaub2S32DhjPavF2/tA7v9tE5ktrnx9z2axcvVRJosF+60tvlx5yGSx6fE1VovLu+awWaw9
 cpfd4uCHJ6wOfB6tl/6yeayZt4bRY++3BSwe2789YPW4332cyWPzknqP2/8eM3tMvrGc0WP3
 zQY2j74tqxg9Pm+SC+CO0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJ
 Sc3JLEst0rdL0Mu4NucYe8Fj8YqXF/8zNTD+E+5i5OSQEDCRaLqyiqmLkYtDSGApo8Sjq7fZ
 IBIyEienNbBC2MISf651sUEUfWKUOLT9PlgRm4ChRNdbiISIQCejxLTuj+wgDrPAGmaJe9+X
 AzkcHMICARKdH4NBTBYBVYlLt/VAenkF7CR2fFvDArFAXmL1hgPMIDYnUPz+/D9gcSGBQqCD
 3rJA1AtKnJz5hAVkDLOAusT6eUIgYWag1uats5knMArOQlI1C6FqFpKqBYzMqxhFUkuLc9Nz
 iw31ihNzi0vz0vWS83M3MQLjd9uxn5t3MF7aGHyIUYCDUYmHt8NoZ5wQa2JZcWXuIUYJDmYl
 Ed6WTKAQb0piZVVqUX58UWlOavEhRlOgzyYyS4km5wNTS15JvKGpobmFpaG5sbmxmYWSOG+H
 wMEYIYH0xJLU7NTUgtQimD4mDk6pBsau4MufuwVEO+Satp6P7uFfr3OWMzXr0ul7LdeOZtSX
 Kx23teo6zb9C29t4t1aD1MNtvyI5atIn6Ws83tPEfWf99Ieb8lZ/uqx0YdepDwvOxE3+Ilev
 WPb4Zpnhse7Ppcmuzbcsa/IXLi4Rvmz6RflfhzL7m8WK9zsFL3b/u3a93f7QqjCPawuUWIoz
 Eg21mIuKEwEmNFxg9QIAAA==
X-CMS-MailID: 20200512090119eucas1p2c0db485fddf17f15135f8e69e46fc097
X-Msg-Generator: CA
X-RootMTR: 20200512090119eucas1p2c0db485fddf17f15135f8e69e46fc097
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090119eucas1p2c0db485fddf17f15135f8e69e46fc097
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090119eucas1p2c0db485fddf17f15135f8e69e46fc097@eucas1p2.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERvY3VtZW50YXRpb24vRE1BLUFQSS1IT1dUTy50eHQgc3RhdGVzIHRoYXQgdGhlIGRtYV9t
YXBfc2coKSBmdW5jdGlvbgpyZXR1cm5zIHRoZSBudW1iZXIgb2YgdGhlIGNyZWF0ZWQgZW50cmll
cyBpbiB0aGUgRE1BIGFkZHJlc3Mgc3BhY2UuCkhvd2V2ZXIgdGhlIHN1YnNlcXVlbnQgY2FsbHMg
dG8gdGhlIGRtYV9zeW5jX3NnX2Zvcl97ZGV2aWNlLGNwdX0oKSBhbmQKZG1hX3VubWFwX3NnIG11
c3QgYmUgY2FsbGVkIHdpdGggdGhlIG9yaWdpbmFsIG51bWJlciBvZiB0aGUgZW50cmllcwpwYXNz
ZWQgdG8gdGhlIGRtYV9tYXBfc2coKS4KCnN0cnVjdCBzZ190YWJsZSBpcyBhIGNvbW1vbiBzdHJ1
Y3R1cmUgdXNlZCBmb3IgZGVzY3JpYmluZyBhIG5vbi1jb250aWd1b3VzCm1lbW9yeSBidWZmZXIs
IHVzZWQgY29tbW9ubHkgaW4gdGhlIERSTSBhbmQgZ3JhcGhpY3Mgc3Vic3lzdGVtcy4gSXQKY29u
c2lzdHMgb2YgYSBzY2F0dGVybGlzdCB3aXRoIG1lbW9yeSBwYWdlcyBhbmQgRE1BIGFkZHJlc3Nl
cyAoc2dsIGVudHJ5KSwKYXMgd2VsbCBhcyB0aGUgbnVtYmVyIG9mIHNjYXR0ZXJsaXN0IGVudHJp
ZXM6IENQVSBwYWdlcyAob3JpZ19uZW50cyBlbnRyeSkKYW5kIERNQSBtYXBwZWQgcGFnZXMgKG5l
bnRzIGVudHJ5KS4KCkl0IHR1cm5lZCBvdXQgdGhhdCBpdCB3YXMgYSBjb21tb24gbWlzdGFrZSB0
byBtaXN1c2UgbmVudHMgYW5kIG9yaWdfbmVudHMKZW50cmllcywgY2FsbGluZyBETUEtbWFwcGlu
ZyBmdW5jdGlvbnMgd2l0aCBhIHdyb25nIG51bWJlciBvZiBlbnRyaWVzIG9yCmlnbm9yaW5nIHRo
ZSBudW1iZXIgb2YgbWFwcGVkIGVudHJpZXMgcmV0dXJuZWQgYnkgdGhlIGRtYV9tYXBfc2coKQpm
dW5jdGlvbi4KClRvIGF2b2lkIHN1Y2ggaXNzdWVzLCBsZXRzIHVzZSBhIGNvbW1vbiBkbWEtbWFw
cGluZyB3cmFwcGVycyBvcGVyYXRpbmcKZGlyZWN0bHkgb24gdGhlIHN0cnVjdCBzZ190YWJsZSBv
YmplY3RzIGFuZCB1c2Ugc2NhdHRlcmxpc3QgcGFnZQppdGVyYXRvcnMgd2hlcmUgcG9zc2libGUu
IFRoaXMsIGFsbW9zdCBhbHdheXMsIGhpZGVzIHJlZmVyZW5jZXMgdG8gdGhlCm5lbnRzIGFuZCBv
cmlnX25lbnRzIGVudHJpZXMsIG1ha2luZyB0aGUgY29kZSByb2J1c3QsIGVhc2llciB0byBmb2xs
b3cKYW5kIGNvcHkvcGFzdGUgc2FmZS4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kg
PG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCkZvciBtb3JlIGluZm9ybWF0aW9uLCBzZWUg
J1tQQVRDSCB2NCAwMC8zOF0gRFJNOiBmaXggc3RydWN0IHNnX3RhYmxlIG5lbnRzCnZzLiBvcmln
X25lbnRzIG1pc3VzZScgdGhyZWFkOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwv
MjAyMDA1MTIwODU3MTAuMTQ2ODgtMS1tLnN6eXByb3dza2lAc2Ftc3VuZy5jb20vVC8KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyB8IDExICsrKysrLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fdHRtLmMKaW5kZXggNWQ1MGM5ZS4uMGUzZWIwZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fdHRtLmMKQEAgLTQ4MSw3ICs0ODEsNyBAQCBzdGF0aWMgaW50IHJhZGVvbl90
dG1fdHRfcGluX3VzZXJwdHIoc3RydWN0IHR0bV90dCAqdHRtKQogewogCXN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2ID0gcmFkZW9uX2dldF9yZGV2KHR0bS0+YmRldik7CiAJc3RydWN0IHJhZGVv
bl90dG1fdHQgKmd0dCA9ICh2b2lkICopdHRtOwotCXVuc2lnbmVkIHBpbm5lZCA9IDAsIG5lbnRz
OworCXVuc2lnbmVkIHBpbm5lZCA9IDA7CiAJaW50IHI7CiAKIAlpbnQgd3JpdGUgPSAhKGd0dC0+
dXNlcmZsYWdzICYgUkFERU9OX0dFTV9VU0VSUFRSX1JFQURPTkxZKTsKQEAgLTUyMSw5ICs1MjEs
OCBAQCBzdGF0aWMgaW50IHJhZGVvbl90dG1fdHRfcGluX3VzZXJwdHIoc3RydWN0IHR0bV90dCAq
dHRtKQogCWlmIChyKQogCQlnb3RvIHJlbGVhc2Vfc2c7CiAKLQlyID0gLUVOT01FTTsKLQluZW50
cyA9IGRtYV9tYXBfc2cocmRldi0+ZGV2LCB0dG0tPnNnLT5zZ2wsIHR0bS0+c2ctPm5lbnRzLCBk
aXJlY3Rpb24pOwotCWlmIChuZW50cyA9PSAwKQorCXIgPSBkbWFfbWFwX3NndGFibGUocmRldi0+
ZGV2LCB0dG0tPnNnLCBkaXJlY3Rpb24sIDApOworCWlmIChyKQogCQlnb3RvIHJlbGVhc2Vfc2c7
CiAKIAlkcm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0tPnNnLCB0dG0tPnBhZ2Vz
LApAQCAtNTU0LDkgKzU1Myw5IEBAIHN0YXRpYyB2b2lkIHJhZGVvbl90dG1fdHRfdW5waW5fdXNl
cnB0cihzdHJ1Y3QgdHRtX3R0ICp0dG0pCiAJCXJldHVybjsKIAogCS8qIGZyZWUgdGhlIHNnIHRh
YmxlIGFuZCBwYWdlcyBhZ2FpbiAqLwotCWRtYV91bm1hcF9zZyhyZGV2LT5kZXYsIHR0bS0+c2ct
PnNnbCwgdHRtLT5zZy0+bmVudHMsIGRpcmVjdGlvbik7CisJZG1hX3VubWFwX3NndGFibGUocmRl
di0+ZGV2LCB0dG0tPnNnLCBkaXJlY3Rpb24sIDApOwogCi0JZm9yX2VhY2hfc2dfcGFnZSh0dG0t
PnNnLT5zZ2wsICZzZ19pdGVyLCB0dG0tPnNnLT5uZW50cywgMCkgeworCWZvcl9lYWNoX3NndGFi
bGVfcGFnZSh0dG0tPnNnLCAmc2dfaXRlciwgMCkgewogCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHNn
X3BhZ2VfaXRlcl9wYWdlKCZzZ19pdGVyKTsKIAkJaWYgKCEoZ3R0LT51c2VyZmxhZ3MgJiBSQURF
T05fR0VNX1VTRVJQVFJfUkVBRE9OTFkpKQogCQkJc2V0X3BhZ2VfZGlydHkocGFnZSk7Ci0tIAox
LjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
