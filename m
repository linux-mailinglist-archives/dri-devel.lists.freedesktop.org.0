Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8737862EBFD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 03:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490FE10E6E3;
	Fri, 18 Nov 2022 02:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B472710E6E3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 02:37:08 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id v123so4154487ybv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 18:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HRVnwEPfcbOzbMRSuMs2NCAF/YKRv3NoY+l+faUblg=;
 b=kHLH0YZhlWdDrEgGrLPz9ScoylswZMbdh04T67tjO/2HzqKAq+V2G0l4muslRCxzg+
 XCKNpW1eZlF8HrwLu0bwE9DIUnlOT8Y7y+9S6dUqcOq+5IuVnzRW0TgQ8r0C2kjXKBvB
 hoBxUXD8HY/BkmaFMWt/KDIaodNUFrDjijNn/1w9HeHfuppM7oRouEjnm5IvqR5SbL1b
 160DXvkdT4vLDOYaYmu0nMyhqKEVPiunDPabVeh8oCYdThAFJJkdeArsC3KZjCxR79rU
 JvuS8yxkEhE104xvnTdDcou4o20pmw0RUape/+jG6GjP4MLtepO8NiyW0VX25VU9GG1L
 4WLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4HRVnwEPfcbOzbMRSuMs2NCAF/YKRv3NoY+l+faUblg=;
 b=U7bOsn33InGniqJ3MWU3D5ynBr95HcXuYglm+8sjO1TQvcebQS0R92MaJMddRwNsVR
 AKmU2PpmYCLo+sOASivKmyQ7z1akbDkwYM7GhVLUD6+qQtB9Z48d6wD98/5pjPoJYMkE
 GpgfvVhKEOAtDEK5KNj1XHzbhB9+X9+qfuH0S/dKruVeo5itNdiXSQ22IXelVCTXCNix
 BnU/R313cxANBg8hRjy+aG1Rjknf9aDmvaxTWHAlxsNrcYbZhupEtht0SNbWs0lBT5yi
 F7RG3Tw7TXPk1/PwX9eiPxIFsoRke/HX1lTtVB3v2j7qilZ7MIwkYgvQOHQITN7xqTXP
 FP2w==
X-Gm-Message-State: ANoB5plMSHqoFtOPkr+JL2GOjJHZKAXEy0rkrrea9FR85nfL3pGAhtJG
 Gapik8f8n38XxH8jRRrqatyEOXiOMrFigQeWRdBDOw==
X-Google-Smtp-Source: AA0mqf6tvEM8h8k0SC7Z2uTEXO+9G7gHq4QnR8+nNOQhmac2n6iyv5bfxPTv+iudbxbyX0LXFzhxaaeEGkxRLsrl2TQ=
X-Received: by 2002:a5b:b06:0:b0:6dd:6382:90c with SMTP id
 z6-20020a5b0b06000000b006dd6382090cmr4828354ybp.636.1668739027644; 
 Thu, 17 Nov 2022 18:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
 <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
In-Reply-To: <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 17 Nov 2022 18:36:56 -0800
Message-ID: <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
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
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 Charan Teja Kalla <quic_charante@quicinc.com>,
 Gaosheng Cui <cuigaosheng1@huawei.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 2:16 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.11.22 um 08:48 schrieb Charan Teja Kalla:
> > Sometime back Dan also reported the same issue[1] where I do mentioned
> > that fput()-->dma_buf_file_release() will remove it from the list.
> >
> > But it seems that I failed to notice fput() here calls the
> > dma_buf_file_release() asynchronously i.e. dmabuf that is accessed in
> > the close path is already freed. Am I wrong here?
> >
> > Should we have the __fput_sync(file) here instead of just fput(file)
> > which can solve this problem?
> >
> > [1]https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lore.kernel.org%2Fall%2F20220516084704.GG29930%40kadam%2F&amp;data=3D05%7C0=
1%7Cchristian.koenig%40amd.com%7C115292dd7a874278b3ed08dac8701320%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C638042680960627756%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00%7C%7C%7C&amp;sdata=3DNYNIAJjt%2FSUXoc3wCz2vPvo%2Be%2FIVcABEA2JYZ8%2F2q04=
%3D&amp;reserved=3D0
>
> That doesn't look like the right solution to me either.
>
> Essentially we have two separate tear down methods for the dma_buf
> object here:
>
> 1. It's not completely initialized and we can call kfree()+module_put()
> to clean up.
>      There is actually a dma_resv_fini() here. That should probably be
> fixed.
>
> 2. The dma_buf object is fully initialized, but creating the sysfs stats
> file failed.
>      In this case we should *not* clean it up like we currently do, but
> rather call fput().
>
> So the right thing to do is a) fix the missing dma_resv_fini() call and
> b) drop the setting d_fsdata=3DNULL hack and properly return after the fp=
ut().
>
This looks right to me if by properly return you mean return
ERR_PTR(ret); at the end of err_sysfs after the fput. (letting
dma_buf_file_release and dma_buf_release do the full cleanup)

If we still want to avoid calling dmabuf->ops->release(dmabuf) in
dma_buf_release like the comment says I guess we could use sysfs_entry
and ERR_PTR to flag that, otherwise it looks like we'd need a bit
somewhere.

 >
> Regards,
> Christian.
>
> >
> > Thanks,
> > Charan
> > On 11/17/2022 11:51 AM, Gaosheng Cui wrote:
> >> Smatch report warning as follows:
> >>
> >> drivers/dma-buf/dma-buf.c:681 dma_buf_export() warn:
> >>    '&dmabuf->list_node' not removed from list
> >>
> >> If dma_buf_stats_setup() fails in dma_buf_export(), goto err_sysfs
> >> and dmabuf will be freed, but dmabuf->list_node will not be removed
> >> from db_list.head, then list traversal may cause UAF.
> >>
> >> Fix by removeing it from db_list.head before free().
> >>
> >> Fixes: ef3a6b70507a ("dma-buf: call dma_buf_stats_setup after dmabuf i=
s in valid list")
> >> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> >> ---
> >>   drivers/dma-buf/dma-buf.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >> index b809513b03fe..6848f50226d5 100644
> >> --- a/drivers/dma-buf/dma-buf.c
> >> +++ b/drivers/dma-buf/dma-buf.c
> >> @@ -675,6 +675,9 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >>      return dmabuf;
> >>
> >>   err_sysfs:
> >> +    mutex_lock(&db_list.lock);
> >> +    list_del(&dmabuf->list_node);
> >> +    mutex_unlock(&db_list.lock);
> >>      /*
> >>       * Set file->f_path.dentry->d_fsdata to NULL so that when
> >>       * dma_buf_release() gets invoked by dentry_ops, it exits
>
