Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E081ADEFF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79BD6EC11;
	Fri, 17 Apr 2020 14:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7429C6EC11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:01 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140800euoutp0258214cfff51d2d81ca53da63b6b191ab~GoJTwaFvK1573015730euoutp02R
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200417140800euoutp0258214cfff51d2d81ca53da63b6b191ab~GoJTwaFvK1573015730euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132480;
 bh=77Mwf962+FuZGbL9oamghlTb033AywNJjiaPVhTzWic=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=E1TjHNIw+jJZCIUz2uGRg1D5QWWYeAqkyUMsg00jRbwnFXvNM3mzbWy4hwzaLI+v1
 TieuQ7xD5uAK3V3QKH1gHTBeEuGY27ZpDLfZRzaIv4l3QxG1zo4k/Z1qTGeIX97I6z
 ot2aZWa2sTEqsTeI97PLv49Q7g4yn6eNafiERCxU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200417140800eucas1p2b199351b6cd88d4814f3aead42121a54~GoJTovjoC1773817738eucas1p2B;
 Fri, 17 Apr 2020 14:08:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EE.EF.60679.F38B99E5; Fri, 17
 Apr 2020 15:08:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200417140759eucas1p1f228ea1b09d74f433be9bf16a21d6cc6~GoJTT_XRc1490114901eucas1p18;
 Fri, 17 Apr 2020 14:07:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140759eusmtrp1c6bb1a6f007ff77c6d34622d82eb1849~GoJTTWlMG2228222282eusmtrp1o;
 Fri, 17 Apr 2020 14:07:59 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-e6-5e99b83fcaf6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 23.E0.07950.F38B99E5; Fri, 17
 Apr 2020 15:07:59 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140759eusmtip2f1dffef3698a116be9860a2923925a33~GoJS1F7e92969929699eusmtip2b;
 Fri, 17 Apr 2020 14:07:59 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: fbdev: imxfb: ensure balanced regulator usage
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <1dcf1273-ae01-02c6-d9a4-5eef744ab764@samsung.com>
Date: Fri, 17 Apr 2020 16:07:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200323211626.24812-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjlt3u3XUfTn9PyS0NhUVKUziy4momC2PqnF4GhaV3zouKTXbUM
 JFNKXZIvTFyhouZjxNRl85EIzmo+QIM0wowKBU3wrYTaNK9Xyf/Od75zON+BjyIUXWJnKjYx
 hdUkMvFKiYw0fVwbOh3QXh6hMtUgemR1XkL/Gr1C60s7SNo48UVM9z1bENPa9UaCtrYZSXq6
 1Yn+VlSCAmzUHbrvUrVRnydR/3hqEanf1D5Ut8y1i9QFVpV62eh6VRoq84ti42PTWI2n/x1Z
 zKphTZTcje9bs9aJTJQn1yIbCvBZePe4DmmRjFLgBgQd+SsSYVhBMGttEgnDMoKWxkrJnqW6
 M08sLOoRLI+M7qpmEZiat6S8SoJ9oShHj3jsgC/B1JSB1CKKcsTBsGg4zOsJ3CSChuViktfI
 sT8MvN4S85jEx2BptXSHP4hvwtLPXrGgsYf+8skd3gYHQdZ8DsFjAjvB2GSlSMBukP32BcEH
 AB6QwqOaOSScHQRT7eOkgB1gxtIqFfARGCzJJwWDAYE1d3rX3YagvmRzt/R5GB9al/AVCHwC
 mjo9BToQWhatBE8DtoWvs/bCEbZQbCrbpeWQ+0QhqI9Dc12zZC9W29FIFCKlbl813b46un11
 dP9zqxCpR05sKpcQzXJnEtl7HhyTwKUmRnvcTUowou2fGty0rLSjzr+RZoQppDwgV+WXRyjE
 TBqXnmBGQBFKR3lP8DYlj2LSH7CapNua1HiWMyMXilQ6yb2rf4crcDSTwsaxbDKr2duKKBvn
 THTZxz0su/hPeqS5AqQ9Yf6hCx80w96GQP0k437uZUG8xq7aweHWxlFlSAbX53VjpktsUQR+
 9h4bThkMZC6YeukN3+cZhgmLrq2prkLmU1413BPJpl73u6b65HZq0qzq93Ve0vcs1MYVHpp6
 lRz83iWkoGym0NWO67vYHT4fsqYkuRjG6ySh4Zh/cB4aZk8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xe7r2O2bGGTydom1x5et7NouHV/0t
 Vk3dyWKx6fE1VosTfR9YLbp+rWS2+Lt9E4vFiy3iFrcnTmZ04PTYOesuu8emVZ1sHve7jzN5
 bF5S77Hx3Q4mj/6/Bh6fN8kFsEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZ
 Kunb2aSk5mSWpRbp2yXoZXxd95OpYJ9Axd+mX8wNjJ28XYycHBICJhKLdnWygthCAksZJfom
 x3UxcgDFZSSOry+DKBGW+HOti62LkQuo5DWjRMf/pewgCTYBK4mJ7asYQWxhAU+J58/XsYD0
 igi4SXxcJwlSzyywnkli8qm3jBDzpzNKXH2RAmLzCthJnFrzH2wvi4CqxKevU1lAbFGBCInD
 O2YxQtQISpyc+QQszingItH0vp0ZxGYWUJf4M+8SlC0ucevJfCYIW16ieets5gmMQrOQtM9C
 0jILScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBEbktmM/t+xg7HoXfIhRgINR
 iYfXoGdmnBBrYllxZe4hRgkOZiUR3oNuQCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OByaL
 vJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjDFHFavlWTIt80oK
 En83HmuOvVcrt5X7PoN95BXDf7xtD9OX5zcI5D2+lNQj+cn70oGPHLo36u4Fbz+6za284f5a
 sys8YcYB7awR/WdOpbZfODLXMV4rJyc3dk2Im/xj3vr1vS6nXkidz39+w+Tl1ReLC4211le2
 RzVsW9SYkzzxmEHM7gP7lViKMxINtZiLihMBU6EHit4CAAA=
X-CMS-MailID: 20200417140759eucas1p1f228ea1b09d74f433be9bf16a21d6cc6
X-Msg-Generator: CA
X-RootMTR: 20200323211646eucas1p270ab02024c326adba5a50b908ef8ba8a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200323211646eucas1p270ab02024c326adba5a50b908ef8ba8a
References: <CGME20200323211646eucas1p270ab02024c326adba5a50b908ef8ba8a@eucas1p2.samsung.com>
 <20200323211626.24812-1-u.kleine-koenig@pengutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjMvMjAgMTA6MTYgUE0sIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IFRoZSBmYmRl
diBmcmFtZXdvcmsgZG9lc24ndCBjYXJlIHRvIGNhbGwgdGhlIC5zZXRfcG93ZXIgY2FsbGJhY2sg
b25seSBvbgo+IGNoYW5nZXMuIFNvIHRoZSBkcml2ZXIgaGFzIHRvIGNhcmUgZm9yIGl0c2VsZiB0
aGF0IHRoZSByZWd1bGF0b3IgZG9lc24ndAo+IGdldCBkaXNhYmxlZCBtb3JlIG9mdGVuIHRoYW4g
ZW5hYmxlZC4KPiAKPiBUaGlzIGZpeGVzIHRoZSByZWd1bGF0b3Igd2FybmluZwo+IAo+IAl1bmJh
bGFuY2VkIGRpc2FibGVzIGZvciBsY2Qgc3VwcGx5Cj4gCj4gd2hpY2ggY2FuIGJlIHRyaWdnZXJl
ZCBieSBkb2luZwo+IAo+IAllY2hvIDQgPiAvc3lzL2NsYXNzL2xjZC9pbXhmYi1sY2QvbGNkX3Bv
d2VyCj4gCj4gdHdpY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KClBhdGNoIHF1ZXVlZCBmb3IgdjUuOCwgdGhh
bmtzLgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcg
UiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwoKPiAtLS0KPiAgZHJpdmVy
cy92aWRlby9mYmRldi9pbXhmYi5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2lteGZiLmMgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2lteGZiLmMKPiBpbmRleCAzNzBiZjI1NTNkNDMuLjg4NGIxNmVmYTdlOCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2lteGZiLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2lteGZiLmMKPiBAQCAtMTcyLDYgKzE3Miw3IEBAIHN0cnVjdCBpbXhmYl9pbmZvIHsKPiAg
CWludAkJCW51bV9tb2RlczsKPiAgCj4gIAlzdHJ1Y3QgcmVndWxhdG9yCSpsY2RfcHdyOwo+ICsJ
aW50CQkJbGNkX3B3cl9lbmFibGVkOwo+ICB9Owo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2VfaWQgaW14ZmJfZGV2dHlwZVtdID0gewo+IEBAIC04MDEsMTYgKzgwMiwz
MCBAQCBzdGF0aWMgaW50IGlteGZiX2xjZF9nZXRfcG93ZXIoc3RydWN0IGxjZF9kZXZpY2UgKmxj
ZGRldikKPiAgCXJldHVybiBGQl9CTEFOS19VTkJMQU5LOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50
IGlteGZiX3JlZ3VsYXRvcl9zZXQoc3RydWN0IGlteGZiX2luZm8gKmZiaSwgaW50IGVuYWJsZSkK
PiArewo+ICsJaW50IHJldDsKPiArCj4gKwlpZiAoZW5hYmxlID09IGZiaS0+bGNkX3B3cl9lbmFi
bGVkKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCWlmIChlbmFibGUpCj4gKwkJcmV0ID0gcmVndWxh
dG9yX2VuYWJsZShmYmktPmxjZF9wd3IpOwo+ICsJZWxzZQo+ICsJCXJldCA9IHJlZ3VsYXRvcl9k
aXNhYmxlKGZiaS0+bGNkX3B3cik7Cj4gKwo+ICsJaWYgKHJldCA9PSAwKQo+ICsJCWZiaS0+bGNk
X3B3cl9lbmFibGVkID0gZW5hYmxlOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gIHN0
YXRpYyBpbnQgaW14ZmJfbGNkX3NldF9wb3dlcihzdHJ1Y3QgbGNkX2RldmljZSAqbGNkZGV2LCBp
bnQgcG93ZXIpCj4gIHsKPiAgCXN0cnVjdCBpbXhmYl9pbmZvICpmYmkgPSBkZXZfZ2V0X2RydmRh
dGEoJmxjZGRldi0+ZGV2KTsKPiAgCj4gLQlpZiAoIUlTX0VSUihmYmktPmxjZF9wd3IpKSB7Cj4g
LQkJaWYgKHBvd2VyID09IEZCX0JMQU5LX1VOQkxBTkspCj4gLQkJCXJldHVybiByZWd1bGF0b3Jf
ZW5hYmxlKGZiaS0+bGNkX3B3cik7Cj4gLQkJZWxzZQo+IC0JCQlyZXR1cm4gcmVndWxhdG9yX2Rp
c2FibGUoZmJpLT5sY2RfcHdyKTsKPiAtCX0KPiArCWlmICghSVNfRVJSKGZiaS0+bGNkX3B3cikp
Cj4gKwkJcmV0dXJuIGlteGZiX3JlZ3VsYXRvcl9zZXQoZmJpLCBwb3dlciA9PSBGQl9CTEFOS19V
TkJMQU5LKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
