Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372604C84C9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC8010E437;
	Tue,  1 Mar 2022 07:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5752D10E843;
 Mon, 28 Feb 2022 17:33:28 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id qk11so26359673ejb.2;
 Mon, 28 Feb 2022 09:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=c4YZwBBQho++OJi9JKUYs2TaH6tp8j1xjs9eFNnTtXc=;
 b=GC0TsiAVVJWcZVS7y6WfiVVuddzdFvXLwaqD8MOHUPUkZnINo5dgZeh9W91OpCsxUZ
 FJ/IjgTSgueCGSK+DEliiFeEC0Eymkq27Dxaw2jSO+WMlyaAqHT+u5BWu9rA/IqBF156
 f4TzIMGYp8xsELnG9XxGIEJIxOgEdiknRQm+j4+hMAg+Wnqj6aDUWCubU5DqHfN7GpU4
 BkKw/UXDLw11uA7rux+U7mzHJRphIdhsrhMwObLtSvxQ85ssCbskQUmx6KB6p35hs8td
 Gtj0QwrXoZ+mLuZ+me90bYoDHKD1o0Myyl58n39NGydn8Nskv5RR8DKicI83T4ovQ0UR
 LN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=c4YZwBBQho++OJi9JKUYs2TaH6tp8j1xjs9eFNnTtXc=;
 b=3y9wlm0ljbyS+Q/0yubWobln7Y9qYnQiuV5BDgPNBprt3oGFz6jgEAnou3S+ANbnfx
 GIv4sNHgLz6kTVv0GGxVl075VowupzChoGBlAOP/DI68R2Sewu9V7Vg0n8AfzN9B+JAt
 EicfZdei9ieHuOviehUZTdzghp+vy1MyJISzhipHgrZ8dUUOzFftrVN2PaaFNdiyvHpS
 mY7kklOoPPLDgfg+T+GWMGIvJtllU3Kx/jGY/gW9fC+BEXWhvxvreVL0Kmo2zuoRoLCj
 B6aUeZv2ph30SUCaiji3Q5wewGGuP4qVZytVTOwDnDJnn92zGcfiIiESZQ0mhv8/xqdO
 U7qA==
X-Gm-Message-State: AOAM532vDg/UzSL3VwNIdr2amn18HoQFoklF9VYBSGLuxxqV1Ynd3W+e
 CugrqjfRWF8nbak0FQ2i+RRhn8ZTebpQrOWh08eQYFPTge0=
X-Google-Smtp-Source: ABdhPJyYuGLKMR9wTGeDFqadaZHRCnFQi/61QLVu89LXmFHy20TIOLSpP5zb0c30j56gV5BWVNscHOF85Dgt6lEnILo=
X-Received: by 2002:a17:907:234c:b0:6cd:7ca0:8423 with SMTP id
 we12-20020a170907234c00b006cd7ca08423mr16012446ejb.218.1646069606778; Mon, 28
 Feb 2022 09:33:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:e914:b0:6d0:9dc2:9a62 with HTTP; Mon, 28 Feb 2022
 09:33:26 -0800 (PST)
In-Reply-To: <20220228172651.12642-1-youling257@gmail.com>
References: <20220222024651.36675-1-qiang.yu@amd.com>
 <20220228172651.12642-1-youling257@gmail.com>
From: youling 257 <youling257@gmail.com>
Date: Tue, 1 Mar 2022 01:33:26 +0800
Message-ID: <CAOzgRdaCuBX1E_eeaKsx+toFaBeR6p9RXN8PJZXc5OMY0a76UQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: check vm ready by amdgpu_vm->evicting flag
To: qiang.yu@amd.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 01 Mar 2022 07:18:19 +0000
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
Cc: pmenzel@molgen.mpg.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://gitlab.freedesktop.org/drm/amd/-/issues/1922

2022-03-01 1:26 GMT+08:00, youling257 <youling257@gmail.com>:
> this patch cause suspend to disk resume amdgpu hang,
> [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled
> seq=8330, emitted seq=8332
>
> https://gitlab.freedesktop.org/drm/amd/-/issues/1915
>
