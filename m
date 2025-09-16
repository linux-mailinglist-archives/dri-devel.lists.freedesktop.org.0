Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49752B594FA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60EE10E03D;
	Tue, 16 Sep 2025 11:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="alsIN5WO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07E010E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:20:04 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-62ec5f750f7so9363171a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758021603; x=1758626403; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MZkAhMwtG05Nwx51W4BF/MbpYhaSp+19IYTVLsAUUIs=;
 b=alsIN5WOZy3seSBTbskMasOAfofTMkdpZX1airpSTmrx2Ciu2fDwFF7dLqM+tUDLLx
 m3sDTteONeHZvYRrzJuf3BXPer5WfMAlIPtx+RCntj2ZiXnNBi98PkwGDanimL4q8Om8
 7fnWLr6dB+WWGuc9Y1wn1xdytCeRrb/jYlST3EfKtf3sTCrrszlqtHmPRR/1MdYiXkhj
 NxK0PDviLcVtskBDF6N7HDwRgOin1c85o8HMsLhRtmu/jGWfgADt3UFezv7e9NXvcSjJ
 kEoXh6Ur8K1cw/GnOdUpr2qHNv6r3MqhI9s3p1h0Sg1OH5xEVyzzTp1gH99Qb4Nq2Jf6
 80Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758021603; x=1758626403;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZkAhMwtG05Nwx51W4BF/MbpYhaSp+19IYTVLsAUUIs=;
 b=O4vt/RhrjRRMBhMVM/k7kmGyp4ze7iM4n4fETdcN2H8gn1ow+tdjGPjXqECU5TO2hV
 lQKy7SqR4dETl5YbwLLUirEyKVefTenUWfYUd3DtJV0nVjMyfKY5DDhTLc8nPWfIZU4P
 VL2Cecflt+jHy74qSp7+6TP2lP4cT1bnBLqZw1RVsdXcddbfgMMJ83icUWkKQKII/zgx
 TU7Q6dWZehM6yRCIFMF9VNJ7xS6FgV7FR4+i/M6fvEdyBnl85zu7vCFcNZJP5MQN8nnl
 stiZgQ4ZIthTEJAdgzIK4sna5WQLO5pEL/GKD3Xd78SMDJKxtdSak71am1TYS4A1cZex
 BA4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2z7a9tv5VIDKfRBC77W33BtMVLN8AR06EbzmCr0sARJRMJE2tfbSLg92vhe1LQh1NvvX6ES8X7Lk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBAD3J+07Ut1Gsp5N3T/j9A+2H8h1SqVmJCyrRRs8VL3fRp1r4
 OXScC9YcMlxtAmifcelKROtXUCFQV8ruE654AYV0R7Ako9x50emoDRANnRpD0xWFagU=
X-Gm-Gg: ASbGncv9ST+h02OtGddTJOntXo1aPOD/7a17Eu7Qk5Ashca1HebYgIYEmdIXUvDEPqC
 wAyp5yWDv8xXNl7TY9Glw855fqjwd6FidoAh3pqCVaPyWSo1F67rP5sw3Ihp4z+vJ3Twjw6aoFq
 HDNloSo3+TEWtT0iHVbUQ8uvVXA4vlCCRggkAJuYI30/AeyOImGVcEpqUVwU8hoaT/GPycnvoQm
 K1J6zCacHyHbaLTUgJ+rGgF8nOG0TfCWpU8fDQk/gVC6a9JSpPx+CkpuMWpKQzIMuyteUibm7nO
 LG6tsbIQK9rxJEGAVMNUaWsATbLX7D3WbQ92yDLVXgC42uz4aEtxs9tyNYSHaesj0ei96s/BtMS
 xXQlLm7uZOPC7BC/pBi8htWJw9ANIeuU0ybg+0aij
X-Google-Smtp-Source: AGHT+IGYOku1dWOd7XgyZFqiTBP3WC2b/azuNq9E2ePki1CNpOxLiy1c6JRukGNdqA80ZoAb+KYahA==
X-Received: by 2002:a17:906:c153:b0:b04:8c45:4bdb with SMTP id
 a640c23a62f3a-b07c37fb543mr1468835066b.34.1758021602813; 
 Tue, 16 Sep 2025 04:20:02 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62f3919e168sm4212344a12.34.2025.09.16.04.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 04:20:02 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:20:00 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Qianqiang Liu <qianqiang.liu@163.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>,
 Zsolt Kajtar <soci@c64.rulez.org>, Ingo Molnar <mingo@kernel.org>,
 Nam Cao <namcao@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Granados <joel.granados@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Sohil Mehta <sohil.mehta@intel.com>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna Schumaker <anna.schumaker@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Max Kellermann <max.kellermann@ionos.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Tejun Heo <tj@kernel.org>,
 Luo Gengkun <luogengkun@huaweicloud.com>, Li Huafei <lihuafei1@huawei.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] panic: use panic_try_start() in vpanic()
Message-ID: <aMlH4CcK_n1I1gY2@pathway.suse.cz>
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
 <20250825022947.1596226-6-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825022947.1596226-6-wangjinchao600@gmail.com>
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

On Mon 2025-08-25 10:29:33, Jinchao Wang wrote:
> vpanic() had open-coded logic to claim panic_cpu with atomic_try_cmpxchg.
> This is already handled by panic_try_start().
> 
> Switch to panic_try_start() and use panic_on_other_cpu() for the fallback
> path.
> 
> This removes duplicate code and makes panic handling consistent across
> functions.
> 
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -415,7 +415,6 @@ void vpanic(const char *fmt, va_list args)
>  	static char buf[1024];
>  	long i, i_next = 0, len;
>  	int state = 0;
> -	int old_cpu, this_cpu;
>  	bool _crash_kexec_post_notifiers = crash_kexec_post_notifiers;
>  
>  	if (panic_on_warn) {
> @@ -452,13 +451,10 @@ void vpanic(const char *fmt, va_list args)
>  	 * `old_cpu == this_cpu' means we came from nmi_panic() which sets
>  	 * panic_cpu to this CPU.  In this case, this is also the 1st CPU.
>  	 */

The above comment does not fit any longer. I think that it can
be removed, maybe except for the 1st paragraph.

> -	old_cpu = PANIC_CPU_INVALID;
> -	this_cpu = raw_smp_processor_id();
> -
>  	/* atomic_try_cmpxchg updates old_cpu on failure */

Also this comment should be removed.

> -	if (atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu)) {
> +	if (panic_try_start()) {
>  		/* go ahead */
> -	} else if (old_cpu != this_cpu)
> +	} else if (panic_on_other_cpu())
>  		panic_smp_self_stop();
>  
>  	console_verbose();

Otherwise, it looks good. And the comments might be removed
by a followup patch.

Best Regards,
Petr
