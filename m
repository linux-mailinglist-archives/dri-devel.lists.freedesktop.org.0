Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F913C246
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 14:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929DA6E9D1;
	Wed, 15 Jan 2020 13:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779D56E9D1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 13:09:40 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115130938euoutp02bc524b88ece49f27f918263f5d80b4be~qEWzVY1ov1608816088euoutp02X
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 13:09:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200115130938euoutp02bc524b88ece49f27f918263f5d80b4be~qEWzVY1ov1608816088euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579093778;
 bh=ueSGlkXTpFk7VXNWLhrgWBJ0hToomm/X8o6QoUdinb8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=F2ewjwg9r/omc4RxFTFZ6/9ejp2YYMbOj2iI3m+gE4P1AEDxG8cqnETqo5AO5yVMK
 bPVz+c397OJj0OLUMEju34BFESLBbMe86MHbL0xYrWdh4Qg3jfstwJTudVp2xlc3Gg
 v3ctWe30hzg3E8B81666+xh/uI2TwZuBpf282Vvs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200115130938eucas1p209b4204b639c05afc3880b4aa4ed47f1~qEWzACZoT1216012160eucas1p2t;
 Wed, 15 Jan 2020 13:09:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 5B.5F.61286.11F0F1E5; Wed, 15
 Jan 2020 13:09:38 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200115130937eucas1p2674b7613bb50697556ab3068985b8776~qEWynydpI1216512165eucas1p2r;
 Wed, 15 Jan 2020 13:09:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200115130937eusmtrp261b214e7212697676c420e59c0951e30~qEWym_ss00896208962eusmtrp2B;
 Wed, 15 Jan 2020 13:09:37 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-c9-5e1f0f112373
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2E.FB.08375.11F0F1E5; Wed, 15
 Jan 2020 13:09:37 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200115130936eusmtip13802b1dead4248941f960f209aad27df~qEWxmaNxD2707427074eusmtip15;
 Wed, 15 Jan 2020 13:09:36 +0000 (GMT)
Subject: Re: [PATCH] fbdev: potential information leak in do_fb_ioctl()
To: Arnd Bergmann <arnd@arndb.de>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <6ed59903-afe7-d5b2-73eb-ca626616dd6f@samsung.com>
Date: Wed, 15 Jan 2020 14:09:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2uLm9pJtx42qDXJSdD71-dVW6+iDcRAnEB85Ajak-HLw@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxNYRz2ds4993Tr1tu90m+F5o4mS7TMXqJly5zNbGqG2cSJs0L31u4t
 ZLZC9LUlUbgZfVglSW7qiqXuzUpqEZI1H1nJ1+6SihVdOp2a/nn3/J7f8+z3PNvLUqoMxpM9
 oIsX9Do+RsMo6NrmsY7lKlfviJUnQshETrOcfLNfpEnhh7cUeTk6yJC/tSlykv++jyYlvW2I
 tGdqSU2PFxnoaaXI46zvMvLi/hWGFA7V0KTeeg2Rq03dDCkbq0GkayINhbhxv8dzEJfXmC/n
 8pM7aa7+ZwHN1RnfyjlTeTrDXW0N4+rvHuTeZ7Y4cEMfe2hupPwVxV3P62K4wYeTz7BpIXfB
 mkpvdd2lWLdfiDlwWNCvCN6riK5saURxv+YdHT/dJk9GJnUGcmQBr4Jbg9l0BlKwKlyGIHPM
 KJOGEQSWkWwkDcMIat5lOcxYhm9kyUWswqUIJhr8JJENwWiFmREXarwJsopKkIjn4kWQ+3mA
 EkUUviyDJ386ZeKCwWvhXGr5lEiJg6EpfWCSZ1kaLwHzp1CRdsc74Udvk0ySuEHr5X5axI44
 DJoKTk0ForAH9PRfm8beYLZdmboF+BELud2jSEodCu1nC6exGr623JVLeD78rRPNoqFysk3a
 52m3GUHpeTsjqYLgTcc4I6ajsC/cvr9CojdA8b1sSqQBu8Brm5sUwgVyai9O00pIO6OS1D5Q
 VVLFzJzNqLtBZSONcVY146w6xll1jP/vFiC6HHkICQZtlGAI0AlH/A281pCgi/LfF6s1ockf
 2mZv+XEPjT6PtCLMIo2zMvrPwgiVjD9sSNRaEbCUZq6y9dKCCJVyP594TNDH7tEnxAgGK/Ji
 aY2HMrDoy24VjuLjhUOCECfoZ7YOrKNnMsoz1buvflW3LcnT/9cW35DApNpzFb1O/SfJ7h2D
 pZrcbteA3NA+32fBPkETfavHXfRRZy3e25dWNK957fTzqV+4cyXv5EX3fhA2V0c6Hms4rq6K
 fz4nbucieyBvu2NuuNkcyQnXu8YSFZ3hzhZbiu5FmaX643r7A0tBsTpyy+KNGzS0IZoPWEbp
 Dfw/bb/g+J0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsVy+t/xu7qC/PJxBlN6FC3+TjrGbvH633QW
 i4UP7zJbXPn6ns3i/7YWdovZ9x+zWCx7cJrR4kx3rsXWW9IWz26dZLY40feB1eLyrjlsFgs/
 bmWx2HtoPqPFvMPX2SxW/NzKaHH1bwejg6DH71+TGD2mHZjN7jG74SKLx95vC1g8ds66y+6x
 aVUnm8e8k4Eee7dkedzvPs7k8fHpLRaPL6uuMXssmXaVzeP9PiDxeZOcx5RD7SwB/FF6NkX5
 pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GeuOH2As+C5W
 8av1NHsD4ybhLkZODgkBE4nPK/vYuxi5OIQEljJKvPt1hKWLkQMoISNxfH0ZRI2wxJ9rXWwQ
 Na8ZJe5+PcQGkhAWcJfoW7SMEcQWEVCUmPriGTNIEbPAbFaJplVrWSE6ljBJdP64CNbBJmAl
 MbF9FVgHr4CdxOHOZ6wg21gEVCW2P3cBCYsKREgc3jELqkRQ4uTMJywgNqdAoMThBc1MIDaz
 gLrEn3mXmCFscYlbT+ZDxeUltr+dwzyBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi3PTcYkO9
 4sTc4tK8dL3k/NxNjMCkse3Yz807GC9tDD7EKMDBqMTDm/FHLk6INbGsuDL3EKMEB7OSCO/J
 GbJxQrwpiZVVqUX58UWlOanFhxhNgX6byCwlmpwPTGh5JfGGpobmFpaG5sbmxmYWSuK8HQIH
 Y4QE0hNLUrNTUwtSi2D6mDg4pRoYVZLvPc9be8d2yT4O8aeMf6REc2xL6/ladU/UmJzdVb7+
 gd2BAJW5tcnTw7mW/Ah+sSXCOH7+rfpvsz4XXL3m1zhzb3f1DxfDtSfiMi+fXusYWNf8Tv5b
 3OcnOdbuwTEBC3sOL80Tvpz80ikk4gm/ka68cuwkvo2Na/2tbD6JV6/eOa/9HXO4EktxRqKh
 FnNRcSIA0JCo2jADAAA=
X-CMS-MailID: 20200115130937eucas1p2674b7613bb50697556ab3068985b8776
X-Msg-Generator: CA
X-RootMTR: 20191029190229epcas3p4e9b24bd8cde962681ef3dc4644ed2c2e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191029190229epcas3p4e9b24bd8cde962681ef3dc4644ed2c2e
References: <20191029182320.GA17569@mwanda>
 <CGME20191029190229epcas3p4e9b24bd8cde962681ef3dc4644ed2c2e@epcas3p4.samsung.com>
 <87zhhjjryk.fsf@x220.int.ebiederm.org>
 <fd4e6f01-074b-def7-7ffb-9a9197930c31@samsung.com>
 <CAK8P3a2uLm9pJtx42qDXJSdD71-dVW6+iDcRAnEB85Ajak-HLw@mail.gmail.com>
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
 security@kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
 Kees Cook <keescook@chromium.org>, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Julia Lawall <Julia.Lawall@lip6.fr>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Joe Perches <joe@perches.com>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Andrea Righi <righi.andrea@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/13/20 1:49 PM, Arnd Bergmann wrote:
> On Fri, Jan 3, 2020 at 2:09 PM Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
>> On 10/29/19 8:02 PM, Eric W. Biederman wrote:
>>>
>>> The goal is to avoid memory that has values of the previous users of
>>> that memory region from leaking to userspace.  Which depending on who
>>> the previous user of that memory region is could tell userspace
>>> information about what the kernel is doing that it should not be allowed
>>> to find out.
>>>
>>> I tried to trace through where "info" and thus presumably "info->fix" is
>>> coming from and only made it as far as  register_framebuffer.  Given
>>
>> "info" (and thus "info->fix") comes from framebuffer_alloc() (which is
>> called by fbdev device drivers prior to registering "info" with
>> register_framebuffer()). framebuffer_alloc() does kzalloc() on "info".
>>
>> Therefore shouldn't memcpy() (as suggested by Jeo Perches) be enough?
> 
> Is it guaranteed that all drivers call framebuffer_alloc() rather than
> open-coding it somewhere?
> 
> Here is a list of all files that call register_framebuffer() without first
> calling framebuffer_alloc:
> 
> $ git grep -wl register_framebuffer | xargs grep -L framebuffer_alloc
> Documentation/fb/framebuffer.rst
> drivers/media/pci/ivtv/ivtvfb.c
> drivers/media/platform/vivid/vivid-osd.c
> drivers/video/fbdev/68328fb.c
> drivers/video/fbdev/acornfb.c
> drivers/video/fbdev/amba-clcd.c
> drivers/video/fbdev/atafb.c
> drivers/video/fbdev/au1100fb.c
> drivers/video/fbdev/controlfb.c
> drivers/video/fbdev/core/fbmem.c
> drivers/video/fbdev/cyber2000fb.c
> drivers/video/fbdev/fsl-diu-fb.c
> drivers/video/fbdev/g364fb.c
> drivers/video/fbdev/goldfishfb.c
> drivers/video/fbdev/hpfb.c
> drivers/video/fbdev/macfb.c
> drivers/video/fbdev/matrox/matroxfb_base.c
> drivers/video/fbdev/matrox/matroxfb_crtc2.c
> drivers/video/fbdev/maxinefb.c
> drivers/video/fbdev/ocfb.c
> drivers/video/fbdev/pxafb.c
> drivers/video/fbdev/sa1100fb.c
> drivers/video/fbdev/stifb.c
> drivers/video/fbdev/valkyriefb.c
> drivers/video/fbdev/vermilion/vermilion.c
> drivers/video/fbdev/vt8500lcdfb.c
> drivers/video/fbdev/wm8505fb.c
> drivers/video/fbdev/xilinxfb.c
> 
> It's possible (even likely, the ones I looked at are fine) that they
> all correctly
> zero out the fb_info structure first, but it seems hard to guarantee, so
> Eric's suggestion would possibly still be the safer choice.

I've audited all above instances and they are all fine. They either
use the fb_info structure embedded in a driver specific structure
(which is zeroed out) or (in case of some m68k specific drivers) use
a static fb_info instance.

Since fbdev is closed for new drivers it should be now fine to use
the simpler approach (just use memcpy()).
 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
