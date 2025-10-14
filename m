Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97934BD7870
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 08:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3356210E554;
	Tue, 14 Oct 2025 06:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fwz7KjCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9948110E54F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 06:08:07 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-782e93932ffso4447926b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760422087; x=1761026887; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zW1ufZJxGA7CwHYy8cjMizcBwZzDzUHbkJ0ZT7bCLSQ=;
 b=Fwz7KjCsA7dIZFvUAT/BkZcwsmsTI2tZfAoMvRFncNEBoZyP9Sj7SfVop1e9dYKxFE
 JMbcL/Tikuz74QcgIIWp6bRxMh7ykuGzkr6cv9bml+VH5u+nuyquQm1+u3090tIdW6z7
 eFaSi92HFubcIqyoNI0TmNQGOEEDs+uzlqjeCbOSkv+EA/Dnwhvh0g9BMW3s9Fg/6ctm
 aqRqV5HjVX70HoNB983F8Sn2Ef+8wxVem4W+6LU9LYWUo6+Ev639Xwe5sSk72uEpsC5e
 cPCoTubrsykaR4mn05OZ8j8ZhSmFJ8ZkaKOl3eexedQQLHvz1thmbti3v/OeIfMhfvwd
 h6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760422087; x=1761026887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zW1ufZJxGA7CwHYy8cjMizcBwZzDzUHbkJ0ZT7bCLSQ=;
 b=M3zKYyfQoqb50tYPHkJawbAwYIuUw5zHQSCsyBL52KuvYbd1KkQZzMSQYsN+QpaNeS
 ikFusvCLn5D13JL+TnfKbCeFFKdiCDR1rgTdcUloRBd5fljG6z7Ea2G9pN33y8cVbuyx
 lep3nBcXdwnAgJFw5wH0OsSGoG6lwwalVH8QwTjGFaEynqnpGkKfAAtB/J9gnSuNga60
 jyInz4DEVuIKBLILVvmhV9/PJrMCpW2bGwNPXcrZCt7ueaOo6GkKxMwrEOxTKW1Gt+Wh
 zTAYNqpShNn/BVuGi0IcIk174F8X5y4OHbfnk9/7YzOyItOaidp8Sq9ZqKz7JUre1Xg6
 5M7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0BzBa7PQzIcl06Wsj5K09LvfVa+6Zg3u6PS246iGehTbuitrK7GAwLqBLWH8J4sE2nhPKJZ21rXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnGRfcO0O7xRs2/JKnmbMziU6A55ba2JlBOFaH9/Rl/06CNUuW
 iXJyRQ+YhEdV8YCjczp2FjFcvP9cH0cyIP0x9Pqd4BAveo/v4JjuqH53
X-Gm-Gg: ASbGncv830NcR+xlYDD+IabYw3P2QQqnpRZES1pr4hlAxm7O/TzFveAjqiOA5pI9nun
 C17Eb4j2ztKwIkYj1F0fMhTcecSykDRhcIPAf4dsFs7mlstuiUEok5XOHRe3ffM4D9Kwf65OhLN
 qVmhu06UVsg+ZxBoHU6fM4aRL7ud7gKABWW5I3+KgfIxJEJK7PK8BLDb0k1ccN4TUfHRSo0Z+rh
 +aAeeKR/Hpv5/A1CA/oKGCg2Jz6ec1GiyxukQsbkJPkendUGJDZCn7RN3W8J8kaohM+p1biZieX
 CL6EpbgNzbYz3Ibjra0Df3dAdDMOYoS8rc25erjgDozxsLu9GUQqEIt2egMp3mYtMpHAiJGxfC1
 i1fZNbKc6fH1hEpHj5qYNAmT4uKFaNbaMacisMR2v5dfHfCvKeGPr3EcJmrfuN6UIeLY=
X-Google-Smtp-Source: AGHT+IElNIdqfxS6ykSK4HeHqahrbzYkLyHVFJw7oBK+qw1dJALOAqreq/dRuYGm3x/XwPoi1Zdsew==
X-Received: by 2002:a05:6a21:3299:b0:250:429b:9e75 with SMTP id
 adf61e73a8af0-32da83e54abmr31288118637.41.1760422087049; 
 Mon, 13 Oct 2025 23:08:07 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b5293f4dcsm9342434a91.1.2025.10.13.23.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 23:08:06 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: tessolveupstream@gmail.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: Re: [PATCH] drm: bridge: ti-sn65dsi83: Fix LVDS output configuration
Date: Tue, 14 Oct 2025 11:38:00 +0530
Message-Id: <20251014060800.1913351-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003091911.3269073-2-tessolveupstream@gmail.com>
References: <20251003091911.3269073-2-tessolveupstream@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi all,

Gentle ping on this patch series.
Just checking if there’s any feedback or further input needed from my side.

Thanks,
Sudarshan
