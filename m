Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CA0488ED4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 04:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F84112FDF;
	Mon, 10 Jan 2022 03:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EB6112F03
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 03:05:26 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id p14so10746262plf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 19:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=asONcDbDvxPAfc46+OAh6NbEDRkAhrnwb09q3Jil4GU=;
 b=Gki/1AbznyCzfqVPv/C4SNZVXgKEO7JGJ2u2ohLExiiCIe1jBMzYuhdxjKJwaW/Ejq
 y1QoB/o+OU4dtgZGesOw6IKMawv1INl6/4XAb7Ui1BbrfWS5IS5u2GFAEmsscP/Xj7Cm
 k2GeVvwJMbSPvh781s3tXGctfHfUnP14c9aAPTy6TFd2/sKpYAdk76XDXKWh+NNx94cG
 J3B90JeCsPUSINVhqoVf9QV8DYyLywmdvSQJQ2R8TDgEg2sRXPn/9BL0s3KW0GDKblv4
 fU8lCl/IS7B9pm4RYaetLpI0h+eT1lPIBD73JASFwxEwlruCDg5OoEEQSE1HNVoiqfw7
 rlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=asONcDbDvxPAfc46+OAh6NbEDRkAhrnwb09q3Jil4GU=;
 b=TWFMIqpssFUSJ0T+uWILWL4JQIPAVqqUDr+RKtkbWRfo/MiLcc/7nuuhG8CqFvJHQF
 jeU6cqpV5a+Hn51YGK/cnec7YYL/Yhr6QXXfQ9rSvvJtqy8IrK3J+51pa7hyFfcmywT2
 1UmSeJQnJu212K/03gANWQLi76bjpL58Z1uEhyUJ4NDSLsFRhWLPjHQzBbLKQe3+WL3A
 FuvIdYQ44vp1Z+uF/rP9HLcy3F4QUMAMugxdzWvFABAngOZIFv2wqKoZYDIigg1zgrRj
 Rp+U/W4SSpyUvSWFsFs6NJ9XjGScLkeMq2+gCk1ASdKq5w5PrRHAf5RuI92mb1dG2MXx
 +Idw==
X-Gm-Message-State: AOAM530SI0vBmNHEpGyrqbmSDZc6+xIbzs7fDloyb68KpJA5UsX0gu0v
 0mNYY6xpEpi9Mrick3x2oKM=
X-Google-Smtp-Source: ABdhPJxjS8A7jPBlm0xNP4FEPredazSkzoH27TxeoQqlnlAHVkafY4wMVyY9t7M60rXHGpdWGR8K0Q==
X-Received: by 2002:a17:902:a509:b0:143:7eb6:c953 with SMTP id
 s9-20020a170902a50900b001437eb6c953mr73574142plq.4.1641783926508; 
 Sun, 09 Jan 2022 19:05:26 -0800 (PST)
Received: from VICKYMQLIN-NB1.localdomain ([103.172.116.195])
 by smtp.gmail.com with ESMTPSA id ng7sm7099786pjb.41.2022.01.09.19.05.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 09 Jan 2022 19:05:26 -0800 (PST)
Date: Mon, 10 Jan 2022 11:05:21 +0800
From: Miaoqian Lin <linmq006@gmail.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v2] drm/v3d: Fix PM disable depth imbalance in
 v3d_platform_drm_probe
Message-ID: <20220110030521.GA500@VICKYMQLIN-NB1.localdomain>
References: <CAPY8ntAdknutH=OmV1dWPbez1ZqLgaOj-BoQQkZAu0WbhbE6nQ@mail.gmail.com>
 <20220106124657.32737-1-linmq006@gmail.com>
 <20220109174817.drma7zfckeywvndc@mail.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220109174817.drma7zfckeywvndc@mail.igalia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: emma@anholt.net, dave.stevenson@raspberrypi.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, eric@anholt.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Melissa,

On Sun, Jan 09, 2022 at 04:48:17PM -0100, Melissa Wen wrote:
> On 01/06, Miaoqian Lin wrote:
> > The pm_runtime_enable will increase power disable depth.
> > If the probe fails, we should use pm_runtime_disable() to balance
> > pm_runtime_enable().
> > 
> >  	if (ret)
> > -		goto dma_free;
> > +		goto pm_disable;
> >  
> >  	ret = v3d_irq_init(v3d);
> >  	if (ret)
> > @@ -298,7 +298,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
> >  	v3d_irq_disable(v3d);
> >  gem_destroy:
> >  	v3d_gem_destroy(drm);
> > -dma_free:
> > +pm_disable:
> > +	pm_runtime_disable(dev);
> 
> Hi,
> 
> I see this pm_runtime_disable balancing is also missing for
> v3d_platform_drm_remove(), right?
> 
I think, yes. 

> >  	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
> >  	return ret;
> >  }
> > -- 
> > 2.17.1
> > 


