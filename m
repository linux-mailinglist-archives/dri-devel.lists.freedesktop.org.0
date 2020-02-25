Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F57516B6D9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 01:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06086E898;
	Tue, 25 Feb 2020 00:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198806E898
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:45:29 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200225004527epoutp016abd491ffd06aac68f7524c22401d775~2fpwP7uxJ2833228332epoutp01C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:45:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200225004527epoutp016abd491ffd06aac68f7524c22401d775~2fpwP7uxJ2833228332epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582591527;
 bh=zwNP1fMvCYb3FBHgRWsaNOoysAHBVqD7SWTamsnIuOw=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=iaMQ2rNWLafOkyRQ8sRrLmRKvOPNFbhQ1kixk4jcYXxA09M424vNRIEcWWpCG4XU6
 iXgCFaIoBsHhbOjkNTTljj/J4qUUrGW+j5xr3XXeavT7xyPjyLpkcodzO6SdDe02ou
 ZJ9BI3d6hSJiiJPpn/EBfE20VXH8Zyb2MzB4396Q=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200225004527epcas1p31738ebd1975dd323d5c5691400ee0868~2fpv3Tkuv2967429674epcas1p3R
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:45:27 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.157]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 48RKwN1C73zMqYkm for
 <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:45:24 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 B6.FA.52419.91E645E5; Tue, 25 Feb 2020 09:45:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200225004512epcas1p20e8cfa53ea8db878cfca3a5f41553c24~2fpiBudJA2506125061epcas1p2z
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:45:12 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200225004512epsmtrp1f04e5f63a80c9742a08c3c9e563dab9e~2fpiBNuiL1234712347epsmtrp1g
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:45:12 +0000 (GMT)
X-AuditID: b6c32a37-59fff7000001ccc3-91-5e546e198dcf
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DC.EE.06569.81E645E5; Tue, 25 Feb 2020 09:45:12 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200225004512epsmtip1b664542fae4a95c9fd9ce6a0be0156ab~2fph7beQ80881208812epsmtip1F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:45:12 +0000 (GMT)
Subject: Re: [PATCH 02/12] drm/exynos: Use mode->clock instead of reverse
 calculating it from the vrefresh
To: dri-devel@lists.freedesktop.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <1639460b-d11b-a937-1bb4-b951215bc1b0@samsung.com>
Date: Tue, 25 Feb 2020 09:49:34 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACvgo50fK+5CVUFJAnMQvHGcbaNWP8TQA0c+r6ikoRJTJcUVhg@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEKsWRmVeSWpSXmKPExsWy7bCmvq5kXkicQVszj8WVr+/ZHBg97ncf
 ZwpgjMq2yUhNTEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAGa
 qqRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpsCzQK07MLS7NS9dLzs+1MjQwMDIF
 KkzIzmh/MZm1YCl7xbx1u5kbGJewdTFyckgImEh8654BZHNxCAnsYJTo2PiSHcKZwSSxb34/
 VGYOk8SnpjZGmJat1x6xg9hCAnsZJVacdYQomsoksfT+W2aQhLBAjsSPl8vBikQElCX+TlwF
 1swmoCoxccV9sN28AnYS++/9A6thAYr/a3oDZHNwiApESJz+mghRIihxcuYTFhCbUyBQovH+
 L7ByZgFxiVtP5jNB2PISzVtnM4PcICHQwyaxafVjNpA5EgIuEo96DSFuFpZ4dXwLO4QtJfGy
 vw3KrpaYcPA/C0RvA6NE99FOqISxxP6lk5lA5jALaEqs36UPEVaU2Pl7LiPEXj6Jd197WCFW
 8Up0tAlBlChJHLt4AxpUEhIXlkyEusZDovlgLiSkpgFD6uli5gmMCrOQfDkLyWezkHw2C+GI
 BYwsqxjFUguKc9NTiw0LjJHjehMjOL1pme9g3HDO5xCjAAejEg+vxN7gOCHWxLLiytxDjBIc
 zEoivN6MQXFCvCmJlVWpRfnxRaU5qcWHGE2BcTCRWUo0OR+YevNK4g1NjYyNjS1MDM1MDQ2V
 xHkfRmrGCQmkJ5akZqemFqQWwfQxcXBKNTC26id9Sl8WVhF2+8HnRBn3+R0//XZc72DYcf1Z
 20ZH13YlMeHftkl1p2YULq9j2iOkOG+1D9P6ZUtZOhl5a2KO5jEbvj+i3Ggc2fz5/K6va8ID
 Cnb/j/w5N/vxCq/ndu8WxYTf1u7bqNGd+jBuyv7A4+yJ66XiY09t5v/J2KA8LdOAr+O0WZkS
 S3FGoqEWc1FxIgC5kiFjhQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsWy7bCSnK5EXkicwf158hZXvr5nc2D0uN99
 nCmAMYrLJiU1J7MstUjfLoEro/3FZNaCpewV89btZm5gXMLWxcjJISFgIrH12iP2LkYuDiGB
 3YwSR1qvsHYxcgAlJCS2bOWAMIUlDh8uhiiZzCRxfe8vFpBeYYEciR8vl7OD2CICyhJ/J65i
 hCiaxiTx6u01sAVsAqoSE1fcB7N5Bewk9t/7B9bAAhT/1/QGzBYViJB4vv0GI0SNoMTJmU/A
 FnAKBEo03v8FVsMsoC7xZ94lZghbXOLWk/lMELa8RPPW2cwTGAVnIWmfhaRlFpKWWUhaFjCy
 rGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECA5dLa0djCdOxB9iFOBgVOLhldgbHCfE
 mlhWXJl7iFGCg1lJhNebMShOiDclsbIqtSg/vqg0J7X4EKM0B4uSOK98/rFIIYH0xJLU7NTU
 gtQimCwTB6dUA+NMZZEnd14xzI5ysf00Y+mLxeHVwo/25H53ON/+oDfhQ6Aty/JX7KHbt9+Z
 nvMtqsugRveD2yJrt6CbB7mWtDaU7VfYbadmFLNqBafA5uPx/JZHt0zv/WPwU6eYw3bZvO7r
 PPxCRsLJ/oF2oTMYTs2I3N2wxMz2bf0xrnOLtvSLKi9eWrVEZLoSS3FGoqEWc1FxIgAzD2ID
 WQIAAA==
X-CMS-MailID: 20200225004512epcas1p20e8cfa53ea8db878cfca3a5f41553c24
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200220105620epcas1p4464996006d7bdbf7521ba48c46bff463
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-3-ville.syrjala@linux.intel.com>
 <CGME20200220105620epcas1p4464996006d7bdbf7521ba48c46bff463@epcas1p4.samsung.com>
 <CACvgo50fK+5CVUFJAnMQvHGcbaNWP8TQA0c+r6ikoRJTJcUVhg@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMC4gMi4gMjAuIOyYpO2bhCA3OjU27JeQIEVtaWwgVmVsaWtvdiDsnbQo6rCAKSDsk7Qg6riA
Ogo+IE9uIFdlZCwgMTkgRmViIDIwMjAgYXQgMjA6MzYsIFZpbGxlIFN5cmphbGEKPiA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Pgo+PiBGcm9tOiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Pgo+PiBodG90YWwqdnRvdGFsKnZy
ZWZyZXNoIH49IGNsb2NrLiBTbyBqdXN0IHVzZSBzYXkgImNsb2NrIiB3aGVuIHdlIG1lYW4gaXQu
Cj4+Cj4+IENjOiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+Cj4+IENjOiBKb29ueW91
bmcgU2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+Cj4+IENjOiBTZXVuZy1Xb28gS2ltIDxz
dzAzMTIua2ltQHNhbXN1bmcuY29tPgo+PiBDYzogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFy
a0BzYW1zdW5nLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxl
bWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClBpY2tlZCBpdCB1cC4KClRoYW5rcywKSW5raSBE
YWUKCj4gCj4gLUVtaWwKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9wcm90ZWN0Mi5maXJlZXllLmNvbS91cmw/az05NTE0M2YwMC1j
ODhlOTZhMy05NTE1YjQ0Zi0wMDI1OTBmNWI5MDQtZjFlMWI3YzgzNDkzOWFlMSZ1PWh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
