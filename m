Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3577680CC7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D24A10E0EE;
	Mon, 30 Jan 2023 12:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D6F10E0EE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 12:02:16 +0000 (UTC)
Received: from [192.168.2.197] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E15296602E28;
 Mon, 30 Jan 2023 12:02:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675080134;
 bh=CHRlgWCrCpxZAOuChuXDaANCOZzcJofZwQqqPaAf7sQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R7G71otP2Pf4OrQ5BkXCg17Bng7TkOykH17FKAqo+NkrjEIywalYsM/SbF3vB6tvn
 Z218ErZnlZHHyHx2VH/ade50zdsB193IuY/ePdei+ptVgqrnIIsAhgNKREm2yY/x1d
 VISY3fpEYUn331iy1m9QAGJ2vI08C7rRBEA2dhIpyyQnCEWfMnxwv5KR+o+VtJ6Top
 Xd2G2TFtw4wPTsquTgh6D1foaT4PW1QBcACi27/KNTkyWogQ0Pt/+6/A20MM0i6Ssc
 XRvVnLFWLpApaJrZMyiYRm4C34SfWe1eDNEfhLApR9NxsCjmNogwkID0Z1gdI6g1JS
 kZ0ft4yyYvDMg==
Message-ID: <0081b2c3-56c9-3ed8-b419-5ce8a151999e@collabora.com>
Date: Mon, 30 Jan 2023 15:02:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <e5e9e8dd-a5b6-cfd2-44d6-4d5aa768e56c@collabora.com>
 <20230127081339.yovxofpboc4gfdgo@sirius.home.kraxel.org>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230127081339.yovxofpboc4gfdgo@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/27/23 11:13, Gerd Hoffmann wrote:
> On Thu, Jan 26, 2023 at 01:55:09AM +0300, Dmitry Osipenko wrote:
>> Hello Thomas and Gerd,
>>
>> On 1/9/23 00:04, Dmitry Osipenko wrote:
>>> This series:
>>>
>>>   1. Makes minor fixes for drm_gem_lru and Panfrost
>>>   2. Brings refactoring for older code
>>>   3. Adds common drm-shmem memory shrinker
>>>   4. Enables shrinker for VirtIO-GPU driver
>>>   5. Switches Panfrost driver to the common shrinker
>>>
>>> Changelog:
>>>
>>> v10:- Rebased on a recent linux-next.
>>>
>>>     - Added Rob's ack to MSM "Prevent blocking within shrinker loop" patch.
>>>
>>>     - Added Steven's ack/r-b/t-b for the Panfrost patches.
>>>
>>>     - Fixed missing export of the new drm_gem_object_evict() function.
>>>
>>>     - Added fixes tags to the first two patches that are making minor fixes,
>>>       for consistency.
>>
>> Do you have comments on this version? Otherwise ack will be appreciated.
>> Thanks in advance!
> 
> Don't feel like signing off on the locking changes, I'm not that
> familiar with the drm locking rules.  So someone else looking at them
> would be good.  Otherwise the series and specifically the virtio changes
> look good to me.
> 
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thomas was looking at the the DRM core changes. I expect he'll ack them.

Thank you for reviewing the virtio patches!

-- 
Best regards,
Dmitry

