Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F132AD6FB8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAFC10E805;
	Thu, 12 Jun 2025 12:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I36WF1Z1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7883310E7F2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749730011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+6AfO1YybxLGPmROnZhI75QLnlG9tkbcH/GZMCHyp4Q=;
 b=I36WF1Z1cFB+NsMwY1ehWPPd+sSVT26J/OyQ/AreWUGgi6t6btt5yTFkVrZyDQVMyaFViK
 4s47XANlN9izc3ye+tvc/7Iy0aZsLPmytorH52DIns0SBbVVBG0m9PSVP6PEpYYRcevwEY
 olD25FFgkSHeKJuyBeg3omh6VjbjlBk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-1aaKvJ6pOQmT0jaBi6bgiQ-1; Thu, 12 Jun 2025 08:06:48 -0400
X-MC-Unique: 1aaKvJ6pOQmT0jaBi6bgiQ-1
X-Mimecast-MFC-AGG-ID: 1aaKvJ6pOQmT0jaBi6bgiQ_1749730007
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-452ff9e054eso4692365e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 05:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749730007; x=1750334807;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6AfO1YybxLGPmROnZhI75QLnlG9tkbcH/GZMCHyp4Q=;
 b=OrhXNtMIFrkRX8SXYfROYWqpMzwkz6t+gROKZbPc3x9fKWHTUBQ8h4OXejfT+le96Q
 AgJ/XQJoY9DAgohAREAiatxq1n4mq/nq9MLMwwc87QHNDsxRPHob8ju2SdryLzMsvmkT
 1nDKPE9yw0/odBFWiyG0ptV2WbrmEcSZgRh5tUY3Mpzvk23lIQnf/bok783G0GNcYH6i
 CxEEDS6p2lW+IrEFzBsluvNlG7L4AN/z7kS+s9lIdfsIX20MHprESuqMepQ4oq1oSt3N
 jUs7vvMsdJAOlTph0iGNPXdjuyZNt+S3LANwVZgaStcux1CwOlbzuc3MWCDarjYxuTc1
 Cb1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmPN6fGPdF3Zcc+Ijh4RlnxwNBVTAmF0qf4seRoR9zYi4a9FuoBOQQR7U0NEwDYclgr2sbRdP6laY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/oTNwz7lTv1BBiOulpwi6d422nXb4Cl5AHTMNyNGl2rB0uwEU
 D3JiH/SnR6ytEuOrgGAAyGPXKijAdAT4GniKXJFqhV5BL9kBmjyc9NqP5G+HQgv5Oe6FvFfKyK/
 Xj9AsbM5xwSKfJseoBLjwuUtzYk8kZGD+yVQn8lS5R0of8VVoDX14MI7Zv4LOAw3EKMalUw==
X-Gm-Gg: ASbGnctFHeKn3agK6T1mu9MAe/USvCeJ5d+CP+PD6OsFjz34jf1j6xKHrozurTm7aqN
 LA+uWdwBz1BCkE3B6ujXhxtmgiWGIBV3sk7L+vVLWN+NhHHT1TJhxtOjLDVpQ4ZT1TcwvdKxfXO
 wGOBIrp7i6Ihp3WGzgzQ0QgeLaoWvV6uI345QPzYgdq9+jeROhUqSeadr+QVt7WlZYfg1M0bD+6
 4BAVed9w32hI13lhue7PbLsNu68wuC05BpPEm95c/eaHmVMNFPHjRp6cRhSu54tEORIjjP2BlJ0
 S/KYyYUuifTvvcorsLboVB7Sf/f7tHCj5wx77SjEtAMPlWX8XXjHfBtux44a4wzAYi/kN9Btsbl
 Pp5cD
X-Received: by 2002:a05:600c:4f07:b0:450:d3b9:a5fc with SMTP id
 5b1f17b1804b1-4532490d350mr60458905e9.27.1749730007374; 
 Thu, 12 Jun 2025 05:06:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECOqBPukEfbMMYv+M4kFQvSfoApbouCQboDsRv8ZIe+hsTnwqXQ+pN68YZ/SnG6HPde8Y/Ew==
X-Received: by 2002:a05:600c:4f07:b0:450:d3b9:a5fc with SMTP id
 5b1f17b1804b1-4532490d350mr60458475e9.27.1749730006945; 
 Thu, 12 Jun 2025 05:06:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e224888sm19001155e9.1.2025.06.12.05.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 05:06:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: fix ssd132x_clear_screen() columns
In-Reply-To: <20250611111307.1814876-1-jkeeping@inmusicbrands.com>
References: <20250611111307.1814876-1-jkeeping@inmusicbrands.com>
Date: Thu, 12 Jun 2025 14:06:45 +0200
Message-ID: <87cyb9w4dm.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tfBfsvyoq2zweRQukTsMprvQMCxMbVAJ1r2w5kYnpeA_1749730007
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

John Keeping <jkeeping@inmusicbrands.com> writes:

Hello John,

> The number of columns relates to the width, not the height.  Use the
> correct variable.
>
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> ---

Pushed to drm-misc (drm-misc-fixes). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

