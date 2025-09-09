Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B53B4A6CE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C9010E66B;
	Tue,  9 Sep 2025 09:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q36jG4Q5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE3810E66B;
 Tue,  9 Sep 2025 09:09:40 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7725de6b57dso6158663b3a.0; 
 Tue, 09 Sep 2025 02:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757408980; x=1758013780; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kqPc2XyEx7hJaGX2RHm1jVlEm9h0J3/vXED5Ck3jL34=;
 b=Q36jG4Q5C5Zzwyo6PROQhxJOR2bucCt93eu5Ugzmc6kRsSzLFLfAyguPwepx6OtNX7
 JSkskIXOcTwr8UixpPOs2inKsm8bhKTTZ7oQ6Vm7QsgNfsOsgA+IzH3rY/KyD7u+np/h
 D8irLU3LGLskqpxJ8tQzJ7bppF4TW1EJUfyzstzUKuFYp1j5K+xlD3pEvVS5TWkevuuc
 wykzepotqD6Qj3n+1Gs59gqWrtumSnSy1TKVfPFMsyl/dWXpBkXXLfVgWXt+03MTu4xS
 x0tyKe/tgnI+ZtaLWgD8QVUqzpzR83bygF2byppecxSOMLlh6/Uf2FS0ekFbew67Cyn+
 1kHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757408980; x=1758013780;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kqPc2XyEx7hJaGX2RHm1jVlEm9h0J3/vXED5Ck3jL34=;
 b=fMyYKjfTK1TGFnPUU+j8uGTCduirCjq0UD5WKwvJtIFW0nRffKOIBGWnCPn6O7jIb4
 hoYTq7fDU12fO64AiqvxN/JDPQlmENj5cz1MNj8D8TMCpmzs1Vm3DVgDBPBqccj22kEQ
 DSqtb9lvXbhlxSq963Rhh9rt7taKVLIgaAnXdS3h5uimkxriyzVJt/hIGpt9KIXdTMfZ
 wn1EUl93X4JeUI2YyRvOVMIF/l5acuiZK95vLvXgu6ShUdaXmrRYR+ms/0SLl1i5BVYL
 Zoy/8T/1RpeBxKUt0olfCqV1nCEer6HRhzAjQgqVQJTVc5JPIh8bVptrt9pGGciAixr9
 GP9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJpU098XEDfNsZbwaaOqR17VDaYCGXSo6e3ZCTzrbgvwZ2DgIPtjNc19N5QsOUxHBYXxQOfijF@lists.freedesktop.org,
 AJvYcCWXlnRWSyTySBKB0RcLXqQZOZYeWAmzb8mIyK8S6/4eiVT84R8wNsZd/VB3Zdq+7CXyJ2BftDnWdMYc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjpWdBPsRm9QCTtbkIMo4daygmSuFamKuxMPh90bmpuaHGdjsF
 pMD2CRg2LB0ZzwB+kxXqhLB6I/5475iM8pilF5TCitWWNtFfaO0vA+so
X-Gm-Gg: ASbGncubHENIHKe/DsTitUU0beFttqbdttr8NhFn6nwq70bmp52TnL1JByBT3oYgiiQ
 DAvAQDgoN9T88+egvhkZ5LUBiUCnSpSHvEMhRoodPi32EfxrLdWGt2D5258dgCz7RhXJ1EQ8END
 Q/iALeER9tJGVFLAJweGOb9I+bdBpww0b+OXmOUER2FOJejEgxuFp9aMnzDctoUO4tBzOcfLxKQ
 aNlsHFqvLOLKV3oEWAgrcL0W5vVmd5nCciebsywDSWu/n+PGcM5q1w0Y28QdcLeCvmsDD2u4bB8
 FjblTOLS3hINc66Beb0Feye0+x9+/bCkzPY5K3SB+5H9+egj9i6M7HNDLcBkRgz0/QotDPJ2Lvg
 tckFkQ9NqD4rO2cJqZn2NkW/Vk2hAW1FIut2ciAvUPWqrN0CCwuFy0IsLZF0oBI9ajnKc+FI=
X-Google-Smtp-Source: AGHT+IGLMvgR09TtpXV6LHI+sqDFZWwyxmCEyzU7IJEVMiPIwQK0Li50mUmwwWRucDIt6KYIn3TMog==
X-Received: by 2002:a05:6a00:2191:b0:76b:f7af:c47d with SMTP id
 d2e1a72fcca58-7742dd60109mr14646722b3a.4.1757408980074; 
 Tue, 09 Sep 2025 02:09:40 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774660e4dcfsm1469549b3a.18.2025.09.09.02.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 02:09:39 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:09:35 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Alex Hung <alex.hung@amd.com>, austin.zheng@amd.com, jun.lei@amd.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch,
 zaeem.mohamed@amd.com, wenjing.liu@amd.com, chiahsuan.chung@amd.com,
 Natanel.Roizenman@amd.com, Daniel.Sa@amd.com,
 jserv@ccns.ncku.edu.tw, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/amd/display: Optimize reserved time candidates
 sorting using standard sort()
Message-ID: <aL/uz16tMybHTeYD@visitorckw-System-Product-Name>
References: <20250824182359.142050-1-visitorckw@gmail.com>
 <20250824182359.142050-2-visitorckw@gmail.com>
 <c28df8a2-9ec1-41d0-afe4-4ee047290d27@amd.com>
 <655a009a-0b69-4e11-949e-ff0f47b424d5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <655a009a-0b69-4e11-949e-ff0f47b424d5@amd.com>
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

On Mon, Sep 08, 2025 at 07:35:08PM +0200, Christian König wrote:
> On 08.09.25 19:05, Alex Hung wrote:
> > 
> > 
> > On 8/24/25 12:23, Kuan-Wei Chiu wrote:
> >> Replace the custom bubble sort used for sorting reserved time
> >> candidates in with the kernel's standard sort() helper. The previous
> >> code had O(N^2) time complexity, while the generic kernel sort runs in
> >> O(N log N). This improves efficiency and removes the need for a local
> >> sorting implementation, while keeping functionality unchanged.
> >>
> >> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> >> ---
> >> Compile test only.
> >>
> >>   .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c   | 23 +++++++++++--------
> >>   1 file changed, 13 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> >> index e763c8e45da8..2b13a5e88917 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> >> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> >> @@ -2,19 +2,21 @@
> >>   //
> >>   // Copyright 2024 Advanced Micro Devices, Inc.
> >>   +#include <linux/sort.h>
> >> +
> > 
> > Thanks for working on this, but this file is shared with another OS and it is not possible to replace sort function with Linux-only sort.
> 
> That's not a valid argument. Linux code must be solely written for Linux, you can't reject a valid patch because it breaks sharing code with other operating systems.
> 
Hi Alex and Christian,

Thanks for your feedback.
Based on the discussion, I plan to keep this patch in my v2.

Regards,
Kuan-Wei

