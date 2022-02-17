Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1EA4BA92A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D26D10E36F;
	Thu, 17 Feb 2022 19:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F055510E39C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:04:19 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id c15so840989ljf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=76YOh3whmbn2kqx1NwBv+Kz6cPFzAMtnxeUYyfGd/q8=;
 b=OBKQaFy2RxcRVMpclPmkX40fNiFA9xZ1M06FDambm/VZj3ozimFF9yfzH/IPJFXzHa
 qPjqXTszFuUqE8TXV1lXww3Z667n79ql/oVQlDLn/oPHQ1q/MexRIVFEQUMJkqybd5yQ
 coR1wSQC3lcRhRR4h+/kGuDvBV++mr9JoSg5cN8MQEDDTqmKmqhx2F5cUR8utIGnHpPd
 kmum6m1HYQZH2kpVGKNMISBRkNbXw++ofNJuZD/jMGHUPGgRC7pUf8Ab3eN89o28jljd
 u57aRQ73nEt0EatfpZNV56RywMxL2P8tNMiOUBwvv1qfch/8IBOiO6cKTMbJlUsm+71L
 78sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=76YOh3whmbn2kqx1NwBv+Kz6cPFzAMtnxeUYyfGd/q8=;
 b=eVbiJYOK4i954YoiinZgO5ywzlCq/Wt1NKhJuAVrnLwUkqR7TesEeNzfWJ1FytKxqS
 e4qOD/VsZHFfbK0/s1pqMdm/UFSsWwMm1ckR/DT9nj4kUbCTyIVYbjeJDKEqmGVcOteW
 8uu05MYYYkuGE8j3+D4daiovEnuU9Tys9EUsMK+vVcL3u/IaW+Kch3BjWZmCR4CzYq8s
 2W1LdoAhMsQKNowpBCtaE/vD5Xqe76v34rhXcVTnnkYhRzCr7gSIVJlx9+3IrD9xXmW4
 m50dyp9qQ7C/0sUd2Hm4VFy25KjSQdk7lWFjuX+JRS90KO2jlHJepc/DoCDPmvdBfSNN
 Et2Q==
X-Gm-Message-State: AOAM5330px1HFLR6R+R0krGujZfjxu9nJ4Tidd+seRgk/UhITpK0gAuU
 GRoUmW5o53jJQooZRMKvu97GfBRlqGEl9gQAuXT0NA==
X-Google-Smtp-Source: ABdhPJwh4DkU47MNBi0jwQYcYgp6ASpJqNbuKqJzALTbNGbz8cXoRGuLMjThUw0rnBxNBoUoQBdM0fjAD/6dT0KFPOY=
X-Received: by 2002:a2e:9206:0:b0:244:c5e5:977c with SMTP id
 k6-20020a2e9206000000b00244c5e5977cmr2981200ljg.339.1645124657897; Thu, 17
 Feb 2022 11:04:17 -0800 (PST)
MIME-Version: 1.0
References: <20220217153842.3252424-1-trix@redhat.com>
 <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
 <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com>
In-Reply-To: <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Feb 2022 11:04:05 -0800
Message-ID: <CAKwvOdnYTC7mku1=eVaDLGQFHdoN3u8Afoo582OAQ+ApJmfhQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_ras_block_late_init error handler
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Joshi, Mukul" <mukul.joshi@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 llvm@lists.linux.dev, Dave Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, xinhui pan <Xinhui.Pan@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nathan Chancellor <nathan@kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 8:16 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Applied.  Thanks!
>
> Alex

Alex,
Has AMD been able to set up clang builds, yet?

-- 
Thanks,
~Nick Desaulniers
