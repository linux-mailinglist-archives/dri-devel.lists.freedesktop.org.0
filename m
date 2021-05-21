Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7AD38C7CA
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 15:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D166F648;
	Fri, 21 May 2021 13:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5495F6F648
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 13:23:51 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d11so21049128wrw.8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zBr2qa8weJ1fN+pyrA9yHt47NZiiPugqQIjjkfzP+jw=;
 b=Vo39h2GhwMLbJLo+/rJ8jKdDxxx7yt/+DuSYtdRMJYd/ewYSQQsrwCnOCge0+aOIM2
 9/KcfjejnPY8GM8mZ7TLh9EDtHEL/1jvG9ThrG9zg8eAz/GKa3MaVPVSMLnA4tV2yryY
 wubn8HMprLTyeofXBSRountcrg6j1SBLsPKvAsbxcvpmEVW7xAfjiqMlhxwraaQJlRHQ
 RBb6DN/tULEGgiS/IonVr9QgSxe37CitIuX4+gnFggRx+HHuCHA5loPr60vmuDY9nqZD
 rfQA3gO4qDA/z8bt5atk4ADkTZhfdIHY0OqxfaTHUZQut/UlgKWx4Let826C6h8Ly2d/
 GudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zBr2qa8weJ1fN+pyrA9yHt47NZiiPugqQIjjkfzP+jw=;
 b=g63rnUzvAQ+AdUwsVl+8Cv/wbLoxHZVtEYg+o/oyLrIeeSwDajviUHP06XBMN25bnt
 OvXKb7+cScULefjd1nf8nWPqG8h5nkwKKiTLhRrNCq79myDXnozPNg9MlIgG41eXf4Ag
 CQuy/2WLJCgE/DWqiYKA8PyAj02QoqlaAvaSkB6MlpCNTo+D0Gh+g9OHb/cCsOxSvddt
 AUoDUZhd9TO3ZCL9sQLgPycnCwZ2xO7R2zDlDosZrBNIJsrDEi2sri6COrw0EMK9xVEj
 4wZZsJJ3WKzAk1qTs6CWyEO3mRSiiajrJGCLfsIBV5aE4VzJrXl8kBo1c58RDbl1DT91
 QW6A==
X-Gm-Message-State: AOAM531sOss8ds3jblY+0XoUexwwMhze+tkn91BshPIcdVeXAAXjTH8L
 yIvpw4o2zP10/DqzHgF7B1xY0cjoE0K7lMQ8eP8mGA==
X-Google-Smtp-Source: ABdhPJyU8TEmXK/S6OXq7q8k124HIgHp5J7hILQzz4PXVCcZY3JiYAj8Ouwu177Y0/InrwMU7WBJIc4BjzJuyR8pTms=
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr9422676wrz.256.1621603429939; 
 Fri, 21 May 2021 06:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-4-daniel.vetter@ffwll.ch>
 <CAPj87rMBVRamT+VAVUaUnq3C1KFVqzABi99RKs=1_vyb4YWDnQ@mail.gmail.com>
 <d1ef10e8-b774-06e5-92ab-047c58e1ea41@amd.com>
 <CAPj87rOzV1mC=Nv2zfsYXrD4ARV7cmmJmkUCSwRSw1Ksy0k-aA@mail.gmail.com>
 <39aa30e4-2726-a0ba-3537-3be609dbc0b5@amd.com>
In-Reply-To: <39aa30e4-2726-a0ba-3537-3be609dbc0b5@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 21 May 2021 14:23:38 +0100
Message-ID: <CAPj87rOhByk-azt2jm=YV8WYSQH3g2+aJ83nG+5SywksXH3OYg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/11] drm/panfrost: Fix implicit sync
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 May 2021 at 14:09, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 21.05.21 um 14:54 schrieb Daniel Stone:
> > If you're curious, the interface definitions are in the csf/ directory
> > in the 'Bifrost kernel driver' r30p0 download you can get from the Arm
> > developer site. Unfortunately the exact semantics aren't completely
> > clear.
>
> Well it is actually relatively simple. Take a look at the timeline
> semaphores from Vulkan, everybody is basically implementing the same
> semantics now.
>
> When you queued up a bunch of commands on your hardware, the first one
> will write value 1 to a 64bit memory location, the second one will write
> value 2, the third value 3 and so on. After writing the value the
> hardware raises and interrupt signal to everybody interested.
>
> In other words pretty standard memory fence behavior.
>
> When you now have a second queue which depends on work of the first one
> you look at the memory location and do a compare. If you depend on the
> third submission you just wait for the value to be >3 and are done.

Right, it is clearly defined to the timeline semaphore semantics, I
just meant that it's not clear how it works at a lower level wrt the
synchronisation and signaling. The simplest possible interpretation is
that wait_addrval blocks infinitely before kick-cmdbuf, but that seems
painful with only 32 queues. And the same for fences, which are a
binary signal. I guess we'll find out. My tooth hurts.

Cheers,
Daniel
