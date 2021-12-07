Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D2F46B94F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 11:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9B9EAC1B;
	Tue,  7 Dec 2021 10:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9735EAC1B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 10:41:01 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id e136so39635379ybc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 02:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pScc3ssxK44brT1donktLtNeL6CZhUwDaYqiqX+57wk=;
 b=ApSIMjmhvNSIhcGGfgUEURyTWBqUsME0oblKLRdRDSDrltfw1jkPWBOBV3UwcORsOq
 S6t+wycP31Y8fRze20C1b9rrvlhKhzbvwbMGw8nIqRWsiQemNbvownbqBs42jmfZyd8/
 jAxt5Y4jgaNCeDtftMvkB6X2Yb+cxSV8HsILbLGB8AU9wbewHNbQMruev8SLAlChZjtr
 NN53s0LfeWG1YVh5nYih63EJgEagBOWqWTHfhKO5lj6veJknXCNzGIbpA/fTegRQmqKf
 HvjRjl4x8A9f1rdOviraWAW3RQiz6PFOU/rGQTiGicPccPyA6lvzfuqEKUC0Nv+emYLJ
 q/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pScc3ssxK44brT1donktLtNeL6CZhUwDaYqiqX+57wk=;
 b=psS1j3AX8myqFHUKboy0xpZu2UdOlah1EUGhPJsqkTEDudodElWqx8xONozr5+IQ3J
 /l9i6BjY3sAu6qblU8TT5D1ZqbCjxEEYBOcpe5A9dMXLr6EpNnpeEDg95myGTJ7YpIMH
 grNoi6PauiWrRXfNqD88dFJTaF2YBfkYhvBGbHBeYNH8ceFjZsf1d3VGcDeZZTXGP4RM
 npCm5GRq+oE1JRNODLB6pKXjTjKzlidoyevYy6uHzGdNtUoguQw481tdw2ChCHQQK+N9
 Plv+Bm7Wiw9KxAakOKgqMRk+OgYuSACTB7CXhaO0W/ByHkX6OARppP5ogdJC3nQQj7n5
 nRLA==
X-Gm-Message-State: AOAM530WHyBoOkeVIXxjfF+ok4tcWMhaY1/KbTSM1znvEOKux4hqEm2q
 xbsthyLmBfzWOKp9A4Y/lABVV7+2BrQw+pE9p/ys1Q==
X-Google-Smtp-Source: ABdhPJxdMWUDaXFu6u63ZbI25qXwwZjYTXpxeeKTv86I4DZdYW0IiMwTbAWjVZY66O7U9jNd3NVLfZs0MOd4ob9LoBs=
X-Received: by 2002:a25:ac21:: with SMTP id w33mr50967307ybi.616.1638873660994; 
 Tue, 07 Dec 2021 02:41:00 -0800 (PST)
MIME-Version: 1.0
References: <20211207013235.5985-1-bas@basnieuwenhuizen.nl>
 <05f1e475-3483-b780-d66a-a80577edee39@intel.com>
 <7d2f372f-36f5-1ecc-7ddb-25cf7d444e5d@amd.com>
In-Reply-To: <7d2f372f-36f5-1ecc-7ddb-25cf7d444e5d@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Tue, 7 Dec 2021 11:40:47 +0100
Message-ID: <CAP+8YyEzsedvYObj=FVUFTtYo4sdHH354=gBfCAu16qtL1jqLg@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Deal with signalled fences in transfer.
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
Cc: stable@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 7, 2021 at 8:21 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 07.12.21 um 08:10 schrieb Lionel Landwerlin:
> > On 07/12/2021 03:32, Bas Nieuwenhuizen wrote:
> >> See the comments in the code. Basically if the seqno is already
> >> signalled then we get a NULL fence. If we then put the NULL fence
> >> in a binary syncobj it counts as unsignalled, making that syncobj
> >> pretty much useless for all expected uses.
> >>
> >> Not 100% sure about the transfer to a timeline syncobj but I
> >> believe it is needed there too, as AFAICT the add_point function
> >> assumes the fence isn't NULL.
> >>
> >> Fixes: ea569910cbab ("drm/syncobj: add transition iotcls between
> >> binary and timeline v2")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >> ---
> >>   drivers/gpu/drm/drm_syncobj.c | 26 ++++++++++++++++++++++++++
> >>   1 file changed, 26 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_syncobj.c
> >> b/drivers/gpu/drm/drm_syncobj.c
> >> index fdd2ec87cdd1..eb28a40400d2 100644
> >> --- a/drivers/gpu/drm/drm_syncobj.c
> >> +++ b/drivers/gpu/drm/drm_syncobj.c
> >> @@ -861,6 +861,19 @@ static int
> >> drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
> >>                        &fence);
> >>       if (ret)
> >>           goto err;
> >> +
> >> +    /* If the requested seqno is already signaled
> >> drm_syncobj_find_fence may
> >> +     * return a NULL fence. To make sure the recipient gets
> >> signalled, use
> >> +     * a new fence instead.
> >> +     */
> >> +    if (!fence) {
> >> +        fence =3D dma_fence_allocate_private_stub();
> >> +        if (!fence) {
> >> +            ret =3D -ENOMEM;
> >> +            goto err;
> >> +        }
> >> +    }
> >> +
> >
> >
> > Shouldn't we fix drm_syncobj_find_fence() instead?
>
> Mhm, now that you mention it. Bas, why do you think that
> dma_fence_chain_find_seqno() may return NULL when the fence is already
> signaled?
>
> Double checking the code that should never ever happen.

Well, I tested the patch with
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14097/diffs?commi=
t_id=3Dd4c5c840f4e3839f9f5c1747a9034eb2b565f5c0
so I'm pretty sure it happens, and this patch fixes  it, though I may
have misidentified what the code should do.

My reading is that the dma_fence_chain_for_each in
dma_fence_chain_find_seqno will never visit a signalled fence (unless
the top one is signalled), as dma_fence_chain_walk will never return a
signalled fence (it only returns on NULL or !signalled).

Happy to move this to drm_syncobj_find_fence.
>
> Regards,
> Christian.
>
> >
> > By returning a stub fence for the timeline case if there isn't one.
> >
> >
> > Because the same NULL fence check appears missing in amdgpu (and
> > probably other drivers).
> >
> >
> > Also we should have tests for this in IGT.
> >
> > AMD contributed some tests when this code was written but they never
> > got reviewed :(
> >
> >
> > -Lionel
> >
> >
> >>       chain =3D kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
> >>       if (!chain) {
> >>           ret =3D -ENOMEM;
> >> @@ -890,6 +903,19 @@ drm_syncobj_transfer_to_binary(struct drm_file
> >> *file_private,
> >>                        args->src_point, args->flags, &fence);
> >>       if (ret)
> >>           goto err;
> >> +
> >> +    /* If the requested seqno is already signaled
> >> drm_syncobj_find_fence may
> >> +     * return a NULL fence. To make sure the recipient gets
> >> signalled, use
> >> +     * a new fence instead.
> >> +     */
> >> +    if (!fence) {
> >> +        fence =3D dma_fence_allocate_private_stub();
> >> +        if (!fence) {
> >> +            ret =3D -ENOMEM;
> >> +            goto err;
> >> +        }
> >> +    }
> >> +
> >>       drm_syncobj_replace_fence(binary_syncobj, fence);
> >>       dma_fence_put(fence);
> >>   err:
> >
> >
>
