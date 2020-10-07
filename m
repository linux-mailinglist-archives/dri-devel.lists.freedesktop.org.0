Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE45D285F3D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 14:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E630E6E8D3;
	Wed,  7 Oct 2020 12:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123C46E8D3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 12:34:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201007123359euoutp02fb2b827b19416c8f524592723ba6dd07~7tdm9zNNY0130301303euoutp02i
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 12:33:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201007123359euoutp02fb2b827b19416c8f524592723ba6dd07~7tdm9zNNY0130301303euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1602074039;
 bh=UQMeR1GODVbXHmFZuWuyZokR6qZOsBzExFrdhaS6Ndk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=T9nD/JuYrx9okPTJAMKaWvaZB/yFrwCfHkN/O23nVR8liwHOVrWkJjyMCLe4sWR8O
 CkFRF7fvXqBNzoDkN+Fn9UvvcsawIJmlpsv+gY8qIpC78qRtRp68ENzC4CstywZ9xF
 p5rqs9ClxKTpomUen3/SoC8rECZ5xHL0xzKypymQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201007123358eucas1p2ae3f4000275eaece3b933ed61916259e~7tdmZ11Am1306413064eucas1p2m;
 Wed,  7 Oct 2020 12:33:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 72.C4.06318.6B5BD7F5; Wed,  7
 Oct 2020 13:33:58 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201007123358eucas1p1eccb32143b09c921ae0a4f883164d17d~7tdl92x782127021270eucas1p1B;
 Wed,  7 Oct 2020 12:33:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201007123358eusmtrp20e8118fbff683fe861d5416df68b7bd0~7tdl8v6W12794027940eusmtrp2k;
 Wed,  7 Oct 2020 12:33:58 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-67-5f7db5b6c34b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 2D.22.06017.6B5BD7F5; Wed,  7
 Oct 2020 13:33:58 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201007123357eusmtip184b103ae04fa10810689f0e7a6bb7ac6~7tdk3fHzt2301623016eusmtip1T;
 Wed,  7 Oct 2020 12:33:56 +0000 (GMT)
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com>
Date: Wed, 7 Oct 2020 14:33:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUzMcRz2vd9rty7fDuuzGHNTI5Twxxdp3saPzZY/bNjI0W8V3ZU7ReYl
 RXEKC+uc0ivR6uJ0pUYjdKi4JOSltGJlruiwiZWun+i/5/N5nuf7PJ/ty1PKfNabj9TuFnVa
 dZSKldPltT+fzi63Hgid8yt3KsksLWZJxjk7Irnt7yhSWG+myPPvvSxJbztNkwsZSTJy3vgQ
 DaEuGbn+IY8jXa2NNGlI/MwRS8cLhjRVZbIk9ZqVIa3FgwwxPq2WEXvXG4acdfzkiPFMN0uc
 RwfYJROECwmNtHD7Rw4tVJrecUL+rW6ZYOlL54SHxl+00HbCJhNuFBwS0pJ6WKGjv5sVequb
 WeFkWRES6nPuc4LTMlmwOt/QIWM3yYPCxKjIOFEXELxVHvEgrxTF3HLf+6AlmUlAKXIDcuMB
 z4eU1JPIgOS8El9BcM/ioFyEEn9D0NYcLxFOBG/7r7Ejjtb2r4xEFCIoKEhmpaEXwcUvVs6l
 GocJ5GYny1x4PPaDY4NHaJeIwi0sPM9tHc5gcSAYHIbhZxU4GFIaK4fNNJ4GJqfUYwLeBnX2
 RE7SeMKj8520C7vhddBSZmNcmMJToMKRSUnYC153ZstcYYDf85B5qhBJvVdAVlENJeFx8MlW
 xkl4EgxWjhiSELQ/KeGkIRVBU6Lxr3sRvH3SP1SVH4qYAaVVAdJ6KVw63sO41oA94JXDUyrh
 AenlGZS0VsCxZKWk9gWTzfwv9q79GXUaqUyjTjONOsc06hzT/9wcRBchLzFWrwkX9fO04h5/
 vVqjj9WG+2+P1ljQ0NetG7B9v4mqf2+rQZhHKnfFhl37Q5WMOk4fr6lBwFOq8YplDXVblIow
 dfw+URcdqouNEvU1aCJPq7wU8/K6NytxuHq3uFMUY0TdCCvj3bwTUEvf1vnxl/tNZuXMoE7z
 x45dj1amVZQ0RHSsvH2wOXD1qmB3O6VZ89IncX3T3DLvoGjNywVTsf8d3ynLPSDycGfWwB1W
 u2ojQ4+Z7pa22MCtrlp63KYeXLvQ2hfi3OkT0hNXXx1au+hq1uP6gB0R+5vnZB9cOyvGt6d2
 cVig2V6holW0PkId6Efp9Oo/bu17QLYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0zMYRzH93x/Xq3j6xSPZrJb2Npc7pJ7Is3MeNZimjGLnFPfdU3X5b53
 rQxFyC5Z0Y/raqRY1lL0iyxNiQpFpSx2tfRDmatxtCWi69j677W936/n83m2j4iU1NCeouhY
 A6+PVcdIGVfq5WyLdX1tzWnVhtE8ChVUlDEoN/sNQDcHrSQqeVVOorc/Jhl0dSCDQvm5KQTK
 M7eCORoj0P2RIhaN9XdSqP3cFxZVDvXSqPtRAYMu36uhUX/ZHxqZXzcQ6M3YBxpl2aZZZL42
 ziD7hVlmmwfOT+6k8OOpQgrXWawsLq4fJ3Dlt6ssbjXPUHggrYXAVbeScHrKBIOHfo4zeLKh
 h8FXqksBflXYzGJ75SpcY/9A7V0cJgvU64wGfrVGJxi2Sg/JkUImD0AyxcYAmdxPGb5Z4S/1
 DQqM5GOi43m9b9BRmeZZUQWIq3dLeNZ3kU4Gqa4m4CKC3EbYP/iVNgFXkYS7DaDFaiecwUrY
 lpNMO3kp/NVrYpwlG4Avpp9SjmAph+DNGxfnBXfOB176c55ylEjOysCBzOL5QMJdo+C7Eexg
 hpNDk83xkotIzAXB1M461sEU5w0tdhvpYA/uGEzryiKcnSWwLW94fpgLFwr7qlvmNyK5TfB6
 1SDpZC/4wFbwj5fD98M3iAwgsSzQLQsUywLFskApBFQpcOeNgjZKKyhkglorGGOjZBE6bSWY
 O5na59PVD4FpYl8T4ERA6iY+eOKUSkKr44VEbROAIlLqLt7e/vKIRBypTjzJ63UqvTGGF5qA
 /9znMklPjwjd3AHGGlRyf7kSBciVfkq/TUi6XHyJazws4aLUBv44z8fx+v8eIXLxTAYRwd8P
 1H+eXWYryZnR7CgIfhJCTqWH729LHDrzyWtP+miUuaksx12pqJioKon7mL1TnRHR09iVxG73
 uFxYxlZL1w4ZX2xpLjffTZts9o4M8xfwrt7u4pC+Fao7qYHh3m/XZf3WJvidXdOxef2Oji91
 Iz27VcbdraHjYYNB0bZFxaFSStCo5T6kXlD/BZ+7bo9IAwAA
X-CMS-MailID: 20201007123358eucas1p1eccb32143b09c921ae0a4f883164d17d
X-Msg-Generator: CA
X-RootMTR: 20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
 <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, Linux MM <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:DMA BUFFER
 SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 07.10.2020 14:01, Daniel Vetter wrote:
> On Wed, Oct 7, 2020 at 12:47 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 03.10.2020 11:40, Daniel Vetter wrote:
>>>> After he three places above should use pin_user_pages_fast(), then
>>>> this whole broken API should be moved into videobuf2-memops.c and a
>>>> big fat "THIS DOESN'T WORK" stuck on it.
>>>>
>>>> videobuf2 should probably use P2P DMA buf for this instead.
>>> Yup this should be done with dma_buf instead, and v4l has that.
>> Yes, V4L2 has dma_buf support NOW. That days, using so called V4L2
>> USERPTR method was the only way to achieve zero copy buffer sharing
>> between devices, so this is just a historical baggage. I've been
>> actively involved in implementing that. I've tried to make it secure as
>> much as possible assuming the limitation of that approach. With a few
>> assumptions it works fine. Buffers are refcounted both by the
>> vm_ops->open or by incrementing the refcount of the vm->file. This
>> basically works with any sane driver, which doesn't free the mmaped
>> buffer until the file is released. This is true for V4L2 and FBdev devices.
> I'm not seeing any of that vm->file refcounting going on, so not
> seeing anything that prevents the mmap area from being removed. Can
> you pls give me some pointers about which code you're thinking of?

Well, it was in vb2_get_vma() function, but now I see that it has been 
lost in fb639eb39154 and 6690c8c78c74 some time ago...

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
