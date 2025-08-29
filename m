Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB1B3C1FA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F7910EC1A;
	Fri, 29 Aug 2025 17:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Emvt37c2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817E810EC1A;
 Fri, 29 Aug 2025 17:43:01 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-246aef91e57so32282165ad.1; 
 Fri, 29 Aug 2025 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756489381; x=1757094181; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CVgM7Tyu00zzsMBseHOctXjMN0Os3f8IXfyGMpQmnqE=;
 b=Emvt37c2Bdh4EUHdz8Mka2DkuQ42p14ciiK6JzvAnDB6zyiLHNdKZuRT0HV4T+ukFy
 x+c/c1EhVfkpQuwFTc4Bxcq5ns8CML+rxK5HGhN8GkLVr6d6d9dIaQryux/+HuMpdOgq
 fc9j9PRLgBwB2aB3gWHMnVRVBW5xjhir+VUAAZSJXh/ryuEUYdqzgRfIgUDx4v7RoiQL
 NrMLzqK/na48j2OCICH33kv+zySVPIJOwDprgG1WRMwW4bNCZyTDQG56dAuhQAhhL7kT
 HQ4tM+7opxu3YIjwpv++nEA4qJplMSG3rMy/vKedsh8bVxiyuL189SGD337nPKITh+6e
 pjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756489381; x=1757094181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CVgM7Tyu00zzsMBseHOctXjMN0Os3f8IXfyGMpQmnqE=;
 b=Vi0yDms+lSlPXFXLpmpU1+De0gVqw0u5ZBl+kR7gkMAT4wfl8+n4uklo0B3HHcFzn5
 yXzHvBz3g//zniXOWmJfizHXzBqjZ6DT6Qw6nlItLG/cH4pHusrc/G3qbAmIVJ8PckUV
 xHXzcbQRISVnRups1i0BDwCHl6ke1fcdr+XKNFPlMR9QEmJFP/tm1/Wnz2MsDSZ47uGO
 HWVwagbmp19LyT6qrI/2e4sNy8q8TDeY/Rp7/v0nG8oosotOZyUs1Bhk+/+cFVOXr3a+
 Wnslbai7Ks82QtrphbHRjHhMrwgsyBrjHrkR55EbNvRMx8dixuZxiD+atTCGCLlxCOOf
 mF6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYZIcKh5Nlh1I/gWQe9aHg9uIWBMuYbpgfUehYUTTF0jwpfTm43jXMmYhg5gfZW9Oa2UYiypbvV4s8@lists.freedesktop.org,
 AJvYcCUvZhy6rYj7swNQTyc0P9ZByQrhv64+3Lo9HRss3pr3de9OnS6cYb2pelCi/MGYU1LLuLM+jmTa@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4A7wqEYUawedmV1Mq9xje5oRBrTdES9OMG7loD+qTYMsAsK2M
 1kQBYpUZCdlRecQ1wlvEDnRArolveE6LX5vFaDKbckGiMG9h0NQZjkfq
X-Gm-Gg: ASbGncuWsRcuag6hVIjoQacUPsQXkAv3/oGVHFf10tDCmn4ela39j3dEnPCYXMtD+5R
 wuti4I7/I/ycfV+xT21govMlS5OZRA9xym3/zhTna8WXnS3DbbgpcwCt1IyauI5ttUyXSbn2VfV
 u9SaMI8hP7c9ad5xJ8keK3zIgfxO3uwVlgYs40WznEgZlg7A6UNa23tWCwwQXGfUQ6/zw13kFbu
 v2OGWB0IJlgCTv2RL7hQsdkEXEqiVw3IGca0DWLDa8Y8EcywNP1VQlltQbyX85jda+OI7j1Gjyi
 cxzBcAkHGuOqK2ZrP/rmjwTnkTiBkXGsqbVFYNLDVQHnCTElzFoV3JJtudhiEJ7ZMZi/wD/swut
 puu7bDU569177C7iELUPoJMHpXXkW0hO3tLL7NQtalU54wV5CM7eB0v56qUW/rTe8XajK+gxqvQ
 ==
X-Google-Smtp-Source: AGHT+IE23KRcGDR/kd3c4g0abkgFnf3oFZxhdeRn83CjGT1YO9Cgs7wU0MlSqxAutRWSDpZp8ltIBw==
X-Received: by 2002:a17:903:1205:b0:248:79d4:93b5 with SMTP id
 d9443c01a7336-24879d497a4mr160522795ad.33.1756489380684; 
 Fri, 29 Aug 2025 10:43:00 -0700 (PDT)
Received: from lkmp.. ([157.51.63.166]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4cd347db1fsm2727833a12.47.2025.08.29.10.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 10:43:00 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: rakuram.e96@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, rdunlap@infradead.org, siqueira@igalia.com,
 skhan@linuxfoundation.org
Subject: Re: [PATCH v2 2/2] docs: gpu: Fix spelling in gpu documentation 
Date: Fri, 29 Aug 2025 23:12:43 +0530
Message-ID: <20250829174244.13864-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821025957.22546-3-rakuram.e96@gmail.com>
References: <20250821025957.22546-3-rakuram.e96@gmail.com>
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

Hi all,

This is a gentle follow-up on this patch. Please let me know if any further
changes are required.

Regards
