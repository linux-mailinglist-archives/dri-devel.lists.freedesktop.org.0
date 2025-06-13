Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF8AD8463
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 09:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF5E10E1C5;
	Fri, 13 Jun 2025 07:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pKtl3N3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBDC10E1C5;
 Fri, 13 Jun 2025 07:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=30ezSC5SuiN0IChbbRZASt5M1rZUDx5UAhi1YP6jKF0=; b=pKtl3N3dNtArzKVtv7y/bpuBWj
 Et87NBgYnRm91BqJx4CM/u0+4pR95JNXUx6cKR+XyLuukbV2oVoWbWer+E2r8ceQDs/lLNJksLy6z
 j/bW1JXti2NzQ/AMj8ypECl9riVPFyEvp+vZQtb0D53cluiwEw6FHko0fyXaa7dVvZLrTspUmVzeZ
 UxBBYrOCuFYt/qa61rpkSIPS+/a3mLwo0tN3d90N0o1ocQEny8xTo9WNPgy0sreWTB57wba1rfUu1
 AkeVh50M+5C3biWbOyMABV8ghv5b1ODheC8TN7/d6LQ5P0oLWW/M5ZIHnHxhu2WnDbZp3K1gvugqp
 KBTqgMfw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPz1K-002vBD-5Z; Fri, 13 Jun 2025 09:40:14 +0200
Message-ID: <36c36380-6770-4776-9e85-69299e4ab11a@igalia.com>
Date: Fri, 13 Jun 2025 08:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] drm/xe: Make dma-fences compliant with the safe
 access rules
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
 <20250610164226.10817-5-tvrtko.ursulin@igalia.com>
 <lagtnrxxqzwn4akmummmuxd4msqctbzrqbht66debl7ktzgkpm@7xn5yv5ackvl>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <lagtnrxxqzwn4akmummmuxd4msqctbzrqbht66debl7ktzgkpm@7xn5yv5ackvl>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/06/2025 18:49, Lucas De Marchi wrote:
> On Tue, Jun 10, 2025 at 05:42:26PM +0100, Tvrtko Ursulin wrote:
>> Xe can free some of the data pointed to by the dma-fences it exports. 
>> Most
>> notably the timeline name can get freed if userspace closes the 
>> associated
>> submit queue. At the same time the fence could have been exported to a
>> third party (for example a sync_fence fd) which will then cause an use-
>> after-free on subsequent access.
>>
>> To make this safe we need to make the driver compliant with the newly
>> documented dma-fence rules. Driver has to ensure a RCU grace period
>> between signalling a fence and freeing any data pointed to by said fence.
>>
>> For the timeline name we simply make the queue be freed via kfree_rcu and
>> for the shared lock associated with multiple queues we add a RCU grace
>> period before freeing the per GT structure holding the lock.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> 
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> for merging this through drm-misc tree.

Thanks!

I've now pushed the series drm-misc-next.

Btw there is also an IGT for xe I wrote ages ago^1, if you want to ping 
someone to review it or take it over. Might be useful to have permanent 
verification the UAF keeps being resolved.


Regards,

Tvrtko

1) https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2

