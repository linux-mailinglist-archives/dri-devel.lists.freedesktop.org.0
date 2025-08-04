Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB8B1AAC6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 00:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E2210E057;
	Mon,  4 Aug 2025 22:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ijR8oufs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2E810E057;
 Mon,  4 Aug 2025 22:14:25 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-af93bcaf678so418288666b.0; 
 Mon, 04 Aug 2025 15:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754345664; x=1754950464; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wisiRrg+vvrG3KCZ6C6S2W8R36Ns6oiSgAxK06Zc3F0=;
 b=ijR8oufsiNXRAhok/HlHIf+I2IzS6OwXUptw1qHe5Bio93R8uWdQJAKxszMtntvTiz
 jz2WNeFYTu0VgrvMvpyQOKKyRoUWfINNlsci3ndNuExR+RUAhshXRJ/ASszw4IrUYtKd
 MhTRCJzY7lRtoQzZydJl9iledbxyTvoSSAR1/VEKjlTjRJnKyzAe1peATDyilH5mYUEj
 p+okC46nCCJWulQ16GuT65Nfo0jZDxyM5Lj8EadAqq8zwnFqTHvmcy5tyw7zQbLLJl63
 f+CNQDa7xW/Va/pgIrzPMDZgKmHoMbEvLYoRPruVoPUt2tAS7E7+/UsWlnt4Ef3egJF+
 bv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754345664; x=1754950464;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wisiRrg+vvrG3KCZ6C6S2W8R36Ns6oiSgAxK06Zc3F0=;
 b=BxAxY6+sWixaVM33xfcjgX9KNV6OUtrgDfWMXxFbhTVr5BqtN97Plc60iCyS66nuGU
 b8RS8S+Sn/0d9mjHqtTENB0vmIYAU+Qd8ZVlMSOsRhHybI+v4dDSoIBZnrElqgqoRIbt
 BTz7pfwam6VZQzM+w/v8jjCZfN7DZdja7uDGbRiMUi+9eebL01MqkNaXJjPO0vylJx2B
 /WRTES0grqcS+J06mUjPxMfFe/5dqcYt1L2kzs6qsGwh2DFiDfrlKUWEHe2tQ9DZ/GPe
 F9vOg49mRh/CrvkzVYVarDpOLGXqfIwDwlkl4kT0BVF1wCxYnO9Kqpz+ifvl7FA53aq3
 GVBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWwkFgDmwksFcR4Gn0Ec//2lnm9oHPWpAt3ygQT+SBe07cwaQF6JyNAzuV0Z/r4/8txz0nWqILdmyVDhNeXA==@lists.freedesktop.org,
 AJvYcCWiC7SBkh05sxROx44HBqdNsvGk7pgJYYrQehHslXGIp4g0DiMm8FjllCflkDe444bczJQnJmWkrnO9@lists.freedesktop.org,
 AJvYcCXspRSfQMQCS4UGZCe/XWfXGNkxbm/Z0MRSPZT223a1St50W6DuTkYqOpaYS3mk23x2YU4oYn49@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+wNoNho5KsUJCTht5hYTOE+8PaXDQcmvWtWjxlgFOFi/dnae+
 EQ97HxjnTqBZgREbNTZXpURl8MUlLO2gPsWJA6X5+yDp7JZf74V8q3yMfF71kO8I/ERWCpFknqk
 8BL+ubgjuE7QNdk/9UZYDm0iPhtGmAa0=
X-Gm-Gg: ASbGncvW9uPw7YXQW9RhtUZwr/bAwaP987BTO+VW++kcw2KK+sgvy7GDiGkTlgLWNZi
 YMH1ak+crM/ISPqh+XCXmpTF8aEl+Hzy8/gLTU2M3jgI6loJC89gB3MegIJP7eN3nGfTIYjLEJU
 7jjhDELPdRyNQftwnJW2D8Vj+Zyh8ZDNgJA1/PuOcJ7gfsKqsZh9vV+WcQXtx9BKYyVm/lVJC+7
 NcYH6H4r++CREx+RpL2m2JuZvM8/rIchMzz/k2aag==
X-Google-Smtp-Source: AGHT+IGhcxxZW/XaxGygtgVL92+KDX0RFQp1GyDfbyswDU5I/dAg1UVhwPLtUa8+qRclx9wd1ZAky8KQTEzz9psYc7Y=
X-Received: by 2002:a17:907:6096:b0:aec:5478:9697 with SMTP id
 a640c23a62f3a-af9401af456mr998549166b.34.1754345663839; Mon, 04 Aug 2025
 15:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-41-alex.hung@amd.com>
 <xn27XZjdRP83I8eaTGnDdLyvppJUppZ_GVsnDJQ1wK3UINAwh4FEutAlh02CtvZoPbB4D7zhof9rGj1DsxHpccpGK7ID-S-DjGi5VRhAD8I=@emersion.fr>
 <3f3f50e5-3a60-4d7e-855b-773c868ca14b@amd.com>
 <u6jeWkMGEK4azl2nj_tqzX19ev7_J5wxY80sKlAalWOXesDjDhDwuPwQz5ttsqlAiSlhVwnQpyWt80cdNtUfINqaxjtSkGA4h10Qj16nl3g=@emersion.fr>
In-Reply-To: <u6jeWkMGEK4azl2nj_tqzX19ev7_J5wxY80sKlAalWOXesDjDhDwuPwQz5ttsqlAiSlhVwnQpyWt80cdNtUfINqaxjtSkGA4h10Qj16nl3g=@emersion.fr>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Tue, 5 Aug 2025 00:14:12 +0200
X-Gm-Features: Ac12FXzenHZnNmlPOztYLEL_4svUHRyuto5lMln0IrH0H6NdbSLtNP9rVm3N3hY
Message-ID: <CAFZQkGyj7=N2UcbBnjv7Az3oHSD2LXaAx5wzccpSt_UEhH3NZw@mail.gmail.com>
Subject: Re: [PATCH V10 40/46] drm/colorop: Define LUT_1D interpolation
To: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com, 
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 arthurgrillo@riseup.net, Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

> It would become mutable only for hardware that supports switching the
> interpolation. It would remain immutable otherwise.
Please let's avoid making (more) properties *sometimes* immutable, it
just makes it easier to use KMS wrong, with no benefits to it.
If a compositor is written against a driver/hardware where it's
mutable, it's easy to assume that the property would always be
mutable, but that same code will not work on setups where it's
immutable - as the kernel (atm even silently, without a warning!)
rejects every commit touching immutable properties, even if you set it
to the one supported value.

A property should imo only be immutable if it's truly meant to be a
read-only API (forever), like with immutable property blobs or plane
types.
