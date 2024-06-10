Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F9C9026C0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 18:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305E110E4E4;
	Mon, 10 Jun 2024 16:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DdW58JSG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C4110E4BB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 16:31:51 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4217f072531so2117255e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718037109; x=1718641909; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=umjRP2/zEj1A5mFWXkSTHOPLPxcqaH01cnfd4oJRQps=;
 b=DdW58JSGTD0J75de3QfTdKaFbqP36qjqmcibOz8UPocJmH2VdTfMhc1ltGF2ENf/M7
 5vr0ksCdKxZaBlvFxKMfT6IXSn2wefnVqwBYowKZLX6gpz5vYyqpN6o2fg8mVT0riFDw
 80737MzBVjT7bv1dQmBqzDglJtzQOemDJk0vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718037109; x=1718641909;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umjRP2/zEj1A5mFWXkSTHOPLPxcqaH01cnfd4oJRQps=;
 b=N2DeYI9lUyffcvAw7bEPW/w+w1OjH2HcavQQZED+Ny5uTnC+Q7KWjh9TiUs3Cwkn8t
 lmuOI03nqGIIxrSsNeVnnzg+yFcyWMklJLqfUF00oEBvYYY+lce3OrmmnOCKVqjWegV5
 GVEXCTTi4sSDN4xW8NxAmtQJ3kyBPI6apCoEBf/HPeZwAhobR+5B3129kObnsWSlARSg
 YSZ/Y3ZNgkw/z/58ukeNxoD7X+TqQAg8eEWwxNPrmEN7q+i8zu2ZY0lHbJJnVYkfvAAA
 FCjYNMCIJIR9CxsguGUxTdwpKgOWMbH/g9YSugi9KYB6qdq2D6kn6HAP33Oa+63jToaE
 dzJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqsiKR8Q7OS/oCl1ztG4bTnxJWpKYkIPnLTle//XvFWFUoJZkcAJJMSJS7PD3eoVmukiIDNCCorzN6EJkRDwW9AIEsoz3OOAPU8QyBMli2
X-Gm-Message-State: AOJu0YxElyvL7BqkF6vrof9HFncWDJgl2NhFpuomG/aWEeCXCK5d9tUW
 /RVKgTLnHF60ZE4utdQrueSuYYxPob9mH64D5dOjZOh7OXhRTBUfalWv0wJ5RvQ=
X-Google-Smtp-Source: AGHT+IHrfMDOID53yYkgC9EYW1+HGcIufOzSyvlgT4qeSasoA0OoL0gvr+z1sWUIIDO/t0oSl7C07Q==
X-Received: by 2002:a05:6000:1ac7:b0:35f:229e:9c6d with SMTP id
 ffacd0b85a97d-35f229e9eafmr3256027f8f.6.1718037109389; 
 Mon, 10 Jun 2024 09:31:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f2774bb64sm1925642f8f.103.2024.06.10.09.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 09:31:49 -0700 (PDT)
Date: Mon, 10 Jun 2024 18:31:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org
Subject: Re: [PATCH v4 0/3] Improve gpu_scheduler trace events
Message-ID: <Zmcqci2xjmfp9UCo@phenom.ffwll.local>
References: <20240610132707.61404-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610132707.61404-1-pierre-eric.pelloux-prayer@amd.com>
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

On Mon, Jun 10, 2024 at 03:26:53PM +0200, Pierre-Eric Pelloux-Prayer wrote:
> v3: https://lists.freedesktop.org/archives/dri-devel/2024-June/456792.html
> 
> Changes since v3:
> * trace device name instead of drm_device primary index
> * no pointer deref in the TP_printk anymore. Instead the fence context/seqno
> are saved in TP_fast_assign

Some high-level comments:

- Quick summary of the what, why and how in the cover letter would be
  great.

- Link to the userspace, once you have that. At least last time we chatted
  that was still wip.

- Maybe most important to make this actually work, work well, and work
  long-term: I think we should clearly commit to these tracepoints being
  stable uapi, and document that by adding a stable tracepoint section in
  the drm uapi book.

  And then get acks from a pile of driver maintainers that they really
  think this is a good idea and has a future. Should also help with
  getting good review on the tracepoints themselves.

  Otherwise I fear we'll miss the mark again and still force userspace to
  hand-roll tracing for every driver, or maybe worse, even specific kernel
  versions.

Cheers, Sima

> 
> Pierre-Eric Pelloux-Prayer (3):
>   drm/sched: add device name to the drm_sched_process_job event
>   drm/sched: cleanup gpu_scheduler trace events
>   drm/sched: trace dependencies for gpu jobs
> 
>  .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 97 +++++++++++++++----
>  drivers/gpu/drm/scheduler/sched_entity.c      |  8 +-
>  drivers/gpu/drm/scheduler/sched_main.c        |  2 +-
>  3 files changed, 84 insertions(+), 23 deletions(-)
> 
> -- 
> 2.40.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
