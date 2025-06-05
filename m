Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B7ACF9C1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 00:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8090710E316;
	Thu,  5 Jun 2025 22:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="fmCg/mxG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3575510E316
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 22:40:47 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-747fc7506d4so1648231b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 15:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1749163247; x=1749768047;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i3XRef4zDuCQauIuNRbzA9mW3YSWFLlP07Q1olUtscM=;
 b=fmCg/mxGjUEZCz/2r63PXzTtE4GuAENF/e85kfRGJUWHYZc2dtf6CBuTaT4t5IfqvS
 fCdwC6IhRnFLiaTHEXX902PC1JDkO1HpX93Fc3G3BGMP7P8YNAEF7TrLPZ8Xd9xWsoSV
 uB+zdl5jo3GgeMQf/NyTwIxmOUnucJebVbqTTPt6+gY9auhzZy/q8c8CgthjsUOvIQZr
 RuVgfpr7p4n3rpfF3mHp79TbYFUG3JBXGDMA0twGrcWeUYvqzkheFl27ggZ5Xu48apzl
 a/HfWJzaxlSWH6Ig/dLa/9mRAZ6pjQMSQYDWJUyfHoIuzXrIaDH6i+WwVj5h1gS6TNkL
 f68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749163247; x=1749768047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3XRef4zDuCQauIuNRbzA9mW3YSWFLlP07Q1olUtscM=;
 b=nr9UuD6cxt/ziku/KGJAjSKexZn7bOIvW23/iJhjOByxZC5Zbob1ZmopOs2irdeKhb
 PnJk031oNVqxCeiZkno5GOledW9gk0Ksk5kqqdG5K5YXGZZYx99capSRVDkOUOYJllpR
 txIJqyyPhu8cSAQ4V+BGZBIv++77XP/a1sl2LbqTZDUZkK3Va/Cbs22ckZyywRuKmHRi
 jSczg7kzcbBLclukZjzgowmWrCfGdH42ZrQY/A3ITOa9A4zDFcC7a7P3R5n55u5fucoq
 jX7uzoE+JvLvtNRo8P+b4W0Q5ElqMgXr6m4/lB4YjN7NL4fFV/DXlyofLbSzNv7KsFK5
 tnVQ==
X-Gm-Message-State: AOJu0YxH0/z5P2Y77n+oR3Y1Hi2L4ftvNqLl6zaBK3d2w2UKxWLuUATf
 44nX4vIOFyahIPf/7mTwDSQXDmHYhfu7fA2HJCbeZa2068gGXKxtRwDNtcbYcqFO88c=
X-Gm-Gg: ASbGnctYL8XZogTVKj5Dvw/4Af2LjXvAxX1JMZOd04i2rmLOuye7j5lsr/+WRpVhD1V
 B72lBHkWsm24BIjunWYBm+ZnuQ7j726KPVLzbxyPDYjX1ajVaj4H4Hx2s7uvUxXC7mavvwi26vf
 nYwu6LS0yxFeoEAiteeECY5yqS8IXO8gRR0Gh5/ZgKG/Yr2isc8Pp+hzZkUzWF+Dr8mz+imHT23
 TsXxNFu+cyjyLSub0hkbbNFQrz/WZnxpcZLqIdmUHFhZfe8D/dQhrM0El+u1WRN3z3I0Qs/FJyj
 Y9XSxtT1Tdt/qrFKVA8lpWJ3i9x4JZS/b3BCzrxxDrOCpg0e/QaxMn9U9TX5ZLwe433NVzwKUJL
 icgMXtJYehUlETVv8WmktUzOZnig=
X-Google-Smtp-Source: AGHT+IHsuk6xC39JuTULUnz/mgy1vWlPtaOQuPMK0KT5DV760lyRTW0pS1LzgrKLs8q6uHzhpuoooQ==
X-Received: by 2002:a05:6a00:6ca3:b0:736:34a2:8a23 with SMTP id
 d2e1a72fcca58-74827f10b6bmr1576020b3a.15.1749163246942; 
 Thu, 05 Jun 2025 15:40:46 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au.
 [49.180.184.88]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af3835fsm172912b3a.27.2025.06.05.15.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 15:40:46 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
 (envelope-from <david@fromorbit.com>) id 1uNJGN-0000000Cjri-3Kmw;
 Fri, 06 Jun 2025 08:40:43 +1000
Date: Fri, 6 Jun 2025 08:40:43 +1000
From: Dave Chinner <david@fromorbit.com>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Dave Airlie <airlied@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH 2/5] ttm/pool: port to list_lru.
Message-ID: <aEIc66oP6moZF7lv@dread.disaster.area>
References: <20250605061951.1234583-1-airlied@gmail.com>
 <20250605061951.1234583-3-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605061951.1234583-3-airlied@gmail.com>
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

On Thu, Jun 05, 2025 at 04:19:22PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This is an initial port of the TTM pools for
> write combined and uncached pages to use the list_lru.
> 
> This makes the pool's more NUMA aware and avoids
> needing separate NUMA pools (later commit enables this).
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Dave Chinner <david@fromorbit.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

I can't review this in isolation. Please cc me on the entire patch
series and the cover letter.

-Dave.

-- 
Dave Chinner
david@fromorbit.com
