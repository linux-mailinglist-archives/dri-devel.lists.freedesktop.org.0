Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1132B68C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 11:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E192A89F6D;
	Wed,  3 Mar 2021 10:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8FE89F6D;
 Wed,  3 Mar 2021 10:25:46 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lHOhN-0003wm-12; Wed, 03 Mar 2021 10:25:45 +0000
To: Yongqiang Sun <yongqiang.sun@amd.com>
From: Colin Ian King <colin.king@canonical.com>
Subject: re: drm/amd/display: Implement dmub trace event
Message-ID: <7e54081f-f226-851e-e4c4-23a299d3a711@canonical.com>
Date: Wed, 3 Mar 2021 10:25:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Language: en-US
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Static analysis on linux-next wit Coverity has found a potential null
pointer dereference in commit:

commit 70732504c53b2d3aae2cebc457515a304672d5bb
Author: Yongqiang Sun <yongqiang.sun@amd.com>
Date:   Fri Feb 19 14:50:23 2021 -0500

    drm/amd/display: Implement dmub trace event

The analysis is as follows:

400 enum dmub_status dmub_srv_hw_init(struct dmub_srv *dmub,
401                                  const struct dmub_srv_hw_params
*params)
402 {
403        struct dmub_fb *inst_fb = params->fb[DMUB_WINDOW_0_INST_CONST];
404        struct dmub_fb *stack_fb = params->fb[DMUB_WINDOW_1_STACK];
405        struct dmub_fb *data_fb = params->fb[DMUB_WINDOW_2_BSS_DATA];
406        struct dmub_fb *bios_fb = params->fb[DMUB_WINDOW_3_VBIOS];
407        struct dmub_fb *mail_fb = params->fb[DMUB_WINDOW_4_MAILBOX];
408        struct dmub_fb *tracebuff_fb =
params->fb[DMUB_WINDOW_5_TRACEBUFF];
409        struct dmub_fb *fw_state_fb = params->fb[DMUB_WINDOW_6_FW_STATE];
410        struct dmub_fb *scratch_mem_fb =
params->fb[DMUB_WINDOW_7_SCRATCH_MEM];
411
412        struct dmub_rb_init_params rb_params, outbox0_rb_params;
413        struct dmub_window cw0, cw1, cw2, cw3, cw4, cw5, cw6;
414        struct dmub_region inbox1, outbox1, outbox0;
415

   1. Condition !dmub->sw_init, taking false branch.

416        if (!dmub->sw_init)
417                return DMUB_STATUS_INVALID;
418
419        dmub->fb_base = params->fb_base;
420        dmub->fb_offset = params->fb_offset;
421        dmub->psp_version = params->psp_version;
422

   2. Condition dmub->hw_funcs.reset, taking true branch.

423        if (dmub->hw_funcs.reset)
424                dmub->hw_funcs.reset(dmub);
425

   3. Condition inst_fb, taking true branch.
   4. Condition data_fb, taking true branch.

426        if (inst_fb && data_fb) {
427                cw0.offset.quad_part = inst_fb->gpu_addr;
428                cw0.region.base = DMUB_CW0_BASE;
429                cw0.region.top = cw0.region.base + inst_fb->size - 1;
430
431                cw1.offset.quad_part = stack_fb->gpu_addr;
432                cw1.region.base = DMUB_CW1_BASE;
433                cw1.region.top = cw1.region.base + stack_fb->size - 1;
434

   5. Condition params->load_inst_const, taking true branch.
   6. Condition dmub->hw_funcs.backdoor_load, taking true branch.

435                if (params->load_inst_const &&
dmub->hw_funcs.backdoor_load) {
436                    /**
437                     * Read back all the instruction memory so we
don't hang the
438                     * DMCUB when backdoor loading if the write from
x86 hasn't been
439                     * flushed yet. This only occurs in backdoor loading.
440                     */
441                    dmub_flush_buffer_mem(inst_fb);
442                    dmub->hw_funcs.backdoor_load(dmub, &cw0, &cw1);
443                }
444
445        }
446

   7. Condition inst_fb, taking true branch.
   8. Condition data_fb, taking true branch.
   9. Condition bios_fb, taking true branch.
   10. Condition mail_fb, taking true branch.
   11. Condition tracebuff_fb, taking false branch.
   12. var_compare_op: Comparing tracebuff_fb to null implies that
tracebuff_fb might be null.

447        if (inst_fb && data_fb && bios_fb && mail_fb && tracebuff_fb &&
448            fw_state_fb && scratch_mem_fb) {
449                cw2.offset.quad_part = data_fb->gpu_addr;
450                cw2.region.base = DMUB_CW0_BASE + inst_fb->size;
451                cw2.region.top = cw2.region.base + data_fb->size;
452
453                cw3.offset.quad_part = bios_fb->gpu_addr;
454                cw3.region.base = DMUB_CW3_BASE;
455                cw3.region.top = cw3.region.base + bios_fb->size;
456
457                cw4.offset.quad_part = mail_fb->gpu_addr;
458                cw4.region.base = DMUB_CW4_BASE;
459                cw4.region.top = cw4.region.base + mail_fb->size;
460
461                /**
462                 * Doubled the mailbox region to accomodate inbox and
outbox.
463                 * Note: Currently, currently total mailbox size is
16KB. It is split
464                 * equally into 8KB between inbox and outbox. If this
config is
465                 * changed, then uncached base address configuration
of outbox1
466                 * has to be updated in funcs->setup_out_mailbox.
467                 */
468                inbox1.base = cw4.region.base;
469                inbox1.top = cw4.region.base + DMUB_RB_SIZE;
470                outbox1.base = inbox1.top;
471                outbox1.top = cw4.region.top;
472
473                cw5.offset.quad_part = tracebuff_fb->gpu_addr;
474                cw5.region.base = DMUB_CW5_BASE;
475                cw5.region.top = cw5.region.base + tracebuff_fb->size;
476
477                outbox0.base = DMUB_REGION5_BASE +
TRACE_BUFFER_ENTRY_OFFSET;
478                outbox0.top = outbox0.base + sizeof(struct
dmcub_trace_buf_entry) * PERF_TRACE_MAX_ENTRY;
479
480
481                cw6.offset.quad_part = fw_state_fb->gpu_addr;
482                cw6.region.base = DMUB_CW6_BASE;
483                cw6.region.top = cw6.region.base + fw_state_fb->size;
484
485                dmub->fw_state = fw_state_fb->cpu_addr;
486
487                dmub->scratch_mem_fb = *scratch_mem_fb;
488
489                if (dmub->hw_funcs.setup_windows)
490                        dmub->hw_funcs.setup_windows(dmub, &cw2,
&cw3, &cw4,
491                                                     &cw5, &cw6);
492
493                if (dmub->hw_funcs.setup_outbox0)
494                        dmub->hw_funcs.setup_outbox0(dmub, &outbox0);
495
496                if (dmub->hw_funcs.setup_mailbox)
497                        dmub->hw_funcs.setup_mailbox(dmub, &inbox1);
498                if (dmub->hw_funcs.setup_out_mailbox)
499                        dmub->hw_funcs.setup_out_mailbox(dmub, &outbox1);
500        }
501

   13. Condition mail_fb, taking true branch.

502        if (mail_fb) {
503                dmub_memset(&rb_params, 0, sizeof(rb_params));
504                rb_params.ctx = dmub;
505                rb_params.base_address = mail_fb->cpu_addr;
506                rb_params.capacity = DMUB_RB_SIZE;
507
508                dmub_rb_init(&dmub->inbox1_rb, &rb_params);
509
510                // Initialize outbox1 ring buffer
511                rb_params.ctx = dmub;
512                rb_params.base_address = (void *) ((uint64_t)
(mail_fb->cpu_addr) + DMUB_RB_SIZE);
513                rb_params.capacity = DMUB_RB_SIZE;
514                dmub_rb_init(&dmub->outbox1_rb, &rb_params);
515
516        }
517
518        dmub_memset(&outbox0_rb_params, 0, sizeof(outbox0_rb_params));
519        outbox0_rb_params.ctx = dmub;


Dereference after null check (FORWARD_NULL)
    14. var_deref_op: Dereferencing null pointer tracebuff_fb.

520        outbox0_rb_params.base_address = (void
*)((uint64_t)(tracebuff_fb->cpu_addr) + TRACE_BUFFER_ENTRY_OFFSET);
521        outbox0_rb_params.capacity = sizeof(struct
dmcub_trace_buf_entry) * PERF_TRACE_MAX_ENTRY;


The check on line 447 implies that tracebuf_fb could possibly be null,
however on line 520 tracebuf_fb is being dereferenced, so there is a
possibly (perhaps unlikely) null pointer dereference issue here.

Colin
522        dmub_rb_init(&dmub->outbox0_rb, &outbox0_rb_params);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
