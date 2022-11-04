Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0230619FED
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 19:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07F710E847;
	Fri,  4 Nov 2022 18:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC7C10E844;
 Fri,  4 Nov 2022 18:31:13 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-13bef14ea06so6453211fac.3; 
 Fri, 04 Nov 2022 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HKJ9WatzyNtfXF7BVXmllxcQN2bm3sB9CdcLiAwUZbY=;
 b=T4c6k/7XO/rAjKZ3yRM90vXh8Jw7UxtGhK+VuREKJ4+7i/9D29lbOUEw5mvyyd4/T/
 xYc5PDDyVwU0CQTOwKKeLxy6PDGTWzvCgkXJ5JvnK2Cdn4eqHaEZINMJhl9hX3V7h0AT
 IiuZR0u33wVKKB6h1mgU5fXm0jFWbqj/KkdPirlMtFLlvS7zuLAR6fFtskrDYELlBVqo
 18EsTGoH3AbVQPbLlWfUJDz5b5Qgm07Gw7bGnSokqZIe8XZD1ZiLiEhPTzdu8NF8DJT5
 43YPP0/H2yj1apsbNrUmphkjl7aCEP+5aibwUyLPO8nfxjsay2Ujp1+7Tk+SeuSSdEl4
 BxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HKJ9WatzyNtfXF7BVXmllxcQN2bm3sB9CdcLiAwUZbY=;
 b=nEPM/ZEKGXqKLYvb3djxWjbRa9iu53PKRWcRQSKaQLJ2XaW8iEjzj9A+JlBRKg3Dzb
 AeqCqcswejiP8H72FsWgUdMOVc6/MXhRWBoYrhENN1+gY9zkfN0JA601cEA87qjC1qi9
 PIdAj6r5kMuu+/IWTwY5B610WvxTEq3IvzJPx8X5Qiy7EK4NZCjaU9bYhVQeXn7093y7
 u5cvQRVoIlY79xbcFf1GcPzqNTHSQnpKPTQ84SQOApUGMEFFnfk+xQ84GxgzgrPWnJkS
 Hf0uPo5REtfo5ft+OB4DiLRda0Zj3vFzSX26CIwJuTS9g+jtBr3Bbimu5AlExSJlZBOs
 tsEw==
X-Gm-Message-State: ACrzQf1V7wf2YKyXhaGAEVcqqfieR1mojKQ1bB7Z/KeDHaNnE5tUl5dE
 lNON/0KQXxH7d3MXvDTJ0ydKV/1q63oj2eKmE4Y=
X-Google-Smtp-Source: AMsMyM722qdkRdGq9Vqtgo+RsjYmIiZPHMiaYLSLOg+6somo0EHScuaqAQGbjtVVrebMUPUitt82AwvXGpttE1BV1qM=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr22410779oao.96.1667586672683; Fri, 04
 Nov 2022 11:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <1667555402-52866-1-git-send-email-guohanjun@huawei.com>
In-Reply-To: <1667555402-52866-1-git-send-email-guohanjun@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Nov 2022 14:31:01 -0400
Message-ID: <CADnq5_OTt+FzNTiDWYS3_R2kwvXL_AUYY-86oS5_WGTtnjPEBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/radeon: Using unsigned long instead of unsigned
 to fix possible overflow
To: Hanjun Guo <guohanjun@huawei.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 4, 2022 at 6:05 AM Hanjun Guo <guohanjun@huawei.com> wrote:
>
> VBIOSImageOffset in struct UEFI_ACPI_VFCT is ULONG (unsigned long),
> but it will be assigned to "unsigned offset", so use unsigned long
> instead of unsigned for the offset, to avoid possible overflow.

ULONG in atombios is 32 bits so an int should be fine.

Alex

>
> Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
> ---
>  drivers/gpu/drm/radeon/radeon_bios.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
> index 3312165..520d1d6 100644
> --- a/drivers/gpu/drm/radeon/radeon_bios.c
> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
> @@ -611,7 +611,7 @@ static bool radeon_acpi_vfct_bios(struct radeon_device *rdev)
>         struct acpi_table_header *hdr;
>         acpi_size tbl_size;
>         UEFI_ACPI_VFCT *vfct;
> -       unsigned offset;
> +       unsigned long offset;
>
>         if (!ACPI_SUCCESS(acpi_get_table("VFCT", 1, &hdr)))
>                 return false;
> --
> 1.7.12.4
>
