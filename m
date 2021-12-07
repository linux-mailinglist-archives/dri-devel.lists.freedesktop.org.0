Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4114246C23D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 19:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBA02A692;
	Tue,  7 Dec 2021 18:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D074C2A68E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 18:00:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i5so31235854wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 10:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EiqCUuFTOaRo/tgqA8xrWt+e2aBMmPmV9HZAaRZzi4M=;
 b=kekxCseiQnZE6ia9fYpLM+7iu/W5j8U/WQfwvIVBhJ+42/oP/hEwc9gvf+dE8z40sv
 P5gGhhPxcX62fMTxjI+sPPLmKasfvD4Ss3RXBtT6n9vaqm5J8w+KmxSXtWe3ulzsAYcB
 WlF3lK33QmLCmkiKXj7Rtie64WHrWPSPQVFoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EiqCUuFTOaRo/tgqA8xrWt+e2aBMmPmV9HZAaRZzi4M=;
 b=mUFBtntJan+hTx6VFq8QeQmODCOdzKvzK5JM9CxOPZRm4NrRkyUE7mRHsH4dFj/04Q
 9WR7+GuEI1gXrz8Bq9gNMcU5E5x8S1j+fNR/d9ah/5wef/3L0nYuoJ2SKfHtnn9kVn6E
 1MKot8ak6IiNfQjGmr3uWTZ6TbCLlugSFmM7hKoiF9Eg5vx4wtTPyrPjBFp/Q5gfE5PL
 fRPqoSjZiNmUNynBfJsd4DQOujNumVslXzXeNmrLfGUyZN8dl+IkAefITdZqTDYBozlA
 H7aJSIiOs0JC2W5IXlfwmWolhVb8hmJVouU1ZG05Ylx/rji8Dp2QnbPJ1nraWlfu2x/L
 ftZg==
X-Gm-Message-State: AOAM532UqSJrl+07mcaGbxdZwfFtJRC/qwOCAaq6XU04SbXvVrKyYIOo
 awWR7+hTQvKMOhPnoHPh3+e3vg==
X-Google-Smtp-Source: ABdhPJxs13h8PDN0IJpRCM/ovsIzx2QPwiUR5h4o2Srl/9wc0WxW37VcSFAv+1p3EPlTK2OsYY/nrQ==
X-Received: by 2002:a5d:4901:: with SMTP id x1mr51613404wrq.473.1638900056427; 
 Tue, 07 Dec 2021 10:00:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u13sm3800483wmq.14.2021.12.07.10.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 10:00:56 -0800 (PST)
Date: Tue, 7 Dec 2021 19:00:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] drm/i915: Don't disable interrupts and pretend a lock as
 been acquired in __timeline_mark_lock().
Message-ID: <Ya+hVmHuON31uCtG@phenom.ffwll.local>
References: <20211118165914.pckik75emivsilek@linutronix.de>
 <YZfK8LDcGzQEchel@phenom.ffwll.local>
 <20211130163309.kvw6kbuzwurnqlt7@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130163309.kvw6kbuzwurnqlt7@linutronix.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 05:33:09PM +0100, Sebastian Andrzej Siewior wrote:
> On 2021-11-19 17:04:00 [+0100], Daniel Vetter wrote:
> > Yeah if we can simplify this with reverts then I'm all for this.
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > I've asked drm/i915 maintainers to check&merge.
> 
> Thanks. Should I repost my queue (excluding this one) or should wait
> until this one has been taken care?

No idea, Tvrtko (check latest MAINTAINERS) and Joonas need to take care of
this. Holler again if it's falling through the cracks.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
