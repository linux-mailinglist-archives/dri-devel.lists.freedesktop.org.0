Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2AC14311F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A345A6EAB5;
	Mon, 20 Jan 2020 17:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323106EAB5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 17:54:34 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200120175433euoutp029c2b13dd49eface3167e08c2233f1879~rqd-klDfN2804728047euoutp02P
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 17:54:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200120175433euoutp029c2b13dd49eface3167e08c2233f1879~rqd-klDfN2804728047euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579542873;
 bh=s14Tjymw/v9Byd80J79G1eYHiWpomQTUFQYZl/ghrNk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=jFImkGIdKrkZ+ECWkpMse/KUDd0JA7+Tl/wz6PVqZu9aZA30vv5aPBvtg17LoGW0C
 Iuw0/izwieSup9D7g1y3IzhO0UESr3QyHZm61xhG9bJ+EIOeuFEnuvwTpswt8sA/HY
 Sd8Vl1BNHz52xqeZCFoo/XG/KGm5PutadTsh6FqY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200120175432eucas1p107f9c642b59c542a1cd6f8c735db1e07~rqd_-olrA1568115681eucas1p1k;
 Mon, 20 Jan 2020 17:54:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EA.F6.60679.859E52E5; Mon, 20
 Jan 2020 17:54:32 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200120175432eucas1p2609e38ccdda10cb0ba91392207b12f99~rqd_XwLd10980509805eucas1p2U;
 Mon, 20 Jan 2020 17:54:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200120175432eusmtrp176216afc29f4bb8af192b144ca752959~rqd_XNPWa3187631876eusmtrp1q;
 Mon, 20 Jan 2020 17:54:32 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-53-5e25e9582c2a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A3.89.08375.759E52E5; Mon, 20
 Jan 2020 17:54:31 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200120175431eusmtip173cf6a03147fbb7524c5bb429f75ed58~rqd9jCQVB2386023860eusmtip1M;
 Mon, 20 Jan 2020 17:54:31 +0000 (GMT)
Subject: Re: [PATCH] fbdev: wait for references go away
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Message-ID: <a8031679-4fcf-830d-dcf5-80654f2fbc97@samsung.com>
Date: Mon, 20 Jan 2020 18:54:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d143e43b-8a38-940e-3ae5-e7b830a74bb3@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2zk7OxtNPqe2NzWDgZWSmpY4StYFEX/6U4SsUzuo6bxsalp/
 1MjLvFUq2lAzjUyNEkk3LaQWZSYa5SUxsQsqXpvpBBe2cvuQ/Pc8z/u8V16WktUJPdnElAxe
 m8IlKxgJ3f3WNhwQs+Abd2zyuZ9ydMPCKOcmByjlu/JVoXKkt45Rruf10meEUWV906KoryX9
 gihL3xgTtd7pE03HSsLVfHJiFq8NUl2UJCxbaum0IUF2cadNlItqBHrEsoBPwGN9rB5JWBl+
 hGChp1BEiBVBrWmaImQdgaXVtJ0hdmZMd5oRCbQgsNbnCQlZQWAcb0MOlxsOgx+ri5QDM/gk
 3C4kujuOhJHadtqRQOFSBEuv6pwmKVZBQ2uJswWNfaHr5yjjwB44Bta+vRYSjysM3J2hHViM
 T4Phw2dnUQrLYXLmnoDgg2BcITUBN4mgun0fwRFQbJ9FBLvBYv8zEcHeMFhZ6hwI8BMEf4rm
 KUKMCFoq7QxxnYKp4d+M42QU9oOnvUFEPgvW/AcickkXmFhxJTO4wJ3uGorIUigqkBH3Ieh4
 2MHstNX3tFK3kMKwazPDrm0Mu7Yx/O/biOg2JOczdZp4XheSwl8N1HEaXWZKfODlVE0n2v6Z
 QXu/1YR6ty6ZEWaRYq90vtI3TibksnQ5GjMCllK4SxvztyWpmsu5xmtTL2gzk3mdGXmxtEIu
 Pd60cF6G47kMPonn03jtTlTAij1zkfivks+enQrbU7FpVyurmGjOeyv5cMDH3PJf3yeyjEd8
 QlXWybHNblN7SM+n8JupbkNlLzOXNFsHMuJnlqvO3VBZQxS25qb9aw1ezQWr7mIP+cb9L0fd
 r5dUR4ynRdg6NkIr8HvxUP2VyDkq2JCQnkS1rKUHFft3cdlv1NbmFwpal8AF+1NaHfcPGtSi
 uy8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7rhL1XjDH7fsbG48vU9m8WzWyeZ
 LU70fWC1uLxrDpvF58ZdLA6sHr377rF73O8+zuTxft9VNo/Pm+QCWKL0bIryS0tSFTLyi0ts
 laINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mt68n8FScJaponPTT/YGxulM
 XYycHBICJhL3Nh1i7GLk4hASWMoocap7ClCCAyghI3F8fRlEjbDEn2tdbBA1rxkl7txbxAqS
 EBYwl3j04RUziM0mYCUxsX0VI4gtIuAmcXnGahaQBmaBPkaJG3v2s0N072eU+DPvAthqXgE7
 iXkru8FsFgFVia3vrrCB2KICERKHd8xihKgRlDg58wkLiM0pYC8x6/x1sDizgDrQnEvMELa4
 xK0n85kgbHmJ7W/nME9gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85
 P3cTIzCyth37uXkH46WNwYcYBTgYlXh4HaapxgmxJpYVV+YeYpTgYFYS4V3QBBTiTUmsrEot
 yo8vKs1JLT7EaAr03ERmKdHkfGDU55XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0t
 SC2C6WPi4JRqYHR496pV23Xy2mypbf52Gcvky5dL3Wr0u5M+Ne5fpHsI7/YeJ8dNkh/k9+bs
 iLlZd2X+/lIfmQ7Ph7Ms16hknHFd+EpzSV/Qsf2pNrcL/rw79XyJTlny1YbQWtutT+bPOrYo
 dtpDpojHl1qqxTIP2pyPMn664thqA/cpD5ffn7Lgc6bdr8OifVVKLMUZiYZazEXFiQAyUnU6
 wgIAAA==
X-CMS-MailID: 20200120175432eucas1p2609e38ccdda10cb0ba91392207b12f99
X-Msg-Generator: CA
X-RootMTR: 20200120100025eucas1p21f5e2da0fd7c1fcb33cb47a97e9e645c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200120100025eucas1p21f5e2da0fd7c1fcb33cb47a97e9e645c
References: <CGME20200120100025eucas1p21f5e2da0fd7c1fcb33cb47a97e9e645c@eucas1p2.samsung.com>
 <20200120100014.23488-1-kraxel@redhat.com>
 <d143e43b-8a38-940e-3ae5-e7b830a74bb3@samsung.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 marmarek@invisiblethingslab.com, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/20/20 6:51 PM, Bartlomiej Zolnierkiewicz wrote:

> do_unregister_framebuffer() doesn't guarantee that fb_info is freed after
> function's return (it only drops the kernel reference on fb_info).
s/kernel/fbdev device driver/

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
