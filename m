Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E05A198E7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 19:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEA510E743;
	Wed, 22 Jan 2025 18:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GKZZDrYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D3310E743
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 18:59:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso122438e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 10:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737572303; x=1738177103; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GSoJDpvIW5B8ojaONnLtMOlBTJD8hhUGZBtBrFXKmJQ=;
 b=GKZZDrYaf2jEjtv1SJ6Y/MkWBh3k67ORmSWA/+5WcfDh4OADPag5HLOkso6XMGCEvt
 fKNHQ3KiCXrUsFTOkpZ3LOMS7m3gd+rPznK3Dkl4BC+aLwOlkJsgvFR+azvXRdPqFTOm
 NgqIgOlzcuXxVpfFS8Z/zVLkxg/xYdrcZe7FHpwWvf9dL1Fwz3xv2crSezup/KBCBXAw
 Umr+Zep8OuHIhJcSxezkda5E1KC/veHQUHoKy2n31iEionM7mMsylyWlTM3PTdv03sx2
 cWGzOIJV6tM3XSxeM8mZejyG9bf0lE/Fw6Caqw81Y8NaYlEdhqbJn6xKLiaGkMILUgiN
 pILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737572303; x=1738177103;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GSoJDpvIW5B8ojaONnLtMOlBTJD8hhUGZBtBrFXKmJQ=;
 b=HLM8IVw/cxd3zgmp8ciJ/BqNd/+aigZVfO3bCIdb8pDzTT2sklqYc3L1O2mTLBYNPh
 9PF95S4WARLcxNBfzh0t5RwkUrfLEjcmbbjEe9BvPkrVmWWDJvTYr6HipcscCdcalCr1
 TLMvcxfJnEhf2jdfBb603Bn/8ZTLvoNVFwpVT/MaWJmQlS6SP1R+aEGknDw6xiFl+mlo
 OnMdgD1X5NyrdQ/HFsdDfxQmLah4tIuGDPHIF482AjGxHivXfc9rvVqvBrP/BWROnfR5
 Iu10PBDnUZhiOTtV+cl6NfXgqJYjhA52nJLCjiuEIFwfj7GeOq9EI/8IV2rd9ASnvjrV
 mSvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaRXDpkV1PMe1nPzAyqCGAARtxcoxAm0W5pBGNc1x7lveH3tSfB6G2BCEUgCDNMjJrWm0cpK6mXlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgshTfRUY62lq4/HenJatS99/tc+v0S7sE0VU9aH0YFb0ldoLW
 OEw954RKLgkUCoHyVZn+urLYLxDqY1VcIYrqzgpDWMrA7eUjO6ATv/hQp7GYbZw=
X-Gm-Gg: ASbGnctG+OIaLkO4I+g7+DvnRotFiXANp0Ra4BsBfokzjdXbuRDlwoyKOrHP/bwCph/
 vosnG2D/ObYCKJSS+hfLbnNKPAjHg356AiftbyaCF3KfhjavibQsSp0dtsQI6HVZAjMgRzkbbvG
 sEeYXXI/Wi9oPheuz7vcXIfh1Q0paMeXtig21ddfk3QNzUlN2F+4S7OscC8Aqp5SW2AATx39G9t
 t6rHI7WD5DualhUQvgnrZW3JUm9cax6WkeGSzwRhNexPHtO1kea4YttixclYfV92Y+ZYq23ewKm
 se5hhS8Ed1HFZM0CLykvjPlu7b/JckDVocqUzh7UuhQvh8zPUA==
X-Google-Smtp-Source: AGHT+IFrtpqRxJkgLUrkX3L9FcaQMult/UuvBM6wVVKrgeZ4I6/MZ9iXcVuJARwLa4wkXsRApaUMLg==
X-Received: by 2002:a05:6512:3409:b0:540:fb1a:af1f with SMTP id
 2adb3069b0e04-5439c282970mr9780886e87.39.1737572303319; 
 Wed, 22 Jan 2025 10:58:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af60986sm2376322e87.119.2025.01.22.10.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 10:58:22 -0800 (PST)
Date: Wed, 22 Jan 2025 20:58:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: kraxel@redhat.com, dave@treblig.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Subject: Re: [PATCH] drm/bochs: Do not put DRM device in PCI remove callback
Message-ID: <4gl3nngcvfuf6hd5egpqhsltoq2uxvtgel52tapk6j65hpch6b@2l6em2dnvfai>
References: <20250103095615.231162-1-tzimmermann@suse.de>
 <9dadd98a-7c3c-4e2c-8332-fd0f5a96b670@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dadd98a-7c3c-4e2c-8332-fd0f5a96b670@suse.de>
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

On Wed, Jan 22, 2025 at 08:37:51AM +0100, Thomas Zimmermann wrote:
> another friendly ping for a review of this patch
> 
> 
> Am 03.01.25 um 10:55 schrieb Thomas Zimmermann:
> > Removing the bochs PCI device should mark the DRM device as unplugged
> > without removing it. Hence clear the respective call to drm_dev_put()
> > from bochs_pci_remove().
> > 
> > Fixes a double unref in devm_drm_dev_init_release(). An example error
> > message is shown below:
> > 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
