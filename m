Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B0912B80
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 18:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CCC10E0FB;
	Fri, 21 Jun 2024 16:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="AJXn9T+b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D3D10E0FB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 16:39:31 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ec4e9075e0so1092941fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718987969; x=1719592769; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+B4q6j7rnOa8lY5YGMu4l7DUBInPDPw5kUdlNxco7g=;
 b=AJXn9T+bRO57u4m68GH2eHRbHi/4cuIJcDOhncYc6N6buqdxjuzwFmJWNooXEfTuwm
 R/yVVEauzSbM8U8Dhgcswx/iG+7m1c2ACwNpmgH9pnq3nWNuwvIA+29UACT+TxLjNcCQ
 fo0kpjnZB2UWWKsJIliq7NqV8AzzxdiRk/+DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718987969; x=1719592769;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d+B4q6j7rnOa8lY5YGMu4l7DUBInPDPw5kUdlNxco7g=;
 b=luEanxNimrJQu9XeWqadJzZycu3+zIZnG7c4/FlOMsUKfpiqcs/GmAnUIqsQQsWu6k
 Tlca/evTNmy31bb38ux5aZO2UxLuhT2ihXckkktAg19aKBYijAJwTI/zbVeAlkCfuWMX
 WP5kIylYoOBX2WHCZUg3ToJTFCCry4HyiIDiuI4yW4xeliBgLo17ooAe2dn9kHvTVNSP
 85CslOjiPZ3m/jEris3I1Mzsk/Z+j7K4/Z41oHp2fdlHvJd1bZBi2r3crCDyymm77pYI
 PnDb7PZlCqm0zAnLXJiZBE/bkh8yd0XMrXwW3QfVngi9CmR5tDvmeZIHvU42Vw3v6WT/
 ofbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg6i2lu7KbLO4RnCxvs2AMqLh/kfH2aQCWgw9lM84I1Rt1UCFB1Py0/y/kVjIr0KmxiCgKPubzgyETXGxysac9pgbEpK/4ZBscS/saGabr
X-Gm-Message-State: AOJu0YzW2T/mRtcyFJOjFygtWOEKJfQGI4Bgdu8Ak7wvgAU1F10PWuAt
 5llIBCi5x2AXGrwNdYEmBNfkg1IiJUjUY9lnNos5y1Z4njUzsvqF+72+NkKPiU8=
X-Google-Smtp-Source: AGHT+IG0ddJjXBlSpbVZD4r9/H9u00KEsN82L79oP/i1sXbnFlr8kZL72WUFKn7R6WiFRcw1OhTvRw==
X-Received: by 2002:a05:651c:1a12:b0:2ec:5365:34d3 with SMTP id
 38308e7fff4ca-2ec53653746mr3909701fa.1.1718987968916; 
 Fri, 21 Jun 2024 09:39:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8c8960sm2247234f8f.100.2024.06.21.09.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 09:39:28 -0700 (PDT)
Date: Fri, 21 Jun 2024 18:39:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 11/11] drm: Replace strcpy() with __get_task_comm()
Message-ID: <ZnWsvvRUonTmZG5h@phenom.ffwll.local>
Mail-Followup-To: Yafang Shao <laoar.shao@gmail.com>,
 torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
References: <20240621022959.9124-1-laoar.shao@gmail.com>
 <20240621022959.9124-12-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621022959.9124-12-laoar.shao@gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Fri, Jun 21, 2024 at 10:29:59AM +0800, Yafang Shao wrote:
> To prevent erros from occurring when the src string is longer than the
> dst string in strcpy(), we should use __get_task_comm() instead. This
> approach also facilitates future extensions to the task comm.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

I guess the entire series will go in through a dedicated pull or some
other tree, so

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

for merging through whatever non-drm tree makes most sense for this.

Cheers, Sima

> ---
>  drivers/gpu/drm/drm_framebuffer.c     | 2 +-
>  drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 888aadb6a4ac..25262b07ffaf 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -868,7 +868,7 @@ int drm_framebuffer_init(struct drm_device *dev, struct drm_framebuffer *fb,
>  	INIT_LIST_HEAD(&fb->filp_head);
>  
>  	fb->funcs = funcs;
> -	strcpy(fb->comm, current->comm);
> +	__get_task_comm(fb->comm, sizeof(fb->comm), current);
>  
>  	ret = __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
>  				    false, drm_framebuffer_free);
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 625b3c024540..b2c16a53bd24 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1411,7 +1411,7 @@ static bool record_context(struct i915_gem_context_coredump *e,
>  	rcu_read_lock();
>  	task = pid_task(ctx->pid, PIDTYPE_PID);
>  	if (task) {
> -		strcpy(e->comm, task->comm);
> +		__get_task_comm(e->comm, sizeof(e->comm), task);
>  		e->pid = task->pid;
>  	}
>  	rcu_read_unlock();
> -- 
> 2.39.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
