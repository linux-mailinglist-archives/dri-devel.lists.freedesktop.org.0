Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCBD89B9C0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206D111224D;
	Mon,  8 Apr 2024 08:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ufI55PrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACADC11224B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 08:10:15 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a51c8274403so147790866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 01:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712563814; x=1713168614; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0p6it0YPlZ36k+CXZuRcnhKUZZ5Drxu3l/OBL78CStY=;
 b=ufI55PrVT2ULa61PpgPsQC97phE+oEc/orA+t5yiOg+U5BW0leOrI7xwx20ek+waFl
 xTFHH5xCmFH5IBQjB2CxL8CfGQlUUqLeMmX0XI15sTzWVCVE67jebJH/oDkRmaJbP5fo
 0UGN2tPEbXGLkuFsbENO4GK6mNwDL0tBUKuUX35EOMJHw5LTvDZoZUaPOm6ASlplVkzg
 nxFCZyam4JbwcbbOEI2Py5zgMgZ/+YMxkRgN54qgqyW2swUiFFmv5oavIKvE2wj7YyQp
 5kONQUl5ZAuoQQwf7MsPgiGDH5oSEXUKgTAus6cDO/FosM5/4x3neJ7NCDuze7UzYJuX
 W90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712563814; x=1713168614;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0p6it0YPlZ36k+CXZuRcnhKUZZ5Drxu3l/OBL78CStY=;
 b=veo4Thr04Ew+QnmaSavitAuSkQ6OSXGo0IyFdiXBuKZcpcvn7wjNfGlYQFU0pJuhEe
 ZbABhV53kuYtKyN+IiyPqmbD658YF846+fun+vNYK7YpNBlvmrRCGO6VM9Lfs+GZbcUq
 xfyLro03U83y81mXnf69Eqnwb5IxOInXz3mr10et2qqWlgOeQCMk0qYaKq2mbRzQQ9i/
 /yb0SAbEiKGm375rhvY5QMWv1/D05LoqlEOtGCMnycWZPlRHR9ebqh8Da0Izey+Qoyrh
 xg9YokZhWMqCJCinU2mqByVhIM8OJDHWTOEMNYOmFtTCvuBKaGqtki1d1UHBkWilKQZX
 ubPA==
X-Gm-Message-State: AOJu0YxVGXB9KqxnNAmJSb1Mpu/LM/hYC/4t6EqsyphOIVchFqYxpjWH
 Z6nqj6f45xB7CXJUMNbMyFJVdNi92bWkjuzuos9W9ePlsv1ZosQh8e5L1msOTPH1d9s7JJIq9bP
 c
X-Google-Smtp-Source: AGHT+IGbpNLsfwrM5X6hrFjSG8g8GghqtAm8BZ3GTYLgjO3oPlqoqhT9QHnt8d6nHbOiXiXu9Wc40A==
X-Received: by 2002:a17:906:1987:b0:a4e:a7a:84e0 with SMTP id
 g7-20020a170906198700b00a4e0a7a84e0mr5116243ejd.34.1712563813635; 
 Mon, 08 Apr 2024 01:10:13 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 el24-20020a170907285800b00a518b14d6cesm4172272ejc.172.2024.04.08.01.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 01:10:13 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:35:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: boris.brezillon@collabora.com
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/panthor: Add the scheduler logical block
Message-ID: <3b7fd2f2-679e-440c-81cd-42fc2573b515@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Boris Brezillon,

Commit de8548813824 ("drm/panthor: Add the scheduler logical block")
from Feb 29, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/panthor/panthor_sched.c:1153 csg_slot_sync_state_locked()
	error: uninitialized symbol 'new_state'.

drivers/gpu/drm/panthor/panthor_sched.c
    1123 static void
    1124 csg_slot_sync_state_locked(struct panthor_device *ptdev, u32 csg_id)
    1125 {
    1126         struct panthor_csg_slot *csg_slot = &ptdev->scheduler->csg_slots[csg_id];
    1127         struct panthor_fw_csg_iface *csg_iface;
    1128         struct panthor_group *group;
    1129         enum panthor_group_state new_state, old_state;
    1130 
    1131         lockdep_assert_held(&ptdev->scheduler->lock);
    1132 
    1133         csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
    1134         group = csg_slot->group;
    1135 
    1136         if (!group)
    1137                 return;
    1138 
    1139         old_state = group->state;
    1140         switch (csg_iface->output->ack & CSG_STATE_MASK) {
                                                  ^^^^^^^^^^^^^^
This mask is 0x7.  Should it be 0x3?  That would silence the static
checker warning.

    1141         case CSG_STATE_START:
    1142         case CSG_STATE_RESUME:
    1143                 new_state = PANTHOR_CS_GROUP_ACTIVE;
    1144                 break;
    1145         case CSG_STATE_TERMINATE:
    1146                 new_state = PANTHOR_CS_GROUP_TERMINATED;
    1147                 break;
    1148         case CSG_STATE_SUSPEND:
    1149                 new_state = PANTHOR_CS_GROUP_SUSPENDED;
    1150                 break;
    1151         }
    1152 
--> 1153         if (old_state == new_state)
    1154                 return;
    1155 
    1156         if (new_state == PANTHOR_CS_GROUP_SUSPENDED)
    1157                 csg_slot_sync_queues_state_locked(ptdev, csg_id);
    1158 
    1159         if (old_state == PANTHOR_CS_GROUP_ACTIVE) {
    1160                 u32 i;
    1161 
    1162                 /* Reset the queue slots so we start from a clean
    1163                  * state when starting/resuming a new group on this
    1164                  * CSG slot. No wait needed here, and no ringbell
    1165                  * either, since the CS slot will only be re-used
    1166                  * on the next CSG start operation.
    1167                  */
    1168                 for (i = 0; i < group->queue_count; i++) {
    1169                         if (group->queues[i])
    1170                                 cs_slot_reset_locked(ptdev, csg_id, i);
    1171                 }
    1172         }
    1173 
    1174         group->state = new_state;
    1175 }

regards,
dan carpenter
