Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05451FD410
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 20:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6766E12C;
	Wed, 17 Jun 2020 18:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59A86E12C;
 Wed, 17 Jun 2020 18:04:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t18so3335580wru.6;
 Wed, 17 Jun 2020 11:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=98Xd7cYYus42rhhSbM4fP/t0X9bqTqgjQ8tDB3m+G6g=;
 b=TJzBz1gszdzcm/5Ihw8zJ8XsCthrYrxTUnICx7VbSj/N/1lA/v20Oh3flumpHWRMXT
 C3rt6TkyaDzoh90pkNSe9LacZgLsC6shXprLPgoImy6cFbEA9ebk0ETliLBLfSYGeBID
 vDbDDe5yZRdZOP5cXYuIK1uwhH4O2+IGunFaJ7QQozKeOCDOeiwtxKGPjxFFkFYcGt/b
 +zWWY4gJlJLxdkscriDyPSShU6XUc6bjry0caTtP0DiysvtRUk8ctZ79SZIZV7HMyKCI
 SVi4xwnCQzHW+wmywXf4NIkqjBWzv1ERw1iO+3uch2xvxSpPJDpaghlNOPkIJUg84q82
 EW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=98Xd7cYYus42rhhSbM4fP/t0X9bqTqgjQ8tDB3m+G6g=;
 b=LWTohLkQyxOlMiqOx2gMXYOC67db4X6ohBg+LR3zvr7oHY5c8WUFwmPAPaz6IRrcdM
 N3irDIV5sT7Ep0q1LfnIaDqgbJPw5RS6I7LPeN8J7W13q3zpQCYSMICXYjyQNAHzluM4
 GiwnoZMFrEqDwCFaW7vfkIxPihpRA18g98hA/57SrhfNoTR7hhQeWN6g36PxomqMuFF9
 HKDlcN8EzjiPkM9A6oXWPbyHji12f6JEPeR+4/AybbxCXG8NuXyKkujbLH0w9w3r5zmK
 phsGooKHeshiNS1Ko5m6o8oeZIOuIWu8fZUci8o4FBBYoUAUSuI+acSjGOVKjieaEN9a
 K1yA==
X-Gm-Message-State: AOAM531qUiIhnaz+ftZNoIE1iMVzdsJfXQctWHlSVu4rU+O1ZGK6fmhK
 ABGtH+VZf2zY8W4r3w7XF/omIEQSNMHctU7MmyeXKw==
X-Google-Smtp-Source: ABdhPJwykZMp1VTe220cRJgrmIGB+9Nb+k1NVNrNN03qzOF31BUtVGYSdFIsO+C983pZopEb/XOjgFMIYStYGYRRB64=
X-Received: by 2002:adf:fd41:: with SMTP id h1mr490881wrs.374.1592417070411;
 Wed, 17 Jun 2020 11:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200617105130.207116-1-chentao107@huawei.com>
 <20200617105130.207116-2-chentao107@huawei.com>
In-Reply-To: <20200617105130.207116-2-chentao107@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Jun 2020 14:04:19 -0400
Message-ID: <CADnq5_N8QDurdw_kYRbGUSbaaJYLpbJi=uDk4dYkHNVfnJtGFg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/amdgpu/debugfs: fix memory leak when
 amdgpu_virt_enable_access_debugfs failed
To: Chen Tao <chentao107@huawei.com>
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jun 17, 2020 at 9:10 AM Chen Tao <chentao107@huawei.com> wrote:
>
> Fix memory leak in amdgpu_debugfs_gpr_read not freeing data when
> amdgpu_virt_enable_access_debugfs failed.
>
> Fixes: 95a2f917387a2 ("drm/amdgpu: restrict debugfs register accessunder SR-IOV")
> Signed-off-by: Chen Tao <chentao107@huawei.com>
> ---
> v1->v2:
>  - remove the duplication of result and r here and then use "goto err"
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index 7993b9eeff38..7086e1982f9e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -867,7 +867,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
>
>         r = amdgpu_virt_enable_access_debugfs(adev);
>         if (r < 0)
> -               return r;
> +               goto err;
>
>         /* switch to the specific se/sh/cu */
>         mutex_lock(&adev->grbm_idx_mutex);
> --
> 2.22.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
