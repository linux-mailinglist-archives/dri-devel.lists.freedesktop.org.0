Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1615BADAC32
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E789110E316;
	Mon, 16 Jun 2025 09:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1012 seconds by postgrey-1.36 at gabe;
 Mon, 16 Jun 2025 09:44:30 UTC
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A19410E316
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:44:30 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bLPjb4dq6z1V43x;
 Mon, 16 Jun 2025 17:25:07 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
 by mail.maildlp.com (Postfix) with ESMTPS id 76F2F1400D2;
 Mon, 16 Jun 2025 17:27:31 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Jun 2025 17:27:30 +0800
Subject: Re: [PATCH drm-dp 03/10] drm/hisilicon/hibmc: fix irq_request()'s irq
 name variable is local
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Yongbang Shi
 <shiyongbang@huawei.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-4-shiyongbang@huawei.com>
 <oof3yrny3x5vglnjvcsz6brpn2a4l2nkmpepnykojqquytfj56@vz5sk7coojhw>
 <c59b893c-dca4-4c7f-a57e-99e60401ebc0@huawei.com>
 <a88f479b-e022-4ed7-8286-5d546423bfcf@oss.qualcomm.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <ef82045a-2efd-8a04-4c0a-6d90fd7bd08b@huawei.com>
Date: Mon, 16 Jun 2025 17:27:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <a88f479b-e022-4ed7-8286-5d546423bfcf@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200017.china.huawei.com (7.202.194.83)
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

On 2025/6/9 22:53, Dmitry Baryshkov wrote:
> On 09/06/2025 17:50, Yongbang Shi wrote:
> >
> > > On Fri, May 30, 2025 at 05:54:25PM +0800, Yongbang Shi wrote:
> > > > From: Baihan Li <libaihan@huawei.com>
> > > >
> > > > The local variable of irq name is passed to
> > > > devm_request_threaded_irq(),
> > > > which will make request_irq failed. Using the global irq name instead
> > > > of it to fix.
> > > This doesn't explain, why does it fail and which IRQ name is actually
> > > expected.
> >
> > The local variable is passed in request_irq (), and there will be use
> > after free problem.
> 
> This needs to be explained (in details) in the commit message.

+1. And I hope this can be fixed as soon as possible. I've run into
several OOPS with that.

Thanks,
Zenghui
