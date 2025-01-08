Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B2A05B09
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 13:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C9F10E090;
	Wed,  8 Jan 2025 12:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YQv3Vzo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2AE10E090
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 12:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736338181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=woB6RLNnYWwGsPdeyszHqqKP8mFzUvVoDPk8opasuVA=;
 b=YQv3Vzo4lSkzXF6+nxc0hdQUNg/DNqpA8bf40BskgXXHmHjdqQssO55lLTlDCMRgZQXxzp
 MhTr2xTcXcnlLrAujqiXRRvka1gQEdWYVjshtxaSxg6xNOa9yldNoc6CtX5LKY6sTSanNW
 ujJr80YGH+7qpx/lOWyMAf++9K4g3T4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-ixeagU0ePouyf8OZ7ji19Q-1; Wed, 08 Jan 2025 07:09:40 -0500
X-MC-Unique: ixeagU0ePouyf8OZ7ji19Q-1
X-Mimecast-MFC-AGG-ID: ixeagU0ePouyf8OZ7ji19Q
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2ee5616e986so38572355a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 04:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338179; x=1736942979;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=woB6RLNnYWwGsPdeyszHqqKP8mFzUvVoDPk8opasuVA=;
 b=wj7YpA5UCzpaOxEsLbyKx3SOgsZvaMERtYo2aOXNNWoK8qbfMp3bJ2MSs4szZ21iVa
 VuO+M3q5PlMNepdO7tgIea7vSup9Stv2CRmnf7zgQzRHIscQRbxxJ74XSgF0yMiRHrdR
 rjC968Lil4Aem/0UluTKN3/UPeCfxzcr5sNnw7KAtKPn8o3VqX/zI9HkTPzpJIY7p04e
 yXlaQbYV6qVqvmhZffRCuk2ZjE+Ev1KRAhUOMi8azwCSGX/kQ44p0C+ZuBnIicHEFC+c
 xVlCu6Au693wPv6mjVQyLwly5eTqkWxn1zHEDPmu2ABLOulWc4JaQYM0JSTVLCc5Au9Y
 Ol1Q==
X-Gm-Message-State: AOJu0YxqHR2vMa47Bf97qjLwg2WNZsFdY5OqNDNjJHUC5jAh0krfwHVb
 WG2h0Z0j66hrS9pPVcgWkbrSEeOEpZXJA4KzZFuDu8rhjgPRLkyvdWvdW4ePqhr6B2S3gg5Xv0t
 olYWP6BBkkIjKHfO0jYxj3djF4v9HbHB0kkNJ3KmuYQNVyK5xSk3x36khY9ZGeVuegQ==
X-Gm-Gg: ASbGncsmgOanAC2PJo52ql7dyAdPeWE2Xf84UQis7bzBaGCBVieshlBw6FHXSQ1SrTs
 P0QtdRaTH/NExG1vFlmvA4hLtMaPtDJO8b2vV0yD1sABGsqqU2AktHp44kCG7r64gzvOTYUgziJ
 vep8rVnzw6z37iZEEUPlOIDpFchbWNrLxC9i2OOkazjqBj5E642AZN2ObSKTVZV+jjmtsBWGgx6
 upFWm4nIXYdLWgZPHWNk1c2a8V6o0MjM3hUnIVGn2d3aoOyaRVGp7MgRPYZvlgLqtsa/0PYImZi
 9w2QFzI=
X-Received: by 2002:a05:6a20:7f99:b0:1e1:ae9a:6311 with SMTP id
 adf61e73a8af0-1e88cf63835mr4229329637.4.1736338179550; 
 Wed, 08 Jan 2025 04:09:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/LZ8i5QpfO69aN/59fnSQ+E4qmtLH15DgR+QP16Jw+q2isiC8cUrZ6UXGUtEM2Sas7gLXQw==
X-Received: by 2002:a05:6a20:7f99:b0:1e1:ae9a:6311 with SMTP id
 adf61e73a8af0-1e88cf63835mr4229308637.4.1736338179283; 
 Wed, 08 Jan 2025 04:09:39 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad84cfb3sm35031251b3a.89.2025.01.08.04.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:09:38 -0800 (PST)
Message-ID: <9aaca54172f55e80819ddee8f6ccdaa24d207153.camel@redhat.com>
Subject: Re: DRM GPU Scheduler Maintainership
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Cc: dri-devel@lists.freedesktop.org, matthew.brost@intel.com, dakr@kernel.org
Date: Wed, 08 Jan 2025 13:09:29 +0100
In-Reply-To: <868200a94a19f4dc4558ec40d80ad9a8bbc0beab.camel@redhat.com>
References: <868200a94a19f4dc4558ec40d80ad9a8bbc0beab.camel@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RYuNCjzXHB4ODmtra9nOsoFVKX0tJPN8r9o1G-7xZ9k_1736338179
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 2024-12-11 at 12:00 +0100, Philipp Stanner wrote:
> Hi Luben,
>=20
> haven't seen you in a while on-list. Are you still up to maintaining
> the GPU Scheduler? You're still on the MAINTAINERS file.

*ping*

>=20
> Greetings,
> Philipp

