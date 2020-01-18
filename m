Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BED142651
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03AB6E867;
	Mon, 20 Jan 2020 08:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5276E13F;
 Sat, 18 Jan 2020 21:02:34 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 9E4E33E8F8;
 Sat, 18 Jan 2020 21:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
 s=default; t=1579381352;
 bh=tYvsyrCqD4e+2GQsK+s0EYAl6OMxJfsNFiwg29ZEvyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I5eC8C1NA+C2z3nNd5BdQ4GV+pgLF3desVnqrppsiZZdEh8qMr8r0LOBjyvUyNhBW
 VQRUsOqRNSHYVz5muRR3CQjHUlyL6ujmN31pdDW21ZXSIpzSqBZyrTy3JjvwpCQR91
 e8BMYCllrp7sei6OAB16UOB4S1EiIBnQdXBnM6XQ=
Date: Sat, 18 Jan 2020 16:02:32 -0500
From: Brian Masney <masneyb@onstation.org>
To: jeffrey.l.hugo@gmail.com, robdclark@gmail.com
Subject: Re: [PATCH RFC v2] drm/msm/mdp5: enable autorefresh
Message-ID: <20200118210232.GA32765@onstation.org>
References: <20191230020053.26016-1-masneyb@onstation.org>
 <20191230020053.26016-2-masneyb@onstation.org>
 <20200101035027.GA9348@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200101035027.GA9348@onstation.org>
X-Mailman-Approved-At: Mon, 20 Jan 2020 08:58:36 +0000
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
Cc: sean@poorly.run, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 31, 2019 at 10:50:27PM -0500, Brian Masney wrote:
> On Sun, Dec 29, 2019 at 09:00:53PM -0500, Brian Masney wrote:
> > Since the introduction of commit 2d99ced787e3 ("drm/msm: async commit
> > support"), command-mode panels began throwing the following errors:
> > 
> >     msm fd900000.mdss: pp done time out, lm=0
> > 
> > Let's fix this by enabling the autorefresh feature that's available in
> > the MDP starting at version 1.0. This will cause the MDP to
> > automatically send a frame to the panel every time the panel invokes the
> > TE signal, which will trigger the PP_DONE IRQ. This requires only
> > sending a single START signal for command-mode panels.
> > 
> > This gives us a counter for command-mode panels that we can use to
> > implement async commit support for the MDP5 in a follow up patch.
> > 
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > Suggested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > Fixes: 2d99ced787e3 ("drm/msm: async commit support")
> > ---
> > Changes since v1:
> > - Send a single start command to kick off the pipeline.
> > 
> > The reason I marked this patch as a RFC is that the display during some
> > small percentage of boots will stop updating after a minute or so, and
> > the ping pong IRQs stop. Most of the time it works with no issues and I
> > haven't been able to find a way to reproduce the issue. I tried
> > suspending the phone by toggling /sys/power/state since I thought that
> > the issue could potentially be related to power management.
> 
> After working to get the IOMMU up on msm8974, I suspect that the issue
> that I describe above is caused by a device probe deferral, which
> explains the intermittent nature of what I'm seeing. First driver load
> sets up the autorefresh registers, sends a single START signal, then a
> -EPROBE_DEFER is thrown later on. Second driver load lost the state, and
> sends a second START signal and overloads the DSI.

The issue was not caused by an -EPROBE_DEFER error. The most consistent
way that I've found to reproduce the issue is to compile the MSM DRM
driver into the kernel (not as a module), boot the phone, don't change
the screen contents, and after ~2 minutes the 'pp done time out'
warnings start. I enabled all DRM debug information and included at the
bottom of my message the relevant messages from dmesg at the point where
the IRQs stop.

I feel like I'm at a dead end on this since I'm not too familiar with
this particular hardware and there's no publicly-available documents.
Unless anyone has any suggestions for other things to try, I'm planning
to stop looking into this issue and will instead look into getting the
IOMMU working on this board. I would love to get this fixed though.


---
The point in dmesg right before the ping/pong IRQs stop. This sequence
of messages appears consistently like this prior to this.

[  128.915574] [drm:mdp5_crtc_vblank_irq] crtc-0: send event: 4c4a50e5                             
[  128.928610] [drm:dsi_host_irq] isr=0x2000700, id=0                                              
[  128.945398] [drm:dsi_host_irq] isr=0x2000700, id=0                                              
[  128.962185] [drm:dsi_host_irq] isr=0x2000700, id=0                                           
[  128.978974] [drm:dsi_host_irq] isr=0x2000700, id=0                                                        
[  128.995761] [drm:dsi_host_irq] isr=0x2000700, id=0                                                        
[  129.015163] [drm:dsi_host_irq] isr=0x2000700, id=0                             
[  129.031826] [drm:dsi_host_irq] isr=0x2000700, id=0                                           
[  129.048492] [drm:dsi_host_irq] isr=0x2000700, id=0                                                        
[  129.065160] [drm:dsi_host_irq] isr=0x2000700, id=0                                                        
[  129.081826] [drm:dsi_host_irq] isr=0x2000700, id=0                                                        
[  129.098493] [drm:dsi_host_irq] isr=0x2000700, id=0                                                        
[  129.115694] [drm:dsi_host_irq] isr=0x2000700, id=0                                                        
[  129.115787] [drm:drm_atomic_state_init] Allocated atomic state f90dd658                                   
[  129.115810] [drm:drm_mode_object_get] OBJ ID: 51 (2)                                            
[  129.115823] [drm:drm_atomic_get_plane_state] Added [PLANE:33:plane-0] d172526a state to f90dd658
[  129.115836] [drm:drm_mode_object_get] OBJ ID: 52 (1)                                                      
[  129.115848] [drm:drm_atomic_get_crtc_state] Added [CRTC:50:crtc-0] 00606fa5 state to f90dd658             
[  129.115858] [drm:drm_mode_object_get] OBJ ID: 556 (1)                                           
[  129.115878] [drm:drm_atomic_check_only] checking f90dd658                                                 
[  129.115895] [drm:mdp5_plane_atomic_check] plane-0: check (1 -> 1)                                         
[  129.115910] [drm:mdp5_crtc_atomic_check] crtc-0: check                                          
[  129.115921] [drm:mdp5_crtc_atomic_check] crtc-0: assign pipe plane-0 on stage=1                 
[  129.115932] [drm:drm_atomic_commit] committing f90dd658                                         
[  129.115957] [drm:msm_framebuffer_prepare] FB[51]: iova[0]: 70101000 (0)                                   
[  129.116005] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 1086, vtotal 1926, vdisplay 1920
[  129.116015] [drm:drm_calc_timestamping_constants] crtc 50: clock 150000 kHz framedur 13944240 linedur 7240
[  129.116025] [drm:drm_atomic_helper_commit_planes] crtc-0: begin                                           
[  129.116037] [drm:mdp5_plane_atomic_update] plane-0: update                                                
[  129.116050] [drm:mdp5_plane_mode_set] plane-0: FB[51] 0,0,1080,1920 -> CRTC[50] 0,0,1080,1920             
[  129.116061] [drm:mdp5_plane_mode_set] scale config = 0                                                    
[  129.116085] [drm:mdp5_crtc_atomic_flush] crtc-0: event: 2a2a7209                                          
[  129.116107] [drm:mdp5_ctl_blend] lm0: blend config = 0x00040000. ext_cfg = 0x00000000                     
[  129.116117] [drm:crtc_flush] crtc-0: flush=00000840                                                       
[  129.116983] [drm:mdp5_crtc_vblank_irq] crtc-0: send event: 2a2a7209                                       
[  129.172473] msm fd900000.mdss: pp done time out, lm=0                                                     
[  129.172506] [drm:mdp5_plane_cleanup_fb] plane-0: cleanup: FB[51]                                          
[  129.172525] [drm:drm_mode_object_put.part.0] OBJ ID: 556 (2)                                              
[  129.172536] [drm:drm_atomic_state_default_clear] Clearing atomic state f90dd658                           
[  129.172548] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (2)                                               
[  129.172558] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)                                               
[  129.172569] [drm:__drm_atomic_state_free] Freeing atomic state f90dd658          


----
Messages immediately after the last batch above when the ping/pong IRQs
stop. This sequence of messages appear consistently like this after this
point.

[  129.322565] [drm:drm_atomic_state_init] Allocated atomic state f90dd658                                   
[  129.322585] [drm:drm_mode_object_get] OBJ ID: 51 (2)                                                      
[  129.322597] [drm:drm_atomic_get_plane_state] Added [PLANE:33:plane-0] 13115e01 state to f90dd658          
[  129.322610] [drm:drm_mode_object_get] OBJ ID: 52 (1)                                            
[  129.322621] [drm:drm_atomic_get_crtc_state] Added [CRTC:50:crtc-0] 380d863c state to f90dd658   
[  129.322631] [drm:drm_mode_object_get] OBJ ID: 557 (1)                                                     
[  129.322644] [drm:drm_atomic_check_only] checking f90dd658                                                 
[  129.322661] [drm:mdp5_plane_atomic_check] plane-0: check (1 -> 1)                                         
[  129.322675] [drm:mdp5_crtc_atomic_check] crtc-0: check                                                    
[  129.322687] [drm:mdp5_crtc_atomic_check] crtc-0: assign pipe plane-0 on stage=1                           
[  129.322698] [drm:drm_atomic_commit] committing f90dd658                                         
[  129.322716] [drm:msm_framebuffer_prepare] FB[51]: iova[0]: 70101000 (0)                                   
[  129.382537] msm fd900000.mdss: pp done time out, lm=0                                                     
[  129.382577] [drm:drm_calc_timestamping_constants] crtc 50: hwmode: htotal 1086, vtotal 1926, vdisplay 1920
[  129.382587] [drm:drm_calc_timestamping_constants] crtc 50: clock 150000 kHz framedur 13944240 linedur 7240
[  129.382598] [drm:drm_atomic_helper_commit_planes] crtc-0: begin                                           
[  129.382609] [drm:mdp5_plane_atomic_update] plane-0: update                                                
[  129.382622] [drm:mdp5_plane_mode_set] plane-0: FB[51] 0,0,1080,1920 -> CRTC[50] 0,0,1080,1920             
[  129.382633] [drm:mdp5_plane_mode_set] scale config = 0                                                    
[  129.382653] [drm:mdp5_crtc_atomic_flush] crtc-0: event: 0df2511e                                          
[  129.382677] [drm:mdp5_ctl_blend] lm0: blend config = 0x00040000. ext_cfg = 0x00000000                     
[  129.382687] [drm:crtc_flush] crtc-0: flush=00000840                                                       
[  129.385525] [drm:mdp5_crtc_vblank_irq] crtc-0: send event: 0df2511e                                       
[  129.442536] msm fd900000.mdss: pp done time out, lm=0                                                     
[  129.442568] [drm:mdp5_plane_cleanup_fb] plane-0: cleanup: FB[51]                                          
[  129.442586] [drm:drm_mode_object_put.part.0] OBJ ID: 557 (2)                                              
[  129.442597] [drm:drm_atomic_state_default_clear] Clearing atomic state f90dd658                           
[  129.442609] [drm:drm_mode_object_put.part.0] OBJ ID: 52 (2)                                               
[  129.442620] [drm:drm_mode_object_put.part.0] OBJ ID: 51 (3)                                               
[  129.442630] [drm:__drm_atomic_state_free] Freeing atomic state f90dd658                                   

Brian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
