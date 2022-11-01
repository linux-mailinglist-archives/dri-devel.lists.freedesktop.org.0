Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAA961560A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 00:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADA310E438;
	Tue,  1 Nov 2022 23:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BBA10E438;
 Tue,  1 Nov 2022 23:21:05 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id cl5so10547013wrb.9;
 Tue, 01 Nov 2022 16:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rpsnLesYz9W6MJNwj7E4OuCodm3h8Pnmeibwsh0+nzU=;
 b=kZ0L9cN3pQKQ+jSPu4z2TGRum9J/wx6IT+LLtRq7w31lj7Tq+cX3bU7ugAbqAPfBm/
 iJF4vVdtf6yN+ZQThL6oiaRoODqcI7P63Iz3pAo/ci1IGj2+eAxMXXcLlOJDU2wx6mSM
 9e8FTyMqCp/MF8sG63wc3BDEQmA8P63OThvi27J2Vp3myCZoio5I3YvzcEfkMhI0MWkQ
 WrI/YaeqajiOTf41VJ+dl/okUe0MEYqVsipaRwi3rnzIMHgD2tWBb6fu47n5SlTRVDH7
 Z5i5bLtFkoYq0hYobEv+RWEfaFtIEksUVIOg4LNT1X4tlgXpdkG+FtHLY1KukdHKYSbe
 +cTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rpsnLesYz9W6MJNwj7E4OuCodm3h8Pnmeibwsh0+nzU=;
 b=RbJr93hOjCGsXm8eAgynPYFwUJs55KRFFV0KkFzJAP2aI1FVb7zKQAd5aKtesvaZl/
 YBuoBst7+5My3gEOLxc0vXg09jviSHWC2JUEsmCdw9zeAvkKhXsiJIB31jYu1PclaEoA
 cXfq4sS7zXazsIkV09ZPs4jx5+zPPNV0t/1oAixVwPca6Fv1LYCVPjEOfTP7sbj743eZ
 GKev6CXBaHCkS11O4vl/tm4bfjWI1H2bZv504VkzzljPig1Ry3Y6H6gcLrB7Hel4PPuC
 bITESToGyDty0wAltBng6TSSHbUqC8UGp3Auu+BuftQhORf4bXHHpkukkcWNphdziWc2
 2Dlw==
X-Gm-Message-State: ACrzQf0TMvyr41dY29flmDhmUcsEDKDbzXr6u37saGmIMHJNQsolpChq
 8SORDrtTus4WQpeH5UBzFrI=
X-Google-Smtp-Source: AMsMyM6aKA+IT7eK0W1X1IuFXeolPnKxpQcsOI2M5s9JpU54zo4lkGBiygnxcQSflsVjnosjY5hp9A==
X-Received: by 2002:adf:fb84:0:b0:21a:10f2:1661 with SMTP id
 a4-20020adffb84000000b0021a10f21661mr12959853wrr.2.1667344864028; 
 Tue, 01 Nov 2022 16:21:04 -0700 (PDT)
Received: from suse.localnet (host-79-43-11-206.retail.telecomitalia.it.
 [79.43.11.206]) by smtp.gmail.com with ESMTPSA id
 b10-20020a05600c4e0a00b003cf4c1e211fsm108896wmq.38.2022.11.01.16.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 16:21:02 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [RESEND PATCH] drm/amd/amdgpu: Replace kmap() with
 kmap_local_page()
Date: Wed, 02 Nov 2022 00:09:42 +0100
Message-ID: <1753145.VLH7GnMWUR@suse>
In-Reply-To: <CADnq5_MDp6WUYTUO+Lo=XMSLdaYcwu5i2MWid9u1U2hKiyqoYg@mail.gmail.com>
References: <20221016174158.16638-1-fmdefrancesco@gmail.com>
 <CADnq5_MDp6WUYTUO+Lo=XMSLdaYcwu5i2MWid9u1U2hKiyqoYg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Ira Weiny <ira.weiny@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On luned=EC 17 ottobre 2022 18:53:24 CET Alex Deucher wrote:
> Applied.  Thanks!
>=20

The same report about which I just wrote in my previous email to you is als=
o=20
referring to this patch which later changed status to "Not Applicable".

It points to https://patchwork.linuxtv.org/project/linux-media/patch/
20220812175753.22926-1-fmdefrancesco@gmail.com/

Can you please let me understand why?

Thanks,

=46abio



