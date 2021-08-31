Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039DB3FCE9F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 22:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252296E08E;
	Tue, 31 Aug 2021 20:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6296E069;
 Tue, 31 Aug 2021 20:35:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="279573537"
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; d="scan'208";a="279573537"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 13:35:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; d="scan'208";a="466579571"
Received: from unerlige-ril-10.jf.intel.com (HELO unerlige-ril-10.165.21.208)
 ([10.165.21.208])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 13:35:50 -0700
Date: Tue, 31 Aug 2021 13:35:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, jason@jlekstrand.net
Subject: Re: [PATCH 8/8] drm/i915/perf: Map OA buffer to user space for gen12
 performance query
Message-ID: <20210831203545.GA15813@unerlige-ril-10.165.21.208>
References: <20210830193851.15607-1-umesh.nerlige.ramappa@intel.com>
 <20210830193851.15607-9-umesh.nerlige.ramappa@intel.com>
 <YS4myWfCp2IP4iFn@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <YS4myWfCp2IP4iFn@phenom.ffwll.local>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

On Tue, Aug 31, 2021 at 02:55:37PM +0200, Daniel Vetter wrote:
>On Mon, Aug 30, 2021 at 12:38:51PM -0700, Umesh Nerlige Ramappa wrote:
>> i915 used to support time based sampling mode which is good for overall
>> system monitoring, but is not enough for query mode used to measure a
>> single draw call or dispatch. Gen9-Gen11 are using current i915 perf
>> implementation for query, but Gen12+ requires a new approach for query
>> based on triggered reports within oa buffer.
>>
>> Triggering reports into the OA buffer is achieved by writing into a
>> a trigger register. Optionally an unused counter/register is set with a
>> marker value such that a triggered report can be identified in the OA
>> buffer. Reports are usually triggered at the start and end of work that
>> is measured.
>>
>> Since OA buffer is large and queries can be frequent, an efficient way
>> to look for triggered reports is required. By knowing the current head
>> and tail offsets into the OA buffer, it is easier to determine the
>> locality of the reports of interest.
>>
>> Current perf OA interface does not expose head/tail information to the
>> user and it filters out invalid reports before sending data to user.
>> Also considering limited size of user buffer used during a query,
>> creating a 1:1 copy of the OA buffer at the user space added undesired
>> complexity.
>>
>> The solution was to map the OA buffer to user space provided
>>
>> (1) that it is accessed from a privileged user.
>> (2) OA report filtering is not used.
>>
>> These 2 conditions would satisfy the safety criteria that the current
>> perf interface addresses.
>
>This is a perf improvement. Please include benchmark numbers to justify
>it.

OA supports 2 mechanisms of perf measurements.

1) query interface where perf countes can be queried.
2) OA buffer use case where counter-snapshots are captured periodically 
and analyzed for performance.

This patch series is actually just (1) query interface implementation 
for discrete and not a perf improvement.

The old mechanism to query OA report (MI_REPORT_PERF_COUNT) is not 
available for all engines. In the new mechanism, a query is triggered 
from a batch by writing to a whitelisted OA trigger register. Once a 
query is triggered, the resulting report is captured in the OA buffer.  
To locate the report quickly, the batch also captures the OA HW tail 
pointer before/after writing to the trigger register. This gives the 
user a window/locality in the OA buffer where the report of interest 
lies.  

For this new mechanism, the current interface to read reports from the 
OA buffer is inefficient since the reads are sequential and reports are 
copied to user buffer.

mmap provides an accurate and faster way to fetch the queried reports 
based on locality.

Note that mmap does not replace the OA buffer use case from (2) which 
still reads reports sequentially to analyze performance.

>
>>
>> To enable the query:
>> - Add an ioctl to expose head and tail to the user
>> - Add an ioctl to return size and offset of the OA buffer
>> - Map the OA buffer to the user space
>>
>> v2:
>> - Improve commit message (Chris)
>> - Do not mmap based on gem object filp. Instead, use perf_fd and support
>>   mmap syscall (Chris)
>> - Pass non-zero offset in mmap to enforce the right object is
>>   mapped (Chris)
>> - Do not expose gpu_address (Chris)
>> - Verify start and length of vma for page alignment (Lionel)
>> - Move SQNTL config out (Lionel)
>>
>> v3: (Chris)
>> - Omit redundant checks
>> - Return VM_FAULT_SIGBUS is old stream is closed
>> - Maintain reference counts to stream in vm_open and vm_close
>> - Use switch to identify object to be mapped
>>
>> v4: Call kref_put on closing perf fd (Chris)
>> v5:
>> - Strip access to OA buffer from unprivileged child of a privileged
>>   parent. Use VM_DONTCOPY
>> - Enforce MAP_PRIVATE by checking for VM_MAYSHARE
>>
>> v6:
>> (Chris)
>> - Use len of -1 in unmap_mapping_range
>> - Don't use stream->oa_buffer.vma->obj in vm_fault_oa
>> - Use kernel block comment style
>> - do_mmap gets a reference to the file and puts it in do_munmap, so
>>   no need to maintain a reference to i915_perf_stream. Hence, remove
>>   vm_open/vm_close and stream->closed hooks/checks.
>> (Umesh)
>> - Do not allow mmap if SAMPLE_OA_REPORT is not set during
>>   i915_perf_open_ioctl.
>> - Drop ioctl returning head/tail since this information is already
>>   whitelisted. Remove hooks to read head register.
>>
>> v7: (Chris)
>> - unmap before destroy
>> - change ioctl argument struct
>>
>> v8: Documentation and more checks (Chris)
>> v9: Fix comment style (Umesh)
>> v10: Update uapi comment (Ashutosh)
>>
>> Signed-off-by: Piotr Maciejewski <piotr.maciejewski@intel.com>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_mman.c |   2 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_mman.h |   2 +
>>  drivers/gpu/drm/i915/i915_perf.c         | 126 ++++++++++++++++++++++-
>>  include/uapi/drm/i915_drm.h              |  33 ++++++
>>  4 files changed, 161 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index 5130e8ed9564..84cdce2ee447 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -213,7 +213,7 @@ compute_partial_view(const struct drm_i915_gem_object *obj,
>>  	return view;
>>  }
>>
>> -static vm_fault_t i915_error_to_vmf_fault(int err)
>> +vm_fault_t i915_error_to_vmf_fault(int err)
>>  {
>>  	switch (err) {
>>  	default:
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
>> index efee9e0d2508..1190a3a228ea 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
>> @@ -29,4 +29,6 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
>>
>>  void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj);
>>
>> +vm_fault_t i915_error_to_vmf_fault(int err);
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
>> index de3d1738aabe..1f8d4f3a2148 100644
>> --- a/drivers/gpu/drm/i915/i915_perf.c
>> +++ b/drivers/gpu/drm/i915/i915_perf.c
>> @@ -192,10 +192,12 @@
>>   */
>>
>>  #include <linux/anon_inodes.h>
>> +#include <linux/mman.h>
>>  #include <linux/sizes.h>
>>  #include <linux/uuid.h>
>>
>>  #include "gem/i915_gem_context.h"
>> +#include "gem/i915_gem_mman.h"
>>  #include "gt/intel_engine_pm.h"
>>  #include "gt/intel_engine_user.h"
>>  #include "gt/intel_execlists_submission.h"
>> @@ -3322,6 +3324,44 @@ static long i915_perf_config_locked(struct i915_perf_stream *stream,
>>  	return ret;
>>  }
>>
>> +#define I915_PERF_OA_BUFFER_MMAP_OFFSET 1
>> +
>> +/**
>> + * i915_perf_oa_buffer_info_locked - size and offset of the OA buffer
>> + * @stream: i915 perf stream
>> + * @cmd: ioctl command
>> + * @arg: pointer to oa buffer info filled by this function.
>> + */
>> +static int i915_perf_oa_buffer_info_locked(struct i915_perf_stream *stream,
>> +					   unsigned int cmd,
>> +					   unsigned long arg)
>> +{
>> +	struct drm_i915_perf_oa_buffer_info info;
>> +	void __user *output = (void __user *)arg;
>> +
>> +	if (i915_perf_stream_paranoid && !perfmon_capable()) {
>> +		DRM_DEBUG("Insufficient privileges to access OA buffer info\n");
>> +		return -EACCES;
>> +	}
>> +
>> +	if (_IOC_SIZE(cmd) != sizeof(info))
>> +		return -EINVAL;
>> +
>> +	if (copy_from_user(&info, output, sizeof(info)))
>> +		return -EFAULT;
>> +
>> +	if (info.type || info.flags || info.rsvd)
>> +		return -EINVAL;
>> +
>> +	info.size = stream->oa_buffer.vma->size;
>> +	info.offset = I915_PERF_OA_BUFFER_MMAP_OFFSET * PAGE_SIZE;
>> +
>> +	if (copy_to_user(output, &info, sizeof(info)))
>> +		return -EFAULT;
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * i915_perf_ioctl_locked - support ioctl() usage with i915 perf stream FDs
>>   * @stream: An i915 perf stream
>> @@ -3347,6 +3387,8 @@ static long i915_perf_ioctl_locked(struct i915_perf_stream *stream,
>>  		return 0;
>>  	case I915_PERF_IOCTL_CONFIG:
>>  		return i915_perf_config_locked(stream, arg);
>> +	case I915_PERF_IOCTL_GET_OA_BUFFER_INFO:
>> +		return i915_perf_oa_buffer_info_locked(stream, cmd, arg);
>>  	}
>>
>>  	return -EINVAL;
>> @@ -3418,6 +3460,14 @@ static int i915_perf_release(struct inode *inode, struct file *file)
>>  	struct i915_perf_stream *stream = file->private_data;
>>  	struct i915_perf *perf = stream->perf;
>>
>> +	/*
>> +	 * User could have multiple vmas from multiple mmaps. We want to zap
>> +	 * them all here. Note that a fresh fault cannot occur as the mmap holds
>> +	 * a reference to the stream via the vma->vm_file, so before user's
>> +	 * munmap, the stream cannot be destroyed.
>> +	 */
>> +	unmap_mapping_range(file->f_mapping, 0, -1, 1);
>> +
>>  	mutex_lock(&perf->lock);
>>  	i915_perf_destroy_locked(stream);
>>  	mutex_unlock(&perf->lock);
>> @@ -3428,6 +3478,75 @@ static int i915_perf_release(struct inode *inode, struct file *file)
>>  	return 0;
>>  }
>>
>> +static vm_fault_t vm_fault_oa(struct vm_fault *vmf)
>> +{
>> +	struct vm_area_struct *vma = vmf->vma;
>> +	struct i915_perf_stream *stream = vma->vm_private_data;
>> +	int err;
>> +
>> +	err = remap_io_sg(vma,
>> +			  vma->vm_start, vma->vm_end - vma->vm_start,
>> +			  stream->oa_buffer.vma->pages->sgl, -1);
>> +
>> +	return i915_error_to_vmf_fault(err);
>> +}
>> +
>> +static const struct vm_operations_struct vm_ops_oa = {
>> +	.fault = vm_fault_oa,
>> +};
>> +
>> +static int i915_perf_mmap(struct file *file, struct vm_area_struct *vma)
>> +{
>> +	struct i915_perf_stream *stream = file->private_data;
>> +
>> +	/* mmap-ing OA buffer to user space MUST absolutely be privileged */
>> +	if (i915_perf_stream_paranoid && !perfmon_capable()) {
>> +		DRM_DEBUG("Insufficient privileges to map OA buffer\n");
>> +		return -EACCES;
>> +	}
>> +
>> +	switch (vma->vm_pgoff) {
>> +	/*
>> +	 * A non-zero offset ensures that we are mapping the right object. Also
>> +	 * leaves room for future objects added to this implementation.
>> +	 */
>> +	case I915_PERF_OA_BUFFER_MMAP_OFFSET:
>> +		if (!(stream->sample_flags & SAMPLE_OA_REPORT))
>> +			return -EINVAL;
>> +
>> +		if (vma->vm_end - vma->vm_start > stream->oa_buffer.vma->size)
>> +			return -EINVAL;
>> +
>> +		/*
>> +		 * Only support VM_READ. Enforce MAP_PRIVATE by checking for
>> +		 * VM_MAYSHARE.
>> +		 */
>> +		if (vma->vm_flags & (VM_WRITE | VM_EXEC |
>> +				     VM_SHARED | VM_MAYSHARE))
>> +			return -EINVAL;
>> +
>> +		vma->vm_flags &= ~(VM_MAYWRITE | VM_MAYEXEC);
>> +
>> +		/*
>> +		 * If the privileged parent forks and child drops root
>> +		 * privilege, we do not want the child to retain access to the
>> +		 * mapped OA buffer. Explicitly set VM_DONTCOPY to avoid such
>> +		 * cases.
>> +		 */
>> +		vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND |
>> +				 VM_DONTDUMP | VM_DONTCOPY;
>> +		break;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>> +	vma->vm_private_data = stream;
>> +	vma->vm_ops = &vm_ops_oa;
>> +
>> +	return 0;
>> +}
>>
>>  static const struct file_operations fops = {
>>  	.owner		= THIS_MODULE,
>> @@ -3440,6 +3559,7 @@ static const struct file_operations fops = {
>>  	 * to handle 32bits compatibility.
>>  	 */
>>  	.compat_ioctl   = i915_perf_ioctl,
>> +	.mmap		= i915_perf_mmap,
>>  };
>>
>>
>> @@ -4639,8 +4759,12 @@ int i915_perf_ioctl_version(void)
>>  	 *
>>  	 *    - OA buffer head/tail/status/buffer registers for read only
>>  	 *    - OA counters A18, A19, A20 for read/write
>> +	 *
>> +	 * 8: Added an option to map oa buffer at umd driver level and trigger
>> +	 *    oa reports within oa buffer from command buffer. See
>> +	 *    I915_PERF_IOCTL_GET_OA_BUFFER_INFO.
>>  	 */
>> -	return 7;
>> +	return 8;
>>  }
>>
>>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index bde5860b3686..2c17fe845604 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -2417,6 +2417,39 @@ struct drm_i915_perf_open_param {
>>   */
>>  #define I915_PERF_IOCTL_CONFIG	_IO('i', 0x2)
>>
>> +/*
>
>Please make this proper kerneldoc. Ideally also fix up all the other perf
>related uapi and also document it all with kerneldoc.
>
>Please make sure the result looks good with
>
>$ make htmldocs

>Also, this is uapi, therefore your patch needs to include
>- link to the igts for this
IGT tests: https://patchwork.freedesktop.org/series/94172/ Patches 1,2

>- link to the userspace MR that uses this (I guess it's mesa?)

For now GPUvis is the userspace for all perf OA interfaces.

GPUvis provides the visualization for OA reports. It has 2 parts
1) It uses perf library from IGT. The perf library changes are here:
IGT: https://patchwork.freedesktop.org/series/94172/ Patches 3,4 and 5.

2) GPUvis changes:
https://github.com/unerlige/gpuvis/commit/1c19c134a64564f7b8d7ca3b46449324040a40be
Should I create an MR for GPUvis while this kernel patch and (1) are not 
yet merged? Please advise.

Thanks,
Umesh

>
>Cheers, Daniel
>
>> + * Returns OA buffer properties to be used with mmap.
>> + *
>> + * This ioctl is available in perf revision 8.
>> + */
>> +#define I915_PERF_IOCTL_GET_OA_BUFFER_INFO _IOWR('i', 0x3, struct drm_i915_perf_oa_buffer_info)
>> +
>> +/*
>> + * OA buffer size and offset.
>> + *
>> + * OA output buffer
>> + *   type: 0
>> + *   flags: mbz
>> + *
>> + *   After querying the info, pass (size,offset) to mmap(),
>> + *
>> + *   mmap(0, info.size, PROT_READ, MAP_PRIVATE, perf_fd, info.offset).
>> + *
>> + *   Note that only a private (not shared between processes, or across fork())
>> + *   read-only mmapping is allowed.
>> + *
>> + *   HW is continually writing data to the mapped  OA buffer and it conforms to
>> + *   the OA format as specified by user config. The buffer provides reports that
>> + *   have OA counters - A, B and C.
>> + */
>> +struct drm_i915_perf_oa_buffer_info {
>> +	__u32 type;   /* in */
>> +	__u32 flags;  /* in */
>> +	__u64 size;   /* out */
>> +	__u64 offset; /* out */
>> +	__u64 rsvd;   /* mbz */
>> +};
>> +
>>  /*
>>   * Common to all i915 perf records
>>   */
>> --
>> 2.20.1
>>
>
>-- 
>Daniel Vetter
>Software Engineer, Intel Corporation
GPUvis pro
>http://blog.ffwll.ch
