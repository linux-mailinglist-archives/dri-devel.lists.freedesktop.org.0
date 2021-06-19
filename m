Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B23AD6ED
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 05:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1E86EB0B;
	Sat, 19 Jun 2021 03:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE97C6EB0B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jun 2021 03:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=TRcSN
 7ER03UoZDCumjMkss4Yzc53jQuAXejLACVSkss=; b=nQvxERUu8wJNHjX7R7Ckj
 hfio2mJu3gHffs3LB0oGnAuo8LkS4YPOrahHw1mjmWvSosMVO4rOjIz2krfN+AwO
 fYYE7+LqMbQniSNusFZWuhkv4Niq/NFLg7wLSe3KoJKBGLc+iwDXKwF2UrAMfGW4
 IPz5HyA1qU6FHtqwYvszyM=
Received: from localhost (unknown [218.17.89.111])
 by smtp13 (Coremail) with SMTP id EcCowABXtDjjX81geZOD8Q--.57668S2;
 Sat, 19 Jun 2021 11:09:24 +0800 (CST)
Date: Sat, 19 Jun 2021 11:09:23 +0800
From: Chunyou Tang <tangchunyou@163.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost:modify 'break' to 'continue' to traverse
 the circulation
Message-ID: <20210619110923.00001c64@163.com>
In-Reply-To: <4d289eed-59f2-161a-40d1-2a434a1955c2@arm.com>
References: <20210617080414.1940-1-tangchunyou@163.com>
 <4d289eed-59f2-161a-40d1-2a434a1955c2@arm.com>
Organization: icube
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.16.6; i586-pc-mingw32msvc)
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowABXtDjjX81geZOD8Q--.57668S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWUXF17AFWDGF48ZF47Arb_yoW5CrWxpF
 WUCr15AFWkX3Wrta929a4xCF4jq34Fqry5uF98AwsxArsxtF1YvF409a4rWr9rAF45KF4U
 twsrWa47W3y0yw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDR6rUUUUU=
X-Originating-IP: [218.17.89.111]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/xtbBRRO1UVPAMiD73gACsU
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 ChunyouTang <tangchunyou@icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steve,
	1,
from
https://lore.kernel.org/lkml/31644881-134a-2d6e-dddf-e658a3a8176b@arm.com/
I can see what your sent,I used a wrong email address,Now it correct.
	2,
> >Unless I'm mistaken the situation where some mappings may be NULL is
> >caused by the loop in panfrost_lookup_bos() not completing
> >successfully
> >(panfrost_gem_mapping_get() returning NULL). In this case if
> >mappings[i]
> >is NULL then all following mappings must also be NULL. So 'break'
> >allows
> >us to skip the later ones. Admittedly the performance here isn't
> >important so I'm not sure it's worth the optimisation, but AIUI this
> >code isn't actually wrong.

from panfrost_lookup_bos(),you can see:
        for (i = 0; i < job->bo_count; i++) {
                struct panfrost_gem_mapping *mapping;

                bo = to_panfrost_bo(job->bos[i]);
                ICUBE_DEBUG_PRINTK("panfrost bo gem handle=0x%x
                is_dumb=%d\n", bo->gem_handle, bo->is_dumb);
                if (!bo->is_dumb) {
                       mapping = panfrost_gem_mapping_get(bo, priv);
                       if (!mapping) {
                                ret = -EINVAL;
                                break;
                       }

                        atomic_inc(&bo->gpu_usecount);
                        job->mappings[i] = mapping;
                } else {
                        atomic_inc(&bo->gpu_usecount);
                        job->mappings[i] = NULL;
                }
        }
if bo->is_dumb is TRUE,the job->mappings[i] will set to NULL,and the
while will be continue,so if job->mappings[i] is NULL,the following
can not be NULL.

	3,
I've had this problem in our project,the value of is_dumb like these:
0
0
0
1
0
0
0
so,when job->mappings[i] is NULL,we can not break the while in 
panfrost_job_cleanup().

thanks
Chunyou

ÓÚ Fri, 18 Jun 2021 13:43:25 +0100
Steven Price <steven.price@arm.com> Ð´µÀ:

> On 17/06/2021 09:04, ChunyouTang wrote:
> > From: ChunyouTang <tangchunyou@icubecorp.cn>
> > 
> > The 'break' can cause 'Memory manager not clean during takedown'
> > 
> > It cannot use break to finish the circulation,it should use
> > 
> > continue to traverse the circulation.it should put every mapping
> > 
> > which is not NULL.
> 
> You don't appear to have answered my question about whether you've
> actually seen this happen (and ideally what circumstances). In my
> previous email[1] I explained why I don't think this is needed. You
> need to convince me that I've overlooked something.
> 
> Thanks,
> 
> Steve
> 
> [1]
> https://lore.kernel.org/r/31644881-134a-2d6e-dddf-e658a3a8176b%40arm.com
> 
> > Signed-off-by: ChunyouTang <tangchunyou@icubecorp.cn>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> > b/drivers/gpu/drm/panfrost/panfrost_job.c index
> > 6003cfeb1322..52bccc1d2d42 100644 ---
> > a/drivers/gpu/drm/panfrost/panfrost_job.c +++
> > b/drivers/gpu/drm/panfrost/panfrost_job.c @@ -281,7 +281,7 @@
> > static void panfrost_job_cleanup(struct kref *ref) if
> > (job->mappings) { for (i = 0; i < job->bo_count; i++) {
> >  			if (!job->mappings[i])
> > -				break;
> > +				continue;
> >  
> >  			atomic_dec(&job->mappings[i]->obj->gpu_usecount);
> >  			panfrost_gem_mapping_put(job->mappings[i]);
> > 


