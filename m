Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9FC3074AA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 12:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC31F6E152;
	Thu, 28 Jan 2021 11:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF306E152
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:24:48 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210128112446euoutp02c33bc34e38dfa6d3cca8084fe9d72cc1~eYacVsGO60064700647euoutp02e
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:24:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210128112446euoutp02c33bc34e38dfa6d3cca8084fe9d72cc1~eYacVsGO60064700647euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1611833086;
 bh=kmZizkUGW79bCIXZ7XxalpWjHA7TeBfSuGwjTG9mlA0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=MNHHM6F7iZ9FI7yVRAs1tU0q2T5JtMSCZp5KFss8s5GLvv98gbG2ekK88kyx+3b/k
 N3dHtnracfH8c1nLDnDilLuFZmsI4x+rGESJJPKmwTkycGzuOsEX9y1/mr2iWfK5+B
 rOeCbrwlnaGFPZ0GW82hNxsUba7URHsfSan+tfRU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210128112446eucas1p179c85c4477dde388c43885f5f6ab92f3~eYacBvLWJ2455324553eucas1p1Q;
 Thu, 28 Jan 2021 11:24:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 1A.F7.45488.EFE92106; Thu, 28
 Jan 2021 11:24:46 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210128112446eucas1p2b220826a592b8a4f6132c2f0e01aaf6c~eYabnLjBa2496924969eucas1p2F;
 Thu, 28 Jan 2021 11:24:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210128112446eusmtrp2a05f2c577ebf7d32d7736d19b2916db8~eYabmbP9c0072600726eusmtrp2j;
 Thu, 28 Jan 2021 11:24:46 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-01-60129efe6d1f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 82.6E.16282.DFE92106; Thu, 28
 Jan 2021 11:24:45 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210128112445eusmtip2090f0196a7a15514b7c06e7449e5d1ca~eYaa4qiCZ3013230132eusmtip2j;
 Thu, 28 Jan 2021 11:24:45 +0000 (GMT)
Subject: Re: [PATCH v4 3/3] drm/bridge/lontium-lt9611uxc: move HPD
 notification out of IRQ handler
From: Andrzej Hajda <a.hajda@samsung.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Message-ID: <1da37287-9f88-a28b-092b-cab6310c5665@samsung.com>
Date: Thu, 28 Jan 2021 12:24:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0)
 Gecko/20100101 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <c6737dce-e310-bf5d-fa22-cc8d3ec0136e@samsung.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNKsWRmVeSWpSXmKPExsWy7djP87r/5gklGLSflbboPXeSyeL0/ncs
 FhPP/2SzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9kt7rZ0sloc6ou2WPFzK6PFzjsnmB14
 PN7faGX3mN0xk9Vj06pONo8TEy4xedy5tofNY/u3B6we97uPM3ksmXaVzeNA72QWj8+b5AK4
 orhsUlJzMstSi/TtErgynh8tLTjAXbH5GV8D433OLkZODgkBE4mWiw1sXYxcHEICKxglGla+
 ZYRwvjBKbGp/ywxSJSTwmVFi/QMNmI5zj7vYIYqWM0rc7N0O5bxnlHj/ZTpQBweHsECKxO5P
 SSANbAKaEn8332QDsUUESiT6nraygtjMAg3MEv2bqkFsXgE7iTeTD4LFWQRUJS4+XcEEYosK
 JEjsfXeOBaJGUOLkzCdgNqeAvcSN1atZIObISzRvnc0MYYtLNH1ZyQpyj4TAYk6JV09fMUJc
 7SIx6e4BFghbWOLV8S3sELaMxP+d85kg7HqJ+ytamCGaOxgltm7YyQyRsJa4c+4XG8hjzEDf
 rN+lDxF2lLjZdZsJJCwhwCdx460gxA18EpO2QYJBQoBXoqNNCKJaUeL+2a1QA8Ulll74yjaB
 UWkWks9mIflmFpJvZiHsXcDIsopRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwvZ3+d/zr
 DsYVrz7qHWJk4mA8xCjBwawkwvt2jlCCEG9KYmVValF+fFFpTmrxIUZpDhYlcd5dW9fECwmk
 J5akZqemFqQWwWSZODilGpgKp9Ss2i2nvfzc3F8hZ9tkWPgtZ3yoeKThZMqhW/Gc0elfTXPn
 RxG2S4Wf9rrdKkgrE/hbuEljX+m7yabnUmz1Dx+etXShlJFjdtgPVq0jK+KuWe1vXXEgrnP5
 HI6na6+nTV4ucm1l9+/bh7ri1rUV3vue63TlaLrMgRbj/9lcPx4bpaVYCphOqJrJxfT347uO
 0GWKoUGCxxoM6+dl73WdINosYt9+tDfbf1Z4/9ogVcEFMwvWreBh29V0RvjOsl/mQiHP7x9I
 8+9trlizomKC9qOy1Ff+MaJVKxuSdzCJnpC5MutAWFPvrUf14WqT1p2o/XFyZ8EJpaNHlN+F
 /X56mb3tutgx1qBvk1nv7PyqxFKckWioxVxUnAgApEL4i94DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xe7r/5gklGJyytOg9d5LJ4vT+dywW
 E8//ZLO48vU9m8XV7y+ZLU6+ucpi0TlxCbvFxP1n2S3utnSyWhzqi7ZY8XMro8XOOyeYHXg8
 3t9oZfeY3TGT1WPTqk42jxMTLjF53Lm2h81j+7cHrB73u48zeSyZdpXN40DvZBaPz5vkArii
 9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DKeHy0t
 OMBdsfkZXwPjfc4uRk4OCQETiXOPu9i7GLk4hASWMkrsP7OfBSIhLrF7/ltmCFtY4s+1LjaI
 oreMErf+bATq4OAQFkiR2P0pCaSGTUBT4u/mm2wgtohAicSkH61gQ5kFmpgl1u2ezQrR3MIk
 sfxQNyNIFa+AncSbyQdZQWwWAVWJi09XMIHYogIJEtv3r2SCqBGUODnzCdhFnAL2EjdWrwaz
 mQXMJLq2djFC2PISzVtnM0PY4hJNX1ayTmAUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfY
 SK84Mbe4NC9dLzk/dxMjMKa3Hfu5ZQfjylcf9Q4xMnEwHmKU4GBWEuF9O0coQYg3JbGyKrUo
 P76oNCe1+BCjKdA/E5mlRJPzgUklryTe0MzA1NDEzNLA1NLMWEmc1+TImnghgfTEktTs1NSC
 1CKYPiYOTqkGpuXrlkiaa85x8hFZ1pm7c6JP29rbXpxr/ple3bVDqOcYv9XGCUszBV875cqJ
 WbBNPCsaUNInff1Ra07F+uKN95OPlZf077TV/ndMeWr/ERM34SPVBYu6pYR8/7tH/Gao3PFE
 xEDtDvffA7mibPG8L4PNfvzsDXrlIqIRJWU/2zvgeQCX4P2WhcUnjT6uMxLyn/mBVVDi8b71
 Bpz7l3e4HMwR7Q2J3uya0uiWuD1WOSnk0mIbgQ3Jfxp4Z4XfW3L0G+9RzxWL5D7NbDWtbffr
 tIm9uPrGj02rOVt44/vkqo2tnlsw5U4wOM9jYflFvva0wle17YKqxmt+f/xc+aK0dsqUC4YJ
 b/nEo75ujXilxFKckWioxVxUnAgAL6iSHXIDAAA=
X-CMS-MailID: 20210128112446eucas1p2b220826a592b8a4f6132c2f0e01aaf6c
X-Msg-Generator: CA
X-RootMTR: 20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
 <CGME20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a@eucas1p1.samsung.com>
 <20210121233303.1221784-4-dmitry.baryshkov@linaro.org>
 <c6737dce-e310-bf5d-fa22-cc8d3ec0136e@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClcgZG5pdSAyMi4wMS4yMDIxIG/CoDEwOjM0LCBBbmRyemVqIEhhamRhIHBpc3plOgo+IFcgZG5p
dSAyMi4wMS4yMDIxIG/CoDAwOjMzLCBEbWl0cnkgQmFyeXNoa292IHBpc3plOgo+PiBkcm0gaG90
cGx1ZyBoYW5kbGluZyBjb2RlIChkcm1fY2xpZW50X2Rldl9ob3RwbHVnKCkpIGNhbiB3YWl0IG9u
IG11dGV4LAo+PiB0aHVzIGRlbGF5aW5nIGZ1cnRoZXIgbHQ5NjExdXhjIElSUSBldmVudHMgcHJv
Y2Vzc2luZy4gIEl0IHdhcyBvYnNlcnZlZAo+PiBvY2Nhc2lvbmFsbHkgZHVyaW5nIGJvb3R1cHMs
IHdoZW4gZHJtX2NsaWVudF9tb2Rlc2V0X3Byb2JlKCkgd2FzIHdhaXRpbmcKPj4gZm9yIEVESUQg
cmVhZHkgZXZlbnQsIHdoaWNoIHdhcyBkZWxheWVkIGJlY2F1c2UgSVJRIGhhbmRsZXIgd2FzIHN0
dWNrCj4+IHRyeWluZyB0byBkZWxpdmVyIGhvdHBsdWcgZXZlbnQuCj4+IE1vdmUgaG90cGx1ZyBu
b3RpZmljYXRpb25zIGZyb20gSVJRIGhhbmRsZXIgdG8gc2VwYXJhdGUgd29yayB0byBiZSBhYmxl
Cj4+IHRvIHByb2Nlc3MgSVJRIGV2ZW50cyB3aXRob3V0IGRlbGF5cy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPgo+PiBG
aXhlczogMGNiYmQ1YjFhMDEyICgiZHJtOiBicmlkZ2U6IGFkZCBzdXBwb3J0IGZvciBsb250aXVt
IExUOTYxMVVYQyBicmlkZ2UiKQo+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+Cj4KPgo+IExldCdzIHdhaXQgdGlsbCBNb25kYXkgZm9yIG90aGVyIGNv
bW1lbnRzLCB0aGVuIEkgY2FuIHF1ZXVlIHRoZSBwYXRjaHNldC4KCgpRdWV1ZWQgdG8gZHJtLW1p
c2MtZml4ZXMuCgpJIGhhdmUgZml4ZWQgbWlzc2luZyBwYXJlbnRoZXNlcyBpbiB0aGUgbGFzdCBw
YXRjaCBpbiAKbHQ5NjExdXhjX2hwZF93b3JrLCBidXQgYXBwYXJlbnRseSBzdGggd2VudCB3cm9u
ZyBhbmQgSSBoYXZlIG1lcmdlZCAKdmVyc2lvbiB3aXRob3V0IHRoZXNlIHBhcmVudGhlc2VzIDoo
LCBjYW4gYmUgZml4ZWQgaW4gYW5vdGhlciBmdXR1cmUgCnBhdGNoc2V0LgoKUmVnYXJkcwoKQW5k
cnplagoKCj4KPgo+IFJlZ2FyZHMKPiBBbmRyemVqCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vcHJvdGVjdDIuZmlyZWV5ZS5jb20v
djEvdXJsP2s9MjBmNGEyZDAtN2Y2ZjliOTYtMjBmNTI5OWYtMGNjNDdhMzAwM2U4LWI4NWI1MDJh
ZThiMzQ4MDEmcT0xJmU9MTk0YjM0NjYtMzM3NC00NzE3LTgyZjctZDRjZWMzOTUxZGQ2JnU9aHR0
cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZk
cmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
