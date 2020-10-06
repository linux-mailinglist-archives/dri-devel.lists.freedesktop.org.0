Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846E285969
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4912D6E8A9;
	Wed,  7 Oct 2020 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3206E4BB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 15:49:59 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id b69so10552023qkg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 08:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XmlBZwSgT9XrRvfOtXu2s7SNTLyfzcwrzv/8Mqny/GA=;
 b=kYrcMx1WLb2Xxtj3NW15rbJXK16a7ttF3/iW+/N9oXZMsRK0sVENFb125wgKnjd+/f
 4ckyiCRLf+MMMp73oGUgFrx8s0C2Jy1KU6DVKZbEl4wE0GK4xs28LcyfGaYFXLUCylqB
 1jAvolNrxgeqrYPXSsMpYkuJbGU7qAwUW8lxk10k65NqDD5Fw7KkqNmzJvZR/yvPx/uH
 yqluV3mwNR/mKod9cuaz/7i9Cbwcc3mhC/MIwO1C0KfC8psHs8mcl1VGqXVrRE5bXivo
 Ys4OMArwmAsukW7JSjYFC9GmdZlj/fGlJ9Tx5S0dqAbAmnUyvN/GU4GDM3wTmeRM6Wtp
 XYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XmlBZwSgT9XrRvfOtXu2s7SNTLyfzcwrzv/8Mqny/GA=;
 b=bJydLZRQ2Y2ENX1x1lCY3Bpol0p7qd7ekJqYT1Y+SB3wZKuwTrwIGU0puz3fTYLC4b
 /W6O7sUbtRDOt/d1unT672Z+Dw8fd55kQkqV4bIyYE1JYDc1k+2k9xpGPlTDiTfJm+ks
 oBRbPxRsoMxNX8TYvwH9mgqyYwNr2n87sKwjU8f3tPERH1/GT9M696qI++m6wUuc54H6
 kJrxzHYi6LYJDsTCDCPgJpsS6LRpjZyksWn0fJMGFXwcVdePlY4cwXGsadvhZfWtnHhq
 m+17TvdUqf+2stlY3xvPEXIopLAhU+/6W+ocAx4E1HiIysmV5x5IO8L9xz3XUEspl2ou
 clyg==
X-Gm-Message-State: AOAM530YwMpRSXPlu4RcMpht6lQtk5+9E5eeXmbM5P6FjteN7A3uC1h3
 KVDF8iH6UiZbMZcZhbbn3t2xcQ==
X-Google-Smtp-Source: ABdhPJwICIB9a2K0/LMAcKo0X/sy0duPgZW4seNw2K2BMx3nX0ORxtJyh5iGpKZIxXy4ht7OifK7+g==
X-Received: by 2002:a37:a750:: with SMTP id q77mr5518029qke.377.1601999398339; 
 Tue, 06 Oct 2020 08:49:58 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id l19sm1697866qkk.99.2020.10.06.08.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 08:49:57 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kPpDw-000ZpU-TR; Tue, 06 Oct 2020 12:49:56 -0300
Date: Tue, 6 Oct 2020 12:49:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201006154956.GI5177@ziepe.ca>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
 <20201005131302.GQ9916@ziepe.ca>
 <MW3PR11MB455572267489B3F6B1C5F8C5E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201006092214.GX438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201006092214.GX438822@phenom.ffwll.local>
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 11:22:14AM +0200, Daniel Vetter wrote:
> 
> For reinstanting the pages you need:
> 
> - dma_resv_lock, this prevents anyone else from issuing new moves or
>   anything like that
> - dma_resv_get_excl + dma_fence_wait to wait for any pending moves to
>   finish. gpus generally don't wait on the cpu, but block the dependent
>   dma operations from being scheduled until that fence fired. But for rdma
>   odp I think you need the cpu wait in your worker here.

Reinstating is not really any different that the first insertion, so
then all this should be needed in every case?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
