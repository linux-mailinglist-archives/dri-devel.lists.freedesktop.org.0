Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DDCA30F19
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 16:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B4610E6E4;
	Tue, 11 Feb 2025 15:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LdP39Oew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AE110E6E4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739286224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
 b=LdP39OewQX2dbcrl5y6LkJewV3/aajN0QNL1OtF5nIi0KqOfFW9ma/3u+hsJJ7P/EuRFnL
 egV4wkCn1bA2Rhf/pWjn4WbHGyd+EXFGIT4V7lRJxS8xAvRucL2uH+FQ+luKFnQfy6bPBD
 7XxougeBtDEuHtMBurcbrE8HdqyGpvQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-dJ5_FRrXO_C7HL9QZlntDA-1; Tue, 11 Feb 2025 10:03:41 -0500
X-MC-Unique: dJ5_FRrXO_C7HL9QZlntDA-1
X-Mimecast-MFC-AGG-ID: dJ5_FRrXO_C7HL9QZlntDA
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43935bcec74so16084985e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 07:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739286220; x=1739891020;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
 b=gNLUUV+0fMcTE1rR3jLZBleDCwBgfcKbF062WmxiiO07BkkQo0AR8ZsNbFkXJohx0h
 OsfCYYkB19KTkZJlY17BNqBshKbel8DO9/kobDKkSrXRMy/gJ1kEG56NnJtwqcsLELrs
 toUc42PbCdPZekBGJmE/LSHL79F+aEzsiYLc3bssma6fmZgyQ9zdr9ABfIUX0aeq3vjj
 2wgrEDFlEXVCmsayYRcdkrjokMvm0z90hWcpAWeq54siEyIDghxGX1xF4qha+O62aGZ3
 3Wat/t0G3sarEtajQHNeUvKNzAPQKU5PVVx5NJtvwjkfVLEpfJXorJpYJaphAPVYQhUd
 PZWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVHYlkro5PywLKdWsvQYBK17d+pgXQvzr5pG1prs8gagG9QtivqUUkapCeM6bDiMMeYuluKC4XXWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWdrugqhYMkP+xpFPPFE1OqZz0FoKVNK7wX9pWwGBaXAAGGDIP
 10QF/PT4lCLhYNgfttFlt5UBys+/s6fJudOY9oyEOUDGMN8UM76/CCrb/g0ybCNN3cGht6qwLp5
 Xjy217XKek2ZyQlasRc1BUTWee9f5Y+BZ6GQdb3HOvCwL8DrtWqSK7VejpRC88RDq0g==
X-Gm-Gg: ASbGncuIVSYl7zrKFNEE7kxe1o6MsFWOzw50MB5D9ECARxBIqMx1hlB+KJ9YIBdxdEf
 Po+VM0FctOINYs2OrQgBM3Gssn3lm91HJunRqAKEbOG/ZqZBBgJSfAaRVo54jdgd7VrCDpA/uAZ
 HE26Vsz3p2TYeERYzqtoIdfv2D27S4uuBVVb7IYI7c+U8j/wmsa0QWyf34KlnjzcXcG3M6qu7Yg
 Hz1vkfAcAxaMjGAsAZmFIOorzY50dqdVKpYBZ/Amkcqifveb4qSRaqAYXhA0/+Jov/6Xw==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id
 5b1f17b1804b1-4394c853a2dmr42857955e9.29.1739286220059; 
 Tue, 11 Feb 2025 07:03:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN7+RaFI8Q1DlET/AqPOd5Q7ETC0Cm6eLK5eh5/vnngjAmjHCWD7Z20lqQzfUQw3dEBz+m0g==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id
 5b1f17b1804b1-4394c853a2dmr42856745e9.29.1739286219388; 
 Tue, 11 Feb 2025 07:03:39 -0800 (PST)
Received: from pollux ([2a00:79c0:65c:c300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc5c8c37esm13267156f8f.2.2025.02.11.07.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 07:03:38 -0800 (PST)
Date: Tue, 11 Feb 2025 16:03:36 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Christian Gmeiner <cgmeiner@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH v4] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z6tmyHpqnpkP2gKq@pollux>
References: <20250211111422.21235-2-phasta@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250211111422.21235-2-phasta@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nw7wlSaAYKcuBsiUX15YDKTWVS9dppM-GuguaLo7V0o_1739286220
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

On Tue, Feb 11, 2025 at 12:14:23PM +0100, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming, addressed in:
> 
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> nouveau_sched_init()").
> 
> Introduce a new struct for the scheduler init parameters and port all
> users.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com> # for Xe
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # for Panfrost and Panthor
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com> # for Etnaviv
> Reviewed-by: Frank Binns <frank.binns@imgtec.com> # for Imagination
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> # for Sched
> Reviewed-by: Maíra Canal <mcanal@igalia.com> # for v3d

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

