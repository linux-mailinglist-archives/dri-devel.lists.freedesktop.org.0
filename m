Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EC030FC1C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6640E6E103;
	Thu,  4 Feb 2021 19:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863AB6E103
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 19:00:39 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601c44570001>; Thu, 04 Feb 2021 11:00:39 -0800
Received: from MacBook-Pro-10.local (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb
 2021 19:00:32 +0000
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
To: Alex Deucher <alexdeucher@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <5e4ac17d-1654-9abc-9a14-bda223d62866@nvidia.com>
 <CADnq5_M2YuOv16E2DG6sCPtL=z5SDDrN+y7iwD_pHVc7Omyrmw@mail.gmail.com>
 <20210204182923.GL4247@nvidia.com>
 <CADnq5_N9QvgAKQMLeutA7oBo5W5XyttvNOMK_siOc6QL+H07jQ@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <8e731fce-95c1-4ace-d8bc-dc0df7432d22@nvidia.com>
Date: Thu, 4 Feb 2021 11:00:32 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_N9QvgAKQMLeutA7oBo5W5XyttvNOMK_siOc6QL+H07jQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612465239; bh=ZRwFgdcQ21FKYiVXb0EIKpbgQVH1pjcxmfD2qtvFKCs=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=O62cwUSgaxuiTPjW3XH95lJXxP99XYlZmxq0IbYI/q5iy+lytfttykWVIg4zh/p79
 YkpTFrnCNfdEc1GoIJB3TUshyMLqt7hPi6IOGykdN1wypmvoj8iCj1TgKFZxaTs9vF
 DOuntKqUcV+wJjItWIdWvIynHDtrcN5xfNtqc0wMi496zKEuaR0NCb6IhN25JPC9++
 lfCJjja90iS2hGwus5QNwCGw8isDOytKQsahv/rrnh7J6AP2dyjbyz923gycpufuX7
 NcPu1IzdGV196RtO1PKnCTXP54JelRD40hEM+HS7qMt5F70KxK3fmRsrPNpdjBCue0
 /dDRlSSEeqTHA==
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/21 10:44 AM, Alex Deucher wrote:
...
>>> The argument is that vram is a scarce resource, but I don't know if
>>> that is really the case these days.  At this point, we often have as
>>> much vram as system ram if not more.
>>
>> I thought the main argument was that GPU memory could move at any time
>> between the GPU and CPU and the DMA buf would always track its current
>> location?
> 
> I think the reason for that is that VRAM is scarce so we have to be
> able to move it around.  We don't enforce the same limitations for
> buffers in system memory.  We could just support pinning dma-bufs in
> vram like we do with system ram.  Maybe with some conditions, e.g.,
> p2p is possible, and the device has a large BAR so you aren't tying up
> the BAR window.
> 

Excellent. And yes, we are already building systems in which VRAM is
definitely not scarce, but on the other hand, those newer systems can
also handle GPU (and NIC) page faults, so not really an issue. For that,
we just need to enhance HMM so that it does peer to peer.

We also have some older hardware with large BAR1 apertures, specifically
for this sort of thing.

And again, for slightly older hardware, without pinning to VRAM there is
no way to use this solution here for peer-to-peer. So I'm glad to see that
so far you're not ruling out the pinning option.



thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
