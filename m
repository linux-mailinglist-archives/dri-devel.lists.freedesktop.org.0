Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E40C9E279
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6165B10E111;
	Wed,  3 Dec 2025 08:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="EvNxGn0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 146763 seconds by postgrey-1.36 at gabe;
 Wed, 03 Dec 2025 02:11:25 UTC
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com
 [113.46.200.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B96710E70C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 02:11:24 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=RHymky0mCi8FdyJM1fdcwkFMhzCbYMUp4/7yC5JYEvg=;
 b=EvNxGn0KQfT20Ph11XdB6jlYZ2H827zT/t/LWyTApz0CQaXrCLE+JjhOF6ZK0gC44RoP6c0lX
 Lf9ZMQiOdEu6cfn6absIZlH7II8HzWvtqQODlMeuYqpLIxeLvWcoSocyAtgsytpwKIuvSQPLJeY
 3vx3xiVnwpwrCN8bwsUPres=
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dLh0S2Kstz1T4Hn;
 Wed,  3 Dec 2025 10:09:28 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
 by mail.maildlp.com (Postfix) with ESMTPS id 6A3A8180B49;
 Wed,  3 Dec 2025 10:11:20 +0800 (CST)
Received: from [10.67.111.31] (10.67.111.31) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 3 Dec
 2025 10:11:19 +0800
Message-ID: <dcea10d8-880f-44d7-ba45-78a89133a824@huawei.com>
Date: Wed, 3 Dec 2025 10:11:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable] fbdev: Fix out-of-bounds issue in sys_fillrect()
To: Helge Deller <deller@gmx.de>
CC: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Lu
 Jialin <lujialin4@huawei.com>
References: <20251112073207.1731125-1-gubowen5@huawei.com>
 <148a116a-b893-4e91-8573-1eebc2bb5c0e@gmx.de>
 <224e4e5b-14ae-411c-ad6c-f73c3b946ff8@huawei.com>
 <aef7d5fd-2926-4c58-b720-4af58aa380d3@gmx.de>
Content-Language: en-US
From: Gu Bowen <gubowen5@huawei.com>
In-Reply-To: <aef7d5fd-2926-4c58-b720-4af58aa380d3@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.111.31]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-Mailman-Approved-At: Wed, 03 Dec 2025 08:11:25 +0000
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


On 12/3/2025 4:05 AM, Helge Deller wrote:
> Backporting commit eabb03293087 to 6.6 seems unrealistic.
> So, maybe adding your patch to stable might make sense.
> 
> +    if (dst_offset < 0 || dst_offset >= p->fix.smem_len) {
> +        pr_err("dst offset out of bound: dst_offset(%ld)", dst_offset);
> +        return;
> 
> I don't like the pr_err() in here. I do understand that you want to print
> that something wrong happened, but we are inside the console printing code.
> I think we should just return in this case.
> 

Oh, you are right, I should not add pr_err() in here. Maybe we can use 
pr_info_once() instead if you don't mind.
I will send a new patch until I receive your feedback. Thanks!

BR,
Guber
