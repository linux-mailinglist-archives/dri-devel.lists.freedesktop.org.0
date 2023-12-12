Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 383D780E4BC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 08:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A0610E56D;
	Tue, 12 Dec 2023 07:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C5210E569
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 07:17:43 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5d74186170fso47412317b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 23:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702365462; x=1702970262; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TVT/VN6qzSaiQZWjp2ufbT3HoEBo3Ldac4YHEG+4eFk=;
 b=b5BUI8/O53HqVSr5D1b2nyEFd/7aAgl1tYHe4dLzQuKLdgh8QziBljjFIWqS0REwT+
 WyKqk7vi74UKt9sdt8b5XBrEtT+nlbguUhotMOiEfGOxXTjWhRw9Vszivus0NBzt4/HS
 XpHbYARiLVtfTQoXqUJ8+AkV0f423NGF9EJjamEHKpEJjIXmv6UwXC8ZUyWD91ug7FSE
 6F9uF7c9iJs7Z4wjYMdtQ2iD/RA1YMt76EfXcJavE7XiR0rwJN082cd8hFBhyjPyNZoA
 aE9sjJb3V84uJKhGPsDR3OUtaY3+Wl4agpxEC6aMoCHt2Ty0OQ8eU2Cc6Yx0Cz+umBVK
 Ce1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702365462; x=1702970262;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TVT/VN6qzSaiQZWjp2ufbT3HoEBo3Ldac4YHEG+4eFk=;
 b=q5FCL6eIzN3ZVqgczxQ5aSd7AodfCgFevr2vEwRwQWt7fG0eCIPB/0jQyl/VDUKSHp
 BMXxnfx7BBzjFvwJyVYfHPpHctkffitMiwG447yynOZTXN93aHDmlG3H03qQF5osUoLL
 mF/UeVlk7ZFqmshZsXFv7wY2ejlhi9AaKmoPE0ZsRGAyKAkkT7dhsnLytrkiQY/oYgy0
 SiMZknHKK1nWmFy8Z51IhW9PWGHGcYiegaPFvkgpg3QwSogh2C1hGwMkExujY8Spf1v7
 u2gjJGxOhefBYeBd9GV21F57wlwv/ccPkBxbq3wfxnmXNnZNX0e2a3Tsx+HiANlnrLPK
 +8RQ==
X-Gm-Message-State: AOJu0Yzc44ErST/+DckKMHHFkZ0WUETPGFLQY7U6vxEzGxUPXLnRRdTh
 lA9RdZKCrC8sVes9YgMGp3T9jaIawmQWqa2gthPu2w==
X-Google-Smtp-Source: AGHT+IGdY+48fFdjXN2QvKpKjOQibG0qDG90jwUmBOaZ1dBjjCo4WU08VY6Au/aVmWsNr2/iTZ+jXH8kXiKlsPNtwjc=
X-Received: by 2002:a81:5fc5:0:b0:5de:a315:b72c with SMTP id
 t188-20020a815fc5000000b005dea315b72cmr4968084ywb.95.1702365462403; Mon, 11
 Dec 2023 23:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
 <20231212002245.23715-12-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212002245.23715-12-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 09:17:31 +0200
Message-ID: <CAA8EJpqOFMoWd8OEBMVoJVe619+HVjq2w+uwTJG25PT7mrJ2jQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] drm/msm/dpu: add an API to setup the CDM block
 for writeback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: kernel test robot <lkp@intel.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add an API dpu_encoder_helper_phys_setup_cdm() which can be used by
> the writeback encoder to setup the CDM block.
>
> Currently, this is defined and used within the writeback's physical
> encoder layer however, the function can be modified to be used to setup
> the CDM block even for non-writeback interfaces.
>
> Until those modifications are planned and made, keep it local to
> writeback.
>
> changes in v3:
>         - call bind_pingpong_blk() directly as disable() is dropped
>         - add dpu_csc10_rgb2yuv_601l to dpu_hw_util.h and use it
>         - fix kbot error on the function doc
>         - document that dpu_encoder_helper_phys_setup_cdm() doesn't handle
>           DPU_CHROMA_H1V2
>
> changes in v2:
>         - add the RGB2YUV CSC matrix to dpu util as needed by CDM
>         - use dpu_hw_get_csc_cfg() to get and program CSC
>         - drop usage of setup_csc_data() and setup_cdwn() cdm ops
>           as they both have been merged into enable()
>         - drop reduntant hw_cdm and hw_pp checks
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312102149.qmbCdsg2-lkp@intel.com/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  6 ++
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 93 ++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 14 +++
>  3 files changed, 112 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


--
With best wishes
Dmitry
