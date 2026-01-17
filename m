Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADCFD38D68
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 10:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FCD10E052;
	Sat, 17 Jan 2026 09:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="iXaBmfJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com
 [113.46.200.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E0C10E028
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 07:45:53 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=CTksVfBTpsba5iXLLBdG+mDlVrrmby9B2lx45VJNH2M=;
 b=iXaBmfJiJaJeJ5OctQb1DHAkyZ+pSIvjQvhuFwwUTpSGm9+BfBGVMd9f1wm6tKzZk6r2eDv/p
 78stdI8SQSxtXi00Iw3sGB+yz7KCjL97ksWAo/mcJuvDMtotDeJvkFg3ZZGIBIo5efnouEo6SO7
 t9INatzz91ZItizIvhTXFMY=
Received: from mail.maildlp.com (unknown [172.19.162.223])
 by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dtTF91pFvz12LFm;
 Sat, 17 Jan 2026 15:41:49 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
 by mail.maildlp.com (Postfix) with ESMTPS id F14B840539;
 Sat, 17 Jan 2026 15:45:49 +0800 (CST)
Received: from [10.67.111.31] (10.67.111.31) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 17 Jan
 2026 15:45:49 +0800
Message-ID: <e835a856-4e2d-42dc-b3ab-79aa341e0783@huawei.com>
Date: Sat, 17 Jan 2026 15:45:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2,stable/linux-6.6.y] fbdev: Fix out-of-bounds issue in
 sys_fillrect()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <stable@vger.kernel.org>, Lu Jialin <lujialin4@huawei.com>
References: <20251217094530.1685998-1-gubowen5@huawei.com>
 <2025121715-vindicate-valium-1118@gregkh>
Content-Language: en-US
From: Gu Bowen <gubowen5@huawei.com>
In-Reply-To: <2025121715-vindicate-valium-1118@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.31]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-Mailman-Approved-At: Sat, 17 Jan 2026 09:39:27 +0000
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

Hi Greg,

On 12/17/2025 5:34 PM, Greg Kroah-Hartman wrote:
> On Wed, Dec 17, 2025 at 05:45:30PM +0800, Gu Bowen wrote:
>> This issue has already been fixed by commit eabb03293087 ("fbdev:
>> Refactoring the fbcon packed pixel drawing routines") on v6.15-rc1, but it
>> still exists in the stable version.
> 
> Why not take the refactoring changes instead?  That is almost always the
> proper thing to do, one-off changes are almost always wrong and cause
> extra work in the long-term.
> 
> Please try backporting those changes instead please.
> 
> thanks,
> 
> greg k-h

As you've suggested, I understand the preference to keep stable branches 
aligned with upstream when possible. However, I find that the 
refactoring touches many areas of the codebase that have diverged 
between mainline and stable-6.6, resulting in extensive merge conflicts. 
In addition, I cannot be certain that backporting 3000+ lines of 
refactoring code to a stable branch might introduce unknown risks.

Given the current situation, I have another simpler patch solution that 
is easy to maintain, and perhaps it could be merged into the stable branch:

void sys_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
  ...
  while (height--) {
  	dst += dst_idx >> (ffs(bits) - 1);
+	long dst_offset;
+	dst_offset = (unsigned long)dst - (unsigned long)p->screen_base;
+	if (dst_offset < 0 || dst_offset >= p->fix.smem_len)
+		return;
  	dst_idx &= (bits - 1);
  	fill_op32(p, dst, dst_idx, pat, width*bpp, bits);
  ...


BR,
Guber
