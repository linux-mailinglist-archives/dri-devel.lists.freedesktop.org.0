Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD90737381
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 20:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D90F10E318;
	Tue, 20 Jun 2023 18:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B112010E318;
 Tue, 20 Jun 2023 18:08:07 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6686708c986so3285519b3a.0; 
 Tue, 20 Jun 2023 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687284487; x=1689876487;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iiaacy8dR/Z7cvZSosFFtefecDI/FL+fwVPq6hWPcAw=;
 b=XHHKTJmWHb7JZ9BreGD02oW0fUfN69x7Hg0t7ITggQQ/lyQfGdx4/avcaWYGkI/W1w
 Pd+8kYMuXjrOqvH94nc3W02M5Ye9RLintoNCYOJUvXRxFZisbcNy7PmwheSvuiurSGt/
 GpccDg76zoSf7ut7hXRYVdILlPWqv7JG84NHgeTwRruVBd5Mxq2EcIIsLBEl8SX0pqXN
 KLfb2FYkom2piH+kUjoSd9q1QmmPYD58LZOiMibJPhqSL+CsNC6ff+wFMdKJd2NJP23k
 T1ijoDYn1wH/h46Bqg+AS8K9dAWTrygVj6Lm3mJEX6hVYD23PZIw2DElhIZZF5CiZ1Kc
 vVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687284487; x=1689876487;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iiaacy8dR/Z7cvZSosFFtefecDI/FL+fwVPq6hWPcAw=;
 b=D6yDrrKRYT65PGYySU62qm9tpRzegQ0TPvs9U5LaugXXvlxEDYY8rULuEvDpcFiPa0
 GVCFwPZ1tOXyC9JMP7rBdXuVeCn8HMezy1mCkaOOQBEc3xaAW3opx2/J5ywCSM7kJjSJ
 3K7R5To9VkfmdFScfgJF8OHsf7w+no53aRlvW1z4QkiNXC9D3iFg394JsT9DUGQ3/OQC
 /z6/xPFZ+khviG8Gyx2OxwXkix8/StCnCug7QGYGMQkQfZWWZ9nPekqxOizHiStqnEd5
 Z3GM2ScIYh3l0dfJXYG1fHnl59zO6xuKbyqudG6m1Rx7UdUTgZ0ggd4nUeqGXoUUHpuM
 lwng==
X-Gm-Message-State: AC+VfDyhWis7AVHQfjxjWFWdsNln5eXxWT7VP83fjYUf4CWfBPB7ToFI
 6Q8edSxkRV35mRmBRYD1Uy0=
X-Google-Smtp-Source: ACHHUZ6wJyE9uAHtsdE5qeiyzXecN6CaQmbaVvxhTL7kVp9n6WCVdxURW/S2LOCWBFbBUP2h7be7Ug==
X-Received: by 2002:a05:6a00:991:b0:662:4041:30ba with SMTP id
 u17-20020a056a00099100b00662404130bamr18575102pfg.0.1687284486766; 
 Tue, 20 Jun 2023 11:08:06 -0700 (PDT)
Received: from sumitra.com ([106.207.162.67]) by smtp.gmail.com with ESMTPSA id
 t2-20020a62ea02000000b0064cca73d911sm1591371pfh.103.2023.06.20.11.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 11:08:06 -0700 (PDT)
Date: Tue, 20 Jun 2023 11:07:59 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH v2] drm/i915: Replace kmap() with kmap_local_page()
Message-ID: <20230620180759.GA419158@sumitra.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6491a85a37cc8_28e729425@iweiny-mobl.notmuch>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sumitra Sharma <sumitraartsy@gmail.com>, Deepak R Varma <drv@mailo.com>,
 Fabio <fmdefrancesco@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, Jun 20, 2023 at 06:23:38AM -0700, Ira Weiny wrote:
> Sumitra Sharma wrote:
> > On Sun, Jun 18, 2023 at 11:11:08AM -0700, Ira Weiny wrote:
> > > Sumitra Sharma wrote:
> > > > kmap() has been deprecated in favor of the kmap_local_page()
> > > > due to high cost, restricted mapping space, the overhead of a
> > > > global lock for synchronization, and making the process sleep
> > > > in the absence of free slots.
> > > > 
> > > > kmap_local_page() is faster than kmap() and offers thread-local
> > > > and CPU-local mappings, take pagefaults in a local kmap region
> > > > and preserves preemption by saving the mappings of outgoing tasks
> > > > and restoring those of the incoming one during a context switch.
> > > > 
> > > > The mapping is kept thread local in the function
> > > > “i915_vma_coredump_create” in i915_gpu_error.c
> > > > 
> > > > Therefore, replace kmap() with kmap_local_page().
> > > > 
> > > > Suggested-by: Ira Weiny <ira.weiny@intel.com>
> > > > 
> > > 
> > > NIT: No need for the line break between Suggested-by and your signed off line.
> > > 
> > 
> > Hi Ira,
> > 
> > What does NIT stand for? 
> 
> Shorthand for 'nitpicking'.
> 
> "giving too much attention to details that are not important, especially
> as a way of criticizing: "
> 
> 	- https://dictionary.cambridge.org/dictionary/english/nitpicking
> 
> Via email this is a way for authors of an email to indicate something is
> technically wrong but while nicely acknowledging that it is not very
> significant and could be seen as overly critical.
> 
> For this particular comment I'm showing something to pay attention to next
> time but that was not a big deal this time around.
>

Hi Ira,

Thank for your explanation on NIT. 


> > 
> > Thank you. I will take care about the line breaks.
> > 
> > > > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > > > ---
> > > > 
> > > > Changes in v2:
> > > > 	- Replace kmap() with kmap_local_page().
> > > 
> > > Generally it is customary to attribute a change like this to those who
> > > suggested it in a V1 review.
> > > 
> > > For example:
> > > 
> > >  	- Tvrtko/Thomas: Use kmap_local_page() instead of page_address()
> > > 
> > > Also I don't see Thomas on the new email list.  Since he took the time to
> > > review V1 he might want to check this version out.  I've added him to the
> > > 'To:' list.
> > > 
> > > Also a link to V1 is nice.  B4 formats it like this:
> > > 
> > > - Link to v1: https://lore.kernel.org/all/20230614123556.GA381200@sumitra.com/
> > > 
> > > All that said the code looks good to me.  So with the above changes.
> > > 
> > > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > > 
> > 
> > I have noted down the points mentioned above. Thank you again.
> > 
> > I am not supposed to create another version of this patch for 
> > adding the above mentions, as you and Thomas both gave this patch 
> > a reviewed-by tag. Right?
> > 
> 
> Based on this response[*] from Tvrtko I think this version can move
> through without a v3.

Okay!


Thanks & regards
Sumitra

> 
> Thanks!
> Ira
> 
> [*] https://lore.kernel.org/all/bcb0a1d2-cd4d-a56f-1ee6-7ccfdd2f7b38@linux.intel.com/
> 
> <quote>
> Thanks all! I'll just re-send the patch for our CI, since it didn't get
> picked up automatically (stuck in moderation perhaps), with all r-b tags
> added and extra line space removed and merge it if results will be green.
> 
> Regards,
> 
> Tvrtko
> </quote>
> 
> 
> > 
> > Thanks & regards
> > Sumitra
> > 
> > PS: I am new to the open source vocabulary terms.
> > 
> > > > 	- Change commit subject and message.
> > > > 
> > > >  drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> > > > index f020c0086fbc..bc41500eedf5 100644
> > > > --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> > > > +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> > > > @@ -1164,9 +1164,9 @@ i915_vma_coredump_create(const struct intel_gt *gt,
> > > >  
> > > >  			drm_clflush_pages(&page, 1);
> > > >  
> > > > -			s = kmap(page);
> > > > +			s = kmap_local_page(page);
> > > >  			ret = compress_page(compress, s, dst, false);
> > > > -			kunmap(page);
> > > > +			kunmap_local(s);
> > > >  
> > > >  			drm_clflush_pages(&page, 1);
> > > >  
> > > > -- 
> > > > 2.25.1
> > > > 
> > > 
> > > 
> 
> 
