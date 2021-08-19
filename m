Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DD23F1E51
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 18:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6994E6E9AB;
	Thu, 19 Aug 2021 16:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF91B6E9AB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 16:47:59 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id t66so7894602qkb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PRHyIH4ijXf+mY+7Vzztn6Pqcrl1CNKx+frAJCQ2Has=;
 b=dvp/j6HxEOhxjJeYtRuITNLUFUiXaR12Gjf8/ktdKok1mdPSqBAuwZQe5cZNMP2mDW
 3XfbKhK5yP5sXbvvgiRAJLySLRNXDSdWgdpIlJ+p1nb8B/xTAZATOdWzyKh3+ivgYCqx
 8oZP3fpWWL1vXVtmf+rKQ6CTdO5XEJdXVeXt2fAqXtYhfo9t+pN17guOHmzXCrch0SjV
 BbcNWpQeXixu5hFl3i4TO87exvR7v19wOfyomnTLv0qVBV8dT8wAG8LfOqoP7y+u3kYd
 /SnsOmmjTd5AIZnCCCKduJeONImiY/HiZFdLHTFk9UNfDVqiBBtPTkZAeJw6idovNHIn
 m6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PRHyIH4ijXf+mY+7Vzztn6Pqcrl1CNKx+frAJCQ2Has=;
 b=O9/t9OBhkNimd6IuatgHm3yLPLOxSsjeOVsKBQpvX2baHhoXDxni2UOZk0j38poenx
 iTrDf05WNye5E+SBaLYx9xQQjCyYVTXhhMgo7oiXHEoXHv0cRUfgYMUAqPARouAMgcFi
 YFZzLOUZ4+3dNMp1nqhxgW3czoieDHLu1heppV0HVabaC1f0CISVAb81bdv0ePAmM7jc
 UFPixeINoFze1uZbMC31fb51loz5KggypiO7BryBZjphBATn54FC4/5xLm4TCXekzjtq
 zorCG/B/wDN7jHJebDicp7jp9YXyEjJWFl5v3RkW1ZyIGE+kkozud1O2y0nJpRyhm7NC
 R7Tg==
X-Gm-Message-State: AOAM531WfA5JmRKRrJQO7TaokhglOLW7E12abLJ7foxilVasN3pXU8ts
 Kykj9l/+pgIU6LhOqxwytrA2Cw==
X-Google-Smtp-Source: ABdhPJwj157bJQx4yOUhNfsxgTN1x3aSuRlBknKFgP45+xvMm65JsiwY8VNQc1a5fM1ZgYeoBo5u0g==
X-Received: by 2002:a05:620a:1221:: with SMTP id
 v1mr4584134qkj.357.1629391678741; 
 Thu, 19 Aug 2021 09:47:58 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id c67sm1770032qke.113.2021.08.19.09.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:47:58 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mGlCv-001See-95; Thu, 19 Aug 2021 13:47:57 -0300
Date: Thu, 19 Aug 2021 13:47:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
 Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 56/63] RDMA/mlx5: Use struct_group() to zero struct
 mlx5_ib_mr
Message-ID: <20210819164757.GS543798@ziepe.ca>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-57-keescook@chromium.org>
 <20210819122716.GP543798@ziepe.ca> <202108190916.7CC455DA@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202108190916.7CC455DA@keescook>
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

On Thu, Aug 19, 2021 at 09:19:08AM -0700, Kees Cook wrote:
> On Thu, Aug 19, 2021 at 09:27:16AM -0300, Jason Gunthorpe wrote:
> > On Tue, Aug 17, 2021 at 11:05:26PM -0700, Kees Cook wrote:
> > > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > > field bounds checking for memset(), avoid intentionally writing across
> > > neighboring fields.
> > > 
> > > Add struct_group() to mark region of struct mlx5_ib_mr that should be
> > > initialized to zero.
> > > 
> > > Cc: Leon Romanovsky <leon@kernel.org>
> > > Cc: Doug Ledford <dledford@redhat.com>
> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > Cc: linux-rdma@vger.kernel.org
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > >  drivers/infiniband/hw/mlx5/mlx5_ib.h | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
> > > index bf20a388eabe..f63bf204a7a1 100644
> > > +++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
> > > @@ -644,6 +644,7 @@ struct mlx5_ib_mr {
> > >  	struct ib_umem *umem;
> > >  
> > >  	/* This is zero'd when the MR is allocated */
> > > +	struct_group(cleared,
> > >  	union {
> > >  		/* Used only while the MR is in the cache */
> > >  		struct {
> > > @@ -691,12 +692,13 @@ struct mlx5_ib_mr {
> > >  			bool is_odp_implicit;
> > >  		};
> > >  	};
> > > +	);
> > >  };
> > >  
> > >  /* Zero the fields in the mr that are variant depending on usage */
> > >  static inline void mlx5_clear_mr(struct mlx5_ib_mr *mr)
> > >  {
> > > -	memset(mr->out, 0, sizeof(*mr) - offsetof(struct mlx5_ib_mr, out));
> > > +	memset(&mr->cleared, 0, sizeof(mr->cleared));
> > >  }
> > 
> > Why not use the memset_after(mr->umem) here?
> 
> I can certainly do that instead. In this series I've tended to opt
> for groupings so the position of future struct member additions are
> explicitly chosen. (i.e. reducing the chance that a zeroing of the new
> member be a surprise.)

I saw the earlier RDMA patches where using other memset techniques
though? Were there flex arrays or something that made groups infeasible?

Jason
