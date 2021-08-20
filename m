Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E273F3051
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 17:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE98B6EAC0;
	Fri, 20 Aug 2021 15:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E046EAC0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 15:56:31 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id b9so1809892plx.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 08:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C3a7vVBUf0KW7MXt4FnTeXqGlzkeA3TVHAyOaxNZlwQ=;
 b=mWy+dsfzuC4WR7e/bELnLc1DBewBd+6uqLCiUlPpSL/hR3JFjiFZGkc64dOnkcT9C9
 qDMRqhN9IlO5CQXHcgzIx3Y2JRqX6MsEMYyUkp08whfolpRdd2uxh73eqsjx32WZPMfY
 SPWC7Ec8QNUjnKmK0pksWV2GR2YpxIveB+TMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C3a7vVBUf0KW7MXt4FnTeXqGlzkeA3TVHAyOaxNZlwQ=;
 b=WkxrPeJCY0rEiMLguSrZZc6RBkOPYEAop1OotpgEsbf/s504ki44I666EMODgF4EzB
 KDtfKKuna+xzB3Pxl2Azpr4WpiaR/GXqBZ1dnioFr7WA5/GQtlFI8Dbyzrx/Av2X/h/o
 hwV1VXKe1p+/XL5RNS6HTBMQOxquJ02mIe0AvQbl7IuzrXR2tzWc9/Dpet3ST/2oAki2
 yKX9MH3gqMYQZjw+n7ehzJusSrQGz0g64RgBeA4FIH/Xbf9qcIulcMHV4F1ZpNZdUNSG
 hqflQE/GjCAFWh/yb6oene3jiRcE6w3z8S3vcP08AzJLaUqjFRc5OYWM+bzHZ5XD3j2M
 /m1Q==
X-Gm-Message-State: AOAM532XB6+jKWcdb03XNiy5DUGh/5Nhq2pB5ksizqqbOOh9/Zr4IWG5
 QcFt4DvnsdCwfrmc8O/o22VXew==
X-Google-Smtp-Source: ABdhPJyhg05jtv2sdt7XrLbWPk8JBbrR41kaovvHCcwZtOZ4P7Cf6Qg2VrCTEpx9+rp1igwyJ9xLVA==
X-Received: by 2002:a17:902:f704:b029:11a:cdee:490 with SMTP id
 h4-20020a170902f704b029011acdee0490mr17049722plo.37.1629474990741; 
 Fri, 20 Aug 2021 08:56:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 21sm7304926pfh.103.2021.08.20.08.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 08:56:30 -0700 (PDT)
Date: Fri, 20 Aug 2021 08:56:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Message-ID: <202108200856.E0E8711CB@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-57-keescook@chromium.org>
 <20210819122716.GP543798@ziepe.ca> <202108190916.7CC455DA@keescook>
 <20210819164757.GS543798@ziepe.ca> <202108191106.1956C05A@keescook>
 <20210820123400.GW543798@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820123400.GW543798@ziepe.ca>
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

On Fri, Aug 20, 2021 at 09:34:00AM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 19, 2021 at 11:14:37AM -0700, Kees Cook wrote:
> 
> > Which do you mean? When doing the conversions I tended to opt for
> > struct_group() since it provides more robust "intentionality". Strictly
> > speaking, the new memset helpers are doing field-spanning writes, but the
> > "clear to the end" pattern was so common it made sense to add the helpers,
> > as they're a bit less disruptive. It's totally up to you! :)
> 
> Well, of the patches you cc'd to me only this one used the struct
> group..

Understood. I've adjusted this for v3. Thanks!

-- 
Kees Cook
