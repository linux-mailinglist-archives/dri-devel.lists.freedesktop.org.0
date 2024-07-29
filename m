Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7D493EEA2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 09:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E4310E151;
	Mon, 29 Jul 2024 07:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E28610E151
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 07:40:44 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WXVbc0HX5zdkPh;
 Mon, 29 Jul 2024 15:38:52 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (unknown [7.193.23.208])
 by mail.maildlp.com (Postfix) with ESMTPS id 7EFC41404F8;
 Mon, 29 Jul 2024 15:40:41 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 15:40:40 +0800
Subject: Re: [PATCH v2] kselftests: dmabuf-heaps: Ensure the driver name is
 null-terminated
To: <daniel.vetter@ffwll.ch>
References: <20240729024604.2046-1-yuzenghui@huawei.com>
 <Zqc-ZWlTYwnKHoQK@phenom.ffwll.local>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <sumit.semwal@linaro.org>,
 <benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
 <jstultz@google.com>, <tjmercier@google.com>, <shuah@kernel.org>,
 <wanghaibin.wang@huawei.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <8d318883-4ea3-b1d8-6613-6ca21a4ba2d2@huawei.com>
Date: Mon, 29 Jul 2024 15:40:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <Zqc-ZWlTYwnKHoQK@phenom.ffwll.local>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600007.china.huawei.com (7.193.23.208)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024/7/29 15:01, Daniel Vetter wrote:
> On Mon, Jul 29, 2024 at 10:46:04AM +0800, Zenghui Yu wrote:
> > Even if a vgem device is configured in, we will skip the import_vgem_fd()
> > test almost every time.
> >
> >   TAP version 13
> >   1..11
> >   # Testing heap: system
> >   # =======================================
> >   # Testing allocation and importing:
> >   ok 1 # SKIP Could not open vgem -1
> >
> > The problem is that we use the DRM_IOCTL_VERSION ioctl to query the driver
> > version information but leave the name field a non-null-terminated string.
> > Terminate it properly to actually test against the vgem device.
> >
> > While at it, let's check the length of the driver name is exactly 4 bytes
> > and return early otherwise (in case there is a name like "vgemfoo" that
> > gets converted to "vgem\0" unexpectedly).
> >
> > Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> > ---
> > * From v1 [1]:
> >   - Check version.name_len is exactly 4 bytes and return early otherwise
> >
> > [1] https://lore.kernel.org/r/20240708134654.1725-1-yuzenghui@huawei.com
> 
> Thanks for your patch, I'll push it to drm-misc-next-fixes.
> 
> > P.S., Maybe worth including the kselftests file into "DMA-BUF HEAPS
> > FRAMEWORK" MAINTAINERS entry?
> 
> Good idea, want to do the patch for that too?

Sure, I can send a patch for that today.

Thanks,
Zenghui
