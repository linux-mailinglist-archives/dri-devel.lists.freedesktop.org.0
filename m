Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0019146FD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 12:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AC110E058;
	Mon, 24 Jun 2024 10:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RIrYJ5/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314FC10E058
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 10:05:50 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42179a2c755so5070055e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 03:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719223548; x=1719828348; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZUtFB2ALC81XwezmQi6OPGxCp/AGSlmMAk+HHu6X/w=;
 b=RIrYJ5/G1ngQpeN7EM7T+RjuBYaRkUPAqv19Eqx/dbLjpwb+OkrlEkQt4dTaHvq38R
 jQFPxe5KmXo9e0KqqfhsmOltu2tkkfX16HojAZTmRtfzvAQlloLi4mRPFuzRbqWUZ57K
 vkoKhxwaqLHGYI0mp5R49d0wE9yulKVuw8Blo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719223548; x=1719828348;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ZUtFB2ALC81XwezmQi6OPGxCp/AGSlmMAk+HHu6X/w=;
 b=dPYcdxPXrqFn8syWAzlT2s6Qnv2qqsAIdipQLZsZBBCRFCzbN5m8ZI8oAY0dXSPZNX
 Ej3A6pCoGVPDc1qkQ8ZA2JaKH4aByd0gUnh9AQMkzCpO3S671kwCYKfIQsgGDxPBSeC6
 QUlpFIBSQ7G22FOs88vOMWbJGM/PNLl72Q1+KZ8WIVAja6kqbIKWwwqlLrUru4Lawd/S
 oFehP5TaqpfA+EOnv/HuLYKbjyyNny3Uh/FgCGfRsldECcFHuZQP99trWtrDx+aWmy+O
 g7LTFbXASqyGvI4t/iSB/kN+mezQkOtb87B5vpjJQiQ2feULkvtChB+rPRkZHTkdql3H
 vhmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcF+d4V2BfRT/tIRPMv7fhfwyKA9i7GA0XVqLFLk+MOR+YstX7RFaFVgCI+JdGllxEcNSAca8+AN1tKrpm9wt5JQtU0yD6hg24Xov/Bjok
X-Gm-Message-State: AOJu0Yz6lX0+8qMeBwL++pdRHZGKNhV5HURK+tOwl97YmMT5t8Af1gbz
 mH8XNCow92gdcqby4cJBEw6vhg63DzfXLGUkYPN0ofxmX88ak3/pSNQ5t2a7uckxUQveMRY2ASl
 Puj0=
X-Google-Smtp-Source: AGHT+IHedTLrmTpjHsGo4ZkLuCPVU0xl+OWRa7L+a5FuN9N6VoaZ0F+n2xIrVuYAzIImSuXZm2ihQQ==
X-Received: by 2002:a05:600c:6d8b:b0:424:87fd:c47d with SMTP id
 5b1f17b1804b1-42487fdc85dmr45696565e9.0.1719223548167; 
 Mon, 24 Jun 2024 03:05:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248191c5adsm128108675e9.39.2024.06.24.03.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 03:05:47 -0700 (PDT)
Date: Mon, 24 Jun 2024 12:05:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lukasz.spintzyk@synaptics.com, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Subject: Re: drm/udl: Implementation of atomic cursor drm_plane
Message-ID: <ZnlE-Wm2gim2Unnz@phenom.ffwll.local>
References: <20240624071041.5087-1-lukasz.spintzyk@synaptics.com>
 <5fbf1be7-5049-4596-9ad0-d40d397396d1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fbf1be7-5049-4596-9ad0-d40d397396d1@suse.de>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Mon, Jun 24, 2024 at 09:28:29AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 24.06.24 um 09:10 schrieb lukasz.spintzyk@synaptics.com:
> > This brings cursor on DisplayLink USB2.0 device on ChromeOS compositor that requires either crtc'c cursor_set callback
> > or cursor drm_plane. Patch was tested on ChromeOS and Ubuntu 22.04 with Gnome/Wayland
> 
> NAK on this patchset. UDL has no HW cursor support, so we won't implement
> this in the driver. Software blending should be done in userspace, where you
> have CPU SIMD available.

I think for drivers which do cpu upload and are vblank driven there's
maybe a case for kernel implemented cursors due to latency reduction if
the blending happens as late as possible. But udl just goes right ahead
and uploads, so this doesn't help I think. damage tracking should, but we
already have that.

So concurring here.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
