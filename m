Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B94746BA23
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 12:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B51EEB546;
	Tue,  7 Dec 2021 11:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA430EB546
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 11:35:29 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id v203so39996633ybe.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 03:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oMmXwC4kFSXmnH1UlOlzkBNKjIdD8ECX7WezCoCXLEw=;
 b=HVy4cIA2/5XYu8CyvZf9DwA4DbvMHOKEuKK6Qe+1tQLnj8PoNZDM7BqsMfp2iVcF+N
 84lSEtrAwKSitFHwRr90UDwTfwi6859qbc1wqtz8r4pFXoHe7ti0PR/86gwVNC80JGZc
 zFeyTYHHDoXj3o/kJh8LNw0w7e+L5PZ6MZg+dQC3n9NZcvht/+Yy8U+Qub/jSPtvdAGO
 /fmVxtJWs9ZkwS8/p1+ZQyEfH807WfQVe3lTPie8Up2Au6Cz28CnIGib5Y1gRwuEM5Dg
 cnrn075nIDa+CQg6GNTNcT9pOxMBOv0mZ3f/mG9o1zF9LhtFS+P68KRT6TtVo4+arKKp
 Rvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oMmXwC4kFSXmnH1UlOlzkBNKjIdD8ECX7WezCoCXLEw=;
 b=yy0WzPkTEK7eaXxC4r86zVhZS8FZkxTF9SJ7LbPPKc8fsp3ISvnkHQbnrcM/Wtj0uN
 n3sM/o0DfYWIiFFRL7HRVE08ob2Pxk+mGs0gMgV8ERRr/vldg2uDLHzOwTqHeR+tX7cm
 ZfTA2yFvWVKb6mtlm4rHkCGoRTmCJix9JeZ39H/YdrVI5Qbc4YZQ/jsYp+Y2oD35QJk7
 PzJpL7dyDqFew9sFl4ml5KXp1apeMb2VLXl18vd1nC0N6vuzr0Sju18SLrawvqeGOXvG
 M8U37qyrqVd98kbYrPSc/zkKYGipD4yUDytmdzf8vfykMJpItmuG3QakOLBznrLQ0vmr
 daCQ==
X-Gm-Message-State: AOAM530lMlaUnA11W2p9ojGtJmYqjSdYdVhnP4KZtK88sMZWVQ4wAnzC
 JUB/buta/yw50ghuvdsXyvxV0oj2F6U2zbReXgY7wNOJqV4=
X-Google-Smtp-Source: ABdhPJzkIyNLSeWLRqCKA08bQj8/aS5vnrfVzOi0TGb0rPBN6mNELL1Zb5PCNmkV5DrCIyT2CkFkOydD693kd2jLRtA=
X-Received: by 2002:a25:c788:: with SMTP id
 w130mr48533720ybe.417.1638876928996; 
 Tue, 07 Dec 2021 03:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20211207013235.5985-1-bas@basnieuwenhuizen.nl>
 <05f1e475-3483-b780-d66a-a80577edee39@intel.com>
 <7d2f372f-36f5-1ecc-7ddb-25cf7d444e5d@amd.com>
 <CAP+8YyEzsedvYObj=FVUFTtYo4sdHH354=gBfCAu16qtL1jqLg@mail.gmail.com>
 <9540e080-6b07-c82c-d4d2-d2711a50066d@amd.com>
 <e8b90142-770f-7c23-59c6-303c88eaf6e6@intel.com>
In-Reply-To: <e8b90142-770f-7c23-59c6-303c88eaf6e6@intel.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Tue, 7 Dec 2021 12:35:15 +0100
Message-ID: <CAP+8YyE=77aYN_RCiRwayRw=k2=-SEsjr3SswadGTx4C=pM=Qw@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Deal with signalled fences in transfer.
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
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
Cc: stable@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 7, 2021 at 12:28 PM Lionel Landwerlin
<lionel.g.landwerlin@intel.com> wrote:
>
> On 07/12/2021 13:00, Christian K=C3=B6nig wrote:
> > Am 07.12.21 um 11:40 schrieb Bas Nieuwenhuizen:
> >> On Tue, Dec 7, 2021 at 8:21 AM Christian K=C3=B6nig
> >> <christian.koenig@amd.com> wrote:
> >>> Am 07.12.21 um 08:10 schrieb Lionel Landwerlin:
> >>>> On 07/12/2021 03:32, Bas Nieuwenhuizen wrote:
> >>>>> See the comments in the code. Basically if the seqno is already
> >>>>> signalled then we get a NULL fence. If we then put the NULL fence
> >>>>> in a binary syncobj it counts as unsignalled, making that syncobj
> >>>>> pretty much useless for all expected uses.
> >>>>>
> >>>>> Not 100% sure about the transfer to a timeline syncobj but I
> >>>>> believe it is needed there too, as AFAICT the add_point function
> >>>>> assumes the fence isn't NULL.
> >>>>>
> >>>>> Fixes: ea569910cbab ("drm/syncobj: add transition iotcls between
> >>>>> binary and timeline v2")
> >>>>> Cc: stable@vger.kernel.org
> >>>>> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >>>>> ---
> >>>>>    drivers/gpu/drm/drm_syncobj.c | 26 ++++++++++++++++++++++++++
> >>>>>    1 file changed, 26 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/drm_syncobj.c
> >>>>> b/drivers/gpu/drm/drm_syncobj.c
> >>>>> index fdd2ec87cdd1..eb28a40400d2 100644
> >>>>> --- a/drivers/gpu/drm/drm_syncobj.c
> >>>>> +++ b/drivers/gpu/drm/drm_syncobj.c
> >>>>> @@ -861,6 +861,19 @@ static int
> >>>>> drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
> >>>>>                         &fence);
> >>>>>        if (ret)
> >>>>>            goto err;
> >>>>> +
> >>>>> +    /* If the requested seqno is already signaled
> >>>>> drm_syncobj_find_fence may
> >>>>> +     * return a NULL fence. To make sure the recipient gets
> >>>>> signalled, use
> >>>>> +     * a new fence instead.
> >>>>> +     */
> >>>>> +    if (!fence) {
> >>>>> +        fence =3D dma_fence_allocate_private_stub();
> >>>>> +        if (!fence) {
> >>>>> +            ret =3D -ENOMEM;
> >>>>> +            goto err;
> >>>>> +        }
> >>>>> +    }
> >>>>> +
> >>>>
> >>>> Shouldn't we fix drm_syncobj_find_fence() instead?
> >>> Mhm, now that you mention it. Bas, why do you think that
> >>> dma_fence_chain_find_seqno() may return NULL when the fence is alread=
y
> >>> signaled?
> >>>
> >>> Double checking the code that should never ever happen.
> >> Well, I tested the patch with
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
tlab.freedesktop.org%2Fmesa%2Fmesa%2F-%2Fmerge_requests%2F14097%2Fdiffs%3Fc=
ommit_id%3Dd4c5c840f4e3839f9f5c1747a9034eb2b565f5c0&amp;data=3D04%7C01%7Cch=
ristian.koenig%40amd.com%7Cc1ab29fc100842826f5d08d9b96e102a%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637744705383763833%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp=
;sdata=3DsXkTJWm%2FWm2xwgLGdepVWAOlqj%2FeArnvmMvnJpQ9YEs%3D&amp;reserved=3D=
0
> >>
> >> so I'm pretty sure it happens, and this patch fixes  it, though I may
> >> have misidentified what the code should do.
> >>
> >> My reading is that the dma_fence_chain_for_each in
> >> dma_fence_chain_find_seqno will never visit a signalled fence (unless
> >> the top one is signalled), as dma_fence_chain_walk will never return a
> >> signalled fence (it only returns on NULL or !signalled).
> >
> > Ah, yes that suddenly makes more sense.
> >
> >> Happy to move this to drm_syncobj_find_fence.
> >
> > No, I think that your current patch is fine.
> >
> > That drm_syncobj_find_fence() only returns NULL when it can't find
> > anything !signaled is correct behavior I think.
>
>
> We should probably update the docs then :
>
>
>   * Returns 0 on success or a negative error value on failure. On
> success @fence
>   * contains a reference to the fence, which must be released by calling
>   * dma_fence_put().
>
>
> Looking at some of the kernel drivers, it looks like they don't all
> protect themselves against NULL pointers :
>
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vc4/vc4_ge=
m.c#L1195
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu=
/amdgpu_cs.c#L1020

amdgpu handles it here (amdgpu_sync_fence checks for a NULL fence).
But yeah I think it is a bit treacherous, especially as this only
occurs with timeline semaphores.

>
>
> -Lionel
>
>
> >
> > Going to push your original patch if nobody has any more objections.
> >
> > But somebody might want to take care of the IGT as well.
> >
> > Regards,
> > Christian.
> >
> >>> Regards,
> >>> Christian.
> >>>
> >>>> By returning a stub fence for the timeline case if there isn't one.
> >>>>
> >>>>
> >>>> Because the same NULL fence check appears missing in amdgpu (and
> >>>> probably other drivers).
> >>>>
> >>>>
> >>>> Also we should have tests for this in IGT.
> >>>>
> >>>> AMD contributed some tests when this code was written but they never
> >>>> got reviewed :(
> >>>>
> >>>>
> >>>> -Lionel
> >>>>
> >>>>
> >>>>>        chain =3D kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL=
);
> >>>>>        if (!chain) {
> >>>>>            ret =3D -ENOMEM;
> >>>>> @@ -890,6 +903,19 @@ drm_syncobj_transfer_to_binary(struct drm_file
> >>>>> *file_private,
> >>>>>                         args->src_point, args->flags, &fence);
> >>>>>        if (ret)
> >>>>>            goto err;
> >>>>> +
> >>>>> +    /* If the requested seqno is already signaled
> >>>>> drm_syncobj_find_fence may
> >>>>> +     * return a NULL fence. To make sure the recipient gets
> >>>>> signalled, use
> >>>>> +     * a new fence instead.
> >>>>> +     */
> >>>>> +    if (!fence) {
> >>>>> +        fence =3D dma_fence_allocate_private_stub();
> >>>>> +        if (!fence) {
> >>>>> +            ret =3D -ENOMEM;
> >>>>> +            goto err;
> >>>>> +        }
> >>>>> +    }
> >>>>> +
> >>>>>        drm_syncobj_replace_fence(binary_syncobj, fence);
> >>>>>        dma_fence_put(fence);
> >>>>>    err:
> >>>>
> >
>
