Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7FC8B78D0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 16:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB4410FCD0;
	Tue, 30 Apr 2024 14:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="H2Yc+d0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1841E10FCD0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 14:15:39 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-34ca50999cdso135092f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 07:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714486537; x=1715091337; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fAk4U+XtjqGjGFszmKT+LQDZSlBDpIiovxj7ARtJleI=;
 b=H2Yc+d0PRP6bL9Sai8ZSf5zUxKgkWAAd7mfKyZgXgvAlLvNFtxIiAHW1SI/FymnP/I
 64MUct7SU8yWMg5r1GFzM4qzLYrx7FX1njkWgpcHlShNBnv1JKLARH9pDS6aWKgoKAa0
 ze7/0beBP7PSQDvNDWN6ZMDpyXkHTKgforSeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714486537; x=1715091337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fAk4U+XtjqGjGFszmKT+LQDZSlBDpIiovxj7ARtJleI=;
 b=jhtZd+S9nnn6WQ5l2/UbFP9Ahp3lnN2F2zciSl7V0MHaUWb3BK7YGrMsSTcsIJREOi
 WlWdYgEI6t+3b20qetsFz9ZaspmdJfg7P+lI5yPcwiRbkZ9W99Fb9oqL1/XrL+tq/mk2
 xjoqG46vncLXRZ8my7mye5t9zSQ0c2Bc4Y+i27aLEYGauEXpBtfISd2m9GbvJsa2FGPA
 OqSWWe5oL7h/TkBjGY9oT73EddXLwfTD9h0x/ny3ZkR+pzuCTnBdSkkGIp4VJ+8eziQL
 UxY+Rm5AWArrX6wGWLRCvnlS9L4vs21443Jt5OoK4MT5mJfd1vebJdAv4Yc6BfTHf2Rq
 0aew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZMJD9IlIawBUas61jO4WetdCgQU/uCm8tVJTNSKK7svIABDNDL/tfFhFu5mVPLJfBSbiEoVmMqM31sxEndjOlWv+JJej5q3f8ZTz+Kazg
X-Gm-Message-State: AOJu0YyYXx56VwbLcLyMIreDxApUqL5bfFDRNYTdpz5jH2KvEFXEm9lw
 iFrSFBRjeEpuO+OHr90h4PZh5j4L1hIu7dH6OMAQ4PlJUSc6q7RzqiUf8NCiC+cLBpbiCm3fu8x
 m
X-Google-Smtp-Source: AGHT+IFSbTnfwJVImTp9MkVvrwjQA1yb2BAsRpngzUybcf1kR4sLYKspMk3dvhhzMph4SLHY5R425A==
X-Received: by 2002:a05:600c:1d26:b0:41a:c04a:8021 with SMTP id
 l38-20020a05600c1d2600b0041ac04a8021mr9745591wms.0.1714486537351; 
 Tue, 30 Apr 2024 07:15:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o28-20020adfa11c000000b0034ce8f59fb1sm6553118wro.3.2024.04.30.07.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 07:15:36 -0700 (PDT)
Date: Tue, 30 Apr 2024 16:15:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: deprecate driver date
Message-ID: <ZjD9Boq4C6ZwyOLw@phenom.ffwll.local>
References: <20240429164336.1406480-1-jani.nikula@intel.com>
 <c6f1677d-6fdd-4a64-9072-5ecf6dae1966@amd.com>
 <87v8402gz8.fsf@intel.com> <ZjDtOVHquxhWeNfo@phenom.ffwll.local>
 <878r0v2cnk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878r0v2cnk.fsf@intel.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, Apr 30, 2024 at 04:38:55PM +0300, Jani Nikula wrote:
> On Tue, 30 Apr 2024, Daniel Vetter <daniel@ffwll.ch> wrote:
> > Might also be a good idea to wait a bit in case there's any regression
> > reports for really old userspace. But I guess there's not a high chance
> > for that to happen here, so imo fine to just go ahead right away.
> 
> This small bit is definitely easier to revert if needed than the whole
> shebang.

So the reason I'm not super worried is that most likely it's going to be a
an old driver for a specific .ko that falls over. So as long as you split
it up per-driver it should still be a fairly minimal revert. But entirely
up to you.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
