Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D59899223
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 01:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2490B10E834;
	Thu,  4 Apr 2024 23:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Du6lXzZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0456410E834
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 23:32:39 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1e2bfac15c2so7561785ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 16:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712273559; x=1712878359;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+JcGZWerA4/j0GP5BcYvILM9CMcZQ3Ab1BvbCrrzCs=;
 b=Du6lXzZV2E1lrMSDVLC8cG3W+m6RUh5aexVVA0jkQMdyy6SqQ0E4RonSVCmICXvjod
 igSs7toPhlvp+6+oGIBbwIZxSdITGX5pS4rm75gow8t6bYo5NdDlN6V1uqDOMNohKCbq
 Qs9qSjb+XuKuSFlqOF9XHmTSldiZeCM4RaHlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712273559; x=1712878359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+JcGZWerA4/j0GP5BcYvILM9CMcZQ3Ab1BvbCrrzCs=;
 b=ultaGNFqj/fffAI2FOZLAOe4MX0j4hktIfrc3vTMVd1p3Bp8hJndxu8rqBgp2sbsSv
 o2+EImer5xyQc3LnOQQo5Pbwd0Yr90+eJmDIjAClHnGr9UbUM8hR3+kzsUvI6T817jWp
 nGcaxfB1Z4p8PKFczwuJ1NUrra6HgliTjr95oRLT5Al38QGpkuKZ2X/ENHLRsq+i85t+
 q2xhBo0iOSetgDG9EYX901hXgCVJhm4ggimSF2VkZJUeGyDYxXipe1haMCCXEXkp9U0U
 tidJo5Rmn4frSn2SufZsHR56PQG7F2UA+WlNZ4n/1umZbLbBbDK4/vF7ULNIXGkbaOLI
 yNnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZkXWmzPLGxUER1qhaCmIWt8r1ZuyOL/T3gzdOe/hlJmmKy0iXlb99u0IOLGaVlnWShSZy4kH8yoWWRx1b1KxH90WzPzqnBCdpVbGRQNAx
X-Gm-Message-State: AOJu0YzhOVBAqpVulTHy+t6Bd9ue5UZrc91eUBYxUBMRd8tHjZpAu3Y1
 pDcbmfQXXVVm5UR8UPHaNDRb2yeDqxc9u/Gcr7kjcitOz8B2V1LgqjYATpfE6w==
X-Google-Smtp-Source: AGHT+IGG4uDv5A1Im5aEtkPraZjP1jqit8IkG6mPT5w+o0kvHdp78WkPTKabNTc/bYh7JTK+vQvnlQ==
X-Received: by 2002:a17:902:f7cb:b0:1e0:157a:846c with SMTP id
 h11-20020a170902f7cb00b001e0157a846cmr3031022plw.55.1712273559198; 
 Thu, 04 Apr 2024 16:32:39 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902c1c500b001e2a4663179sm188177plc.258.2024.04.04.16.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 16:32:38 -0700 (PDT)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: hpa@zytor.com
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com
Subject: Re: [PATCH v7 0/7] VMware hypercalls enhancements
Date: Thu,  4 Apr 2024 16:32:31 -0700
Message-Id: <20240404233231.36294-1-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240307212949.4166120-1-alexey.makhalov@broadcom.com>
References: <20240307212949.4166120-1-alexey.makhalov@broadcom.com>
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

Peter, can you please review version 7 of "x86/vmware: Add TDX hypercall support" patch.
It addresses the concern you had in previous version. Thanks.
