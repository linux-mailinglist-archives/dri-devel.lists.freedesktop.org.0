Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79ECA76D10
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 20:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A49110E47A;
	Mon, 31 Mar 2025 18:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LpAcPrSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0987E10E162;
 Mon, 31 Mar 2025 18:54:00 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ac298c8fa50so810200766b.1; 
 Mon, 31 Mar 2025 11:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743447238; x=1744052038; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hn03dtZ2hFaiRTWE1ZhCFbL7wzHrnp2m66oE95vfEK4=;
 b=LpAcPrStiLc4b63gburTjZ/6CQiGZXh2s4yObWh6PtMT0Csm9qGmd47glBLY2QdnW3
 bXgwwUnQCYWMG4XsfReukdbwnqbCpLfs2wfWxPxBsFDhPkpak9r6R1cs2MEIWXaGUkgQ
 E/Kb985NvnKOulitUyaivBFF8VPBfT9THNqq33LQn+xZcvqn8bTSnW0sY4hfi45CswKE
 OximLTJHjqtOMc9sbf0+A+UhkoHNfrChfZUjyY7e/7n7gtpOfZmsXEP9zhFJNPpElAWz
 fRLI8h0ktYJAAkE//wCPFyHHo4sxySrh+AE2AT0lSoUKiB96LXD/XUYLtjVxMHiiXPVs
 TRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743447238; x=1744052038;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hn03dtZ2hFaiRTWE1ZhCFbL7wzHrnp2m66oE95vfEK4=;
 b=RVWI9DM4ix6yTj66PehrPHsttAjMcvty+EyW37tVo6e3HSjMJU2YsS7S9CU8BC8Ebw
 jM0ep+LqNA453AXavp4UbZgl+ku6SD/7drYFFc2DbRGBErt/q7GrcydteufcIaFpm+C6
 oiml2bklljZF6QN2UBRF/aGSVXEd2D0zxusLUctcIMTzuE3c1Ms/1TA4J/qnujI7Y/G4
 MPDzBzIwI08eZQxa76qirzf7vziqJsE119OAUpcJUaytHvXr7L4UszS7tEZ2V77IvBzi
 gU4nVmnWIS2HXSrDO0Atz1xYTc2IAjtLS8k+Yp2i5iuDaeuRIHeDJLsGn8CrCGQ3nrfj
 1Feg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBd0iPydSK45QzCWOCmoYDfxJezZFqA9uqvIe394ikCRXidzGo6OcbwbKyqf5v5o0ZZT2MSsPp@lists.freedesktop.org,
 AJvYcCWSvxjVuCFZwTHgV1C0C/9QNXiZztLOoC0m4u+WfpFDMVWdQngivzSYQ8RerYEclLSjtCacUYPmanS/@lists.freedesktop.org,
 AJvYcCXswlUBTHSEELBEAdOBcG0aOSnEnlBcdCke2eHfeKD+AN3kV4LsxqHY18VR3n7zoD1hkSqNeaO9NfW5PEqIRg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1zCQTHZzeWd879zf5vbshh+WIU5FOVnBrsBlWhsU9xC0l3h9N
 D6u5OwWMcwr+RykiE3EbJPrlK8bUUbHNtyJ7CgkvEU+h5iYbk9jBprz7F5odfFsqhy25HY1Fmgx
 nTjzX45sgdnfKyXY/LP02aLOfTCY=
X-Gm-Gg: ASbGncsIaU0vsu58XeSxWCIGnsu7sdfVKDBdkEVKNODVwoMB9G+SS9mVBo+kWKn2nk+
 Nf1GzeHl87r9Nfy2O0vQbk0YcBVxVxCfE+ptIt63aXH9KKF5XuMnC1xribzlVX9D67jZpVsHa++
 oJNqP278IaY0Sj/MaDZxvL6XXndCqDacO968KaxdqG+r8vOlFE3yL67KCff7g/
X-Google-Smtp-Source: AGHT+IGvAA1TT+qttz/pViHg6LEPKoECU+0Rsbyu0pwwhVUEEGF8X1rEM0CVCj5BLp/WcGyQsl9n8gOp6SPVOjCRDUM=
X-Received: by 2002:a17:907:97c9:b0:ac1:de84:dec0 with SMTP id
 a640c23a62f3a-ac738a16526mr1032207566b.26.1743447238298; Mon, 31 Mar 2025
 11:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
In-Reply-To: <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Mon, 31 Mar 2025 20:53:47 +0200
X-Gm-Features: AQ5f1JpS5wxwaOO8jnM3RgARSu3ZQHf3muSBh5FLgv2-Oy0xqQf0y01_DAReGVA
Message-ID: <CAFZQkGyOvLyqVBRr5_mhApeEx2emoJ8KRp2_GDuF2rL-4zZ2bA@mail.gmail.com>
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Alex Hung <alex.hung@amd.com>
Cc: Shengyu Qu <wiagn233@outlook.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
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

> Cursor plane has no color pipeline and thus it has no colorop either. It
> inherits color processing from its parent plane.

Just to be sure: That means amdgpu will reject atomic commits that try
to set a color pipeline on the primary plane while showing the cursor
plane on top of it? Just like with scaling?
