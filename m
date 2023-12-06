Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99880733F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 16:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48A110E748;
	Wed,  6 Dec 2023 15:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 415 seconds by postgrey-1.36 at gabe;
 Wed, 06 Dec 2023 15:01:35 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5ED10E748
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 15:01:35 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B6EsXxE128218;
 Wed, 6 Dec 2023 08:54:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1701874473;
 bh=cchmRciyrUYABynTI+mAA/+ZA05JUtndixA4qxWkWw8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=x10u0Mu7Qeb3VOdQ8pNTF0pNdc6sQ0TfT4N7m1FYAx1BM+AHbgZf0AYyCVmTaTXCJ
 aV2+n+rtyPBFYhjOBe5KlDGo0qIkTSFMSBTKrjX8fsMXHhSPS+0zxxRCGrbMpncGwJ
 oiIKUK8NVsqkhdeZX/e2oE46SCkjUpyTtaDlCF9g=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B6EsX2t098805
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Dec 2023 08:54:33 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Dec 2023 08:54:33 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Dec 2023 08:54:33 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B6EsWZa027090;
 Wed, 6 Dec 2023 08:54:32 -0600
Date: Wed, 6 Dec 2023 08:54:32 -0600
From: Nishanth Menon <nm@ti.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/debugfs: fix potential NULL pointer dereference
Message-ID: <20231206145432.5sgkzwe7q33cjw3z@encode>
References: <CGME20231205130643eucas1p283a5476b78a87997fa393d00f5172418@eucas1p2.samsung.com>
 <20231205130631.3456986-1-m.szyprowski@samsung.com>
 <CAA8EJpr3hNdB02avXrY+PQGGSjJTm4YT3Hct1OwsLuNQN_H9Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJpr3hNdB02avXrY+PQGGSjJTm4YT3Hct1OwsLuNQN_H9Xw@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15:19-20231205, Dmitry Baryshkov wrote:
> On Tue, 5 Dec 2023 at 15:06, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >
> > encoder->funcs entry might be NULL, so check it first before calling its
> > methods. This fixes NULL pointer dereference observed on Rasberry Pi
> > 3b/4b boards.
> >
> > Fixes: caf525ed45b4 ("drm/encoder: register per-encoder debugfs dir")
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Nishanth Menon <nm@ti.com>

Fixed multiple platform boot fails on TI K3 SoC family including
BeaglePlay, BeagleBone-AI64.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
