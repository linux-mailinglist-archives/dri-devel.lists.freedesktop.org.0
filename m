Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615D3A7631E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F01810E39B;
	Mon, 31 Mar 2025 09:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xz3XVtLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1F210E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743413050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PoBCnj+9f2Z438qoWFLFepV7OurqIheox2I9kA5C3aY=;
 b=Xz3XVtLAeeGMryDUsYAFw7C7AUn1dT/Jn7staM8lvAHtqgDUOW2AJ7QIlebxrcTcS5/LmI
 ZvN063SmaPtuGvfqhcjmgu7FIxXO1MmElMie14k102UObOEVovZLruMV3GE+qJM3YAL7BL
 fHx2LjdQeVFe6L+SNqeotZehh5LTQ8U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-dK6CKwN-Nk6ubrpgm9SFgA-1; Mon, 31 Mar 2025 05:24:09 -0400
X-MC-Unique: dK6CKwN-Nk6ubrpgm9SFgA-1
X-Mimecast-MFC-AGG-ID: dK6CKwN-Nk6ubrpgm9SFgA_1743413048
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43941ad86d4so21435865e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 02:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743413048; x=1744017848;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PoBCnj+9f2Z438qoWFLFepV7OurqIheox2I9kA5C3aY=;
 b=atAHgaXiF12KclVzG6+jksJQjtQSaLrui9I+uuLpnhLRAr1ffs+fMoxJKiF1Z0XdXs
 vH8w/ecE3/mPgJETxH5h3SGxaWEz2YjFFjajfLOaRrYmG8J+b+fNq3a3RbKaR4uXEa5D
 Lpegu6ipqVQ5tpZ1uMxyeiTUEsyo4v9EgZvYQXtzYUbzo8txgffHRwUm5Dheg7VqEUiJ
 YXOIBd9nw99j0Jhp7n3bBe19Nse82FU+MJVcp5zFVtRm94O8TzHseA6ARjlkumILJ5JX
 obOeFfz3Q98zjbjIb4GMlBySSXHGrXgifYAwmDM2hRHnm/ZhBJ92KSxFExfsvCHPfrxq
 kXVg==
X-Gm-Message-State: AOJu0YxhtJez98L5MtWqNTjbfz2dH73+JJul3c4gisNkhvHd+04o3bSY
 sqkDu++a2vdQf3FejPo7vwUACClQdowY3yllAUMP0UHAr3hJmuBnJALCzl9Z+Ed068SaGZtyCky
 3gzXJ6uJVWOR7YJ8BYAuylt3t+MSC4EKqTkOkoxqVKv+U+dlPHudLekAzmVIqcqDIqg==
X-Gm-Gg: ASbGncum4dwbPdAW79zSrcgsmxwjXcely6ysBzlIAvrQ9xlIYdCO8VCig7hiJ/RANaM
 dQTPDCNd1k7pCGXV7XibXGbZXls/zi3CRqQKymQ8dcpCsGgcZWWNY/ymHNewJu9tbmbEXHXkgke
 63SFVwAPMZDCGHxXlvZNj6WjLlxriucijrV87vGKr/9Yzdnz7q4T4E3yVX7kAJyzL9ErbGEf88f
 7qEV69IyDbHmM5+fiQiIRogvkN2kWdRFxd6OBMpnAlzNDtbEmcyCDIpD6dNXBwwtFbAsp1Jj7Re
 OEuquuNs8vrdRzeB5E2OVt7ci1lGlGKdC8QTTu929C3eHw==
X-Received: by 2002:a05:600c:444c:b0:43c:fceb:91a with SMTP id
 5b1f17b1804b1-43db62273admr60207765e9.11.1743413047953; 
 Mon, 31 Mar 2025 02:24:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW3N1I1Jzz1khdYTC2IypmEufSdzxip14knVfQUMDfDyZd2XGAqDycO/vm/QS0z4/BBrWnRg==
X-Received: by 2002:a05:600c:444c:b0:43c:fceb:91a with SMTP id
 5b1f17b1804b1-43db62273admr60207525e9.11.1743413047588; 
 Mon, 31 Mar 2025 02:24:07 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fccfe2fsm115922135e9.22.2025.03.31.02.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 02:24:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 13/18] firmware: sysfb: Move bpp-depth calculation into
 screen_info helper
In-Reply-To: <20250319083021.6472-14-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-14-tzimmermann@suse.de>
Date: Mon, 31 Mar 2025 11:24:05 +0200
Message-ID: <875xjph7t6.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iVBPZt1R5f2mUJUV5BIuIXHKIwLEs3-8wKrNCllqsf0_1743413048
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

> Move the calculation of the bits per pixels for screen_info into a
> helper function. This will make it available to other callers besides
> the firmware code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

