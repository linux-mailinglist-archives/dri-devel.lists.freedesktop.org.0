Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A417EE79
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 03:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2030F6E140;
	Tue, 10 Mar 2020 02:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760042.outbound.protection.outlook.com [40.107.76.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6616E140
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 02:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boZB8XLCxJvD1P3mo/K3ml4ZPFalc2Ly0yb5HZtHZ3fNzuOxYWsax4Bhnv82F3sreWtx6uB295Lh2A2rWRn0ppcV5s9hZ6TMCWN2V6lCU8OiuIvT/7IRjXA5zzJUsLEw+pGImmf6j2U6nJnF1pJPqlDQMUVOs1ZYr3ewWzNfX1qOwryZnyLWha8LFSryLqGCkoCwuPX/J5ZulaUfewoaam39iHEAZCyGfHep5O2AUKtjA59VDAlAbbFtwmv8rLp+32PHaRyUrgwkV2RrUY/Jf/dvBdy/QEOtAHldecFeKDZrxzsRMtlooKOSOGBj43AiPMqlLRtTuEoj82TxerqsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMc2DXIrv7YPCM74Hdwo3wXgBEyKSHqH35AF8nV8a/s=;
 b=FAZywgfG1RK+O9NwUqnA5RwPhvcvQ2CWOoa48g2K7BMG6MpgEzLvug1YdgkT6DEmj3nRcm0dWd/PA+OT9adufiG7Qvr1L7MIyvEq1fKW9U0DXmzJy1feSIllaOP9AmuKGNZ1Yoxc+HAdFmugwcxqJMas4pqENjr/jDk+LHCaUEJIm6+AwQ4Xe4urP7K+hgjLchpBqOjP75rDw02Tv2u4N3w8XH0rSzAuV071hZbYg/YFItiWhNatKyYPx1QOMWPIOzmOdr0oSFsZEU1dHZG70wPmhkY1/XvdJul2k8EukddTsq0BC/wA1tp0peQsrN5OtNcP4JpIcymslHvmrzMlwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMc2DXIrv7YPCM74Hdwo3wXgBEyKSHqH35AF8nV8a/s=;
 b=CQ0uTT0BadrnfCGJ+Iu0YIFU2HSag9pcsKMJXbODfDQl8umb5lToth+yg0WeA/MZ16Z+Km6ibjx5jqaUVWBDGhX13Z9/VtDtTknFevY0KUxyYX5EK8EoS/bisnVytZvwx6sBBxu6hSI7Epf9PoEAx/CqIVPAFxMs73qGKZuszno=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (2603:10b6:208:106::29)
 by MN2PR12MB3645.namprd12.prod.outlook.com (2603:10b6:208:cc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Tue, 10 Mar
 2020 02:17:11 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b%5]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 02:17:11 +0000
Date: Tue, 10 Mar 2020 10:17:03 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: fix false positive assert
Message-ID: <20200310021702.GA18005@jenkins-Celadon-RN>
References: <20200306124155.1995-1-christian.koenig@amd.com>
 <84724c95-1fdb-314e-19b2-03a6f0865f26@gmail.com>
Content-Disposition: inline
In-Reply-To: <84724c95-1fdb-314e-19b2-03a6f0865f26@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jenkins-Celadon-RN (180.167.199.189) by
 HK0PR03CA0105.apcprd03.prod.outlook.com (2603:1096:203:b0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Tue, 10 Mar 2020 02:17:09 +0000
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4bb0265-cd95-45d2-60b5-08d7c4992433
X-MS-TrafficTypeDiagnostic: MN2PR12MB3645:|MN2PR12MB3645:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB364552372F9F3CF62A38F743ECFF0@MN2PR12MB3645.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-Forefront-PRVS: 033857D0BD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(66476007)(66556008)(33716001)(66946007)(5660300002)(4326008)(9686003)(2906002)(54906003)(86362001)(186003)(478600001)(16526019)(956004)(52116002)(6496006)(316002)(26005)(33656002)(8936002)(8676002)(81166006)(55016002)(6666004)(6916009)(81156014)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3645;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TrVApKK57SE0qvMe2ZV8tGvhHworMvtG+qf9QBubnuDxqjrmbC0CWr3AVn/tPhgVrT655wsc5lZgc1OMyGpRk1igjUhqxUnQAgNZ9KVyUYC9dCRqpwENIDZHt4DrSdM6ByUh7RtDC9tDmfdnVROCMAw1SQQQdMSXCmxgst3v342KjsDi5LxAGYBigN/zCHygkyeWxk5hKsvzlwmc8vCVqtjHNY+gNjQK72YCz1fS/BUom6+7NwTYXcAgM9zNjKDT46TPTWY06QRV0EHDRVCHEx9XVuY1uemepBA2Yduty6gg1xESM+hFIisFfK/Cs7tM3xCyu6231G7LozB64fqtoebBdtQrMWgn8MqAheVNcTxbjVddwhv9VUX8SSbbYXu/s8b/I+i/MEXNB1BxmnrMoHFZplcLzlwuqiaF/o3pOVuOSaHm1lZ6Rs6SdFBrjOeR
X-MS-Exchange-AntiSpam-MessageData: J89qlBu4ifeC2SQJQMScwufXJD1qXIFIAnbRghMyH9BI9CKdUDKxfE4Zr4PiwhAoS6jxk6NQfxYjk9N0VHLrUaa9j/vVm+cPMsyTILWbQqGUG63v2FI0a1H5E8A1UdKm1EJ1lzfNpeKktYZWyNJ//g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4bb0265-cd95-45d2-60b5-08d7c4992433
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2020 02:17:11.5190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Trem1/v8fLzyZrXjTXwEAjilD+Cj9u4MAE+hAxzmbzmNccRbK04lhrFfJjUgxcO6g16sBCfNx7a6nrItfMq0Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3645
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
Cc: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 07:49:15PM +0800, Christian K=F6nig wrote:
> Pierre-eric, just a gentle ping on this? Could I get a tested-by?
> =

> Ray can you ack or even review this?
> =

> Thanks,
> Christian.
> =

> Am 06.03.20 um 13:41 schrieb Christian K=F6nig:
> > The assert sometimes incorrectly triggers when pinned BOs are destroyed.
> >
> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> > ---
> >   drivers/gpu/drm/ttm/ttm_bo.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 2445e2bd6267..ca5a8d01ff1f 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -151,8 +151,6 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffer=
_object *bo,
> >   	struct ttm_bo_device *bdev =3D bo->bdev;
> >   	struct ttm_mem_type_manager *man;
> >   =

> > -	dma_resv_assert_held(bo->base.resv);
> > -
> >   	if (!list_empty(&bo->lru))
> >   		return;
> >   =

> > @@ -611,7 +609,8 @@ static void ttm_bo_release(struct kref *kref)
> >   		 */
> >   		if (bo->mem.placement & TTM_PL_FLAG_NO_EVICT) {
> >   			bo->mem.placement &=3D ~TTM_PL_FLAG_NO_EVICT;
> > -			ttm_bo_move_to_lru_tail(bo, NULL);
> > +			ttm_bo_del_from_lru(bo);
> > +			ttm_bo_add_mem_to_lru(bo, &bo->mem);
> >   		}
> >   =

> >   		kref_init(&bo->kref);
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
