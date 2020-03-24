Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2FC1919B0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 20:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724B86E519;
	Tue, 24 Mar 2020 19:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD9226E519
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 19:12:38 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id A2015E74222; Tue, 24 Mar 2020 20:12:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.1
Received: from astat.fritz.box (a89-183-114-40.net-htp.de [89.183.114.40])
 by lynxeye.de (Postfix) with ESMTPSA id 37611E7414D;
 Tue, 24 Mar 2020 20:12:01 +0100 (CET)
Message-ID: <62edc9d2d31f36b2cee502c858c17c85303c486f.camel@lynxeye.de>
Subject: latencies and code inefficiencies in amdgpu display handling
From: Lucas Stach <dev@lynxeye.de>
To: amd-gfx@lists.freedesktop.org
Date: Tue, 24 Mar 2020 20:12:00 +0100
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

recently I've been tracing some IRQ latencies in a system and the
display handling in amdgpu doesn't really look that good. To be honest
it also doesn't look too bad, but I still want to share my findings
here. The trace below is from a single vblank IRQ with a pageflip.

The most interesting points from my perspective:

1. While this is a single CRTC vblank IRQ, the handler calls
amdgpu_get_vblank_counter_kms 10(!) times. This isn't really a cheap
function as it also reads the current scanout position and thus makes
multiple MMIO device reads.
This seems like low-hanging fruit for optimiaztion, as querying the
same thing this many times in a single IRQ invocation seems like total
overkill.

2. In this particular trace one of the scanout position reads seems to
block. The trace indicates that almost 300us are spent in this single
device read. Is this a known issue?

3. There are quite a few spinlocks being locked with spin_lock_irqsave,
while this handler code is never called from non-IRQ context, so all
those calls could use the cheaper spin_lock. This is a micro
optimization, but it caught my eye when looking over the trace/code.

Regards,
Lucas


# tracer: irqsoff
#
# irqsoff latency trace v1.1.5 on 5.6.0-rc7+
# --------------------------------------------------------------------
# latency: 417 us, #446/446, CPU#6 | (M:desktop VP:0, KP:0, SP:0 HP:0 #P:16)
#    -----------------
#    | task: user-task-0 (uid:1000 nice:0 policy:0 rt_prio:0)
#    -----------------
#  => started at: interrupt_entry
#  => ended at:   swapgs_restore_regs_and_return_to_usermode
#
#
#                  _------=> CPU#            
#                 / _-----=> irqs-off        
#                | / _----=> need-resched    
#                || / _---=> hardirq/softirq 
#                ||| / _--=> preempt-depth   
#                |||| /     delay            
#  cmd     pid   ||||| time  |   caller      
#     \   /      |||||  \    |   /         
  user-task-0    6d...    0us : trace_hardirqs_off_thunk <-interrupt_entry
  user-task-0    6d...    0us : do_IRQ <-ret_from_intr
  user-task-0    6d...    0us : irq_enter <-do_IRQ
  user-task-0    6d...    0us : rcu_irq_enter <-irq_enter
  user-task-0    6d...    0us : irqtime_account_irq <-irq_enter
  user-task-0    6d.h.    1us : handle_edge_irq <-do_IRQ
  user-task-0    6d.h.    1us : _raw_spin_lock <-handle_edge_irq
  user-task-0    6d.h.    1us : irq_may_run <-handle_edge_irq
  user-task-0    6d.h.    1us : irq_chip_ack_parent <-handle_edge_irq
  user-task-0    6d.h.    1us : apic_ack_irq <-handle_edge_irq
  user-task-0    6d.h.    1us : handle_irq_event <-handle_edge_irq
  user-task-0    6d.h.    1us : handle_irq_event_percpu <-handle_irq_event
  user-task-0    6d.h.    1us : __handle_irq_event_percpu <-handle_irq_event_percpu
  user-task-0    6d.h.    1us : amdgpu_irq_handler <-__handle_irq_event_percpu
  user-task-0    6d.h.    2us : amdgpu_ih_process <-amdgpu_irq_handler
  user-task-0    6d.h.    2us : tonga_ih_get_wptr <-amdgpu_ih_process
  user-task-0    6d.h.    2us : __drm_dbg <-amdgpu_ih_process
  user-task-0    6d.h.    2us : amdgpu_irq_dispatch <-amdgpu_ih_process
  user-task-0    6d.h.    2us : tonga_ih_decode_iv <-amdgpu_irq_dispatch
  user-task-0    6d.h.    3us : amdgpu_dm_irq_handler <-amdgpu_irq_dispatch
  user-task-0    6d.h.    3us : dc_interrupt_to_irq_source <-amdgpu_dm_irq_handler
  user-task-0    6d.h.    3us : dal_irq_service_to_irq_source <-amdgpu_dm_irq_handler
  user-task-0    6d.h.    4us : to_dal_irq_source_dce110 <-amdgpu_dm_irq_handler
  user-task-0    6d.h.    4us : dc_interrupt_ack <-amdgpu_dm_irq_handler
  user-task-0    6d.h.    5us : dal_irq_service_ack <-amdgpu_dm_irq_handler
  user-task-0    6d.h.    5us : dal_irq_service_ack_generic <-dal_irq_service_ack
  user-task-0    6d.h.    5us : dm_read_reg_func <-dal_irq_service_ack_generic
  user-task-0    6d.h.    5us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.    6us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.    7us : amdgpu_cgs_write_register <-dal_irq_service_ack_generic
  user-task-0    6d.h.    7us : amdgpu_mm_wreg <-dal_irq_service_ack_generic
  user-task-0    6d.h.    7us : _raw_spin_lock_irqsave <-amdgpu_dm_irq_handler
  user-task-0    6d.h.    8us : dm_crtc_high_irq <-amdgpu_dm_irq_handler
  user-task-0    6d.h.    8us : get_crtc_by_otg_inst.isra.0 <-dm_crtc_high_irq
  user-task-0    6d.h.    8us : __drm_dbg <-dm_crtc_high_irq
  user-task-0    6d.h.    8us : drm_crtc_handle_vblank <-dm_crtc_high_irq
  user-task-0    6d.h.    9us : drm_handle_vblank <-dm_crtc_high_irq
  user-task-0    6d.h.    9us : _raw_spin_lock_irqsave <-drm_handle_vblank
  user-task-0    6d.h.    9us : _raw_spin_lock <-drm_handle_vblank
  user-task-0    6d.h.    9us : drm_update_vblank_count <-drm_handle_vblank
  user-task-0    6d.h.    9us : __get_vblank_counter <-drm_update_vblank_count
  user-task-0    6d.h.   10us : drm_crtc_from_index <-__get_vblank_counter
  user-task-0    6d.h.   10us : amdgpu_get_vblank_counter_kms <-drm_update_vblank_count
  user-task-0    6d.h.   10us : dm_vblank_get_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.   10us : dc_stream_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.   11us : dce110_timing_generator_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.   11us : dm_read_reg_func <-dce110_timing_generator_get_vblank_counter
  user-task-0    6d.h.   11us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.   11us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.   12us : amdgpu_display_get_crtc_scanoutpos <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.   12us : dm_crtc_get_scanoutpos <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.   12us : dc_stream_get_scanoutpos <-dm_crtc_get_scanoutpos
  user-task-0    6d.h.   12us : dce110_timing_generator_get_crtc_scanoutpos <-dc_stream_get_scanoutpos
  user-task-0    6d.h.   13us : dm_read_reg_func <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.   13us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.   13us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.   14us : dce110_timing_generator_get_position <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.   14us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.   14us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.   14us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.   15us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.   15us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.   15us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.   16us : dm_vblank_get_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.   16us : dc_stream_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.   16us : dce110_timing_generator_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.   17us : dm_read_reg_func <-dce110_timing_generator_get_vblank_counter
  user-task-0    6d.h.   17us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.   17us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.   18us : __drm_dbg <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.   18us : drm_get_last_vbltimestamp <-drm_update_vblank_count
  user-task-0    6d.h.   19us : drm_calc_vbltimestamp_from_scanoutpos <-drm_get_last_vbltimestamp
  user-task-0    6d.h.   19us : drm_crtc_from_index <-drm_calc_vbltimestamp_from_scanoutpos
  user-task-0    6d.h.   19us : amdgpu_get_crtc_scanout_position <-drm_calc_vbltimestamp_from_scanoutpos
  user-task-0    6d.h.   19us : amdgpu_display_get_crtc_scanoutpos <-amdgpu_get_crtc_scanout_position
  user-task-0    6d.h.   20us : ktime_get <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.   20us : dm_crtc_get_scanoutpos <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.   20us : dc_stream_get_scanoutpos <-dm_crtc_get_scanoutpos
  user-task-0    6d.h.   20us : dce110_timing_generator_get_crtc_scanoutpos <-dc_stream_get_scanoutpos
  user-task-0    6d.h.   21us : dm_read_reg_func <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.   21us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.   21us!: amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  307us : dce110_timing_generator_get_position <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  307us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  307us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  307us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  309us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  309us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  310us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  311us : ktime_get <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.  311us : amdgpu_get_crtc_scanout_position <-drm_calc_vbltimestamp_from_scanoutpos
  user-task-0    6d.h.  311us : amdgpu_display_get_crtc_scanoutpos <-amdgpu_get_crtc_scanout_position
  user-task-0    6d.h.  311us : ktime_get <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.  312us : dm_crtc_get_scanoutpos <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.  312us : dc_stream_get_scanoutpos <-dm_crtc_get_scanoutpos
  user-task-0    6d.h.  312us : dce110_timing_generator_get_crtc_scanoutpos <-dc_stream_get_scanoutpos
  user-task-0    6d.h.  312us : dm_read_reg_func <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  312us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  313us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  314us : dce110_timing_generator_get_position <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  314us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  314us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  314us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  315us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  315us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  315us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  316us : ktime_get <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.  317us : __get_vblank_counter <-drm_update_vblank_count
  user-task-0    6d.h.  317us : drm_crtc_from_index <-__get_vblank_counter
  user-task-0    6d.h.  317us : amdgpu_get_vblank_counter_kms <-drm_update_vblank_count
  user-task-0    6d.h.  317us : dm_vblank_get_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  317us : dc_stream_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  318us : dce110_timing_generator_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  318us : dm_read_reg_func <-dce110_timing_generator_get_vblank_counter
  user-task-0    6d.h.  318us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  318us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  319us : amdgpu_display_get_crtc_scanoutpos <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  319us : dm_crtc_get_scanoutpos <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.  320us : dc_stream_get_scanoutpos <-dm_crtc_get_scanoutpos
  user-task-0    6d.h.  320us : dce110_timing_generator_get_crtc_scanoutpos <-dc_stream_get_scanoutpos
  user-task-0    6d.h.  320us : dm_read_reg_func <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  320us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  320us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  321us : dce110_timing_generator_get_position <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  321us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  322us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  322us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  323us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  323us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  323us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  324us : dm_vblank_get_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  324us : dc_stream_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  325us : dce110_timing_generator_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  325us : dm_read_reg_func <-dce110_timing_generator_get_vblank_counter
  user-task-0    6d.h.  325us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  325us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  326us : __drm_dbg <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  326us : __drm_dbg <-drm_update_vblank_count
  user-task-0    6d.h.  327us : store_vblank <-drm_update_vblank_count
  user-task-0    6d.h.  327us : _raw_spin_lock <-store_vblank
  user-task-0    6d.h.  327us : __wake_up <-drm_handle_vblank
  user-task-0    6d.h.  328us : __wake_up_common_lock <-drm_handle_vblank
  user-task-0    6d.h.  328us : _raw_spin_lock_irqsave <-__wake_up_common_lock
  user-task-0    6d.h.  328us : __wake_up_common <-__wake_up_common_lock
  user-task-0    6d.h.  328us : _raw_spin_unlock_irqrestore <-__wake_up_common_lock
  user-task-0    6d.h.  328us : drm_vblank_count_and_time.isra.0 <-drm_handle_vblank
  user-task-0    6d.h.  328us : _raw_spin_unlock_irqrestore <-drm_handle_vblank
  user-task-0    6d.h.  329us : amdgpu_dm_crtc_handle_crc_irq <-dm_crtc_high_irq
  user-task-0    6d.h.  329us : _raw_spin_unlock_irqrestore <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  329us : _raw_spin_lock_irqsave <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  329us : _raw_spin_unlock_irqrestore <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  330us : amdgpu_amdkfd_interrupt <-amdgpu_irq_dispatch
  user-task-0    6d.h.  330us : kgd2kfd_interrupt <-amdgpu_irq_dispatch
  user-task-0    6d.h.  330us : _raw_spin_lock_irqsave <-kgd2kfd_interrupt
  user-task-0    6d.h.  330us : interrupt_is_wanted <-kgd2kfd_interrupt
  user-task-0    6d.h.  330us : cik_event_interrupt_isr <-kgd2kfd_interrupt
  user-task-0    6d.h.  331us : _raw_spin_unlock_irqrestore <-kgd2kfd_interrupt
  user-task-0    6d.h.  331us : amdgpu_irq_dispatch <-amdgpu_ih_process
  user-task-0    6d.h.  331us : tonga_ih_decode_iv <-amdgpu_irq_dispatch
  user-task-0    6d.h.  331us : amdgpu_dm_irq_handler <-amdgpu_irq_dispatch
  user-task-0    6d.h.  332us : dc_interrupt_to_irq_source <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  332us : dal_irq_service_to_irq_source <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  332us : to_dal_irq_source_dce110 <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  332us : dc_interrupt_ack <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  332us : dal_irq_service_ack <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  333us : dal_irq_service_ack_generic <-dal_irq_service_ack
  user-task-0    6d.h.  333us : dm_read_reg_func <-dal_irq_service_ack_generic
  user-task-0    6d.h.  333us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  333us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  334us : amdgpu_cgs_write_register <-dal_irq_service_ack_generic
  user-task-0    6d.h.  334us : amdgpu_mm_wreg <-dal_irq_service_ack_generic
  user-task-0    6d.h.  335us : _raw_spin_lock_irqsave <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  335us : dm_pflip_high_irq <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  335us : get_crtc_by_otg_inst.isra.0 <-dm_pflip_high_irq
  user-task-0    6d.h.  336us : _raw_spin_lock_irqsave <-dm_pflip_high_irq
  user-task-0    6d.h.  336us : drm_crtc_accurate_vblank_count <-dm_pflip_high_irq
  user-task-0    6d.h.  336us : _raw_spin_lock_irqsave <-drm_crtc_accurate_vblank_count
  user-task-0    6d.h.  337us : drm_update_vblank_count <-drm_crtc_accurate_vblank_count
  user-task-0    6d.h.  337us : __get_vblank_counter <-drm_update_vblank_count
  user-task-0    6d.h.  337us : drm_crtc_from_index <-__get_vblank_counter
  user-task-0    6d.h.  337us : amdgpu_get_vblank_counter_kms <-drm_update_vblank_count
  user-task-0    6d.h.  337us : dm_vblank_get_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  338us : dc_stream_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  338us : dce110_timing_generator_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  338us : dm_read_reg_func <-dce110_timing_generator_get_vblank_counter
  user-task-0    6d.h.  338us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  338us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  339us : amdgpu_display_get_crtc_scanoutpos <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  340us : dm_crtc_get_scanoutpos <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.  340us : dc_stream_get_scanoutpos <-dm_crtc_get_scanoutpos
  user-task-0    6d.h.  340us : dce110_timing_generator_get_crtc_scanoutpos <-dc_stream_get_scanoutpos
  user-task-0    6d.h.  340us : dm_read_reg_func <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  340us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  340us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  341us : dce110_timing_generator_get_position <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  342us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  342us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  342us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  343us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  343us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  343us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  344us : dm_vblank_get_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  345us : dc_stream_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  345us : dce110_timing_generator_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  345us : dm_read_reg_func <-dce110_timing_generator_get_vblank_counter
  user-task-0    6d.h.  345us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  345us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  346us : __drm_dbg <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  346us : drm_get_last_vbltimestamp <-drm_update_vblank_count
  user-task-0    6d.h.  347us : drm_calc_vbltimestamp_from_scanoutpos <-drm_get_last_vbltimestamp
  user-task-0    6d.h.  347us : drm_crtc_from_index <-drm_calc_vbltimestamp_from_scanoutpos
  user-task-0    6d.h.  347us : amdgpu_get_crtc_scanout_position <-drm_calc_vbltimestamp_from_scanoutpos
  user-task-0    6d.h.  347us : amdgpu_display_get_crtc_scanoutpos <-amdgpu_get_crtc_scanout_position
  user-task-0    6d.h.  347us : ktime_get <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.  348us : dm_crtc_get_scanoutpos <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.  348us : dc_stream_get_scanoutpos <-dm_crtc_get_scanoutpos
  user-task-0    6d.h.  348us : dce110_timing_generator_get_crtc_scanoutpos <-dc_stream_get_scanoutpos
  user-task-0    6d.h.  348us : dm_read_reg_func <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  348us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  349us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  349us : dce110_timing_generator_get_position <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  350us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  350us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  350us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  351us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  351us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  351us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  352us : ktime_get <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.  353us : __get_vblank_counter <-drm_update_vblank_count
  user-task-0    6d.h.  353us : drm_crtc_from_index <-__get_vblank_counter
  user-task-0    6d.h.  353us : amdgpu_get_vblank_counter_kms <-drm_update_vblank_count
  user-task-0    6d.h.  353us : dm_vblank_get_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  353us : dc_stream_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  354us : dce110_timing_generator_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  354us : dm_read_reg_func <-dce110_timing_generator_get_vblank_counter
  user-task-0    6d.h.  354us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  354us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  355us : amdgpu_display_get_crtc_scanoutpos <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  355us : dm_crtc_get_scanoutpos <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.  356us : dc_stream_get_scanoutpos <-dm_crtc_get_scanoutpos
  user-task-0    6d.h.  356us : dce110_timing_generator_get_crtc_scanoutpos <-dc_stream_get_scanoutpos
  user-task-0    6d.h.  356us : dm_read_reg_func <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  356us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  356us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  357us : dce110_timing_generator_get_position <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  357us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  358us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  358us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  359us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  359us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  359us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  360us : dm_vblank_get_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  360us : dc_stream_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  361us : dce110_timing_generator_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  361us : dm_read_reg_func <-dce110_timing_generator_get_vblank_counter
  user-task-0    6d.h.  361us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  361us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  362us : __drm_dbg <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  362us : __drm_dbg <-drm_update_vblank_count
  user-task-0    6d.h.  362us : _raw_spin_unlock_irqrestore <-drm_crtc_accurate_vblank_count
  user-task-0    6d.h.  363us : drm_crtc_send_vblank_event <-dm_pflip_high_irq
  user-task-0    6d.h.  363us : drm_vblank_count_and_time.isra.0 <-drm_crtc_send_vblank_event
  user-task-0    6d.h.  363us : send_vblank_event <-drm_crtc_send_vblank_event
  user-task-0    6d.h.  363us : ns_to_timespec64 <-send_vblank_event
  user-task-0    6d.h.  364us : drm_send_event_locked <-drm_crtc_send_vblank_event
  user-task-0    6d.h.  364us : complete_all <-drm_send_event_locked
  user-task-0    6d.h.  364us : _raw_spin_lock_irqsave <-complete_all
  user-task-0    6d.h.  365us : __wake_up_locked <-complete_all
  user-task-0    6d.h.  365us : __wake_up_common <-complete_all
  user-task-0    6d.h.  365us : default_wake_function <-__wake_up_common
  user-task-0    6d.h.  365us : try_to_wake_up <-__wake_up_common
  user-task-0    6d.h.  366us : _raw_spin_lock_irqsave <-try_to_wake_up
  user-task-0    6d.h.  366us : select_task_rq_fair <-try_to_wake_up
  user-task-0    6d.h.  366us : select_idle_sibling <-select_task_rq_fair
  user-task-0    6d.h.  366us : available_idle_cpu <-select_idle_sibling
  user-task-0    6d.h.  367us : cpus_share_cache <-select_idle_sibling
  user-task-0    6d.h.  367us : available_idle_cpu <-select_idle_sibling
  user-task-0    6d.h.  367us : set_task_cpu <-try_to_wake_up
  user-task-0    6d.h.  368us : migrate_task_rq_fair <-set_task_cpu
  user-task-0    6d.h.  368us : remove_entity_load_avg <-migrate_task_rq_fair
  user-task-0    6d.h.  368us : __update_load_avg_blocked_se <-remove_entity_load_avg
  user-task-0    6d.h.  368us : _raw_spin_lock_irqsave <-remove_entity_load_avg
  user-task-0    6d.h.  369us : _raw_spin_unlock_irqrestore <-migrate_task_rq_fair
  user-task-0    6d.h.  369us : set_task_rq_fair <-set_task_cpu
  user-task-0    6d.h.  369us : _raw_spin_lock <-try_to_wake_up
  user-task-0    6d.h.  370us : update_rq_clock <-try_to_wake_up
  user-task-0    6d.h.  370us : ttwu_do_activate <-try_to_wake_up
  user-task-0    6d.h.  370us : activate_task <-ttwu_do_activate
  user-task-0    6d.h.  371us : psi_task_change <-activate_task
  user-task-0    6d.h.  371us : record_times <-psi_task_change
  user-task-0    6d.h.  371us : enqueue_task_fair <-activate_task
  user-task-0    6d.h.  372us : enqueue_entity <-enqueue_task_fair
  user-task-0    6d.h.  372us : update_curr <-enqueue_entity
  user-task-0    6d.h.  372us : __update_load_avg_cfs_rq <-update_load_avg
  user-task-0    6d.h.  373us : attach_entity_load_avg <-update_load_avg
  user-task-0    6d.h.  373us : dbs_update_util_handler <-attach_entity_load_avg
  user-task-0    6d.h.  373us : cpufreq_this_cpu_can_update <-dbs_update_util_handler
  user-task-0    6d.h.  374us : update_cfs_group <-enqueue_entity
  user-task-0    6d.h.  374us : account_entity_enqueue <-enqueue_entity
  user-task-0    6d.h.  374us : place_entity <-enqueue_entity
  user-task-0    6d.h.  375us : __enqueue_entity <-enqueue_entity
  user-task-0    6d.h.  375us : hrtick_update <-activate_task
  user-task-0    6d.h.  375us : ttwu_do_wakeup <-try_to_wake_up
  user-task-0    6d.h.  375us : check_preempt_curr <-ttwu_do_wakeup
  user-task-0    6d.h.  375us : resched_curr <-check_preempt_curr
  user-task-0    6d.h.  376us : native_smp_send_reschedule <-check_preempt_curr
  user-task-0    6d.h.  376us : default_send_IPI_single_phys <-check_preempt_curr
  user-task-0    6d.h.  376us : __default_send_IPI_dest_field <-default_send_IPI_single_phys
  user-task-0    6d.h.  377us : _raw_spin_unlock_irqrestore <-try_to_wake_up
  user-task-0    6d.h.  377us : _raw_spin_unlock_irqrestore <-drm_send_event_locked
  user-task-0    6d.h.  377us : release_crtc_commit <-drm_send_event_locked
  user-task-0    6d.h.  377us : __wake_up <-drm_crtc_send_vblank_event
  user-task-0    6d.h.  378us : __wake_up_common_lock <-drm_crtc_send_vblank_event
  user-task-0    6d.h.  378us : _raw_spin_lock_irqsave <-__wake_up_common_lock
  user-task-0    6d.h.  378us : __wake_up_common <-__wake_up_common_lock
  user-task-0    6d.h.  378us : ep_poll_callback <-__wake_up_common
  user-task-0    6d.h.  379us : _raw_read_lock_irqsave <-ep_poll_callback
  user-task-0    6d.h.  379us : __wake_up <-ep_poll_callback
  user-task-0    6d.h.  380us : __wake_up_common_lock <-ep_poll_callback
  user-task-0    6d.h.  380us : _raw_spin_lock_irqsave <-__wake_up_common_lock
  user-task-0    6d.h.  380us : __wake_up_common <-__wake_up_common_lock
  user-task-0    6d.h.  381us : default_wake_function <-__wake_up_common
  user-task-0    6d.h.  381us : try_to_wake_up <-__wake_up_common
  user-task-0    6d.h.  381us : _raw_spin_lock_irqsave <-try_to_wake_up
  user-task-0    6d.h.  382us : select_task_rq_fair <-try_to_wake_up
  user-task-0    6d.h.  382us : available_idle_cpu <-select_task_rq_fair
  user-task-0    6d.h.  382us : update_cfs_rq_h_load <-select_task_rq_fair
  user-task-0    6d.h.  383us : select_idle_sibling <-select_task_rq_fair
  user-task-0    6d.h.  383us : available_idle_cpu <-select_idle_sibling
  user-task-0    6d.h.  383us : cpus_share_cache <-select_idle_sibling
  user-task-0    6d.h.  383us : available_idle_cpu <-select_idle_sibling
  user-task-0    6d.h.  384us : available_idle_cpu <-select_idle_sibling
  user-task-0    6d.h.  384us : available_idle_cpu <-select_idle_sibling
  user-task-0    6d.h.  385us : available_idle_cpu <-select_idle_sibling
  user-task-0    6d.h.  385us : available_idle_cpu <-select_idle_sibling
  user-task-0    6d.h.  386us : available_idle_cpu <-select_idle_sibling
  user-task-0    6d.h.  386us : available_idle_cpu <-select_idle_sibling
  user-task-0    6d.h.  386us : set_task_cpu <-try_to_wake_up
  user-task-0    6d.h.  387us : migrate_task_rq_fair <-set_task_cpu
  user-task-0    6d.h.  387us : remove_entity_load_avg <-migrate_task_rq_fair
  user-task-0    6d.h.  387us : __update_load_avg_blocked_se <-remove_entity_load_avg
  user-task-0    6d.h.  387us : _raw_spin_lock_irqsave <-remove_entity_load_avg
  user-task-0    6d.h.  387us : _raw_spin_unlock_irqrestore <-migrate_task_rq_fair
  user-task-0    6d.h.  388us : set_task_rq_fair <-set_task_cpu
  user-task-0    6d.h.  388us : _raw_spin_lock <-try_to_wake_up
  user-task-0    6d.h.  388us : update_rq_clock <-try_to_wake_up
  user-task-0    6d.h.  389us : ttwu_do_activate <-try_to_wake_up
  user-task-0    6d.h.  389us : activate_task <-ttwu_do_activate
  user-task-0    6d.h.  389us : psi_task_change <-activate_task
  user-task-0    6d.h.  391us : record_times <-psi_task_change
  user-task-0    6d.h.  391us : record_times <-psi_task_change
  user-task-0    6d.h.  391us : enqueue_task_fair <-activate_task
  user-task-0    6d.h.  392us : enqueue_entity <-enqueue_task_fair
  user-task-0    6d.h.  392us : update_curr <-enqueue_entity
  user-task-0    6d.h.  392us : __update_load_avg_cfs_rq <-update_load_avg
  user-task-0    6d.h.  393us : attach_entity_load_avg <-update_load_avg
  user-task-0    6d.h.  393us : update_cfs_group <-enqueue_entity
  user-task-0    6d.h.  393us : account_entity_enqueue <-enqueue_entity
  user-task-0    6d.h.  393us : place_entity <-enqueue_entity
  user-task-0    6d.h.  394us : __enqueue_entity <-enqueue_entity
  user-task-0    6d.h.  394us : enqueue_entity <-enqueue_task_fair
  user-task-0    6d.h.  394us : update_curr <-enqueue_entity
  user-task-0    6d.h.  395us : __update_load_avg_se <-update_load_avg
  user-task-0    6d.h.  395us : __update_load_avg_cfs_rq <-update_load_avg
  user-task-0    6d.h.  396us : dbs_update_util_handler <-update_load_avg
  user-task-0    6d.h.  396us : cpufreq_this_cpu_can_update <-dbs_update_util_handler
  user-task-0    6d.h.  396us : update_cfs_group <-enqueue_entity
  user-task-0    6d.h.  396us : reweight_entity <-enqueue_entity
  user-task-0    6d.h.  397us : account_entity_enqueue <-enqueue_entity
  user-task-0    6d.h.  397us : place_entity <-enqueue_entity
  user-task-0    6d.h.  397us : __enqueue_entity <-enqueue_entity
  user-task-0    6d.h.  397us : hrtick_update <-activate_task
  user-task-0    6d.h.  398us : ttwu_do_wakeup <-try_to_wake_up
  user-task-0    6d.h.  398us : check_preempt_curr <-ttwu_do_wakeup
  user-task-0    6d.h.  398us : resched_curr <-check_preempt_curr
  user-task-0    6d.h.  399us : native_smp_send_reschedule <-check_preempt_curr
  user-task-0    6d.h.  399us : default_send_IPI_single_phys <-check_preempt_curr
  user-task-0    6d.h.  399us : __default_send_IPI_dest_field <-default_send_IPI_single_phys
  user-task-0    6d.h.  400us : _raw_spin_unlock_irqrestore <-try_to_wake_up
  user-task-0    6d.h.  400us : _raw_spin_unlock_irqrestore <-__wake_up_common_lock
  user-task-0    6d.h.  400us : _raw_read_unlock_irqrestore <-ep_poll_callback
  user-task-0    6d.h.  400us : _raw_spin_unlock_irqrestore <-__wake_up_common_lock
  user-task-0    6d.h.  401us : drm_crtc_vblank_put <-dm_pflip_high_irq
  user-task-0    6d.h.  401us : drm_vblank_put <-dm_pflip_high_irq
  user-task-0    6d.h.  401us : mod_timer <-dm_pflip_high_irq
  user-task-0    6d.h.  401us : lock_timer_base <-mod_timer
  user-task-0    6d.h.  401us : _raw_spin_lock_irqsave <-lock_timer_base
  user-task-0    6d.h.  402us : calc_wheel_index <-mod_timer
  user-task-0    6d.h.  402us : detach_if_pending <-mod_timer
  user-task-0    6d.h.  402us : get_nohz_timer_target <-mod_timer
  user-task-0    6d.h.  403us : enqueue_timer <-mod_timer
  user-task-0    6d.h.  403us : trigger_dyntick_cpu.isra.0 <-mod_timer
  user-task-0    6d.h.  403us : _raw_spin_unlock_irqrestore <-mod_timer
  user-task-0    6d.h.  403us : amdgpu_get_vblank_counter_kms <-dm_pflip_high_irq
  user-task-0    6d.h.  403us : dm_vblank_get_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  403us : dc_stream_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  404us : dce110_timing_generator_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  404us : dm_read_reg_func <-dce110_timing_generator_get_vblank_counter
  user-task-0    6d.h.  404us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  404us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  405us : amdgpu_display_get_crtc_scanoutpos <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  405us : dm_crtc_get_scanoutpos <-amdgpu_display_get_crtc_scanoutpos
  user-task-0    6d.h.  406us : dc_stream_get_scanoutpos <-dm_crtc_get_scanoutpos
  user-task-0    6d.h.  406us : dce110_timing_generator_get_crtc_scanoutpos <-dc_stream_get_scanoutpos
  user-task-0    6d.h.  406us : dm_read_reg_func <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  406us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  406us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  407us : dce110_timing_generator_get_position <-dce110_timing_generator_get_crtc_scanoutpos
  user-task-0    6d.h.  408us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  408us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  408us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  409us : dm_read_reg_func <-dce110_timing_generator_get_position
  user-task-0    6d.h.  409us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  409us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  410us : dm_vblank_get_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  410us : dc_stream_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  411us : dce110_timing_generator_get_vblank_counter <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  411us : dm_read_reg_func <-dce110_timing_generator_get_vblank_counter
  user-task-0    6d.h.  411us : amdgpu_cgs_read_register <-dm_read_reg_func
  user-task-0    6d.h.  411us : amdgpu_mm_rreg <-dm_read_reg_func
  user-task-0    6d.h.  412us : __drm_dbg <-amdgpu_get_vblank_counter_kms
  user-task-0    6d.h.  412us : _raw_spin_unlock_irqrestore <-dm_pflip_high_irq
  user-task-0    6d.h.  413us : __drm_dbg <-dm_pflip_high_irq
  user-task-0    6d.h.  413us : _raw_spin_unlock_irqrestore <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  413us : _raw_spin_lock_irqsave <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  413us : _raw_spin_unlock_irqrestore <-amdgpu_dm_irq_handler
  user-task-0    6d.h.  413us : amdgpu_amdkfd_interrupt <-amdgpu_irq_dispatch
  user-task-0    6d.h.  414us : kgd2kfd_interrupt <-amdgpu_irq_dispatch
  user-task-0    6d.h.  414us : _raw_spin_lock_irqsave <-kgd2kfd_interrupt
  user-task-0    6d.h.  414us : interrupt_is_wanted <-kgd2kfd_interrupt
  user-task-0    6d.h.  414us : cik_event_interrupt_isr <-kgd2kfd_interrupt
  user-task-0    6d.h.  414us : _raw_spin_unlock_irqrestore <-kgd2kfd_interrupt
  user-task-0    6d.h.  415us : tonga_ih_set_rptr <-amdgpu_ih_process
  user-task-0    6d.h.  415us : amdgpu_mm_wdoorbell <-amdgpu_ih_process
  user-task-0    6d.h.  415us : tonga_ih_get_wptr <-amdgpu_ih_process
  user-task-0    6d.h.  415us : ktime_get_mono_fast_ns <-amdgpu_irq_handler
  user-task-0    6d.h.  416us : add_interrupt_randomness <-handle_irq_event_percpu
  user-task-0    6d.h.  416us : note_interrupt <-handle_irq_event_percpu
  user-task-0    6d.h.  416us : _raw_spin_lock <-handle_irq_event
  user-task-0    6d.h.  417us : irq_exit <-do_IRQ
  user-task-0    6d.h.  417us : irqtime_account_irq <-irq_exit
  user-task-0    6d...  417us : idle_cpu <-irq_exit
  user-task-0    6d...  417us : rcu_irq_exit <-irq_exit
  user-task-0    6d...  417us : trace_hardirqs_on_thunk <-swapgs_restore_regs_and_return_to_usermode
  user-task-0    6d...  418us+: tracer_hardirqs_on <-swapgs_restore_regs_and_return_to_usermode
  user-task-0    6d...  431us : <stack trace>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
