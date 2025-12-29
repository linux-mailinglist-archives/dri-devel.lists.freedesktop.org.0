Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AF4CE7493
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 17:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F6B10E526;
	Mon, 29 Dec 2025 16:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E/Ark4m3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204AB10E526
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 16:01:23 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42fb03c3cf2so4672444f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 08:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767024081; x=1767628881; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8LjbcYN47mqFb8kcAueaXaw4b4gI5y3yKnVskR+D8YI=;
 b=E/Ark4m3cf7JRbPoI+nPoHAQ0Yec96YezmeYODlQ2q+7gsGzEo6lfrlk3csION3+Bb
 A7EztOVr4ChqsJ+iy1sk1ExQFN3I3ybM+Zqfx29bpEoxEgURcXtrj580uZ5hVMWLS4lr
 JruoK3LD98AGNtMkGF2H74EFUK1arbozFp4oimeSfDsLkMzbDPUYC5/i+bbXSRnMY442
 cWFGNQ3/XoOAJhepgU8rkBP4x+0yHjiBJY+Ri+y5w1sCMBds6KGQHBJbSg9lIWXjE3VJ
 PcRrsGxlLVJ+7WCXFtAyRv19rZnFPTVUIQQUoQyjO8zQrgLB/b7eSs2wyqQC5aTFeSP5
 vkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767024081; x=1767628881;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8LjbcYN47mqFb8kcAueaXaw4b4gI5y3yKnVskR+D8YI=;
 b=v8bXjZ9aquTRNOkS2zJUU4FFjzkTQOS1UhkfjgpoqtEBTq9u1q3pVhaWaSxrZO0ek7
 A+X/YGmze998hNcmLDK20C2YTL/hhHh03C5ax+orAYh/gBWXLJkmlff/5rXEe2ug3ejQ
 nl5VfcWIBgi6wDZYIsxxxG1FvjADUaaWKB8fCV9YrGulokzxCG0TPU0poV+h8nIpTH/R
 7p5VZKgM/6mbGXF64lcJJ9Iy3BD8P8jMlBdenKwTyi0Lctyo08BSplUrJO3s6CESKbLc
 6aQvQeuerdJh4urU70YWVDd6+FIWL6gFCqHctd9epap4JjzarQPmRD8Cq4fr8zp23rff
 LkPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNLa95yIFszl22uiPKHmjBjOt9ZPXM3QLYygHpT6+Dm1cuGNj1/uVZ4PJlf+3uaj7pnKzJwV9TnmA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztqlbFeWl4JKx4HxX5QCOA6iKLLNA5bQYLMHTrQrZ9h/frAaux
 1DTcClpbBX8ETQElcZ7PP349/iKhjCVUlYEYeGV8G6YhXUgqfYDKMyo9
X-Gm-Gg: AY/fxX6OkeIiJMUb8U5mo90/sNwZP/rRioqN7kMqMiFyk1boFSJBOGUG1hHYLs0Z5RN
 5SqCnEry4HDTihfijl98itA1sPtBys2zR747tECRWXYz1yonISL3kYO16LD2MoVww6dY+Y78+st
 U/+qATOJsbrIO0X8RIojSVpf9tEyFDgZlUi3hHHKLDwPKGfz5uHu3gyzPudpFKZeVS4E3+kso0l
 OB7gJ1b26IhFU936BkhJYQRjNnNcMI8b5sKzaJNSDCEJYPZ0/NR0UAZEFSnpO5D3YNrKdKnrnRE
 nJnFPBLvcBIr3pUnew30Bd55W/aE3c9vVvGfwqk5XT2IH5Jdom0z/TspirodXPoSWWg9J63CkxT
 ZwbrJbDpjCnnROoAelvYMMWqkd0MmMC6sLGYMJ0Og7AMCTJqgt88//tf5DIk2o/uC/7r4qnI1au
 NikLtQg67Zcg==
X-Google-Smtp-Source: AGHT+IG8r9WGqtQs5PDLA17aHT0Nt7VdXa7H/dy+z+rwuC7NprcZaWZ3olPk9c8OqhtGcrl17FlxDA==
X-Received: by 2002:a05:6000:611:b0:430:f255:14b2 with SMTP id
 ffacd0b85a97d-4324e4c23f4mr37935652f8f.13.1767024081303; 
 Mon, 29 Dec 2025 08:01:21 -0800 (PST)
Received: from fedora ([94.73.37.171]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa4749sm63847647f8f.37.2025.12.29.08.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 08:01:20 -0800 (PST)
Date: Mon, 29 Dec 2025 17:01:19 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 07/33] drm/vkms: Introduce configfs for plane name
Message-ID: <aVKlz_6knC3AgRS4@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-7-ba42dc3fb9ff@bootlin.com>
 <DF5JW5Z5K9YE.2PCYFIFFMT6G6@bootlin.com>
 <da5db513-1b0c-4ba9-8513-a616895405de@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da5db513-1b0c-4ba9-8513-a616895405de@bootlin.com>
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

On Mon, Dec 29, 2025 at 03:40:23PM +0100, Louis Chauvet wrote:
> 
> 
> On 12/23/25 12:14, Luca Ceresoli wrote:
> > On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> > > Planes can have name, create a plane attribute to configure it. Currently
> > > plane name is mainly used in logs.
> > > 
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >   Documentation/ABI/testing/configfs-vkms |  6 +++++
> > >   Documentation/gpu/vkms.rst              |  3 ++-
> > >   drivers/gpu/drm/vkms/vkms_configfs.c    | 43 +++++++++++++++++++++++++++++++++
> > >   3 files changed, 51 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> > > index 0beaa25f30ba..6fe375d1636f 100644
> > > --- a/Documentation/ABI/testing/configfs-vkms
> > > +++ b/Documentation/ABI/testing/configfs-vkms
> > > @@ -103,6 +103,12 @@ Description:
> > >           Plane type. Possible values: 0 - overlay, 1 - primary,
> > >           2 - cursor.
> > > 
> > > +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/name
> > > +Date:		Nov 2025
> > > +Contact:	dri-devel@lists.freedesktop.org
> > > +Description:
> > > +        Name of the plane.
> > > +
> > >   What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
> > >   Date:		Nov 2025
> > >   Contact:	dri-devel@lists.freedesktop.org
> > > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > > index 1e79e62a6bc4..79f1185d8645 100644
> > > --- a/Documentation/gpu/vkms.rst
> > > +++ b/Documentation/gpu/vkms.rst
> > > @@ -87,10 +87,11 @@ Start by creating one or more planes::
> > > 
> > >     sudo mkdir /config/vkms/my-vkms/planes/plane0
> > > 
> > > -Planes have 1 configurable attribute:
> > > +Planes have 2 configurable attributes:
> > > 
> > >   - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
> > >     exposed by the "type" property of a plane)
> > > +- name: Name of the plane. Allowed characters are [A-Za-z1-9_-]
> > > 
> > >   Continue by creating one or more CRTCs::
> > > 
> > > diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> > > index 506666e21c91..989788042191 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> > > @@ -324,10 +324,53 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
> > >   	return (ssize_t)count;
> > >   }
> > > 
> > > +static ssize_t plane_name_show(struct config_item *item, char *page)
> > > +{
> > > +	struct vkms_configfs_plane *plane;
> > > +	const char *name;
> > > +
> > > +	plane = plane_item_to_vkms_configfs_plane(item);
> > > +
> > > +	scoped_guard(mutex, &plane->dev->lock)
> > > +		name = vkms_config_plane_get_name(plane->config);
> > 
> > vkms_config_plane_get_name() returns a pointer to the name string, not a
> > copy. Unless I'm missing something, that string might be freed before the
> > next lines, where it is used:
> > 
> > > +
> > > +	if (name)
> > > +		return sprintf(page, "%s\n", name);
> > > +	return sprintf(page, "\n");
> > 
> > So for safety the above 3 lines whould go inside the scoped_guard().
> 
> Good catch!
> 
> This also raised some questions on the whole locking synchronization between
> configfs / config / DRM core. I will work on this topic and maybe move the
> mutex / add a refcount to vkms_config.
> 
> > > +}
> > > +
> > > +static ssize_t plane_name_store(struct config_item *item, const char *page,
> > > +				size_t count)
> > > +{
> > > +	struct vkms_configfs_plane *plane;
> > > +	size_t str_len;
> > > +
> > > +	plane = plane_item_to_vkms_configfs_plane(item);
> > > +
> > > +	// strspn is not lenght-protected, ensure that page is a null-terminated string.
> > > +	str_len = strnlen(page, count);
> > > +	if (str_len >= count)
> > > +		return -EINVAL;
> > > +
> > > +	if (strspn(page, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-") != count - 1)
> > > +		return -EINVAL;
> > 
> > I see you effor to make this as clean as possible, thanks. Still this is a
> > tad ugly, and should be moved to some common place at some point IMO. For
> > now it's fine, but if you need to add more user-passed strings, that could
> > be the moment to move this code.
> 
> There are multiple "user strings" in this file (notably group names), but
> currently without limitation.
> 
> I can create a tiny helper and limit all user strings to a-zA-Z0-9_-
> It will technically break the ABI, but I don't think this is a big issue.
> 
> Do you or José think this is a good idea? If so I can extract the helper for
> v4 and send a separate series to do the limitation on other strings.

From the top of my head, I think that at the moment the device name is the only
user facing string that is not limted in code? It is limited by the allowed
characters in filenames. But I might be forgetting other custom strings.

Technically, it'd be an ABI break... So, while I think it shouldn't be an issue,
I'd prefer to avoid breaking the ABI, but I leave the decision to you.

Jose
 
> > Luca
> > 
> > --
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> 
