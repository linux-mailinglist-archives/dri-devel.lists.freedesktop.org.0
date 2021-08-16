Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB273ECEF4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 09:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AB989C0A;
	Mon, 16 Aug 2021 07:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703DC89C08;
 Mon, 16 Aug 2021 07:03:49 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id i22so6098078edq.11;
 Mon, 16 Aug 2021 00:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Yb1VspGeEa+6vIqGhuygrtILxKH6YEsREcc1oSVU1kU=;
 b=s9yyjtPYUOo2hNoAhkHh4Ljw2rRwbh9qrqCeX6+cxU41O9kzimWIUrVJUKaT4NyaQo
 m+cpgqVBCnLf4ZsEE3cixzK5JCSs8DCCD8CcfgHr+jjfGQ8Jre2GhQkp+xlqcDQ+Q2BB
 er7F7rROjbXr05CEMLzGEB7cE8gSJhsQlSVtpQGpJwQAZlUy6BJ76FSEPbHcDQjJ5Otb
 8YvsuZtI3OfTBWy4OL0LAhe2Y+muPh9M9YupzO9bDcIXzyQkUrZFWD2E/faLiZ0UEBm/
 lSip/dcsD5suO9kpkfZxUte+w0i1L1LnMmJmyCPn4k4Y10OoDj9b1r2TcP7bBFmcbc77
 1log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Yb1VspGeEa+6vIqGhuygrtILxKH6YEsREcc1oSVU1kU=;
 b=oP1UaXXH6g2c6Nd+ZQcfQPkEijYrKXyx4KNmKLX387y7mJz+cElf7t5S6/w0CWcMhe
 WcAnaYn8FvxwbvdvCnQUtq1HO9BMmLDGIItTBK+jucz7xoEpweUxQW86K62wXFNuruYZ
 A6vrhRQEEqBPYmSuQ6VLauRvjTPualkFdnFGjrtcDZv6p997byumElQA9KQflZp4dD6h
 nlRfCOXeg/nbNv6OT/hmuTXts+L9AvXQ0XtzeGNU2GVg3nsgDEyf3ivpBY4WjRyZfgJ5
 9tvB2jENtuUm/JM6lJBCOFx05w0x1p5gzjBA3m3xDRQCzX9H+eRfAjIdHeH8W1ssqgop
 UuGA==
X-Gm-Message-State: AOAM533RCUVr2kbXBDWOBPdbdJziIwV+uAvMxcPJrOoG2si9pxZ9h63O
 pugDjrIpobATG0k6Git2iQE=
X-Google-Smtp-Source: ABdhPJwZeh+sgTffMXUq95Yfd+ceZxj2C+La50wtKTotzfbkIE6hit2C7rhtFrxt0lV+6JpQO69qvA==
X-Received: by 2002:a05:6402:184a:: with SMTP id
 v10mr18149746edy.324.1629097428184; 
 Mon, 16 Aug 2021 00:03:48 -0700 (PDT)
Received: from eldamar (host-82-55-38-10.retail.telecomitalia.it.
 [82.55.38.10])
 by smtp.gmail.com with ESMTPSA id h10sm4360839edb.74.2021.08.16.00.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 00:03:47 -0700 (PDT)
Date: Mon, 16 Aug 2021 09:03:46 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/nouveau: fix a use-after-free in postclose()
Message-ID: <YRoN0vWFN6Lw22ej@eldamar.lan>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
 <b4da382b17a77b66e45fd374c9d806dac6054e3a.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4da382b17a77b66e45fd374c9d806dac6054e3a.camel@redhat.com>
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

Hi,

On Fri, Mar 26, 2021 at 06:00:51PM -0400, Lyude Paul wrote:
> This patch series is:
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Btw - in the future if you need to send a respin of multiple patches, you need
> to send it as it's own separate series instead of replying to the previous one
> (one-off respins can just be posted as replies though), otherwise patchwork
> won't pick it up

Did this patch series somehow fall through the cracks or got lost?

Regards,
Salvatore
