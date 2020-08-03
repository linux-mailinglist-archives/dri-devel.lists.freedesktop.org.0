Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C1123A318
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 13:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF8588249;
	Mon,  3 Aug 2020 11:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1641088249
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 11:07:22 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200803110720euoutp01b8418a07cc37bb80a6c389cb2a860d69~nvWaFwG5V2150121501euoutp01T
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 11:07:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200803110720euoutp01b8418a07cc37bb80a6c389cb2a860d69~nvWaFwG5V2150121501euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1596452840;
 bh=YuGdyCVaKEYE24EuD7N0wpnCbtpkm39w8lrqKYdD6iY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=b3zdmxC1tyio8arxy8UtULAYVkZzqYoEv6UFMj4uAlGud8brt7qJHLYR3GYrMkOKl
 0uxeyxG/Eu1LZqLcFUDmYhVigzKdPg951aWgI4RUPy7KvlU3ttOu6o4Q4yCcetSbkl
 ZK5PgoBdWPKNW7Ci70BZ1uT/SD7lWpWyz1cr8Nt8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200803110720eucas1p271ddc715648770630856e629d5bd8799~nvWZ2IkWc0126901269eucas1p2F;
 Mon,  3 Aug 2020 11:07:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B2.92.06318.8EFE72F5; Mon,  3
 Aug 2020 12:07:20 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200803110720eucas1p24d589fdd1ef2f7bc0e0629dd8cd6a7b6~nvWZdaKJ30535105351eucas1p24;
 Mon,  3 Aug 2020 11:07:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200803110720eusmtrp1d85e781ca1f455426951f388e375ef9f~nvWZcjdh20426104261eusmtrp1l;
 Mon,  3 Aug 2020 11:07:20 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-09-5f27efe8f4c3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id AC.66.06314.8EFE72F5; Mon,  3
 Aug 2020 12:07:20 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200803110719eusmtip152dc41f6fc746fec13c3f3a0e45ef509~nvWY3hoZ11924719247eusmtip1q;
 Mon,  3 Aug 2020 11:07:19 +0000 (GMT)
Subject: Re: [PATCH] vgacon: fix out of bounds write to the scrollback buffer
To: Greg KH <greg@kroah.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <86fc45ac-5bb1-50a2-5f4c-5c2da30f7c3b@samsung.com>
Date: Mon, 3 Aug 2020 13:07:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200803094753.GC635660@kroah.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjt3b27u1pXXmfig0nBCM2oVNaP2wdSFnH/hAsiKixbeZkrN21X
 V0Y/hKJ0MyutpkvLRJdKaPmxmq0Iy48hSl9TC0UTi5Km5izoa9W8k/x3nnPO857nwEsTcq80
 ktbqs3mDXp2hoIJJe+f3vrUfp2JS4xunFKzZ3InYP/bLBPv66xTF9lWWInayIor9Md1LsN1F
 01L2VVs5xXZ0mgjWZVGyY0UeGVtsqiHYlpl+CTvx20JtCeFqn5uk3I3Jo9yjb5Uk57AOy7iz
 zzxSrqm+gOI871Rcd+lPkhsxd0k47+chGff+1zDFeZuWc40trRIVsz94cxqfoTXyhrjEQ8Hp
 NwrKJFlnQ0+629pkeaiZMaEgGvB6GPA1SE0omJbjWgTDP8uROMwi+GR3BhQvglnHU9n8StFn
 CykKtxHUfrAHBg+CL88fk35XGE6GlvtDEj9eiqMgv9op85sI7CTh6oNvcwKFN8Ll8/X/Amma
 wYngG9vhp0m8Em6ZLkj9OBzvhZnRp3OYwaHgKhufez8Ix8PEmZI5TOAIeDt+UyLiFXCm9Trh
 zwJ8iwZbsY8Uz94OY+57SMRhMNHVEqgTBT0lhaS40IDgd/7HwPZ9BLdLfJTo2gRDfT8o/6UE
 joXGtjiR3go1T/oJPw04BAY9oeIRIVBstwRoBvLPyUV3NNy13aXmY02OOuISUlgXVLMuqGNd
 UMf6P7cSkfUogs8RdBpeUOr5E+sEtU7I0WvWHcnUNaF/X7HH1/X1AXr863A7wjRSLGHSvdGp
 cqnaKOTq2hHQhGIpk9Tbc1DOpKlzT/GGzFRDTgYvtKNlNKmIYJRVnw7IsUadzR/j+SzeMK9K
 6KDIPGQcSbpQcRBrD7vcSdIrL1ftvqfdqXA5BvqPO1Xuffrk5kdTvfGesUWLBU1IeJ1tmzt2
 V4pZvWpPdYrzT0Jobp7G/LDwi/zi5jdVy1M6XtCj52MGa20bCh0xqmuLyhff4XUdNmO0UlVS
 V+nNSjMm5k0eP2A5vXVN37Dz9YArYdSuIIV0dcJqwiCo/wJKL1MehgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphleLIzCtJLcpLzFFi42I5/e/4Xd0X79XjDZo/8Fh0dx9jtPi/bSKz
 xZWv79kszi2YwWjxbq6Mxa8PZ5ktTvR9YLW4vGsOm8XRY13MFienG1s86nvLbjGpaymzxZZP
 15gsXv2dzubA57HiQherx7x3WR57vy1g8dg56y67R8uRt6wem1Z1snm8fRjgcWLGbxaP+93H
 mTw+v7nD7vH0z102j8+b5DzWb9nKFMAbpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hs
 HmtlZKqkb2eTkpqTWZZapG+XoJcxr3MmU0GLYMXVXbvYGxg383YxcnJICJhI9L2ZztLFyMUh
 JLCUUeJe52nmLkYOoISMxPH1ZRA1whJ/rnWxQdS8ZpS40DqVCSQhLOArsfj/DjYQWwSovmPJ
 HnaQImaBfSwSr1d2MUJ0HGKWaH/4GqyDTcBKYmL7KkaQDbwCdhL/HrmBhFkEVCQWdvWygtii
 AhESh3fMYgSxeQUEJU7OfMICYnMKGEi8ap4MZjMLqEv8mXeJGcIWl7j1ZD4ThC0v0bx1NvME
 RqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQJTwLZjPzfvYLy0
 MfgQowAHoxIPb8ZntXgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2I0BXpu
 IrOUaHI+MD3llcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpg7A9Q
 s/L3fHivZ6rtk6m7+ZS43vKujFiZ63jW8MgKIwnJwtssB5o5GbqWsMb9vSzGe7il6ZDr5SPM
 nhUFu/cXmvIY/Enq/H5Z2urVv7sZaxa+U0448u7cdGvWCWz7PTiiktqnPZ9pwvr/ftOy/WzR
 s1zTVRYVfxe0rXLPf2wSzON179Prr70PlViKMxINtZiLihMB+KKm1xcDAAA=
X-CMS-MailID: 20200803110720eucas1p24d589fdd1ef2f7bc0e0629dd8cd6a7b6
X-Msg-Generator: CA
X-RootMTR: 20200803094820eucas1p1696af31a3c9a295b7c4a4f478a5bde8d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200803094820eucas1p1696af31a3c9a295b7c4a4f478a5bde8d
References: <659f8dcf-7802-1ca1-1372-eb7fefd4d8f4@kernel.org>
 <dbcf2841-7718-2ba7-11e0-efa4b9de8de1@nsfocus.com>
 <9fb43895-ca91-9b07-ebfd-808cf854ca95@nsfocus.com>
 <9386c640-34dd-0a50-5694-4f87cc600e0f@kernel.org>
 <20200803081823.GD493272@kroah.com>
 <CAKMK7uEV+CV89-L1Y=dijOEy8DKE=juRfQDnNnbhbAJhFh1fYw@mail.gmail.com>
 <CGME20200803094820eucas1p1696af31a3c9a295b7c4a4f478a5bde8d@eucas1p1.samsung.com>
 <20200803094753.GC635660@kroah.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Kyungtae Kim <kt0755@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 DRI devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>,
 Solar Designer <solar@openwall.com>, Anthony Liguori <aliguori@amazon.com>,
 Yang Yingliang <yangyingliang@huawei.com>, xiao.zhang@windriver.com,
 Jiri Slaby <jirislaby@kernel.org>, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMy8yMCAxMTo0NyBBTSwgR3JlZyBLSCB3cm90ZToKPiBPbiBNb24sIEF1ZyAwMywgMjAy
MCBhdCAxMDo0NTowN0FNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+PiBPbiBNb24sIEF1
ZyAzLCAyMDIwIGF0IDEwOjI2IEFNIEdyZWcgS0ggPGdyZWdAa3JvYWguY29tPiB3cm90ZToKPj4+
Cj4+PiBPbiBNb24sIEF1ZyAwMywgMjAyMCBhdCAxMDowODo0M0FNICswMjAwLCBKaXJpIFNsYWJ5
IHdyb3RlOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gT24gMzEuIDA3LiAyMCwgNzoyMiwg5byg5LqR5rW3
IHdyb3RlOgo+Pj4+PiBSZW1vdmUgd2hpdGVzcGFjZSBhdCBFT0wKPj4+Pgo+Pj4+IEkgYW0gZmlu
ZSB3aXRoIHRoZSBwYXRjaC4gSG93ZXZlciBpdCBzaG91bGQgYmUgc2VudCBwcm9wZXJseSAoaW5s
aW5lCj4+Pj4gbWFpbCwgaGF2aW5nIGEgUEFUQ0ggc3ViamVjdCBldGMuIC0tIHNlZQo+Pj4+IERv
Y3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0KS4gZ2l0IHNlbmQtZW1h
aWwgYWZ0ZXIgZ2l0Cj4+Pj4gZm9ybWF0LXBhdGNoIGhhbmRsZXMgbW9zdCBvZiBpdC4KPj4+Pgo+
Pj4+IFRoZXJlIGlzIGFsc28gcXVlc3Rpb24gd2hvIGlzIHdpbGxpbmcgdG8gdGFrZSBpdD8KPj4+
Pgo+Pj4+IEJhcnQ/IEdyZWc/IFNob3VsZCB3ZSByb3V0ZSBpdCB2aWEgYWtwbSwgb3Igd2lsbCB5
b3UgTGludXMgZGlyZWN0bHk/IChJCj4+Pj4gY2FuIHNpZ24gb2ZmIGFuZCByZXNlbmQgdGhlIHBh
dGNoIHdoaWNoIHdhcyBhdHRhY2hlZCB0byB0aGUgbWFpbCBJIGFtCj4+Pj4gcmVwbHlpbmcgdG8g
dG9vLCBpZiBuZWVkIGJlLikKPj4+Cj4+PiBJIGNhbiB0YWtlIGl0LCBpZiBCYXJ0IGNhbid0LCBq
dXN0IGxldCBtZSBrbm93Lgo+Pgo+PiBZZWFoIHZ0IHN0dWZmIGFuZCBjb25zb2xlIGRyaXZlcnMg
IT0gZmJjb24gZ28gdGhyb3VnaCBHcmVnJ3MgdHJlZSBwYXN0Cj4+IGZldyB5ZWFycyAuLi4KPj4K
Pj4gR3JlZywgc2hvdWxkIHdlIG1heWJlIGFkZCBhIE1BSU5UQUlORVJTIGVudHJ5IHRoYXQgbWF0
Y2hlcyBvbiBhbGwKPj4gdGhpbmdzIGNvbnNvbGU/IFdpdGggdHR5L3Z0IHlvdSBkZWZpbml0ZWx5
IGhhdmUgdGhlIG90aGVyIHNpZGUgb2YgdGhhdAo+PiBjb2luIGFscmVhZHkgOi0pCj4gCj4gU3Vy
ZSwgdGhhdCB3b3VsZCBiZSBnb29kIGFzIHRoaW5ncyBkbyBmYWxsIHRocm91Z2ggdGhlIGNyYWNr
cyBhdCB0aW1lcy4KClNpbmNlIHRha2luZyBvdmVyIGZiZGV2IGluIDIwMTcgSSd2ZSB0cmllZCB0
byBhY3QgYXMgdGhlIGxhc3QgcmVzb3J0Ck1haW50YWluZXIgZm9yIGNvbnNvbGUgc3R1ZmYgKEFG
QUlLIHRoZXJlIGFyZSBubyAibG9zdCIgcGF0Y2hlcykgYnV0Cml0IHJlYWxseSBkZXNlcnZlcyBp
dHMgb3duIGVudHJ5LgoKQWxzbyBtb3N0IGNvbnNvbGUgcGF0Y2hlcyBtYWtlIGl0IHRocm91Z2gg
eW91IG5vd2FkYXlzIGFueXdheToKCiQgZ2l0IGxvZyAtLXByZXR0eT1mdWxsZXIgLS1zaW5jZT0y
MDE3IGRyaXZlcnMvdmlkZW8vY29uc29sZS98Z3JlcCAiQ29tbWl0XDoifHNvcnR8dW5pcSAtY2QK
ICAgICAgMiBDb21taXQ6ICAgICBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgogICAgIDEx
IENvbW1pdDogICAgIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1z
dW5nLmNvbT4KICAgICAgMiBDb21taXQ6ICAgICBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgogICAgICAzIENvbW1pdDogICAgIERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhh
dC5jb20+CiAgICAgMTIgQ29tbWl0OiAgICAgR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz4KICAgICAgNyBDb21taXQ6ICAgICBMaW51cyBUb3J2YWxkcyA8dG9y
dmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+CiAgICAgIDIgQ29tbWl0OiAgICAgTWFydGluIFNj
aHdpZGVmc2t5IDxzY2h3aWRlZnNreUBkZS5pYm0uY29tPgoKPiBJZiB5b3Ugd3JpdGUgdGhlIHBh
dGNoLCBJJ2xsIG1lcmdlIGl0IDopCkFDSyBmcm9tIG1lLiA6KQoKQmVzdCByZWdhcmRzLAotLQpC
YXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ft
c3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
