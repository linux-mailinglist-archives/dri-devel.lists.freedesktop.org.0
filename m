Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C14B2E5B6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 21:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAF910E363;
	Wed, 20 Aug 2025 19:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C94tVnGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2D010E363;
 Wed, 20 Aug 2025 19:37:55 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-32326e5f0bfso274759a91.3; 
 Wed, 20 Aug 2025 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755718675; x=1756323475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIGqYplhoRs1f/hcHSbYZNmTx5Ex+a8ORKp3qbixI2g=;
 b=C94tVnGK2KMurhafixPEKButTDGa7inZk3T2wnXUjY9NI09JSt+LhE73qQzPsn0WXd
 KV6/jgvD5wdFSAaq7vo+TEEYXjZRdrYEtdpLhETD6RqnJFHyIAsu3geMJxwZc6z5c6e9
 aqazuIoUrxQgFKEk7r5C+MYL/oaK88zW/EDguHpWBQMoRbN5TFDD+606DzCdHjGLR9/k
 CnSqoGSpT2EfacHyTYMT90QYT9VAkZK1n9+XRn4RZ8gwlfeqjeUVeEE2jJSltO4Eo5MX
 lsGyFryV3APuUZI39jU1hnheM7cy1uNfjoM2oQ0lNKhT/Y5XRs66VXhVnTWYgeKfwTjO
 6EZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755718675; x=1756323475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIGqYplhoRs1f/hcHSbYZNmTx5Ex+a8ORKp3qbixI2g=;
 b=GLVzOtW3Ah0jSx8JJbrDxpTpoztlDHUAOgGsVGDVNrI1IJmgFbmbk27LAC4kItsT25
 xAJc/8nm3Zs534no3sX7YXrZMAgibg/x1bZa31ctuxTvvcb+ZhHZEDBB1ODR9dcBMqJ4
 jOQp0lCz94invC0uafMwsXvc7qfkmfiLJRVZbrOZJj1jPwMwc5C9y+wby7rOmoh1fUGH
 oVmCmzDWqgIrbSrvFu+OLQAHtzcDJOy7hXcIOaoO07bDJxySxWCWGJNIz+BZY1Mror1S
 Gc6PlvCNxybTdqu29WAljTeiW/WwIYIGzJRyfs66xGEdT/4nJrUXWsY4wI1cRA0ITmxP
 bNQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGm0e2rKfJNur9IEBNk9lE2ZNlLuxYYSEPXPSZHEwjytVWG3jiMKSU6TI96m9tLpiXsU3acm6Mbsae@lists.freedesktop.org,
 AJvYcCX2OK3NAz99tDw/5KKAKrsTjoaAqHaDtEscxlVkO5TZwMvU+ndONnzdux3Wft7ih+fxQsJVzuWL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznSrn5xMX6CwzRGgtfIG6fQepsg6ZVBwuLZSZ2wzQrg8+tvLDo
 NK9IfjLZQ9TIE++pZXsDZJSuPbuMXLDzp/rf0PbHO5axMVwmRPZCDvo5
X-Gm-Gg: ASbGnct3PXzdfL3yFVVnkjZJokxwH6KK42Jgt8UyReClmDh+pPyXVjyco+JkgIPjuW9
 xbt3b8UIliYeIjVBkbbAuzExaqMYZMcw/4ftROFBUgAAV6uDp4wsLi+QplVsMb6mUKXPLuQPhcZ
 jlAKGyxLQJ1bvuscuBJUrFUEBU4JNIqKkWgkkGNAjbKW2WCqUcvlRBNQmc3vSZcaQbRvQwHkI/U
 zNq7OksrelMoAEIMB5YhWnQhsY7KzYDi9PbtpzjyaQi48H7vawEN1Qn3OEKZ2YfK3Ls0yzYgIuE
 INgidlYF3ZdKTeboqn54rRDFNtQSQ+L+rkaeqMPmanmjynB22Bp/jghWf7qUORW+uXV0Y+yIoCQ
 kKipecPOJt3m/q92ann5M0zEHS9o=
X-Google-Smtp-Source: AGHT+IH4oAP6ojhRdx0McHVBEZbO37qGzzHPVXncvGS5wiZMCWye6YVPnfJGPtuh7vzBHz8DDQSRGA==
X-Received: by 2002:a17:90b:2587:b0:31c:c661:e4e with SMTP id
 98e67ed59e1d1-324ed1ed238mr27715a91.33.1755718674513; 
 Wed, 20 Aug 2025 12:37:54 -0700 (PDT)
Received: from lkmp.. ([49.37.163.128]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640b191csm2911858a12.45.2025.08.20.12.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 12:37:54 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: alexander.deucher@amd.com
Cc: Christian.Koenig@amd.com, Harry.Wentland@amd.com, airlied@gmail.com,
 amd-gfx@lists.freedesktop.org, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, rakuram.e96@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, skhan@linuxfoundation.org, tzimmermann@suse.de
Subject: Re: [PATCH] docs: gpu: Fix spelling mistakes
Date: Thu, 21 Aug 2025 01:07:38 +0530
Message-ID: <20250820193739.20263-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <BL1PR12MB514474E3D1951AA174431414F733A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <BL1PR12MB514474E3D1951AA174431414F733A@BL1PR12MB5144.namprd12.prod.outlook.com>
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

Got it, thank you for the guidance.

I will split this into a 2-patch series, one targeting amdgpu and one targeting drm, and send v2 accordingly.

Thanks,
Rakuram
