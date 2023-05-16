Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5906D705922
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 22:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6135510E0D0;
	Tue, 16 May 2023 20:52:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9250E10E0D0;
 Tue, 16 May 2023 20:52:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDF9C6387B;
 Tue, 16 May 2023 20:52:25 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id A1048C433EF;
 Tue, 16 May 2023 20:52:23 +0000 (UTC)
Date: Tue, 16 May 2023 16:52:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915: Dump error capture to
 kernel log
Message-ID: <ZGPs/HyLdNVBh/At@rdvivi-mobl4>
References: <20230418181744.3251240-1-John.C.Harrison@Intel.com>
 <20230418181744.3251240-2-John.C.Harrison@Intel.com>
 <696ba7f2-4353-e154-af0b-83604dda2546@intel.com>
 <61e0ef39-308b-7384-d5db-8cad2a152729@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61e0ef39-308b-7384-d5db-8cad2a152729@intel.com>
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
Cc: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 12:21:05PM -0700, John Harrison wrote:
>    On 5/16/2023 12:17, Belgaumkar, Vinay wrote:                                 
>                                                                                 
>    > On 4/18/2023 11:17 AM, [1]John.C.Harrison@Intel.com wrote:                 
>                                                                                 
>    >> From: John Harrison [2]<John.C.Harrison@Intel.com>                        
>                                                                                 
>    >> This is useful for getting debug information out in certain               
>    >> situations, such as failing kernel selftests and CI runs that don't       
>    >> log error captures. It is especially useful for things like retrieving    
>    >> GuC logs as GuC operation can't be tracked by adding printk or ftrace     
>    >> entries.                                                                  
>                                                                                 
>    >> v2: Add CONFIG_DRM_I915_DEBUG_GEM wrapper (review feedback by Rodrigo).   

Thanks

>                                                                                 
>    > Do the CI sparse warnings hold water? With that looked at,                 
>                                                                                 
>    You mean this one totally fatal and absolutely must be fixed error?          
>                                                                                 
>    Fast mode used, each commit won't be checked separately.                     

You should never rely on this assumption. There are bisects and autobisects
out there. Also every patch needs to be independently available for backport.

So, if there's any issue it needs to be fix before we merge.

>                                                                                 
>    Does anyone even know what that means or why it (apparently totally          
>    randomly) hits some patch sets and not others?                               
>                                                                                 
>    If you mean the checkpatch warnings. One is about not reporting out of       
>    memory errors (because you are supposed to return -ENOMEM and let the user   
>    handle it instead), but that doesn't apply for an internal kernel only       
>    thing which is already just a debug print. The other is about macro          
>    argument re-use, which is not an issue in this case and not worth            
>    re-writing the code to avoid.                                                
>                                                                                 
>    John.                                                                        
>                                                                                 
>    > LGTM,                                                                      
>                                                                                 
>    > Reviewed-by: Vinay Belgaumkar [3]<vinay.belgaumkar@intel.com>              
>                                                                                 
>    >> Signed-off-by: John Harrison [4]<John.C.Harrison@Intel.com>               
>    >> ---                                                                       
>    >>   drivers/gpu/drm/i915/i915_gpu_error.c | 132                             
>    >> ++++++++++++++++++++++++++                                                
>    >>   drivers/gpu/drm/i915/i915_gpu_error.h |  10 ++                          
>    >>   2 files changed, 142 insertions(+)                                      
>                                                                                 
>    >> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c                        
>    >> b/drivers/gpu/drm/i915/i915_gpu_error.c                                   
>    >> index f020c0086fbcd..03d62c250c465 100644                                 
>    >> --- a/drivers/gpu/drm/i915/i915_gpu_error.c                               
>    >> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c                               
>    >> @@ -2219,3 +2219,135 @@ void i915_disable_error_state(struct              
>    >> drm_i915_private *i915, int err)                                          
>    >>           i915->gpu_error.first_error = ERR_PTR(err);                     
>    >>       spin_unlock_irq(&i915->gpu_error.lock);                             
>    >>   }                                                                       
>    >> +                                                                         
>    >> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)                                
>    >> +void intel_klog_error_capture(struct intel_gt *gt,                       
>    >> +                  intel_engine_mask_t engine_mask)                       
>    >> +{                                                                        
>    >> +    static int g_count;                                                  
>    >> +    struct drm_i915_private *i915 = gt->i915;                            
>    >> +    struct i915_gpu_coredump *error;                                     
>    >> +    intel_wakeref_t wakeref;                                             
>    >> +    size_t buf_size = PAGE_SIZE * 128;                                   
>    >> +    size_t pos_err;                                                      
>    >> +    char *buf, *ptr, *next;                                              
>    >> +    int l_count = g_count++;                                             
>    >> +    int line = 0;                                                        
>    >> +                                                                         
>    >> +    /* Can't allocate memory during a reset */                           
>    >> +    if (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {                
>    >> +        drm_err(&gt->i915->drm, "[Capture/%d.%d] Inside GT reset,        
>    >> skipping error capture :(\n",                                             
>    >> +            l_count, line++);                                            
>    >> +        return;                                                          
>    >> +    }                                                                    
>    >> +                                                                         
>    >> +    error = READ_ONCE(i915->gpu_error.first_error);                      
>    >> +    if (error) {                                                         
>    >> +        drm_err(&i915->drm, "[Capture/%d.%d] Clearing existing error     
>    >> capture first...\n",                                                      
>    >> +            l_count, line++);                                            
>    >> +        i915_reset_error_state(i915);                                    
>    >> +    }                                                                    
>    >> +                                                                         
>    >> +    with_intel_runtime_pm(&i915->runtime_pm, wakeref)                    
>    >> +        error = i915_gpu_coredump(gt, engine_mask,                       
>    >> CORE_DUMP_FLAG_NONE);                                                     
>    >> +                                                                         
>    >> +    if (IS_ERR(error)) {                                                 
>    >> +        drm_err(&i915->drm, "[Capture/%d.%d] Failed to capture error     
>    >> capture: %ld!\n",                                                         
>    >> +            l_count, line++, PTR_ERR(error));                            
>    >> +        return;                                                          
>    >> +    }                                                                    
>    >> +                                                                         
>    >> +    buf = kvmalloc(buf_size, GFP_KERNEL);                                
>    >> +    if (!buf) {                                                          
>    >> +        drm_err(&i915->drm, "[Capture/%d.%d] Failed to allocate buffer   
>    >> for error capture!\n",                                                    
>    >> +            l_count, line++);                                            
>    >> +        i915_gpu_coredump_put(error);                                    
>    >> +        return;                                                          
>    >> +    }                                                                    
>    >> +                                                                         
>    >> +    drm_info(&i915->drm, "[Capture/%d.%d] Dumping i915 error capture     
>    >> for %ps...\n",                                                            
>    >> +         l_count, line++, __builtin_return_address(0));                  
>    >> +                                                                         
>    >> +    /* Largest string length safe to print via dmesg */                  
>    >> +#    define MAX_CHUNK    800                                             
>    >> +                                                                         
>    >> +    pos_err = 0;                                                         
>    >> +    while (1) {                                                          
>    >> +        ssize_t got = i915_gpu_coredump_copy_to_buffer(error, buf,       
>    >> pos_err, buf_size - 1);                                                   
>    >> +                                                                         
>    >> +        if (got <= 0)                                                    
>    >> +            break;                                                       
>    >> +                                                                         
>    >> +        buf[got] = 0;                                                    
>    >> +        pos_err += got;                                                  
>    >> +                                                                         
>    >> +        ptr = buf;                                                       
>    >> +        while (got > 0) {                                                
>    >> +            size_t count;                                                
>    >> +            char tag[2];                                                 
>    >> +                                                                         
>    >> +            next = strnchr(ptr, got, '\n');                              
>    >> +            if (next) {                                                  
>    >> +                count = next - ptr;                                      
>    >> +                *next = 0;                                               
>    >> +                tag[0] = '>';                                            
>    >> +                tag[1] = '<';                                            
>    >> +            } else {                                                     
>    >> +                count = got;                                             
>    >> +                tag[0] = '}';                                            
>    >> +                tag[1] = '{';                                            
>    >> +            }                                                            
>    >> +                                                                         
>    >> +            if (count > MAX_CHUNK) {                                     
>    >> +                size_t pos;                                              
>    >> +                char *ptr2 = ptr;                                        
>    >> +                                                                         
>    >> +                for (pos = MAX_CHUNK; pos < count; pos += MAX_CHUNK) {   
>    >> +                    char chr = ptr[pos];                                 
>    >> +                                                                         
>    >> +                    ptr[pos] = 0;                                        
>    >> +                    drm_info(&i915->drm, "[Capture/%d.%d] }%s{\n",       
>    >> +                         l_count, line++, ptr2);                         
>    >> +                    ptr[pos] = chr;                                      
>    >> +                    ptr2 = ptr + pos;                                    
>    >> +                                                                         
>    >> +                    /*                                                   
>    >> +                     * If spewing large amounts of data via a serial     
>    >> console,                                                                  
>    >> +                     * this can be a very slow process. So be friendly   
>    >> and try                                                                   
>    >> +                     * not to cause 'softlockup on CPU' problems.        
>    >> +                     */                                                  
>    >> +                    cond_resched();                                      
>    >> +                }                                                        
>    >> +                                                                         
>    >> +                if (ptr2 < (ptr + count))                                
>    >> +                    drm_info(&i915->drm, "[Capture/%d.%d] %c%s%c\n",     
>    >> +                         l_count, line++, tag[0], ptr2, tag[1]);         
>    >> +                else if (tag[0] == '>')                                  
>    >> +                    drm_info(&i915->drm, "[Capture/%d.%d] ><\n",         
>    >> +                         l_count, line++);                               
>    >> +            } else {                                                     
>    >> +                drm_info(&i915->drm, "[Capture/%d.%d] %c%s%c\n",         
>    >> +                     l_count, line++, tag[0], ptr, tag[1]);              
>    >> +            }                                                            
>    >> +                                                                         
>    >> +            ptr = next;                                                  
>    >> +            got -= count;                                                
>    >> +            if (next) {                                                  
>    >> +                ptr++;                                                   
>    >> +                got--;                                                   
>    >> +            }                                                            
>    >> +                                                                         
>    >> +            /* As above. */                                              
>    >> +            cond_resched();                                              
>    >> +        }                                                                
>    >> +                                                                         
>    >> +        if (got)                                                         
>    >> +            drm_info(&i915->drm, "[Capture/%d.%d] Got %zd bytes          
>    >> remaining!\n",                                                            
>    >> +                 l_count, line++, got);                                  
>    >> +    }                                                                    
>    >> +                                                                         
>    >> +    kvfree(buf);                                                         
>    >> +                                                                         
>    >> +    drm_info(&i915->drm, "[Capture/%d.%d] Dumped %zd bytes\n",           
>    >> l_count, line++, pos_err);                                                
>    >> +}                                                                        
>    >> +#endif                                                                   
>    >> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h                        
>    >> b/drivers/gpu/drm/i915/i915_gpu_error.h                                   
>    >> index a91932cc65317..a78c061ce26fb 100644                                 
>    >> --- a/drivers/gpu/drm/i915/i915_gpu_error.h                               
>    >> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h                               
>    >> @@ -258,6 +258,16 @@ static inline u32 i915_reset_engine_count(struct     
>    >> i915_gpu_error *error,                                                    
>    >>   #define CORE_DUMP_FLAG_NONE           0x0                               
>    >>   #define CORE_DUMP_FLAG_IS_GUC_CAPTURE BIT(0)                            
>    >>   +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) &&                       
>    >> IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)                                     
>    >> +void intel_klog_error_capture(struct intel_gt *gt,                       
>    >> +                  intel_engine_mask_t engine_mask);                      
>    >> +#else                                                                    
>    >> +static inline void intel_klog_error_capture(struct intel_gt *gt,         
>    >> +                        intel_engine_mask_t engine_mask)                 
>    >> +{                                                                        
>    >> +}                                                                        
>    >> +#endif                                                                   
>    >> +                                                                         
>    >>   #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)                           
>    >>     __printf(2, 3)                                                        
> 
> References
> 
>    Visible links
>    1. mailto:John.C.Harrison@intel.com
>    2. mailto:John.C.Harrison@intel.com
>    3. mailto:vinay.belgaumkar@intel.com
>    4. mailto:John.C.Harrison@intel.com
