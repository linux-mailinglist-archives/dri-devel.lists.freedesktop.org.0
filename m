Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7F0289FCF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C286EEA1;
	Sat, 10 Oct 2020 10:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682FF89533
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 12:12:23 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id 140so8540587qko.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 05:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CDbjI7PI2DVtcti/K71bQwrAiX/e3WO6iYhXq1xpE8k=;
 b=QZHZihMbJ0+6cO/RXFdRTnbjHZMdsMwMdoZ9ofxIbLiL7huuUpUScZKwWV84kB55Bx
 Uj0tRXkYKOAM75Zw3mq9huJb+sXq21viOZihFZp7lRXmxRJ1cFf8BtITIb1t2tYeDMCa
 txj96jZKuDfh/KqtvpNSOfhj3rLyTVUnAr0oXGalYRsnEuMdnS5jRpZrZBYvWtLxhF/R
 8KJwS/cHgY0rK/bg+oGMABqazzprmcMisElyCeHlYguGApZ1AR8/+MXPoqVhnTd0VCNc
 25kstyMGbbGfaTeeP9LQeGTP2F+aZXhWaayqadeXvcUq6gtI3AMZT8PIqYCcvUwK2WBG
 1Xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CDbjI7PI2DVtcti/K71bQwrAiX/e3WO6iYhXq1xpE8k=;
 b=MpYZEESUc2mwxIR0wUZsf6iNcwfyejtNwOyPu86USLoFmkHgbhv+tG/JqfEQn3dcaG
 ge3F2PzK3ymeAukMbfziOKyAeeiMwSh8/LatUzHaR36Dl8UkBEyTZlwnE35gCnesXkhB
 u/EbN9h2S40P2TanaML+b5ug9sT3jWNB6GPa4dYmJD66zlIzEPuTHW7BzTHJfIhA8B4H
 xjAg+cgxma+efeRljqrvA/bYvZgw2imB0fneOr8Z214hZPpdSSrUkoGYJYhxGcpdEaoK
 t/JvWcTJWuaJFirV0Tfabb1EtW58SpbgW2l8fqT5vsiYZzU7VfIdYuF2UZB2Oqgm9qnm
 ileA==
X-Gm-Message-State: AOAM532JT6mUGCxRgpkcTGxWNsz0fkBOOQs9XrjDapK6X3MOhJ1Wc5WB
 NgoRHWaUhgIpj3nsJmZmmAQTYQ==
X-Google-Smtp-Source: ABdhPJxEdEoxk4QkWTG/LbIw5wa4/oJkAIU0dpDguLktaDqFHaLdn7sPQWVl5NbgF//Vvgox/Hv3PQ==
X-Received: by 2002:a05:620a:62b:: with SMTP id
 11mr11556303qkv.229.1602245542390; 
 Fri, 09 Oct 2020 05:12:22 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id g19sm5882365qkm.64.2020.10.09.05.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 05:12:21 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQrG0-001xcJ-L2; Fri, 09 Oct 2020 09:12:20 -0300
Date: Fri, 9 Oct 2020 09:12:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: christian.koenig@amd.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 chris@chris-wilson.co.uk, airlied@redhat.com,
 akpm@linux-foundation.org, sumit.semwal@linaro.org
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
Message-ID: <20201009121220.GM5177@ziepe.ca>
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008141211.GG438822@phenom.ffwll.local>
 <8fc28dfa-4bae-bee1-5aca-4e3c6e88b994@gmail.com>
 <20201009073900.GL438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009073900.GL438822@phenom.ffwll.local>
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 09:39:00AM +0200, Daniel Vetter wrote:
> I just noticed this here in the patch because everyone else does not do
> this. But looking at the mmap_region() code in mmap.c we seem to indeed
> have this problem for the error path:
> 
> unmap_and_free_vma:
> 	vma->vm_file = NULL;
> 	fput(file);
> 
> Note that the success path does things correctly (a bit above):
> 
> 	file = vma->vm_file;
> out:
> 
> So it indeed looks like dma-buf is the only one that does this fully
> correctly. So maybe we should do a follow-up patch to change the
> mmap_region exit code to pick up whatever vma->vm_file was set instead,
> and fput that?

Given that this new vma_set_file() should be the only way to
manipulate vm_file from the mmap op, I think this reflects a bug in
mm/mmap.c.. Should be:

unmap_and_free_vma:
        fput(vma->vm_file);
        vma->vm_file = NULL;

Then everything works the way you'd expect without tricky error
handling

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
