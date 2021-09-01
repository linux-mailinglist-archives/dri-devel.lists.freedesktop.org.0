Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFAD3FD274
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 06:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8C56E04E;
	Wed,  1 Sep 2021 04:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA966E045;
 Wed,  1 Sep 2021 04:40:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQng3HT/wXDeDxdAUuk4BU8a4yUZZgiSEKxs9FowxWrfRJ9cjdO9Q1bs62js0/6z0wgGrZk//DCT7vqxZvi/CmMRUsiq7AKqRsfvVWt5E7I7cuTSfGvi4snPrdxUfszFz4Cu/hTFym/nh8tzTEBvoEfkhdbN3efbpSEvL9s6Hvbkxb45uRCimxDCyJtywgihFCKWWZynjJgKy1P5INiH8YA7mg/7ovC1puadZ8gpL1fHXHTmtuaPWOk5fUA3tSzGeEXFqWSD2xDZEIJ+oKm3ifJMSOp0Jst9M2dk+drCamljzhtwdETHDr4GdyxsdgaKXHg4GkvCSHjx+sma6G5DYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=cRyLNNVKQqmJnS/kg+jBQtujzYv0eiuUXYsVgApWFCc=;
 b=nfbRl0J0Tu3RrWNO6Zy3LPB+TSUgWJ1S4e9YxO5tZyycrVwfQ5rVSJX6tZRbVgtGcaO8qNzdTvFiAnqbpsOYjoavBGwntTD9l6WsPVx7MIpUqIt56Sw+Fojp/nI+0BezVlNo0iEzgABWjkylQ2EI3kWexCExpcpe3IbpqCm9J8YA3/E/yLD5/5Y//h6OOvYgXkdOYpn8pWpzSUheqx6uiw42JooELufTmm1SryNyQos28Y8QR+6hiYlbBj8Q/0A8WiPaVPR9qSH8m1F9jNcr4M8g/cHZMizS6tSy4/qusbZNEECwTCSTfEJluHQxqE35tAmdG6yz/jn22G7VW3x7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRyLNNVKQqmJnS/kg+jBQtujzYv0eiuUXYsVgApWFCc=;
 b=NZRscN25Fl7GadjSLa9WXcXEw4JN2mmiwU/r+ha8GucIHmyYZKjoSDN9U5kpv/OfaM2dDBEaaaRK1RNf8gsPpPrG+MrWoQMlT7Xq5A8N5ttKGVPZlKLXUG+jUMAu3YLl03Kny+mLDOGlyO6FpRp9qWyaiI8foO8V64Xp6LF5zxo=
Received: from MW4PR03CA0292.namprd03.prod.outlook.com (2603:10b6:303:b5::27)
 by MWHPR12MB1342.namprd12.prod.outlook.com (2603:10b6:300:e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 04:40:19 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::ec) by MW4PR03CA0292.outlook.office365.com
 (2603:10b6:303:b5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Wed, 1 Sep 2021 04:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 04:40:19 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 23:40:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 21:40:17 -0700
Received: from wayne-dev (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Tue, 31 Aug 2021 23:40:16 -0500
Date: Wed, 1 Sep 2021 12:40:15 +0800
From: Jingwen Chen <Jingwen.Chen2@amd.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: DRI Development <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Message-ID: <20210901044015.bnevloqxl6qw7jl3@wayne-dev>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <abf7b9de-67ef-25d4-a4be-11df93d2f799@amd.com>
 <20210901042513.nn3kdnh6xqkrbarn@wayne-dev>
 <9ee69f03-5636-0171-a3f8-bd3c5d79b592@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ee69f03-5636-0171-a3f8-bd3c5d79b592@amd.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce79a3d6-1dd7-4dd2-e7cf-08d96d029a5c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1342:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1342EAF8F82A7AD0011E5AD5B7CD9@MWHPR12MB1342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /cZEY1d5EBqMGcVWhP37tHqoWNfmS3ynfooASPO0wFAfqs2Co4yl7wVre6r8Rr7cB+ar9HEY98SvCLTrprzQvMbJVV4E7kaMNz5fXP4y/Ccb4MnnMrT+YodgVgAMDCSU/+rJcZEmH43COYUdXdmSUsxFBAWsmHF0pkBgHhfePRNcgYfL8zqrWrLZ0K4MgWTsjhsaW50Im2hBjXP7cew6pocJ2xc1FLlDDFRFV81GhYz/9vm3YOdUmPabF+wWoExRHDBAnG5hzMiAdfGuXs4+Q18briCYsVlcpazlAJEdLgWS0HZWPPgq1EnnZ4Lyk1X/mJePSlC4HBP2roImYGii0m7mwl7NgFY/21snDAOSCaJd2je5Gs2b0YWk8Q//MpCBL74oUBmtnC1/E3xAXypbomn224pjMfegq2E6VxzjbiW+YboQhQpxpTJERof2LBGV95wvDK0Tg6azYWXPwauqrqFjtFUDy6qT0lW+cuLbV3m8YR2WsbRGRooZ2iH3YLgCVJgh9RssRXqVTts9h7IIlNWukMRkRHBQ+8InNlVp2LusPXae/Kt414WkwKZEEtRbsi6CKKYtbIFQmNPjd83tve3XrzuS6RSiYmRh5chzk9MPmCrxmjH8UA6Hxg5DKs7FzxhVahq4dcBSiU0VDrleHoMkw88dW6+HmchCDpTQvbVCEppyPFmBg4akjyElie0kYcwNfZZMggHOIR4HEp8YsrLTlqcOtaO/P3m8Jlg8U3I=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(84040400005)(46966006)(36840700001)(53546011)(86362001)(1076003)(33716001)(26005)(186003)(316002)(36860700001)(82740400003)(83380400001)(356005)(110136005)(478600001)(9686003)(4326008)(336012)(5660300002)(81166007)(8936002)(82310400003)(2906002)(8676002)(54906003)(47076005)(70586007)(70206006)(426003)(55016002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 04:40:19.5218 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce79a3d6-1dd7-4dd2-e7cf-08d96d029a5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1342
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

On Wed Sep 01, 2021 at 12:28:59AM -0400, Andrey Grodzovsky wrote:
> 
> On 2021-09-01 12:25 a.m., Jingwen Chen wrote:
> > On Wed Sep 01, 2021 at 12:04:47AM -0400, Andrey Grodzovsky wrote:
> > > I will answer everything here -
> > > 
> > > On 2021-08-31 9:58 p.m., Liu, Monk wrote:
> > > 
> > > 
> > >      [AMD Official Use Only]
> > > 
> > > 
> > >      In the previous discussion, you guys stated that we should drop the
> > >      “kthread_should_park” in cleanup_job.
> > > 
> > > 
> > >      @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler
> > >      *sched)
> > > 
> > >      {
> > > 
> > >              struct drm_sched_job *job, *next;
> > > 
> > > 
> > >      -       /*
> > > 
> > >      -        * Don't destroy jobs while the timeout worker is running  OR
> > >      thread
> > > 
> > >      -        * is being parked and hence assumed to not touch pending_list
> > > 
> > >      -        */
> > > 
> > >      -       if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> > > 
> > >      -           !cancel_delayed_work(&sched->work_tdr)) ||
> > > 
> > >      -           kthread_should_park())
> > > 
> > >      -               return NULL;
> > > 
> > > 
> > >      But I suddenly have a question here: if return the timedout job no matter
> > >      kthread_should_park() or not, then we are backing to the original problem
> > >      again: that the timedout_job is suddenly signaling and cleanup_job still
> > >      returns it to sched_main and job is freed while it is still handling by
> > >      vendor’s timeout callback
> > > 
> > > 
> > >      If we return NULL when kthread_should_park() in cleanup_job, we can prevent
> > >      above scenario from happening: once a job is processed by job_timedout we
> > >      can stop its scheduler, and after that even this job suddenly signaled the
> > >      cleanup_job won’t return it so sched_main won’t free it in parallel …
> > > 
> > > 
> > >      What do you think ?
> > > 
> > > 
> > > Is your analysis above takes into account that you also submit
> > > '[PATCH 2/2] drm/sched: serialize job_timeout and scheduler' then I don't see a
> > > problem -
> > Hi Andrey,
> > Monk has talked to me and we agreed that as there're multiple opinions about the
> > '[PATCH 2/2] drm/sched: serialize job_timeout and scheduler' and patch
> > 1 is an independent patch to fix some error. So we should not take the patch 2 into
> > analysis.
> > 
> > > I think that as long as you put kthread_park(sched->thread) BEFORE
> > > fetching next bad job from pending list (under spinlock) there is no
> > > such issue as in the case you describe because this potential bad job
> > > that became signaled will be removed from pending list before you
> > > even fetch the next job and by the time you fetch it the scheduler
> > > thread is already stopped anyway
> > > 
> > > If you don't submit and we keep the removal hack for now then also no problem
> > > because
> > > we temporary remove the job we fetch for TDR from pending list under spinlock
> > > exactly to avoid this race
> > > 
> > So can you help review [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)?
> > patch v3 keeps this kthread_should_park check.
> 
> 
> But since in both cases looks like there is no danger of use after free
> then I see no reason to keep kthread_should_park check.
> 
> Andrey
OK, I get it. So patch v4 has removed this check, can you help review
[PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)?
> 
> 
> > 
> > Best Regards,
> > JingWen
> > > 
> > >      Thanks
> > > 
> > > 
> > >      ------------------------------------------
> > > 
> > >      Monk Liu | Cloud-GPU Core team
> > > 
> > >      ------------------------------------------
> > > 
> > > 
> > >      From: Liu, Monk
> > >      Sent: Wednesday, September 1, 2021 9:23 AM
> > >      To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey
> > >      <Andrey.Grodzovsky@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Chen, JingWen
> > >      <JingWen.Chen2@amd.com>
> > >      Cc: DRI Development <dri-devel@lists.freedesktop.org>;
> > >      amd-gfx@lists.freedesktop.org
> > >      Subject: [diagnostic TDR mode patches] unify our solution opinions/
> > >      suggestions in one thread
> > > 
> > > 
> > >      [AMD Official Use Only]
> > > 
> > > 
> > >      Hi Daniel/Christian/Andrey
> > > 
> > > 
> > >      It looks the voice from you three are spread over those email floods to me,
> > >      the feature we are working on (diagnostic TDR scheme) is pending there for
> > >      more than 6 month (we started it from feb 2021).
> > > 
> > > 
> > >      Honestly speaking the email ways that we are using now is not friendly and
> > >      quite painful to me ….
> > > 
> > >      Can we try to put all our opinions, suggestions, or even objects here
> > >      together, let’s go through them one by one, it’s too hard for us to reply
> > >      each email on different questions .
> > > 
> > > 
> > >      For [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
> > > 
> > > 
> > >      This is a fixing patch on the timeout timer in scheduler, can we complete
> > >      this one first ? it should already resolved all the questions and
> > >      suggestions.
> > > 
> > > 
> > > I have no objections for this one besides getting rid of the
> > > kthread_should_park()) return null part,
> > > if my answer above is not wrong then it seems superfluous to me
> > > 
> > > 
> > > 
> > >      For [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
> > > 
> > > 
> > >      I think I already explained the questions raised by Daniel in other thread
> > >      , regarding why I use __kthread_should_park()
> > > 
> > > 
> > > Is this race free ? Can't the other thread execute kthread_park after the check
> > > ?
> > > 
> > > 
> > >      For other aspects, can we put all our opinion synthesized here ?
> > > 
> > > 
> > > So to summarize from previous threads I think that the best solution
> > > to the problem being solved in this patch is if we do HW fence embedding
> > > at the drm_sched_job level instead of doing it only for amdgpu, and modifying
> > > all
> > > the drivers to support this we can both remove this hack and solve the race
> > > against concurrent drm_sched_cleanup_jobs job freeing just by taking reference
> > > to the hw fence of the job at the beginning of drm_sched_job_timedout
> > > 
> > > If doing this refactoring for all the drivers is not an option now and you need
> > > a quick
> > > solution such as the serialization you do here then take into account other
> > > concurrent
> > > TDR handlers that might run, as mentioned before, without serializing against
> > > other TDR handlers from other
> > > schedulers you just race here against them, e.g. you parked it now but another
> > > one in progress will unpark it as part of calling  drm_sched_start for other
> > > rings.
> > > So you either need a global lock or dedicated single threaded queue as Daniel
> > > suggested.
> > > At minimum we should change cancel_delayed_work in drm_sched_stop to
> > > cancel_delayed_work_sync
> > > to cancel and flush all concurrent TDRs and probably move it to the begining of
> > > the function, after kthread_park
> > > and before we start playing with the pending list.
> > > 
> > > P.S One comment I had regarding single threaded queue is that in case we have
> > > multiple TDR
> > > arising from same event we will proceed to resetting multiple times - something
> > > that with trylock
> > > we mostly avoid today within amdgpu (see amdgpu_device_lock_adev and
> > > amdgpu_device_lock_hive_adev)
> > > Daniel mentioned it's not a problem but I still haven't understood why not.
> > > 
> > > Andrey
> > > 
> > > 
> > > 
> > >      Thanks !
> > > 
> > > 
> > >      ------------------------------------------
> > > 
> > >      Monk Liu | Cloud-GPU Core team
> > > 
> > >      ------------------------------------------
> > > 
> > > 
