Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4282FC13CAA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 10:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE2B10E07D;
	Tue, 28 Oct 2025 09:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CEdcStGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF0D10E07D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 09:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761643630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vMgKcmUijk5xAxok1rWDuN0GhFwUXgOZN19QAh1dZS4=;
 b=CEdcStGxI66s/8dix/isCvBYGEzTCWlXYs7svh8aHNigfGEiM6vSXAwI7bP22sOGGVBpVl
 u9vPzcaIOJ94EhIMsxwEr8UHQsacP3yOIKvTYiEoefuxZOkT1u4w1c3zXfo6BON46TWOU7
 UNDuerzXY0b1bMZe5YJKIuyA8cQ+Ehk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-nAeJCfUIOQGM96zPQLiGLg-1; Tue, 28 Oct 2025 05:27:09 -0400
X-MC-Unique: nAeJCfUIOQGM96zPQLiGLg-1
X-Mimecast-MFC-AGG-ID: nAeJCfUIOQGM96zPQLiGLg_1761643628
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4710d174c31so53665195e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 02:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761643628; x=1762248428;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vMgKcmUijk5xAxok1rWDuN0GhFwUXgOZN19QAh1dZS4=;
 b=Q1tSKopVNrksXAg+vUEOAOEuA8axdMTjgtQaGJ/0JyJ9jIALQFWq4x9KJrtEX2vKBm
 c2t7ic9/nxta0sG5Lph0ze32QeBi2I36/Afz1r1rbHVNbGP5+YfL/JxVWrau7bJs7iuu
 5eqO9kWDCvs2P3buta2mJcomMpNMd2vPGoIfylobuyIt3dUapOypx8WkukX8sq7Aw+ZL
 egPeXVxF8wVk9kkof24mjnkvipcfgKVW+TyDP8Td1q7uAQLhVEZAtLeb6Ry2PzFouad0
 UnhtY+HLM24TIQhRgPWBHG98PUatTlUuq37wLYHfhU+aVhRUhGObnJZzQguLtP2x26VZ
 VB1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3XBFh5i+vFs/lBGESD+MCKVTJn5zqxWbcPhBiIyEr8LUCuP5uZjkwPEi3EvepR0SbwNUFDzQB4xA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvD4Bmuwnmz4ZDxQZE+6fcKxp+bhtZsYrVobr8r8ipICHrrwi4
 +VtevzaiVUsllPbUxwG3qUi+ZRBJMCpL3wi3FFiwr0pMgGjCc9c85HJf+mBjO+MYRjoC1HTBloH
 abAb0IBst6hShgpyJPjNeGIe9VGsHY74NYwBkp+Q8QkmPgdx1Vh4fDcnPpKyDgLy5DyO3uA==
X-Gm-Gg: ASbGnctdkCi3waTrPaKt1RH9bcqZjs6jdwKB+3r9kqH4rpR4FkOqN4y8GDIC3igqcUc
 yneu6G0BAZV9DcYWGy7gCOqkfrsRR1Ww81Rywx0s0lKzQfZVwDPeNrhg7BWEhL2PPVeMbo1CHpy
 QfzyudFrVVlckOoBXLa59Jout5f23xmAOqyHpxYlVq/oFUKB3sFJAj7ma/Vfubyab7i+GlbHJUc
 R0GgwZhOdGYgeKuIpMVOZ22vQ4Fw42lYA4owHLntnDFMC7x9XFz5SlkwxH0PzUYaR995mfTHYIr
 TOe9lP+9Y2xRzVrnptg43jZzyzuFNc7XadUnHiH6hrr6EMoXsZ4M0tIVM5NxHURmswYoYNmYVgb
 ivEOUw090inJz2BxX954a5VlhWw==
X-Received: by 2002:a05:600d:4382:b0:475:da13:257c with SMTP id
 5b1f17b1804b1-47718fc881dmr9599615e9.27.1761643627772; 
 Tue, 28 Oct 2025 02:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9RzPzsWtqqUXoRcJrXn1UN+3rD5haW59x9hIYul5AJHvof/tfSMf4EIcxnGzRQ1Zzzg8sdw==
X-Received: by 2002:a05:600d:4382:b0:475:da13:257c with SMTP id
 5b1f17b1804b1-47718fc881dmr9599455e9.27.1761643627335; 
 Tue, 28 Oct 2025 02:27:07 -0700 (PDT)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b79absm19048542f8f.3.2025.10.28.02.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 02:27:06 -0700 (PDT)
Message-ID: <d4b7c1635aee89c49416e26ef482238f4ee1fafe.camel@redhat.com>
Subject: Re: [RFC PATCH 3/3] drm/sched: Prevent adding dependencies to an
 armed job
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com, tj@kernel.org, 
 simona.vetter@ffwll.ch, christian.koenig@amd.com, dakr@kernel.org
Date: Tue, 28 Oct 2025 10:27:06 +0100
In-Reply-To: <aP+kJeOEghD+sEsg@lstrano-desk.jf.intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-4-matthew.brost@intel.com>
 <537bdebf2112a080ae92526ecfa41d63668d90a3.camel@redhat.com>
 <aP+kJeOEghD+sEsg@lstrano-desk.jf.intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: axYC26ja4AEulFORq6-COlWRry36VCXyeuQtQrO9LTU_1761643628
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

On Mon, 2025-10-27 at 09:56 -0700, Matthew Brost wrote:
> On Mon, Oct 27, 2025 at 12:13:58PM +0100, Philipp Stanner wrote:
> > I've got a kernel.org addr by now by the way
> >=20
> > On Tue, 2025-10-21 at 14:39 -0700, Matthew Brost wrote:
> > > According to the DMA scheduler documentation, once a job is armed, it
> > > must be pushed. Drivers should avoid calling the failing code path th=
at
> > > attempts to add dependencies after a job has been armed.
> > >=20
> >=20
> > Why is that a "failing code path"?
> >=20
>=20
> I noticed this after I sent - it should something like:
>=20
> 'avoid calling a possible failing code path, which allocates memory.'
>=20
> I can make this a bit more clear.
>=20
> > The issue with adding callbacks is that adding them to an already
> > signaled fence is a bad idea. I'm not sure if it's illegal, though.
> > dma_fence_add_cb() merely returns an error then, but the driver could
> > in priniciple then execute its cb code itself.
> >=20
> > And even if we agree that this is a hard rule that must be followed,
> > then drm_sched_job_arm() *might* not be the right place, because just
> > because a job is armed doesn't mean that its fence is about to get
> > signaled. drm_sched_entity_push_job() would be the critical place.
> >=20
>=20
> I think this break our rule once arm is called, push must be called as
> adding dependencies can possibly fail. This rule is called out in your
> documentation patch too. I've seen 2 driver posted in the past year add
> dependencies after arming, so I figured lets catch this misuse in the
> scheduler.

We can establish that as a rule, I'm OK with that.

P.

