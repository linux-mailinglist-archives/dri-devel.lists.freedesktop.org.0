Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E690E602855
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 11:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D64B10EF23;
	Tue, 18 Oct 2022 09:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9575910E1FD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666085247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gfdqxzrmHmZKaIqcYHoLx+LsAZjgQDcMzFU65ZPj1bQ=;
 b=D7mrjISpq2H+D5DPTh+3Z1DNSDfkVlZZPaadbtz5W5w6ZMUf14T0OYMNotAllfpR01IPyI
 zftqrhCLKUJYbVm815VMWMIC+p2MDU/bFmDaE92ZQw+9y27Nk2pKx9jYgCdUkJJW9exA1N
 ZlqhdLeEX7kiaZXb9qI6O3++wV9wUhw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-O5P-8lujMpO0-huTw8Rc6w-1; Tue, 18 Oct 2022 05:27:23 -0400
X-MC-Unique: O5P-8lujMpO0-huTw8Rc6w-1
Received: by mail-lf1-f69.google.com with SMTP id
 u3-20020a05651220c300b004a4413d37dcso4408836lfr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 02:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gfdqxzrmHmZKaIqcYHoLx+LsAZjgQDcMzFU65ZPj1bQ=;
 b=KBOydY2ihRrmDi5jaPcHqCQ4cVYOLiM0SrsDXevqs+R6DDHOctOBQnuj5byN4eWFek
 glWLfgs6q3N0M1YztsgBbGY9hQaHBk63YCGtpmL/5YONsRUBQmC7RSvkaS9pIno94jH8
 PlQbOzwc5sTg3UKgAHTsU1W2YVIe0uHpwVo/Z4eHV5oV/IO9uGGUOh3MqzWYfVrrQ8gs
 rv0ikYHkInXyvQO4qPZo2st0mDTsrxSfa/d7uuUTxxCEHilrzpLj8cQgYna6YsDBWjm2
 ulvQQV45zXBeClmRBX+0Su4GZg4Ud7gihr1gKMK/XtqWqotyDi1WfRmaJZ2GRhrOTBIh
 cvqw==
X-Gm-Message-State: ACrzQf3TgISx8USQr5rUszAFo2Uv68qEPD884L3I4mzmzOXm3+nKQeYn
 I67yX3Wb5Uomup8bGyUknAIDqeaablJcaEQPV8yJ6Zh4YJ4u9vK1zlaOnAvznt/2vxtPnVBxLWS
 8EP0ob+7HH6+0rRBfySSlnYYbcqHi
X-Received: by 2002:a19:5205:0:b0:49f:955a:611 with SMTP id
 m5-20020a195205000000b0049f955a0611mr751651lfb.290.1666085242077; 
 Tue, 18 Oct 2022 02:27:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Jym59Fdm7trYx83n+72dlwkb/T6UvX2divBWWtZ0vCvQOSMT6bV5Y42f9HzgmD7UBhQ/tFg==
X-Received: by 2002:a19:5205:0:b0:49f:955a:611 with SMTP id
 m5-20020a195205000000b0049f955a0611mr751645lfb.290.1666085241875; 
 Tue, 18 Oct 2022 02:27:21 -0700 (PDT)
Received: from redhat.com (host-90-235-2-194.mobileonline.telia.com.
 [90.235.2.194]) by smtp.gmail.com with ESMTPSA id
 e6-20020a05651236c600b00492e5d31201sm1796731lfs.7.2022.10.18.02.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 02:27:21 -0700 (PDT)
Date: Tue, 18 Oct 2022 11:27:19 +0200
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/2] Revert "drm: hide unregistered connectors from
 GETCONNECTOR IOCTL"
Message-ID: <Y05xdzMB51BnEw9U@redhat.com>
References: <20221017153150.60675-1-contact@emersion.fr>
 <Y05uYUPoYB25JVpX@intel.com>
MIME-Version: 1.0
In-Reply-To: <Y05uYUPoYB25JVpX@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 12:14:09PM +0300, Ville Syrjälä wrote:
> On Mon, Oct 17, 2022 at 03:31:57PM +0000, Simon Ser wrote:
> > This reverts commit 981f09295687f856d5345e19c7084aca481c1395.
> > 
> > It turns out this breaks Mutter.
> 
> A bit more detail would be a good to help future archaeologists.

Perhaps a better explanation is

It turns out this causes logically active but disconnected MST display
port connectors to disappear from the drmModeGetResources() list,
meaning userspace is made to believe the connector is already disabled.

When userspace then attempts post a new mode set commit, if that commit
uses the same CRTC used to previously drive the disconnected connector,
it will fail as that CRTC is logically still tied to the disconnected
connector.

This was discovered by a bisecting docking station hot plugging
regression using mutter.


Jonas

> 
> > 
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Jonas Ådahl <jadahl@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_mode_config.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > index 939d621c9ad4..688c8afe0bf1 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -151,9 +151,6 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
> >  	count = 0;
> >  	connector_id = u64_to_user_ptr(card_res->connector_id_ptr);
> >  	drm_for_each_connector_iter(connector, &conn_iter) {
> > -		if (connector->registration_state != DRM_CONNECTOR_REGISTERED)
> > -			continue;
> > -
> >  		/* only expose writeback connectors if userspace understands them */
> >  		if (!file_priv->writeback_connectors &&
> >  		    (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK))
> > -- 
> > 2.38.0
> > 
> 
> -- 
> Ville Syrjälä
> Intel
> 

