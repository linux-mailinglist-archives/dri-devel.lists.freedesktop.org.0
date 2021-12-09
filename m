Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA946EE77
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EF310E76B;
	Thu,  9 Dec 2021 16:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADDB10E116;
 Thu,  9 Dec 2021 06:28:50 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id 7so7307998oip.12;
 Wed, 08 Dec 2021 22:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=IhIul+4nURod6NuSkYTrchSPnXVCxWUJGXACRxYc3MQ=;
 b=eXSVG+Ndarp4Nov0ojL5vYXJOqopOe8rmbtZMAES5EqdQfhuTJT9Uq3lALtJGa4LbO
 wWHdJFJ87qjeMcSOV3aq0PkzuieWlIvRP179Hr6+sgCEYfH7wf+V4jVqH10ELhTez0XB
 22huR9IEqlUxwdOVegX+j/rAjRjz7L8mt/AiBEGrV7CjsOrfNoQ1BJ9XPY8+vJZH31o7
 2P/ix6dz02VvGEjb+x0Ea1/8RXd4aZ7czYa7w2YNw1bcNUZxsKs/e400rD6pCJCOWN7L
 q5fhY1g9Ipg3RqbxuIOSnqylc7dCzgsNU5GquVam3pqRibhz+3qTwbdWItlmR7WucDdh
 VwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=IhIul+4nURod6NuSkYTrchSPnXVCxWUJGXACRxYc3MQ=;
 b=qMree8V8qqeTE0w7JpLoG48DPbaGlBCb2TL55vqZj6CYDQrQRwO3QOSso4bU5uo3qu
 EbTvPbuNmpRZxm3x8rtBhlHn7vgx7zESYSbumoEgOHLamjYpFhinCG8nqQFdO1pQWZ/g
 VewLjHnwz+ed+hI+q8uHr9wy9VLZpQjM3+h4RVbrf7KchHagO2qcWiVpQwFp7A7y6rkT
 IVbn+shFsXNRQcSd+I5m5mQsZxUFpQ0mSFDi3Ej9UaSSju73VqjQhDVPU5Bo4WMXg57c
 woXMgHqpX9K5lleX9tiR8nEsPvfGPDkF+V+xg/hHUANOv7y9BC/FEBYqQ8HyqIjN6aLv
 JupA==
X-Gm-Message-State: AOAM531NDo/TU8JJIkQQFRA+tKnjEQi28atdD7ORHrGXbYXasTGcGUHp
 +xaxzf7n/Oqih3IyJLxcM7X6w98jF/w=
X-Google-Smtp-Source: ABdhPJx7+EvOV3k5F+MwkvlqnlUuZKHGOaLEFVN8ri3k3vpvOVFTKnJpQnsX5z8mTpBCirtuipNWIg==
X-Received: by 2002:a17:90b:4b4c:: with SMTP id
 mi12mr12376886pjb.66.1639020881197; 
 Wed, 08 Dec 2021 19:34:41 -0800 (PST)
Received: from [183.173.151.43] ([183.173.151.43])
 by smtp.gmail.com with ESMTPSA id y18sm4729594pfp.190.2021.12.08.19.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 19:34:40 -0800 (PST)
Subject: Re: [BUG] gpu: drm: amd: amdgpu: possible ABBA deadlock in
 amdgpu_set_power_dpm_force_performance_level() and
 amdgpu_debugfs_process_reg_op()
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Hawking.Zhang@amd.com,
 Felix.Kuehling@amd.com, ray.huang@amd.com, lee.jones@linaro.org
References: <2dc31435-ba62-b6a4-76dc-cfe9747f4cfb@gmail.com>
Message-ID: <963eab5f-f333-456e-784c-0d2c81b849da@gmail.com>
Date: Thu, 9 Dec 2021 11:34:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2dc31435-ba62-b6a4-76dc-cfe9747f4cfb@gmail.com>
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

Could you please provide the feedback to my previous report?
Thanks a lot :)


Best wishes,
Jia-Ju Bai

On 2021/9/15 17:39, Jia-Ju Bai wrote:
> Hello,
>
> My static analysis tool reports a possible ABBA deadlock in the amdgpu 
> driver in Linux 5.10:
>
> amdgpu_debugfs_process_reg_op()
>   mutex_lock(&adev->grbm_idx_mutex); --> Line 250 (Lock A)
>   mutex_lock(&adev->pm.mutex); --> Line 259 (Lock B)
>
> amdgpu_set_power_dpm_force_performance_level()
>   mutex_lock(&adev->pm.mutex); --> Line 381 (Lock B)
>     pp_dpm_force_performance_level() --> function pointer via 
> "amdgpu_dpm_force_performance_level()"
>       pp_dpm_en_umd_pstate()
>         amdgpu_device_ip_set_clockgating_state()
>           gfx_v7_0_set_clockgating_state() --> function pointer via 
> "funcs->set_clockgating_state()"
>             gfx_v7_0_enable_mgcg()
>               mutex_lock(&adev->grbm_idx_mutex); --> Line 3646 (Lock A)
>               mutex_lock(&adev->grbm_idx_mutex); --> Line 3697 (Lock A)
>
> When amdgpu_debugfs_process_reg_op() and 
> amdgpu_set_power_dpm_force_performance_level() are concurrently 
> executed, the deadlock can occur.
>
> I am not quite sure whether this possible deadlock is real and how to 
> fix it if it is real.
> Any feedback would be appreciated, thanks :)
>
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
>
>
> Best wishes,
> Jia-Ju Bai

