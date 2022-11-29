Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0E563C639
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 18:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680C210E0A1;
	Tue, 29 Nov 2022 17:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30BD10E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 17:12:49 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3a7081e3b95so145548677b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 09:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JHEjD2xxLNtQCC6FYElEPgk7av75DQm6bwKKXcbxhRE=;
 b=rcG6dqqNMky7jtdTJ46UkMVCNRhCC2wS2wzYNMxEWmGIbDbfjKUTHWdytUvxxZ1hCO
 hii0c0lXZOyFm8dJkzKTYZkEVGzbv50tfIKwFHk1Z4+6D/+dF+zj4hRkJfq9z8cmBL21
 qQbfMHJ2NlTGaB434A4h0QmMLvib0OqFYg5apgzZxYpA/sF5NBxK46w8UJ2wJy6vAGY8
 3IeY9uTE0JxVikWmy/lCoTqxXfVyFtezGLVM3gKj95d4Dxt9v5+8VM8ZbuDVvgyI4R7x
 EFR+uEnDq8S9gWaKyUB+g/NJ/YALqL4rI5FDrlTaSuguvEvo77nrE8+8zKnFOLXVVUTD
 5LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JHEjD2xxLNtQCC6FYElEPgk7av75DQm6bwKKXcbxhRE=;
 b=qLe7Ya1+1oFx6Qbk6TRnh+isPRTwpEkLjeTWwlPLBsrQ7P2tft6UOZG0wrghu6yaXi
 QuT3lu6Cy/qHqL2Vyb5Losuvc8uboVnPZWb7f8CD9zl+5zUMn/O3Z99CszD07uuvEeuw
 ybeUObMnyiBVZ0FaunckoILBHk2Hma+DNOKw+YlWuY2QlcslW7h8wQnZC4ST1TyPqDZY
 bz/NI5D3Mx+HwEFpRppMS6ueCO60QmME0JBBonsjVl950+LGjjBamJk67RvR2Gy2fp60
 JPbJ+NvszTYursrZ657CzceDav2N1Z0lXdAys/Q40r0pK0IvykzCSJhhTRUk9BfP5el2
 D+SA==
X-Gm-Message-State: ANoB5plh9j9rM6+H/rzduL/5hlWn+eohAFTNQYShRDLFD2NPyIYhyOTB
 jSCsF0AfJd3uE09sepLYqstTYw1LbEBQOfkga2HqPA==
X-Google-Smtp-Source: AA0mqf6tFV1ruJYeq+RpTMqBCXfOUZuF64Zqeq76MlGGXN950+keht0aCkWxTl6Ut47af6Q+Cm0dvHmw7A4GE9YbArk=
X-Received: by 2002:a81:9a94:0:b0:3af:eac8:76e0 with SMTP id
 r142-20020a819a94000000b003afeac876e0mr30728331ywg.256.1669741968574; Tue, 29
 Nov 2022 09:12:48 -0800 (PST)
MIME-Version: 1.0
References: <202211241926133236370@zte.com.cn>
In-Reply-To: <202211241926133236370@zte.com.cn>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 29 Nov 2022 09:12:37 -0800
Message-ID: <CABdmKX2aidW7LnvTWdULtHr0yzdSb=KqTWp=7RUUNCOA548Pag@mail.gmail.com>
Subject: Re: [PATCH linux-next] dma-buf: use strscpy() to instead of strlcpy()
To: yang.yang29@zte.com.cn
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
Cc: xu.panda@zte.com.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 24, 2022 at 3:26 AM <yang.yang29@zte.com.cn> wrote:
>
> From: Xu Panda <xu.panda@zte.com.cn>
>
> The implementation of strscpy() is more robust and safer.
> That's now the recommended way to copy NUL terminated strings.
>
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> Signed-off-by: Yang Yang <yang.yang29@zte.com>
> ---
>  drivers/dma-buf/dma-buf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index b6c36914e7c6..485cf4f3431e 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -51,7 +51,7 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
>         dmabuf = dentry->d_fsdata;
>         spin_lock(&dmabuf->name_lock);
>         if (dmabuf->name)
> -               ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
> +               ret = strscpy(name, dmabuf->name, DMA_BUF_NAME_LEN);

The type of ret should also be changed to ssize_t to capture the
negative error value which strlcpy does not have. We shouldn't ever
see that error condition here with the code the way it is now, but
let's not risk it.

>         spin_unlock(&dmabuf->name_lock);
>
>         return dynamic_dname(buffer, buflen, "/%s:%s",
> --
> 2.15.2
