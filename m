Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630E93462F5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4336E09A;
	Tue, 23 Mar 2021 15:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645E56E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:34:21 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id f10so5004826pgl.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XHjma91Go4lStCCAOERDI49wS1wiWeR1ES8nDLQ8/M4=;
 b=ip0A2iJtFyWDqrf0uzjy7C/yjgiyc3HdMqXfp0mj0cBifm6BXwcMIkrpCzjIJOFdrG
 4OgF9oRYEwxjD5c7LrzA2N2M5kocnoZNyptFx3YOAXvWtBrFON/OHoiHIyGcbKXT3w21
 owdwqxsV2cweaVM/7TQzyL+4kP9zsNrJ2qRO/KUC3i5uy+o7R1gGCQrgf7iDbL1ReiAo
 7DdE/A9B6lDurQzMluVaWoUCBTyJY50zEIwSJedt0o3zbkmif9Ya6Mp8/WayTlHmekiu
 +ltFq2VZ5WfNoVSCkUMJuqswN6Zref+1yJbL3Uqc1zRoTXryY1wkU0wLj+FifjxGcUx9
 Lq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHjma91Go4lStCCAOERDI49wS1wiWeR1ES8nDLQ8/M4=;
 b=h1z+Slqxby57C6OgHIilfQ5OavAVRxLQAskUgCvq4u7hjnb5mtPXF7Q8KhQlO54nna
 wa50eFHDHinO8T0X83OjDWD+D/IrPbf7IF6prKuj9dvIhbq0wljLTKijkeAOiy7sgPIi
 gDrMHmfFcVD3acqfISimqEVz+mO7fnT+J7SIFHu9ER+owzKV8GxxUovdH96m/iSpZPHG
 NRg9Nvovp/n0PoWK35SvRu10A99SrcQ1BTcnLQLk/N2L+LF4G8T31FkJG0pMPjgW/FFm
 7nIS4kTT4ykLpGNw26WSLkhxjTEMHgZWkZsOE023YC1tWPYgijB4GCg5WgePA/jd/cQF
 8j5g==
X-Gm-Message-State: AOAM532dU0gGAkLJufDCTIZAwSq5XMBp61T941n2QsAfqs18dd95jimx
 ZopQGcR1MLaAh6HOBTzuymwWsbhgR5/8VFYsFmrSVQ==
X-Google-Smtp-Source: ABdhPJzFeKrcNrmrzRGY5KJWuf84YhTdcVRxfkekyt8LVts5FS2qf7S3nODKcmu4980pVNy5WGvQhs7ebrcx6LhbLaM=
X-Received: by 2002:a62:1ad0:0:b029:1f2:c7b3:3039 with SMTP id
 a199-20020a621ad00000b02901f2c7b33039mr5584856pfa.30.1616513660796; Tue, 23
 Mar 2021 08:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210310161444.1015500-1-markyacoub@chromium.org>
 <CAP+8YyFb4ax0Z6Ev2=KpqF481kFyG_Br+WT=72dGK-tATXVrGg@mail.gmail.com>
In-Reply-To: <CAP+8YyFb4ax0Z6Ev2=KpqF481kFyG_Br+WT=72dGK-tATXVrGg@mail.gmail.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Tue, 23 Mar 2021 11:34:09 -0400
Message-ID: <CAC0gqY4x-bLAfjswiPLjRJKxmOD+7TNWybAHjL4bPgpTmRGx5Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 11:08 AM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
>
>
> On Wed, Mar 10, 2021 at 5:14 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>>
>> From: Mark Yacoub <markyacoub@google.com>
>>
>> On initializing the framebuffer, call drm_any_plane_has_format to do a
>> check if the modifier is supported. drm_any_plane_has_format calls
>> dm_plane_format_mod_supported which is extended to validate that the
>> modifier is on the list of the plane's supported modifiers.
>>
>> The bug was caught using igt-gpu-tools test: kms_addfb_basic.addfb25-bad-modifier
>>
>> Tested on ChromeOS Zork by turning on the display, running an overlay
>> test, and running a YT video.
>>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>> Signed-off-by: default avatarMark Yacoub <markyacoub@chromium.org>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 13 +++++++++++++
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  9 +++++++++
>>  2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> index afa5f8ad0f563..a947b5aa420d2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> @@ -908,6 +908,19 @@ int amdgpu_display_gem_fb_verify_and_init(
>>                                          &amdgpu_fb_funcs);
>>         if (ret)
>>                 goto err;
>> +       /* Verify that the modifier is supported. */
>> +       if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
>> +                                     mode_cmd->modifier[0])) {
>> +               struct drm_format_name_buf format_name;
>> +               drm_dbg_kms(dev,
>> +                           "unsupported pixel format %s / modifier 0x%llx\n",
>> +                           drm_get_format_name(mode_cmd->pixel_format,
>> +                                               &format_name),
>> +                           mode_cmd->modifier[0]);
>> +
>> +               ret = -EINVAL;
>> +               goto err;
>> +       }
>
>
> Why is this needed?
This is the function that initiates the check for modifiers.
Inside it we call `plane->funcs->format_mod_supported` which is implemented as
dm_plane_format_mod_supported in amdgpu_dm.c, modified below as well.

>
>>
>>         ret = amdgpu_display_framebuffer_init(dev, rfb, mode_cmd, obj);
>>         if (ret)
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 961abf1cf040c..21314024a83ce 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -3939,6 +3939,7 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
>>  {
>>         struct amdgpu_device *adev = drm_to_adev(plane->dev);
>>         const struct drm_format_info *info = drm_format_info(format);
>> +       int i;
>>
>>         enum dm_micro_swizzle microtile = modifier_gfx9_swizzle_mode(modifier) & 3;
>>
>> @@ -3952,6 +3953,14 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
>>         if (modifier == DRM_FORMAT_MOD_LINEAR)
>>                 return true;
>>
>> +       /* Check that the modifier is on the list of the plane's supported modifiers. */
>> +       for (i = 0; i < plane->modifier_count; i++) {
>> +               if (modifier == plane->modifiers[i])
>> +                       break;
>> +       }
>> +       if (i == plane->modifier_count)
>> +               return false;
>> +
>
>
> This part seems fine by me.
>>
>>         /*
>>          * The arbitrary tiling support for multiplane formats has not been hooked
>>          * up.
>> --
>> 2.30.1.766.gb4fecdf3b7-goog
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
