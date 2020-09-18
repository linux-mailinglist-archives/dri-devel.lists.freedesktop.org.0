Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DCD27009E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 17:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B886E13C;
	Fri, 18 Sep 2020 15:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F426E13C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 15:13:24 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200918151322euoutp0230e7621554d84114305062541b680a83~16YWtXCkM1315713157euoutp02B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 15:13:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200918151322euoutp0230e7621554d84114305062541b680a83~16YWtXCkM1315713157euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1600442002;
 bh=SZbHVV2JypCryt9GVj8eUqjOJnnk5VyYDZFqjnLzPdA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=HucL3bFmCOjmG1QmB6Falq82FPL25dR2CRoLo8ez6KYtk1DIUS+v+4w/0FqO5w6Jw
 iMeUSYNDfzgEzgxJsIudVONH1/DH90VVYPfvOtPE8ZY3cLR1p4d1Di1Z2ioNFtOVfr
 P5OwsUgx8Y589LC/q9s0kFz5KG9YyFkkM1frbjs0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200918151322eucas1p154435b3ed506dda02cbde20320f59e9d~16YWSYSP81330713307eucas1p1D;
 Fri, 18 Sep 2020 15:13:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BE.94.06318.29EC46F5; Fri, 18
 Sep 2020 16:13:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200918151322eucas1p236126959c3cc725132450b228701ee72~16YV6FGzN2444524445eucas1p2S;
 Fri, 18 Sep 2020 15:13:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200918151322eusmtrp2fd051ad885278f61b4ae44c30dc2a27d~16YV49JF20618906189eusmtrp2S;
 Fri, 18 Sep 2020 15:13:22 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-d9-5f64ce927644
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 35.52.06017.19EC46F5; Fri, 18
 Sep 2020 16:13:21 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200918151320eusmtip2208d181453ed3ef09a4f43c068dcffaa~16YUdkdOB0469904699eusmtip24;
 Fri, 18 Sep 2020 15:13:20 +0000 (GMT)
Subject: Re: [PATCH 00/18] Convert arch/arm to use iommu-dma
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
 linux@armlinux.org.uk
Message-ID: <693f4d91-7dd3-31e6-92b6-7ffa84dd3226@samsung.com>
Date: Fri, 18 Sep 2020 17:13:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bf32cdea-ee5b-1431-3b97-c0889acdacc6@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0yTZxTG9373Emo+ipMzXNjWuCWaiCKavYmE3ZN3f5gsiybGRFi3fkEU
 KuknOuaWVcBJO0VbM8Ci1SDGDbwwLpV7Q7V2BSkCiuhgdcLmysRiwE1B3Ww/2Pjvd55znpzz
 vHkFWnOVixcyDTsko0GXpeWiGOflx/7lNr8+faXzQDz2j8wwuMt1n8HVD0YQvvYwxOFj5TaE
 f6j2UNgWOMTgE661uNBewWBzeQ2Pu/Pv8dhsreRx7cgAi62ubh73Nx/l8P6aBhb3F/QiXNbT
 TmHzlJ3D7u/aEL5dPc7h/MJk3DExyuK26XYWlx0OcrjytyIOP252MLi47WNcOLQGB2x1zNsJ
 ZLTDQZEzjjOI9A/00sTavZw02Yd5Ul50hCW1VWaODA20ciTwrZcidZVfk8ODpxFpuWniSKHP
 xZADBfc5UlxfhYh38AL1UcymqBS9lJW5UzKuSP0kakvD30tyQos+7+zrpUyoQ2NBKgHE1WCu
 LqEsKErQiN8jmLzxiFaKKQQB0wSjFJMIDpb8RM9ZJjpLZxunEYz1HJ21hBDM7B1hw1OxYgp4
 eu9GHJyYBJZxCxfmheJmmG58wocNtNjKgskWYMINtZgKp1pqIsyIr8Mvx5oi/KKYBpc778zO
 xIDvyOhzFgSV+Bb86IoOy7T4ChQ0lNMKx8Gt0eORQCCWqsC37xKrnP0+NJ5roBSOhTFvPa/w
 y/BP05yhAMGv/rO8UuxH0J9fhpSptTDkn+bCm2lxKZxvXqHI74BnuDUig7gABsdjlCMWgM1Z
 SiuyGoq+mX3sN8DuPfff2o6rffQhpLXPS2afF8c+L479/70nEFOF4qRcOTtDkpMN0q5EWZct
 5xoyEj/bnl2Lnv/zrmfeh42o/cmnbiQKSBut/sOhT9ewup1yXrYbgUBrF6rf7e5K06j1urwv
 JOP2dGNuliS70WKB0capkyuCmzVihm6HtE2SciTjXJcSVPEmpDrVZmi2rHd6Uto148OrdoXe
 vLd1z0FH13WNGzlbSOzJnoRLX+7WvSenvXY24avFVyouBH/PGby959WYnLtBhy9+Xf3G4zPr
 3Bf3Pc3c2JpXetL351ZPUmjpJHk0pR37C1le+rAuWPUB9BVbz6cyiSUbeJ+18oU1q/U3on+2
 ZdzEWMvIW3RJy2ijrPsX0InXyeMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe8/OOTtGi9Na9TK6cVIIoVOb6R5rmtWHTtCHLtSHrGy4w6yc
 k3NmZBTNHKGzJI3Ktlo3LdI+mJdM09YsMzMLM5aFaeEig7wUWXRBU1fgtx/P8/898MCfUajf
 UVpmT5pdlNJMqRw9lWwdae5eUvjMnLTs9GF41vubhFbfAAllX3oRvBwepOGCpxDBjbImAgp7
 TpJwybcSnO4rJOR6ypXQdvSzEnILipVQ0RugoMDXpoSOuvM0HC+vpqAjux1B0fN7BOR+c9PQ
 eLoBwbuyfhqOOqPAPxSkoOHXPQqKTn2iofhDDg0/67wk5DdsBmdXNPQUVpIJ84Wg30sIN703
 kdARaFcIBW1LhFr3W6XgyTlHCRWlubTQFainhZ68ZkKoLD4inOq8joS7rx204GzxkcKJ7AFa
 yK8qRUJzZw2xccZ23ijZMuziwhSbbI/jEnWg53WxwOuXx/K6KMPOFfpobmm80Sym7tkvSkvj
 d/Mp1T/C0wdnH3jyop1wIL/ahcIYzC7HQ0/Oki40lVGzJQg7L2crQou5uOWMgwrxTPwn4KJD
 oX6E60b6iPHFTNaIm9o/Tgg0q8Ou/vFQGKNhd+Jv18smWMHWU7ikXxuS7yN8dfTKhKxi43HJ
 3XJynEk2AndfqJ3gWewu/PR4Hx3KzMAt54Jjc4YJY1fhW75poZsx2Fv5XhHiBTi72vOP5+A3
 wYvESaR2T7LdkxT3JMU9SbmEyFKkETNkq8Uq63nZZJUz0ix8ss1agcbadfvRz6o7yDWwpRGx
 DOKmqfq85iQ1ZdovZ1obEWYUnEa1pq11l1plNmUeFCVbkpSRKsqNKHrstwKFdlaybayrafYk
 XbTOALE6Q5QhKga4Oaoc1r9DzVpMdnGfKKaL0n+PYMK0DrS4atHuZO4V72ww67v1XYPd0x8Y
 /X+k0b1r7eWRlhvVs0s9ZJ4U3HYm3JlXkxnewTpWboW5QwHNvPrECG1Wa+Kh4WtNceSUT/cj
 uc5lPz4WRaTHDA0/tGy2H6kZ3PT98Rrj+pIN7n1fdxxbN7ot/2Fn1peY1bUJI/m8hkjIYuIM
 HCmnmHSRCkk2/QUeyKrJcwMAAA==
X-CMS-MailID: 20200918151322eucas1p236126959c3cc725132450b228701ee72
X-Msg-Generator: CA
X-RootMTR: 20200820150857eucas1p18f5f2ad87703a68b6ed20a090f7c1c57
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200820150857eucas1p18f5f2ad87703a68b6ed20a090f7c1c57
References: <CGME20200820150857eucas1p18f5f2ad87703a68b6ed20a090f7c1c57@eucas1p1.samsung.com>
 <cover.1597931875.git.robin.murphy@arm.com>
 <bf32cdea-ee5b-1431-3b97-c0889acdacc6@samsung.com>
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, linux-samsung-soc@vger.kernel.org, magnus.damm@gmail.com,
 kyungmin.park@samsung.com, jonathanh@nvidia.com, agross@kernel.org,
 yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKT24gMjQuMDguMjAyMCAxMzo0MCwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPiBP
biAyMC4wOC4yMDIwIDE3OjA4LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+IEFmdGVyIDUgeWVhcnMg
b3Igc28gb2YgaW50ZW5kaW5nIHRvIGdldCByb3VuZCB0byB0aGlzLCBmaW5hbGx5IHRoZQo+PiB0
aW1lIGNvbWVzISBUaGUgY2hhbmdlcyB0aGVtc2VsdmVzIGFjdHVhbHkgdHVybiBvdXQgdG8gYmUg
cmVsYXRpdmVseQo+PiBtZWNoYW5pY2FsOyB0aGUgYmlnZ2VyIGNvbmNlcm4gYXBwZWFycyB0byBi
ZSBob3cgdG8gZ2V0IGV2ZXJ5dGhpbmcKPj4gbWVyZ2VkIGFjcm9zcyBhYm91dCA1IGRpZmZmZXJl
bnQgdHJlZXMgZ2l2ZW4gdGhlIGRlcGVuZGVuY2llcy4KPj4KPj4gSSd2ZSBsaWdodGx5IGJvb3Qt
dGVzdGVkIHRoaW5ncyBvbiBSb2NrY2hpcCBSSzMyODggYW5kIEV4eW5vcyA0NDEyCj4+IChPZHJv
aWQtVTMpLCB0byB0aGUgZGVncmVlIHRoYXQgdGhlaXIgZGlzcGxheSBkcml2ZXJzIHNob3VsZCBi
ZSB1c2luZwo+PiBJT01NVS1iYWNrZWQgYnVmZmVycyBhbmQgZG9uJ3QgZXhwbG9kZSAodGhlIE9k
cm9pZCBkb2Vzbid0IG1hbmFnZSB0bwo+PiBzZW5kIGEgd29ya2luZyBIRE1JIHNpZ25hbCB0byB0
aGUgb25lIG1vbml0b3IgSSBoYXZlIHRoYXQgaXQgYWN0dWFsbHkKPj4gZGV0ZWN0cywgYnV0IHRo
YXQncyBhIHByZS1leGlzdGluZyBjb25kaXRpb24uLi4pIENvbmZpcm1hdGlvbiB0aGF0IHRoZQo+
PiBNZWRpYXRlaywgT01BUCBhbmQgVGVncmEgY2hhbmdlcyB3b3JrIHdpbGwgYmUgbW9zdCB3ZWxj
b21lLgo+Pgo+PiBQYXRjaGVzIGFyZSBiYXNlZCBvbiA1LjktcmMxLCBicmFuY2ggYXZhaWxhYmxl
IGhlcmU6Cj4+Cj4+IMKgwqAgZ2l0Oi8vbGludXgtYXJtLm9yZy9saW51eC1ybSBhcm0vZG1hCj4K
PiBXZWxsLCBteSBmaXJzdCBwcm9wb3NhbCBmb3IgdGhlIEFSTSBhbmQgQVJNNjQgRE1BLW1hcHBp
bmcgdW5pZmljYXRpb24gCj4gaGFzIGJlZW4gcG9zdGVkIGxvbmcgdGltZSBhZ286IGh0dHBzOi8v
bGttbC5vcmcvbGttbC8yMDE2LzIvMTkvNzkKPgo+IFRoYW5rcyBmb3IgcmVzdXJyZWN0aW5nIGl0
ISA6KQo+Cj4gSSd2ZSB0ZXN0ZWQgdGhpcyBwYXRjaHNldCBvbiB2YXJpb3VzIEFSTTMyYml0IEV4
eW5vcyBiYXNlZCBib2FyZHMgKG5vdCAKPiBvbmx5IEV4eW5vczQ0MTIpIGFuZCBtb3N0IG9mIHRo
ZW0gd29ya3MgZmluZSBhZnRlciB5b3VyIGNvbnZlcnNpb24uIAo+IEhvd2V2ZXIgdGhlcmUgYXJl
IGlzc3VlcyB5b3UgY2Fubm90IGxlYXJuIGZyb20gdGhlIGNvZGUuCj4KPiBDb252ZXJzaW9uIG9m
IHRoZSBFeHlub3MgRFJNIHdhcyBzdHJhaWdodGZvcndhcmQgKHRoYW5rcyEpLCBidXQgdGhlcmUg
Cj4gYXJlIG90aGVyIEV4eW5vcyBkcml2ZXJzIHRoYXQgZGVwZW5kcyBvbiB0aGUgb2xkIEFSTSBp
bXBsZW1lbnRhdGlvbi4gCj4gVGhlIFM1UC1NRkMgKG9ubHkgZm9yIHRoZSB2NSBoYXJkd2FyZSkg
YW5kIEV4eW5vczQgRklNQy1JU1AgZHJpdmVycyAKPiBkZXBlbmRzIG9uIHRoZSBmaXJzdC1maXQg
SU9WQSBhbGxvY2F0aW9uIGFsZ29yaXRobSBpbiB0aGUgb2xkIEFSTSAKPiBETUEtbWFwcGluZy4g
VGhpcyB3YXMgdGhlIG1haW4gcmVhc29uIEkndmUgZGlkbid0IGNvbnRpbnVlIG15IGluaXRpYWwg
Cj4gY29udmVyc2lvbiBhdHRlbXB0Lgo+Cj4gQm90aCBkcml2ZXJzIGFsbG9jYXRlIGEgYnVmZmVy
IGZvciB0aGVpciBmaXJtd2FyZSBhbmQgdGhlbiBpbiB0aGUgCj4gaGFyZHdhcmUgcmVnaXN0ZXJz
IGFkZHJlc3MgdmlkZW8gYnVmZmVycyBhcyBhbiBvZmZzZXQgZnJvbSB0aGUgCj4gYmVnZ2lubmlu
ZyBvZiB0aGUgZmlybXdhcmUuIFRoaXMgZG9lc24ndCB3b3JrIHdoZW4gdW5kZXJseWluZyAKPiBE
TUEtbWFwcGluZyBhbGxvY2F0ZXMgSU9WQSB3aXRoIHRoZSBsYXN0LWZpdCBhbGdvcml0aG0sIHdo
YXQgdGhlIAo+IGRyaXZlcnMvaW9tbXUvZG1hLWlvbW11LmMgZG9lcy4gU28gZmFyIEkgZGlkbid0
IGZpbmQgYSBnb29kIHNvbHV0aW9uIAo+IGZvciB0aGF0IGlzc3VlLgo+Cj4gSSdtIG9wZW4gZm9y
IHN1Z2dlc3Rpb25zLiBPbmUgbW9yZSBsaW1pdGF0aW9uIGZvciB0aGUgUzVQLU1GQyBkcml2ZXIg
Cj4gaXMgdGhhdCB0aGUgaGFyZHdhcmUgaXMgY2FwYWJsZSBvbmx5IGZvciBhZGRyZXNzaW5nIDEy
OE1pQi4gVGhleSB3aWxsIAo+IHByb2JhYmx5IG5lZWQgdG8gY2FsbCBJT01NVSBBUEkgZGlyZWN0
bHksIGJ1dCBJIHdvdWxkIGxpa2UgdG8ga2VlcCBhcyAKPiBtdWNoIGZyb20gdGhlIElPTU1VL0RN
QS1tYXBwaW5nIGNvZGUgYXMgcG9zc2libGUuCgpKdXN0IGZvciB0aGUgcmVjb3JkLiBJJ3ZlIGZp
bmFsbHkgbWFuYWdlZCB0byBhZGQgbmVlZGVkIHdvcmthcm91bmRzIHRvIAp0aGUgYm90aCBwcm9i
bGVtYXRpYyBFeHlub3M0IGRyaXZlcnMsIHNvIHRoZXkgd29yayBmaW5lIHdpdGggdGhpcyAKcGF0
Y2hzZXQuIEl0IHR1cm5lZCBvdXQgdGhhdCBpdCB3YXNuJ3QgdGhhdCBoYXJkOgoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtc2Ftc3VuZy1zb2MvMjAyMDA5MTgxNDQ4MzMuMTQ2MTgtMS1t
LnN6eXByb3dza2lAc2Ftc3VuZy5jb20vVC8jdAoKU28gZnJvbSBteSBzaWRlIHlvdSBoYXZlIGEg
Z3JlZW4gbGlnaHQgdG8gZ28gYWhlYWQgYW5kIHN3aXRjaCBBUk0gMzJiaXQgCnRvIGdlbmVyaWMg
Y29kZS4gVGltZSB0byBzYXkgZ29vZCBieWUgdG8gdGhlIG9uZSBvZiBteSBiaWdnZXN0IAphcmNo
aXRlY3R1cmUgcmVsYXRlZCB0aGluZ3MgbWVyZ2VkIG9uY2UgdG8gbWFpbmxpbmUgTGludXguIDsp
CgpCZXN0IHJlZ2FyZHMKLS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1zdW5nIFImRCBJbnN0
aXR1dGUgUG9sYW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
