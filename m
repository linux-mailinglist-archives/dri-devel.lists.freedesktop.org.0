Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C4582984
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 17:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE80F96C56;
	Wed, 27 Jul 2022 15:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0507896C47;
 Wed, 27 Jul 2022 15:23:13 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id b11so31998092eju.10;
 Wed, 27 Jul 2022 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3QoQIcw2k7KJYASXT3ZADS6J+gQkSi9pbz+G9ycdbwU=;
 b=HCbs8iPs9gJhX59IpgPJsCa2fuxs/UEAYiUEkx6VbdfgffAl0JiY0Kl0ovVFN7tKuH
 TBARPeHOi9Fkh83OJhx+l0/TUqfogT7lZ11O4JqeHqfZ5IoFAcw/yLWuF6Ke235el7oO
 Zr8ZOPAxr2g6sjyooHYIN8X8ZwZpJtRbfsTwOjiPJVt89aT5Hq2Ig8kVGTuhn3pijiwJ
 nMs9N0HehNF8gC+hhbxqFCl4uw+yje7AK2GbrG8SNULDXr/MrsOmw+l7xg3dABd1Fh7k
 yazGhqOdZz57nHnLxuiVfsnRmJaWH/D+70indNftdRsODejYRRxqf2MpT95NI+y66PkG
 8+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3QoQIcw2k7KJYASXT3ZADS6J+gQkSi9pbz+G9ycdbwU=;
 b=FrHEZfbHjpfMv2SCftBy8f5eSu+NEaogboShzRj2y2dqYg/S1UTLTsWdmY/d/y1/t/
 2LegT4TDyhfC9lRNHhnqgdSkeqpkD+ufmC8WqTc91jdtngWxwUaphjYFWe5IIeRkhIJ8
 f23jOeX8FDnUmLfE54OjgOq/VfgYLGBtcmjYOpAX8P84YMWZgepp5pXqH6BJ+D3E0Nbb
 fNGY7syk88eazwHOwNLFgzwYiXaEhwH96nN2oXtgLWT+yqFGaTNOs39ZFK/7yqkCRFTL
 U3qgizdXM2babWSTiB7wwWqexOSdxb2bhvhmieKt2gqPN4+QbCegnnN1RHwcS4Nb46ag
 OSBg==
X-Gm-Message-State: AJIora+stJRCPgMcAhWkdwZxxMOUGPwHu2B9pOUvD/Uapw6rRyQKgIfQ
 EcfhX1W3k1pPYMdfVTVjDNRqcGAuezl+Z7L8SWs=
X-Google-Smtp-Source: AGRyM1tsUeLUmrPGthGwyhSNHhxQUgBP/qJfxueLK6ioM0y8Wb7Fq8JANC1a+3Fzq9kK8Imtgrks58J9/2IY7PbLYcA=
X-Received: by 2002:a17:907:2723:b0:72b:5af3:5a11 with SMTP id
 d3-20020a170907272300b0072b5af35a11mr17884124ejl.584.1658935391241; Wed, 27
 Jul 2022 08:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220727144249.415228-1-Vijendar.Mukunda@amd.com>
 <CADnq5_PKjmNw+bAPCyDu_G=yNQcpJSpFd+EVzNwfNWzig8apFw@mail.gmail.com>
 <1031eddb-4cfa-e94a-e77e-03aa3cb8b680@amd.com>
In-Reply-To: <1031eddb-4cfa-e94a-e77e-03aa3cb8b680@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 27 Jul 2022 11:22:59 -0400
Message-ID: <CADnq5_NiaiwHFLeAcjPRvh2gCHvGQ_OJgwMS5jfFvzaZd4GzqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix i2s_pdata out of bound array access
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
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
Cc: Sunil-kumar.Dommati@amd.com, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 27, 2022 at 11:16 AM Mukunda,Vijendar
<vijendar.mukunda@amd.com> wrote:
>
> On 7/27/22 8:25 PM, Alex Deucher wrote:
> > On Wed, Jul 27, 2022 at 10:42 AM Vijendar Mukunda
> > <Vijendar.Mukunda@amd.com> wrote:
> >>
> >> Fixed following Smatch static checker warning:
> >>
> >>     drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:393 acp_hw_init()
> >>     error: buffer overflow 'i2s_pdata' 3 <= 3
> >>     drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:396 acp_hw_init()
> >>     error: buffer overflow 'i2s_pdata' 3 <= 3
> >>
> >> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> >> ---
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 8 --------
> >>  1 file changed, 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> >> index bcc7ee02e0fc..6d72355ac492 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> >> @@ -390,14 +390,6 @@ static int acp_hw_init(void *handle)
> >>                 i2s_pdata[2].i2s_reg_comp1 = ACP_BT_COMP1_REG_OFFSET;
> >>                 i2s_pdata[2].i2s_reg_comp2 = ACP_BT_COMP2_REG_OFFSET;
> >>
> >> -               i2s_pdata[3].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
> >> -               switch (adev->asic_type) {
> >> -               case CHIP_STONEY:
> >> -                       i2s_pdata[3].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
> >> -                       break;
> >> -               default:
> >> -                       break;
> >> -               }
> >
> > Is this actually not used or should we just increase the allocation size?
> >
> > Alex
> it's my bad. i2s_pdata array size is 3. when we recently included code
> changes for JD platform , this piece of code was added mistakenly for
> Stoney platform switch case.

Thanks.  Patch is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> --
> Vijendar
>
> >
> >>                 adev->acp.acp_res[0].name = "acp2x_dma";
> >>                 adev->acp.acp_res[0].flags = IORESOURCE_MEM;
> >>                 adev->acp.acp_res[0].start = acp_base;
> >> --
> >> 2.25.1
> >>
>
