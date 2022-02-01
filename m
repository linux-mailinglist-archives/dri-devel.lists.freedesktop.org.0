Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 110454A57E5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B683210E798;
	Tue,  1 Feb 2022 07:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAE810E798;
 Tue,  1 Feb 2022 07:40:28 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d18so14732485plg.2;
 Mon, 31 Jan 2022 23:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=SGj9JOZOXXgNtUDRvOLvflNgqKK7vcnNbFrla5kWCKY=;
 b=HIlMLw6Bavjhij3LFseBLkQcqZ3YtaepttclOGF5d4rpm/iy3NiHIqZRvP/ZM9Xns1
 gjJmmp3nwlO5oS9+klLmAy3SxtRMjANEhwrGORm6tYLKVqJx1Fz9M+6a3Dqm8swFZ8Nw
 WQiSbqhvJNXa0dio3ZYUF4Ke09jAII/JFLLuOZ9XGjpuNAgnUpaV49XluTt++n7/Yu7Z
 EXsZKtEOUa8wItpMU9NLOZBGJk/dF0uCmK67txg9A58OF7rTRbYlhBphNO2pwjwb4ovH
 CIQVWAg9eLBopT3Rn51YpZ732Jn9LgpBRi+2HQXF3WxGwHracYFOM7BJx+jTrW+zK+mb
 tGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=SGj9JOZOXXgNtUDRvOLvflNgqKK7vcnNbFrla5kWCKY=;
 b=w6JsfEyucbNVuWZVPOIy/awcWyTIvb6bbxW3LA8nozWG60eV009C5yq0UIi/DOcqpf
 Kli0X7mT/YMnGSwcUH5dOWV7qLyoP4JcxkL8V34K7vrQtpMiZLYwvUi8s/24n/DcMimx
 aYAf8x0gVPh/XhfOeAp6awRMBWlJQheyoYUeRi6O2T81O8MDGsyoevS4Id67rR/vWaiy
 wBpYhmw+Vz0RuZUqjtLHxL0RpbmvQnAd+wJ/aYQAE5LJ40vM4HmJ5V68Xx2eeTRt5L07
 dexqK0i2FJ3Wfs/J+pYozb/euWPq991ULqd7fuhTJMLxBNSCDkSQ1/dnADi6WgNQIDNo
 6f+A==
X-Gm-Message-State: AOAM533O7j8MSQ94QTCrXocp9VjxG6zmKVAGXQ/OdN9LRHfy8K/75Uq/
 TA/iN7IOytUVix4VgL0MeRr7g9TVIcQ=
X-Google-Smtp-Source: ABdhPJx4vjRVsORMbUQucnv6qLo4yewajUBEplHgzuVDiDorxS65zYYg9m0Qgb54QqAI+xvCwvtKqw==
X-Received: by 2002:a17:90a:d203:: with SMTP id
 o3mr884699pju.122.1643701228233; 
 Mon, 31 Jan 2022 23:40:28 -0800 (PST)
Received: from [10.59.0.6] ([85.203.23.80])
 by smtp.gmail.com with ESMTPSA id e14sm21254160pfv.219.2022.01.31.23.40.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 23:40:27 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] gpu: drm: radeon: two possible deadlocks involving locking and
 waiting
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Message-ID: <d5e4460f-7e26-81d2-2efe-6f47760b78d2@gmail.com>
Date: Tue, 1 Feb 2022 15:40:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

My static analysis tool reports a possible deadlock in the radeon driver 
in Linux 5.16:

#BUG 1
radeon_dpm_change_power_state_locked()
   mutex_lock(&rdev->ring_lock); --> Line 1133 (Lock A)
   radeon_fence_wait_empty()
     radeon_fence_wait_seq_timeout()
       wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)

radeon_ring_backup()
   mutex_lock(&rdev->ring_lock); --> Line 289(Lock A)
   radeon_fence_count_emitted()
     radeon_fence_process()
       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)

When radeon_dpm_change_power_state_locked() is executed, "Wait X" is 
performed by holding "Lock A". If radeon_ring_backup() is executed at 
this time, "Wake X" cannot be performed to wake up "Wait X" in 
radeon_dpm_change_power_state_locked(), because "Lock A" has been 
already hold by radeon_dpm_change_power_state_locked(), causing a 
possible deadlock.
I find that "Wait X" is performed with a timeout MAX_SCHEDULE_TIMEOUT, 
to relieve the possible deadlock; but I think this timeout can cause 
inefficient execution.

#BUG 2
radeon_ring_lock()
   mutex_lock(&rdev->ring_lock); --> Line 147 (Lock A)
   radeon_ring_alloc()
     radeon_fence_wait_next()
       radeon_fence_wait_seq_timeout()
         wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)

radeon_ring_backup()
   mutex_lock(&rdev->ring_lock); --> Line 289(Lock A)
   radeon_fence_count_emitted()
     radeon_fence_process()
       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)

When radeon_ring_lock() is executed, "Wait X" is performed by holding 
"Lock A". If radeon_ring_backup() is executed at this time, "Wake X" 
cannot be performed to wake up "Wait X" in radeon_ring_lock(), because 
"Lock A" has been already hold by radeon_ring_lock(), causing a possible 
deadlock.
I find that "Wait X" is performed with a timeout MAX_SCHEDULE_TIMEOUT, 
to relieve the possible deadlock; but I think this timeout can cause 
inefficient execution.

I am not quite sure whether these possible problems are real and how to 
fix them if they are real.
Any feedback would be appreciated, thanks :)


Best wishes,
Jia-Ju Bai

