Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C44BC5F8D31
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 20:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0912C10E059;
	Sun,  9 Oct 2022 18:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7664110E059
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 18:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665340519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ViviYhcQjwhb4JS/uZekyKndNy1/nquIn4ZvXjeihJo=;
 b=iicJjjDOedBRfVK0OFsjfoA/IWCdWv0qMIOyr1Ysd+MmG6gwM1mJzpQdQNcrtpojAjGXYU
 Ub8FEeFEq5G5vgKMqhkb52Mvfq9LAxbLaWRSwGlKIaAVpmNwBON908N/+Uge4aA6BFi6MN
 solmlpGfksNjTpkQgPqmw34XsqO9kl8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-m24UfuBSNEakZikLHZwu7g-1; Sun, 09 Oct 2022 14:35:17 -0400
X-MC-Unique: m24UfuBSNEakZikLHZwu7g-1
Received: by mail-pf1-f197.google.com with SMTP id
 cv12-20020a056a0044cc00b00562f6351e09so1378046pfb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Oct 2022 11:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ViviYhcQjwhb4JS/uZekyKndNy1/nquIn4ZvXjeihJo=;
 b=a32Ki1hkp1HBWauAO3Jw3KoNfguQS+V58GrgKMk5RSGPCDCucDqx7fXMdquFcA+8n7
 1alayaItjkiWsTXQ+JOylS4tZptKR6Ex/eVOiEwG3+myI7ae/OBYTRthPxKUl9bpefSE
 yFHZpyTzjSw3VIdBIPGhxa/c4DYIa1ZFX0I5Rruqzv0y3qa6WFm9PQCWFpRbxvRPQiNi
 RXE18WRc9xTd8Onw1D6Uuee9w2UmG4pVyD1JN1R3dt7w+dea4J1qar8vEg8ph8WdDUhk
 qPoLQ1HQlc0hagNcdM+6KycNHlnxqWxHuPHjeymtPCB3qg5jSOxFxSbpj8OaSqbYrj0t
 0pKw==
X-Gm-Message-State: ACrzQf1iufj0N2zkCRFC871Hv80i54hdm8waE2ZGMMmE+TrAvmes6xPN
 A1uCcITcPxlPgH+kmcs3z8gqz9Q3wj+UR5ld+V+zmQ7FcGvPmyQVlyt7gf+A3ptdkQLS26WiRWk
 gCehXgMCIKtq3Rjg7A+QK1Edj2WkK
X-Received: by 2002:a05:6a00:1a93:b0:563:120c:f612 with SMTP id
 e19-20020a056a001a9300b00563120cf612mr6862509pfv.10.1665340516804; 
 Sun, 09 Oct 2022 11:35:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7TtyRrwRTopk0WYTuBlA7eeTKQVEtipoGg5mh1x6mN6EkXrprxw7cZUMsHQhP7R8PH0c1I9g==
X-Received: by 2002:a05:6a00:1a93:b0:563:120c:f612 with SMTP id
 e19-20020a056a001a9300b00563120cf612mr6862499pfv.10.1665340516571; 
 Sun, 09 Oct 2022 11:35:16 -0700 (PDT)
Received: from localhost ([240d:1a:c0d:9f00:4f2f:926a:23dd:8588])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170903124d00b0017f80305239sm5047547plh.136.2022.10.09.11.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 11:35:16 -0700 (PDT)
Date: Mon, 10 Oct 2022 03:35:03 +0900 (JST)
Message-Id: <20221010.033503.2099269269123366991.syoshida@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH] drm/gem: Avoid use-after-free on drm_gem_mmap_obj()
 failure
From: Shigeru Yoshida <syoshida@redhat.com>
In-Reply-To: <20220920072408.387105-1-syoshida@redhat.com>
References: <20220920072408.387105-1-syoshida@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 28.1
Mime-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Cc: syoshida@redhat.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot+c512687fff9d22327436@syzkaller.appspotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ping?

On Tue, 20 Sep 2022 16:24:08 +0900, Shigeru Yoshida wrote:
> syzbot reported use-after-free for drm_gem_object [1].  This causes
> the call trace like below:
> 
> [   75.327400][ T5723] Call Trace:
> [   75.327611][ T5723]  <TASK>
> [   75.327803][ T5723]  drm_gem_object_handle_put_unlocked+0x11e/0x1a0
> [   75.328209][ T5723]  drm_gem_object_release_handle+0x5d/0x70
> [   75.328568][ T5723]  ? drm_gem_object_handle_put_unlocked+0x1a0/0x1a0
> [   75.328965][ T5723]  idr_for_each+0x99/0x160
> [   75.329253][ T5723]  drm_gem_release+0x20/0x30
> [   75.329544][ T5723]  drm_file_free.part.0+0x269/0x310
> [   75.329867][ T5723]  drm_close_helper.isra.0+0x88/0xa0
> [   75.330305][ T5723]  drm_release+0x8e/0x1a0
> [   75.330674][ T5723]  ? drm_release_noglobal+0xc0/0xc0
> [   75.331138][ T5723]  __fput+0x10e/0x440
> [   75.331503][ T5723]  task_work_run+0x73/0xd0
> [   75.331895][ T5723]  do_exit+0x535/0x1200
> [   75.332280][ T5723]  ? ktime_get_coarse_real_ts64+0x13b/0x170
> [   75.332810][ T5723]  do_group_exit+0x51/0x100
> [   75.333215][ T5723]  __x64_sys_exit_group+0x18/0x20
> [   75.333654][ T5723]  do_syscall_64+0x37/0x90
> [   75.334058][ T5723]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> If drm_gem_mmap_obj() failed, it drops the reference count by calling
> drm_gem_object_put().  However, drm_gem_mmap() drops the reference
> count after calling drm_gem_mmap_obj() even if it failed, so it breaks
> the balance of the reference count.
> 
> This patch fixes this issue by calling drm_gem_object_put() only if
> drm_gem_mmap_obj() succeeds, and returns immediately if
> drm_gem_mmap_obj() failed without calling drm_gem_object_put().
> 
> Link: https://syzkaller.appspot.com/bug?id=c42a72b0b3bcedd95e5f132a4ccd7cd550334160 [1]
> Reported-by: syzbot+c512687fff9d22327436@syzkaller.appspotmail.com
> Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ad068865ba20..f345d38df50a 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1115,10 +1115,12 @@ int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>  
>  	ret = drm_gem_mmap_obj(obj, drm_vma_node_size(node) << PAGE_SHIFT,
>  			       vma);
> +	if (ret)
> +		return ret;
>  
>  	drm_gem_object_put(obj);
>  
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_gem_mmap);
>  
> -- 
> 2.37.3
> 

