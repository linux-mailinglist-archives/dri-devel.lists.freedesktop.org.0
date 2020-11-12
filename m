Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB12B00E0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E326E183;
	Thu, 12 Nov 2020 08:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22396E183;
 Thu, 12 Nov 2020 08:10:54 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201112081042euoutp01ee2b09c53d6708d5028b94218aec3a07~GtGA8LMfA1889818898euoutp01_;
 Thu, 12 Nov 2020 08:10:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201112081042euoutp01ee2b09c53d6708d5028b94218aec3a07~GtGA8LMfA1889818898euoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1605168642;
 bh=5QhIz+Gn5Nu1t1BJ55g8tgSxAnN2Qhv3UsWQAPjr2XE=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=b64XoHNHyRH94WtnWrIiT5KU/cDx5fnxzItI77Kk7w6SZX7tsbA7Ai3ryZMzN5Lct
 /YSCwayQ3wP9rhBfKUQ6YvKDKVpMpPXrLRlytAyQgSyHTrglDtwehR53iPmlFxJL/4
 fmxfGzt1a6FiPCOc3jgRik1oRrUBO3w1EsNW9HmI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201112081037eucas1p10001fdda6dddb9d057a3eb3cec683c9b~GtF75tkcF3069230692eucas1p1I;
 Thu, 12 Nov 2020 08:10:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F7.8C.27958.CFDECAF5; Thu, 12
 Nov 2020 08:10:37 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df~GtF7QhSjo3069230692eucas1p1H;
 Thu, 12 Nov 2020 08:10:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201112081036eusmtrp1008f17458f30bdd010557b6fe39947dc~GtF7Pb3DY0531605316eusmtrp1k;
 Thu, 12 Nov 2020 08:10:36 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-d1-5facedfc7293
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 08.81.21957.CFDECAF5; Thu, 12
 Nov 2020 08:10:36 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201112081034eusmtip10485455f165c607ea5327c010a6dcda1~GtF5oIs1T2201322013eusmtip1k;
 Thu, 12 Nov 2020 08:10:34 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [patch V3 10/37] ARM: highmem: Switch to generic kmap atomic
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Message-ID: <c07bae0c-68dd-2693-948f-00e8a50f3053@samsung.com>
Date: Thu, 12 Nov 2020 09:10:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201103095857.582196476@linutronix.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTZxzdd58tWnIBJx9gtliUBLehbNN9ic5oYuI1MxuLWbKYkFrmDbjx
 SitOINlAkPESTUFWSnlNCC3lMS/PyLsOKiBlUGQIDGxgSHjoVodMsGXQqxv/nXN+53y/8/vj
 E+HuVspbdCHyIqeIlIdLKReiofuF+T37UqXsQKMWQw/GijGkramkkF3VTaPb6hoS5Q6qcLQ0
 1Uwi7UAygYaXn1JIb+jCUE7uFYD46RESDU3raNRQloyhltYeAlnuaCmUxtcDNFm5TqKrE1UY
 0vdX0ch4sxWgtRUHibKfzAJkcPQCtJKVRSJb6XMCma51YOjaTBaG2lIfYSihR0eiGr4IR7X8
 TRwV9FXTaMBuIlF5fyGF/vl5mjzmy14dslOsZWQQZ9dWVYCt0z/E2OS2MZqt1e1j+Yo0iuVt
 Kpp9YjbT7D31GsHOdTbibHtBJc1OZZgwtrb0ezZ7tBywA+oSELTzrMuR81z4hUucYv/Rcy5h
 jhuZIDrH4/LgeBpIAH1MOhCLIPMhNHUX0OnAReTO6ADUFufgAvkbwHq1FhPIMwAXMyz460hz
 k40SBuUAlk40EQJ5CuCj0lZi00UxgTB9KZ3axB7MKdjaoXOmdzCfwdmk604PzuSJYaI+bBNL
 mKOwOWfK6SGYvfDecLrT8yYTAhPvJlGCxw325M04dTFzED7svI4L77wNk+rzX2FPODZT5KwN
 mUUXOD7fAoTaJ2DeZDsmYA84b6qjBbwL9mVnEkIgCUCruYoWSCaAlivqV+nDcMK8ulFDtLHC
 H9bc2S/Ix6G1dIXelCHjCkeX3IQSrlDV8CMuyBKYmuIuuP2gxlT939rOX4fwG0Cq2XKaZss5
 mi3naP7fWwyICuDJxSgjQjllYCT3bYBSHqGMiQwN+Coqggcbv6DPYbI1gYL5vwKMABMBI4Ai
 XLpD4nusUuYuOS+PjeMUUTJFTDinNAIfESH1lFTkb4yYUPlF7huOi+YUr6eYSOydgBFiSXWE
 ZUFr7c01LGfaqjte7M2zei88eEcReGLOcms51Td1eXWm4KdeXv9+fnFJ3Nc/xPt4eUZZtt/O
 g2PQQJ3zm9jlH/eukjB+nPjW8cbx+3zLqceT/JpH4Sd/ZvMmfeKlaNlJx4GEzp0hwXYvn/WZ
 IynbAv13373stmALXv6oqyWxnOwYbow8+UtbEG3cI3sZpxPXH/J7o7mwoSuBBOTzWxHbu0YM
 rf3r24oaix4f/K7sjzM5u0Oe+YSc/aDf4LY+yzSk/H7YrS5Dbe38NF4ZoCH4Cl2wbS7V0O5Z
 plb9Js13zSrpD1r83Msedyj6y8XQtVEuNvYLzWr8y/unZQ6zlFCGyQP34Qql/F8F4KeXdAQA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0ybVRiAPd+tBa1+lCInzIWlExc3KRQoHnCSJVvc54VsmphsbrMr7AsQ
 abu1ZRleQp2MjDouK9d1FKgOKaPAaMdEEBjoBgiMFLBKQdG1Elwsm5CxKVCEggn/nrzned7k
 JC8X58+TIdw0hYZVKWTpQsqfGPD2/hK+5LFII7sHIfrRWY2hiiYLhZb1tzmoubyJRKV2PY48
 U+0kqhjOJtDYw/sUqqu/haHi0rMAWV0OEo24zBx0oyYbQ9929BNotK2CQrnWFoB+tayQ6Nxk
 A4bqhho4qKekA6DFR14SFc1OA1Tv/QGgR/n5JJq7skCg3rybGMpz52Oo8/xvGNL2m0nUZK3C
 kc1agiPjQCMHDS/3kqh2qJJCj6+5yD3bmXMjyxQz6rDjzOK/esBcrxvHmOxOJ4exmXcy1qu5
 FGOd03OY2Tt3OExf+SLBzHR/jTNdRguHmfq8F2NsV7KYop9rATNcbgIHn31PtFulzNCw21KV
 as2rwiNiFCUSxyFRVEycSBz98rH4KIkwImH3CTY97TSrikg4Lkr1Fl4AJ4sDz9gncoEWDNA6
 4MeFdAxsb52jdMCfy6drACydXKLWH56D/aVacp0D4ZJDtyF5ADQ1TfskihZDnUfn40D6ddhx
 04yvsYBOhGfzqsm1AKeNfvCLFYNP4tNS6Bh2+Lby6ATYXjzlCwg6DPaN6Yg1DqKTYI5lGaw7
 AbD/kts396MlcLy7wOfjdCystP2+waHws5bLGxwMne4qrBDwDZtyw6bEsCkxbEqqAXEVCNgM
 tTxFrhaL1DK5OkORIkpWyq1g9fpu3P7H1goq7/0t6gEYF/QAyMWFAt72PRYpn3dClvkhq1JK
 VRnprLoHSFb/cxEPCUpWrp6vQiMVx0ZKxDGxcZGSuNhoYTCvxbga0SkyDfsBy55kVf93GNcv
 RItpjr4W0TacaT/Q3FWUOX/YspWfc/FLavR+kHdv6wVQa7v2Vu3MwnjYZMHK+DttS5YtGkIf
 n1fxoD24zHk3ybHwdmNEuPn9xleGFKfcl0MdYccEgp+sn9w6c3Bqx4s18tBw7LH+3Y8O8Mfc
 dODpsInjLYnoiGluiytAsEPVV7Y3R2udHey0J34TX+KvMGif2L+U53ljkDhEsQV9L5z/o+HB
 p8Fbgx+mPO1Qf9/8UuclZdpk0UhWzq7rTxZPH733XepTHUmHF6pMmpkxRBcPvem4uwj/zLJ1
 saZdftHJDc/8FTDP+9g7Mfp8ZWHoNlPbvn1FESX+s4dcxvavpirE9WWnJCrWKSTUqTLxTlyl
 lv0HmCntXQYEAAA=
X-CMS-MailID: 20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df
X-Msg-Generator: CA
X-RootMTR: 20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df
References: <20201103092712.714480842@linutronix.de>
 <20201103095857.582196476@linutronix.de>
 <CGME20201112081036eucas1p14e135a370d3bccab311727fd2e89f4df@eucas1p1.samsung.com>
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
Cc: linux-aio@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>, sparclinux@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Mel Gorman <mgorman@suse.de>, Dave Airlie <airlied@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian Koenig <christian.koenig@amd.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gMDMuMTEuMjAyMCAxMDoyNywgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+
IE5vIHJlYXNvbiBoYXZpbmcgdGhlIHNhbWUgY29kZSBpbiBldmVyeSBhcmNoaXRlY3R1cmUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBD
YzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4gQ2M6IEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwoKVGhpcyBwYXRjaCBsYW5kZWQgaW4gbGludXgtbmV4dCAyMDIwMTEwOSBhcyBjb21taXQg
MmExNWJhODJmYTZjICgiQVJNOiAKaGlnaG1lbTogU3dpdGNoIHRvIGdlbmVyaWMga21hcCBhdG9t
aWMiKS4gSG93ZXZlciBpdCBjYXVzZXMgYSBmb2xsb3dpbmcgCndhcm5pbmcgb24gbXkgdGVzdCBi
b2FyZHMgKFNhbXN1bmcgRXh5bm9zIFNvQyBiYXNlZCk6CgpSdW4gL3NiaW4vaW5pdCBhcyBpbml0
IHByb2Nlc3MKSU5JVDogdmVyc2lvbiAyLjg4IGJvb3RpbmcKLS0tLS0tLS0tLS0tWyBjdXQgaGVy
ZSBdLS0tLS0tLS0tLS0tCldBUk5JTkc6IENQVTogMyBQSUQ6IDEyMCBhdCBtbS9oaWdobWVtLmM6
NTAyIAprdW5tYXBfbG9jYWxfaW5kZXhlZCsweDE5NC8weDFkMApNb2R1bGVzIGxpbmtlZCBpbjoK
Q1BVOiAzIFBJRDogMTIwIENvbW06IGluaXQgTm90IHRhaW50ZWQgNS4xMC4wLXJjMi0wMDAxMC1n
MmExNWJhODJmYTZjICMxOTI0CkhhcmR3YXJlIG5hbWU6IFNhbXN1bmcgRXh5bm9zIChGbGF0dGVu
ZWQgRGV2aWNlIFRyZWUpCls8YzAxMTE1MTQ+XSAodW53aW5kX2JhY2t0cmFjZSkgZnJvbSBbPGMw
MTBjZWI4Pl0gKHNob3dfc3RhY2srMHgxMC8weDE0KQpbPGMwMTBjZWI4Pl0gKHNob3dfc3RhY2sp
IGZyb20gWzxjMGIxYjQwOD5dIChkdW1wX3N0YWNrKzB4YjQvMHhkNCkKWzxjMGIxYjQwOD5dIChk
dW1wX3N0YWNrKSBmcm9tIFs8YzAxMjY5ODg+XSAoX193YXJuKzB4OTgvMHgxMDQpCls8YzAxMjY5
ODg+XSAoX193YXJuKSBmcm9tIFs8YzAxMjZhYTQ+XSAod2Fybl9zbG93cGF0aF9mbXQrMHhiMC8w
eGI4KQpbPGMwMTI2YWE0Pl0gKHdhcm5fc2xvd3BhdGhfZm10KSBmcm9tIFs8YzAyOGUyMmM+XSAK
KGt1bm1hcF9sb2NhbF9pbmRleGVkKzB4MTk0LzB4MWQwKQpbPGMwMjhlMjJjPl0gKGt1bm1hcF9s
b2NhbF9pbmRleGVkKSBmcm9tIFs8YzAyZDM3ZjQ+XSAKKHJlbW92ZV9hcmdfemVybysweGEwLzB4
MTU4KQpbPGMwMmQzN2Y0Pl0gKHJlbW92ZV9hcmdfemVybykgZnJvbSBbPGMwMzRjZmM4Pl0gKGxv
YWRfc2NyaXB0KzB4MjUwLzB4MzE4KQpbPGMwMzRjZmM4Pl0gKGxvYWRfc2NyaXB0KSBmcm9tIFs8
YzAyZDJmN2M+XSAoYnBybV9leGVjdmUrMHgzZDAvMHg5MzApCls8YzAyZDJmN2M+XSAoYnBybV9l
eGVjdmUpIGZyb20gWzxjMDJkM2RjOD5dIAooZG9fZXhlY3ZlYXRfY29tbW9uKzB4MTc0LzB4MTg0
KQpbPGMwMmQzZGM4Pl0gKGRvX2V4ZWN2ZWF0X2NvbW1vbikgZnJvbSBbPGMwMmQ0Y2VjPl0gKHN5
c19leGVjdmUrMHgzMC8weDM4KQpbPGMwMmQ0Y2VjPl0gKHN5c19leGVjdmUpIGZyb20gWzxjMDEw
MDA2MD5dIChyZXRfZmFzdF9zeXNjYWxsKzB4MC8weDI4KQpFeGNlcHRpb24gc3RhY2soMHhjNDU2
MWZhOCB0byAweGM0NTYxZmYwKQoxZmEwOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBiNmYyYmFiOCBiZWY3ZGFjNCBiZWY3ZGFjNCBiZWY3ZDhmYyAwMDRiOWI1OCAKYmVmN2Rh
YzgKMWZjMDogYjZmMmJhYjggYmVmN2RhYzQgYmVmN2Q4ZmMgMDAwMDAwMGIgMDA0YjgwMDAgMDA0
YmFjNDQgYmVmN2RhM2MgCmJlZjdkOGRjCjFmZTA6IDAwMDAwMDJmIGJlZjdkODljIGI2ZDZkYzc0
IGI2ZDZkNjVjCmlycSBldmVudCBzdGFtcDogMTI4MwpoYXJkaXJxcyBsYXN0wqAgZW5hYmxlZCBh
dCAoMTI5Myk6IFs8YzAxOWY1NjQ+XSBjb25zb2xlX3VubG9jaysweDQzMC8weDZiMApoYXJkaXJx
cyBsYXN0IGRpc2FibGVkIGF0ICgxMzAyKTogWzxjMDE5ZjU1Yz5dIGNvbnNvbGVfdW5sb2NrKzB4
NDI4LzB4NmIwCnNvZnRpcnFzIGxhc3TCoCBlbmFibGVkIGF0ICgxMjgyKTogWzxjMDEwMTc2OD5d
IF9fZG9fc29mdGlycSsweDUyOC8weDY3NApzb2Z0aXJxcyBsYXN0IGRpc2FibGVkIGF0ICgxMjY5
KTogWzxjMDEyZmVkND5dIGlycV9leGl0KzB4MWRjLzB4MWU4Ci0tLVsgZW5kIHRyYWNlIDZmMzJh
MmZiNDI5NDY1NWYgXS0tLQoKSSBjYW4gZG8gbW9yZSB0ZXN0cyB0byBoZWxwIGZpeGluZyB0aGlz
IGlzc3VlLiBKdXN0IGxldCBtZSBrbm93IHdoYXQgdG8gZG8uCgouLi4KCkJlc3QgcmVnYXJkcwoK
LS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
