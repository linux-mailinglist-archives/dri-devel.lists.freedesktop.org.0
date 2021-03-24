Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E38347CB1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA826EA1B;
	Wed, 24 Mar 2021 15:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A646A6EA29
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:32:54 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id f26so30756597ljp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izPOmieh1WevNujIwbAbL3OCIGkPjE9MVyJVOgBEtC0=;
 b=GXPU6UVxcNBB1W5pdqZxUcCvkqUaXc1PQ1SD7DVlwqDi1RCCzHdvPP+enpOlhWdyaG
 BiBzy+GFpja1pfdj9b5Fq4/6Ecf+dH5X7+osSKghK3uaFt29fJlL7ixqJUSh07K9dcOb
 3y8x5qPfLq5K+fnrdAWTqA3VtH7Apqrxu7OKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izPOmieh1WevNujIwbAbL3OCIGkPjE9MVyJVOgBEtC0=;
 b=dv9dy6G44qEPKkg9Yy81s5O+xtE2mVYjX6PB2E0XbjGVQlDWQl8YaCCJRP9OsPycGc
 468FkMqB5ccIhnRQGVj38nSuKxgAkJ61PXq19d1kIUTVlLQtk72vS07bqljo81vSat++
 5crSclyuy/kNp1vWCtBmWvwvUrsmVBLb0xxoshqyqD3zTfkh4J4zKDaCiTG8hhsJQTXf
 WQZS2TphJyQKnUAbyE+SqfvX2JSkOXPQiPr4yNepH+l1U8NAFDDMsJK3eAioHGLSz87D
 qNWEJzaZ7Zr8q6HnV3HHc7xfV/BZWCwUprvvN30+V+0rubMz7/T7RAuq4ER05owoo9c5
 6vgw==
X-Gm-Message-State: AOAM5306asNgr/1qdDlbdDJt+IJykKTnBE+zIpX/uWirCnTl2BYCOoTH
 5ac/3COxC8+2oHvwORalWgB2DBwfxWVLXEJlN7M2Pg==
X-Google-Smtp-Source: ABdhPJzZGpJaY54yuPyrvOaJAifQDTulUlejaz+CQ+C1jq4wkC7RDiMZzbxvKHmkxqci78nRS1gxWK0y89++eh7Vv8Y=
X-Received: by 2002:a2e:810c:: with SMTP id d12mr2545673ljg.49.1616599973170; 
 Wed, 24 Mar 2021 08:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210310161444.1015500-1-markyacoub@chromium.org>
 <CADnq5_P9aYcedOP2qduSz7VN1fCSnmQEtPa+FdjYu9Co7TwPog@mail.gmail.com>
 <CAC0gqY7Y2WxtAZ3GnWmASPYq7ahYTfmPhOHAAX5UjMNS9k098w@mail.gmail.com>
 <b4070483-5aa5-c712-6435-dcb4a206ca76@daenzer.net>
 <CAP+8YyExtmmZbFfAO_YR=XWHE+HbH6m7JqyJV4LB_hbGwsihBA@mail.gmail.com>
 <CAPj87rP+WkUPbS3yyGGfy0SRm_hsnCCUav99Dg2Q+tXCiJ5D+A@mail.gmail.com>
 <CAJUqKUqQ0yrxpr+QVRXYXMk1hBRNByD0TP6mM0oLY54jDZimbw@mail.gmail.com>
 <CAPj87rMGcha9jGe3rRH8OvMxYSo42z1d0ZCxhRUxz+aAXMow2A@mail.gmail.com>
In-Reply-To: <CAPj87rMGcha9jGe3rRH8OvMxYSo42z1d0ZCxhRUxz+aAXMow2A@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 24 Mar 2021 11:32:42 -0400
Message-ID: <CAJUqKUrWsXdipa2FRMBFEWR0MfoWZ2O6BCXGnZs6CgKP559sBw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 11:25 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi Mark,
>
> On Wed, 24 Mar 2021 at 14:58, Mark Yacoub <markyacoub@chromium.org> wrote:
>>
>> So you mean it would make more sense to be more explicit in handling
>> DRM_FORMAT_MOD_INVALID as an incoming modifier (which will, just like
>> DRM_FORMAT_MOD_LINEAR, will return true in
>> dm_plane_format_mod_supported)?
>
>
> That's correct. Not passing any modifiers is the same as explicitly passing INVALID, both of which mean 'the driver will figure it out somehow'; that driver-specific determination is not the same as explicit LINEAR.
>
> (I cannot regret enough that INVALID is not 0.)
I feel you. When I tested it on a board that doesn't support
modifiers, the modifier value was Zero. when I checked it, it was
basically LINEAR.
I'll amend my changes to explicitly handle INVALID.
>
> Cheers,
> Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
