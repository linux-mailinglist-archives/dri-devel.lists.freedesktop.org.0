Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A036540F2DA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 09:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C705D6EC03;
	Fri, 17 Sep 2021 07:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40A26EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 07:03:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MDhQt-1mZc6G3qpL-00AjJA; Fri, 17 Sep 2021 09:03:31 +0200
Received: by mail-wr1-f51.google.com with SMTP id w17so5294690wrv.10;
 Fri, 17 Sep 2021 00:03:31 -0700 (PDT)
X-Gm-Message-State: AOAM533ae9BrIMk35ZJtVSO9so35w9XhCXOa9cYigdBJp9Mq2XFfLhCD
 JV9SD2L9tFkSiK2RR0bk5T+/YvyW3i0Ju7s9hT8=
X-Google-Smtp-Source: ABdhPJz6K37oowvtVnUkowG0nxZzOI+axmO9A4ikJeOfih5HaJAzy/5L2QcnJCd43z3dvvawjMZrQdmy5VxlRg74EhY=
X-Received: by 2002:a05:6000:1561:: with SMTP id
 1mr863849wrz.369.1631862211495; 
 Fri, 17 Sep 2021 00:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210917005913.157379-1-marex@denx.de>
In-Reply-To: <20210917005913.157379-1-marex@denx.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Sep 2021 09:03:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1wE2r11LE1XX26LAag9xpP1yAeOqArScrK6nP9wK_f8w@mail.gmail.com>
Message-ID: <CAK8P3a1wE2r11LE1XX26LAag9xpP1yAeOqArScrK6nP9wK_f8w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Avoid potential overflow in timeout_to_jiffies()
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@chromium.org>, 
 "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:S4YrlN6BgutooWXOx59lR4XG9apJTx3XOggV97tELrfIh1fbJMR
 RDh7/MGD0yY2bTQFi6nrueEtWp3MKs3drk7IhO+mc9jq99pPR1BB8aDk0GVbSjBKQnGvxoc
 Sj+sAz6paJlxJFd+o3kdI4ivTTh6bE/PB6EDE+BUX10Sl3O8U2cPe9HPIqlYO6dRItIiAjU
 8UUPZHRmvHdzchHweD+UQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7Ge1X6TPnVU=:HDqpJCECvajA9HY/NiEuON
 WVsQyr44DCMcnLlQJGbkskJyDQyGkQWwEuRrv88N2axbcThTLBrXQR6D3HbynwWldis0/jPVC
 LxUsTCU7EcQUuKUpij2gdo5FUuNY3zN1nysLEL3YFCEL3+W5SyRwPTV+J+qGBVpeTdkumdDoo
 /Xqw4tx8+cJeySca5dR/Oh0uoGmaRyofyCqMHH7jSndetsjtKKS3MaZp1t52D4MeCzxP173zf
 NWlL4lbIINm3aWLNJ3vJadoRm3uvg0h/Y7G7MPngUcGYpQgtGZtus7u0jokyDAEZuwUEZzNXB
 nN8NqtFRaJhPcgtws8gIE82dX2SYu96WYCX2NASAzT9qoaFootPjUFc9YYOtRfCVerNSYxWdT
 srh7bwfQ6q7n8BCQFnR+bGOPqVAx37VgnEmqNjFSr8UAGPuOptcGX98kSCuO6Fgj9lJOEzeK3
 LQF+/72fTD6/a+e3iTTxGqHKFqjZMFm1al6AolCA5ND5vLXkQXtMa3nlF9cXLVfnAhi07Kr0L
 XREkJ+K1lXiw4qa5qfyboiLlIpKYP8NOjh/EKg9L6Sv+PhtnCXOzc6V4sDAWGsXL8kj5H2QA6
 zeSDqylvL/MvWOVdqdy63PhRMHyYgOz9nk7Rbdu2K/wNI68QJ9wF4Nm4wBRcmhL1nJ7aHXq6/
 nT8IQLoK7f60+Ln5gHxRNBiEsuBjJD0hsMrLB0W17IonseSaEckqjlDOdMMQZ1YWDLh3XV07y
 6wuqHCYNSuLxJmV+guLWogDlb/q3O01KNU8Wdmsw1Lms52eM3M4U5noZCVtonPxcXyFkWP+Nu
 5A5yKcMXEjOOEbmZZ1mqUDj7Bn1r/h7ojHKnkR48MMzdONSGHFydxqaf2WnUvnCmZBnrz6aHo
 s0zg6N7itSKz+twwcA7g==
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

On Fri, Sep 17, 2021 at 2:59 AM Marek Vasut <marex@denx.de> wrote:
>
> The return type of ktime_divns() is s64. The timeout_to_jiffies() currently
> assigns the result of this ktime_divns() to unsigned long, which on 32 bit
> systems may overflow. Furthermore, the result of this function is sometimes
> also passed to functions which expect signed long, dma_fence_wait_timeout()
> is one such example.
>
> Fix this by adjusting the type of remaining_jiffies to s64, so we do not
> suffer overflow there, and return a value limited to range of 0..INT_MAX,
> which is safe for all usecases of this timeout.
>
> The above overflow can be triggered if userspace passes in too large timeout
> value, larger than INT_MAX / HZ seconds. The kernel detects it and complains
> about "schedule_timeout: wrong timeout value %lx" and generates a warning
> backtrace.
>
> Note that this fixes commit 6cedb8b377bb ("drm/msm: avoid using 'timespec'"),
> because the previously used timespec_to_jiffies() function returned unsigned
> long instead of s64:
> static inline unsigned long timespec_to_jiffies(const struct timespec *value)
>
> Fixes: 6cedb8b377bb ("drm/msm: avoid using 'timespec'")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: stable@vger.kernel.org # 5.6+
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>
