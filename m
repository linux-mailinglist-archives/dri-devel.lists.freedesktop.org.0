Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CA13F2823
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 10:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF05F6EA3A;
	Fri, 20 Aug 2021 08:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2056.outbound.protection.outlook.com [40.107.102.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2EC6EA38;
 Fri, 20 Aug 2021 08:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJJGS7th/o0PTFmo4LW/xFyIa6+gAzTNghQqNz9Ni3i7FU+vBf5aPRdwbhPkB9sAu0e5AZpYL+JoN+xZsSN8jm4rROVvoFYJdNDJ+Xiv8tL6mI1y0AN/ngD45MNSU5AfHXyb+BF+5dEKTEqxAHjkE7WjMyv0NvBpfwLlLcOu8OeduzD6qBOm/NRvPWpANPPlP7V18X0V2mUb+4RV2MIHl9WSNP7y6oEVtXDAOwUlh8+7WwN+VYcc1i8WL/BfFAX2ydTR7JNrQvxopFDq8D8FdLYhgte74Z+x7nkCXnNW2TmJ+9ZCvqeo0ZeAgBgawIYzAO3LeyfvGvD5947R6/awjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tv9cLz9ZXLE+ib1QVgE+WqiSyQHdEnjvV15jf7PMAoo=;
 b=MN9rGiIT61siUXE4okN7UObOrWUDjGFoFLi1f/wb8DGvbzgcHqI3N5GSjhYnEddpaJiixTx3BwZo8+CLbhH1nCM+lU5pIFmFBMh0Ub1IdL/ejg4i6vMseGgQs+Ut69vQnwm2YS/OIB1eCQ1kE49TZZOGEliI/Z8mEy0KGflVhSrC2oZDIuqHzMrYsxQpKJc9YnMnnRi1y9c3p/VTnecmAOGMyzdw3l3byI9f8RGq0TyO2QUQLItg1sI+ARiTpMQHkLP8GR8yv+kIhLnm6JFjEyBOXLPpWmn5rdQwxW6vIuRzfUepGZ41Ul0QwibCjI2LG/xxsbn9hAp9+VjVFPAN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tv9cLz9ZXLE+ib1QVgE+WqiSyQHdEnjvV15jf7PMAoo=;
 b=tByR7vT2cDN5iOmA3WLJo7o/MHs5Lcmq9tZqAWBXIv3tpJC1utfNGLSQDhu81o8U+im3oufh1BBjRBpTdnALzKgWqKvPS1fTF++cMauq5o2heSoi3gr562hzUusnu12vHcIQba8aTjkOJtHp6WCe6MKTL1KeKx8B39I+EKgV6ko=
Received: from MW4PR04CA0314.namprd04.prod.outlook.com (2603:10b6:303:82::19)
 by DM6PR12MB2940.namprd12.prod.outlook.com (2603:10b6:5:15f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 08:09:41 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::dc) by MW4PR04CA0314.outlook.office365.com
 (2603:10b6:303:82::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 08:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 08:09:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 20 Aug
 2021 03:09:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 20 Aug
 2021 03:09:39 -0500
Received: from wayne-dev (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 20 Aug 2021 03:09:37 -0500
Date: Fri, 20 Aug 2021 16:09:36 +0800
From: Jingwen Chen <Jingwen.Chen2@amd.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, Daniel Vetter <daniel@ffwll.ch>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>
CC: Alex Deucher <alexdeucher@gmail.com>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Message-ID: <20210820080936.welwdg73muojh7k5@wayne-dev>
References: <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <BL1PR12MB52690CB11358D0298AABC8C084C09@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB526995BE01F10A5F7D8158F184C19@BL1PR12MB5269.namprd12.prod.outlook.com>
 <ede7948c-3365-d98c-464b-6c3356b914b8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ede7948c-3365-d98c-464b-6c3356b914b8@amd.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 956baf16-4d35-4f5d-d9d6-08d963b1dc97
X-MS-TrafficTypeDiagnostic: DM6PR12MB2940:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2940F7E3E24BF5E5844C85F1B7C19@DM6PR12MB2940.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:348;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mAXgE0YBJUqMd2B8Le2abB99QnrXG4sqLADfnMXvr2/PENImZyyUsj7he9Ma4tx9OK//oPjFv88ZZToUxg475k/ttZbTfwSzUhzMqpeSpuJwPJ1Mwsju7cwuLoCM3M7vusHkaU93Lj2p18nGKfK8+i27+d+U7EUV1YrxryiEtDLeH86+iMEeHkRfuOiHubickxDKGXuIEX+6sDy4e0hTw59bXMQv78pnuO8RFu/TihJIBAJQ8gSSTx3iWVWNtvJvDQ+vcWB5sxDRi9BsnbVUS/JPrHT/LAeQVDzW30JoY++VuMY3w4jpvwS20nLTzM0uN25tQe/hhJBSzVUlTcPLf6VGlZm4o6U3YS2c5D85XklOf1vgL2lE0JQ5Mmpi3usb+ULQcI2XFAsGwEL3Fe7tD9aXBQjo4C7qy0WFqsj7uLmUG51t7IqfVkbHiROj2ViqDsKBltx+zv6ZHARxSiw0d1eM18GFIKzCbvXqmbqqd/Fj+Q7c7ixMwbhaVi5D9cDNU7nTS8cx8rRYNPbXHXoRLLpS9qfqDFXTE6V7c7AFBuZfDM+6jEgY3xnJLi7/UMMhAWRA+TntdXKHdEpbE1PZS0TIn9dAFyAj1hkxVaqwL5JcTfWGPGePkeYTQIh50+cPyVXyjOb7fqWooN4zdKQJTpEfKGGq+VWkT9bJhXi59CkMeNpkABhICLeWVqPYNUkmL/Czr8GtcgOMGcmbYm1poby2YWuJej4z71l3KT3u8dlW00oA8NBrU9BE9Q7bhMj3zsSCmTBGVatkE6pT/n9jMILtCPOHRFnqzsm2vsBUoXDGr057feZbeOcaX0ZqhLnXQHxQgB3CFxNogG2wMlMP3amCfU+XK0Nu9D6/FloSDwI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(36840700001)(46966006)(2906002)(8936002)(186003)(30864003)(55016002)(6636002)(36860700001)(70206006)(70586007)(53546011)(26005)(426003)(9686003)(336012)(8676002)(82310400003)(478600001)(47076005)(966005)(86362001)(81166007)(356005)(34020700004)(4326008)(33716001)(110136005)(54906003)(1076003)(5660300002)(316002)(83380400001)(82740400003)(45080400002)(66574015)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 08:09:40.9357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 956baf16-4d35-4f5d-d9d6-08d963b1dc97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2940
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

Hi all,

I just submit a v3 patch according your opinion on using kthread_park
instead.

Thanks,
Jingwen
On Fri Aug 20, 2021 at 09:20:42AM +0200, Christian König wrote:
> No, that perfectly works for me.
> 
> The problem we used to have with this approach was that we potentially have
> multiple timeouts at the same time.
> 
> But when we serialize the timeout handling by using a single workqueue as
> suggested by Daniel now as well then that isn't an issue any more.
> 
> Regards,
> Christian.
> 
> Am 20.08.21 um 09:12 schrieb Liu, Monk:
> > [AMD Official Use Only]
> > 
> > @Daniel Vetter @Grodzovsky, Andrey @Koenig, Christian
> > Do you have any concern on the kthread_park() approach ?
> > 
> > Theoretically speaking sched_main shall run there exclusively with job_timeout since they both touches jobs, and stop scheduler during job_timeout won't impact performance since in that scenario
> > There was already something wrong/stuck on that ring/scheduler
> > 
> > Thanks
> > 
> > ------------------------------------------
> > Monk Liu | Cloud-GPU Core team
> > ------------------------------------------
> > 
> > -----Original Message-----
> > From: Liu, Monk
> > Sent: Thursday, August 19, 2021 6:26 PM
> > To: Daniel Vetter <daniel@ffwll.ch>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> > Cc: Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Koenig, Christian <Christian.Koenig@amd.com>
> > Subject: RE: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
> > 
> > [AMD Official Use Only]
> > 
> > Hi Daniel
> > 
> > > > Why can't we stop the scheduler thread first, so that there's guaranteed no race? I've recently had a lot of discussions with panfrost folks about their reset that spawns across engines, and without stopping the scheduler thread first before you touch anything it's just plain impossible.
> > Yeah we had this though as well in our mind.
> > 
> > Our second approach is to call ktrhead_stop() in job_timedout() routine so that  the "bad" job is guaranteed to be used without scheduler's touching or freeing, Check this sample patch one as well please:
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index a2a9536..50a49cb 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -319,17 +319,12 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >          sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> >          /* Protects against concurrent deletion in drm_sched_get_cleanup_job */
> > +       kthread_park(sched->thread);
> >          spin_lock(&sched->job_list_lock);
> >          job = list_first_entry_or_null(&sched->pending_list,
> >                                         struct drm_sched_job, list);
> >          if (job) {
> > -               /*
> > -                * Remove the bad job so it cannot be freed by concurrent
> > -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > -                * is parked at which point it's safe.
> > -                */
> > -               list_del_init(&job->list);
> >                  spin_unlock(&sched->job_list_lock);
> >                  status = job->sched->ops->timedout_job(job);
> > @@ -345,6 +340,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >          } else {
> >                  spin_unlock(&sched->job_list_lock);
> >          }
> > +       kthread_unpark(sched->thread);
> >          if (status != DRM_GPU_SCHED_STAT_ENODEV) {
> >                  spin_lock(&sched->job_list_lock); @@ -393,20 +389,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >          kthread_park(sched->thread);
> >          /*
> > -        * Reinsert back the bad job here - now it's safe as
> > -        * drm_sched_get_cleanup_job cannot race against us and release the
> > -        * bad job at this point - we parked (waited for) any in progress
> > -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > -        * now until the scheduler thread is unparked.
> > -        */
> > -       if (bad && bad->sched == sched)
> > -               /*
> > -                * Add at the head of the queue to reflect it was the earliest
> > -                * job extracted.
> > -                */
> > -               list_add(&bad->list, &sched->pending_list);
> > -
> > -       /*
> >           * Iterate the job list from later to  earlier one and either deactive
> >           * their HW callbacks or remove them from pending list if they already
> >           * signaled.
> > 
> > 
> > Thanks
> > 
> > ------------------------------------------
> > Monk Liu | Cloud-GPU Core team
> > ------------------------------------------
> > 
> > -----Original Message-----
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: Thursday, August 19, 2021 5:31 PM
> > To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>; Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Liu, Monk <Monk.Liu@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> > Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
> > 
> > On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
> > > On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
> > > > On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
> > > > > On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
> > > > > > On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
> > > > > > > On 2021-08-18 10:02 a.m., Alex Deucher wrote:
> > > > > > > 
> > > > > > > > + dri-devel
> > > > > > > > 
> > > > > > > > Since scheduler is a shared component, please add dri-devel
> > > > > > > > on all scheduler patches.
> > > > > > > > 
> > > > > > > > On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
> > > > > > > > > [Why]
> > > > > > > > > for bailing job, this commit will delete it from pending
> > > > > > > > > list thus the bailing job will never have a chance to be
> > > > > > > > > resubmitted even in advance tdr mode.
> > > > > > > > > 
> > > > > > > > > [How]
> > > > > > > > > after embeded hw_fence into amdgpu_job is done, the race
> > > > > > > > > condition that this commit tries to work around is
> > > > > > > > > completely solved.So revert this commit.
> > > > > > > > > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> > > > > > > > > v2:
> > > > > > > > > add dma_fence_get/put() around timedout_job to avoid
> > > > > > > > > concurrent delete during processing timedout_job
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > > > > > > > ---
> > > > > > > > >      drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
> > > > > > > > >      1 file changed, 5 insertions(+), 18 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > index a2a953693b45..f9b9b3aefc4a 100644
> > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > >      {
> > > > > > > > >             struct drm_gpu_scheduler *sched;
> > > > > > > > >             struct drm_sched_job *job;
> > > > > > > > > +       struct dma_fence *fence;
> > > > > > > > >             enum drm_gpu_sched_stat status =
> > > > > > > > > DRM_GPU_SCHED_STAT_NOMINAL;
> > > > > > > > > 
> > > > > > > > >             sched = container_of(work, struct
> > > > > > > > > drm_gpu_scheduler, work_tdr.work); @@ -325,11 +326,10 @@
> > > > > > > > > static void drm_sched_job_timedout(struct work_struct
> > > > > > > > > *work)
> > > > > > > > > 
> > > > > > > > >             if (job) {
> > > > > > > > >                     /*
> > > > > > > > > -                * Remove the bad job so it cannot be freed by concurrent
> > > > > > > > > -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > > > > > > > > -                * is parked at which point it's safe.
> > > > > > > > > +                * Get job->s_fence->parent here to avoid concurrent delete during
> > > > > > > > > +                * processing timedout_job
> > > > > > > > >                      */
> > > > > > > > > -               list_del_init(&job->list);
> > > > > > > > > +               fence =
> > > > > > > > > + dma_fence_get(job->s_fence->parent);
> > > > > > > While this is true for amdgpu, it has no meaning for other
> > > > > > > drivers for whom we haven't done the refactoring of embedding
> > > > > > > HW fence (parent) into the job structure.
> > > > > > > In fact thinking
> > > > > > > about it, unless you do the HW fence embedding for all the
> > > > > > > drivers using the scheduler you cannot revert this patch or
> > > > > > > you will just break them.
> > > > > > btw, why did you do that embedding? I do still have my patches
> > > > > > with dma_fence annotations floating around, but my idea at least
> > > > > > was to fix that issue with a mempool, not with embeddeding. What
> > > > > > was the motivation for embedding the wh fence?
> > > > > > -Daniel
> > > > > The motivation was 2 fold, avoid memory allocation during jobs
> > > > > submissions (HW fence allocation) because as Christian explained
> > > > > this leads to deadlock with mm code during evictions due to memory
> > > > > pressure (Christian can clarify if I messed
> > > > Yeah that's the exact same thing I've chased with my dma_fence
> > > > annotations, but thus far zero to none interested in getting it
> > > > sorted. I think it'd be good to have some cross-driver agreement on
> > > > how this should be solved before someone just charges ahead ...
> > > > 
> > > > > this explanation). Second is to exactly revert this patch because
> > > > > while it solved the issue described in the patch it created
> > > > > another with drivers who baildc out early during TDR handling for
> > > > > various reason and the job would just leak because it was already
> > > > > removed form pending list.
> > > > Can't we reinsert it before we restart the scheduler thread? It
> > > > might need a separate list for that due to the lockless queue
> > > > tricks. Or am I thinking about the wrong kind of "we lost the job"?
> > > > -Danile
> > > 
> > > If you look at the original patch it would reinsert it even earlier -
> > > right after stopping the  SW scheduler thread, and even then it was to
> > > late for some drivers as they would decide to return back from their
> > > TDR handler even before that. It is solvable but in an ugly way as far
> > > as I see, you need to require each driver in his code to put the job
> > > back in the list if they do it before reaching the place where
> > > scheduler framework does it. Kind of spaghetti code seems to me.
> > Hm yeah I didn't realize this all happens before we stop the scheduler thread.
> > 
> > Why can't we stop the scheduler thread first, so that there's guaranteed no race? I've recently had a lot of discussions with panfrost folks about their reset that spawns across engines, and without stopping the scheduler thread first before you touch anything it's just plain impossible.
> > 
> > I'm also still not understanding what exactly you guys have done, can someone please dig out the the amdgpu patches that motivate all this maybe that's clearer? A full explanation would still be good since I've only started in scheduler stuff.
> > 
> > Another thing I recently pondered for tdr races looking at i915 code is whether the tdr should first block the completion fence for that job. My motivation is to have a race-free error capture (if the completion races then we might start evicting memory and everything goes boom), but maybe that helps here too. Some kind of atomic "block this fence from completing thing.
> > 
> > Or I'm I completely guessing in the wrong direction?
> > -Daniel
> > 
> > > Andrey
> > > 
> > > 
> > > > > Andrey
> > > > > 
> > > > > 
> > > > > > > Andrey
> > > > > > > 
> > > > > > > 
> > > > > > > > >                     spin_unlock(&sched->job_list_lock);
> > > > > > > > > 
> > > > > > > > >                     status =
> > > > > > > > > job->sched->ops->timedout_job(job);
> > > > > > > > > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > > >                             job->sched->ops->free_job(job);
> > > > > > > > >                             sched->free_guilty = false;
> > > > > > > > >                     }
> > > > > > > > > +               dma_fence_put(fence);
> > > > > > > > >             } else {
> > > > > > > > >                     spin_unlock(&sched->job_list_lock);
> > > > > > > > >             }
> > > > > > > > > @@ -392,20 +393,6 @@ void drm_sched_stop(struct
> > > > > > > > > drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > > > > > > > 
> > > > > > > > >             kthread_park(sched->thread);
> > > > > > > > > 
> > > > > > > > > -       /*
> > > > > > > > > -        * Reinsert back the bad job here - now it's safe as
> > > > > > > > > -        * drm_sched_get_cleanup_job cannot race against us and release the
> > > > > > > > > -        * bad job at this point - we parked (waited for) any in progress
> > > > > > > > > -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > > > > > > > > -        * now until the scheduler thread is unparked.
> > > > > > > > > -        */
> > > > > > > > > -       if (bad && bad->sched == sched)
> > > > > > > > > -               /*
> > > > > > > > > -                * Add at the head of the queue to reflect it was the earliest
> > > > > > > > > -                * job extracted.
> > > > > > > > > -                */
> > > > > > > > > -               list_add(&bad->list, &sched->pending_list);
> > > > > > > > > -
> > > > > > > > >             /*
> > > > > > > > >              * Iterate the job list from later to  earlier one and either deactive
> > > > > > > > >              * their HW callbacks or remove them from
> > > > > > > > > pending list if they already
> > > > > > > > > --
> > > > > > > > > 2.25.1
> > > > > > > > > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cmonk.liu%40amd.com%7C27fcce7ca8dd4f39608508d962f40f33%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637649622657672189%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JVZtg3AhbiA%2FDmVbNGo3MxVliO83nh8%2Fi50PCMsvwyY%3D&amp;reserved=0
> 
