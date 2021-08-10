Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFC43E56D5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 11:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F4C89F8B;
	Tue, 10 Aug 2021 09:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B8E89F8B;
 Tue, 10 Aug 2021 09:28:15 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id oa17so7316944pjb.1;
 Tue, 10 Aug 2021 02:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=X77WBIfldn7rqm2+21Ngl7e086LBbBLmUU8LtON+/iY=;
 b=tPR88JiHmVARTkdlHzXNVmRayC8gz4m3WoxjQ3pzPQNnx/fUDaTBoFz7klr57I09m5
 Ip6/DsMfswcRt3y17XO2Gzzj1aJl1thFKcc/RuOBZMSTQZDM/ZoYlPvoAn+lb2T3/Vwk
 eH+EUAGDmQCt8qynwNxh4V4seneoVTEyTJjt0FYj0shNM3rBmxnPMNba8vwOYKXucjnB
 /MUIkjskKx78RMgDBFWMw4tcJE6/OjQkjzA0YB9JorpP/uy0Fim3qBW4fv1DAZtBdmAQ
 v2AjvrzBDMvz+fpPeiuXvsy3RcRRd+1bfB1ShRTSC3zq+yAYt/CDeuU/7pBlxdxbFKvP
 Jcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=X77WBIfldn7rqm2+21Ngl7e086LBbBLmUU8LtON+/iY=;
 b=p4myJQF7f1cbjs9cR8yv261xQJm6MAz8eIz9CP6+L4Yks5Pu6CAoGkdntXFxRetMRn
 53O1OqMqOPaqJn/n6BMdYMiYTs90cXrT9iE+AOW98JAe3PwWGeOdInBjNSl/q4mCP1h3
 lsy6a0FhrRyQZN415a9CZ5xYikh8az/M97Vo2YiCjqCsDK4n/jzdTsyolWIckunUN+Y1
 EC/V3xR48DSXuurWCFwWyEF7KexAe1wMEFgodNWygh7rYhMDxOyosJ1ntFLwMNG024el
 FoOxTZ7FKsh9UwFAFVS4/40/V9s4pkwZFSgl2kJPJnAiqE5L2ZOmKhBM0+E+3kQYKXi0
 +UPg==
X-Gm-Message-State: AOAM5326Xpm0PfEPE1BMuMxS/4bln6suwvU9WnEhJc2vOfRQ3l5sJlBh
 XjFJx3ts1nSj/RrwbDnOMp8=
X-Google-Smtp-Source: ABdhPJx7FxoxDiTKwaYLzT3evYK5osmhZk91QOFiVQx3BHBVDIWdO7RuM6gWEmb8BAGZLzVq1K+9AQ==
X-Received: by 2002:a63:e643:: with SMTP id p3mr838997pgj.213.1628587694956;
 Tue, 10 Aug 2021 02:28:14 -0700 (PDT)
Received: from [10.94.0.22] ([85.203.23.36])
 by smtp.gmail.com with ESMTPSA id z15sm27039499pgc.13.2021.08.10.02.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 02:28:14 -0700 (PDT)
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, evan.quan@amd.com, luben.tuikov@amd.com,
 tzimmermann@suse.de, lee.jones@linaro.org, mh12gx2825@gmail.com,
 sakari.ailus@linux.intel.com, zhangqilong3@huawei.com, pmladek@suse.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 "baijiaju1990@gmail.com" <baijiaju1990@gmail.com>
From: Tuo Li <islituo@gmail.com>
Subject: [BUG] drm/amdgpu: possible null-pointer dereference in
 dce_vXX_0_afmt_setmode()
Message-ID: <650a9f72-712c-c5a3-dc4c-1251fb3bb6cd@gmail.com>
Date: Tue, 10 Aug 2021 17:28:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Our static analysis tool finds some possible null-pointer dereferences 
in the amdgpu driver in Linux 5.14.0-rc3:

In dce_v10_0.c:
The variable encoder->crtc is checked in:
1591:    if (encoder->crtc)

This indicates that encoder->crtc can be NULL.
Then the function dce_v10_0_audio_set_dto() is called with the argument 
encoder:
1600:    ce_v10_0_audio_set_dto(encoder, mode->clock);

However, encoder->crtc is dereferenced in this function:
1545:    struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(encoder->crtc);
1559:    tmp = REG_SET_FIELD(tmp, DCCG_AUDIO_DTO_SOURCE, 
DCCG_AUDIO_DTO0_SOURCE_SEL, amdgpu_crtc->crtc_id);

In dce_v11_0.c and dce_v8_0.c, situations are the same.

I am not quite sure whether these possible null-pointer dereferences are 
real and how to fix them if they are real.
Any feedback would be appreciated, thanks!

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>

Best wishes,
Tuo Li
