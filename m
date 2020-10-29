Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BF829F74B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 23:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705D86E8D6;
	Thu, 29 Oct 2020 22:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3F46E8D6;
 Thu, 29 Oct 2020 22:00:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p22so1199169wmg.3;
 Thu, 29 Oct 2020 15:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=40e4S00g1+jWvsqSMaAemc/LZ0HJCmIgIw3gyfOIGI4=;
 b=XTrJbqSgkFmHPKW2edfxxzsOZvUBsU/UirFXADLRS9z0KiFZyIw1i/iFsTqyvrsKhJ
 HS7ZbK9hQ64GBA40tdtuTcv1pEF/K79UEp55pPN7WQz0Or+UHoBtKHxQ2RwG6dbMx2pW
 axQlXzZFrBvxyCqYyu+zx68ol7HiNxdNYjNxJTjhr0vb7AtATSLls3qM4tz5nrAV9WnK
 jaoGQqXKH/vAMnnoI7+Px3lMJa6tOQlb+1GFwRzdyOhJxPmy5krwEvtHFAMlWafXMjGG
 zQH9hWNflaozahPEhSR+Q+OPZkVZPDvv/xPkyhbUfFm9lJdgl5Gi4OFaG8VOUhvoT507
 jUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40e4S00g1+jWvsqSMaAemc/LZ0HJCmIgIw3gyfOIGI4=;
 b=cOVuhUvp6Whp9Ib56OQaboQe+WVfMstES7gsA7BDRk/nCgoY3dsnHcJRyt4atp4OiE
 /y9dr7e5BVi6imZHtAG583+gJy0eKylUuJSj2HP0uWuXYgEonqm1fjbKMUdV9WF/HOAA
 dhqJeXntCTaJz+uMSb4xSZ+eJZ+bw+7Uj8bTAfYd+3LwEO0b04Aaf+m1ppeWo4HSOFyC
 ADuOZcVMLhXW8AHx/U+ycZ3MOa2qMkk1c1urS344m41mIuaDVf0HOxIWmdHxy0IYXZCv
 52FxONCefn2zFfsJpFjaYbhofhBsNw5BPtlICZOX3SWFRKT6E21kRe1gCvLSevaxf+x8
 I3Mg==
X-Gm-Message-State: AOAM530wnv3eo98b57kpfa0DFvkQZJ4a5KKqtdJk7nbvWFDiSYC/0pCG
 bvHm4ZaCFuhvuSx59YtKyi593k8egikl6CG2lJI=
X-Google-Smtp-Source: ABdhPJwpYSrUAdeoFRilgwZtoHiIfWS1NIhXwf789NWRPz40ExUzFgYDJVlEmXo1EaJsJMJhoIXHj6NroAtLXRAuhzg=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr1052308wmi.70.1604008809836; 
 Thu, 29 Oct 2020 15:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201028124316.109886-1-colin.king@canonical.com>
In-Reply-To: <20201028124316.109886-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2020 17:59:58 -0400
Message-ID: <CADnq5_N8FkB1bjhrfVi2EvRbKdDSgKOCm37zdmXACnTLSx6krw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/pm: fix out-of-bound read on
 pptable->SkuReserved
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Oct 28, 2020 at 8:43 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> A recent change added two uint16_t elements to PPTable_t and reduced the
> uint32_t array down to 8 elements. This results in the dev_info printing
> of pptable->SkuReserved[8] accessing a value that is out-of-range on
> array SkuReserved.  The array has been shrunk by 1 element, so remove
> this extraneous dev_info message.
>
> Addresses-Coverity: ("Out-of-bounds read")
> Fixes: 1dc3c5a95b08 ("drm/amd/pm: update driver if file for sienna cichlid")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> index fa3842f460fc..0600befc6e4c 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> @@ -2279,7 +2279,6 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
>         dev_info(smu->adev->dev, "SkuReserved[5] = 0x%x\n", pptable->SkuReserved[5]);
>         dev_info(smu->adev->dev, "SkuReserved[6] = 0x%x\n", pptable->SkuReserved[6]);
>         dev_info(smu->adev->dev, "SkuReserved[7] = 0x%x\n", pptable->SkuReserved[7]);
> -       dev_info(smu->adev->dev, "SkuReserved[8] = 0x%x\n", pptable->SkuReserved[8]);
>
>         dev_info(smu->adev->dev, "GamingClk[0] = 0x%x\n", pptable->GamingClk[0]);
>         dev_info(smu->adev->dev, "GamingClk[1] = 0x%x\n", pptable->GamingClk[1]);
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
