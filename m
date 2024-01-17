Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56282FF39
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 04:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A7910E613;
	Wed, 17 Jan 2024 03:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BAD10E613
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 03:14:20 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dbed179f0faso8179347276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 19:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1705461199; x=1706065999;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=59p+fnH5rT0frfeom0IV/J7px6MXmab6xfrDrxBnvA4=;
 b=elQTUuIK+7CtacKCImUl7Ji2mdiTcr2mZutrhfl4pAFsGMaowf5WglPlZtjd07wMNt
 Ho/dBsIlSl9cGb6nRgH26tg3UJjw0A2LefnAe8o7D3/lPh4oAgEs6ZR2QgEA0k4qbfyS
 57HJMhVB3UjZJZjo7E/EB2L2TxxARya6/8suU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705461199; x=1706065999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=59p+fnH5rT0frfeom0IV/J7px6MXmab6xfrDrxBnvA4=;
 b=hhrB2w5h3HOFHwuoEvDWiUIqprrN9yzUVw1ttMrVyH044upOqA+whPOkfRJD0zY3Yp
 ReXmGeQDHGkq5tfi+QLex8QOnfHvuYcY77Y6ZlKp5zDcg4b2jnfqv9mbl4OyLb2+5Olq
 foGpuMM0K8qVV1T/+QvKZe/WG/D3V0BiK6vizcG5PCi6bYSaSopRt3A8W1TCaVJrBRNh
 CFw+CtQjg3FuM3aEK9caMVOnhzrLY5LKY2hrAhO3wTUqtGbKwFbmE4rnV8lLmDMJ0nba
 HOni9k/PGAX+ptoj8ZYxZ9GBQG1EuByRNuZPjShAC/8E7Ra0Hh+UAIZWGl76zfrsvsUT
 xX3w==
X-Gm-Message-State: AOJu0Yw3sgGcN0fdwW2UOUKIbNZ16HFbG2+3SB4hWzXXqb52qdSWgAh7
 AFymLO+IhimNFXpGdr2bmqed5zMr8sQYNUuQhhU4Ah99dOjP
X-Google-Smtp-Source: AGHT+IGRFGRbecsFxBH7oI2HKW/w7qzUsKpySNvwdsvVWjq4+0lDvbQqMdICxi2kISBDmJSGqnx5rsPyHeyrGWwg5CI=
X-Received: by 2002:a25:ab88:0:b0:dc2:26e5:a76 with SMTP id
 v8-20020a25ab88000000b00dc226e50a76mr76206ybi.47.1705461199670; Tue, 16 Jan
 2024 19:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20240112125158.2748-1-christian.koenig@amd.com>
 <1df3cfff-50af-4873-b228-57b6900b9ba8@gmail.com>
In-Reply-To: <1df3cfff-50af-4873-b228-57b6900b9ba8@gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 16 Jan 2024 22:13:08 -0500
Message-ID: <CABQX2QPdXjC_S9tUhPAuGo0P7=GMXvS0uMqDSr-jgpBQVm7gUg@mail.gmail.com>
Subject: Re: Rework TTMs busy handling
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
Cc: thomas.hellstrom@linux.intel.com, kherbst@redhat.com,
 michel.daenzer@mailbox.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 4:57=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 12.01.24 um 13:51 schrieb Christian K=C3=B6nig:
> > Hi guys,
>
> just a gentle ping on this.
>
> Zack any more comments for the VMWGFX parts?

The new vmwgfx code looks great, thanks a lot for implementing it! In
fact the entire series looks good to me. For the series:

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
