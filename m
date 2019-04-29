Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FC3DEB2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 11:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3681A892C1;
	Mon, 29 Apr 2019 09:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B728892BD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 09:09:59 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190429090957epoutp049a9bdf4a1abd04a4d9361007013cbd58~Z5uBvpKS30328203282epoutp043
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 09:09:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190429090957epoutp049a9bdf4a1abd04a4d9361007013cbd58~Z5uBvpKS30328203282epoutp043
Received: from epsmges1p3.samsung.com (unknown [182.195.40.158]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190429090955epcas1p1be0a95ea92eaf36199294cb5e6d59e49~Z5t-Vvojz0281302813epcas1p1M;
 Mon, 29 Apr 2019 09:09:55 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 B7.91.04143.06FB6CC5; Mon, 29 Apr 2019 18:09:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20190429090952epcas1p4877cf8476a69f756a1a6bfe9d6d52abd~Z5t8cKfwh2247422474epcas1p4Z;
 Mon, 29 Apr 2019 09:09:52 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190429090952epsmtrp142698fa12934525f1454a89205f4dd06~Z5t8blZap2678026780epsmtrp1Y;
 Mon, 29 Apr 2019 09:09:52 +0000 (GMT)
X-AuditID: b6c32a37-f19ff7000000102f-7f-5cc6bf60d6d7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F2.30.03662.06FB6CC5; Mon, 29 Apr 2019 18:09:52 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.222]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190429090951epsmtip26fdefb14e0ba6b8b88a5c581e4954a38~Z5t8Rkwxo0471704717epsmtip2j;
 Mon, 29 Apr 2019 09:09:51 +0000 (GMT)
From: Seung-Woo Kim <sw0312.kim@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] xf86drm: Fix possible memory leak with
 drmModeGetPropertyPtr()
Date: Mon, 29 Apr 2019 18:10:52 +0900
Message-Id: <1556529052-6413-1-git-send-email-sw0312.kim@samsung.com>
X-Mailer: git-send-email 1.7.4.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCKsWRmVeSWpSXmKPExsWy7bCmnm7C/mMxBjt/yVhc+fqezWLP1XtM
 FjMmv2RzYPbYOesuu8f97uNMHn1bVjEGMEdl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY
 6hpaWpgrKeQl5qbaKrn4BOi6ZeYAbVJSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTk
 FFgW6BUn5haX5qXrJefnWhkaGBiZAhUmZGcsX7CbqWApa8XRJ/MZGxiXsnQxcnJICJhITH+z
 iKmLkYtDSGAHo8S52X3sEM4nRoklPcuhnG+MErfvXGeEaZnxvpkNIrGXUaJrVjcrhPOFUaJ/
 9hKwKjYBHYn9S36zgtgiAsoSfyeuAoszA3U/XryfCcQWFoiQmLqmkRnEZhFQlejq+A5m8wq4
 Sny58J0JYpuCxIJ7b8G2SQjcZJXYvOgZ1BkuEvs3/GGDsIUlXh3fwg5hS0m87G+Dsqsltk/4
 yQ7R3MEo0dPeCPW2scT+pZOBNnAAXaQpsX6XPsRxfBLvvvawgoQlBHglOtqEIKpVJHYencQG
 EZaSmLUhGCLsITF7wh2wC4QEYiXmrdzONIFRZhbCzAWMjKsYxVILinPTU4sNC4yRY2YTIzjF
 aJnvYNxwzucQowAHoxIPr8KrozFCrIllxZW5hxglOJiVRHg9jgOFeFMSK6tSi/Lji0pzUosP
 MZoCA2wis5Rocj4w/eWVxBuaGhkbG1uYGJqZGhoqifOud3COERJITyxJzU5NLUgtgulj4uCU
 amCUl5UPnH+7nrXB9HfwggMz6n5GzjqaxCzPlNio2vaXyeaTUH979vcV29h4c9/1v4pYkWGm
 PCEj8Vq3lUXtYpbM6a/uRq2/fm1CUkrPU56fupvYJgsseXnkZI/QciVXod03lv3RYtg5789t
 7c+CU9+1/zy05Fz3yt2lAmL5L7vjVISkaw5qZK1VYinOSDTUYi4qTgQA1qrdLEcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHJMWRmVeSWpSXmKPExsWy7bCSvG7C/mMxBos/s1pc+fqezWLP1XtM
 FjMmv2RzYPbYOesuu8f97uNMHn1bVjEGMEdx2aSk5mSWpRbp2yVwZSxfsJupYClrxdEn8xkb
 GJeydDFyckgImEjMeN/M1sXIxSEksJtR4t+Ft4wQCSmJud+2A9kcQLawxOHDxRA1nxglpuy5
 wwpSwyagI7F/yW8wW0RAWeLvxFVgvcwCZhJrpq8Gs4UFwiQOzZkIVsMioCrR1fGdGcTmFXCV
 +HLhOxPELgWJBffesk1g5FnAyLCKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM4FLS0
 djCeOBF/iFGAg1GJh/fE86MxQqyJZcWVuYcYJTiYlUR4PY4DhXhTEiurUovy44tKc1KLDzFK
 c7AoifPK5x+LFBJITyxJzU5NLUgtgskycXBKNTAqizxoyXFK6A2/sto952vo6z26y2tliya6
 2Kza2/7jloLCrqRHNty+u8L3XOaK3vk+72GYA9u/6IdZ7287NnwwFpL7IBBjn6tuPWmC4v/V
 l3h1nk6ZtdSl4Z9R7Fll1rj2/QGLUv8lJDf5WqZ0P/+0svn5/5un83NyZLo8XtQcM1v4PTPl
 s7USS3FGoqEWc1FxIgAZ62c7AQIAAA==
X-CMS-MailID: 20190429090952epcas1p4877cf8476a69f756a1a6bfe9d6d52abd
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190429090952epcas1p4877cf8476a69f756a1a6bfe9d6d52abd
References: <CGME20190429090952epcas1p4877cf8476a69f756a1a6bfe9d6d52abd@epcas1p4.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1556528997;
 bh=b19joHUU6ZwR9nhOqRFskPBIXE7EClSq1z+obHggW44=;
 h=From:To:Cc:Subject:Date:References:From;
 b=p7v79WHxJUU+cYBN4rWscIBtEK41N+OUWutbCjzCO5oUXyTXiTdThYGinaJAQA4UJ
 0ZSEfTadNvr3jwGQLLxvu1yvt5mCccZ7ahjFfjCxsBxMizXmQAGUT2BCyc8uUbh/DN
 FZKW6FMQgbSJPr0+Sd9jLsdh48h2Z8Xs6YnJoT+Q=
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
Cc: sw0312.kim@samsung.com, emil.l.velikov@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZHJtTW9kZUdldFByb3BlcnR5UHRyKCksIGZyb20gdXBwZXIgZXJyb3IgcGF0aCwgaXQgY2Fs
bHMgZnJlZQpidXQgd2l0aCBqdXN0IG5leHQgZXJyb3IgcGF0aCwgaXQgZG9lcyBub3QgY2FsbC4g
Rml4IHRoZSBwb3NzaWJsZQptZW1vcnkgbGVhay4KClNpZ25lZC1vZmYtYnk6IFNldW5nLVdvbyBL
aW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5jb20+Ci0tLQogeGY4NmRybU1vZGUuYyB8ICAgIDIgKy0K
IDEgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hmODZkcm1Nb2RlLmMgYi94Zjg2ZHJtTW9kZS5jCmluZGV4IGM4NzhkOWUuLjIwN2Q3
YmUgMTAwNjQ0Ci0tLSBhL3hmODZkcm1Nb2RlLmMKKysrIGIveGY4NmRybU1vZGUuYwpAQCAtNjUw
LDcgKzY1MCw3IEBAIGRybV9wdWJsaWMgZHJtTW9kZVByb3BlcnR5UHRyIGRybU1vZGVHZXRQcm9w
ZXJ0eShpbnQgZmQsIHVpbnQzMl90IHByb3BlcnR5X2lkKQogCX0KIAogCWlmICghKHIgPSBkcm1N
YWxsb2Moc2l6ZW9mKCpyKSkpKQotCQlyZXR1cm4gTlVMTDsKKwkJZ290byBlcnJfYWxsb2NzOwog
CiAJci0+cHJvcF9pZCA9IHByb3AucHJvcF9pZDsKIAlyLT5jb3VudF92YWx1ZXMgPSBwcm9wLmNv
dW50X3ZhbHVlczsKLS0gCjEuNy40LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
