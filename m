Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D9F3F0E2A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 00:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEDF6E892;
	Wed, 18 Aug 2021 22:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6AE6E891
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 22:30:03 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 fa24-20020a17090af0d8b0290178bfa69d97so3493995pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 15:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DUTuMfsQqxqX+3pR2oz9dVJNWsHg80kq142ck8zdj0s=;
 b=HXqi8rpNQlqRCRobulkOlcaA4+c6J/4aW1kHG07w5z+LW3VAsPY7L3ovHbYLAvr6BW
 z8PYA40q5a4/E1aSSd1f0X7nRnd2FNDMsOqvNHCn+M7iSwPw+3HB842oCYFV1odUjD4+
 aowm4n1LLC28ISLDG0efepefjXmirvRMkeWhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DUTuMfsQqxqX+3pR2oz9dVJNWsHg80kq142ck8zdj0s=;
 b=Jc2hfSYFNm4PuAX5J61giRTpHGM8S03VIqysUcu3d0Hi8760z1bl3bcbVuEiZAgNsq
 k3J4NlJgNukh6js1xyYAOlM+fhjQlWP33JRzrtzfe4UZXIEFmyLLQcplEGeWjDasE7hT
 QXUFkGBB+EihAoTAg3gEURdN0AXFdp/sy/J8zcf997m6Z/3fMmiLQXXdMBE0AdGnvLh7
 ASxy+F69NcJgpLOpqLVyiNHAe4esJaUnPTODtz1+Y6Lb8Az8qIMrzVEAJulmXiJWRkQS
 7xyBJd/86qP8KBZj/wodj2pCfdI8+Zcqju7bmmwly+YZSZEbSM/ZD2PFxX0JpwLi+TK6
 +pEg==
X-Gm-Message-State: AOAM533rXcQZxp5RErQaj48/T7i94LNm2fIbE9I0X8chJrvfINsnPfSK
 SkIA9fjHGqUiRWFzbEmsTRMLKw==
X-Google-Smtp-Source: ABdhPJwejqek+pQNgEJHoUL+LD8id8sswOa0BezZLWGyCwRRYJ3BmiAhJE1bgJAMyKte9lbr8NDHRw==
X-Received: by 2002:a17:90a:a581:: with SMTP id
 b1mr1663300pjq.153.1629325803017; 
 Wed, 18 Aug 2021 15:30:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id n185sm862325pfn.171.2021.08.18.15.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 15:30:02 -0700 (PDT)
Date: Wed, 18 Aug 2021 15:30:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wang Wensheng <wangwensheng4@huawei.com>,
 linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 linux-block@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 clang-built-linux@googlegroups.com, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 61/63] powerpc: Split memset() to avoid multi-field
 overflow
Message-ID: <202108181528.9CDB56FEC@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-62-keescook@chromium.org>
 <7630b0bc-4389-6283-d8b9-c532df916d60@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7630b0bc-4389-6283-d8b9-c532df916d60@csgroup.eu>
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

On Wed, Aug 18, 2021 at 08:42:18AM +0200, Christophe Leroy wrote:
> 
> 
> Le 18/08/2021 à 08:05, Kees Cook a écrit :
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memset(), avoid intentionally writing across
> > neighboring fields.
> > 
> > Instead of writing across a field boundary with memset(), move the call
> > to just the array, and an explicit zeroing of the prior field.
> > 
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Qinglang Miao <miaoqinglang@huawei.com>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Hulk Robot <hulkci@huawei.com>
> > Cc: Wang Wensheng <wangwensheng4@huawei.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>
> > Link: https://lore.kernel.org/lkml/87czqsnmw9.fsf@mpe.ellerman.id.au
> > ---
> >   drivers/macintosh/smu.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
> > index 94fb63a7b357..59ce431da7ef 100644
> > --- a/drivers/macintosh/smu.c
> > +++ b/drivers/macintosh/smu.c
> > @@ -848,7 +848,8 @@ int smu_queue_i2c(struct smu_i2c_cmd *cmd)
> >   	cmd->read = cmd->info.devaddr & 0x01;
> >   	switch(cmd->info.type) {
> >   	case SMU_I2C_TRANSFER_SIMPLE:
> > -		memset(&cmd->info.sublen, 0, 4);
> > +		cmd->info.sublen = 0;
> > +		memset(&cmd->info.subaddr, 0, 3);
> 
> subaddr[] is a table, should the & be avoided ?

It results in the same thing, but it's better form to not have the &; I
will fix this.

> And while at it, why not use sizeof(subaddr) instead of 3 ?

Agreed. :)

Thanks!

-- 
Kees Cook
