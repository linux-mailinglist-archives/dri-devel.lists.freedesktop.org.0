Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DEC650968
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 10:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CF710E15B;
	Mon, 19 Dec 2022 09:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 935 seconds by postgrey-1.36 at gabe;
 Mon, 19 Dec 2022 09:37:39 UTC
Received: from m12.mail.163.com (m12.mail.163.com [123.126.96.234])
 by gabe.freedesktop.org (Postfix) with ESMTP id D348510E15B;
 Mon, 19 Dec 2022 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qni9Y
 MWkKo/+ezfpz43WDevGp+Vw59ephUbClSDLIOU=; b=l5QXtX2e/+C1H01sEDzjT
 W5/HS4g5/+EZXmblRdbMF1MYhrKP6aRT4y7rp7rI208a7wnSk4HiLgZ0+oevrZuy
 PPo491RVnzJ49WQbX2YVVXY+U6EBjQMkryaJJdYi3nRUgHRvLkl7jfq5Jj8deleL
 F3OxVsbsbcTJs80SSY/1qU=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by smtp18 (Coremail) with SMTP id JNxpCgAX2dkjLaBji9tsBw--.36020S2;
 Mon, 19 Dec 2022 17:21:40 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: zhi.a.wang@intel.com
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
Date: Mon, 19 Dec 2022 17:21:39 +0800
Message-Id: <20221219092139.222456-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <11728bc1-7b59-1623-b517-d1a0d57eb275@intel.com>
References: <11728bc1-7b59-1623-b517-d1a0d57eb275@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: JNxpCgAX2dkjLaBji9tsBw--.36020S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur13ArW7Cw17tr47Gr4xtFb_yoWfGrgEgr
 1jq3s8Cw4UJFnrtw45Kayxtry7KrWfJrW8J34kua9rCryrZFs3CasrCrnxX3WfXr4v9Fs5
 Kr1rGwsFyry2vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtMKCJUUUUU==
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiXATcU1Xl5Jg2UQAAs8
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
Cc: alex000young@gmail.com, security@kernel.org,
 intel-gvt-dev@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 hackerzheng666@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 1002992920@qq.com, zyytlz.wz@163.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wang, Zhi A <zhi.a.wang@intel.com> 于2022年12月19日周一 16:22写道：

>
> I think it is a case-by-case thing. For example:
>
> The current scenario in this function looks like below:
>
> caller pass spt a
> function
>         alloc spt b
>         something error
>         free spt a
>         return error
>
> The problem is: the function wrongly frees the spt a instead free what
> it allocates.

Thanks for your clear explaination. It’s really helpfult to me.
I think I might know how to fix now.

> A proper fix should be:
>
> caller pass spt a
> function
>         alloc spt b
>         something error
>         *free spt b*
>         return error
>
As it's a case-by-case thing, I'll extract the un-done-mapping-dma part from
ppgtt_invalidate_spt and put it in error path. Then I'll add the code of freeing
new allocated spt. If I misunderstand your meaning, feel free to let me know.
Working on a new fix now.

Best regards,
Zheng Wang

