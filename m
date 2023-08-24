Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E057873C2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB7110E57A;
	Thu, 24 Aug 2023 15:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E824310E57A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:12:11 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-4108a8f0de7so31875191cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20221208.gappssmtp.com; s=20221208; t=1692889931; x=1693494731;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gKObriympOeNKMv/q1LmfMAqJXRFcpvTzk+LBnFI9Do=;
 b=L6Rav7TEl/cmVgeGDFTk/95bD6/oGcwRBoB33dJQQM5ZdUY4TvFciWG32PBby6zop0
 1TykTUgvvvT8gOENRI9wb3DHk+QJOLnqhNlk8VuFlpUdjjF5xmyl78c6tZ+69MRWmBs8
 sNtUaHNvfmqb6CAx2HQcugLxDRLES063/AMyFIdiEFcSwIcF+Sxb7iZE1R8w40iWuDAk
 UkoxFsCYGEzWbUd1wbH/Fi7D4jOLFyuvYSKvWaSTy91DzJxsNanUGcgMmO0QOhMz9UA2
 ruAhVZdCvkLB4jpjzlRianrnPBGQKfVnYf0EZHmqi1f0TIcKxliMAoM9SnmjewS4OdIC
 ITIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692889931; x=1693494731;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gKObriympOeNKMv/q1LmfMAqJXRFcpvTzk+LBnFI9Do=;
 b=Iu2BvXxf8vtVFgeTywRp2kh0ecfbIa5B41Sm5Ra6pdLsMkqBmWRKy+KmdRJ0ljxRNu
 IeXCgYB95lBRdMyFbOZbnxutJUpJlCBOJufZwU4FuhnNJrhttWKsF/OClI1dw5sOkOCE
 5NlXthoM7T/3o4VHaYpKeajg7IZ1wN7KjgExGFxv/ttlwf+mrufjaw8jh1VIvQB2hy/b
 qARi3UUU9LBBCXgqrO8zETXo968q5k7fFxiM06qExwJkYhUFcL3Gk2NG2DEAWAVxOQUs
 Vwc/82e/eLK1wJFjy3mrCPDGmbgnVU9wLJ1rgtg6Rd5YKEgxuOIhHLH0Ld56HEXKKsxW
 jmcg==
X-Gm-Message-State: AOJu0Ywwm/ItoNtPTYfbdbDPAc5JOllbleKkwcIu9zoAkHNzUfdDcbeD
 ZpHsvynJEWLe5/YCCn2MBGYVqDAiYkVnXiFFqkk6Jw==
X-Google-Smtp-Source: AGHT+IGzc1eptkc6jGGfl4yF9wMbyUJ8hqtRlaCPtnoUpteoJ6QvxFp8v8A85gxCC0FxqtNA7YTh3ZzUKQedrXTvQxU=
X-Received: by 2002:a05:6214:5d0c:b0:642:d729:35ec with SMTP id
 me12-20020a0562145d0c00b00642d72935ecmr15520155qvb.51.1692889930894; Thu, 24
 Aug 2023 08:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692888745.git.geert@linux-m68k.org>
 <50762fd1694d3b5f6df1bdfa482564adb2ee7f36.1692888745.git.geert@linux-m68k.org>
In-Reply-To: <50762fd1694d3b5f6df1bdfa482564adb2ee7f36.1692888745.git.geert@linux-m68k.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 24 Aug 2023 16:11:59 +0100
Message-ID: <CAPj87rNr7PTcquaz+VzwmXh0mSWSSK25_Fa6uxC2VOfj=wMmcQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/client: Convert drm_client_buffer_addfb() to
 drm_mode_addfb2()
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Thu, 24 Aug 2023 at 16:09, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>         struct drm_client_dev *client = buffer->client;
> -       struct drm_mode_fb_cmd fb_req = { };
> -       const struct drm_format_info *info;
> +       struct drm_mode_fb_cmd2 fb_req = { };
>         int ret;
>
> -       info = drm_format_info(format);
> -       fb_req.bpp = drm_format_info_bpp(info, 0);
> -       fb_req.depth = info->depth;
>         fb_req.width = width;
>         fb_req.height = height;
> -       fb_req.handle = handle;
> -       fb_req.pitch = buffer->pitch;
> +       fb_req.pixel_format = format;
> +       fb_req.handles[0] = handle;
> +       fb_req.pitches[0] = buffer->pitch;
>
> -       ret = drm_mode_addfb(client->dev, &fb_req, client->file);
> +       ret = drm_mode_addfb2(client->dev, &fb_req, client->file);
>         if (ret)
>                 return ret;

This should explicitly set the LINEAR modifier (and the modifier flag)
if the driver supports modifiers.

Cheers,
Daniel
