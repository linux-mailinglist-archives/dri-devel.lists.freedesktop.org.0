Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE438759E03
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 20:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0316210E4F3;
	Wed, 19 Jul 2023 18:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FC010E4F3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 18:58:20 +0000 (UTC)
Received: from [192.168.2.126] (109-252-154-2.dynamic.spd-mgts.ru
 [109.252.154.2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 16E63660297B;
 Wed, 19 Jul 2023 19:58:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689793099;
 bh=90P6czviIlXHr0eGb/SoquQ/g7YR+xk08OSKKljjd2E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NLKC62L0/gpuc3lHyujrpNMQPtMmwibHObN8EbT24VBIxldrTwrLDfFZRbVlr7UZb
 Llu1yQsuzA/wU+nCTjtdecHepOhwAuOM3NlBClW5hgH55S75tnDC6c7nP8pEF6LhtF
 vlWEpszLBieC7DxCFsGEXBsskST4WHn2p0u6TZO9tS5TmMWTwtv7KYI9tkYLIQBu/w
 dfTG/2AZxGbCwz+niMxvwlYxGNuQGGiL2KBUYigXPTki1pai+G9UGl+bQDtSwLeYBS
 w6DOLF+Fk3VLI8D0G8+30qnL+VZeBPg5dP5+EMhVx9gQLP8nDK/4Cvq5A8cL0UIO//
 Tz210FZyi+HEw==
Message-ID: <4c18744d-b6cd-d517-5726-104017d0764b@collabora.com>
Date: Wed, 19 Jul 2023 21:58:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
 <CAAfnVBnrUotph4TYJVu9Bohqv3m80t90V34TNhh-Tspxwsj-ZQ@mail.gmail.com>
 <CAF6AEGs4fuq4i8UJdO5hvgHTNhzFMKGZ87+w1oyvL0LAqWio6A@mail.gmail.com>
 <CAAfnVBkLhYVaSG3U_QUZwXLFv-XT=9F2v2pgrCDQQBgNZ3MSWA@mail.gmail.com>
 <a453d562-7e93-aef3-a533-171f572b6ee3@collabora.com>
 <CAAfnVBmwVTBNx4GC2hiYQ9Ya8ufP_D8N0-JOzT2iPV9BYZhD9w@mail.gmail.com>
 <CAF6AEGvWrUN9W9DKv45OT-MfYAS4D_bXa_Sb5ptgrMEf9WSSqA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGvWrUN9W9DKv45OT-MfYAS4D_bXa_Sb5ptgrMEf9WSSqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@redhat.com>, kernel@collabora.com,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

27.06.2023 20:16, Rob Clark пишет:
...
>> Now these are just suggestions, and while I think they are good, you can safely ignore them.
>>
>> But there's also the DRM requirements, which state "userspace side must be fully reviewed and tested to the standards of that user-space project.".  So I think to meet the minimum requirements, I think we should at-least have one of the following (not all, just one) reviewed:
>>
>> 1) venus using the new uapi
>> 2) gfxstream vk using the new uapi
>> 3) amdgpu nctx out of "draft" mode and using the new uapi.
>> 4) virtio-intel using new uapi
>> 5) turnip using your new uapi
> 
> forgot to mention this earlier, but
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23533
> 
> Dmitry, you can also add, if you haven't already:
> 
> Tested-by: Rob Clark <robdclark@gmail.com>

Gurchetan, Turnip Mesa virtio support is ready to be merged upstream,
it's using this new syncobj UAPI. Could you please give yours r-b if you
don't have objections?

-- 
Best regards,
Dmitry

