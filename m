Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB52643364C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 14:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1386E14B;
	Tue, 19 Oct 2021 12:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649286E14B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 12:48:01 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id o26so5966847ljj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QXV/MLSuikp+sasS3tTpz+xKpFkE/8CNhKnFhLiBPLU=;
 b=P5iU+hn6ckBar3eHjLBX/Cpluqf2RHLVRBEGQOfUDk1W4qh6uEIscwjzHa9IiUdhEW
 QqtyWKVj6uZ+NFIiQx92W/yzbcIUk2+h6GRg0k1kKOo6je/CV5ekXioCpRKeNvK4lNi4
 fMeQ3QsNMpYBvhg1lsRUXff8tXn87lYtudMC6EEnWm/eJeb0Etj0lNwUHfdm+zNIjkk5
 /+AwbonXvpIIDRf/VWN26TwNkpOPAwBNru6bYJ4/avyGysncH2vdFznNezvhCeLI1VLu
 2kn/ktgGs1LKJEiXjKZC9RoPIUVkf+gNZEvMNn1CtDPcl3PKOdAzCfktMg8rsLtcfslV
 4m7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXV/MLSuikp+sasS3tTpz+xKpFkE/8CNhKnFhLiBPLU=;
 b=Gyw7WBfGmBFSZNr6qeq+hKa/p/fqGn0SOGyOiE4slQYxBYOvqwdrQicv2q1kR5/bIV
 +mRyUmEjfQAfru2nmXArGi/FWnAYQjQsivCiJrHJYiqwmlHXdSfzV7/EfEvKhF2AuNZD
 0pouxSflzLf1+znLZ3I+4M7DXeE8Y9KRAXyTH5YTRmgtkMIbUv53+bo7dT2WzpYsaZ4Q
 UUdPDztbjeMiEy2gIDRuhLu6X5bhnlyQ4uwqHwoL4YVVRJxoDcrUKaDLMQ6ZOrDgUtbR
 Lhu6e+Ge3t+2B+G2z6kMO31EPqvBS21ve+wNtttmobUHDK+Nxs4XmTqclsJYb+4qgu4S
 oKLg==
X-Gm-Message-State: AOAM533miVxE6F4uP5Z1j3BxZfbFjqHxvauf/AAadPdO8XW9KVpHuOGp
 QqeyVoduYvDZues7wWVI4oxhmPben54=
X-Google-Smtp-Source: ABdhPJwQy0HLU7//DAHO8dmvT7wVHMOUQMAM4ky+LbUsWfkeYX2zyOM2BgSMfdz31WtZdrIVqZmJXA==
X-Received: by 2002:a2e:bba2:: with SMTP id y34mr6870446lje.258.1634647679729; 
 Tue, 19 Oct 2021 05:47:59 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id r128sm1650375lff.284.2021.10.19.05.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 05:47:59 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
Date: Tue, 19 Oct 2021 14:47:58 +0200
Message-ID: <8516723.UYAuMdiosd@archbook>
In-Reply-To: <20211019112706.27769-1-christian.koenig@amd.com>
References: <20211019112706.27769-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

On Dienstag, 19. Oktober 2021 13:27:06 CEST Christian K=F6nig wrote:
> Trivial fix since we now need to grab a reference to the fence we have
> added. Previously the dma_resv function where doing that for us.
>=20
> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> Fixes: 9c2ba265352a drm/scheduler: ("use new iterator in drm_sched_job_ad=
d_implicit_dependencies v2")
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 5bc5f775abe1..94fe51b3caa2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -707,6 +707,9 @@ int drm_sched_job_add_implicit_dependencies(struct dr=
m_sched_job *job,
>  		ret =3D drm_sched_job_add_dependency(job, fence);
>  		if (ret)
>  			return ret;
> +
> +		/* Make sure to grab an additional ref on the added fence */
> +		dma_fence_get(fence);
>  	}
>  	return 0;
>  }
>=20

Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

=46ixes it, thank you!



