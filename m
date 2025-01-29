Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83048A21868
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 08:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B9F10E093;
	Wed, 29 Jan 2025 07:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k0xuHfjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DFD10E2BA;
 Wed, 29 Jan 2025 07:58:58 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2ef28f07dbaso9106908a91.2; 
 Tue, 28 Jan 2025 23:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738137538; x=1738742338; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mBHIAN7JpxixHgHVdW3YNOvZJZHJ6etB6CsRRxzIqFo=;
 b=k0xuHfjgjNx0HZjVTzirqzOctmYWIUAgNxpwkHCGanAll9h5G8/8TWuLE2c55viiz2
 alHcLLwLAb1AUBiVivpH3ZIm+/pUSyn7RDp8rBde+FpEmyCkRTtladTFDMhr4omaD8O4
 VysUND1ipBB7AvUdL84Avz/7gRkbGqA3LM+A+3J4EyhR9Wb9XJN+0ZxhhJVnr2EXhLe2
 av4GxUNRSDmsXzkNZJp5oR3dwgKoRrUkQl77mON+rULP967pYiluNTOy3uc4xFbOa8T1
 +hYLurX1e7ko3RaqaFAkWe7uAJUA2RID+1fwFRoH1a4v9bV+BJ7/kikhNKep5iZ4U+mN
 8uCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738137538; x=1738742338;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mBHIAN7JpxixHgHVdW3YNOvZJZHJ6etB6CsRRxzIqFo=;
 b=BD2Gz93Mptc+oNojBo08qwEVj8NUauvHM8LRX2xHak2ERxTCm93s04XCt6BnpxNDUI
 AM/qpYOd8ZC2V+n4MdzKw74ALW4IgHkLoPRZvUPRL6Go+7Ul8zj/NhSRvMNwcyuEbXg2
 sbluNGhEv5aJK0ozjsNgKwu6Ixy5fZpvHrKJOca2JQwNRxy6dj2iSvgWXutA1nJijUyJ
 IMtQc2/usoaKZWy5OJf5GZz1pAzZRpyESowk/f1DOkwoHnx7xo+ckHXtKkpeWFnhR3/g
 AkNYGiS8SUZOqRi55SqQe2RMVlkLQdn4teTBrNr3pU23J/QjhAj3yIcGvQcwxEuTKDOh
 VOvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZjCIEsOnAXEhekm8iZ5uhobCXVdj1VdgfYYrpbjlQCY6Wc/VoftU+g48wqaQXsCj2st57vw==@lists.freedesktop.org,
 AJvYcCVsU98HLTBAlXs2G0X+4snBX5zLxcGkmrYhXlFYSEhi9K86nJayoQvUU4qj/fwLhYUTKV4SCSnJfQ==@lists.freedesktop.org,
 AJvYcCVwa2dduB+iGH5wZOMlf6yEWHxU1pHY/JnPD+5/PI3WR/sOBXbTSSbqjbk+qrufyYMqHyUBSiBj@lists.freedesktop.org,
 AJvYcCWc3TmXjc+3e2Gdr67AX9Wbx+vXvnC2ooGkWXXTa+45GPvXj3jS2UOdEgC5HmkS22UMPdlTQemamQ==@lists.freedesktop.org,
 AJvYcCWlP5/xQn2Q3QgyL1IA3ECAzT2fM1uY/Zn65zQtcC5bCfw5g7q8+GdxPUlc2A+5sBiJdGq1EjgJ2g8K@lists.freedesktop.org,
 AJvYcCXWQI0WYZR3w9GeAwkLycAX8tmdjqnjuVH3BlRDtFsAnPaxMjxuxjR8F9UcAxzrcs8dTb54tddT29U=@lists.freedesktop.org,
 AJvYcCXoTGKoV+lJCV15ilW2CWbNMD8IzIKGTqrgzGPwUp9dbOfj1+GfnLUpZG1ppIhKlF/CC8cOY23YDl2S@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSUSpkPO/GHAO7rM3chprJ6SjgzbSCedFOlpC0p6Zn62QXtcMV
 wnMuXmH11v6qqjEtGuL5b1/D5TDe3csOyyFg1klMNOWAvLibBRTCVB8j/J6Ea1L98poWWNv4YBc
 ykMYKhOVnMpJbBEAPWVQsq06QsxI=
X-Gm-Gg: ASbGncuIVtgBsNbLyeyfoeXORT0z4X++eAjOLaTVYQVNt7PspciVcCFzFbj2gKxVMlO
 QkRrJMUDhoPEbsDQSJ2m0/VsZV0/nuvfZmTNs8LxvSWa5SLhEenUJYLbLIcEnN4HXbDRUS6E=
X-Google-Smtp-Source: AGHT+IG3r4vUiKlWHwTQkZvS7+VVNNq+4vIcWf1DrOqg/M9EOigTA4eFhbCTA0u2oYA8j4fsp5P00rPgbnSpKao2ckA=
X-Received: by 2002:a05:6a00:4b9a:b0:72f:d4eb:48ee with SMTP id
 d2e1a72fcca58-72fd4eb492emr1158389b3a.12.1738137538327; Tue, 28 Jan 2025
 23:58:58 -0800 (PST)
MIME-Version: 1.0
References: <20250128142927.103290-2-phasta@kernel.org>
 <CAH9NwWeTVv3kABmADJD8mNcE1Psq2ToLfzjO4HzbSfJ4+gkxDw@mail.gmail.com>
 <20250129085625.502ab114@collabora.com>
In-Reply-To: <20250129085625.502ab114@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 29 Jan 2025 08:58:46 +0100
X-Gm-Features: AWEUYZmAfGxLzIZNC3w4bsXkufJYOdKgnDes_maHi6cPE_lb4PoKfKm-HgqiaWw
Message-ID: <CAH9NwWdaAyPXbUmR=65uC0RTNB4rvKJxXi0DMhjC2F1fKRYA4g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Philipp Stanner <phasta@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Rob Herring <robh@kernel.org>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> > >  int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> > >  {
> > > -       int ret;
> > > +       const struct drm_sched_init_args args = {
> >
> > Why not declare it as static const struct drm_sched_init_args args = { ?
>
> Because some bits in there are not static, in this particular case,
> gpu->dev is not static for instance.
>

Ah.. yes - thanks.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
