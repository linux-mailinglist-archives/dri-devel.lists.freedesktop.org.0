Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA542FFF42
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 10:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4166E9CD;
	Fri, 22 Jan 2021 09:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D5F6E9CD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 09:34:32 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210122093430euoutp01c2fb7dbb1434262e00137595981929de~chCczOFN52519325193euoutp01h
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 09:34:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210122093430euoutp01c2fb7dbb1434262e00137595981929de~chCczOFN52519325193euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1611308070;
 bh=R+V80JL03vuZvezpG0U4GdoEqnl1aCpCcPxqEwhIz4s=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=loPYDTADQCAWvZcQkJQRy+/6+Nlbrz4L3NyvMS37MqyQBGXs/zLue51k7jMaOeNBX
 347b77dCZ9xx9TI2HOQP7yReSwbsQGh9xVDdHFr1LBV0HmfkloMwF9prSpoVWL37Hg
 qc6bd83+UF4mVIUTo1LlcMNekae+CK0fnrChQzj0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210122093430eucas1p265c7d564bb356f1e0f40e114a569391e~chCcioCvr1984819848eucas1p21;
 Fri, 22 Jan 2021 09:34:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 78.62.45488.62C9A006; Fri, 22
 Jan 2021 09:34:30 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210122093429eucas1p2b9f427b87fdab78fa877320863ca3c20~chCcI2kpW1727417274eucas1p2R;
 Fri, 22 Jan 2021 09:34:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210122093429eusmtrp2d31148dbdac898323ef33a2379bc9679~chCcIDorX0989909899eusmtrp2G;
 Fri, 22 Jan 2021 09:34:29 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-76-600a9c269beb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C2.FE.21957.52C9A006; Fri, 22
 Jan 2021 09:34:29 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210122093428eusmtip20c6f867244372cda344c0c3eca872f6c~chCa5KHi70365803658eusmtip2J;
 Fri, 22 Jan 2021 09:34:28 +0000 (GMT)
Subject: Re: [PATCH v4 3/3] drm/bridge/lontium-lt9611uxc: move HPD
 notification out of IRQ handler
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <c6737dce-e310-bf5d-fa22-cc8d3ec0136e@samsung.com>
Date: Fri, 22 Jan 2021 10:34:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0)
 Gecko/20100101 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210121233303.1221784-4-dmitry.baryshkov@linaro.org>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLKsWRmVeSWpSXmKPExsWy7djPc7pqc7gSDA7e4LLoPXeSyeL0/ncs
 FhPP/2SzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9kt7rZ0sloc6ou2WPFzK6PFzjsnmB14
 PN7faGX3mN0xk9Vj06pONo8TEy4xedy5tofNY/u3B6we97uPM3ksmXaVzeNA72QWj8+b5AK4
 orhsUlJzMstSi/TtErgyZkxdwVKwgq3i7dWiBsa5rF2MnBwSAiYST/7uYu9i5OIQEljBKPFm
 3xRWCOcLo8TJxb1sEM5nRokfWx6wwbTMfT2LGcQWEljOKLHnfgZE0XtGib1XJwC1c3AIC6RI
 7P6UBFIjIlAi0fe0FWwqs0ADs8SOznOMIAk2AU2Jv5tvgg3lFbCT2NW5C+wmFgFVib/7nrOD
 2KICCRJ7351jgagRlDg58wmYzSngLDF522OwXmYBeYnmrbOZIWxxiaYvK8GWSQgs5pQ4/vQJ
 M8TVLhL/506BelpY4tXxLewQtozE/53zmSDseon7K1qYIZo7GCW2btgJ1WwtcefcLzaQz5iB
 rl6/Sx8i7Chxs+s2E0hYQoBP4sZbQYgb+CQmbZvODBHmlehoE4KoVpS4f3Yr1EBxiaUXvrJN
 YFSaheSzWUi+mYXkm1kIexcwsqxiFE8tLc5NTy02zkst1ytOzC0uzUvXS87P3cQITHGn/x3/
 uoNxxauPeocYmTgYDzFKcDArifA+suRIEOJNSaysSi3Kjy8qzUktPsQozcGiJM67a+uaeCGB
 9MSS1OzU1ILUIpgsEwenVANT7ld+M3tzAQurvnOlvR+ne2zZH9L38/gVC6b1p/6JtO952y09
 feW1h95ezmczpFo0RW+uXDbryDKLq9Y7VY5ya/Tf5P7Yb8ckyNwSOveti9XiLU/XHmeOFM2q
 OXg9YN4tznu54m+lypY/3Ct25RfX7qrHVozPP6bpaS+9ErLKvWbJTdstOp/7OoJ+v3xSuKwx
 IHnB2e331Hc/WVWhz38tyejqeY/FF7ZNFvL0bBRKmRyf4z4jc5rn5+9Bt6Pn5CvYOIc6seoc
 CO1xv93sGFDCtehrg3PCHLHr4Qr6Fd78DNVuegd6jhcqV7bf+zXzvJhilLJsrbnqqvbS9S2z
 ity1tnM4HNkZsuTHlCX+gkeVWIozEg21mIuKEwEWYZKL4AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsVy+t/xe7qqc7gSDN7NMLDoPXeSyeL0/ncs
 FhPP/2SzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9kt7rZ0sloc6ou2WPFzK6PFzjsnmB14
 PN7faGX3mN0xk9Vj06pONo8TEy4xedy5tofNY/u3B6we97uPM3ksmXaVzeNA72QWj8+b5AK4
 ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyZkxd
 wVKwgq3i7dWiBsa5rF2MnBwSAiYSc1/PYu5i5OIQEljKKLF/yS12iIS4xO75b5khbGGJP9e6
 2CCK3jJKzHv2G8jh4BAWSJHY/SkJpEZEoERi0o9WdpAaZoEGZokfy6YzQjScZ5TYt2AN2Do2
 AU2Jv5tvsoHYvAJ2Ers6d4HFWQRUJf7uew62WVQgQWL7/pVMEDWCEidnPmEBsTkFnCUmb3sM
 1sssYCbRtbWLEcKWl2jeOpsZwhaXaPqyknUCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5
 xYZ6xYm5xaV56XrJ+bmbGIFxve3Yz807GOe9+qh3iJGJg/EQowQHs5II7yNLjgQh3pTEyqrU
 ovz4otKc1OJDjKZA/0xklhJNzgcmlrySeEMzA1NDEzNLA1NLM2Mlcd6tc9fECwmkJ5akZqem
 FqQWwfQxcXBKNTBF36h4IGJ2T2bfaS1+xYdaBraFl75cUn8ok7HFWqKQ/9ikFQovd4dbpzT+
 sW8yZWOwN5r7rJh5R3np5wuVflct8iZpfNFWsLF90l5zQjtFRSrlVFNPk+L7i07nlJb3pdfU
 Ve9ZJcJ86mZ1+/WMUMMT907lzfnSfzUl+G3OFUan/wL5vOwt15nUrR0EOiZIFkuYeRSIu6XW
 nl7X/Wc7196fChoSf3atCut88NwjW37GCU1XFeXjniv27b5Z57F555a/2+2575WmJ3lIJj9y
 Vf17o+te3/HNU37M8NvIMnVvd8LRNdZyOtN2rwzv/hWdkpLRcnGS+68qniNh01+qe1QEOSZw
 8Okr3WCcYPaqSImlOCPRUIu5qDgRAJ+3s4F0AwAA
X-CMS-MailID: 20210122093429eucas1p2b9f427b87fdab78fa877320863ca3c20
X-Msg-Generator: CA
X-RootMTR: 20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
 <CGME20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a@eucas1p1.samsung.com>
 <20210121233303.1221784-4-dmitry.baryshkov@linaro.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VyBkbml1IDIyLjAxLjIwMjEgb8KgMDA6MzMsIERtaXRyeSBCYXJ5c2hrb3YgcGlzemU6Cj4gZHJt
IGhvdHBsdWcgaGFuZGxpbmcgY29kZSAoZHJtX2NsaWVudF9kZXZfaG90cGx1ZygpKSBjYW4gd2Fp
dCBvbiBtdXRleCwKPiB0aHVzIGRlbGF5aW5nIGZ1cnRoZXIgbHQ5NjExdXhjIElSUSBldmVudHMg
cHJvY2Vzc2luZy4gIEl0IHdhcyBvYnNlcnZlZAo+IG9jY2FzaW9uYWxseSBkdXJpbmcgYm9vdHVw
cywgd2hlbiBkcm1fY2xpZW50X21vZGVzZXRfcHJvYmUoKSB3YXMgd2FpdGluZwo+IGZvciBFRElE
IHJlYWR5IGV2ZW50LCB3aGljaCB3YXMgZGVsYXllZCBiZWNhdXNlIElSUSBoYW5kbGVyIHdhcyBz
dHVjawo+IHRyeWluZyB0byBkZWxpdmVyIGhvdHBsdWcgZXZlbnQuCj4gTW92ZSBob3RwbHVnIG5v
dGlmaWNhdGlvbnMgZnJvbSBJUlEgaGFuZGxlciB0byBzZXBhcmF0ZSB3b3JrIHRvIGJlIGFibGUK
PiB0byBwcm9jZXNzIElSUSBldmVudHMgd2l0aG91dCBkZWxheXMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+Cj4gRml4ZXM6
IDBjYmJkNWIxYTAxMiAoImRybTogYnJpZGdlOiBhZGQgc3VwcG9ydCBmb3IgbG9udGl1bSBMVDk2
MTFVWEMgYnJpZGdlIikKCgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1z
dW5nLmNvbT4KCgpMZXQncyB3YWl0IHRpbGwgTW9uZGF5IGZvciBvdGhlciBjb21tZW50cywgdGhl
biBJIGNhbiBxdWV1ZSB0aGUgcGF0Y2hzZXQuCgoKUmVnYXJkcwpBbmRyemVqCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
