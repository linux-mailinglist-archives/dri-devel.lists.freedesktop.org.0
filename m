Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B707580A248
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF4410EA88;
	Fri,  8 Dec 2023 11:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3067E10EA75
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 11:34:29 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5d3758fdd2eso19294517b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 03:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702035268; x=1702640068; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ioy7a4mjD1TM5aUtdQWmEC4pgXl3wwexCFdK6aCY8Cc=;
 b=mEwXk+FHwoWzC8UbzpboYq1So4Pk7XO4tESVKfBYtHC0DQJfN0VE8IpYG+MZ3Y/Go+
 +r81xBHmKYIEAd63ywnyTCd4Op0eKvkz2K5Xrwi3h+aB3ujpVNHzyf+tMHqGBwjjdsRM
 x/24KPdZxpp49eHkZagxO0BlDEMkArIp1nafq5vaWJKB2YXain1/3d9lNKZfV0wPkcVM
 praSGTkwolRorLc+E4U+J4PhWGAEhtROponWVHfWFzuxjM6qoZyYfliw1IfEdvUzIiLv
 TM4nAfaZPK6TTv/jInPLy3y57PZ994vYud93dVnG9bE96xKVZh8EAwaxc/7PRCC+gwCZ
 hqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035268; x=1702640068;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ioy7a4mjD1TM5aUtdQWmEC4pgXl3wwexCFdK6aCY8Cc=;
 b=tQ2WThAtYRZF2pW3eq/IUpmn5wQwJxhHtqU2iZJSOpfDF9Rr218bJ6hjFomk7vXLW+
 f55haChjTo0e+Wll6ESif4hK7ZEOC/YpqW35hQcZCVaY0fFMt8lJ9CZN9FOd0Fbc1Cu9
 /kAnxQg/pvXi+ITAyVJ4i+r1rFZBd1wC9CHYZ1id5T1YAA0mzk0oF+m9+v21nlSc3mM0
 pHk1+AdJD8/rQNy4MXoEglNZZFnqPHQhMFLvPXVax+kUGij/A3rC406vmaoSxoUonv7m
 Euy0GWMvbtc65J5DS5gNCXjhv2sCA3WtNTFsZWFApIc3myvgzwH3Ap+2nxnVn8Iy5Ari
 1W1Q==
X-Gm-Message-State: AOJu0YwwAgND9PjSH5w0ncGLAOui6D4VRTZThiwbzIep79u/IereQ4l/
 k0XO2/VYxMV/VXTkQ2SRIKgyiIN/mnDkwEvAyqWgRg==
X-Google-Smtp-Source: AGHT+IEnxfoJSBiNek6sdMc7Ud4skvctpIP2+cEf8vddxE69b7AorZ3VH3y8fLa2ZwsZWhID77sUwyYka6dZEElUZlU=
X-Received: by 2002:a0d:cbc4:0:b0:5de:955e:24a6 with SMTP id
 n187-20020a0dcbc4000000b005de955e24a6mr639733ywd.2.1702035268406; Fri, 08 Dec
 2023 03:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-11-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-11-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:34:17 +0200
Message-ID: <CAA8EJpowcKmn_xXbmwXZGiTJXuwJcArjyDii7m1WjofPE_xoxA@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] drm/msm/dpu: add CDM related logic to dpu_hw_ctl
 layer
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> CDM block will need its own logic to program the flush and active
> bits in the dpu_hw_ctl layer.
>
> Make necessary changes in dpu_hw_ctl to support CDM programming.
>
> changes in v2:
>         - remove unused empty line
>         - pass in cdm_num to update_pending_flush_cdm()
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 35 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 12 ++++++++
>  2 files changed, 47 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
