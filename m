Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF6A8473DE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 16:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB4010E9EB;
	Fri,  2 Feb 2024 15:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nQ1GfuTy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D802310F0B1
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 15:59:46 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1d928a8dee8so23440865ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 07:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706889585; x=1707494385; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XT52cwwq/CkEwbgIUk5BCzuEf7NPwK2h7QOsy182JLg=;
 b=nQ1GfuTy2nRjK/nlt0aWfeS5JbNUDh2z6Rx4BHEbGmvvZJQC0nnwQiSbaXpVR0Uc0Z
 +RQ6GCJZTw2TKneSTh0X1+SvsyuZXAtZB2eoUvSiswJx/YjY36XToFVRUC+X2ELt6GqB
 C/Ug8sfPmqOQtkmeJvtovdD5o/mv2fIu+gWa1J50PFju6aOOIyT765MkwXJg9eDwPvG6
 TSQDOyybK27JMp828JYSuaV893pDL2k4VpjUNuUvHDuf7Bt8X2iP0PhE9xnLpp5LoWWT
 EVSmd7oBqNgJjWPRz6xjesaYfVcXL4BzS8v3WPrpzwsHNPHbvWvs5ZYPJAWkCAHJLY7j
 z6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706889585; x=1707494385;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XT52cwwq/CkEwbgIUk5BCzuEf7NPwK2h7QOsy182JLg=;
 b=phqdMguv3r2oT/R3e1VmF4XIoYG15wAGhXcacgbfMll87vLghI/b8iLzG3nkagcyN0
 J8J3i+9AruzmqUjgUVz7yDN625c9v+wOTw4Tkgd0HgQloBn7msCereKHR7LT639sfyeb
 PWFe3lGpEPlFks3DJ3amC6uB6PSUA9W4c2RGOui1csArFgMSWs1OCgjKI+a7cSVABZfI
 MMKGiAEYxYpkOHezHjBYA7RBuDA97K3rNwnVDG9heju1YwuiRG36JSVDNOdxn2pw+AUD
 Cc3zI1QWGEjAIxzdPNa+aPwSfBrToR5ovFBUUPAsRhgbiB2epKh30gr2ahohrkzmKt/t
 aPeQ==
X-Gm-Message-State: AOJu0Yz822xrDT40VeuPBBQgMvTQj3+lD6ih7L1GliC1q7K4l/jLF+0w
 Mf+7Ggg62mR8QLDJoQxLVMDDTJDPV60yNGJxfI/6bZk+S2KxL+6X4UaweceS
X-Google-Smtp-Source: AGHT+IE+shq9kHmYnNmgWR5DIIkK9UZYHcvUGhl3ADIY95qW//uTo8VNzJr55Kn3Bov9a3IDSZngSw==
X-Received: by 2002:a17:902:da8f:b0:1d8:d225:699b with SMTP id
 j15-20020a170902da8f00b001d8d225699bmr3746625plx.24.1706889584507; 
 Fri, 02 Feb 2024 07:59:44 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVKoss2r6T4jSKMc39BOO8sS1wlQeZKNUqGbnDx+Iq5lFsQ28zOed/gzxjtdN9vZ2G6bMfSBoiWuNYcuyQI/wZHYHkynz1B/H4ocSX8Vzdb3CL19Mle04HOVI37dltZVSNp12S5rGix1waKInuRVbusXh2fGWmITUof2M0H+kQzSZiv/ok3
Received: from five231003 ([2405:201:c006:31fd:1211:e094:36ee:c800])
 by smtp.gmail.com with ESMTPSA id
 34-20020a630f62000000b005d8e30897e4sm1834628pgp.69.2024.02.02.07.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 07:59:43 -0800 (PST)
Date: Fri, 2 Feb 2024 21:29:39 +0530
From: Kousik Sanagavarapu <five231003@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] gpu: drm: display: indent fix in comment
Message-ID: <Zb0RayxXCE_kNoGc@five231003>
References: <20240124183659.511731-1-five231003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240124183659.511731-1-five231003@gmail.com>
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

On Thu, Jan 25, 2024 at 12:05:56AM +0530, Kousik Sanagavarapu wrote:
> The comments explaining the function "drm_dp_mst_atom_check_mgr()" had
> uneven indentation which made "make htmldocs" complain:
> 
> 	Documentation/gpu/drm-kms-helpers:296:
> 	./drivers/gpu/drm/display/drm_dp_mst_topology.c:5496:
> 	ERROR: Unexpected indentation.
> 
> 	Documentation/gpu/drm-kms-helpers:296:
> 	./drivers/gpu/drm/display/drm_dp_mst_topology.c:5500:
> 	WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Fix this by getting the indent right.
> 
> Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>

Ping.

Thanks
