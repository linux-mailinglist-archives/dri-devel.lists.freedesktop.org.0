Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D5967D3C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 03:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1167910E13A;
	Mon,  2 Sep 2024 01:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PmMBJRb7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27B710E13A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 01:10:22 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-82a29c11e1cso100453739f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2024 18:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725239422; x=1725844222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4gzV92PxZE+qFNA+RekwmEuIebSetmvmkFXMiYp3PY=;
 b=PmMBJRb7iCQq58+hoGWTdExXZbOaAQ7I4zWbGoCHIcKATxPGitSmy2rvmGG7VihsEJ
 ene8zvSzq1gJDDGd+EYUy6RAck9KS7nSaBVuRpH2AOLjtilUksRU/KcQ216Gw1PUbuyi
 lEKIkOO+lwI8aMT1/nxCx00PXGaLazGMPLbXpm8haJkBDPUSi4IXYGUqZxyNV50mEmii
 wfdXfmDrID5Rn3wz9/WRfP1jmOMY9muJlMGzD+TUQU6ZWoR6nrkHJYiv6rSbkX5xrkJ4
 vZ8JKRy2ONz7bnLHLXr+SSEXJkNc21BLPMLmgvR9KDBwKlCIflCEh3d4eQYQ+kWXXDR5
 misg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725239422; x=1725844222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E4gzV92PxZE+qFNA+RekwmEuIebSetmvmkFXMiYp3PY=;
 b=YwpXRtfPumbzY7FYNFlD8IUSNhbcpqHIwv5U8JgsuOVwwRw09F5EYxrdGebrrSOAX3
 cEnAAP3y3Oxg2q9XIs3hbeohtgyxptgK3yMajII4eAY6EjY/PDPSkJdCn67yLskTR7PF
 1ufs7mSfOxhpXWtrX9NwtuJ7vmtR5lQycY4eoHK4SRFrPY9p+FIUwVq1PxKjUJW3Xws0
 NZjCstQa63Cbox0zqboTZSdGEiSwFE76Ey9GY8Yg9Q2yKcYMWvfobpzl0Q7zrwCXwg8/
 05Kv0PNvnBs4oC8865gJr08cpgH7IOigbDPviTC2GaARUk3n72D7OPB/0miQnWe4v0h5
 X7fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZWRWDTHb97EIZya9CbEdpC3KMXfx9EHKyXK2lgFEo69Ut5tYfeefi/3l7MckGSizDyusP8QKeytw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpRrVqMCrC2BjJ0VinyHxt9uwEZalU8kIU3P0tqm0Fl8R3c8Xd
 8B7Ipy0wUNft51NFBZC/AjTZRTHWiJms299NjNeG8GX9BHHeBNH9
X-Google-Smtp-Source: AGHT+IFyhMM0xDEm3decKqdzpa8ZS+bTABQJ0zYWbmUuOdCfCFThXfgY07/epTd0Cp/ktdQ+h6vMgg==
X-Received: by 2002:a05:6e02:194d:b0:397:6dfc:993a with SMTP id
 e9e14a558f8ab-39f4e11924fmr65501285ab.21.1725239421925; 
 Sun, 01 Sep 2024 18:10:21 -0700 (PDT)
Received: from localhost.localdomain (174-20-195-90.mpls.qwest.net.
 [174.20.195.90]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f552cd162sm9103755ab.17.2024.09.01.18.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 18:10:21 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: cristian.ciocaltea@collabora.com
Cc: Laurent.pinchart@ideasonboard.com, aarnoud@me.com, airlied@gmail.com,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 daniel@ffwll.ch, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@collabora.com,
 krzk+dt@kernel.org, krzk@kernel.org, ldearquer@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 markyao0591@gmail.com, mripard@kernel.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
 tzimmermann@suse.de
Subject: Re: Re: [PATCH v5 3/4] dt-bindings: display: rockchip: Add schema for
 RK3588 HDMI TX Controller
Date: Sun,  1 Sep 2024 20:09:48 -0500
Message-ID: <20240902010948.3654-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5ea24ad3-7faa-4a59-ba10-d43b32b3b40e@collabora.com>
References: <5ea24ad3-7faa-4a59-ba10-d43b32b3b40e@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Cristian Ciocaltea wrote:
> On 8/31/24 9:13 AM, Krzysztof Kozlowski wrote:
> >
> > Please define all clocks.
>
> The other clocks are defined in the common binding, should we reiterate
> them?

I would suggest yes, they should be reduplicated, if only to maintain
consistency with all the other docs. A grep through the bridge docs
shows that there are virtually none which use a "{}" placeholder like
this. While it seems kind of like one might worry about "don't
repeat yourself" syndrome, keep in mind this is not code, but human-
used documentation. Having all the information available at a glance
would seem to be the most convenient to the end (developer) user, so
they aren't having to toggle between two separate files. Of course
there may be some questions regarding docs becoming out of sync, but
*ideally* we don't want to break backward compatibility with device
trees (esp. given how I am imagining firmware integration to work on
these platforms, as the RK3588 is at at least low-end desktop-grade
performance and UEFI packages have already been built for it), though
of course that doesn't mean adding new options is off the table.

(FWIW, this is what I did in my now-withdrawn-at-your-request
re-submission; I reduplicated the bindings as it seemed that's what
others here were pushing for and thus that felt like the quickest way
to get this important driver approved.)

- Shimrra Shai
