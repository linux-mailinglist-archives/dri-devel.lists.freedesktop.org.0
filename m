Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BA089F992
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 16:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0585310FF25;
	Wed, 10 Apr 2024 14:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D65F1133CD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 14:11:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7178E139F;
 Wed, 10 Apr 2024 07:12:20 -0700 (PDT)
Received: from [10.57.74.122] (unknown [10.57.74.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3CD63F766;
 Wed, 10 Apr 2024 07:11:49 -0700 (PDT)
Message-ID: <8d68acac-06d2-4d18-b257-2807209dadc5@arm.com>
Date: Wed, 10 Apr 2024 15:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/panthor: Add the scheduler logical block
To: Dan Carpenter <dan.carpenter@linaro.org>, boris.brezillon@collabora.com
Cc: dri-devel@lists.freedesktop.org
References: <3b7fd2f2-679e-440c-81cd-42fc2573b515@moroto.mountain>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <3b7fd2f2-679e-440c-81cd-42fc2573b515@moroto.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/04/2024 08:35, Dan Carpenter wrote:
> Hello Boris Brezillon,
> 
> Commit de8548813824 ("drm/panthor: Add the scheduler logical block")
> from Feb 29, 2024 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	drivers/gpu/drm/panthor/panthor_sched.c:1153 csg_slot_sync_state_locked()
> 	error: uninitialized symbol 'new_state'.
> 
> drivers/gpu/drm/panthor/panthor_sched.c
>     1123 static void
>     1124 csg_slot_sync_state_locked(struct panthor_device *ptdev, u32 csg_id)
>     1125 {
>     1126         struct panthor_csg_slot *csg_slot = &ptdev->scheduler->csg_slots[csg_id];
>     1127         struct panthor_fw_csg_iface *csg_iface;
>     1128         struct panthor_group *group;
>     1129         enum panthor_group_state new_state, old_state;
>     1130 
>     1131         lockdep_assert_held(&ptdev->scheduler->lock);
>     1132 
>     1133         csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
>     1134         group = csg_slot->group;
>     1135 
>     1136         if (!group)
>     1137                 return;
>     1138 
>     1139         old_state = group->state;
>     1140         switch (csg_iface->output->ack & CSG_STATE_MASK) {
>                                                   ^^^^^^^^^^^^^^
> This mask is 0x7.  Should it be 0x3?  That would silence the static
> checker warning.

The mask is correct - it's effectively a hardware register (well it's
read/written by the firmware on the hardware). States 4-7 are officially
"reserved" and Should Not Happen™!

I guess a "default:" case with a WARN_ON() would be the right solution.

Steve

>     1141         case CSG_STATE_START:
>     1142         case CSG_STATE_RESUME:
>     1143                 new_state = PANTHOR_CS_GROUP_ACTIVE;
>     1144                 break;
>     1145         case CSG_STATE_TERMINATE:
>     1146                 new_state = PANTHOR_CS_GROUP_TERMINATED;
>     1147                 break;
>     1148         case CSG_STATE_SUSPEND:
>     1149                 new_state = PANTHOR_CS_GROUP_SUSPENDED;
>     1150                 break;
>     1151         }
>     1152 
> --> 1153         if (old_state == new_state)
>     1154                 return;
>     1155 
>     1156         if (new_state == PANTHOR_CS_GROUP_SUSPENDED)
>     1157                 csg_slot_sync_queues_state_locked(ptdev, csg_id);
>     1158 
>     1159         if (old_state == PANTHOR_CS_GROUP_ACTIVE) {
>     1160                 u32 i;
>     1161 
>     1162                 /* Reset the queue slots so we start from a clean
>     1163                  * state when starting/resuming a new group on this
>     1164                  * CSG slot. No wait needed here, and no ringbell
>     1165                  * either, since the CS slot will only be re-used
>     1166                  * on the next CSG start operation.
>     1167                  */
>     1168                 for (i = 0; i < group->queue_count; i++) {
>     1169                         if (group->queues[i])
>     1170                                 cs_slot_reset_locked(ptdev, csg_id, i);
>     1171                 }
>     1172         }
>     1173 
>     1174         group->state = new_state;
>     1175 }
> 
> regards,
> dan carpenter

