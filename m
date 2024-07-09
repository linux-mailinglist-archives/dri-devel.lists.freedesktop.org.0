Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF41592B070
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 08:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A291410E07F;
	Tue,  9 Jul 2024 06:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1179B10E243
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 06:43:06 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WJBCc03Mmz1X4h0;
 Tue,  9 Jul 2024 14:38:52 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (unknown [7.193.23.208])
 by mail.maildlp.com (Postfix) with ESMTPS id B30CD180018;
 Tue,  9 Jul 2024 14:43:03 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 14:43:02 +0800
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Ensure the driver name is
 null-terminated
To: "T.J. Mercier" <tjmercier@google.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <sumit.semwal@linaro.org>,
 <benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
 <jstultz@google.com>, <shuah@kernel.org>, <wanghaibin.wang@huawei.com>
References: <20240708134654.1725-1-yuzenghui@huawei.com>
 <CABdmKX1CXWuw0-gRukZeSoF=SZFi3eRPELe=EU_-q3OVKQHZzw@mail.gmail.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <97cdc2d8-75ae-9fa2-6dc0-678867040eea@huawei.com>
Date: Tue, 9 Jul 2024 14:43:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CABdmKX1CXWuw0-gRukZeSoF=SZFi3eRPELe=EU_-q3OVKQHZzw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

On 2024/7/9 1:49, T.J. Mercier wrote:
> On Mon, Jul 8, 2024 at 6:47 AM Zenghui Yu <yuzenghui@huawei.com> wrote:
> >
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
> 
> Hm yeah. Looks like drm_copy_field resets version.name to the actual
> size of the name in the case of truncation, so maybe worth checking
> that too in case there is a name like "vgemfoo" that gets converted to
> "vgem\0" by this?

Given that drm_copy_field() would set version.name_len to the exact
length of the driver name, this can be addressed by

diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c 
b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index 2fcc74998fa9..5d0a809dc2df 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -29,7 +29,7 @@ static int check_vgem(int fd)
  	version.name = name;

  	ret = ioctl(fd, DRM_IOCTL_VERSION, &version);
-	if (ret)
+	if (ret || version.name_len != 4)
  		return 0;

  	name[4] = '\0';

on top of this patch. What do you think?

Thanks,
Zenghui
