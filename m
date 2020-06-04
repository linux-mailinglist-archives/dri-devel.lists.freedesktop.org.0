Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEA21EE012
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 10:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79D36E04E;
	Thu,  4 Jun 2020 08:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E9D6E04E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 08:50:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d128so4733119wmc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=i9Lb2kfvjheBiCcoIHR9vzCH13IVr9VVaRPFD6gb2tw=;
 b=Ybbo+SNCbbdB4Db0BERZoV+IS/ZAal0nUHM3rPHsiXQqvcrG+ZHVRyxh3RH3Omt1c0
 FReP1+SVrFh7MwOIEhSRfFCGLJHOiF9AZyikehWDzkS5dAWex+8sebsToS3k3C99iZ1H
 bGMRMBK8useA8FreYZvnAo0KqadijvyGAz87U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=i9Lb2kfvjheBiCcoIHR9vzCH13IVr9VVaRPFD6gb2tw=;
 b=p+QIW/pSTbO/+xwHuaDf9qlA9bQi2f3iwwtde4ycAAxur2kMBuaYZsTOB69+A541C6
 QJ+4Wah5ZjIiPAAiFa/3d2nXfy0rIdjxpjYZU1Tt4ExFHC+lz6eaaqp2LOqhPOxuqRP9
 ITJjP0sPpfN74kvTCyPLAOgqrJKFFZFSVTxyqQsFKu0ztPEDXilZcSr2hRFKI5rGB2dN
 r/kp+n8dIMZo2TplNMHFlslf5ru1S01iqCAehElpDLvZnJ/Sobod9nW6To+iGaVpLyJP
 cvP+d+TFuz2fToC+PgZA+q6+io1BLnxG8FG2QfPeJCUGGDfWMSiKMxzvXMX2IBVBmADs
 0FnA==
X-Gm-Message-State: AOAM531wcP02g1DW2BnXZ2kPf2OcyTsE1Iq/QCmBKhfX3Gg/chEBAy4R
 6qH01gETOqnMQ93OgX1n7tgYBQ==
X-Google-Smtp-Source: ABdhPJzlfYUG7REX7JnlfEgpF/yYLe/bFD3D+XFPyipYhk5uI0hmUf/ZT9TOZo4R/GLocgZ+amrrSQ==
X-Received: by 2002:a05:600c:2317:: with SMTP id
 23mr3019544wmo.139.1591260602159; 
 Thu, 04 Jun 2020 01:50:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t13sm6718960wrn.64.2020.06.04.01.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 01:50:01 -0700 (PDT)
Date: Thu, 4 Jun 2020 10:49:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Ahmed S. Darwish" <a.darwish@linutronix.de>
Subject: Re: [PATCH v2 6/6] dma-buf: Remove custom seqcount lockdep class key
Message-ID: <20200604084958.GU20149@phenom.ffwll.local>
Mail-Followup-To: "Ahmed S. Darwish" <a.darwish@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Sebastian A. Siewior" <bigeasy@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20200603144949.1122421-1-a.darwish@linutronix.de>
 <20200603144949.1122421-7-a.darwish@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603144949.1122421-7-a.darwish@linutronix.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "Sebastian A. Siewior" <bigeasy@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 David Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 04:49:49PM +0200, Ahmed S. Darwish wrote:
> Commit 3c3b177a9369 ("reservation: add support for read-only access
> using rcu") introduced a sequence counter to manage updates to
> reservations. Back then, the reservation object initializer
> reservation_object_init() was always inlined.
> 
> Having the sequence counter initialization inlined meant that each of
> the call sites would have a different lockdep class key, which would've
> broken lockdep's deadlock detection. The aforementioned commit thus
> introduced, and exported, a custom seqcount lockdep class key and name.
> 
> The commit 8735f16803f00 ("dma-buf: cleanup reservation_object_init...")
> transformed the reservation object initializer to a normal non-inlined C
> function. seqcount_init(), which automatically defines the seqcount
> lockdep class key and must be called non-inlined, can now be safely used.
> 
> Remove the seqcount custom lockdep class key, name, and export. Use
> seqcount_init() inside the dma reservation object initializer.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Patch lgtm, and Ahmed says plan is that this should land through -tip
since it's part of a larger series, so

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

for merging through whatever tree/branch fits bets. I don't expect
conflicts here, nothing in-flight touching this. I expect this will show
up in 5.9-rc1 or so.

Cheers, Daniel

> ---
>  drivers/dma-buf/dma-resv.c | 9 +--------
>  include/linux/dma-resv.h   | 2 --
>  2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 4264e64788c4..590ce7ad60a0 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -50,12 +50,6 @@
>  DEFINE_WD_CLASS(reservation_ww_class);
>  EXPORT_SYMBOL(reservation_ww_class);
>  
> -struct lock_class_key reservation_seqcount_class;
> -EXPORT_SYMBOL(reservation_seqcount_class);
> -
> -const char reservation_seqcount_string[] = "reservation_seqcount";
> -EXPORT_SYMBOL(reservation_seqcount_string);
> -
>  /**
>   * dma_resv_list_alloc - allocate fence list
>   * @shared_max: number of fences we need space for
> @@ -134,9 +128,8 @@ subsys_initcall(dma_resv_lockdep);
>  void dma_resv_init(struct dma_resv *obj)
>  {
>  	ww_mutex_init(&obj->lock, &reservation_ww_class);
> +	seqcount_init(&obj->seq);
>  
> -	__seqcount_init(&obj->seq, reservation_seqcount_string,
> -			&reservation_seqcount_class);
>  	RCU_INIT_POINTER(obj->fence, NULL);
>  	RCU_INIT_POINTER(obj->fence_excl, NULL);
>  }
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index ee50d10f052b..a6538ae7d93f 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -46,8 +46,6 @@
>  #include <linux/rcupdate.h>
>  
>  extern struct ww_class reservation_ww_class;
> -extern struct lock_class_key reservation_seqcount_class;
> -extern const char reservation_seqcount_string[];
>  
>  /**
>   * struct dma_resv_list - a list of shared fences
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
