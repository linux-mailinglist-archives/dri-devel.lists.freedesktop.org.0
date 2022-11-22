Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6C6339A6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 11:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F81D8933E;
	Tue, 22 Nov 2022 10:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216FF10E1CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 10:17:58 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id 7so16751167ybp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 02:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eAU3eLi14ypt2c7b62+uOHX4p+XY4P0OQzHd4hzoaDg=;
 b=I8sHtJ1VMGWbKADlghW+RXorMBoSoGjLES4pamIlTJ84wNBgwc8sYMtmY465DWhztX
 8T6TnLw+/ULQud/T+NeuVkPEFI2IbCg9VAga/SULPq5Nq/ZrU1KWxBjhWgSV7d+TikqR
 vploUK08ERDl4Ku/AOx/5xoK2Qou94qqW0nOH63KbmfBRr5L4kAsvt1aWsX12n58DwZZ
 JNVKU17khlLyeudPe3qFAs5NIKyB4B3OV41S7mlmAziAJmVlcvJGVMv5AWfcgNwIM8Qo
 PcS4IxvqboaMcDSFM1z5mbr1Fcdsb4U2c985YnUeuWjIRWww8+Cs2B5likipDQqp4fag
 lDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eAU3eLi14ypt2c7b62+uOHX4p+XY4P0OQzHd4hzoaDg=;
 b=qTr4hl8jtSVFxMlPfRhGHcLmzAZ8oLQgTZm83DNLbhW4dOY+okFkTjwd4J6iaVd7oq
 7MoutxiOq+n5mCrxk8mcbHHLH/fQvK21U/oSJLuI5QcX6vQF0DMdIizEA6aNzKuFt4Ad
 w9xNQDXGzzEyQ7S3P/E/N7gnvyN6cZSqTiV9GsC6u3xdLnpu0/6jtOjU7IDgAgugV7h2
 3ZwYSIWSXVez79AXB8fFD7HM1tCcPoTYBplAW+Lb8NLdsacApXNlrTcTNJgcZQVsrQ8t
 T5HlV6bJvKr2CIMXYVM/80C3h8dQy1FlU9Z0wO20E+LLs3FaRwaaU/vnFMeAGI7DlBaY
 WhVA==
X-Gm-Message-State: ANoB5pk9GO5umyyLpHW4YTwTsqZTq6xX5Nk2LF23FtirGS9pQMjgqYVy
 7CDQ/5ej+ERrXcuP/GLm43M94BeUGKWuetsGRyMWNg==
X-Google-Smtp-Source: AA0mqf4EfspKpQlvvPQVNU9csb2/qWXEm/ETQb7S4hZogc+BxdwSf49gtnOks6esC5AGsgUhblJGlve+hpHsdaKYmCs=
X-Received: by 2002:a25:cc0a:0:b0:6e6:f85a:da48 with SMTP id
 l10-20020a25cc0a000000b006e6f85ada48mr19451585ybf.369.1669112277056; Tue, 22
 Nov 2022 02:17:57 -0800 (PST)
MIME-Version: 1.0
References: <TYCP286MB2323873BBDF88020781FB986CA3B9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <TYCP286MB2323894F9939C27291FD998CCA0A9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <56393e84-485b-42ba-5fce-d4a0d0017653@amd.com>
In-Reply-To: <56393e84-485b-42ba-5fce-d4a0d0017653@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 22 Nov 2022 15:47:42 +0530
Message-ID: <CAO_48GFU+bWBm5BmzZx1r5z4U+7pME3MVtsCu73FHSNy0KDx0A@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: fix racing conflict of dma_heap_add()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: benjamin.gaignard@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, afd@ti.com, linaro-mm-sig@lists.linaro.org,
 jstultz@google.com, sspatil@android.com, Dawei Li <set_pte_at@outlook.com>,
 labbott@redhat.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dawei Li,

On Mon, 21 Nov 2022 at 23:53, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Hi Dawei,
>
> from the technical description, coding style etc.. it looks clean to me,
> but I'm the completely wrong person to ask for a background check.
>
> I have a high level understanding of how dma-heaps work, but not a
> single line of this code is from me.
>
> Feel free to add my Acked-by, but Laura, John and others do you have any
> opinion?
>
> Regards,
> Christian.
>
> Am 21.11.22 um 16:28 schrieb Dawei Li:
> > On Sat, Nov 05, 2022 at 12:05:36AM +0800, Dawei Li wrote:
> >
> > Hi Christian,
> > May I have your opinion on this change?
> >
> > Thanks,
> > Dawei
> >
> >> Racing conflict could be:
> >> task A                 task B
> >> list_for_each_entry
> >> strcmp(h->name))
> >>                         list_for_each_entry
> >>                         strcmp(h->name)
> >> kzalloc                kzalloc
> >> ......                 .....
> >> device_create          device_create
> >> list_add
> >>                         list_add
> >>
> >> The root cause is that task B has no idea about the fact someone
> >> else(A) has inserted heap with same name when it calls list_add,
> >> so a potential collision occurs.
> >>
> >> Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
> >> Signed-off-by: Dawei Li <set_pte_at@outlook.com>

Looks good to me as well. I will apply it over on drm-misc.

Best,
Sumit.
> >> ---
> >> v1: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fall%2FTYCP286MB2323950197F60FC3473123B7CA349%40TYCP286M=
B2323.JPNP286.PROD.OUTLOOK.COM%2F&amp;data=3D05%7C01%7Cchristian.koenig%40a=
md.com%7C1989f31257fc458a27c508dacbd5078e%7C3dd8961fe4884e608e11a82d994e183=
d%7C0%7C0%7C638046413707443203%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D=
OWPUPrIHGnzwXyQE4WlIthThwSuSK2y3Eq2Wq5zAzbo%3D&amp;reserved=3D0
> >> v1->v2: Narrow down locking scope, check the existence of heap before
> >> insertion, as suggested by Andrew Davis.
> >> v2->v3: Remove double checking.
> >> v3->v4: Minor coding style and patch formatting adjustment.
> >> ---
> >>   drivers/dma-buf/dma-heap.c | 28 +++++++++++++++-------------
> >>   1 file changed, 15 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> >> index 8f5848aa144f..59d158873f4c 100644
> >> --- a/drivers/dma-buf/dma-heap.c
> >> +++ b/drivers/dma-buf/dma-heap.c
> >> @@ -233,18 +233,6 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> >>              return ERR_PTR(-EINVAL);
> >>      }
> >>
> >> -    /* check the name is unique */
> >> -    mutex_lock(&heap_list_lock);
> >> -    list_for_each_entry(h, &heap_list, list) {
> >> -            if (!strcmp(h->name, exp_info->name)) {
> >> -                    mutex_unlock(&heap_list_lock);
> >> -                    pr_err("dma_heap: Already registered heap named %=
s\n",
> >> -                           exp_info->name);
> >> -                    return ERR_PTR(-EINVAL);
> >> -            }
> >> -    }
> >> -    mutex_unlock(&heap_list_lock);
> >> -
> >>      heap =3D kzalloc(sizeof(*heap), GFP_KERNEL);
> >>      if (!heap)
> >>              return ERR_PTR(-ENOMEM);
> >> @@ -283,13 +271,27 @@ struct dma_heap *dma_heap_add(const struct dma_h=
eap_export_info *exp_info)
> >>              err_ret =3D ERR_CAST(dev_ret);
> >>              goto err2;
> >>      }
> >> -    /* Add heap to the list */
> >> +
> >>      mutex_lock(&heap_list_lock);
> >> +    /* check the name is unique */
> >> +    list_for_each_entry(h, &heap_list, list) {
> >> +            if (!strcmp(h->name, exp_info->name)) {
> >> +                    mutex_unlock(&heap_list_lock);
> >> +                    pr_err("dma_heap: Already registered heap named %=
s\n",
> >> +                           exp_info->name);
> >> +                    err_ret =3D ERR_PTR(-EINVAL);
> >> +                    goto err3;
> >> +            }
> >> +    }
> >> +
> >> +    /* Add heap to the list */
> >>      list_add(&heap->list, &heap_list);
> >>      mutex_unlock(&heap_list_lock);
> >>
> >>      return heap;
> >>
> >> +err3:
> >> +    device_destroy(dma_heap_class, heap->heap_devt);
> >>   err2:
> >>      cdev_del(&heap->heap_cdev);
> >>   err1:
> >> --
> >> 2.25.1
> >>
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
