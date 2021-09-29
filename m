Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC6041C5EC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 15:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3247B6EA6B;
	Wed, 29 Sep 2021 13:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89756EA6B;
 Wed, 29 Sep 2021 13:46:08 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id r1so2269202qta.12;
 Wed, 29 Sep 2021 06:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uXBBSmNytQERdJDVGYF6Wc2AU2qPOQl0zWRjLsywPr8=;
 b=jyq98TDI4/s6C5auFb0crdIDkkWmEpE9MqE3oURk2yVSvRQFoFigJXihdOPf7z+crf
 7hKpuoom48sXRcMQaYTxAsom7+8V/ZLYTWaCbszSrjpjdaN9ReemYdOVxAQ140jCF4eS
 motiND06qS+Ib3PKGCcPhMgM91/Bj7ImhMBG11y1OfoB9vP1+kKfH7Fh2TLRgdT2x0X8
 /mLkmzkE5wz0ta6a5Em4tLPGqjzdO5odpIIvvPmSDUnz95KXNYRxQF67yJ1svlFDYJvx
 g3vqlEer7TYtCy6t4/2VPoZv8YP7qcCox3FblC6bQMjWjeyNm+xLzVl60UHqpOyDTpDA
 dhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uXBBSmNytQERdJDVGYF6Wc2AU2qPOQl0zWRjLsywPr8=;
 b=Mr9Crha5DsYIEjUsFo/VhSS6CAiNXRb8K1BF2NcvueRADSzF64zk55efqqu0wFOdGG
 xEzHvVvZLxJrNqrDATclvQ4+1ehl+RxzfeLoUMkvU0Il1NtO1q9drWu0Tjm694gx6r31
 EB+P/wHRAjQIvF8OfJMKF00laPDtnssIpkBmz/QAxqG5wupXiONqyrA3WkXnw9rVK8Ew
 mDmOVrw1ajBRQ9s5Y9FbL1DZey7LVLZly+w5eVL8dQ1/n5IuCaF4rTomtAkkRPoo5cKL
 z/p2BeAxdQp6qGaXwLjlfvgs9/fYeZP5rMC2aF4Ln0iPyz8h3WaopzzhigNC2Camn4vr
 FCPw==
X-Gm-Message-State: AOAM532w1ogWVD2yoDhBvHtftD7CJu3HNkK25l51O5raxb7RV3ypEyw0
 b3nci/BM2ntTzA/IQmVTI5es1Vfwm1adQKJkUdg=
X-Google-Smtp-Source: ABdhPJxEbHCyhTSmJ8HOjeapZrkB9XaxIJCuhqMOdkrUQblacCE+aBxZWW9WrmISXt5Dm8ABPZBK/0RNOTa93ENpUGM=
X-Received: by 2002:a05:622a:178b:: with SMTP id
 s11mr12670732qtk.13.1632923167917; 
 Wed, 29 Sep 2021 06:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210927114114.152310-1-matthew.auld@intel.com>
 <a0ff7b4a-2433-7ff4-a998-c2c286d3c497@amd.com>
 <CAM0jSHMrYPM9Wb2WCw5ktLjhN=+0H-qD_1cQbrnPhQRg0_U2=Q@mail.gmail.com>
 <c51bb1b9-5243-d14e-c5b1-df698d1172af@amd.com>
In-Reply-To: <c51bb1b9-5243-d14e-c5b1-df698d1172af@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 29 Sep 2021 14:45:39 +0100
Message-ID: <CAM0jSHN-SA+DCaF2EsN-T-CAMN_wKPne0kLOGj_BKPff65YNOQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 01/13] drm/ttm: stop calling tt_swapin in
 vm_access
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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

On Wed, 29 Sept 2021 at 13:01, Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 27.09.21 um 18:14 schrieb Matthew Auld:
> > On Mon, 27 Sept 2021 at 12:47, Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >> Any objections that I just push patches 1-7 to drm-misc-next?
> > Please go ahead Christian. Thanks.
>
> Well I've pushed patches #1-#4 because #5 won't apply on current
> drm-misc-next (some conflict in i915).
>
> Could you rebase this an/or request backmerging of drm-next into
> drm-misc-next when potential i915 prerequisites have landed there.

Version which should apply to drm-misc-next:
https://patchwork.freedesktop.org/series/95219/

>
> Thanks,
> Christian.
>
> >
> >> Christian.
> >>
> >> Am 27.09.21 um 13:41 schrieb Matthew Auld:
> >>> In commit:
> >>>
> >>> commit 09ac4fcb3f255e9225967c75f5893325c116cdbe
> >>> Author: Felix Kuehling <Felix.Kuehling@amd.com>
> >>> Date:   Thu Jul 13 17:01:16 2017 -0400
> >>>
> >>>       drm/ttm: Implement vm_operations_struct.access v2
> >>>
> >>> we added the vm_access hook, where we also directly call tt_swapin fo=
r
> >>> some reason. If something is swapped-out then the ttm_tt must also be
> >>> unpopulated, and since access_kmap should also call tt_populate, if
> >>> needed, then swapping-in will already be handled there.
> >>>
> >>> If anything, calling tt_swapin directly here would likely always fail
> >>> since the tt->pages won't yet be populated, or worse since the tt->pa=
ges
> >>> array is never actually cleared in unpopulate this might lead to a na=
sty
> >>> uaf.
> >>>
> >>> Fixes: 09ac4fcb3f25 ("drm/ttm: Implement vm_operations_struct.access =
v2")
> >>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/ttm/ttm_bo_vm.c | 5 -----
> >>>    1 file changed, 5 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/tt=
m_bo_vm.c
> >>> index f56be5bc0861..5b9b7fd01a69 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> >>> @@ -519,11 +519,6 @@ int ttm_bo_vm_access(struct vm_area_struct *vma,=
 unsigned long addr,
> >>>
> >>>        switch (bo->resource->mem_type) {
> >>>        case TTM_PL_SYSTEM:
> >>> -             if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPE=
D)) {
> >>> -                     ret =3D ttm_tt_swapin(bo->ttm);
> >>> -                     if (unlikely(ret !=3D 0))
> >>> -                             return ret;
> >>> -             }
> >>>                fallthrough;
> >>>        case TTM_PL_TT:
> >>>                ret =3D ttm_bo_vm_access_kmap(bo, offset, buf, len, wr=
ite);
>
