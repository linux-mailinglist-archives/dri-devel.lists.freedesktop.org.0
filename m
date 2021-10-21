Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBF2436583
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 17:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D3A6EC93;
	Thu, 21 Oct 2021 15:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D7E6E3F0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 09:55:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: mwezdeck) with ESMTPSA id 995A31F444DD
Subject: Re: drm/virtio: not pin pages on demand
To: Gerd Hoffmann <kraxel@redhat.com>,
 Maksym Wezdecki <maksym.wezdecki@collabora.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <20211021074445.452309-1-maksym.wezdecki@collabora.com>
 <20211021092535.ozafsijlakj7ccwc@sirius.home.kraxel.org>
From: Maksym Wezdecki <maksym.wezdecki@collabora.co.uk>
Message-ID: <327a5c8a-d82d-f115-27bb-37125affe24b@collabora.co.uk>
Date: Thu, 21 Oct 2021 11:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211021092535.ozafsijlakj7ccwc@sirius.home.kraxel.org>
Content-Type: multipart/alternative;
 boundary="------------8CC5D9E0273EAE42D6B6D8E2"
Content-Language: en-US
X-Mailman-Approved-At: Thu, 21 Oct 2021 15:13:16 +0000
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

This is a multi-part message in MIME format.
--------------8CC5D9E0273EAE42D6B6D8E2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I get your point. However, we need to make resource_create ioctl,
in order to create corresponding resource on the host.

The concept is:
App           |    Gallium       |       Guest kernel                   What is happening?
init()              ...                    ...           
glTexImage2d:                                                           [PIPE_DISCARD_WHOLE_RESOURCE]
             -> resource_create() -> DRM_IOCTL_VIRTGPU_RESOURCE_CREATE 
                                   -> virtio_gpu_object_create():
                                   -> drm_gem_shmem_create()            [allocation of bo#1]
                                   -> virtio_gpu_smd_resource_create_3d [sending cmd to crosvm/qemu
                                                                         to create GL object]
             -> texture_map()                                           [staging buffer is selected]
             -> memcpy()                                                [memcpy from user's mem to staging buffer]
             -> texture_unmap()                                         [VIRGL_CCMD_COPY_TRANSFER3D with staging buffer]

Selecting staging buffer for texture uploads from guest to host
and not pinning resources in DRM_IOCTL_VIRTGPU_RESOURCE_CREATE can
save a lot of RAM. With previous approach we always create resource,
we upload from guest to host and we never unpin pages, which causes
high RAM usage by the guest. With proposed approach, we create resource,
we decide that for textures we won't pin pages, we select staging
buffer (which is recycled then) for uploads. This causes lower memory
consumption.

With best regards,
Maksym 

On 10/21/21 11:25 AM, Gerd Hoffmann wrote:
> On Thu, Oct 21, 2021 at 09:44:45AM +0200, Maksym Wezdecki wrote:
>> From: mwezdeck <maksym.wezdecki@collabora.co.uk>
>>
>> The idea behind the commit:
>>   1. when resource is created, let user space decide
>>      if resource should be pinned or not
>>   2. transfer_*_host needs pinned memory. If it is not
>>      pinned, then pin it.
>>   3. during execbuffer, decide which bo handles should
>>      be pinned based on the list provided by user space
> When you never need cpu access to your gpu object there is
> no need to create a resource in the first place.
>
> take care,
>   Gerd
>

--------------8CC5D9E0273EAE42D6B6D8E2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>I get your point. However, we need to make resource_create ioctl,
in order to create corresponding resource on the host.

The concept is:
App           |    Gallium       |       Guest kernel                   What is happening?
init()              ...                    ...           
glTexImage2d:                                                           [PIPE_DISCARD_WHOLE_RESOURCE]
             -&gt; resource_create() -&gt; DRM_IOCTL_VIRTGPU_RESOURCE_CREATE 
                                   -&gt; virtio_gpu_object_create():
                                   -&gt; drm_gem_shmem_create()            [allocation of bo#1]
                                   -&gt; virtio_gpu_smd_resource_create_3d [sending cmd to crosvm/qemu
                                                                         to create GL object]
             -&gt; texture_map()                                           [staging buffer is selected]
             -&gt; memcpy()                                                [memcpy from user's mem to staging buffer]
             -&gt; texture_unmap()                                         [VIRGL_CCMD_COPY_TRANSFER3D with staging buffer]

Selecting staging buffer for texture uploads from guest to host
and not pinning resources in DRM_IOCTL_VIRTGPU_RESOURCE_CREATE can
save a lot of RAM. With previous approach we always create resource,
we upload from guest to host and we never unpin pages, which causes
high RAM usage by the guest. With proposed approach, we create resource,
we decide that for textures we won't pin pages, we select staging
buffer (which is recycled then) for uploads. This causes lower memory
consumption.

With best regards,
Maksym 
</pre>
    <div class="moz-cite-prefix">On 10/21/21 11:25 AM, Gerd Hoffmann
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20211021092535.ozafsijlakj7ccwc@sirius.home.kraxel.org">
      <pre class="moz-quote-pre" wrap="">On Thu, Oct 21, 2021 at 09:44:45AM +0200, Maksym Wezdecki wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: mwezdeck <a class="moz-txt-link-rfc2396E" href="mailto:maksym.wezdecki@collabora.co.uk">&lt;maksym.wezdecki@collabora.co.uk&gt;</a>

The idea behind the commit:
  1. when resource is created, let user space decide
     if resource should be pinned or not
  2. transfer_*_host needs pinned memory. If it is not
     pinned, then pin it.
  3. during execbuffer, decide which bo handles should
     be pinned based on the list provided by user space
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
When you never need cpu access to your gpu object there is
no need to create a resource in the first place.

take care,
  Gerd

</pre>
    </blockquote>
  </body>
</html>

--------------8CC5D9E0273EAE42D6B6D8E2--
