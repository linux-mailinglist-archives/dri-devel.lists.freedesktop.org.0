Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C454F04FD
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 18:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF62F10E295;
	Sat,  2 Apr 2022 16:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1653110E295;
 Sat,  2 Apr 2022 16:39:19 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:44162.1504387931
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 681851001AF;
 Sun,  3 Apr 2022 00:39:12 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 64a13a040eec4c61bc445815a8d4478c for daniel.vetter@ffwll.ch; 
 Sun, 03 Apr 2022 00:39:13 CST
X-Transaction-ID: 64a13a040eec4c61bc445815a8d4478c
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <f7f0b13e-4128-14b3-63fe-ad4538281504@189.cn>
Date: Sun, 3 Apr 2022 00:39:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/4] drm/etnaviv: Don't break exclusive fence ordering
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <mailman.507.1648799353.12245.etnaviv@lists.freedesktop.org>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <mailman.507.1648799353.12245.etnaviv@lists.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: etnaviv@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> There's only one exclusive slot, and we must not break the ordering.
> Adding a new exclusive fence drops all previous fences from the
> dma_resv. To avoid violating the signalling order we err on the side of
> over-synchronizing by waiting for the existing fences, even if
> userspace asked us to ignore them.
>
> A better fix would be to us a dma_fence_chain or _array like e.g.
> amdgpu now uses, but it probably makes sense to lift this into
> dma-resv.c code as a proper concept, so that drivers don't have to
> hack up their own solution each on their own. Hence go with the simple
> fix for now.
I find a typo in the commit message, us -> use
