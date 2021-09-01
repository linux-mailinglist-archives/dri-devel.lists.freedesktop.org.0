Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 783163FD239
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 06:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7806E05A;
	Wed,  1 Sep 2021 04:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3096E053;
 Wed,  1 Sep 2021 04:25:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdDJMxEKUT55SN2wz9xixlKsxSLFyRHT0tSbR6bp3yZSe72rpKh0CDlnFnz6Nf6vAzCuLRn7SCgFrkj9Rk2h0UeyLSk7Qu03cfYCnnNhJj5PuYl6zuEa8eutbpa4wZzwBUt1Ax2ussQUE4PeCgaK92eulhi7s2wHg+XIWysHMXpNnxA3zWiPEkTmY23aaHqn+J8lMcVD1xxZAwf1QRkr7yScSGqFplORvdGx74BMsLkYMujDtVZ+rmPcUssloajemTRrAE6nmDUgd55CZuNsbA+zUyScyoRcQgTGlq9yrojCox6kM0ckn4dzHIJgXHEbstf6RWIKw3NPG+1Za8VIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJ/gUOtVZqM8MAAld7Me2D95e2/jz7nQL4eL8P3Bs/I=;
 b=UoAuSA0GvyDscYsY6gwEUXsDg9uUKX8mmwG50yqFXOctRccqGO+UIclTgWqoFuERBl03Wm8gU//af7TC/bKZPl+qqpHAmexM3s7rpM7nAYe69c186bCzhYzmHVGGX4stPZ5odC5DmrKwePLI7cp16OrJFE705sin8o5OVH7wRCbhzIEOXCCagxZne3vBhe6UUmH/nqI4XtGXM3UpxWeTWIMPvz2ypBdV84U7B29EhR3cDNyfEyehdqP+8VntszjgugbJkcU2+QDn4QEGYV4G1OqDLhGaG0B8fhSGw+LNWRC7uS5J3LZsRXgT3zfPDX+2O5gTLzayoyIrz1TRhHtLRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJ/gUOtVZqM8MAAld7Me2D95e2/jz7nQL4eL8P3Bs/I=;
 b=J29E8vu9b+9V5kRygDUmgHC6AdQ3GoVlyF0BIgG8OoY9ozAaWzhvUAea82UrbbPp73t0iwKUvAbk9mXQHp/ifcjaMk/wPPfkYFbSohQr/rRrAnF9oX2GtiKeXsYw8aARTYKSlkKgQ83konff9rov9DxL/OcrIyK4uUHrJiwl5OM=
Received: from DM5PR2201CA0020.namprd22.prod.outlook.com (2603:10b6:4:14::30)
 by BY5PR12MB4872.namprd12.prod.outlook.com (2603:10b6:a03:1c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 1 Sep
 2021 04:25:22 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:14:cafe::e0) by DM5PR2201CA0020.outlook.office365.com
 (2603:10b6:4:14::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Wed, 1 Sep 2021 04:25:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 04:25:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 23:25:21 -0500
Received: from wayne-dev (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Tue, 31 Aug 2021 23:25:19 -0500
Date: Wed, 1 Sep 2021 12:25:13 +0800
From: Jingwen Chen <Jingwen.Chen2@amd.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: DRI Development <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Message-ID: <20210901042513.nn3kdnh6xqkrbarn@wayne-dev>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <abf7b9de-67ef-25d4-a4be-11df93d2f799@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abf7b9de-67ef-25d4-a4be-11df93d2f799@amd.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c37d4be-ad7d-4ed9-ffa8-08d96d008356
X-MS-TrafficTypeDiagnostic: BY5PR12MB4872:
X-Microsoft-Antispam-PRVS: <BY5PR12MB48726AC2E77D3E550B8D7DCFB7CD9@BY5PR12MB4872.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZVZrBZ+rh/F/JznP6U6X1td7YeEsJ3g8OaUGdxT0OUrWaQDbukjnq7cbLLZnaXwWuTr2a9XqF+mywsxCyKsi7iCEPrsJOPcJjKiEfk0WCU8z9tNfb1wTWzTjnrnQynBJiqe9pfJXtcLYqDxRaMkNjAS4Pat2+vESGed9/ww3cZFlRga1QzOtu3U0aGg9HeNV9H4t91Qhkr8gsoZzs7oPTLe3HFUj+kVTRkG34ksXWUUcogP1ogvfjIsBY2PbhLH2vFPir2Xl3W2RX/XishOttxJcZsXTb0/Muz8fsmTYrz6a/I1edkKORMmXVpO7dwHBuQNjq2Npu/5EBlERuVfOo4RnVDHcTxWfGd7stTon52VBe4sE5kQDgBe+6C/kjd3LC0j3mnMaieYLxYIeh5czaw/FVYEp5a6dEEq21H1nVNAob5776pPHl83gYQNc6v6aDN1S3CdQWqWf6m8z24geRr93jjdoaDSYes20Ld8aGila3Ueenvr3JPr9A5SBo+pp9yBm3saUD4+UhR6tnBG+4NbIHjbkkJgtEpbP4h1cVShKKXqZTOYQdPD6m0pkDnqi0ML1SyOF9F26rvg7Fbc5/5RsCiJYngTYhB9vhPhi/kjcFWUKRavu7ZQc+5OE5IpfCL+wXSgYoR5h+5r03qPPe9cQZ7shqvlJb5L3GfpFPkBaQa4xWHRWs5XFVSIQC2ksIEd+eOtQhejZXStRyn1SRmBQSK1NNu9MmjjaNkWVdQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(84040400005)(46966006)(36840700001)(1076003)(8676002)(70586007)(110136005)(54906003)(8936002)(2906002)(4326008)(33716001)(86362001)(5660300002)(316002)(47076005)(356005)(81166007)(82310400003)(26005)(70206006)(508600001)(83380400001)(53546011)(36860700001)(9686003)(426003)(336012)(6666004)(186003)(55016002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 04:25:21.9710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c37d4be-ad7d-4ed9-ffa8-08d96d008356
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4872
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

On Wed Sep 01, 2021 at 12:04:47AM -0400, Andrey Grodzovsky wrote:
> I will answer everything here -
> 
> On 2021-08-31 9:58 p.m., Liu, Monk wrote:
> 
> 
>     [AMD Official Use Only]
> 
>      
> 
>     In the previous discussion, you guys stated that we should drop the
>     “kthread_should_park” in cleanup_job.
> 
>      
> 
>     @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler
>     *sched)
> 
>     {
> 
>             struct drm_sched_job *job, *next;
> 
>      
> 
>     -       /*
> 
>     -        * Don't destroy jobs while the timeout worker is running  OR
>     thread
> 
>     -        * is being parked and hence assumed to not touch pending_list
> 
>     -        */
> 
>     -       if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> 
>     -           !cancel_delayed_work(&sched->work_tdr)) ||
> 
>     -           kthread_should_park())
> 
>     -               return NULL;
> 
>      
> 
>     But I suddenly have a question here: if return the timedout job no matter
>     kthread_should_park() or not, then we are backing to the original problem
>     again: that the timedout_job is suddenly signaling and cleanup_job still
>     returns it to sched_main and job is freed while it is still handling by
>     vendor’s timeout callback
> 
>      
> 
>     If we return NULL when kthread_should_park() in cleanup_job, we can prevent
>     above scenario from happening: once a job is processed by job_timedout we
>     can stop its scheduler, and after that even this job suddenly signaled the
>     cleanup_job won’t return it so sched_main won’t free it in parallel …
> 
>      
> 
>     What do you think ?
> 
> 
> Is your analysis above takes into account that you also submit
> '[PATCH 2/2] drm/sched: serialize job_timeout and scheduler' then I don't see a
> problem -
Hi Andrey,
Monk has talked to me and we agreed that as there're multiple opinions about the
'[PATCH 2/2] drm/sched: serialize job_timeout and scheduler' and patch
1 is an independent patch to fix some error. So we should not take the patch 2 into
analysis.

> I think that as long as you put kthread_park(sched->thread) BEFORE
> fetching next bad job from pending list (under spinlock) there is no
> such issue as in the case you describe because this potential bad job
> that became signaled will be removed from pending list before you
> even fetch the next job and by the time you fetch it the scheduler
> thread is already stopped anyway
> 
> If you don't submit and we keep the removal hack for now then also no problem
> because
> we temporary remove the job we fetch for TDR from pending list under spinlock
> exactly to avoid this race
> 
So can you help review [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)?
patch v3 keeps this kthread_should_park check.

Best Regards,
JingWen
> 
> 
>     Thanks
> 
>      
> 
>     ------------------------------------------
> 
>     Monk Liu | Cloud-GPU Core team
> 
>     ------------------------------------------
> 
>      
> 
>     From: Liu, Monk
>     Sent: Wednesday, September 1, 2021 9:23 AM
>     To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey
>     <Andrey.Grodzovsky@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Chen, JingWen
>     <JingWen.Chen2@amd.com>
>     Cc: DRI Development <dri-devel@lists.freedesktop.org>;
>     amd-gfx@lists.freedesktop.org
>     Subject: [diagnostic TDR mode patches] unify our solution opinions/
>     suggestions in one thread
> 
>      
> 
>     [AMD Official Use Only]
> 
>      
> 
>     Hi Daniel/Christian/Andrey
> 
>      
> 
>     It looks the voice from you three are spread over those email floods to me,
>     the feature we are working on (diagnostic TDR scheme) is pending there for
>     more than 6 month (we started it from feb 2021).
> 
>      
> 
>     Honestly speaking the email ways that we are using now is not friendly and
>     quite painful to me ….
> 
>     Can we try to put all our opinions, suggestions, or even objects here
>     together, let’s go through them one by one, it’s too hard for us to reply
>     each email on different questions .
> 
>      
> 
>     For [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
> 
>      
> 
>     This is a fixing patch on the timeout timer in scheduler, can we complete
>     this one first ? it should already resolved all the questions and
>     suggestions.
> 
> 
> I have no objections for this one besides getting rid of the
> kthread_should_park()) return null part,
> if my answer above is not wrong then it seems superfluous to me
> 
> 
>      
> 
>     For [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
> 
>      
> 
>     I think I already explained the questions raised by Daniel in other thread
>     , regarding why I use __kthread_should_park()
> 
> 
> Is this race free ? Can't the other thread execute kthread_park after the check
> ?
> 
> 
>     For other aspects, can we put all our opinion synthesized here ?
> 
> 
> So to summarize from previous threads I think that the best solution
> to the problem being solved in this patch is if we do HW fence embedding
> at the drm_sched_job level instead of doing it only for amdgpu, and modifying
> all
> the drivers to support this we can both remove this hack and solve the race
> against concurrent drm_sched_cleanup_jobs job freeing just by taking reference
> to the hw fence of the job at the beginning of drm_sched_job_timedout
> 
> If doing this refactoring for all the drivers is not an option now and you need
> a quick
> solution such as the serialization you do here then take into account other
> concurrent
> TDR handlers that might run, as mentioned before, without serializing against
> other TDR handlers from other
> schedulers you just race here against them, e.g. you parked it now but another
> one in progress will unpark it as part of calling  drm_sched_start for other
> rings.
> So you either need a global lock or dedicated single threaded queue as Daniel
> suggested.
> At minimum we should change cancel_delayed_work in drm_sched_stop to
> cancel_delayed_work_sync
> to cancel and flush all concurrent TDRs and probably move it to the begining of
> the function, after kthread_park
> and before we start playing with the pending list.
> 
> P.S One comment I had regarding single threaded queue is that in case we have
> multiple TDR
> arising from same event we will proceed to resetting multiple times - something
> that with trylock
> we mostly avoid today within amdgpu (see amdgpu_device_lock_adev and
> amdgpu_device_lock_hive_adev)
> Daniel mentioned it's not a problem but I still haven't understood why not.
> 
> Andrey
> 
> 
>      
> 
>     Thanks !
> 
>      
> 
>     ------------------------------------------
> 
>     Monk Liu | Cloud-GPU Core team
> 
>     ------------------------------------------
> 
>      
> 
