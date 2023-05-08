Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFFC6FAFBF
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 14:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FE710E262;
	Mon,  8 May 2023 12:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D0910E262
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 12:16:55 +0000 (UTC)
Received: from [192.168.2.166] (109-252-144-198.dynamic.spd-mgts.ru
 [109.252.144.198])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D5E1A6602B7B;
 Mon,  8 May 2023 13:16:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683548212;
 bh=5nqNokABTRT0sp0oo3g/iVhuPBpT+GIHDLs8TsjbMto=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=knEdXetdP3Jvn1n8N7fq/9YUonET0XNfXXRoWQKjAZBiPd2iy1NZkmkunBgCBwqmE
 B/kuXbGRro/Ro3IuUBIoncNAe0IsmYanqutij7x6GeIJiKIwATdXJBpkl+uKdp8Ae8
 eVCzR/RRDQwKvgE9+bPw4zqmm39fAFWpOZ7u26nhCjtgXd4MBCAqlRxzb0FV6D2jk3
 P4mMcSVeAyg1uouEMarKSQxUiiNHyXjnBOF30Ue/Xq7CYm/Jv93i0kh2m4ValPfy3l
 E/2ng3PqfnOXZ80Hilb5uiS2xxsZFeIT8peeharNPLdJhFct80mNEydDDKaXr8p3ac
 7R55Umm3hecig==
Message-ID: <d3c6a9fa-e59a-1f7c-f3a3-6c1ee63aa495@collabora.com>
Date: Mon, 8 May 2023 15:16:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
 <6g5bonxpnlw7pcyt3pqrcty2exknpesst4i3v24nqxi3fy5gkr@5rej6zbfadta>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <6g5bonxpnlw7pcyt3pqrcty2exknpesst4i3v24nqxi3fy5gkr@5rej6zbfadta>
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

On 5/3/23 09:51, Gerd Hoffmann wrote:
> On Mon, May 01, 2023 at 06:38:45PM +0300, Dmitry Osipenko wrote:
>> On 4/16/23 14:52, Dmitry Osipenko wrote:
>>> We have multiple Vulkan context types that are awaiting for the addition
>>> of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:
>>>
>>>  1. Venus context
>>>  2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)
>>>
>>> Mesa core supports DRM sync object UAPI, providing Vulkan drivers with a
>>> generic fencing implementation that we want to utilize.
>>>
>>> This patch adds initial sync objects support. It creates fundament for a
>>> further fencing improvements. Later on we will want to extend the VirtIO-GPU
>>> fencing API with passing fence IDs to host for waiting, it will be a new
>>> additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU context
>>> drivers in works that require VirtIO-GPU to support sync objects UAPI.
>>>
>>> The patch is heavily inspired by the sync object UAPI implementation of the
>>> MSM driver.
>>
>> Gerd, do you have any objections to merging this series?
> 
> No objections.  Can't spot any issues, but I also don't follow drm close
> enough to be able to review the sync object logic in detail.
> 
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks, I'll work with Gurchetan on resolving his questions and will
apply the patches as soon as he'll give his ack.

-- 
Best regards,
Dmitry

