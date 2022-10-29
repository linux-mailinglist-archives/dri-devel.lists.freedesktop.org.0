Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7961E61210C
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 09:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A3710E24E;
	Sat, 29 Oct 2022 07:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8804710E24E
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 07:32:16 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id f9so6674856pgj.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 00:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fZy5lCa/2Ecq1kSp+TM41cU7cXmzgRAAem3qyDrtqVE=;
 b=A6ozaRuL05mZkdsRzdSlURHF6+RyhhlQMHJ17oRbpBtm3eHluiPPTe/pjG6GCA10vk
 tspsEtfuGzEps6YAzOIbVmjuDaXvqm1pWzEH1nBnDI3wqRh0OvIqYp2m7/OwTKipwoyl
 NAZ2yriUdMjhNWS1Wx7WX9sK0FE0Y59FOGeLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZy5lCa/2Ecq1kSp+TM41cU7cXmzgRAAem3qyDrtqVE=;
 b=HLaPN6yUy6aSnb1y85mwiyg/SA94bip3nv42Xxe8Mk9XaiPtbGjzgFzdK5sEL0kJEV
 T0FwuQzSFnKcnaQRqrYurcksrXnn4pXFjHmjwLc4vE6zu00IQYe4Nq4U4E8mbIJKxonp
 Jyac98hMi5MbmNqW8f2eDeGax3j9GYnGj28OlNSaw4SAl3z6denRxR27tXp8LHdFM6H6
 0QcG3pFp6S6jZLb2I5hrPu4ZeCjlRixKyNugShq3wvdhyK+jbjuaxctDOzJhIl1CWmvs
 MHDOc5UtpH8nCFMEj4JfswFqgfnGcnBK4RdGiz4nWGbJPo/wKTSNrvH02pjusW03H/5K
 D1BA==
X-Gm-Message-State: ACrzQf3gPLzkaC4xMGrX4/lrdexp8eTIDTcF0Rrd4JWKAA11wGK7OGsn
 IRtFy9gpYwARXgyC+iGiRsLyNQ==
X-Google-Smtp-Source: AMsMyM6/CT3Vh+btOf4K3+q/dntWfviHzwWozBtDItq+XamMQLfaCbtowXk6VHNabYjKDdbmPNU6XA==
X-Received: by 2002:a05:6a02:10a:b0:461:26b8:1c95 with SMTP id
 bg10-20020a056a02010a00b0046126b81c95mr2895261pgb.503.1667028736033; 
 Sat, 29 Oct 2022 00:32:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a170902758700b001868ba9a867sm607345pll.303.2022.10.29.00.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 00:32:15 -0700 (PDT)
Date: Sat, 29 Oct 2022 00:32:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v5] overflow: Introduce overflows_type() and
 castable_to_type()
Message-ID: <202210290029.3CD089A86C@keescook>
References: <20220926191109.1803094-1-keescook@chromium.org>
 <20221024201125.1416422-1-gwan-gyeong.mun@intel.com>
 <ffcfb7ce-7646-c827-8d29-7c41e4b121d6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffcfb7ce-7646-c827-8d29-7c41e4b121d6@intel.com>
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
Cc: arnd@kernel.org, mauro.chehab@linux.intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@linux.ie, trix@redhat.com,
 dlatypov@google.com, llvm@lists.linux.dev, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gustavoars@kernel.org, nathan@kernel.org, linux-sparse@vger.kernel.org,
 linux-hardening@vger.kernel.org, rodrigo.vivi@intel.com, mchehab@kernel.org,
 intel-gfx@lists.freedesktop.org, luc.vanoostenryck@gmail.com,
 vitor@massaru.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 29, 2022 at 08:55:43AM +0300, Gwan-gyeong Mun wrote:
> Hi Kees,

Hi! :)

> I've updated to v5 with the last comment of Nathan.
> Could you please kindly review what more is needed as we move forward with
> this patch?

It looks fine to me -- I assume it'll go via the drm tree? Would you
rather I carry the non-drm changes in my tree instead?

>
-- 
Kees Cook
