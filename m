Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBiZG3FboWmDsQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:53:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1A61B4BBA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 09:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5A110EA65;
	Fri, 27 Feb 2026 08:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H85xyZhx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE0C10EA65
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 08:53:00 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48371119eacso19983625e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 00:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772182379; x=1772787179; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sbfjvRE5GY0XRAAbP0x2ijP5rbmrrhoq8hjiwF4ARdY=;
 b=H85xyZhx3hkIEB4VFI83oLKHUlWy4gM068hXRg+l0BUNT7aTP/kQkVGREFPA+AVaaw
 iI1bj8nCrKdmD8ThpdyTxMFvH/shYI/x8B5vvKNvw7KBGSxgY5FbpQQteRu7XAj1/14g
 TD5kK6T+Em2BdGeFqPiGcdYlGmY/BPw67/DeiIyXuiU/LaM+rz/CXt9ErIS1ALpOInfO
 JjFcG2hUg9XeGd+BlGqyxEmiZWmnwWXBojHzSBXPVqoi4vZ+qA5wQzBR6RLAs8DREHOD
 LxDYV/wuQdgN9Um0vRN+qW1BCXfs4toxUCfXhGE/iBculzKSt9yBpeybyjt69FeX2E6A
 FyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772182379; x=1772787179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sbfjvRE5GY0XRAAbP0x2ijP5rbmrrhoq8hjiwF4ARdY=;
 b=GhnEQhwsmacbLAQOlqE7l51C79dtrA/YwNKJOujcB5LqVvTjKPxrAYK6sNz6y9iqHI
 IZmkykIwC8Z+X1wb9c+BbqI9O4ym/pgJDMvlvS+WsnJYjc8KoA3BUWjXa10/4bY/wprA
 yAiTZ9fo5kG8onhk7G1XNJlaTjfX70cdGjYkryVAb0po7Vf/yj1AUNs5V8Izj8QHa54b
 OOrA4rYEFtz6Wqbj3+FAAnfLOQ2MT22ERNNs3I1RzkamqiS+w7W+udnjJqBZ5o+7a0Rs
 5OamTZq9T5hhxm+I0yD950VzhDXDZXR8y0X/7bUjwJFB18R3tScmB8cgTwXEgA0SOiHl
 +pRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHvwe+RFo0LkfXXndfEZhnlvOnqcSTgfYGPw5Z20xtUgpUT/KoFZS6bwYJiR5ghSwwnbzNsE6woI4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyHZEC/tEaTS4QqTHdJvGpciAtOjcqTvpdJmMD3SiXIpY0NBUG
 ugJJZ6mun1GNx+ZvZjELn9xbz7DDn460akvgLWXB53yjYHVlPIduqv3Q
X-Gm-Gg: ATEYQzyBqft9YfEY7u/7d1+YN3mePU45yi+w9M8DSE32XZ4nN89b6uh0vzb9e8OC0Nb
 JlGgiihDfvlyg2yFHGYnQfZIidzutyKjDhnTxZllmmK1eyQcr5v10B+QnacYYEzVRIIm2pUhxRz
 cXfzlvEFJ4o27NWZcnGkldS3mPQeDRVSCy9A87+mhlL74Gn1u/HNENfYPRPo79s68diWCfNc99J
 nvix/W6RDLWHBI93yFzuSyZgVIHrW6VBSo9VjTAJzY2LDlL5osXpwrC6XiG3gn8+dFMdK20Qzk/
 2fKPok/gxcfBP96HhImYiWPtAQ8cBkbVJnGg+hR6KLXhOFHhWqufUzVATSR3YEpE0JMftxEtMWU
 miAEBAOYbmGz7S/U6gZ9EeGYbwP4SkMDF+F3Qh/X/uv7JdoIgIjwLQnczlUIQf2LQEk0uRgJHcS
 GroGZrWTL0i7GpU5PGyoY01wnEvR/XCZeA7ACkX3kKrd11DsAyTokTXBmuO2ff70AbCaGRFvak5
 5ENFFNi
X-Received: by 2002:a05:600c:4f8b:b0:483:498f:7953 with SMTP id
 5b1f17b1804b1-483c9c21525mr24224015e9.28.1772182378989; 
 Fri, 27 Feb 2026 00:52:58 -0800 (PST)
Received: from timur-hyperion.localnet (5401D70C.dsl.pool.telekom.hu.
 [84.1.215.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b89c99sm92884545e9.15.2026.02.27.00.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 00:52:58 -0800 (PST)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: airlied@gmail.com, alexander.deucher@amd.com, alex.hung@amd.com,
 andrzej.hajda@intel.com, christian.koenig@amd.com, harry.wentland@amd.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com, 
 maarten.lankhorst@linux.intel.com, mario.limonciello@amd.com,
 mripard@kernel.org, mwen@igalia.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com,
 tzimmermann@suse.de, Melissa Wen <mwen@igalia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v8 0/8] drm/amd/display: more drm_edid to AMD display
 driver (partial)
Date: Fri, 27 Feb 2026 09:52:57 +0100
Message-ID: <3856874.aCxCBeP46V@timur-hyperion>
In-Reply-To: <20260225121903.236115-1-mwen@igalia.com>
References: <20260225121903.236115-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:alexander.deucher@amd.com,m:alex.hung@amd.com,m:andrzej.hajda@intel.com,m:christian.koenig@amd.com,m:harry.wentland@amd.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mario.limonciello@amd.com,m:mripard@kernel.org,m:mwen@igalia.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:tzimmermann@suse.de,m:jani.nikula@linux.intel.com,m:michel.daenzer@mailbox.org,m:amd-gfx@lists.freedesktop.org,m:kernel-dev@igalia.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,intel.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,igalia.com,linaro.org,ffwll.ch,suse.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1E1A61B4BBA
X-Rspamd-Action: no action

On Wednesday, February 25, 2026 1:04:29=E2=80=AFPM Central European Standar=
d Time=20
Melissa Wen wrote:
> Hi,
>=20
> This is a reduced version of `drm/amd/display: more drm_edid to AMD
> display driver` [1] sent a few months ago only with the less invasive
> changes, i.e., those changes that don't affect DC. This partial focus on
> using more drm_edid helpers instead of raw EDID helpers. Most patches
> here are already reviewed by someone and I think they can be merged
> without major concerns. They can also prevent new initiatives of keeping
> parsing raw EDID as driver specific code, which can make harder for us
> to remove `drm_edid_raw()`. They should focus on moving raw EDID
> handling to the DRM common code instead.
>=20
> Regarding code changes from previous version, here I added some r-b tags
> (from Mario and Timur), fixed commit message syntax (Mario) and
> centralized error handling (Timur). I'll follow up the changes in DC to
> accept the Linux/DRM opaque object in a separate series since those look
> more sensitive.
>=20
> [1] https://lore.kernel.org/amd-gfx/20251106165536.161662-1-mwen@igalia.c=
om/
>=20
> BR,
>=20
> Melissa
>=20

Nice work, Melissa.

Reviewed-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>
=46or this series.


