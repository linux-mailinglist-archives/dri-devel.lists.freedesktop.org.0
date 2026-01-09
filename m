Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E64D08DE6
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 12:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EF010E8A0;
	Fri,  9 Jan 2026 11:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="iPkzT5g7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE5A10E8A0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 11:23:09 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dnfXB1sQCz9tRD;
 Fri,  9 Jan 2026 12:23:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767957786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4YVGV/Yb9izcoWuOvgKsXDa6QswfuZB/Juc+OgN1i7I=;
 b=iPkzT5g7FRvlP82GzKGjGT7cn7EcHblr0ojPzgEb3zuihspG68ED4gAh1naWA2nzf5OdGO
 UXkgN7TON8/IDpBPFc5iV2Wu65XIDcJ7LFO6g86AsHfvQd0j2/54Dnrmqtu/24HO9AIm+J
 VYkRI79gyd3Z2koUiR2IlpHIrhWF3hXC83XfDhP2Zfln1ncQZq6Z8Fed7xKIrOEJVgKuGq
 twIm/mMb+36eSkeyGaXduWgaOzAFKGzlMpC2ysK/9jY+d0LY60Y28TcjGrNRdhux/tOMl/
 EBz+R0ndwAOkN25QUZmF3vI4FbS+PDUaz9TqK48XvNSgGsdzQ2WqRWWdIdii0g==
Message-ID: <05ac3e30-b3dc-48ea-96db-1cbdb4454730@mailbox.org>
Date: Fri, 9 Jan 2026 12:23:00 +0100
MIME-Version: 1.0
Subject: Re: [PATCH [RFC] v3 5/7] drm/atomic: Allow planes with NULL fb along
 with async flip
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "Kumar, Naveen1" <naveen1.kumar@intel.com>,
 "Syrjala, Ville" <ville.syrjala@intel.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <20260108-async-v3-5-e7730c3fe9ff@intel.com>
 <6316ba11-0660-419c-afb6-a1588f6efef5@mailbox.org>
 <IA0PR11MB73076D91D60F168B9D112051BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <IA0PR11MB73076D91D60F168B9D112051BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 50e49ebdfe95bdea6d2
X-MBO-RS-META: 5pn7ingpy5i51pgnr5yizttjjzy98dq5
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

On 1/9/26 12:08, Murthy, Arun R wrote:
>> From: Michel Dänzer <michel.daenzer@mailbox.org>
>> On 1/8/26 10:43, Arun R Murthy wrote:
>>> Along with async flip if there is a request to disable a sync plane by
>>> providing a NULL fb allow them.
>>
>> That could result in async changes to other planes taking effect in an earlier
>> refresh cycle than the sync plane being disabled, couldn't it? In which case the
>> commit arguably wouldn't actually be "atomic".
>>
> This is the request from the community to allow disabling of a sync plane in an async flip atomic ioctl.
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834

Can't see any such request there. I suspect there might be a misunderstanding.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
