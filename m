Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF98A7797BA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 21:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B99B10E6EF;
	Fri, 11 Aug 2023 19:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A53010E6EE;
 Fri, 11 Aug 2023 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=CxpHLJD8b1kKa3mdU90bugJvyGF/qHOKnV/UVvBTACw=; b=tHFeX7LO+929icxoPpImxsSJBl
 +pMpkiHBRg0aG7n/MQl4yQigEdQqbf/SEvTcw0FO1tlpusRYzjoXG/Q1nFuYKhfp026ZYHZdGOhDJ
 whYdNxYFkX6zwd8eEk+wPqkzmaUT3TJol6nH61NklZrqDShENzlV7I6/WNh/vt9C1Lb3bbL/DLeP6
 kS4oS0n9F78Tdub6czAl5wyEcjcz+XzLXwSS2dr5njOrMKeaJqpzaP+FcKbvueDsSr0nhljs+ofgu
 UIDKgmxnznLQPP5MPSH4TJLHph0VhpeEsd9R8mcxrFkIXUD0P8CKQtwvSY4BX6DORNKN5AYK02C3W
 8jasU5qw==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qUXmd-00BSYh-1H; Fri, 11 Aug 2023 19:26:51 +0000
Message-ID: <6cf56323-2b2b-e4ed-6fa5-2efc4711ca41@infradead.org>
Date: Fri, 11 Aug 2023 12:26:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6] drm/doc: Document DRM device reset expectations
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230811185508.252194-1-andrealmeid@igalia.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230811185508.252194-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/11/23 11:55, André Almeida wrote:
> Create a section that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> ---
> 
> Changes:
>  - Due to substantial changes in the content, dropped Pekka's Acked-by
>  - Grammar fixes (Randy)
>  - Add paragraph about disabling device resets
>  - Add note about integrating reset tracking in drm/sched
>  - Add note that KMD should return failure for contexts affected by
>    resets and UMD should check for this
>  - Add note about lack of consensus around what to do about non-robust
>    apps
> 
> v5: https://lore.kernel.org/dri-devel/20230627132323.115440-1-andrealmeid@igalia.com/
> ---
>  Documentation/gpu/drm-uapi.rst | 77 ++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 65fb3036a580..6bfaf7d4c074 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,83 @@ for GPU1 and GPU2 from different vendors, and a third handler for
>  mmapped regular files. Threads cause additional pain with signal
>  handling as well.
>  
> +Device reset
> +============
> +
> +The GPU stack is really complex and is prone to errors, from hardware bugs,
> +faulty applications and everything in between the many layers. Some errors
> +require resetting the device in order to make the device usable again. This
> +section describes the expectations for DRM and usermode drivers when a
> +device resets and how to propagate the reset status.
> +
> +Device resets can not be disabled without tainting the kernel, which can lead to
> +hanging the entire kernel through shrinkers/mmu_notifiers. Userspace role in
> +device resets is to propagate the message to the application and apply any
> +special policy for blocking guilty applications, if any. Corollary is that
> +debugging a hung GPU context require hardware support to be able to preempt such
> +a GPU context while it's stopped.
> +
> +Kernel Mode Driver
> +------------------
> +
> +The KMD is responsible for checking if the device needs a reset, and to perform
> +it as needed. Usually a hang is detected when a job gets stuck executing. KMD
> +should keep track of resets, because userspace can query any time about the
> +reset status for a specific context. This is needed to propagate to the rest of
> +the stack that a reset has happened. Currently, this is implemented by each
> +driver separately, with no common DRM interface. Ideally this should be properly
> +integrated at DRM scheduler to provide a common ground for all drivers. After a
> +reset, KMD should reject new command submissions for affected contexts.
> +
> +User Mode Driver
> +----------------
> +
> +After command submission, UMD should check if the submission was accepted or
> +rejected. After a reset, KMD should reject submissions, and UMD can issue an
> +ioclt to the KMD to check the reset status, and this can be checked more often

   ioctl

> +if the UMD requires it. After detecting a reset, UMD will then proceed to report
> +it to the application using the appropriate API error code, as explained in the
> +section below about robustness.
> +
> +Robustness
> +----------
> +
> +The only way to try to keep an application working after a reset is if it
> +complies with the robustness aspects of the graphical API that it is using.
> +
> +Graphical APIs provide ways to applications to deal with device resets. However,
> +there is no guarantee that the app will use such features correctly, and a
> +userspace that doesn't support robust interfaces (like an non-robust

                                                     like a

> +OpenGL context or API without any robustness support like libva) leave the
> +robustness handling entirely to the userspace driver. There is no strong
> +community consensus on what the userspace driver should do in that case,
> +since all reasonable approaches have some clear downsides.
> +
> +OpenGL
> +~~~~~~
> +
> +Apps using OpenGL should use the available robust interfaces, like the
> +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES). This
> +interface tells if a reset has happened, and if so, all the context state is
> +considered lost and the app proceeds by creating new ones. There's no consensus
> +on what to do to if robustness is not in use.
> +
> +Vulkan
> +~~~~~~
> +
> +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submissions.
> +This error code means, among other things, that a device reset has happened and
> +it needs to recreate the contexts to keep going.
> +
> +Reporting causes of resets
> +--------------------------
> +
> +Apart from propagating the reset through the stack so apps can recover, it's
> +really useful for driver developers to learn more about what caused the reset in
> +the first place. DRM devices should make use of devcoredump to store relevant
> +information about the reset, so this information can be added to user bug
> +reports.
> +
>  .. _drm_driver_ioctl:
>  
>  IOCTL Support on Device Nodes

-- 
~Randy
