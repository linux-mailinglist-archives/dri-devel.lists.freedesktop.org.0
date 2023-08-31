Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846378F5D4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 00:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C00F10E0FC;
	Thu, 31 Aug 2023 22:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5720110E0FC
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 22:52:00 +0000 (UTC)
Received: from [192.168.2.209] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9B1EC66072A4;
 Thu, 31 Aug 2023 23:51:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693522318;
 bh=NKKq2+0TE/ojZwC9YPX0jpewZ2RzOLE8pL2FHM314HQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ijuq1xFOWovbBVNM93u0y9khpiCYkOqbfLGXnFMHqjekGn6tbuvhu/N80qIamGds0
 kw8HljbVlXZidr5XEoBWx25/Dv13a0wW3ypJ58+ksu9j5JJDr3NzPA6ysF46mC17Qx
 602DlrEFx03dde6k5zgIUkHkUNtXl3DIRqI+rY+PLwW1r5r6ZZD27iZbsZjxW0cpzR
 usDrJ0gPMNaFugKraG6YWiTlX+MuEiS4NDJefRuLPGbIi+1GijvNmbyfgdV9kn8w/r
 JnqceO8CZMldhMIF4TQInDLQ07dJO0S572r/idpbBYaetJQ/r7nyj4fEnmG38mRa2a
 O6gvQh/k7QRxA==
Message-ID: <2d93796d-c9b6-51ed-2a93-fa1e64f9e2ea@collabora.com>
Date: Fri, 1 Sep 2023 01:51:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 3/3] drm/virtio: drm_gem_plane_helper_prepare_fb for
 obj synchronization
To: "Kim, Dongwon" <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-4-dongwon.kim@intel.com>
 <04181690-adc2-fc30-d1b4-b6ca5b02a142@collabora.com>
 <8689536c-4760-a32b-76f4-65c022b5eadc@intel.com>
 <535626da-0958-7c42-7bc1-6f7c0f805634@collabora.com>
 <a07fc333-3481-6ab3-f22c-f64054b49beb@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <a07fc333-3481-6ab3-f22c-f64054b49beb@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/24/23 20:58, Kim, Dongwon wrote:
...
>> You can do fence-wait in the guest userspace/Mesa after blitting/drawing
>> to the udmabuf.
> 
> There is already synchronization between QEMU and virtio-gpu driver on
> the guest. Upon resource flush, virtio-gpu waits for the response for
> the message from the QEMU and QEMU sends out the response once rendering
> is done. The problem we are seeing is not that the rendering part is
> reusing the buffer before it's displayed by the QEMU. Problem we are
> facing is more like some frame is often not finished when
> "resource-flush" is issued. So unless there is a way for QEMU to wait
> for this fence (guest drm), I think we should have some synchronization
> point in the guest side.
> 
> I saw other DRM drivers, omap, tegra, vc4 and so on are doing the
> similar so I guess this is a generic solution for such cases. But I do
> understand your concern as the primary use case of virtio-gpu driver is
> for virgl. So this extra wait would cost some performance drop. But I
> have a couple of points here as well.
> 
> 1. Wouldn't this extra wait caused by drm_gem_plane_helper_prepare_fb be
> minimal as the actual
> rendering is done in the host?
> 
> 2. Can we just make this helper called only if virgl is not used as 3D
> driver?

The problem you described above shouldn't be resolved by your patch. You
need to wait for FB to be released by the host's display and not to
before GPU finished rendering on guest. I.e. you're swapping display
buffers and your dGPU starts rendering to the buffer that is in active
use by host's display, correct?

Maybe you need to do glFinish() on host after swapping buffers? But that
will block host for a long time.

For now I don't have solution.

>> Virglrender today supports native contexts. The method you're using for
>> GPU priming was proven to be slow in comparison to multi-gpu native
>> contexts. There is ongoing work for supporting fence passing from guest
>> to host [1] that allows to do fence-syncing on host. You'll find links
>> to the WIP virtio-intel native context in [1] as well. You won't find
>> GPU priming support using native context in [1], patches hasn't been
>> published yet.
>>
>> [1]
>> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138
>>
>> Note that in general it's not acceptable to upstream patches that serve
>> downstream only. Yours display sync issue is irrelevant to the upstream
>> stack unless you're going to upstream all the VMM and guest userspace
>> patches, and in such case you should always publish all the patches and
>> provide links.
>>
>> So, you need to check the performance impact and publish all the patches
>> to the relevant upstream projects.
> 
> QEMU has all patches regarding this (blob scanout support) but guest Mesa
> patch for KMSRO is still outstanding.
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/9592
> 
> I understand this specific patch would need more
> discussion/justification but
> what about other two, are you generally ok with those in the same series?

The first patch should be dropped. The second one could be useful,
you'll need to provide step-by-step instruction for how to reproduce the
multi-display issue, please write it in the cover-letter for the next
patch version.

-- 
Best regards,
Dmitry

