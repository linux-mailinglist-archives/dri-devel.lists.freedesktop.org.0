Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6343965086F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 09:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BA410E191;
	Mon, 19 Dec 2022 08:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 946 seconds by postgrey-1.36 at gabe;
 Mon, 19 Dec 2022 08:14:05 UTC
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.198])
 by gabe.freedesktop.org (Postfix) with ESMTP id D890710E1F7;
 Mon, 19 Dec 2022 08:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Hzd8l
 f6HY4y2Yw9uc+TdTUhpidkvFZA9uoCnx/ZjXJY=; b=UykVbeZaZcR2s+sQubBlD
 Gsa9w0ba/ivcEYX4AGmLCBHWkNum3qHH7OBFjoLsIYujCvedluxNUWSVNHUlaroz
 Q0iyNvwrBN79oTsgcnXNWLLTwnqEmcU2h01h768tl/HLe+vuhCvPofLHwxEz6D/T
 47DERHVVrrH/n4IXvrHRHA=
Received: from leanderwang-LC2.localdomain (unknown [111.206.145.21])
 by zwqz-smtp-mta-g0-2 (Coremail) with SMTP id _____wCXjF1NGaBjOMpSAA--.24784S2;
 Mon, 19 Dec 2022 15:57:02 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: zhi.a.wang@intel.com
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
Date: Mon, 19 Dec 2022 15:57:00 +0800
Message-Id: <20221219075700.220058-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <da557524-02ff-2ac7-7960-6f710c2d41d6@intel.com>
References: <da557524-02ff-2ac7-7960-6f710c2d41d6@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXjF1NGaBjOMpSAA--.24784S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF48GF45Kr43KF4UtFWDurg_yoWfZFc_uF
 yxCwn7Cw1DJFsxWw43tFnxXr409rn5XrZ2g3yFvrW7GasrZFnrWas3J3sIgrs7t393KrW5
 Kr4DXrWjvryj9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtMKCJUUUUU==
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiQhHcU1aED4R+7wAAsU
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

Hi Zhi,

Thanks again for your reply and clear explaination about the function.
I still have some doubt about the fix. Here is a invoke chain :
ppgtt_populate_spt
  ->ppgtt_populate_shadow_entry
    ->split_2MB_gtt_entry
As far as I'm concerned, when something error happens in DMA mapping,
which will make intel_gvt_dma_map_guest_page return none-zero code,
It will invoke ppgtt_invalidate_spt and call ppgtt_free_spt,which will
finally free spt by kfree. But the caller doesn't notice that and frees
spt by calling ppgtt_free_spt again. This is a typical UAF/Double Free
vulnerability. So I think the key point is about how to handle spt properly.
The handle newly allocated spt (aka sub_spt) is not the root cause of this
issue. Could you please give me more advice about how to fix this security
bug? Besides, I'm not sure if there are more similar problems in othe location.

Best regards,
Zheng Wang

-- 
2.25.1

