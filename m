Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E3A3C060
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD3810E7FA;
	Wed, 19 Feb 2025 13:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W5f/W5bI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8AF10E7F8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739972812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UcJkjuEi1yYJnAiutiiyWh7ZzRjqlpKOLFtDnGJIPCQ=;
 b=W5f/W5bIw1GjJ0UifYnGvvdJN9GOgRhGAMnX/xKyUExs2wkfReRetcud3NJJvQ+VuXfiWI
 LMkyhdSkrg1ssNvFeqwud8Q2W8lttzMOB2BDJHFFmhRyMHp4owzWmpz3YT0hn2aKT4UVHc
 At59Xo4+0gTXS8Sp2gf0JE1wbnk9LBI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-ClLX4bdxM4a707DkMAKzhw-1; Wed, 19 Feb 2025 08:46:51 -0500
X-MC-Unique: ClLX4bdxM4a707DkMAKzhw-1
X-Mimecast-MFC-AGG-ID: ClLX4bdxM4a707DkMAKzhw_1739972811
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0ae84aaceso293395385a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739972811; x=1740577611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UcJkjuEi1yYJnAiutiiyWh7ZzRjqlpKOLFtDnGJIPCQ=;
 b=iZO59NTc88QQ78OzfiqsVpM9XO7Sb4q0YRaXnbSnaqem95Ply3zBaN7oUXc2upLtf4
 BAjULMpK/sU/00nkParriNSSar9TP7x+a9MbQduGQP5a9fvUqEJn7brKqLHFvJYDr5yg
 jmMsHxbkQKi/PXZABnzX6TL7A5A3rxUuHahN1C4XuZHLYAb8y32uxOXS9V54DbXL+lXe
 34T9TB0A9WBGLPSldz8VXpGxacOxukMN27gs1QBhnccTYYmhYXQwuFe9SF3u27aMJiCK
 RGZ9w1BhlRqscy+bBeQqOBHPBBFnNjh3AFKo3l7LPONWjYJblK9rRDoSdbhYT2mLVIbj
 stxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgNwTln2qMq1PJujrtat3QkeEIIwR4gvoW5nG3RIDBhHE1a5daYJPOyCxoLDpJ2fjAIps56SDldk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziEDffeUVY4P1OtTQ9fwSAszLCJGqJ0TDrz9fBZiSczbhd64Dg
 abmhKR64IBL871nkHkoxv6RQE8aGxNEMKoALgcrTyql7anMVLz6PxzYmrDSkJuIMPJB8pheY4iV
 v0uypDOPyDWpqO1l9nmGqEp7B/45yF9wcyFuP2pXme2pj8tYnLEsdQ/A+wX3Ba7xydQ==
X-Gm-Gg: ASbGnct2Elsm01pS+lvAzLoF+iZ/RvkZHLbDwoW/6ZZEn+Im+CtP98bij/3JI5U253n
 Loz1wQK9egyT33eHshssJZKx1prUu/2GpJZO+OJ/xFKXXFrORA/wnpxqvQTgpDIEUKhH0J0nJTI
 kQzM28+bWtjWFgValBcxWQeIWKjVpoNIFFAANsxCtIE2lKPvVKmY0zJdwNwDRLP5yeQ1Q6vNBto
 V9sr6d6LCjS7jXWGNpCVcDYeKRSzTPSkvIyKi+PmEMOY23DFlZfY936+um+yfQfuuzaLtHKK5Me
 RFnOpiQ4gdQKVw==
X-Received: by 2002:a05:620a:4805:b0:7c0:7818:8554 with SMTP id
 af79cd13be357-7c0b534e809mr606130585a.36.1739972811001; 
 Wed, 19 Feb 2025 05:46:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvt4PQDCLcNiUnb5vuuQvPmYW2M9pE931fM7yXu2Gz/T9k/kTKHHri1sWt4hM/n19iDe3ROg==
X-Received: by 2002:a05:620a:4805:b0:7c0:7818:8554 with SMTP id
 af79cd13be357-7c0b534e809mr606126185a.36.1739972810650; 
 Wed, 19 Feb 2025 05:46:50 -0800 (PST)
Received: from polis (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c097e43fb4sm394598485a.107.2025.02.19.05.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:46:49 -0800 (PST)
Date: Wed, 19 Feb 2025 14:46:46 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 1/1] MAINTAINERS: Remove myself
Message-ID: <Z7XgxkxGIJm0OAue@polis>
References: <20250215073753.1217002-1-kherbst@redhat.com>
 <20250215073753.1217002-2-kherbst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250215073753.1217002-2-kherbst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5nq77rIreafDevf-fEo_OHly3BhJsFKLv5LwfX95L-k_1739972811
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Karol,

On Sat, Feb 15, 2025 at 08:37:53AM +0100, Karol Herbst wrote:
> Please respect my wishes and put this statement as is into the tree.

I applied this patch, as is, to drm-misc-fixes.

I respect the reasons you have and that you do so out of firm belief, yet I'm
sad to see you leaving this community.

Thank you for all the work you put into the nouveau driver!

- Danilo

