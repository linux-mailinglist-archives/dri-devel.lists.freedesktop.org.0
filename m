Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35C26BCAC0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE37210E081;
	Thu, 16 Mar 2023 09:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A666710E0A4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:26:57 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id g17so1481175lfv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 02:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678958816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWG+4CQcPYhUHYikO9t+j3Nr8BghrXJMIRVrbf/EoFk=;
 b=LnOd0yZStUpKKaSVQ7kbAFn7AmAAoyFg2d50nY0ZUsW3szyIz1mY7EWBFnDYMoAADN
 M42jOeZvuLIoelYtWQq8xPt6g5Ertm9TQqVbDwguxbRYpiL0AyQBPRsepKyiwLrH903U
 um5HjKqc2Y8BJHp3Opeo6dh4LftnQIe8/Z3uPOPyx6Y8ffqZEQfB1Nw70vgR/D/+tGJV
 TsaiBtKYnupsjhxShElGpMmt2qWlqMA35Dgmo1vIvrPu2SisXn9aWv+ZlWmwcywFRG8p
 ZgiWStmylUoPqubbLymh1NyxdsYFqWQS7jy+g8fy+O2SKRfXG/+RB8cYD++k135JXq8b
 p7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678958816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWG+4CQcPYhUHYikO9t+j3Nr8BghrXJMIRVrbf/EoFk=;
 b=xdsyqxwnVUrfHm7+eCbwlBv67LaM5d3VFzE/PkkIYpiJ4sSB9hZECBe7jDvNZ35QXt
 vOezcTZqVmHPotRsZ3lrdzybuGy3tmmakqaiQ9YJmexoPjJIR2l/8mJT3tDEgcgI0HCb
 7LLAdcNByRUN2hlEKdKi14JFpusYgUaM6kfSyXs1q50rIk3LbGINWVI3Y1nyU6QGuqjr
 AcmsdBh3JarXHXFqcQqM94sGe9PehvqGr+JFQ7K+dx8jbucm12/iY9lToR0LakD+7Y/g
 m/SXKoN/MNOEiQ6+NmOKDsH1HkkJOakmHPltT9xBz6MXFRMDqDkopvWmgbcFDt3EKbRf
 OQ9g==
X-Gm-Message-State: AO0yUKWSjq0zLqOZAPGEo9nuRYUNyT6CPusFPOsCztZBoADZgwKIxsJj
 e7k6lThkVtUHgO9BAie7Q8p5prQ5STlrvI5pL08LK71arF0=
X-Google-Smtp-Source: AK7set9QmZ+1coZ/q1XhHhCAJ6QGfu3/RJsX8fBPiwbGgZ8Fdz2YsQAZ7epqEzZBUNlxcPRsYOIPgi3ZDyDpFRX65AE=
X-Received: by 2002:a19:7604:0:b0:4d5:ca32:7bc3 with SMTP id
 c4-20020a197604000000b004d5ca327bc3mr2965584lff.10.1678958815805; Thu, 16 Mar
 2023 02:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230316072647.406707-1-christian.koenig@amd.com>
In-Reply-To: <20230316072647.406707-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 16 Mar 2023 09:26:28 +0000
Message-ID: <CAM0jSHPRVgCkWPqzPOs4-4QMDCefp7y5jcTpZDgvXUpEa_a-fQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: drop extra ttm_bo_put in ttm_bo_cleanup_refs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Mar 2023 at 07:26, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> That was accidentially left over when we switched to the delayed delete
> worker.
>
> Suggested-by: Matthew Auld <matthew.william.auld@gmail.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: ("9bff18d13473") drm/ttm: use per BO cleanup workers
> Reported-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> Tested-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
