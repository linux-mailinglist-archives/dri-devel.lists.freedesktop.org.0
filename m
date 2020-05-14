Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B11D2813
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 08:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D506E2E4;
	Thu, 14 May 2020 06:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425A66EAB1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 06:42:26 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w19so16336231wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 23:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jx7qglq93rWDanidzQRtYPLYgQThofsEoYOfwLqQhc0=;
 b=vJsbUxRyyUlKCO7bodkCSLhazXXcrW2rlT5uXYdav7sHNPuukNCjoJCjKYeLd4pwiN
 RTDxD+R035RfhEmet5tCdwUlSGIoDOwduimQl3Yo7W5BWTOWWEoKrAq66TB6kpAkvMMF
 V1ot/YnQjf6tcXeZZs2OlGDvcAHRdlZQIs3J2/rLuUO4Pr8AlUfB5HA8jlTPItg32H7J
 Nd/TbIbnjVt6Fli8avZGrxwopAjLJobBOwhovnZ1gLgfUU8SzG1MEujiO2cOKDcS0Fwi
 wMEr5jmrHVK1GoT0hEZ2dtyL+9AK12VyyQqUIgiqDarMc+MoEhEg+PsEgQSO+OfrDmNa
 LgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jx7qglq93rWDanidzQRtYPLYgQThofsEoYOfwLqQhc0=;
 b=YPXIIIqZ8+rCPSEEZln+miD5S4W+hOIg2fPlNewp98aA0Jw39G027kP+w5KV3CoW8f
 IISawuy6AVjCXE+OkPUcf4jMQbU4d978cE9RpIqUQzQDFCOUS+lnqHRJ6oRcPcTxC3et
 J1NJ2HRa5HZVAqYYXxGu8kurHxeSf668G41OKiXC/IMTlyf1CEa5cutEz0PrcWbzsO1i
 hK4psxFvT1f9+7moCimpgup1XONATvtNAgUBxw1HFd1bmQaB599s5yFq8JOxWMpJj1cq
 nYLUum965K4CD9TAwwq7E+JALQ5vuUiOH7EG7AnS9hF1zZduOQPNc0BniTACqsAkCcJq
 8cJQ==
X-Gm-Message-State: AGi0PuYyvXZKIbHfCuSMcoG5HVkKUkpclZto3bRT6k/aIkJGsTlTTK65
 NykAPjZi/A3DAcVsl+6zz1E5WMVnLJWtgMd6K/67Lg==
X-Google-Smtp-Source: APiQypLH364lYxNqugtZIJWLLbIKFfVxH1Let0bIRxUi5KBU+tIytLWGafmeWA+xyDd9uh1HVWhThY+2FWEvWMxEX3Q=
X-Received: by 2002:a1c:2d02:: with SMTP id t2mr46616464wmt.98.1589438544740; 
 Wed, 13 May 2020 23:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200408162403.3616785-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200408162403.3616785-1-daniel.vetter@ffwll.ch>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 14 May 2020 07:40:47 +0100
Message-ID: <CAPj87rMJNwp0t4B0KxH7J_2__4eT7+ZJeG-=_juLSDhPc2hLHQ@mail.gmail.com>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Stone <daniels@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Apr 2020 at 17:24, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Resending because last attempt failed CI and meanwhile the results are
> lost :-/

Did anything happen with this?

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
