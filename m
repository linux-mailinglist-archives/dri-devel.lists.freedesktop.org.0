Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBC13BA656
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 01:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CF66E02A;
	Fri,  2 Jul 2021 23:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBC96E02A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 23:54:00 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a13so14340402wrf.10
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 16:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OWcyw7f1LjnwTXew18hz2pEyOcchrpaHhKIiT/T4kT8=;
 b=QaT3QniVYLIsqgmFgqA6LWYo5uB5iLvHQcqM7LOyVJ8DTqYCES4jTvQCDC0968O8Sh
 oAqkHggRzFq/2B8KBGeh9n7SNCZZT0YbDbi5b1h9JHifT1CPjZvmnlOw/VTtSI5X5gxQ
 1LLh2MGH20wH0UyBVKVkFUWsjmLn3l2fLp0X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OWcyw7f1LjnwTXew18hz2pEyOcchrpaHhKIiT/T4kT8=;
 b=NGkLe8wR4Ot0BvurAfdMyTkLi646943PgPPEYhCbzRNw56L2GyI16ixw3/YzB92Pgj
 Own8KmGCidr08P5xjuIDtzFa5PqDbBc269S1MNVqzTgJISDLgJIhbNUrviaVl63Vm+IW
 HGZHICW46/ZWL2Ezy+u1VMu1h0CS2N6E5PrhygNNvkRfC7zap5AZ7e2mYLLDczgno0y8
 1TnVa+g+Pf/5LolUN+mdCKNXbLe4v6j/Dt0hfEyUKGaHZb4/DiCDTNiNxV0Ldz7SyBtO
 s2eEJz5C2DR1GKl2JaMuVnKI/89VuIR1z4xfLaq1tl+eZ4NXJFDhbvTv21HEhqqGhXnT
 kcfw==
X-Gm-Message-State: AOAM53231tNIBio/0wZj8H91+qJ2eLYsOg8zrI0/Z9x9CG/lXb7bZ7Ka
 JEpNVOubQapIN8+YVaUnIZGftQ==
X-Google-Smtp-Source: ABdhPJzBJYfeC3dRf1tGWIOkf07ox/P94PVuYVsjU4SwkcDbxH+KyMkOzZ/ePbs2qaAQ6FfdHJsycA==
X-Received: by 2002:adf:cd85:: with SMTP id q5mr2287626wrj.214.1625270039439; 
 Fri, 02 Jul 2021 16:53:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d186sm14938724wmd.14.2021.07.02.16.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 16:53:58 -0700 (PDT)
Date: Sat, 3 Jul 2021 01:53:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Start fixing the shared to exclusive fence dependencies.
Message-ID: <YN+nFePPaClmZAQy@phenom.ffwll.local>
References: <20210702111642.17259-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210702111642.17259-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 02, 2021 at 01:16:38PM +0200, Christian König wrote:
> Hey Daniel,
> 
> even when you are not 100% done with the driver audit I think we should
> push that patch set here to drm-misc-next now so that it can end up in
> 5.15.

So I think I got them all, just need to type up some good docs all over
the place next week and send it out.
-Daniel

> 
> Not having any dependency between the exclusive and the shared fence
> signaling order is just way more defensive than the current model.
> 
> As discussed I'm holding back any amdgpu and TTM workarounds which could
> be removed for now.
> 
> Thoughts?
> 
> Thanks,
> Christian.
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
