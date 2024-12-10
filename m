Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F069EBE06
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 23:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF2610E2D5;
	Tue, 10 Dec 2024 22:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="FLH0LCNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34EB10E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 22:47:35 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e3c8c1373ebso409185276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google; t=1733870854; x=1734475654;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWBkyRYQGMDGc5eLQDuZCpsdffQM6naQ0vYyr7n61vs=;
 b=FLH0LCNKVhLFG5wyrudCZF3bqrqsaSbd4JbyQqlU6u0l5l1/zlsN8P4ZdWQ07Khl7Z
 w3PAcEKE/AO/CkILeXYQsOYevopzGZ0H6DadWeUawUm0jxFaWRjQ67FkvJBu0YzEVGaQ
 4zhvSz0/TnYZwlbfq9AjJLMB6MLDGgFMNT5i8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733870854; x=1734475654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWBkyRYQGMDGc5eLQDuZCpsdffQM6naQ0vYyr7n61vs=;
 b=oIIeZpkCsDFW5IuJpjG8r5SHP0qIHYvlW0Iy8f65KWPZCCFbm0sVC4pISs2x8f/3Sp
 HwrgpNztW9uBNhoeLeDTWLT2rgJAUmmW6/QlgOTIqgNnCSTfFhtDcC1gO8exAkdFz+57
 v8w0fL+uwUcN7bx+OTST8NXlU8KcaGompqzUpWv26irX0Dd2rHr0nvRp8oBEdk3+sgsF
 T+9Evt5q3p4Y2ORf0Xgvj7xjIrgKTKmOj2d7Pj7Aeei5L4YkKi2hSbJ1UKwov6ekpZJg
 PjmL3GXbL0eCrpck4wBxwnF+mXE084J5IOaXugBJBtCuI020kySdPnb4BE92yBqKLIbA
 35sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKPTtZqcC0C5AqWUyjcSX1/gmE/AWrjjv04LXzWw0gtAieIbKbXgsNKBn0Vdi67Nr/p/dfaSMovNU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqJIxX5zPStWurRFvnCvjML4msbpJNghbwZFVBpa5vnlN+dG+u
 mGeL9TYFdu8LloPQP92ORKWsgLVqNWQuPV5IiJVbx+woTxTiGZZKASpZ7MfXFG7HZkHkCb+Kaoj
 lbkhbQHV8ryhYb9OcCjLOFisxHS5DQART99XUSQ==
X-Gm-Gg: ASbGncuRyYPq6o8PARxpccs7x2NoLq9sDaPDffj+SjyfIbYkR71a2CSflknVg2lfo8A
 vt0FBd+mtJoVW9cgJK7ekVvlMyniWe36G539F
X-Google-Smtp-Source: AGHT+IELsZuOhax2WDfAjwRl4rtBxQdB85wP9bCDDJ4eUK3hc/wYzDqJhKW371nUrhtu9bZHAkwmulfL19gZbIScI2s=
X-Received: by 2002:a05:6902:2b85:b0:e39:83ce:6fb3 with SMTP id
 3f1490d57ef6-e3c8e4252ffmr1233132276.9.1733870854603; Tue, 10 Dec 2024
 14:47:34 -0800 (PST)
MIME-Version: 1.0
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
 <20241204-udmabuf-fixes-v2-2-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-2-23887289de1c@google.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 10 Dec 2024 17:47:23 -0500
Message-ID: <CAEXW_YSd5yv4n4UMDfzKNgVZ_TWikuS_6HHOs0suYwUiVqNnJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] udmabuf: also check for F_SEAL_FUTURE_WRITE
To: Jann Horn <jannh@google.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Wed, Dec 4, 2024 at 11:27=E2=80=AFAM Jann Horn <jannh@google.com> wrote:
>
> When F_SEAL_FUTURE_WRITE was introduced, it was overlooked that udmabuf
> must reject memfds with this flag, just like ones with F_SEAL_WRITE.
> Fix it by adding F_SEAL_FUTURE_WRITE to SEALS_DENIED.
>
> Fixes: ab3948f58ff8 ("mm/memfd: add an F_SEAL_FUTURE_WRITE seal to memfd"=
)
> Cc: stable@vger.kernel.org
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Thanks!

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

 - Joel



> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  drivers/dma-buf/udmabuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index c1d8c2766d6d36fc5fe1b3d73057f6e01ec6678f..b330b99fcc7619a05bb7dc2ae=
eb9c82faf9a387b 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -297,7 +297,7 @@ static const struct dma_buf_ops udmabuf_ops =3D {
>  };
>
>  #define SEALS_WANTED (F_SEAL_SHRINK)
> -#define SEALS_DENIED (F_SEAL_WRITE)
> +#define SEALS_DENIED (F_SEAL_WRITE|F_SEAL_FUTURE_WRITE)
>
>  static int check_memfd_seals(struct file *memfd)
>  {
>
> --
> 2.47.0.338.g60cca15819-goog
>
