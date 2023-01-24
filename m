Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE0679A90
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 14:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CFD10E689;
	Tue, 24 Jan 2023 13:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A482810E675;
 Tue, 24 Jan 2023 13:51:23 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j17so23545840lfr.3;
 Tue, 24 Jan 2023 05:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SPGHNqfixBltMvZAN4InrLRY2Kd3P0pviwxzaKlvJp8=;
 b=XXIoV9CP66hfcWaCvDMwybrn6HfL7VTzu4/4vgJQwIGE1BscX9kvC+6lDEFg+iKkKJ
 TkEyGI4E2q3WXAZTdBtGkqqxfb6mF9StvWAuswzDWXAsbEjZ92cJIq0jOzhZtjmJUuNP
 9yVuhCi8v8yXHmQ1UIigBZuMFPGS1DwKS/z/DFMxAuW5vml32TRbHKW+VfHZzfquIe+g
 PFjber+doiQYpmc3tTXX3iBVtLOqT/o7pSFlgCUUvQSZiRIVP7XMNfaBHfTgEtlP+QEH
 dUzOW/gDIr2NZ5ImJXucFyEASE5BFjOuRpEdf4iRxOdP0CI5PuWHKeEQ20OlJOfnseQK
 pXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPGHNqfixBltMvZAN4InrLRY2Kd3P0pviwxzaKlvJp8=;
 b=wT/hNcQDfqZbBZ2efFUuYB91zeAwazE4ykUHlGeUcmIUewiQ37BzOHu28mwXvccCjP
 ZdvYOO9JLZG/m5CuohezgddtPc9CRrvLWWHyZsp0z6rz2PZfkJDRgKhwTVdBjTUCpT0b
 XAbHQIRwkFSnXiCeqLKt7gsZKH8X11UxYUf3707J9v96z3wDVS0E5eKrAkZdH4+E38rF
 EoLoKttWuiXqTlFwimyiBYQ0x32EoiMZiPhh0+9IVkxdpirVkOHUuBMObAxzVgQ63FMe
 n0OOBLpvqpzysCiUjQ7fXwwxHep7IJ8gwrwHSTt5Q9rn+DSs/AtogcYNWxBmSG2yq0tL
 nmOg==
X-Gm-Message-State: AFqh2kpM6Ab7AXUJvqAAupnn/NnsI1tZp4KaZDwOOB7fRBkbxfwNMfud
 wJdYEuUCSLnoWiwcGQhAMwkt2QNrYks2g5HjWkE=
X-Google-Smtp-Source: AMrXdXuinxcT0STEP2SU8kyZT4GXLBAc+uneH+vNt/I0nEdBnA1PJ7zha0kVcjgt5Z3FgLZqtSC6cUP1GUmQJXKJG7Y=
X-Received: by 2002:a05:6512:1303:b0:4d2:8b26:e27 with SMTP id
 x3-20020a056512130300b004d28b260e27mr1373667lfu.185.1674568281826; Tue, 24
 Jan 2023 05:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20230124125726.13323-1-christian.koenig@amd.com>
 <20230124125726.13323-3-christian.koenig@amd.com>
In-Reply-To: <20230124125726.13323-3-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 24 Jan 2023 13:50:54 +0000
Message-ID: <CAM0jSHOns_E0-QtUVBfOqsF8BRpdqCcMwcgDuiFT9L-ajmJEZA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/ttm: stop allocating a dummy resource for
 pipelined gutting
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Jan 2023 at 12:57, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> That should not be necessary any more when drivers should at least be
> able to handle a move without a resource.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
