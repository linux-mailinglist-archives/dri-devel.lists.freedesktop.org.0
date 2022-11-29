Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA063C3BC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 16:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FF510E0E4;
	Tue, 29 Nov 2022 15:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5519010E0E4;
 Tue, 29 Nov 2022 15:28:07 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 m7-20020a9d6447000000b0066da0504b5eso9288763otl.13; 
 Tue, 29 Nov 2022 07:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xptklll5ySe4mf0oAhiOF1wKRg+/HTC07bmb7I7+5uA=;
 b=LBZsWpUxQd4nLd6eepDn7LKWLJi6vrXqyiHqAPb4mRTSa84FkXJX85RPkq0FAEuEYn
 +B2P/1I7DFCKwdUk4U16crmx4jAbSRVu5mL66uJDiDhHa8I6fnXAI/UHhnA7H+kt1Nwh
 mezeuNZsViAa6SYwzKeDCNeGBDw42qN4BGJPcAu+3mNhj2V/3KhhGKboU9vpC7f4Qo/s
 bhMT00HWQ6FStKqZi/oTPjCfaxQP957UPgp/OXD2njXoOl6tKPusyD9qPRe6sUvHhM+T
 IZpjXOuer4VczDkAY2Kit8xQpazDQJOE0cOBLDgyXEUqRs6+I1TK3am/2NNpaaFtUaGD
 M3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xptklll5ySe4mf0oAhiOF1wKRg+/HTC07bmb7I7+5uA=;
 b=a16xmBk/BqNHRI7ER/2k9e28YK6lS7MC7Ua+/SC+6EvzgU2QEY6CBsTNd1c31XT5Gr
 qR1KhOVABBbR1Ixr4RnMbwrruclXtRt1rannbkeMY5hRMo8jWPFjEM1fwSAQDJyZM1sc
 wT44rkY4DY1kofjIzgWs+/P4CeZOx7wp8sv5rfwOrfYRGV19d6K0FxNLgW7CixJSLu0D
 U9xeB+xuDyXW4+cs08ncAu9C0yfomeYBvx/R/y2PLzIeoX3/Ib2y1d01/LCzy88n2FHe
 HHfzn6HZ91VHNLANobYtY32RrmJFv7NfpMCaqikY4Tzk2LyX8D/U0uG45THJefWxd822
 gvdA==
X-Gm-Message-State: ANoB5pn777wAvp23EbrZG/QE+Ms1A/5iCu7G2cKFwMXCmfcT3wLjQcO6
 9RLZb4f1RAtoEcxYfa8zziWEbFuHWzWpKNUR9S1g4CYm
X-Google-Smtp-Source: AA0mqf4fcK1eVs08bvLTT2+22WNGQCsB4Vccc9/sQ6g0MuvqF8nn/ObUUcoGF0S3XEqgekDednOyDP92G6TQrcrtrOQ=
X-Received: by 2002:a9d:628b:0:b0:66c:6afa:5006 with SMTP id
 x11-20020a9d628b000000b0066c6afa5006mr22132233otk.233.1669735686740; Tue, 29
 Nov 2022 07:28:06 -0800 (PST)
MIME-Version: 1.0
References: <20221129071032.2154949-1-konstantin.meskhidze@huawei.com>
In-Reply-To: <20221129071032.2154949-1-konstantin.meskhidze@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Nov 2022 10:27:55 -0500
Message-ID: <CADnq5_OkpKY25gPQJWVGb859EJrG2uqL4J9DW_Yiut9iN6AhKQ@mail.gmail.com>
Subject: Re: [PATCH] drm: amdgpu: Fix logic error
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
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
Cc: yifan1.zhang@amd.com, Xinhui.Pan@amd.com, yusongping@huawei.com,
 guchun.chen@amd.com, lijo.lazar@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mdaenzer@redhat.com, nirmoy.das@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hukeping@huawei.com, evan.quan@amd.com, artem.kuzin@huawei.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Nov 29, 2022 at 2:49 AM Konstantin Meskhidze
<konstantin.meskhidze@huawei.com> wrote:
>
> This commit fixes logic error in function 'amdgpu_hw_ip_info':
>        - value 'uvd' might be 'vcn'.
>
> Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index fe23e09eec98..28752a6a92c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -424,7 +424,7 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
>         case AMDGPU_HW_IP_VCN_DEC:
>                 type = AMD_IP_BLOCK_TYPE_VCN;
>                 for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
> -                       if (adev->uvd.harvest_config & (1 << i))
> +                       if (adev->vcn.harvest_config & (1 << i))
>                                 continue;
>
>                         if (adev->vcn.inst[i].ring_dec.sched.ready)
> @@ -436,7 +436,7 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
>         case AMDGPU_HW_IP_VCN_ENC:
>                 type = AMD_IP_BLOCK_TYPE_VCN;
>                 for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
> -                       if (adev->uvd.harvest_config & (1 << i))
> +                       if (adev->vcn.harvest_config & (1 << i))
>                                 continue;
>
>                         for (j = 0; j < adev->vcn.num_enc_rings; j++)
> --
> 2.25.1
>
