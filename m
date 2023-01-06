Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA27965FC6D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 09:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066B510E4D1;
	Fri,  6 Jan 2023 08:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19F110E4D1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 08:09:08 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-4bf16baa865so12647147b3.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 00:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Oyf8/xdGIeyv+pywCJ7PHhoImivmp2P3M0qiI+bO/c0=;
 b=bKGQNv8uXrlgWUEXeM3i3nMbH++VCHo5Yd2FIZluObPRD9Ni8ZAV5+Rsoj6oUrunux
 XqkRD57gxFntIkgC6ON5sAmTV6SsUhL4LnjDSvm7OynSk0wYYRv0lYIAA5hvdaDLkNDm
 gbPYNbfbsHYnQVp89GzllLyunTyen147ZckzV03lYPlvUbWzd/IMG3WtxVhrIztaC1at
 8pByiUA4KnBXJednw62cSq5dBytKmZgxy1pm2K4dhwhXBQTSmCd2cRG9/SwCwEdly2Jf
 2wi9KSpffb3Kr/v9ydbdEcaJwaBpYIGum2+0u+8ZyUtmyZF2SUXX6YwJAEb7jr/rtBw8
 EGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oyf8/xdGIeyv+pywCJ7PHhoImivmp2P3M0qiI+bO/c0=;
 b=GaJYisceYIDlPL6xYIXLOJqQL7Lcm3r4juQNobRxQPCyLLyieIm4yF+jMCe7BhSbj9
 IIkFy3KeosqkoIwkZj/x1Vl3/iYBpdeuh616xelq4W3TGrWIrF55dtYOK/vrNl8ED7a6
 pQQhB+04ZtbRtm7AkEw3G1m9/HiGkfL9UPoCAKpubL0UJISXG9MYP7oBLWQ1HHMKxm9H
 llnRZxI8lnzOlKOpF240BBmdTqdXxMxmkRNkzTOA1M/fkCLppF53PgzMN79Cze99f5N2
 +OBHgGOBbr9cWBd/w6KlmRcL6IGju95Bl6cqlPujxqH4ZK56W/1BiLlrUgvWPZ1N5NEQ
 L0pg==
X-Gm-Message-State: AFqh2kqk5LqF/qJXymRvZ+xuL/wMy11eAcLz6Run3Ocvn7igI4nPfFZo
 V2hlcZVAN3C3Slva1MLfWdZlGMpaWVHuel8u3QFznw==
X-Google-Smtp-Source: AMrXdXsLzL9Cvjgf8Y76dGUlcsqoNvKrwQbdhz65NgGzcCjttxAwInXhnzL11PxiUmdUUMCG8BW0VjLcKK8Mr0JOCOQ=
X-Received: by 2002:a81:1e88:0:b0:432:2458:f6ca with SMTP id
 e130-20020a811e88000000b004322458f6camr7411794ywe.138.1672992547775; Fri, 06
 Jan 2023 00:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20230106013824.27208-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230106013824.27208-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Jan 2023 10:08:56 +0200
Message-ID: <CAA8EJpqfssbS8VPmBHv6Y26ubJ-mG69tm+yz68OmYBA5_bP9Gw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Add missing check and destroy for
 alloc_ordered_workqueue
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
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
Cc: sean@poorly.run, quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-msm@vger.kernel.org, christian.koenig@amd.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 6 Jan 2023 at 03:38, Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer.
> Moreover, use the destroy_workqueue in the later fails in order to avoid
> memory leak.
>
> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Please resend the patch, including freedreno@ to the cc list.

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)



-- 
With best wishes
Dmitry
