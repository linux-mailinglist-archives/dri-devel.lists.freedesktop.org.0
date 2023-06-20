Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C76CB736F11
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 16:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9ED10E2F3;
	Tue, 20 Jun 2023 14:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3D610E2F7;
 Tue, 20 Jun 2023 14:48:56 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-56ff9cc91b4so54714477b3.0; 
 Tue, 20 Jun 2023 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687272534; x=1689864534;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P/BJYkX6bywThpMtgw8TodK1xxjg+6M9424vm6AiX+Y=;
 b=lgOaNfjNi640O9ZZHKv/WLheDYiuIbH18qLmGDyCLONcthMEFX+H5LSmG9gOVzksDc
 CQLFSTiuRlk1VWwhUbieZipxET0Zc/GAVPhzolyepEoZygQotuQZVRD4nYvzGaZn3PMC
 WXvs926H2+4CKi5nARSFzigY4G/qCPjPOyomRJuWmIzfmVoL5hLT6xD++D+33HDh3YMr
 1cqM3g2fkpfHrsN2JbWw5fstY/OCkyK5XGks3hfOCC7dlfBe7YuijuzHYaingCIMGyhO
 7A7hUXQGBFqCTSLv4y8EyFKzwPGWCcONQVgOV5kPQTLtSvEcUnhORCwwAO4m6perxe7W
 w98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687272534; x=1689864534;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P/BJYkX6bywThpMtgw8TodK1xxjg+6M9424vm6AiX+Y=;
 b=OSUXifv300YSIVuKMPWGhkrO22dZPtk2V6zrdkdK4gGpLGzr964AUcCauK7oy0i2BM
 YTjXR5he/uaUaIOU5os97xLeJl8xaV48sRaOqH/iBgEALtoGjm5vCrXrCRRUwpzS9lP6
 c9plFlz8RbgM2uf29wDmOq9CkJT8ZF/ZEk2nUj9xk3Tx7HqSkcpaeYxmseZTYPyUmgz2
 wz7SqyLkNTVIdOEqFBGHfonUeKewH8JFMJeE0ZhgjYtvITOa+jz6sM1vlYhTzfLRitTE
 RF+aaEFh/MMEE3xhCohRVNU6FHR0inxn/Ac2CUL+i+IR/IALGU5T1QRg8rqDofkDHntL
 zKuw==
X-Gm-Message-State: AC+VfDzGbMFs9/gOAIafyv8AtC3BBfyHDZdo7IsGF+ObahwxjfohV5UU
 la6EcSpVe/Lz/7HSJl3QyRZ/S9/hkw/8pXIAAlY=
X-Google-Smtp-Source: ACHHUZ53FgFHl4GIT8XPufVJ5Bcyl9yhhVb0g6Za2zAKdfIAPBal6veXmG1rjZwhgPo+3i8UpRxR6fhd5byzeSU2tg4=
X-Received: by 2002:a25:424b:0:b0:ba8:3a86:15ca with SMTP id
 p72-20020a25424b000000b00ba83a8615camr10675163yba.60.1687272534290; Tue, 20
 Jun 2023 07:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
 <20230314141904.1210824-3-tvrtko.ursulin@linux.intel.com>
 <CACvgo52Bb3kBua8dh+eac6dhSwiJLMGAdGDAa+LQYoOwCLPLNA@mail.gmail.com>
 <77587046-aede-f625-6a35-55bf9c5f1179@linux.intel.com>
In-Reply-To: <77587046-aede-f625-6a35-55bf9c5f1179@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 20 Jun 2023 15:48:42 +0100
Message-ID: <CACvgo51DmeM7Tbboozxu3Yn-Pe-eALVTkiq4vZBJJHKfqP_HeA@mail.gmail.com>
Subject: Re: [RFC 02/10] drm: Update file owner during use
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, cgroups@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Kenny.Ho@amd.com, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "T . J . Mercier" <tjmercier@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko

Sorry for the delay, real life and other obligations got in the way.

On Thu, 8 Jun 2023 at 15:26, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> On 21/04/2023 13:13, Emil Velikov wrote:

> Are you okay if I just paste your very fine explanation verbatim, with
> credits?
>

Yes, feel free to use as much of if as you see reasonable.

> > I also had a brief look at 01/10, although I cannot find many
> > references for the pid <> tguid mappings. Be that on the kernel side
> > or userspace - do you have any links that I can educate myself?
>
> TGID or thread group leader. For single threaded userspace TGID equals
> to PID, while for multi-threaded first thread TGID equals PID/TID, while
> additional threads PID/TID does not equal TGID. Clear, as mud? :) My
> POSIX book is misplaced somewhere having not consulted it years... :)
>

Ack. /me looks into actually buying one, perhaps

Thanks
Emil
