Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE76012CC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 17:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C7B10E519;
	Mon, 17 Oct 2022 15:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0671110E519
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666020891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5Hw3N/yBRvXSb8kCKGLJA5iLp5ZJdPKFLyQnc+d2Vs=;
 b=DdF3MWqs5FqnSN7VR7AtxhVF/E20BdjK1HvzJaDhUFqbwC/CCdC3OV9X1FSotK8UMBF6ed
 HRbOsmGtWvgInZ7G9El2EZdHh7eVuMG4OrocNyumPkzuDiOUsct5gLUbw+bpIqvbCJQDGQ
 BCRFveJaXKoemheZjW0dZsNawrc6rA0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-ZvVv7_BhPrm0VYZvx8tt4w-1; Mon, 17 Oct 2022 11:34:43 -0400
X-MC-Unique: ZvVv7_BhPrm0VYZvx8tt4w-1
Received: by mail-lf1-f72.google.com with SMTP id
 s5-20020a056512214500b004a24e8c79ebso3767468lfr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 08:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N5Hw3N/yBRvXSb8kCKGLJA5iLp5ZJdPKFLyQnc+d2Vs=;
 b=eokx/COI/AGGy0bNMr1PA0/1U6l6/Pnl9+W8vKxRbS03jEoXrkUgeX65y9pe8RkGjp
 guHUaOW9FyLLBvE2TPm03f4wl630WfX7EWr24hiCf+ZTJehoSQz8MIyJllD8HAJyqhuQ
 uFIxqepEhf4NUedZNIvt+7Z4z0NKnqSKW7GS6YvsaQhZ39DxyJpwPSFFFINdKovc0FN5
 3/2YdPQc2eHtcgXsdf2Bxk5ErvNacOQ4qaEREYRwdwQlolxv9YhLJXxEhyBwlXeKcVjq
 r7uQgcZjiRpXdaaxQzpf8L3CJszgOBG5V3Ig0Tsu4lyijycx3aLoCLjrYKxWcBw6pDxZ
 4rRQ==
X-Gm-Message-State: ACrzQf28378ClJeuE6yKF29f9jEvuahIBY9jaBfvekVc2jN0SQ0dxegx
 qRjph2VYbr9rW2watkBna97BwDamu4l889P3jEABOks3osTMFPkaH4p8Hbpoa0ZGW5z1dGTjtaf
 K37uNZJQL88pJZOV6kSTUBMgVGh+V
X-Received: by 2002:a05:651c:98f:b0:26d:ff18:97c6 with SMTP id
 b15-20020a05651c098f00b0026dff1897c6mr4533683ljq.375.1666020881549; 
 Mon, 17 Oct 2022 08:34:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57wE364GqH9fWnoe0gYe9cPBp5F/31FMQZv9YAdTOl72+aEIDVZL9AQd9N6JQ0iPqlCe8DDA==
X-Received: by 2002:a05:651c:98f:b0:26d:ff18:97c6 with SMTP id
 b15-20020a05651c098f00b0026dff1897c6mr4533677ljq.375.1666020881356; 
 Mon, 17 Oct 2022 08:34:41 -0700 (PDT)
Received: from redhat.com (host-90-235-3-243.mobileonline.telia.com.
 [90.235.3.243]) by smtp.gmail.com with ESMTPSA id
 u4-20020a05651c140400b0026fbac7468bsm1490240lje.103.2022.10.17.08.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 08:34:39 -0700 (PDT)
Date: Mon, 17 Oct 2022 17:34:37 +0200
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm/connector: send hotplug uevent on connector
 cleanup
Message-ID: <Y012DW23jc11f2ZU@redhat.com>
References: <20221017153150.60675-1-contact@emersion.fr>
 <20221017153150.60675-2-contact@emersion.fr>
MIME-Version: 1.0
In-Reply-To: <20221017153150.60675-2-contact@emersion.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 17, 2022 at 03:32:01PM +0000, Simon Ser wrote:
> A typical DP-MST unplug removes a KMS connector. However care must
> be taken to properly synchronize with user-space. The expected
> sequence of events is the following:
> 
> 1. The kernel notices that the DP-MST port is gone.
> 2. The kernel marks the connector as disconnected, then sends a
>    uevent to make user-space re-scan the connector list.
> 3. User-space notices the connector goes from connected to disconnected,
>    disables it.
> 4. Kernel handles the the IOCTL disabling the connector. On success,
>    the very last reference to the struct drm_connector is dropped and
>    drm_connector_cleanup() is called.
> 5. The connector is removed from the list, and a uevent is sent to tell
>    user-space that the connector disappeared.
> 
> The very last step was missing. As a result, user-space thought the
> connector still existed and could try to disable it again. Since the
> kernel no longer knows about the connector, that would end up with
> EINVAL and confused user-space.
> 
> Fix this by sending a hotplug uevent from drm_connector_cleanup().
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: stable@vger.kernel.org
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>

Tested-by: Jonas Ådahl <jadahl@redhat.com>


Jonas

