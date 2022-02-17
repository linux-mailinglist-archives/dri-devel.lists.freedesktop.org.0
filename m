Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 674D74BA939
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEFD10E39C;
	Thu, 17 Feb 2022 19:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E9410E39C;
 Thu, 17 Feb 2022 19:06:22 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 w10-20020a4ae08a000000b0031bdf7a6d76so700951oos.10; 
 Thu, 17 Feb 2022 11:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0eT1lxfoq5qyDbp5eIAnsQwboX33oLO1Gz2b8VOV9eQ=;
 b=piI/0gpwz6MmcTd1tH7GT+KhCfmXjeZWejCehWfMxd3GxACkkdyeFdtCc38MyaMz1F
 v4spK69iBJM7RoH0lhLqBr7gJycoTylK4cLqx1R0wY7R72Q8x1R6NRv8PMzlN69v2arP
 RSz8EyYI7sepd0OP8Efx20nT1hJx5EZ4/BSEMMA291KGWneP9sU38hgNORJEMtFYf+1z
 MNTpoT0RFr/Q87ZJCYHxoztOoY6em6llwZ7lprlPMp0W2Had5rQUwtDSr5D4k68dR5l3
 z30Uyie+549zmipggxcR3Q79WDaehA57h3NuDLc/hyaQzlcVdelcTNmc9jKp56Y7l35A
 fCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0eT1lxfoq5qyDbp5eIAnsQwboX33oLO1Gz2b8VOV9eQ=;
 b=z+meajqOiPdavrPcwuxvlz5E29swo3Ut+BXqmp407bzooepw3ChmcIhzOWkO+l+Xc6
 txZExVzoVtTyR89Vnanz4Sq0mi6t1T6nVnvrvpnxx840HV7kNwSYSNLee5Yv3K3J7Mgu
 Yh+gy60tJf27UYEmaZb7Ygxn/1qnw+QZpf13W8kYpGZkZDjTz1hVdtrS0p3NbzcSb+cY
 GvbfMnC2Ef5xYux+vHA0MQMcVLjzYBgYBpr+HEgX4RhwXTg+7LG+uUeY1h+8Yi16h+aL
 t2YhfSeCWMhOiJkkEsESaIR6RX1LpGQLSlb/hYz+vEHuAPXU9b97Is0YcppqTArjm9dV
 sS0g==
X-Gm-Message-State: AOAM532QMOdY0LLebH8cdqUGlGjCYnxFTfw5HnNSAOTYudaFsvmJWqq9
 wKgAuP95mAaPDX7nBJlaA3C5L9abrqDS2DuDf0s=
X-Google-Smtp-Source: ABdhPJzTVo0BLlHY7QOaP5AWF+/HgAkv4O3cf3iw2UsClSnH35LOu7yMNCVBBMkTCxKrTWxKi1E4tGf81mwXJX3Csrw=
X-Received: by 2002:a05:6870:b281:b0:d3:e9c:811d with SMTP id
 c1-20020a056870b28100b000d30e9c811dmr1565142oao.225.1645124781997; Thu, 17
 Feb 2022 11:06:21 -0800 (PST)
MIME-Version: 1.0
References: <20220217153842.3252424-1-trix@redhat.com>
 <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
 <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com>
 <CAKwvOdnYTC7mku1=eVaDLGQFHdoN3u8Afoo582OAQ+ApJmfhQQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnYTC7mku1=eVaDLGQFHdoN3u8Afoo582OAQ+ApJmfhQQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Feb 2022 14:06:10 -0500
Message-ID: <CADnq5_PniW+-8G5AhOSwuovESpfeMxL4r6P30b3F1coa_NmMEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_ras_block_late_init error handler
To: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Joshi, Mukul" <mukul.joshi@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 llvm@lists.linux.dev, Dave Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, xinhui pan <Xinhui.Pan@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nathan Chancellor <nathan@kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 2:04 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Feb 17, 2022 at 8:16 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Applied.  Thanks!
> >
> > Alex
>
> Alex,
> Has AMD been able to set up clang builds, yet?

No.  I think some individual teams do, but it's never been integrated
into our larger CI systems as of yet as far as I know.

Alex


>
> --
> Thanks,
> ~Nick Desaulniers
