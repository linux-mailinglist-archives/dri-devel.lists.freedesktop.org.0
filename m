Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E21F679AF6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 15:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2421F10E68F;
	Tue, 24 Jan 2023 14:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B7610E68B;
 Tue, 24 Jan 2023 14:02:21 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id cf42so23590073lfb.1;
 Tue, 24 Jan 2023 06:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JpmUW2uzBEebCsOWSMVc3QDBmaoUlSnuYaYqa8KE94c=;
 b=BcZCdu1zd26n9h7SnmTlTpQQ+c0d8k47pgbf/Rva8EEu3dSHqACBADDC6N1omyE7G2
 y+jMtIwZIG/c7eh5pObS6LHdJ2nQVA5jhyIBKQ/b2/Lo+gLjLr8P7mYy60nso3R/bUT2
 p+vcq0P2APmjJsMHzbwJ3UaitEP7Mx9dAOD14wQJgnNHnPZGjk2hkS/ZkAqDaqvhRmle
 mg2yjBvnBJJ+xQPFPQ3eFa0hdqZz1kDi4uP6pLwtKUkd3eVeC9fwpdgeq21vIh4PKRrC
 obzBoL4o6kUUyGPkQjwM1Ey04D+mD1sKDgqP9yYFc8BaOkzmdb9iX41xZAPo2cbcKgyr
 LR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JpmUW2uzBEebCsOWSMVc3QDBmaoUlSnuYaYqa8KE94c=;
 b=b49sx1FEqfJZn3bYfhvpvSk6O078oajVwsKBv5fdWHWlxp1rlSZTJiTQAhrnHmpGA3
 LtKSSwz5K4iLJ1vJ+yAPJsD9cj0CvipQx01z0qin++JKohxVOdIOtPLcWcyFbHCCoA1D
 InK2zVnItTJlQXb8+b48BuQJpUIjJeHc7MYHI7wIHXJNzOm1xCOvtIvapxm3gwCWRhA+
 Ya7pNYAyYcqlNA3glgrHJCSfsNgZ0NcC7IT0MigIfI9f8c3GhqOsp5BXFBjao2PVoiHf
 HACIYuaf5HLVtOZwtWEQgKXuLehVfozk+6F5/CX6/8fcDpP2LKWpRWLRI/Anid0NltSl
 l94g==
X-Gm-Message-State: AFqh2kom99h5KYg4Vf3/sKTt8M2mGNA0gs8vqow0Vwx+Sn9wXo4tfi5v
 4vMs5+hHgzRzewiz0MqhX0YbUR1J8OeBszp3TlescdVD06o=
X-Google-Smtp-Source: AMrXdXsXThp92oYSPt3YksAHwf6ZVJDkeOZnK7/3qxxoICUQDFpwvP7iIXTWZgmMVRz+HSt/Xurcyy0hGKYWUSp2pok=
X-Received: by 2002:a19:8c19:0:b0:4ca:f3c2:2670 with SMTP id
 o25-20020a198c19000000b004caf3c22670mr2359202lfd.166.1674568939874; Tue, 24
 Jan 2023 06:02:19 -0800 (PST)
MIME-Version: 1.0
References: <20230124125726.13323-1-christian.koenig@amd.com>
 <20230124125726.13323-4-christian.koenig@amd.com>
In-Reply-To: <20230124125726.13323-4-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 24 Jan 2023 14:01:52 +0000
Message-ID: <CAM0jSHOVr0qfTfXTeuEh81joaAs2pE8+6Pbu7jY_xGZrTeJuxA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/ttm: prevent moving of pinned BOs
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
> We have checks for this in the individual drivers move callback, but
> it's probably better to generally forbit that on a higher level.

forbid

>
> Also stops exporting ttm_resource_compat() since that's not necessary
> any more after removing the extra checks in vmwgfx.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Idea seems reasonable to me,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
