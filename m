Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD006F3306
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 17:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BB210E09B;
	Mon,  1 May 2023 15:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6033310E09B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 15:38:52 +0000 (UTC)
Received: from [192.168.2.246] (109-252-144-198.dynamic.spd-mgts.ru
 [109.252.144.198])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D16B866029DE;
 Mon,  1 May 2023 16:38:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682955528;
 bh=60ntYlxBLAqZcU4b/vq2szObt+W0BUAHvfMdgUwVFEU=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=jU7MFV/sNLCmvNNHS86pcVVv7Cxcs8xDyVU4wP29g9SJTpaSK42CT43hC/+mDZIJ/
 0pCaHUqQ42/bbprEbIDlSY3aiOuT9hjBKaMRnpPZxWUBXPiEUmRtn7pBopUG5EO/oL
 thsh8/UAvF5BLz3DsDtsCHUyoPFzRtB4Ol8WVs3FT4bAHfwPkhxZHHh586eghtFvUC
 IY0YexpTXT8eM8mCtyvpJ3qjt2+wmmXrWCGR0rsorq8Q12bP+ehab/46A3M8AIc6dh
 sKetCYbm4I0cbpxzOpyt7qy43oroTlO3KhcMkIVBrVsYtNprQSCholHZa7e2O0W6nW
 87swqG6GZ4KWg==
Message-ID: <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
Date: Mon, 1 May 2023 18:38:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 David Airlie <airlied@redhat.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/16/23 14:52, Dmitry Osipenko wrote:
> We have multiple Vulkan context types that are awaiting for the addition
> of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:
> 
>  1. Venus context
>  2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)
> 
> Mesa core supports DRM sync object UAPI, providing Vulkan drivers with a
> generic fencing implementation that we want to utilize.
> 
> This patch adds initial sync objects support. It creates fundament for a
> further fencing improvements. Later on we will want to extend the VirtIO-GPU
> fencing API with passing fence IDs to host for waiting, it will be a new
> additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU context
> drivers in works that require VirtIO-GPU to support sync objects UAPI.
> 
> The patch is heavily inspired by the sync object UAPI implementation of the
> MSM driver.

Gerd, do you have any objections to merging this series?

We have AMDGPU [1] and Intel [2] native context WIP drivers depending on
the sync object support. It is the only part missing from kernel today
that is wanted by the native context drivers. Otherwise, there are few
other things in Qemu and virglrenderer left to sort out.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21658
[2] https://gitlab.freedesktop.org/digetx/mesa/-/commits/native-context-iris

-- 
Best regards,
Dmitry

