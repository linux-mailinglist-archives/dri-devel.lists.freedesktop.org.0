Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC09A858384
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 18:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C92110E631;
	Fri, 16 Feb 2024 17:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Qj+kMHi5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCEA10EC6A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 17:07:41 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41205578012so1600995e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 09:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708103259; x=1708708059; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ijTea4rY9Z92lLGWfWJZg4eI/pmK/TMqoH5QWxKStbU=;
 b=Qj+kMHi5KdMdQZtDdIly7Mqn7NI6/cFReTDMN9vT7TDZ7KY+He3HsGwozMXQewO1mj
 rRGyIGVpgBTeBJRTs70d+5F4PJZw6ASZkPNt2gUH5YaFq5wO9BLpvIUXaShyt+vuXlUG
 OZ2ziupbFv5hM63SKRzSBOA/LBkExfUUcdPn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708103259; x=1708708059;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ijTea4rY9Z92lLGWfWJZg4eI/pmK/TMqoH5QWxKStbU=;
 b=Xm4wtphaE8zbrI5DWxNZ9zZIA/brHfqWpfImrsiCBE8mOoskYizzS5hSkh3lYr3T8a
 lyartfYauHbys4mP50ntdEn35cPpmxNLUgAKzVK6/uxylgWrVyaf3fQCkq+wWL3rVtKX
 IgLvyyqyfQeHbyKQTqZmL1QPa/rXj5KScj9llc5fZQf9nkSSBXmZwlGBMJ3HjoWLY7ah
 vN2bKf4HvaIibUKOtDYv5CpergPfWjszlqHWeoNEAfwAPR1rR7TxqrbaVWCwllqrc+2Z
 5w3+9f1VBCyBx1U2jpVMykx8CcuJ1klV23xr1SpEE02hv6jjgGor/EC0EVscCHz2l/81
 Sy2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZXaVYkssRkhJa89uqKcCVOyKWnCkV5oFmzvR/IUYBvccj0xz//h0jUNS2k5lq0cXtc0YfAvYkjcbrrjDW1K0MfI1n9QBFTH4waMfp8DUF
X-Gm-Message-State: AOJu0YzmchwbGnIuwv3HMIS9MmQ/pfNQwSXK28rycvm7m8GvafCIZvb0
 3cSrZTMPvMfGQfgdYhgSwVwosy9ngogtPNT6amYdVwS+NMVw4Pbw9m/kcEqcBfc=
X-Google-Smtp-Source: AGHT+IHUqALZqMVn2fADheMNqneRMmQ3MvAb+MA7p/LnwiMi9nfwmdjzZU7ByFi7IURD8OofvvbuPQ==
X-Received: by 2002:a05:6000:803:b0:33d:1d45:c658 with SMTP id
 bt3-20020a056000080300b0033d1d45c658mr1572596wrb.6.1708103259500; 
 Fri, 16 Feb 2024 09:07:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a5d4e8e000000b0033cdf1f15e8sm2702656wru.16.2024.02.16.09.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 09:07:38 -0800 (PST)
Date: Fri, 16 Feb 2024 18:07:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: airlied@redhat.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] char/agp: remove agp_bridge_data::type
Message-ID: <Zc-WWH8_UNBCOlri@phenom.ffwll.local>
Mail-Followup-To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 airlied@redhat.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240213111511.25187-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213111511.25187-1-jirislaby@kernel.org>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Tue, Feb 13, 2024 at 12:15:11PM +0100, Jiri Slaby (SUSE) wrote:
> agp_bridge_data::type is unused (and I cannot find when was used last).
> 
> Therefore, remove it.
> 
> Found by https://github.com/jirislaby/clang-struct.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: David Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org

Thanks, pushed to drm-misc-next.
-Sima

> ---
>  drivers/char/agp/agp.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/char/agp/agp.h b/drivers/char/agp/agp.h
> index 5c36ab85f80b..67d7be800a7c 100644
> --- a/drivers/char/agp/agp.h
> +++ b/drivers/char/agp/agp.h
> @@ -138,7 +138,6 @@ struct agp_bridge_data {
>  	unsigned long gart_bus_addr;
>  	unsigned long gatt_bus_addr;
>  	u32 mode;
> -	enum chipset_type type;
>  	unsigned long *key_list;
>  	atomic_t current_memory_agp;
>  	atomic_t agp_in_use;
> -- 
> 2.43.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
