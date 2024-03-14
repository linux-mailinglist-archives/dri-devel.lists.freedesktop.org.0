Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363C487C02A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 16:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544E410EEA6;
	Thu, 14 Mar 2024 15:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="j1xM3MVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E2510E995
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 15:29:34 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-690bd329df2so7522636d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 08:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710430171; x=1711034971;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tuhQc5l9apEej2H4LOTY9yaoxPUBJy/wLmmpg/Pkruk=;
 b=j1xM3MVup0J/mS1dIYCQ8JpKmOo92XsbhDyEaRH4RigNTgX8zzx4PkzeSvLi8jBRR9
 5PqpTmTDe68D/ng3vBQOR0OJQW6ag5HQA7frcXaiOTRwQ7gEaEtfeaoRIuRFJidDl20a
 mBD7Pc6wNdIurlESu1g9pWPemqDhrpdfCbq1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710430171; x=1711034971;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tuhQc5l9apEej2H4LOTY9yaoxPUBJy/wLmmpg/Pkruk=;
 b=sqs3F6fTFfUVRcs2W7SrXRT5DtzV/lgXY8N1uRtwH6e8GRDQM0X/SYfyURA84eCLz8
 5+k3Ielbf2ilJ085R0cMxm/zh3wLn+P/NVjNVHxRWiEb5OgxN+PYWFJ/vH4MOya38DpU
 C3VBS9NC8IT0cSh9yvVGAxUC0uRWVBcaRXWo4C1XDHiV/qIGS/lzfFtiyV0NImLjTjfj
 2+7Ys4Bevp9rvFLU/UAipaOVEZLMKbPCTGQGtwZtLrbB22oXHa6ltKnMs+O1sl0+UeWy
 7acVw2J4A/XLJmIGtXGZ8HC3jdTABncM+rt0sDz1Z7KVzmNo2FhFTCy+1u3OBH+ykk2V
 KsFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU/+raEyfSl+yoM+Rc4iYoPXEthgmTK1cZoyyaRmUfE4ITf1iPTzLgCYv6C9yUIXdQJ5wUa+VN2IY1CBS1MjOzsNQ5FGBV+M8c5IasGs8/
X-Gm-Message-State: AOJu0YzwF3pYOVdfN95DowyydnDjLrZ7GRio5r78vtRLmTM6eTxGdAks
 XGNblbvGdQVpyhHpaHO3I0bSINq9O1xKyxd+KIpTBdCZsTgWy9P7g1HjqQpsM5XpJVxLn3Oq0Iw
 8CA==
X-Google-Smtp-Source: AGHT+IFLxUQby2Ufqh6F5otJi/vPkj/TiEv0bBcalyCQ4crn86KS5Qx/gM36kM3Nejhf6X/jCur//g==
X-Received: by 2002:a0c:e608:0:b0:691:1fcc:e26d with SMTP id
 z8-20020a0ce608000000b006911fcce26dmr2299555qvm.31.1710430170926; 
 Thu, 14 Mar 2024 08:29:30 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 jm14-20020ad45ece000000b00690c5cc0ff6sm577683qvb.124.2024.03.14.08.29.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 08:29:30 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-43095dcbee6so324211cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 08:29:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSlMrviTwY8GEby8vMQOb+rBQsRtHg1TmSgKiz3cyFIkLmHrgnNLLyvYGpt0gKN8W1+YACj2vFQ0ZUwYc//LZBECbzn5O6I6ENcBQ5Ui8/
X-Received: by 2002:ac8:474e:0:b0:430:90af:43c3 with SMTP id
 k14-20020ac8474e000000b0043090af43c3mr272846qtp.21.1710430169466; Thu, 14 Mar
 2024 08:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240307093727.1978126-1-colin.i.king@gmail.com>
In-Reply-To: <20240307093727.1978126-1-colin.i.king@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Mar 2024 08:29:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQ5XBT4Jt6VUgVqxsn7NQZjDCTRFOFk5Fr+Fxkpv55SQ@mail.gmail.com>
Message-ID: <CAD=FV=XQ5XBT4Jt6VUgVqxsn7NQZjDCTRFOFk5Fr+Fxkpv55SQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/msm: remove unused variable 'out'
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 7, 2024 at 1:37=E2=80=AFAM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> The variable out is being initialized and incremented but it is never
> actually referenced in any other way. The variable is redundant and can
> be removed.
>
> Cleans up clang scan build warning:
> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: warning: variable
> 'out' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ---
>  1 file changed, 3 deletions(-)

Tested-by: Douglas Anderson <dianders@chromium.org>
