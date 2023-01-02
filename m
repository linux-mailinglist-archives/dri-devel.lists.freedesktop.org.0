Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602A465AE9E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 10:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6705310E17E;
	Mon,  2 Jan 2023 09:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED1210E17E;
 Mon,  2 Jan 2023 09:24:29 +0000 (UTC)
Received: from [192.168.2.142] (109-252-113-89.nat.spd-mgts.ru
 [109.252.113.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FDC96602CC0;
 Mon,  2 Jan 2023 09:24:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672651468;
 bh=7tN/fQbkEDsjA4k9IBjHGq9Y43QCGstNSr5W+MmkBh8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j10vMCG3A1PQJzNKoxbsnm2QOWRGF9YGNn9bgCn26MCaF+LvI0CtuWysa9XdVmkUU
 shFKMKaNVQpcbok8teIVUknV6xnwJTx2iu74exclavg8QxheYYkBluXgP96ACBabhs
 kt5aosOWP/MEIStaKgDz0wZvsMjnoRUQi1cIWrFbw676uDHc5DFYHU+/Q0UiLnQbO4
 iMs46Ftd0tkzuPElDgI8EUMTW+CI8Qlt+7F7F9wDLwSm5RAklaSdkKXuPjE53LCavh
 gmZs1LawTWIfhhsYqGGbCj68yc5GxEA+iZnIf0x/83gtWDVX9gKjxag98rA+cq0/pM
 LGfnO+C9a6dWw==
Message-ID: <6ef84968-2874-49b0-9fbc-bdc897382b0e@collabora.com>
Date: Mon, 2 Jan 2023 12:24:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
To: youling257 <youling257@gmail.com>, robdclark@gmail.com
References: <CAF6AEGv=GJm5Hyea7a0oDgWDYXw72HwTB4sreeppYVEKCsw0Ew@mail.gmail.com>
 <20230101182907.1662-1-youling257@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230101182907.1662-1-youling257@gmail.com>
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
Cc: jonathan@marek.ca, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/1/23 21:29, youling257 wrote:
> Linux 6.2-rc1 has memory leak on amdgpu, git bisect bad commit is "drm/scheduler: rework entity flush, kill and fini".
> git bisect start
> # status: waiting for both good and bad commits
> # good: [eb7081409f94a9a8608593d0fb63a1aa3d6f95d8] Linux 6.1-rc6
> git bisect good eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
> # status: waiting for bad commit, 1 good commit known
> # bad: [66efff515a6500d4b4976fbab3bee8b92a1137fb] Merge tag 'amd-drm-next-6.2-2022-12-07' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
> git bisect bad 66efff515a6500d4b4976fbab3bee8b92a1137fb
> # good: [49e8e6343df688d68b12c2af50791ca37520f0b7] Merge tag 'amd-drm-next-6.2-2022-11-04' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
> git bisect good 49e8e6343df688d68b12c2af50791ca37520f0b7
> # bad: [fc58764bbf602b65a6f63c53e5fd6feae76c510c] Merge tag 'amd-drm-next-6.2-2022-11-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
> git bisect bad fc58764bbf602b65a6f63c53e5fd6feae76c510c
> # bad: [4e291f2f585313efa5200cce655e17c94906e50a] Merge tag 'drm-misc-next-2022-11-10-1' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
> git bisect bad 4e291f2f585313efa5200cce655e17c94906e50a
> # good: [78a43c7e3b2ff5aed1809f93b4f87a418355789e] drm/nouveau/gr/gf100-: make global attrib_cb actually global
> git bisect good 78a43c7e3b2ff5aed1809f93b4f87a418355789e
> # bad: [611fc22c9e5e13276c819a7f7a7d19b794bbed1a] drm/arm/hdlcd: remove calls to drm_mode_config_cleanup()
> git bisect bad 611fc22c9e5e13276c819a7f7a7d19b794bbed1a
> # bad: [a8d9621b9fc67957b3de334cc1b5f47570fb90a0] drm/ingenic: Don't set struct drm_driver.output_poll_changed
> git bisect bad a8d9621b9fc67957b3de334cc1b5f47570fb90a0
> # good: [2cf9886e281678ae9ee57e24a656749071d543bb] drm/scheduler: remove drm_sched_dependency_optimized
> git bisect good 2cf9886e281678ae9ee57e24a656749071d543bb
> # bad: [8e4e4c2f53ffcb0ef746dc3b87ce1a57c5c94c7d] Merge drm/drm-next into drm-misc-next
> git bisect bad 8e4e4c2f53ffcb0ef746dc3b87ce1a57c5c94c7d
> # bad: [47078311b8efebdefd5b3b2f87e2b02b14f49c66] drm/ingenic: Fix missing platform_driver_unregister() call in ingenic_drm_init()
> git bisect bad 47078311b8efebdefd5b3b2f87e2b02b14f49c66
> # bad: [a82f30b04c6aaefe62cbbfd297e1bb23435b6b3a] drm/scheduler: rename dependency callback into prepare_job
> git bisect bad a82f30b04c6aaefe62cbbfd297e1bb23435b6b3a
> # bad: [2fdb8a8f07c2f1353770a324fd19b8114e4329ac] drm/scheduler: rework entity flush, kill and fini
> git bisect bad 2fdb8a8f07c2f1353770a324fd19b8114e4329ac
> # first bad commit: [2fdb8a8f07c2f1353770a324fd19b8114e4329ac] drm/scheduler: rework entity flush, kill and fini
> 
> @Rob Clark, i test your patch fixed my problem.

The linux-next already carried the fix for a couple weeks. It will land
to 6.2-rc once drm-fixes branch will be synced with the 6.2.

-- 
Best regards,
Dmitry

