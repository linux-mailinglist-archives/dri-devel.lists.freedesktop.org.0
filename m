Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FA39EDA6D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B1910E1B1;
	Wed, 11 Dec 2024 22:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Go1ZjYYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BECC10E1B1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:53:51 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6d8adbda583so100076d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733957630; x=1734562430;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=2egq6Dq3KjRKLgPQmABDsLel2na1tngRhhj74d6j2rc=;
 b=Go1ZjYYAShTbRVaDlXCnKuyjRNO8eJFruMVNNc0hwn5FcFStmIq/xqt3jHcTxWbQGl
 PGXxerg1FhovIhi2ri/h1HIJP9COewGtleQND3OAz0XwfkHQA/DVGqEJWgPkeZPkl8tb
 lFmO055bD2q5JwQxZpQck/fPq/Ci75zw4dFgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733957630; x=1734562430;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2egq6Dq3KjRKLgPQmABDsLel2na1tngRhhj74d6j2rc=;
 b=b1K6wRJsE9XrHjHz02ACnJHrsIAmj2ZZSj2q2Mj210sTkJ7H7dlFhv5VFTuWfokiAT
 Eiuk+SWlwpd+RwMBhLc6f1xcVHqDjtM0XGZs3Z7zK+NC+K1Z2Ze+jzCGJeJfh5rRtWTr
 2DS6vTJsfuITB7Fe7uHyeJrdGiiTl9P6iOJsrrHFMvQyVbr6MSnGcSS+W/V86ql5h599
 yz9mrwrOE0ggOj2klC8OIw025NYZEaRuFYhu1OjarT5rnBaZARkLGbWl+hteJGZw1Yec
 DDJOoLxNIYlOwcH+GCA+AKbkzNdkQar4P+5gBTtzwdKnwckwFmUuBKcSr9wpQ3k+N2Fe
 JF1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDOX1ZXQnh5RnOzk0qfQmGNS3vJoG/PgAECR/erNRN+1OhobLAEL2elf5Wpnhk42cdZ9JXskflE+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkwTT5REokuKruVzvkj/ZBdhDlfd2MEiGCW9htCDHhNgx+CPZA
 6Aj2wcrGrO06k8PqBF1tjc3zXzrTObm3g49gkJWvDgy02mHCDdtHWJYIhsv7daUaLtTSQRFER4h
 CWdnN2kcRHmCxxmD4rOSR5DqlN5AkWiK6qY9I
X-Gm-Gg: ASbGncul8gE/sKuQBscjJXRlSil/wpPxEGY0s6pr5Y0QkQVXL5jYBZ0vOPUGJxSo5Kr
 Q3zBQMig9AH3Np23YCwuIESeavuSFcczAK+17BS9A4KNm/Ibe6HAB2msVvJEcsog=
X-Google-Smtp-Source: AGHT+IHPYfu5RWwg4QjV5Ft9MAhO7VJZB9xFWbSMLRysOqfixDFuOnt9+09RHZcOWbxPXE1q+wf1OmiIJ0aIfFFsbn0=
X-Received: by 2002:a05:6214:1d0e:b0:6d8:aa45:a8a2 with SMTP id
 6a1803df08f44-6dae38f441emr17981836d6.11.1733957630566; Wed, 11 Dec 2024
 14:53:50 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:53:50 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-13-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-13-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:53:50 -0800
Message-ID: <CAE-0n52NEHh6XnsWsg4XG0nS8cVpC-HW8snBLD86PO3-AV3jfg@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] drm/msm/dp: drop struct msm_dp_panel_in
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:43)
> All other submodules pass arguments directly. Drop struct
> msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
> all data to msm_dp_panel_get() directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
