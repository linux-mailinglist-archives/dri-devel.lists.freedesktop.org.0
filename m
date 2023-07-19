Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CEC759A2B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 17:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140AF10E4D3;
	Wed, 19 Jul 2023 15:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6522510E4D3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689781790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIs1+OeC7xY5Px8k4Oh0JXDET+KMNKzjvphGrBCnx5U=;
 b=DhY03SyjfsoTQ/YP2f1xBV0QYazT52zXeutAxdgw8kZen8bpB3buhxVG3W3QWIC5loryyV
 Eb7N7gLs8ZHC2G4LTR2VtuEs22yDCJ6RLYkb+6aC0ZW56o28GWQjqwfggnJtz2bAnbyeM5
 s2HVwIzfZcCaJxAtQTxoWtk0Qh9RzPw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-gICBU-V8Mbm8vekOpHVw6A-1; Wed, 19 Jul 2023 11:49:49 -0400
X-MC-Unique: gICBU-V8Mbm8vekOpHVw6A-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-992e6840901so121001266b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689781788; x=1692373788;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IIs1+OeC7xY5Px8k4Oh0JXDET+KMNKzjvphGrBCnx5U=;
 b=O/j3IRMcf1qn45GSjwalxwnPbzzUiGYmLb97tIrlm0CubdIUrl/Eaf5kxQQslmLvZd
 TFd4iECnakOO0TF5MipSeVnyJAdDOE72weNisVXHxMPG/Wkk1z5ZfjLn5xttcujAZv7z
 Zg+bsliyQtEhsmaCeuAeAQIPUoGecm+pPte49nzs7+FVBl0mn1B86dO/s3HLKUspHSvR
 3qs9EhJ1pU78HD8yHk3bf3bvftlKG0KhdppJ9wMaJXR1/tNhjzxnRtjkBFJMbuHjje+f
 6VX7iKTBfoq6VugaSp1Bq5CJEC5WaEfkbSeRcIrSMd+hfBZAEXOonjW3OaLaJHYZFB2E
 a92A==
X-Gm-Message-State: ABy/qLaKzDogn9sGajXxoaQ5F7qiupZICfd8Ho1b++UPiCAD1Giv4Df/
 Ov4+uQFUBiSFIfW8hDAyG19S0Tl+dVGFHX7UuEE2F3pRB4q9+njkqqj+J4baqKmPCOcQmdpPLHB
 ISsxf4dBrlmN8WV/vxnLqibZ8VMgA
X-Received: by 2002:a17:906:5195:b0:994:1805:1fad with SMTP id
 y21-20020a170906519500b0099418051fadmr2933927ejk.10.1689781787943; 
 Wed, 19 Jul 2023 08:49:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGQL1Dj9k25VVJZws0W/1xc6x1SGhyLAgn1JiyYhHtZBXW7L/qfpybCi7Tx38pKd+P+6CmdVA==
X-Received: by 2002:a17:906:5195:b0:994:1805:1fad with SMTP id
 y21-20020a170906519500b0099418051fadmr2933899ejk.10.1689781787590; 
 Wed, 19 Jul 2023 08:49:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a1709063b8900b00992e51fecfbsm2549039ejf.64.2023.07.19.08.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 08:49:47 -0700 (PDT)
Message-ID: <955bc56a-6cfa-447a-31a9-2b35d8b23149@redhat.com>
Date: Wed, 19 Jul 2023 16:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5] Documentation/gpu: Add a VM_BIND async draft document
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20230715154543.13183-1-thomas.hellstrom@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230715154543.13183-1-thomas.hellstrom@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>,
 intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/15/23 17:45, Thomas Hellström wrote:
> Add a motivation for and description of asynchronous VM_BIND operation
> 
> v2:
> - Fix typos (Nirmoy Das)
> - Improve the description of a memory fence (Oak Zeng)
> - Add a reference to the document in the Xe RFC.
> - Add pointers to sample uAPI suggestions
> v3:
> - Address review comments (Danilo Krummrich)
> - Formatting fixes
> v4:
> - Address typos (Francois Dugast)
> - Explain why in-fences are not allowed for VM_BIND operations for long-
>    running workloads (Matthew Brost)
> v5:
> - More typo- and style fixing
> - Further clarify the implications of disallowing in-fences for VM_BIND
>    operations for long-running workloads (Matthew Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   Documentation/gpu/drm-vm-bind-async.rst | 171 ++++++++++++++++++++++++
>   Documentation/gpu/rfc/xe.rst            |   4 +-
>   2 files changed, 173 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
> 
> diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
> new file mode 100644
> index 000000000000..d2b02a38198a
> --- /dev/null
> +++ b/Documentation/gpu/drm-vm-bind-async.rst
> @@ -0,0 +1,171 @@
> +====================
> +Asynchronous VM_BIND
> +====================
> +
> +Nomenclature:
> +=============
> +
> +* ``VRAM``: On-device memory. Sometimes referred to as device local memory.
> +
> +* ``gpu_vm``: A GPU address space. Typically per process, but can be shared by
> +  multiple processes.

Again, pretty obvious, but I suggest to be explicit "GPU virtual address 
space".

Also, you might want to remove "draft" from the patch subject.

Otherwise: Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> +
> +* ``VM_BIND``: An operation or a list of operations to modify a gpu_vm using
> +  an IOCTL. The operations include mapping and unmapping system- or
> +  VRAM memory.
> +
> +* ``syncobj``: A container that abstracts synchronization objects. The
> +  synchronization objects can be either generic, like dma-fences or
> +  driver specific. A syncobj typically indicates the type of the
> +  underlying synchronization object.
> +
> +* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
> +  for these before starting.
> +
> +* ``out-syncobj``: Argument to a VM_BIND_IOCTL, the VM_BIND operation
> +  signals these when the bind operation is complete.
> +
> +* ``memory fence``: A synchronization object, different from a dma-fence.
> +  A memory fence uses the value of a specified memory location to determine
> +  signaled status. A memory fence can be awaited and signaled by both
> +  the GPU and CPU. Memory fences are sometimes referred to as
> +  user-fences, userspace-fences or gpu futexes and do not necessarily obey
> +  the dma-fence rule of signaling within a "reasonable amount of time".
> +  The kernel should thus avoid waiting for memory fences with locks held.
> +
> +* ``long-running workload``: A workload that may take more than the
> +  current stipulated dma-fence maximum signal delay to complete and
> +  which therefore needs to set the gpu_vm or the GPU execution context in
> +  a certain mode that disallows completion dma-fences.
> +
> +* ``exec function``: An exec function is a function that revalidates all
> +  affected gpu_vmas, submits a GPU command batch and registers the
> +  dma_fence representing the GPU command's activity with all affected
> +  dma_resvs. For completeness, although not covered by this document,
> +  it's worth mentioning that an exec function may also be the
> +  revalidation worker that is used by some drivers in compute /
> +  long-running mode.
> +
> +* ``bind context``: A context identifier used for the VM_BIND
> +  operation. VM_BIND operations that use the same bind context can be
> +  assumed, where it matters, to complete in order of submission. No such
> +  assumptions can be made for VM_BIND operations using separate bind contexts.
> +
> +* ``UMD``: User-mode driver.
> +
> +* ``KMD``: Kernel-mode driver.
> +
> +
> +Synchronous / Asynchronous VM_BIND operation
> +============================================
> +
> +Synchronous VM_BIND
> +___________________
> +With Synchronous VM_BIND, the VM_BIND operations all complete before the
> +IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
> +out-fences. Synchronous VM_BIND may block and wait for GPU operations;
> +for example swap-in or clearing, or even previous binds.
> +
> +Asynchronous VM_BIND
> +____________________
> +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
> +IOCTL may return immediately, the VM_BIND operations wait for the in-syncobjs
> +before modifying the GPU page-tables, and signal the out-syncobjs when
> +the modification is done in the sense that the next exec function that
> +awaits for the out-syncobjs will see the change. Errors are reported
> +synchronously assuming that the asynchronous part of the job never errors.
> +In low-memory situations the implementation may block, performing the
> +VM_BIND synchronously, because there might not be enough memory
> +immediately available for preparing the asynchronous operation.
> +
> +If the VM_BIND IOCTL takes a list or an array of operations as an argument,
> +the in-syncobjs needs to signal before the first operation starts to
> +execute, and the out-syncobjs signal after the last operation
> +completes. Operations in the operation list can be assumed, where it
> +matters, to complete in order.
> +
> +Since asynchronous VM_BIND operations may use dma-fences embedded in
> +out-syncobjs and internally in KMD to signal bind completion,  any
> +memory fences given as VM_BIND in-fences need to be awaited
> +synchronously before the VM_BIND ioctl returns, since dma-fences,

IOCTL

> +required to signal in a reasonable amount of time, can never be made
> +to depend on memory fences that don't have such a restriction.
> +
> +To aid in supporting user-space queues, the VM_BIND may take a bind context.
> +
> +The purpose of an Asynchronous VM_BIND operation is for user-mode
> +drivers to be able to pipeline interleaved gpu_vm modifications and
> +exec functions. For long-running workloads, such pipelining of a bind
> +operation is not allowed and any in-fences need to be awaited
> +synchronously. The reason for this is twofold. First, any memory
> +fences gated by a long-running workload and used as in-syncobjs for the
> +VM_BIND operation will need to be awaited synchronously anyway (see
> +above). Second, any dma-fences used as in-syncobjs for VM_BIND
> +operations for long-running workloads will not allow for pipelining
> +anyway since long-running workloads don't allow for dma-fences as
> +out-syncobjs, so while theoretically possible the use of them is
> +questionable and should be rejected until there is a valuable use-case.
> +Note that this is not a limitation imposed by dma-fence rules, but
> +rather a limitation imposed to keep KMD implementation simple. It does
> +not affect using dma-fences as dependencies for the long-running
> +workload itself, which is allowed by dma-fence rules, but rather for
> +the VM_BIND operation only.
> +
> +Also for VM_BINDS for long-running gpu_vms the user-mode driver should typically
> +select memory fences as out-fences since that gives greater flexibility for
> +the kernel mode driver to inject other operations into the bind /
> +unbind operations. Like for example inserting breakpoints into batch
> +buffers. The workload execution can then easily be pipelined behind
> +the bind completion using the memory out-fence as the signal condition
> +for a GPU semaphore embedded by UMD in the workload.
> +
> +Multi-operation VM_BIND IOCTL error handling and interrupts
> +===========================================================
> +
> +The VM_BIND operations of the IOCTL may error due to lack of resources
> +to complete and also due to interrupted waits. In both situations UMD
> +should preferably restart the IOCTL after taking suitable action. If
> +UMD has over-committed a memory resource, an -ENOSPC error will be
> +returned, and UMD may then unbind resources that are not used at the
> +moment and restart the IOCTL. On -EINTR, UMD should simply restart the
> +IOCTL and on -ENOMEM user-space may either attempt to free known
> +system memory resources or abort the operation. If aborting as a
> +result of a failed operation in a list of operations, some operations
> +may still have completed, and to get back to a known state, user-space
> +should therefore attempt to unbind all virtual memory regions touched
> +by the failing IOCTL.
> +Unbind operations are guaranteed not to cause any errors due to
> +resource constraints.
> +In between a failed VM_BIND IOCTL and a successful restart there may
> +be implementation defined restrictions on the use of the gpu_vm. For a
> +description why, please see KMD implementation details under `error
> +state saving`_.
> +
> +Sample uAPI implementations
> +===========================
> +Suggested uAPI implementations at the moment of writing can be found for
> +the Nouveau driver `here
> +<https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6>`_.
> +and for the Xe driver `here
> +<https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_drm.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7>`_.
> +
> +KMD implementation details
> +==========================
> +
> +Error state saving
> +__________________
> +Open: When the VM_BIND IOCTL returns an error, some or even parts of
> +an operation may have been completed. If the IOCTL is restarted, in
> +order to know where to restart, the KMD can either put the gpu_vm in
> +an error state and save one instance of the needed restart state
> +internally. In this case, KMD needs to block further modifications of
> +the gpu_vm state that may cause additional failures requiring a
> +restart state save, until the error has been fully resolved. If the
> +uAPI instead defines a pointer to a UMD allocated cookie in the IOCTL
> +struct, it could also choose to store the restart state in that cookie.
> +
> +The restart state may, for example, be the number of successfully
> +completed operations.
> +
> +Easiest for UMD would of course be if KMD did a full unwind on error
> +so that no error state needs to be saved.
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> index 2516fe141db6..0f062e1346d2 100644
> --- a/Documentation/gpu/rfc/xe.rst
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
>   possible ways.
>   
>   As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
> -various flavors, error handling and a sample API should be documented here or in
> -a separate document pointed to by this document.
> +various flavors, error handling and sample API suggestions are documented in
> +Documentation/gpu/drm-vm-bind-async.rst
>   
>   Userptr integration and vm_bind
>   -------------------------------

