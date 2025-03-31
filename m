Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B88A76305
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D859410E3A3;
	Mon, 31 Mar 2025 09:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Nix5BTXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630A410E3A7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743412508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dIPg7v9PWrnXuztMOqrsBl/3KFVgAFN5ypabDYZM8+4=;
 b=Nix5BTXmDx4HSW+gDkJRmQpfTScYx+SZYiP5wcUT6Xsm7FurvWOB/3gyY8QJgAmPb5QdYB
 oxS/UfZnDhjFrpowkQZddNfk+qGDGNukwCqljTvv6dw2ZtvT4i77irAypgFOLtal00yUrR
 N72TlIz3Z8vtYxomtHt1wJVR9KTI27I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-sDtC9z5kNpKMNt-ZqLGs8w-1; Mon, 31 Mar 2025 05:15:05 -0400
X-MC-Unique: sDtC9z5kNpKMNt-ZqLGs8w-1
X-Mimecast-MFC-AGG-ID: sDtC9z5kNpKMNt-ZqLGs8w_1743412504
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d01024089so38710205e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743412504; x=1744017304;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dIPg7v9PWrnXuztMOqrsBl/3KFVgAFN5ypabDYZM8+4=;
 b=eVxqOYE8QhTIMC9uVvBdYxdTwldv5EiBNn56lI4gKl9roZoRORRgwCaV0BiG4mvN4c
 WyhMLTG2nWGvcmov6F/DIzuzRCmimWrgGSJIzMOp9511/xmNOU15i4EhM07JdDQtX2k2
 KCq34eaffaReroJCrSmpjUxtAk5KbsfE4r20EmwcFFMKWHLmsuPPNKI4jfJXcRR44E16
 KTLGaEa2NJccDuexIgk0K+AoKlUeKJma1/UgpWt1J8LXK6oMuaiwXPmIhC1SYDLHOd1+
 E1qnj6iP0APsTDLBOyoKKokp5IqZimP3BQqxQja5JO6k8qpB0En06Qo581WOavj9Xaed
 aeCg==
X-Gm-Message-State: AOJu0YwudjqBLV0epIDrRkxczhQsQMkX9N0yfxnmmEDMrdGYN2rFW6VO
 hxBeICamNrzvS/g/oytGXi/5AGz/lkPf7UYzky1sd5PRSZJx6hNLTidFUVw/6459FP2Id5/zkZD
 f0XyoUwzn2j3NNQvffAQF0eeb5yd7A98WesPyczk9Sc9EFM04li3Q7N+v8txXJRRkEQ==
X-Gm-Gg: ASbGncvDx2OXcZINAOOh9/ogPCv8WFOQ9gDFRMLo/UcidE3HU4+kIJp+rK2gZ9pPIps
 +qL03/5odi3sWmvbsHBCQiVWHRRLOpYEKI6tpSqoWKHnk8edecmjP+uq7XVQHRiJY//HKZ7xaRr
 1U3s12gFseAHpso5WSqz6L0RNCeVcd4q/MJzD9UhNKISvp7/9RPA43RfnJcYcWyrOCgG6dohxXE
 w8OXr14d9gLNx/eiLOMgCtccVVKXdV+ddvgQzoVd9ebE1rQeZs4rhqFkDWVIgDMKsZMuGECiRog
 Yy8b9SfprtUtq5aariZa9wwsct29a3sTwxU7qUWpH1rufA==
X-Received: by 2002:a05:600c:34c1:b0:43d:b85:1831 with SMTP id
 5b1f17b1804b1-43dabe240cemr86218085e9.0.1743412503966; 
 Mon, 31 Mar 2025 02:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtV1tQJ4FhMofXKHnysvKtRIr+Tk+VGzkTMEZiC/A5Jqhq24xxB/dJHkTF6/ffSrxxF1QGbg==
X-Received: by 2002:a05:600c:34c1:b0:43d:b85:1831 with SMTP id
 5b1f17b1804b1-43dabe240cemr86217845e9.0.1743412503647; 
 Mon, 31 Mar 2025 02:15:03 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8f404ac3sm121383475e9.0.2025.03.31.02.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 02:15:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/18] drm/sysfb: ofdrm: Add EDID support
In-Reply-To: <20250319083021.6472-13-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-13-tzimmermann@suse.de>
Date: Mon, 31 Mar 2025 11:15:01 +0200
Message-ID: <87cydxh88a.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 77wkwrw8iR80GUf0oFDyn2n1qD-xtuJYgp1Vv-I2U84_1743412504
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add EDID support to sysfb connector helpers. Read the EDID property
> from the OF node in ofdrm. Without EDID, this does nothing.
>
> Some systems with OF display, such as 32-bit PPC Macintoshs, provide
> the system display's EDID data as node property in their DT. Exporting
> this information allows compositors to implement correct DPI and
> meaningful color management.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

