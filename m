Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982284ADFC4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE6110E911;
	Tue,  8 Feb 2022 17:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C589F10E8C8;
 Tue,  8 Feb 2022 17:37:28 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id m10so21377462oie.2;
 Tue, 08 Feb 2022 09:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sdaXua3wKx89UC59F2Pt2PCQFc34eeBx4BY52D/5hak=;
 b=fklw61IBZcZyGHPDd2ELRKGQZOfkqMfaBii8mj+N2LVwMBOIoYhMsPap+wC38Q0ABX
 zbqL7H4XlY3ijwC+na7h9oK/uTgHO5tXUIlVmaej+OGZWHRSePmCMcrhkIuk7IBMZ3La
 Qw4cMTmwZPL4R9MhscuS5+vN5vQN6225VVVjgmV6M2JP9f/6n+lVWYbFWqglo7Djituv
 gI7vgcIu6hMcuiJb9LkUR+cYFzySkqjcfAtJxcg3h4zIkdaf8gynEszu4Bp/jUZpu+5j
 LhVrMYNVxikXwlYnLMLOHAFnmWwVT1FWizHjT+jegyAuMbHPHHJp/DvT0lAg24Otmcee
 fduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sdaXua3wKx89UC59F2Pt2PCQFc34eeBx4BY52D/5hak=;
 b=vQrld58YvKhA4GH6/YlNtcQWG0MG400g1KjwUxZ+h6hTHBUPYIJGlp5xFWjOJkmIpw
 b0qeAdMsoyZeL2BQLJf+2H7q54yamO8TARao1GkTndGocLXhO6EYrjexBX3UC4a9Rj8l
 0Tvd/W2K9gVzT0G+mHN47zJfflKEQunQuuYRRqMykZfnEvMsOlIlFNBQXgE27tIyPITd
 /E5Gx4ZKdmW0qocX+dKjEKOw4I8MMUfiT84pVWyyxU68NYk4Pd0MSHzu53QN9C4uNS9G
 YCwM0dlbHGiBmL5cpTxaGH75VRo98pl8FGWpgZGWh/Br+SlcO9ukK9cyGq1q9FqGRW9T
 h9JA==
X-Gm-Message-State: AOAM532+SUAcenjT05md+icAW8lX1Nq97iI2QYJc+/TP35MJyi1x0AqC
 fXxIcbPDbqx4owm9XxpH1BWrvJmRBE++satmTX4=
X-Google-Smtp-Source: ABdhPJxYwuVKLDoLcWXrr1pQZmbPOD2kj1DL9NOJA2yhIEEUymwXU+ANmM4nu/kRwLpwlL2q5FH9K/JSUBV+hEIgzbo=
X-Received: by 2002:a05:6808:2011:: with SMTP id
 q17mr1092702oiw.199.1644341847944; 
 Tue, 08 Feb 2022 09:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20220208081443.28210-1-zhanglianjie@uniontech.com>
 <108cc1b0-8630-7f41-5ef9-73df69d250e9@amd.com>
 <400b7279-b738-5614-dff7-0e2f6f395a0e@uniontech.com>
 <00c5b899-ed35-44a0-6b22-bc3e882e49d4@amd.com>
In-Reply-To: <00c5b899-ed35-44a0-6b22-bc3e882e49d4@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Feb 2022 12:37:17 -0500
Message-ID: <CADnq5_OukNR9N+iqd63ZT7Jrk0C7k6n6mCVR93WdG=96vqSS-g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/radeon/uvd: Fix forgotten unmap buffer objects
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, PanXinhui <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 zhanglianjie <zhanglianjie@uniontech.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Tue, Feb 8, 2022 at 3:33 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> I think so, Alex will probably pick that up.
>
> Thanks,
> Christian.
>
> Am 08.02.22 um 09:28 schrieb zhanglianjie:
> > I am very sorry that I submitted many times due to the character
> > coding problem. Can PATCH V4 be used?
> >
> >> I'm scratching my head what you are doing here?
> >>
> >> That's the fives time you send out the same patch, so something is
> >> going wrong here :)
> >>
> >> Please double check why that lands in your outbox over and over again.
> >>
> >> Regards,
> >> Christian.
> >>
> >> Am 08.02.22 um 09:14 schrieb zhanglianjie:
> >>> after the buffer object is successfully mapped, call
> >>> radeon_bo_kunmap before the function returns.
> >>>
> >>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
> >>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>
> >>> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c
> >>> b/drivers/gpu/drm/radeon/radeon_uvd.c
> >>> index 377f9cdb5b53..0558d928d98d 100644
> >>> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> >>> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> >>> @@ -497,6 +497,7 @@ static int radeon_uvd_cs_msg(struct
> >>> radeon_cs_parser *p, struct radeon_bo *bo,
> >>>       handle =3D msg[2];
> >>>
> >>>       if (handle =3D=3D 0) {
> >>> +        radeon_bo_kunmap(bo);
> >>>           DRM_ERROR("Invalid UVD handle!\n");
> >>>           return -EINVAL;
> >>>       }
> >>> @@ -559,12 +560,10 @@ static int radeon_uvd_cs_msg(struct
> >>> radeon_cs_parser *p, struct radeon_bo *bo,
> >>>           return 0;
> >>>
> >>>       default:
> >>> -
> >>>           DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
> >>> -        return -EINVAL;
> >>>       }
> >>>
> >>> -    BUG();
> >>> +    radeon_bo_kunmap(bo);
> >>>       return -EINVAL;
> >>>   }
> >>>
> >>> --
> >>> 2.20.1
> >>>
> >>>
> >>>
> >>
> >>
> >
> >
> >
>
