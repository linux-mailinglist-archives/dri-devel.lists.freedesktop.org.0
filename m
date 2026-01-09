Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301C6D08494
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 10:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897B010E868;
	Fri,  9 Jan 2026 09:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="eRYszs6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B613D10E865;
 Fri,  9 Jan 2026 09:43:57 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dncKk3rh8z9stG;
 Fri,  9 Jan 2026 10:43:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767951834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ImNjxX6ondn+AkEC+zDh52FmE3PV/M3bNsJhtXYnJQ=;
 b=eRYszs6i+vud4QVcDBEeI42xzyk3nqnUuSbsZTHDpe466NAqr/zm7E4uuTLUzD0BhxjUQC
 rrM2zGkp0S9wtHb/JPpDdS+8RHsmhhXdjZ+AZKvb9DTwVHO3uWTxW4v6zuaAYwxqp9kMuQ
 r72OcTI8RK5cq5vz6coyyOxcwInqLfhJ042E8RLhwk4XXYI+sxJJqQFtiiYD6tFwQ+dQe5
 dqcYv66EdH6stKf8GcVxSkvrS1zBw8BKJBsDxUoKm/DN8ChjI7fJAwvTr2Y9JWJWF2J3q2
 7lUG6SkobMR4K26riNhGyrkeFZfkdXfAZojPgPFWtXorhGyUwfC8FzKp/5RzDA==
Message-ID: <6316ba11-0660-419c-afb6-a1588f6efef5@mailbox.org>
Date: Fri, 9 Jan 2026 10:43:49 +0100
MIME-Version: 1.0
Subject: Re: [PATCH [RFC] v3 5/7] drm/atomic: Allow planes with NULL fb along
 with async flip
To: Arun R Murthy <arun.r.murthy@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org,
 andrealmeid@igalia.com, naveen1.kumar@intel.com, ville.syrjala@intel.com,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <20260108-async-v3-5-e7730c3fe9ff@intel.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20260108-async-v3-5-e7730c3fe9ff@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ae4743e28f0ab587dbd
X-MBO-RS-META: gp1tnpwfgwaaxypcpxkq7kqjfnccsywx
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

On 1/8/26 10:43, Arun R Murthy wrote:
> Along with async flip if there is a request to disable a sync plane by
> providing a NULL fb allow them.

That could result in async changes to other planes taking effect in an earlier refresh cycle than the sync plane being disabled, couldn't it? In which case the commit arguably wouldn't actually be "atomic".


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
