Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C09895B0AD
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 10:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EE110E47D;
	Thu, 22 Aug 2024 08:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="4e5UPVcM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAD110E02B;
 Thu, 22 Aug 2024 08:38:59 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M72FpY027840;
 Thu, 22 Aug 2024 10:38:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 /WciXrPWaFlLkyznHTBF6EbYQ81JU4gKjUZCLa5G1Xw=; b=4e5UPVcMImNxHaOg
 Q4VGUMnQ6HEA5Sewf0+COSBvN0VAZwKAcWTLKMtda1KlgUkj2fD9so2lgCRDC5ln
 IZe4MRL7wajqCeiIDth3yhHpzW7f3j2qw+LD+Xd0+DXPObyTrM1otCxNBvivhnH3
 gbxfBUGPyOvNLPyfv8pN/uWOoa86sOJxLWPlw6fIshpWVRmrKPa3a5DAFmLwIpoN
 lesvnJiJ64ylfPFR9sO0+CwpH9M9J0f4p6grms2ZBlRzRI6m5HdJPx390sheybCe
 sfhwnukUn0WUCSiYl5weaTLPUdmMXz+wTL/+obBFw74KLX/BONey9aARemTLdplc
 MjY75Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4160kc8dfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2024 10:38:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6EEE64002D;
 Thu, 22 Aug 2024 10:38:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4FE2B24BCC0;
 Thu, 22 Aug 2024 10:38:08 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 22 Aug
 2024 10:38:07 +0200
Message-ID: <47ff8e8d-b880-45a5-afd4-663df5480c99@foss.st.com>
Date: Thu, 22 Aug 2024 10:38:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 40/86] drm/stm: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <jfalempe@redhat.com>, <javierm@redhat.com>
CC: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <20240821130348.73038-41-tzimmermann@suse.de>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240821130348.73038-41-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.17]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-19_03,2024-05-17_01
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


On 8/21/24 14:59, Thomas Zimmermann wrote:
> Call drm_client_setup_with-fourcc() to run the kernel's default client
> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> v2:
> - use drm_client_setup_with_fourcc()
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Hi Thomas,

Thanks for this work.

Again for v2:
Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Regards,
Raphaël

