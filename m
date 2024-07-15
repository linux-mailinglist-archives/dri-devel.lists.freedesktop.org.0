Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B2930FE1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 10:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B863010E2F4;
	Mon, 15 Jul 2024 08:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZCCy+Tq0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FA610E313
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 08:34:50 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52eda846b7eso13678e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721032488; x=1721637288; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iVCqckyW7c8V6lxlB2E2A8uvPDhEx4b9vry7kv1USrg=;
 b=ZCCy+Tq0R2j9Id7WG+0EXKp7RTF4A5GS9ZF0aX0QlLO7FQKBxkepwbiclmqBskXEyg
 y2zJQYlY2ywS3f/AD7H74Bysyoh913hjiIqCK/k5cc8rDaB53ZnRsdqmoY3rXuYvZltV
 P+jZ8rrFHkZDIwkdqDaCVkUV69/sqcIV4jbLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721032488; x=1721637288;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iVCqckyW7c8V6lxlB2E2A8uvPDhEx4b9vry7kv1USrg=;
 b=YhC3emHOAy9uJ++hC7AGGHmDMUGZejLeKWr1xihHcgJfpEeMlBKkfmuioF3z+EitZm
 RGXYLOIELSjIqMZDuIRMA9I6h2iuoBzgu+5tsinkD0tFuVW0fEnBavmQhaxXU/P946CO
 fVYvxFIRca54FOI22Vvy/5Z/UNsp4C0ZdlpC64wHHIGDC7m+XXv+uTo09E8eV4TI2XIc
 hy53JxkpxLofdx2Hk1nkvwyPsT2Qq/l5ykshvcGesWcOpFmDcP7EDQRm1r/p+PBeKEjP
 gTUe0Ud/dvK4D9gwANkJ/sPi0Xfr+ugsrzhSpL2bAO3+QGVjRMMJwTES8XFqpgAtGNe4
 7Tlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7fVozrFYovk+QMcCPgagQ1B9Tdm9ixwI6CzohQPmLBuLjRylAi0TPyJk2SUtcIuGuAmSirv8BlCmPCTtYBvyEzLnOs/86kPkAX/XBXpI0
X-Gm-Message-State: AOJu0YztcOvcQrLZDsWtPNtUfDZX1a8zNeOxgJbAxSeOKX2JIdcLEDLi
 21OvN4uQP1eTP43AwfYZGszlwlfvHAiJDmoImVpfmKVO97aeiB61ZivWEGXt6Tg=
X-Google-Smtp-Source: AGHT+IH5T9YdVXggIpdAzXkSXyX37SMpGlCbN9JJqMdkjy6jqBuP4OMd6gOAeWKCKT6bIEAml4lqfg==
X-Received: by 2002:ac2:5f54:0:b0:52e:9b18:9a89 with SMTP id
 2adb3069b0e04-52ec3e53a53mr4484289e87.1.1721032487982; 
 Mon, 15 Jul 2024 01:34:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-426725597bdsm138545655e9.0.2024.07.15.01.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 01:34:47 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:34:45 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 David Airlie <airlied@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] agp: uninorth: add missing MODULE_DESCRIPTION() macro
Message-ID: <ZpTfJdscoWCjTaSd@phenom.ffwll.local>
Mail-Followup-To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 David Airlie <airlied@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240615-md-powerpc-drivers-char-agp-v1-1-b79bfd07da42@quicinc.com>
 <99d6c483-9291-4bd0-8e62-76022abb762c@quicinc.com>
 <7b7e2952-fb54-48b0-93bc-f96c04e5cdd3@quicinc.com>
 <ce7863a7-f84e-42f0-9aa5-54b43edcd260@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce7863a7-f84e-42f0-9aa5-54b43edcd260@quicinc.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Thu, Jul 11, 2024 at 01:27:23PM -0600, Jeffrey Hugo wrote:
> On 7/11/2024 12:19 PM, Jeff Johnson wrote:
> > On 6/28/24 20:14, Jeff Johnson wrote:
> > > On 6/15/2024 2:01 PM, Jeff Johnson wrote:
> > > > With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
> > > > WARNING: modpost: missing MODULE_DESCRIPTION() in
> > > > drivers/char/agp/uninorth-agp.o
> > > > 
> > > > Add the missing invocation of the MODULE_DESCRIPTION() macro.
> > > > 
> > > > Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> > > > ---
> > > >   drivers/char/agp/uninorth-agp.c | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/char/agp/uninorth-agp.c
> > > > b/drivers/char/agp/uninorth-agp.c
> > > > index 84411b13c49f..b8d7115b8c9e 100644
> > > > --- a/drivers/char/agp/uninorth-agp.c
> > > > +++ b/drivers/char/agp/uninorth-agp.c
> > > > @@ -726,4 +726,5 @@ MODULE_PARM_DESC(aperture,
> > > >            "\t\tDefault: " DEFAULT_APERTURE_STRING "M");
> > > >   MODULE_AUTHOR("Ben Herrenschmidt & Paul Mackerras");
> > > > +MODULE_DESCRIPTION("Apple UniNorth & U3 AGP support");
> > > >   MODULE_LICENSE("GPL");
> > > > 
> > > > ---
> > > > base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> > > > change-id: 20240615-md-powerpc-drivers-char-agp-db644db58c24
> > > 
> > > Following up to see if anything else is needed from me. Hoping to
> > > see this in
> > > linux-next so I can remove it from my tracking spreadsheet :)
> > 
> > I still don't see this in linux-next.
> > Adding Greg KH since he's picked up many of these fixes.
> > Hope to have all of these warnings fixed tree-wide in 6.11.
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Dave, this seems like a trivial fix that is stuck, but normally routed
> through DRM.  I hope I'm not over stepping, but I think I'll drop this in
> drm-misc-next on the 19th if there isn't any other activity.

Committers applying patches is very much welcome and encouraged.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
