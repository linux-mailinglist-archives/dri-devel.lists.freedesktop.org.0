Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E3B56241C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB9212B2FA;
	Thu, 30 Jun 2022 20:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFA712B2FA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id E070D3F5F3;
 Thu, 30 Jun 2022 22:26:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.11
X-Spam-Level: 
X-Spam-Status: No, score=-2.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ys3ewB1T2h5j; Thu, 30 Jun 2022 22:26:38 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id EBF423F56D;
 Thu, 30 Jun 2022 22:26:37 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="lGyu0BiN";
 dkim-atps=neutral
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B3032362576;
 Thu, 30 Jun 2022 22:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1656620797; bh=dBGTo7Fnl+Py9qgAvsPpjBs02WDSZBrxbrzigH/NMY0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lGyu0BiNRJU6a7sKaXGq2Q7ywXMd+kPxMEuaKzU5rdXpywD8mAnpBbxlbXQLDwJ7r
 6/JOBICfNxjTrKwz0xEOe7DvNyNkDTPCgh9ZUsr86a8VJn0ZkQPE9PhcY3vzkAYy0H
 vnuZzYDN5CTn/FQTK8vZBn+U7bB+yrDQi+JuMIlg=
Message-ID: <22005f1b-4ae2-0fda-beda-1d9847bb2ade@shipmail.org>
Date: Thu, 30 Jun 2022 22:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 2/2] drm/gem: Don't map imported GEMs
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220630200405.1883897-1-dmitry.osipenko@collabora.com>
 <20220630200405.1883897-3-dmitry.osipenko@collabora.com>
 <75b677b6-c704-e270-c921-93c982020c38@shipmail.org>
 <8ab15669-889b-1119-9323-ec47689c7fb7@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <8ab15669-889b-1119-9323-ec47689c7fb7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/30/22 22:22, Dmitry Osipenko wrote:
> Hello Thomas,
>
> On 6/30/22 23:15, Thomas Hellström (Intel) wrote:
>> Hi, Dmitry,
>>
>> On 6/30/22 22:04, Dmitry Osipenko wrote:
>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
>>> handle imported dma-bufs properly, which results in mapping of something
>>> else than the imported dma-buf. On NVIDIA Tegra we get a hard lockup when
>>> userspace writes to the memory mapping of a dma-buf that was imported
>>> into
>>> Tegra's DRM GEM.
>>>
>>> Majority of DRM drivers prohibit mapping of the imported GEM objects.
>>> Mapping of imported GEMs require special care from userspace since it
>>> should sync dma-buf because mapping coherency of the exporter device may
>>> not match the DRM device. Let's prohibit the mapping for all DRM drivers
>>> for consistency.
>>>
>>> Cc: stable@vger.kernel.org
>>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> This might break drivers whose obj->funcs->mmap() callback already
>> handles this case, and has userspace that does the right thing.
> The drm-shmem helper should be the only that maps imported GEMs
> properly, but drivers that use drm-shmem already prohibit to map
> imported GEMs. Okay, I'll try to re-check once again to be sure.

OK. If you aren't 100.1% sure, then please drop the Cc: stable tag and 
let the patch ride out at least an -rc series, because breaking a stable 
kernel is something we woudln't want to do.

Thanks,

Thomas



>
>> I think the disabling must be checked on a per-driver basis to avoid
>> that; in particular drivers that already call dma_buf_mmap() should be
>> able to continue doing this.
>>
>> Also the Fixes: review comment remains,
> This should've been broken forever, don't think that we have a fixes tag
> here. I looked thought all my previous patches and added the Fixes
> wherever was possible. If I really missed something, then please let me
> know.
>
