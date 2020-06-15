Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D87261F8BF8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 02:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0F789E3F;
	Mon, 15 Jun 2020 00:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACA989E3F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 00:47:12 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200615004710epoutp027bc026b70654bac2cf1ff4756f10b00d~YkR7v1iDg3052030520epoutp02q
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 00:47:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200615004710epoutp027bc026b70654bac2cf1ff4756f10b00d~YkR7v1iDg3052030520epoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592182030;
 bh=8yvh7hV29VBPOtwpd8omf9HSfJ9mL6MVoGzHXyVkzKM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=esH6rqnU5jYdTX5AMWLAWhUhL7EiD6t3Dpgp+lHTSC/obSercnAWweMRF9qGob+kC
 SFhnNY7O+wM80uAAv5ZCYdJucS14BpV+VnTRCyJjShTfL3bPpw40r3LYE781oJTuqH
 b2FL9ZgYsSociYXPV6zUCqRXh3fiyuG/nLxi7VTo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200615004709epcas1p365ad9f2a41c4f8ef2c2201f7784524c0~YkR63vdTd3045330453epcas1p3N;
 Mon, 15 Jun 2020 00:47:09 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 49lXj770DwzMqYkn; Mon, 15 Jun
 2020 00:47:07 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 59.CE.18978.B05C6EE5; Mon, 15 Jun 2020 09:47:07 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200615004707epcas1p3f9d0e4367d2a8f333961a05fee14258a~YkR44ko1e3059930599epcas1p37;
 Mon, 15 Jun 2020 00:47:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200615004707epsmtrp1f86ef955f5aee69b793717dd0083138a~YkR43o9NU2192121921epsmtrp1c;
 Mon, 15 Jun 2020 00:47:07 +0000 (GMT)
X-AuditID: b6c32a35-603ff70000004a22-73-5ee6c50b2ab6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AE.83.08382.B05C6EE5; Mon, 15 Jun 2020 09:47:07 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200615004707epsmtip1aa43a233efc06f0cb1b7365c311ad051~YkR4qpdgL1601216012epsmtip1G;
 Mon, 15 Jun 2020 00:47:06 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: fix ref count leak in mic_pre_enable
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <027d9eb5-a1c1-c329-72c3-a555b71f8677@samsung.com>
Date: Mon, 15 Jun 2020 09:52:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200614062339.87374-1-navid.emamdoost@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBJsWRmVeSWpSXmKPExsWy7bCmri730WdxBs/mm1v0njvJZPF/20Rm
 iytf37NZPGuczmrx4t5FFov+x6+ZLU7MO8tucf78BnaLs01v2C02Pb7GanF51xw2ixnn9zFZ
 9J7cwWwx7csidosZk1+yWfQebWRzEPDY+20Bi8fOWXfZPTat6mTz2P7tAavH/e7jTB6bl9R7
 9G1ZxehxdWETu8fnTXIBnFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJ
 uam2Si4+AbpumTlAbygplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCiwL9IoTc4tL
 89L1kvNzrQwNDIxMgQoTsjN2ntvHXLCYo6Lz5hbmBsaHbF2MHBwSAiYSLb9luxi5OIQEdjBK
 PDnyhhXC+cQo0fXlCguE841R4vbdCUAZTrCO7W/eM0Mk9jJKTF7wBqrqPaPE2a3tLCBVwgKu
 Ek9+XgdLiAicYJZYcO4F2EJmATeJJydEQGrYBFQlJq64zwZi8wrYSazd8xWslwUo/qLnLwtI
 uahAhMTpr4kQJYISJ2c+ASvhFLCXaJuxhBnEZhYQl7j1ZD4ThC0v0bx1NthxEgIvOCTudT1g
 h7jaReJhx1aoD4QlXh3fAhWXknjZ38YO0dDMKDFxxmkmCKeDUeLu4+ssEFXGEvuXTmaCeEBT
 Yv0ufYiwosTO33MZITbzSbz72sMKCVReiY42IYgSJYljF28wQtgSEheWTGSDsD0kjvzuZp/A
 qDgLyW+zkPwzC8k/sxAWL2BkWcUollpQnJueWmxYYIgc25sYwUlcy3QH48S3H/QOMTJxMB5i
 lOBgVhLh7U57EifEm5JYWZValB9fVJqTWnyI0RQY2BOZpUST84F5JK8k3tDUyNjY2MLE0MzU
 0FBJnFdc5kKckEB6YklqdmpqQWoRTB8TB6dUA1N5AZvHKpO96x49DbgS7mxraL3ur2OM6rcv
 fxZEH3Tc29sSdyNkHuvJeX2fZK5YzhRIdzm7Wanx4PtJxmcOHUm6nVytnbjr74+Np6J2TDqR
 kr3XIlQyct2/L3PDT5zXkJnme3zFt7opTksLl/79J8xtNFfUffm/oiz/O/dmL/485UHEo1bD
 TdeurEtuu6brsEH1zGPb9TomL0584P+hZ7/D/MKJXa/v9PUJ8Nfb2GxLZ35X8TKf4b3zCe7C
 it17lq452vqwwPbPvlUsjVO2pk2IP2nSJCB554Tro3lp+ys/LJ4QW6ZqrCpQct10Ss/qfxNN
 OxelNUyMPbk1eVrU47XnOKL8c+YcniWRuu/0qYaVV5RYijMSDbWYi4oTAY0a+iJrBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsWy7bCSnC730WdxBisfcFv0njvJZPF/20Rm
 iytf37NZPGuczmrx4t5FFov+x6+ZLU7MO8tucf78BnaLs01v2C02Pb7GanF51xw2ixnn9zFZ
 9J7cwWwx7csidosZk1+yWfQebWRzEPDY+20Bi8fOWXfZPTat6mTz2P7tAavH/e7jTB6bl9R7
 9G1ZxehxdWETu8fnTXIBnFFcNimpOZllqUX6dglcGTvP7WMuWMxR0XlzC3MD40O2LkZODgkB
 E4ntb94zdzFycQgJ7GaUOLXiPVCCAyghIbFlKweEKSxx+HAxRMlbRokjd3eD9QoLuEo8+Xmd
 BSQhInCKWWLb9idMIA3MAm4ST06IQDRMYpT48LmHBaSBTUBVYuKK+2DNvAJ2Emv3fAWLswDF
 X/T8BbNFBSIknm+/wQhRIyhxcuYTsDingL1E24wlzCA2s4C6xJ95l6BscYlbT+YzQdjyEs1b
 ZzNPYBSahaR9FpKWWUhaZiFpWcDIsopRMrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cTIzhq
 tTR3MG5f9UHvECMTB+MhRgkOZiUR3u60J3FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeW8ULowT
 EkhPLEnNTk0tSC2CyTJxcEo1MB1+teTKck+Jo9unX7K+fa+U2bH79N9aG/MDH0z0LniIGgp3
 nQjs3/H/sXaIcYgazwrxzxubRKTPM8V6ndK2mrxB7vmsk7bvXDdwnv3+/na14WOJe7PUa2ev
 nvw4ecelloeqirIPQ/e+CHzQwa2lLbZizowvF5eftpp8+n7+RP6rb1yallSUS3I4Radvjt3x
 T/Yoawif1xbuxW2S/R6sJQtXcEZy1jyOlnmkEWLT6zjXl2+KQubByAOVrumWZtZS/t/mrUxJ
 clvkJTTBvHml9Xfu5hsyXzf2TXm3IHPH1+uepXOdp4g952l7fvyD71W9/Cd7/qyNnBbpPln6
 1oW+hp2upj/zpPxVa0KnF7mvmqzEUpyRaKjFXFScCAAU6wGESQMAAA==
X-CMS-MailID: 20200615004707epcas1p3f9d0e4367d2a8f333961a05fee14258a
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200614062349epcas1p1e285479c1e6483708b62f93e70a453a4
References: <CGME20200614062349epcas1p1e285479c1e6483708b62f93e70a453a4@epcas1p1.samsung.com>
 <20200614062339.87374-1-navid.emamdoost@gmail.com>
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
Cc: emamd001@umn.edu, kjlu@umn.edu, wu000273@umn.edu, smccaman@umn.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgoyMC4gNi4gMTQuIOyYpO2bhCAzOjIz7JeQIE5hdmlkIEVtYW1kb29zdCDsnbQo6rCAKSDs
k7Qg6riAOgo+IGluIG1pY19wcmVfZW5hYmxlLCBwbV9ydW50aW1lX2dldF9zeW5jIGlzIGNhbGxl
ZCB3aGljaAo+IGluY3JlbWVudHMgdGhlIGNvdW50ZXIgZXZlbiBpbiBjYXNlIG9mIGZhaWx1cmUs
IGxlYWRpbmcgdG8gaW5jb3JyZWN0Cj4gcmVmIGNvdW50LiBJbiBjYXNlIG9mIGZhaWx1cmUsIGRl
Y3JlbWVudCB0aGUgcmVmIGNvdW50IGJlZm9yZSByZXR1cm5pbmcuCj4gCj4gU2lnbmVkLW9mZi1i
eTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fbWljLmMKPiBpbmRleCBhODZhYmMxNzM2MDUuLjY5ZmY3NGMyY2Vi
NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fbWljLmMKPiBAQCAtMjcw
LDcgKzI3MCw3IEBAIHN0YXRpYyB2b2lkIG1pY19wcmVfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdl
ICpicmlkZ2UpCj4gIAo+ICAJcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhtaWMtPmRldik7Cj4g
IAlpZiAocmV0IDwgMCkKPiAtCQlnb3RvIHVubG9jazsKPiArCQlnb3RvIHR1cm5fb2ZmOwoKSG93
IGFib3V0IGp1c3QgY2FsbGluZyBwbV9ydW50aW1lX3B1dF9ub2lkbGUoKT8KCmlmIChyZXQgPCAw
KSB7CglwbV9ydW50aW1lX3B1dF9ub2lkbGUobWljLT5kZXYpOwoJZ290byB1bmxvY2s7Cn0KClRo
YW5rcywKSW5raSBEYWUKCj4gIAo+ICAJbWljX3NldF9wYXRoKG1pYywgMSk7Cj4gIAo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
