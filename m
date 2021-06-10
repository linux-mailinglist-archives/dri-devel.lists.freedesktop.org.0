Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C83A289E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EE989EB7;
	Thu, 10 Jun 2021 09:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A0A89EB4;
 Thu, 10 Jun 2021 09:43:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XckL/xqsnCELTuELcxGjTV/0tDPt1NwsREKTDyrhP2u+cZ6AmTxyx+FDNFp+Z9bzWU4Ojn5t67FE/gOqYYTxopOO67dVwKTu70P4kmS+gyn4/kZ7m9eESK18rVtCNG9dQrL6XMvB0YVviA6YTdJLMecyOWhSzXz8X37IQ0X5LNlVywgNckgA909eNC4AdYZWSuPiu2GvMEtlVvSRR82+wQTv3vbMaCAqbHM8pQ9BvoQtOY+i8W12D57Sfff38dQC/YQCmMnDRG7OxzW6ZUbUylIWSwwHppb+1i17ujhlNQaApytmaQh6/rYcVPAeWFKWqcXpPqh+RJd2nTS/KMZkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGK9rUIFxUs8bHXhSCqIoa+yufeNg8P83cp5NrbknVM=;
 b=eviWql1fURTWoh/NPCHdscS3GzHx1bUQRnB3HW/Ijwg6y+iR7atal90PlSnJr2WR2Mz5HxvobEOw96Gt8+gnej7LwB7iTFGusLfWUhIP7bWbYOiEX91joY6NwT69h847wVoHEHc8GFgWL53TWna6JTO7r1W0Iq9bixO7dy/59v0jPDVInfXmsNghDLm+5hTzFgkcR4Q0e/FWSWhGhuY3jcN6U/sMoANRFNrWNn2tVHUklyJ1vzzgifeyB/l2ty9P4il/XOdpS4YX4Ul6iyaDENgS1TGWxGyJ9/VZhv3mvepvzGlIuIhTJ7zlANZQJ/rNlzLh0MbiiVkecBF4zDB/kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kapsi.fi smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=amd.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGK9rUIFxUs8bHXhSCqIoa+yufeNg8P83cp5NrbknVM=;
 b=NM2wzRQtGmbXRoKoQ32s7BoNhZpuVJvoJEOwrJk624q7JgaK19yj14vn0TBmzASOe3GPUei0b+bDxVzGpopHbm8jPeRgADJlZS/YhXbiSNhqreEKmkoinlQY4rYkK1hWR0HbseYFhyeA+gr+S4rmeTxG/f1EXnLHSsYiZaE6TVs=
Received: from DM5PR16CA0026.namprd16.prod.outlook.com (2603:10b6:4:15::12) by
 DM6PR12MB4811.namprd12.prod.outlook.com (2603:10b6:5:1fb::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22; Thu, 10 Jun 2021 09:43:27 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::11) by DM5PR16CA0026.outlook.office365.com
 (2603:10b6:4:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Thu, 10 Jun 2021 09:43:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kapsi.fi; dkim=none (message not signed)
 header.d=none;kapsi.fi; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 09:43:25 +0000
Received: from hr-amd (10.180.168.240) by SATLEXMB04.amd.com (10.181.40.145)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 10 Jun
 2021 04:43:23 -0500
Date: Thu, 10 Jun 2021 17:43:32 +0800
From: Huang Rui <ray.huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/nouveau: init the base GEM fields for internal BOs
Message-ID: <20210610094332.GA4134750@hr-amd>
References: <20210609172902.1937-1-christian.koenig@amd.com>
 <899d773e-9a7d-062c-47fa-080161b22cd6@kapsi.fi>
 <b0a257a6-af87-c443-0eed-0f3081169482@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0a257a6-af87-c443-0eed-0f3081169482@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c004b1d8-14e1-4b24-bda9-08d92bf431a2
X-MS-TrafficTypeDiagnostic: DM6PR12MB4811:
X-Microsoft-Antispam-PRVS: <DM6PR12MB48119A0921F576696CA319D8EC359@DM6PR12MB4811.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ut4gVu5IjD5/51Wn8wJ5RSqtcb0Jj/l5TfCpEaioyULpiFW7qtHJ5YPBq+EAfRidjAKXXujsrtQATccuGV4S1YxUdU4QMTicWYGndRpHbF4ydd2G/ogI/S+knZL+e3OOxAn1pmuVSw/V3vyNbdv+Ad8DGmAbGjd99ZfWM26bZdIack421RWf0AWn7nSiHAFFw9TZL/oQ+HCuQb/8KXRAIkEbIHQxXWIi5HK5yc+J+hmUle1DxGVPBS7G4KDWGeF0EslW/s7UzAfx0dGOZwFQZ2QrO9FtR6/Z6sboOYGD+9GL1IUus9WW5+jr6tyToN2rBu3K50jDyra/iH/pf9lNJChSZxNAzRSBt7TW4GLK8wtVj/jOfk05sXhfPYTpJry8tw5dI6DbnCkAbfV/RX0E8IHGo3MLAhdqZrZT6AMXT8dg1lV6fLGayFShisaieCb+fzl0nQ5HMfSBEXwTGK020WJNyzs8id3N8KHuHgWgtK643WG9l3TGRr1EgOA4Ufm5X55xYoBcIeHyLI1LltYuuziEoWM8EqATF+LjrZaK4izDJQeh0TwvGWe2i+vTDq0dPlcKHDBjduAcG1JXZkYt4vey5M0Vmf/Y1APeedK+1NgUkWlutax3yRrLfC9paUhEhyfLVAb36k1SGCn04hLiASKBgaG00JRqmUJxekdy7RPCx2C7JZDi3zv5ojvVrcfX
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(46966006)(9686003)(55016002)(478600001)(82740400003)(4326008)(6862004)(356005)(336012)(6636002)(8936002)(1076003)(316002)(54906003)(8676002)(36860700001)(426003)(82310400003)(81166007)(70206006)(70586007)(33716001)(2906002)(33656002)(6666004)(5660300002)(53546011)(86362001)(47076005)(26005)(16526019)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 09:43:25.3449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c004b1d8-14e1-4b24-bda9-08d92bf431a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4811
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 04:08:40PM +0800, Koenig, Christian wrote:
> 
> 
> Am 09.06.21 um 19:45 schrieb Mikko Perttunen:
> > On 6/9/21 8:29 PM, Christian König wrote:
> >> TTMs buffer objects are based on GEM objects for quite a while
> >> and rely on initializing those fields before initializing the TTM BO.
> >>
> >> Noveau now doesn't init the GEM object for internally allocated BOs,
> >
> > Nouveau
> >
> >> so make sure that we at least initialize some necessary fields.
> >>
> >> Signed-off-by: Christian König <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c 
> >> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> index 520b1ea9d16c..085023624fb0 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> @@ -149,6 +149,8 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
> >>        */
> >>       if (bo->base.dev)
> >>           drm_gem_object_release(&bo->base);
> >> +    else
> >> +        dma_resv_fini(&bo->base._resv);
> >>         kfree(nvbo);
> >>   }
> >> @@ -330,6 +332,10 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 
> >> size, int align,
> >>       if (IS_ERR(nvbo))
> >>           return PTR_ERR(nvbo);
> >>   +    nvbo->bo.base.size = size;
> >> +    dma_resv_init(&nvbo->bo.base._resv);
> >> +    drm_vma_node_reset(&nvbo->bo.base.vma_node);
> >> +
> >>       ret = nouveau_bo_init(nvbo, size, align, domain, sg, robj);
> >>       if (ret)
> >>           return ret;
> >>
> >
> > That works, thanks for the fix!
> >
> > Tested-by: Mikko Perttunen <mperttunen@nvidia.com>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> 
> Thanks. Can anybody give me an rb that I can push this to drm-misc-next 
> before the weekend?
> 
> Regards,
> Christian.
> 
> >
> > Mikko
> 
