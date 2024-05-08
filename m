Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B288C0432
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 20:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA4C10E781;
	Wed,  8 May 2024 18:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b5Ds9hI4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3B510FC7E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 18:17:48 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-34dc9065606so34479f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 11:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715192267; x=1715797067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7lb9Wfw2vAX/aQ/+Pc2GwcF3qJyp7LE//3XRv/R1lLA=;
 b=b5Ds9hI4zIh5Vo3uf1MIeME8nC5j47FUoovHsnVtDqbayHP4E9eN0K5YvJFi49sfVj
 yLV6+R1is9wueOqmrn0X+TvR6ye9bVpn6FOnDmeMgZiE5T6deW8K++AVrBPMa3F6t62M
 gywNGmGqOwQlGHsZXgaOc3P0T0gEj4/wCWqbq8hVuxJPmr4YYLkwodPhxIKXwcdQL9QM
 yXcxkis24MnXYjeVogk34qwIBjcOpByi+0s+uou98f7WNK6fFHxie8qahoObXTlmOdpS
 t6tki0LfKMUtwaOSUVtp3CJkXCSZGH9CJs/3DCMRlGsJFd6dH/f+smSpMvd86NTejU5P
 autg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715192267; x=1715797067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7lb9Wfw2vAX/aQ/+Pc2GwcF3qJyp7LE//3XRv/R1lLA=;
 b=HRMN/KykjfN2iPnrirT9Pyrw1VoDfSb23Li7E7v6TDrHW5An5MdZ5DsZRQRtE6NpE3
 yIFrkeT1LNkXBYUNQh4/t6udozE924DeMqFvE40Ct9VcxkqpQAFA5VaA3JVWEV45hrpG
 9koSMNP2q+iTkzkKrmSrIeKhP8vGI1E1y5QKUN8d/dJxZUpiG89oYpYfng365l9BVcvf
 9siFnfLqFDwFLeXiWnCqcHVKCnPxBcnWfQBQnxgMZ7Dzr0enrA7T6HhQ141nRyf5XFtH
 cX9uP6cxs5U//nE6FhW+xqndAYPhr6N7ABbV2QLLEk3fs3d/W1JPatfjGcoxawkoJB1O
 8ZIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdTXcn3B6NSHEJPUG4AX3R6+VhnxnTpHS5vJkfM52vm1OgY+UteNQ1QOaOxA91VyuR8BgLOhzUdDH5tqQqasT5Mir7Jhwa/SHtRpf290qK
X-Gm-Message-State: AOJu0Yx0oOGZzQ5mTnNZNzgghclJeiOVVckOFqXkNYr87eNHfdRmNe35
 2PZhTRwkO1DBBmeiZ4HZnXtSvrDsCVPboa/+p2eVyp17+C+nVzliVzxDp0h5
X-Google-Smtp-Source: AGHT+IEz8lsFWhJL9tDMc4oARWvttIjiqZxtiPPRSzb2dyAOzx8IqliboOL6QugfdRMlWo3Rimlrpw==
X-Received: by 2002:adf:e2ce:0:b0:34d:7d04:7903 with SMTP id
 ffacd0b85a97d-35018135ad9mr344434f8f.6.1715192266523; 
 Wed, 08 May 2024 11:17:46 -0700 (PDT)
Received: from fedora.. ([94.73.34.44]) by smtp.gmail.com with ESMTPSA id
 n8-20020adffe08000000b0034df2d0bd71sm15849287wrr.12.2024.05.08.11.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 11:17:45 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: daniel@ffwll.ch
Cc: brpol@chromium.org, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, marius.vlad@collabora.com, mduggan@chromium.org,
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 tzimmermann@suse.de
Subject: Re: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
Date: Wed,  8 May 2024 20:17:43 +0200
Message-ID: <20240508181744.7030-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <ZjCtgSaL50YrS-F-@phenom.ffwll.local>
References: <ZjCtgSaL50YrS-F-@phenom.ffwll.local>
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

Hi everyone,

I wasn't aware of these patches, but I'm really glad they are getting
some attention, thanks a lot for your review Sima.

Given that it's been a while since the patches were emailed, I'm not
sure if the original authors of the patches could implement your
comments. If not, I can work on it. Please let me know.

I'm working on a Mutter feature that'd greatly benefit from this uapi
and I'm sure other compositors would find it useful.

I'll start working on a new version in a few days if nobody else is
already working on it.

Best wishes,
José Expósito
