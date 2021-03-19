Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5C3421CF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 17:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979A66EA55;
	Fri, 19 Mar 2021 16:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A42A6EA55;
 Fri, 19 Mar 2021 16:25:10 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y1so12668391ljm.10;
 Fri, 19 Mar 2021 09:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yCCM8CQ1dvYbSyF1A8EHUz19x9S3I8O51vY5/vvcKrY=;
 b=LPbOR+wXdoYdBIv2JmdGiIkS436gn955TAYmRFFGSbZwQDMkyjSApzADHpLw6TE4xp
 0XJZZY/3wq3yR4XseZJQsPppjhOgLKBEj992Icq5W5cIugsCAK4ajqCvp0VhmcTLq17F
 DJPYgGr9+AwjvqgeOEHe3gp4kljZFMQMy4sVGpJ8SyEqmxzG9OZ5w21ESq0Di9jFMlcs
 ox8MNcE3/k3SrejODu3kOarryEf6ye5hCrzvCH3JuhGgvL3dw1wMSZAWwu1KtLpVPtS4
 H9i+zPaXADnA/QkCZT3/rd8vfTxBd61VrGJHYInzYOcbAdJCK14AuRCaC5xuuZM9kbRj
 tEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yCCM8CQ1dvYbSyF1A8EHUz19x9S3I8O51vY5/vvcKrY=;
 b=nfdgejwl+y84DBHNviEl/LoD+8irb1hZesajA0caI8+Zu/F1st34oFb/9tVhEUWT6s
 dIeyva9anPuEMcQ296Iwo8kDXpvb2Wp+uvpO02EaZAw6uknbgA064vkSV6pkQGpGwSwo
 mzfXzJIazvE+31ikfnv4D+khMozoUyVJdMZcBS88Ah1DHxW/Ke1xeTCqUS561JU6FRZ4
 XZxCl4Ez21Cl43BBVCR5hLBPJiZeWs09P0o/0x3h4kKUxqIYvLZmPW/0oYvpeGN407pi
 v9tqBN2h3GDldZFGFTWPgJIWyQtIFbCJh32Timw2n0S5ybi+RS2bB0OKLHD32hL3TeAV
 wDDQ==
X-Gm-Message-State: AOAM531qqHNrbk9zmTxvDCDx66aqjQEQca4VyvzE417tTVKgfVjQzrmS
 5fpBFqt04vnuNk+dtO77nZoB6As9YR5yG7sMVmM=
X-Google-Smtp-Source: ABdhPJxBGOgZX+y25IYwJRCofcYgJ1nsbcuBORQ6uKQ5uORlyrNsTwta/NrVMVP8TixVEj6cUx8Xdfxh5AfwdJN5iwM=
X-Received: by 2002:a2e:87c6:: with SMTP id v6mr1425827ljj.490.1616171107531; 
 Fri, 19 Mar 2021 09:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
 <CAOMZO5Br85sf+ndiOWzeG7DgpqVHpXtnNGZLsVMOpBC5eVE2Aw@mail.gmail.com>
 <CAF6AEGtYJegOPt4dju5wyzp+WEhXdKyeUbkoO-oDzSC2aR_9ZQ@mail.gmail.com>
 <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com>
In-Reply-To: <CAOMZO5Bd68TtZ=-X_Gg7n9W4BsdAhbQAO2JhjMQvwtjdoWsn2A@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 19 Mar 2021 13:24:55 -0300
Message-ID: <CAOMZO5A7wgKUMGjjG-w89EPQ1h0+aWFOpUPbDvGGeVL3Z6dm3w@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To: Rob Clark <robdclark@gmail.com>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 12:13 PM Fabio Estevam <festevam@gmail.com> wrote:

> Thanks for the feedback.
> I will follow the same approach for fixing the suspend/resume path then.
>
> Let me test it and then I will re-submit Dmitry's patch and the one
> for suspend/resume as part of a patch series.

This approach works here for the suspend/resume path too.

I have just submitted the series, thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
