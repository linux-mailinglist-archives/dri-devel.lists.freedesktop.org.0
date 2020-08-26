Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D2D25340E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 17:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFF06E196;
	Wed, 26 Aug 2020 15:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1B36E187
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 15:54:54 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826155453euoutp02c216f4ffc95e8b717aef5a3bdbba5d74~u3HBn3PD90127001270euoutp02O
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 15:54:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200826155453euoutp02c216f4ffc95e8b717aef5a3bdbba5d74~u3HBn3PD90127001270euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598457293;
 bh=Abx7SNbkm5WCfgqPQdRMj1TlzL0zaSm3FUmANkKzt30=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=bOcke5gbcpnfY6PcXwZvpNapbCjkK161oLV1Ve9L5Xw9sCAer/UUfEXichVb3nOUb
 fAwTbD5jen20s96rngyENDMa3cW3KPjt+YqRFtRdggssQ2Qi9ktZ5ldTLhjH7JajH5
 9WXz0BMSyCbdeV5/bAfsgK4yZpNIUq+lu9J1gzlI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200826155452eucas1p10b4a042d9ada0b4954cb4a61a048fbd4~u3HBXa2Kq1505315053eucas1p1R;
 Wed, 26 Aug 2020 15:54:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 12.AB.05997.CC5864F5; Wed, 26
 Aug 2020 16:54:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826155452eucas1p286d636a8d171546bfb4b8af9f1128ffc~u3HA-47iK2203322033eucas1p2A;
 Wed, 26 Aug 2020 15:54:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200826155452eusmtrp1cf9147b0e546c2a0076089274692b771~u3HA8FQe72045520455eusmtrp1d;
 Wed, 26 Aug 2020 15:54:52 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-62-5f4685cc22ca
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9C.C8.06017.CC5864F5; Wed, 26
 Aug 2020 16:54:52 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200826155451eusmtip1b156dc158321cf1d7c7c231e868dc823~u3HAQP0tE2185021850eusmtip1i;
 Wed, 26 Aug 2020 15:54:51 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: tc358767: fix EDID memory leak
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <883f880d-22c6-1257-d8fc-566935387f51@samsung.com>
Date: Wed, 26 Aug 2020 17:54:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826134017.437486-1-tomi.valkeinen@ti.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djPc7pnWt3iDbb061pc+fqezeLq95fM
 FiffXGWx6Jy4hN3iUF+0xfr5t9gc2Dze32hl95jdMZPV48SES0we97uPM3kc6J3M4nH8xnam
 ALYoLpuU1JzMstQifbsErowr/z+zFfxnqjh04z9jA+N2pi5GTg4JAROJ2XsusHQxcnEICaxg
 lGicsZkVwvnCKHFqy2ZGCOczo8S1PbvYuxg5wFrOr7OFiC9nlHgyuQGq/T2jxMlPy9lB5goL
 2Ets2f2NCSQhIvCHUWL9qrvMIAk2AU2Jv5tvsoHYvAJ2Eg+vXWQBsVkEVCV62xoZQWxRgTiJ
 rcevMkHUCEqcnPkErIZTwEZi5qImMJtZQF5i+9s5zBC2uETTl5Vgd0sIrGKXWLC5nw3iOxeJ
 Ja/vQtnCEq+Ob2GHsGUkTk/uYYGw6yXur2hhhmjuYJTYumEnM0TCWuLOuV9sID8zA129fpc+
 RNhRon1uMzMkKPgkbrwVhLiBT2LStulQYV6JjjYhiGpFiftnt0INFJdYeuEr1DUeEgdbj7BM
 YFScheTLWUg+m4Xks1kINyxgZFnFKJ5aWpybnlpslJdarlecmFtcmpeul5yfu4kRmIRO/zv+
 ZQfjrj9JhxgFOBiVeHg14t3ihVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI
 UZqDRUmc13jRy1ghgfTEktTs1NSC1CKYLBMHp1QDY2P9nZ+XIry8Y/+uDzha8pW3dP977kPt
 OiX7z9uvPKa6ZH3KheBp/XNlXDkletR/vhVUv1F6vnPt7jKpl7O1Jq1s4pnzO3W/cdzcXGfH
 OK0dt68t+3rBRbT93hJmzcrF6cfZFFvbwrdE91o5/pjulNJivrUv3S/Mc1Z3aePu95I5oiGh
 J+atV2Ipzkg01GIuKk4EAH3r6to+AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xu7pnWt3iDbreCVpc+fqezeLq95fM
 FiffXGWx6Jy4hN3iUF+0xfr5t9gc2Dze32hl95jdMZPV48SES0we97uPM3kc6J3M4nH8xnam
 ALYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYwr
 /z+zFfxnqjh04z9jA+N2pi5GDg4JAROJ8+tsuxi5OIQEljJKdHx/ytjFyAkUF5fYPf8tM4Qt
 LPHnWhcbRNFbRolXnRfBEsIC9hJbdn9jAkmICPxjlJjQOZUFoqqfUWLK3CtsIFVsApoSfzff
 BLN5BewkHl67yAJiswioSvS2NYKtExWIk3jc+58ZokZQ4uTMJ2A1nAI2EjMXNYHZzAJmEvM2
 P2SGsOUltr+dA2WLSzR9Wck6gVFwFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLS
 vHS95PzcTYzA+Np27OeWHYxd74IPMQpwMCrx8GrEu8ULsSaWFVfmHmKU4GBWEuF1Ons6Tog3
 JbGyKrUoP76oNCe1+BCjKdBzE5mlRJPzgbGfVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2x
 JDU7NbUgtQimj4mDU6qBcee2Y/rPlrUvefD8rdidJ5HnXqw9NGXdlfiwB3xWix9k5G132nsr
 /6XB/HMzn1UL8LKqLhNn1tgeG31jnZ6sc+fsOcwT1HQYOKI+s6hla0Uv/Mkx0fLh6SX7pnA8
 2/ViwsKv1wWrr0/W38X14fbMg0KORU/y3gruVv2rNMVynvC09K2ljqFhzy8osRRnJBpqMRcV
 JwIAZTygJ8UCAAA=
X-CMS-MailID: 20200826155452eucas1p286d636a8d171546bfb4b8af9f1128ffc
X-Msg-Generator: CA
X-RootMTR: 20200826134049eucas1p2de71d51b6d2fa7bcd1c29951553f5e7a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826134049eucas1p2de71d51b6d2fa7bcd1c29951553f5e7a
References: <CGME20200826134049eucas1p2de71d51b6d2fa7bcd1c29951553f5e7a@eucas1p2.samsung.com>
 <20200826134017.437486-1-tomi.valkeinen@ti.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26.08.2020 15:40, Tomi Valkeinen wrote:
> The current EDID allocated with drm_get_edid() is freed when the driver
> gets a new EDID, but it is not freed when the driver is removed, causing
> a leak.
>
> Free the EDID (if any) on driver remove.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
