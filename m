Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B871C785E83
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 19:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568F910E08F;
	Wed, 23 Aug 2023 17:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7468C10E08F;
 Wed, 23 Aug 2023 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692811588; x=1724347588;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HQh/5Vc+eCJ9f3dstFS0fPdUdQ1x9CoVOXAT0l29OVU=;
 b=Eim/OSYjiSyhOIwQZUR8pl5+do3nUz9sbn4ZRKujiPeiD6AGCeoT+IXu
 P6GoqCyaTDBZ43W53fwBw3exq4rAtE/uOYfdznkUEGDzsw+tmhRY7x1Ih
 AkjgTnFUlvic5RLVC6fkc2QXu9cgSZHM5/x23n1tQm0qlOl/S7o0e80wz
 tPJ9cPM5j+zGXUbkQlURXME3A4/A8h+eUq9x6l0WyYKVF/n3PaTvwwGv4
 qRyw/PUIBkskYtYHWO4e/EkW72VZkMT6LXJAjRh5N69esx8uOqH67WHUy
 lV6DpaAweOZqv8OciJoC3JhtcbG2okt6pqwkpQzqftnGswEgWlCa2YXCp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="373108676"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="373108676"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880479947"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2023 10:26:31 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 10:26:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 10:26:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 10:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwyZlx6KVGExNIpTY3XY5ZWPiuuRddWIQ354+LeIBsnOxPugKHGbvpLLzR8e6EjQ5i2XgTXhXMQI3sJhg07E3jECjoq6mfpySw1GHvvWiP/WsE/SZ8qDCCL4kjJScOWQJepQd8eRpTe+ZQH5MsA4blVfglcv0DV3C/i56tB/19qjRzvyFDSSkxJd9DRiwAnhSAGC+USeyT+crxmhkpBqBmgDOgyrAyQvH/ePV45NWZjiuYd7BcPx414kkdob/ntn54HL3i1QQqw/w5xPN+3EBBUWnO9D1IaKE2MxQd2IyXf2EC2LkuqJy5dPVvw3sQoTZFKJSL2kRQk1RruiJsGJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjJIu5ppSzepbL4uVvVgT+MXjARpWaG3nGINtw/7d7o=;
 b=aXaGPckes1EJrTWJn7AkTuf9q3pJgdAz9lVNoAaEVnn4qnEDRJZ6SZcHK3P20F5fBVgWZVuwg37bhIyTZLRpKLvpJv74XAB6ObRHP++c1Y8pm+K8LEksjbWRAis22q3WLw1Lkuu2TTWvOXnNkrhYW4DTtFytpwtjMHsBaNBD4mPE/91hZTBEo7sZQhie3ENCTOl2nED0rgFBdzHJ2yoOqXY1lpSxIiu90NzRF9kY3CFwq/gqyne5OWkEyxHK4XscCvvSFH7++oWC0MlwgR+wRkUB5rhPSqq7u3umVr6Ty/RTEVRvYUAJzdrXxNoILxigYOhOJWfBnntf/ULuBDR1Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6718.namprd11.prod.outlook.com (2603:10b6:a03:477::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 17:26:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 17:26:17 +0000
Date: Wed, 23 Aug 2023 13:26:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [Intel-xe] [PATCH v2 4/9] drm/sched: Split free_job into own
 work item
Message-ID: <ZOZBMcP/TW5mSbwj@intel.com>
References: <20230811023137.659037-5-matthew.brost@intel.com>
 <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
 <ZN5exv1IWJtKL1nJ@DUT025-TGLU.fm.intel.com>
 <9f6554fd-8748-2613-1c90-921b670ad4d9@amd.com>
 <ZN9ufogOQm4xblxm@DUT025-TGLU.fm.intel.com>
 <c7c32797-9ca1-9f78-d3e6-07f827731ee6@amd.com>
 <ZOV8l08PZ/lqfGx9@DUT025-TGLU.fm.intel.com>
 <eb95b02f-7ffa-0cff-eac4-2bd8d12da730@amd.com>
 <ZOYkmAbzRFZzzQKK@DUT025-TGLU.fm.intel.com>
 <CADnq5_N9tn+iBbeGDBu5GMVEzrBA5zzZfEKizp=T21OvowtNhw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_N9tn+iBbeGDBu5GMVEzrBA5zzZfEKizp=T21OvowtNhw@mail.gmail.com>
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6718:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2e7c1d-c483-46c7-799d-08dba3fe0e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynO0iVJuTvBJ+GGeg2pusXkh4XZFlHMBPLwXC9UDOxm4VIDLia8wJ2/7gkJ4XTH5thBHsnPL7uC2BdBVdSjwGU7NGT39ibL4r7RvBjRuabFCNZoWirnzI7b2GazC9BP6nqYcJ6YcKW+uYbzi50oyEK/KZQfiZUz694Y429dGuWYER3AUjIdXbwdSdDRHFdbQ49C2sAUvGcdFjZV24LaRAyyoJWGYqa8bzBzRPSExpZStKMIaev/nTbZ5IRn8hH9KUkLc08S2mL1sYlXMcMYZIgCQXOY5UHDamCDzL+KVRFtvTRe3tPYVxznlWgm9pUKHyLh8B7DPacd0HKE1kp5erFjH+lMP+gRf+tl6dXopplVNAqGf90lM+UljOdRy/+XMKKDGhnl0JaFv8GrqfbB//pmBUlhFoaJE30ziuAzOA+G3CDj08pvOINCXcQ8s58zU5DSj8GAz+S3BjSyvDL4it8xkvXE1x8+26jVWIPVEAZkA2KlOXco7FNzY83M87aP/MBrznh6QIqHWriOcpt+QvAKUJ9WUQvcnK2g6hzlN3Vo+tZ7pEjvg10l3oJx94K38YzK3cZhE6tqgxYipzDcFqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(1800799009)(186009)(451199024)(6666004)(53546011)(2616005)(6486002)(6506007)(6512007)(86362001)(66556008)(5660300002)(4326008)(44832011)(30864003)(2906002)(7416002)(38100700002)(82960400001)(54906003)(66946007)(8676002)(8936002)(66476007)(36756003)(6916009)(41300700001)(316002)(966005)(478600001)(83380400001)(66574015)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzVTVi9HeW9YRnRVK1dOam9hZ256TmozaUwvUmoxZ3JMZWw3cWhBVWJXc0tQ?=
 =?utf-8?B?VHphdzVka096U3ljQlRxdGpGSTBTMXZqa3VyS2syZVZ2a2hEMld0QXUydklU?=
 =?utf-8?B?NzBlcjdWS28zQWZqM0c4RUxuSEpXTE5IcWlnVEtFNzd3cTlYWG9mWE1ncHM1?=
 =?utf-8?B?Szl0Z2JXRVlQU3hmVmZDNHZLT2NYSC9mb3BuaGdJa2ZNZkp6MkR0VWo0Q3Jq?=
 =?utf-8?B?OTVWRnUwdFVCUmF4V2toRVZFYjlXRlgyazVjNkMyZTZsV2s3VnY5S1c0Q0Vv?=
 =?utf-8?B?Vlg3bTFMWldmYVBqaS9XWTEySStqN2d2TGdsemJkVFd0QWFVMHFiTUMzWUds?=
 =?utf-8?B?bUFaRkdaWElSZnFqMXdmeC9kQWZuZmlMN3VNQlFaeU9GYnNwVWs0dU5qTFcx?=
 =?utf-8?B?QVNyQ2hrdmVMVUxjMVFQSmR5NmVBRWYwMTB4VEpkcHh3ak9SV2dueUVRTFNx?=
 =?utf-8?B?eEJmbGJ0T3dIb2JiYmdHWTRWRU5nOXJrWnhCdFkyY1Y4b2J0TmIvdUFBYXJT?=
 =?utf-8?B?ZlhaVWlmMnhuUVIvMFIzVnYrU2lwWXpYZFdPRDhrNURzOHRrdFZneGs3VGNq?=
 =?utf-8?B?VGkwMmtyMStOV3Y0eDIwTVFMQU9oZEFadVVsVUl6clNleitKNEV2dGU0bm0z?=
 =?utf-8?B?MUJKbEpyMVowRWNIN2J3aFlXc0t0WEVpVHh2YjlaMDlDRHhRK2pXTDd4aSt5?=
 =?utf-8?B?cm9HNlFaUkNUMEN5L0hpcmYwUHhaaTNWVGxVd1Z3WllpaVRmNHpxQWM2SXcy?=
 =?utf-8?B?M1JEK1M2Q1lXRjNmek1nVDkzeTZKRnJrRld5NEZXa2FHRXVUUVlCRHVmN29n?=
 =?utf-8?B?WjUyQ0txUS8zUnM3UXR3dkN3c0FwM0QzbFJaWThlYm9uWDE3eVdnNUtaQXR2?=
 =?utf-8?B?NldFSnpxVzVEdStTTkZqS3FiaEo0ZFh3bVR0TGx6R2xES1lNYXFEVWNpdVNR?=
 =?utf-8?B?a1REZGI2NS9RMGVTUWhLVEg4U3hKRnQwM0Q3d09XcmRXNEpINHBnVHVobUlr?=
 =?utf-8?B?QnhoQjU1VkFNUGFYSjk3bWR3U3FJdkZ4c1pOMGtLZlZQcVJ5WjljZXlMTnlS?=
 =?utf-8?B?Y2lZKzcvaDRIY2dNMCtYTnQ1aklmdHpVZUtJcDJkOSs4R25ZdFU5bTFXZmlT?=
 =?utf-8?B?QnBubHFoY1g4cXJDRmJRSzJiclZpZGNFN0JXUnR1aElLcHl5UldRdnJONDVo?=
 =?utf-8?B?S1J5OEk5TGJadWNmeFlBY0IrdmpLbVcxWXhMS0FYUEYycTZoZTZJTXlhQ3U5?=
 =?utf-8?B?SzZGaTViZXJmMThYdW9HazMxZ1FzalFzZHZ3MFowTGFIRThDSWk4MjdpY3F3?=
 =?utf-8?B?ODZMTlVmRU9EVmFCQ2xXZUxJaDlvNzZybFdhWlNjUS9HUWRoVU9EMmluKzFF?=
 =?utf-8?B?TDJoMmZMSmFIK3BzQlI5bnBITmVtU3pYc1gxN2NxSXVkRkdYZkJVMEU4UjdF?=
 =?utf-8?B?V0E3emFzd1BTM24vSk9qSGFWTDVzZWl2M0R1VmlFNXhJa09CbzNlQ0dRNUw3?=
 =?utf-8?B?SmZHQmlURFVpSjRib0Zzdks0YWJQeVR4cGx1NUVYL3FJZjBMRk5PaHRrcWE0?=
 =?utf-8?B?czRMSUpIWjdDYmthSW9OZVJYZVAvV01aUHBHcE5peTRYc0dRTjZCQWxKNWda?=
 =?utf-8?B?NmpsZUlNZk9WUWF2aDVrRlU2L0krWURCTldxMFZtT25PUVZGS1FGMWh6VENh?=
 =?utf-8?B?bmhqeUhodmQ4OW9RTHZLSUtkMHMrUDBuQnJGY2p0TDNKWVlMT05mdDRudU1v?=
 =?utf-8?B?cEx4TGREYmlVSnBHYnZGL1F4cVY1ZS9RMHoxQkxZaFgxN3JaWm1hUEZFYlVU?=
 =?utf-8?B?bmFSRklYa1RXTjd2clZFOHIrRU1ZNElPOHRzcUJEYStRN1VOMzZDZ0hUTS9C?=
 =?utf-8?B?U25Gdkk3OC9UTDFra1o1UUEyeTluQWlNVUFTbEwya245VTJicWd4QTdSckk2?=
 =?utf-8?B?cTJUZ3FYUEdkd01OM3lNSFkvZHRXcjRwK0FGVjE5YmN3SFcrMENnRThaVUFk?=
 =?utf-8?B?RzNDWE5HWmVXOVlhcElkRm5mRnhWQlpncjJsY2pFbC9Sa0VXcVc3WTZjSVpQ?=
 =?utf-8?B?bnp5cjNuNnUvR2x3eXI1NlBPbU1KVmMwLzkycUZQTnJXakdGdE1lNlRwb2k4?=
 =?utf-8?B?SVRmd29zekd4Z0w0Q2VuaXpqdjkvKzlhMFIrVnQzUC9seFp4NGRsVXhlMFJ0?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2e7c1d-c483-46c7-799d-08dba3fe0e32
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 17:26:17.8637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lF4PKxutiwJ52YulDyiDXGoDJhKKdpj9skux7UhTHH2QG4aDot12fJIb8hUNql7xWPbh6vMrnHiynFyT18brqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6718
X-OriginatorOrg: intel.com
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 11:41:19AM -0400, Alex Deucher wrote:
> On Wed, Aug 23, 2023 at 11:26 AM Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > On Wed, Aug 23, 2023 at 09:10:51AM +0200, Christian König wrote:
> > > Am 23.08.23 um 05:27 schrieb Matthew Brost:
> > > > [SNIP]
> > > > > That is exactly what I want to avoid, tying the TDR to the job is what some
> > > > > AMD engineers pushed for because it looked like a simple solution and made
> > > > > the whole thing similar to what Windows does.
> > > > >
> > > > > This turned the previous relatively clean scheduler and TDR design into a
> > > > > complete nightmare. The job contains quite a bunch of things which are not
> > > > > necessarily available after the application which submitted the job is torn
> > > > > down.
> > > > >
> > > > Agree the TDR shouldn't be accessing anything application specific
> > > > rather just internal job state required to tear the job down on the
> > > > hardware.
> > > > > So what happens is that you either have stale pointers in the TDR which can
> > > > > go boom extremely easily or we somehow find a way to keep the necessary
> > > > I have not experenced the TDR going boom in Xe.
> > > >
> > > > > structures (which include struct thread_info and struct file for this driver
> > > > > connection) alive until all submissions are completed.
> > > > >
> > > > In Xe we keep everything alive until all submissions are completed. By
> > > > everything I mean the drm job, entity, scheduler, and VM via a reference
> > > > counting scheme. All of these structures are just kernel state which can
> > > > safely be accessed even if the application has been killed.
> > >
> > > Yeah, but that might just not be such a good idea from memory management
> > > point of view.
> > >
> > > When you (for example) kill a process all resource from that progress should
> > > at least be queued to be freed more or less immediately.
> > >
> >
> > We do this, the TDR kicks jobs off the hardware as fast as the hw
> > interface allows and signals all pending hw fences immediately after.
> > Free jobs then is immediately called and the reference count goes to
> > zero. I think max time for all of this to occur is a handful of ms.
> >
> > > What Linux is doing for other I/O operations is to keep the relevant pages
> > > alive until the I/O operation is completed, but for GPUs that usually means
> > > keeping most of the memory of the process alive and that in turn is really
> > > not something you can do.
> > >
> > > You can of course do this if your driver has a reliable way of killing your
> > > submissions and freeing resources in a reasonable amount of time. This
> > > should then be done in the flush callback.
> > >
> >
> > 'flush callback' - Do you mean drm_sched_entity_flush? I looked at that
> > and think that function doesn't even work for what I tell. It flushes
> > the spsc queue but what about jobs on the hardware, how do those get
> > killed?
> >
> > As stated we do via the TDR which is rather clean design and fits with
> > our reference couting scheme.
> >
> > > > If we need to teardown on demand we just set the TDR to a minimum value and
> > > > it kicks the jobs off the hardware, gracefully cleans everything up and
> > > > drops all references. This is a benefit of the 1 to 1 relationship, not
> > > > sure if this works with how AMDGPU uses the scheduler.
> > > >
> > > > > Delaying application tear down is also not an option because then you run
> > > > > into massive trouble with the OOM killer (or more generally OOM handling).
> > > > > See what we do in drm_sched_entity_flush() as well.
> > > > >
> > > > Not an issue for Xe, we never call drm_sched_entity_flush as our
> > > > referencing counting scheme is all jobs are finished before we attempt
> > > > to tear down entity / scheduler.
> > >
> > > I don't think you can do that upstream. Calling drm_sched_entity_flush() is
> > > a must have from your flush callback for the file descriptor.
> > >
> >
> > Again 'flush callback'? What are you refering too.
> >
> > And why does drm_sched_entity_flush need to be called, doesn't seem to
> > do anything useful.
> >
> > > Unless you have some other method for killing your submissions this would
> > > give a path for a deny of service attack vector when the Xe driver is in
> > > use.
> > >
> >
> > Yes, once th TDR fires is disallows all new submissions at the exec
> > IOCTL plus flushes any pending submissions as fast as possible.
> >
> > > > > Since adding the TDR support we completely exercised this through in the
> > > > > last two or three years or so. And to sum it up I would really like to get
> > > > > away from this mess again.
> > > > >
> > > > > Compared to that what i915 does is actually rather clean I think.
> > > > >
> > > > Not even close, resets where a nightmare in the i915 (I spend years
> > > > trying to get this right and probably still completely work) and in Xe
> > > > basically got it right on the attempt.
> > > >
> > > > > >    Also in Xe some of
> > > > > > things done in free_job cannot be from an IRQ context, hence calling
> > > > > > this from the scheduler worker is rather helpful.
> > > > > Well putting things for cleanup into a workitem doesn't sounds like
> > > > > something hard.
> > > > >
> > > > That is exactly what we doing in the scheduler with the free_job
> > > > workitem.
> > >
> > > Yeah, but I think that we do it in the scheduler and not the driver is
> > > problematic.

Christian, I do see your point on simply get rid of free job callbacks here
then use fence with own-driver workqueue and house cleaning. But I wonder if
starting with this patch as a clear separation of that is not a step forward
and that could be cleaned up on a follow up!?

Matt, why exactly do we need the separation in this patch? Commit message tells
what it is doing and that it is aligned with design, but is not clear on why
exactly we need this right now. Specially if in the end what we want is exactly
keeping the submit_wq to ensure the serialization of the operations you mentioned.
I mean, could we simply drop this patch and then work on a follow-up later and
investigate the Christian suggestion when we are in-tree?

> > >
> >
> > Disagree, a common clean callback from a non-irq contexts IMO is a good
> > design rather than each driver possibly having its own worker for
> > cleanup.
> >
> > > For the scheduler it shouldn't care about the job any more as soon as the
> > > driver takes over.
> > >
> >
> > This a massive rewrite for all users of the DRM scheduler, I'm saying
> > for Xe what you are suggesting makes little to no sense.
> >
> > I'd like other users of the DRM scheduler to chime in on what you
> > purposing. The scope of this change affects 8ish drivers that would
> > require buy in each of the stakeholders. I certainly can't change of
> > these drivers as I don't feel comfortable in all of those code bases nor
> > do I have hardware to test all of these drivers.
> >
> > > >
> > > > > Question is what do you really need for TDR which is not inside the hardware
> > > > > fence?
> > > > >
> > > > A reference to the entity to be able to kick the job off the hardware.
> > > > A reference to the entity, job, and VM for error capture.
> > > >
> > > > We also need a reference to the job for recovery after a GPU reset so
> > > > run_job can be called again for innocent jobs.
> > >
> > > Well exactly that's what I'm massively pushing back. Letting the scheduler
> > > call run_job() for the same job again is *NOT* something you can actually
> > > do.
> > >
> >
> > But lots of drivers do this already and the DRM scheduler documents
> > this.
> >
> > > This pretty clearly violates some of the dma_fence constrains and has cause
> > > massively headaches for me already.
> > >
> >
> > Seems to work fine in Xe.
> >
> > > What you can do is to do this inside your driver, e.g. take the jobs and
> > > push them again to the hw ring or just tell the hw to start executing again
> > > from a previous position.
> > >
> >
> > Again this now is massive rewrite of many drivers.
> >
> > > BTW that re-submitting of jobs seems to be a no-go from userspace
> > > perspective as well. Take a look at the Vulkan spec for that, at least Marek
> > > pretty much pointed out that we should absolutely not do this inside the
> > > kernel.
> > >
> >
> > Yes if the job causes the hang, we ban the queue. Typcially only per
> > entity (queue) resets are done in Xe but occasionally device level
> > resets are done (issues with hardware) and innocent jobs / entities call
> > run_job again.
> 
> If the engine is reset and the job was already executing, how can you
> determine that it's in a good state to resubmit?  What if some
> internal fence or semaphore in memory used by the logic in the command
> buffer has been signaled already and then you resubmit the job and it
> now starts executing with different input state?

I believe we could set some more rules in the new robustness documentation:
https://lore.kernel.org/all/20230818200642.276735-1-andrealmeid@igalia.com/

For this robustness implementation i915 pin point the exact context that
was in execution when the gpu hang and only blame that, although the
ressubmission is up to the user space. While on Xe we are blaming every
single context that was in the queue. So I'm actually confused on what
are the innocent jobs and who are calling for resubmission, if all of
them got banned and blamed.

> 
> Alex
> 
> >
> > > The generally right approach seems to be to cleanly signal to userspace that
> > > something bad happened and that userspace then needs to submit things again
> > > even for innocent jobs.
> > >
> >
> > I disagree that innocent jobs should be banned. What you are suggesting
> > is if a device reset needs to be done we kill / ban every user space queue.
> > Thats seems like overkill. Not seeing where that is stated in this doc
> > [1], it seems to imply that only jobs that are stuck results in bans.
> >
> > Matt
> >
> > [1] https://patchwork.freedesktop.org/patch/553465/?series=119883&rev=3
> >
> > > Regards,
> > > Christian.
> > >
> > > >
> > > > All of this leads to believe we need to stick with the design.
> > > >
> > > > Matt
> > > >
> > > > > Regards,
> > > > > Christian.
> > > > >
> > > > > > The HW fence can live for longer as it can be installed in dma-resv
> > > > > > slots, syncobjs, etc... If the job and hw fence are combined now we
> > > > > > holding on the memory for the longer and perhaps at the mercy of the
> > > > > > user. We also run the risk of the final put being done from an IRQ
> > > > > > context which again wont work in Xe as it is currently coded. Lastly 2
> > > > > > jobs from the same scheduler could do the final put in parallel, so
> > > > > > rather than having free_job serialized by the worker now multiple jobs
> > > > > > are freeing themselves at the same time. This might not be an issue but
> > > > > > adds another level of raceyness that needs to be accounted for. None of
> > > > > > this sounds desirable to me.
> > > > > >
> > > > > > FWIW what you suggesting sounds like how the i915 did things
> > > > > > (i915_request and hw fence in 1 memory alloc) and that turned out to be
> > > > > > a huge mess. As rule of thumb I generally do the opposite of whatever
> > > > > > the i915 did.
> > > > > >
> > > > > > Matt
> > > > > >
> > > > > > > Christian.
> > > > > > >
> > > > > > > > Matt
> > > > > > > >
> > > > > > > > > All the lifetime issues we had came from ignoring this fact and I think we
> > > > > > > > > should push for fixing this design up again.
> > > > > > > > >
> > > > > > > > > Regards,
> > > > > > > > > Christian.
> > > > > > > > >
> > > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > > ---
> > > > > > > > > >      drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
> > > > > > > > > >      include/drm/gpu_scheduler.h            |   8 +-
> > > > > > > > > >      2 files changed, 106 insertions(+), 39 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > index cede47afc800..b67469eac179 100644
> > > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > > @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > > > > > > > > >       * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> > > > > > > > > >       *
> > > > > > > > > >       * @rq: scheduler run queue to check.
> > > > > > > > > > + * @dequeue: dequeue selected entity
> > > > > > > > > >       *
> > > > > > > > > >       * Try to find a ready entity, returns NULL if none found.
> > > > > > > > > >       */
> > > > > > > > > >      static struct drm_sched_entity *
> > > > > > > > > > -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > > > > > > +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
> > > > > > > > > >      {
> > > > > > > > > >         struct drm_sched_entity *entity;
> > > > > > > > > > @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > > > > > >         if (entity) {
> > > > > > > > > >                 list_for_each_entry_continue(entity, &rq->entities, list) {
> > > > > > > > > >                         if (drm_sched_entity_is_ready(entity)) {
> > > > > > > > > > -                               rq->current_entity = entity;
> > > > > > > > > > -                               reinit_completion(&entity->entity_idle);
> > > > > > > > > > +                               if (dequeue) {
> > > > > > > > > > +                                       rq->current_entity = entity;
> > > > > > > > > > +                                       reinit_completion(&entity->entity_idle);
> > > > > > > > > > +                               }
> > > > > > > > > >                                 spin_unlock(&rq->lock);
> > > > > > > > > >                                 return entity;
> > > > > > > > > >                         }
> > > > > > > > > > @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > > > > > >         list_for_each_entry(entity, &rq->entities, list) {
> > > > > > > > > >                 if (drm_sched_entity_is_ready(entity)) {
> > > > > > > > > > -                       rq->current_entity = entity;
> > > > > > > > > > -                       reinit_completion(&entity->entity_idle);
> > > > > > > > > > +                       if (dequeue) {
> > > > > > > > > > +                               rq->current_entity = entity;
> > > > > > > > > > +                               reinit_completion(&entity->entity_idle);
> > > > > > > > > > +                       }
> > > > > > > > > >                         spin_unlock(&rq->lock);
> > > > > > > > > >                         return entity;
> > > > > > > > > >                 }
> > > > > > > > > > @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > > > > > >       * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> > > > > > > > > >       *
> > > > > > > > > >       * @rq: scheduler run queue to check.
> > > > > > > > > > + * @dequeue: dequeue selected entity
> > > > > > > > > >       *
> > > > > > > > > >       * Find oldest waiting ready entity, returns NULL if none found.
> > > > > > > > > >       */
> > > > > > > > > >      static struct drm_sched_entity *
> > > > > > > > > > -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > > > > > > > +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
> > > > > > > > > >      {
> > > > > > > > > >         struct rb_node *rb;
> > > > > > > > > > @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > > > > > > >                 entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> > > > > > > > > >                 if (drm_sched_entity_is_ready(entity)) {
> > > > > > > > > > -                       rq->current_entity = entity;
> > > > > > > > > > -                       reinit_completion(&entity->entity_idle);
> > > > > > > > > > +                       if (dequeue) {
> > > > > > > > > > +                               rq->current_entity = entity;
> > > > > > > > > > +                               reinit_completion(&entity->entity_idle);
> > > > > > > > > > +                       }
> > > > > > > > > >                         break;
> > > > > > > > > >                 }
> > > > > > > > > >         }
> > > > > > > > > > @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > > > > > > >      }
> > > > > > > > > >      /**
> > > > > > > > > > - * drm_sched_submit_queue - scheduler queue submission
> > > > > > > > > > + * drm_sched_run_job_queue - queue job submission
> > > > > > > > > >       * @sched: scheduler instance
> > > > > > > > > >       */
> > > > > > > > > > -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> > > > > > > > > > +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> > > > > > > > > >      {
> > > > > > > > > >         if (!READ_ONCE(sched->pause_submit))
> > > > > > > > > > -               queue_work(sched->submit_wq, &sched->work_submit);
> > > > > > > > > > +               queue_work(sched->submit_wq, &sched->work_run_job);
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static struct drm_sched_entity *
> > > > > > > > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
> > > > > > > > > > +
> > > > > > > > > > +/**
> > > > > > > > > > + * drm_sched_run_job_queue_if_ready - queue job submission if ready
> > > > > > > > > > + * @sched: scheduler instance
> > > > > > > > > > + */
> > > > > > > > > > +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > > > > > > > > > +{
> > > > > > > > > > +       if (drm_sched_select_entity(sched, false))
> > > > > > > > > > +               drm_sched_run_job_queue(sched);
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +/**
> > > > > > > > > > + * drm_sched_free_job_queue - queue free job
> > > > > > > > > > + *
> > > > > > > > > > + * @sched: scheduler instance to queue free job
> > > > > > > > > > + */
> > > > > > > > > > +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> > > > > > > > > > +{
> > > > > > > > > > +       if (!READ_ONCE(sched->pause_submit))
> > > > > > > > > > +               queue_work(sched->submit_wq, &sched->work_free_job);
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +/**
> > > > > > > > > > + * drm_sched_free_job_queue_if_ready - queue free job if ready
> > > > > > > > > > + *
> > > > > > > > > > + * @sched: scheduler instance to queue free job
> > > > > > > > > > + */
> > > > > > > > > > +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > > > > > > > > > +{
> > > > > > > > > > +       struct drm_sched_job *job;
> > > > > > > > > > +
> > > > > > > > > > +       spin_lock(&sched->job_list_lock);
> > > > > > > > > > +       job = list_first_entry_or_null(&sched->pending_list,
> > > > > > > > > > +                                      struct drm_sched_job, list);
> > > > > > > > > > +       if (job && dma_fence_is_signaled(&job->s_fence->finished))
> > > > > > > > > > +               drm_sched_free_job_queue(sched);
> > > > > > > > > > +       spin_unlock(&sched->job_list_lock);
> > > > > > > > > >      }
> > > > > > > > > >      /**
> > > > > > > > > > @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
> > > > > > > > > >         dma_fence_get(&s_fence->finished);
> > > > > > > > > >         drm_sched_fence_finished(s_fence, result);
> > > > > > > > > >         dma_fence_put(&s_fence->finished);
> > > > > > > > > > -       drm_sched_submit_queue(sched);
> > > > > > > > > > +       drm_sched_free_job_queue(sched);
> > > > > > > > > >      }
> > > > > > > > > >      /**
> > > > > > > > > > @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> > > > > > > > > >      void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> > > > > > > > > >      {
> > > > > > > > > >         if (drm_sched_can_queue(sched))
> > > > > > > > > > -               drm_sched_submit_queue(sched);
> > > > > > > > > > +               drm_sched_run_job_queue(sched);
> > > > > > > > > >      }
> > > > > > > > > >      /**
> > > > > > > > > >       * drm_sched_select_entity - Select next entity to process
> > > > > > > > > >       *
> > > > > > > > > >       * @sched: scheduler instance
> > > > > > > > > > + * @dequeue: dequeue selected entity
> > > > > > > > > >       *
> > > > > > > > > >       * Returns the entity to process or NULL if none are found.
> > > > > > > > > >       */
> > > > > > > > > >      static struct drm_sched_entity *
> > > > > > > > > > -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > > > > > > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
> > > > > > > > > >      {
> > > > > > > > > >         struct drm_sched_entity *entity;
> > > > > > > > > >         int i;
> > > > > > > > > > @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > > > > > > > >         /* Kernel run queue has higher priority than normal run queue*/
> > > > > > > > > >         for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > > > > > > > > >                 entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > > > > > > > > > -                       drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> > > > > > > > > > -                       drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> > > > > > > > > > +                       drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> > > > > > > > > > +                                                       dequeue) :
> > > > > > > > > > +                       drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> > > > > > > > > > +                                                     dequeue);
> > > > > > > > > >                 if (entity)
> > > > > > > > > >                         break;
> > > > > > > > > >         }
> > > > > > > > > > @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> > > > > > > > > >      EXPORT_SYMBOL(drm_sched_pick_best);
> > > > > > > > > >      /**
> > > > > > > > > > - * drm_sched_main - main scheduler thread
> > > > > > > > > > + * drm_sched_free_job_work - worker to call free_job
> > > > > > > > > >       *
> > > > > > > > > > - * @param: scheduler instance
> > > > > > > > > > + * @w: free job work
> > > > > > > > > >       */
> > > > > > > > > > -static void drm_sched_main(struct work_struct *w)
> > > > > > > > > > +static void drm_sched_free_job_work(struct work_struct *w)
> > > > > > > > > >      {
> > > > > > > > > >         struct drm_gpu_scheduler *sched =
> > > > > > > > > > -               container_of(w, struct drm_gpu_scheduler, work_submit);
> > > > > > > > > > -       struct drm_sched_entity *entity;
> > > > > > > > > > +               container_of(w, struct drm_gpu_scheduler, work_free_job);
> > > > > > > > > >         struct drm_sched_job *cleanup_job;
> > > > > > > > > > -       int r;
> > > > > > > > > >         if (READ_ONCE(sched->pause_submit))
> > > > > > > > > >                 return;
> > > > > > > > > >         cleanup_job = drm_sched_get_cleanup_job(sched);
> > > > > > > > > > -       entity = drm_sched_select_entity(sched);
> > > > > > > > > > +       if (cleanup_job) {
> > > > > > > > > > +               sched->ops->free_job(cleanup_job);
> > > > > > > > > > +
> > > > > > > > > > +               drm_sched_free_job_queue_if_ready(sched);
> > > > > > > > > > +               drm_sched_run_job_queue_if_ready(sched);
> > > > > > > > > > +       }
> > > > > > > > > > +}
> > > > > > > > > > -       if (!entity && !cleanup_job)
> > > > > > > > > > -               return; /* No more work */
> > > > > > > > > > +/**
> > > > > > > > > > + * drm_sched_run_job_work - worker to call run_job
> > > > > > > > > > + *
> > > > > > > > > > + * @w: run job work
> > > > > > > > > > + */
> > > > > > > > > > +static void drm_sched_run_job_work(struct work_struct *w)
> > > > > > > > > > +{
> > > > > > > > > > +       struct drm_gpu_scheduler *sched =
> > > > > > > > > > +               container_of(w, struct drm_gpu_scheduler, work_run_job);
> > > > > > > > > > +       struct drm_sched_entity *entity;
> > > > > > > > > > +       int r;
> > > > > > > > > > -       if (cleanup_job)
> > > > > > > > > > -               sched->ops->free_job(cleanup_job);
> > > > > > > > > > +       if (READ_ONCE(sched->pause_submit))
> > > > > > > > > > +               return;
> > > > > > > > > > +       entity = drm_sched_select_entity(sched, true);
> > > > > > > > > >         if (entity) {
> > > > > > > > > >                 struct dma_fence *fence;
> > > > > > > > > >                 struct drm_sched_fence *s_fence;
> > > > > > > > > > @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
> > > > > > > > > >                 sched_job = drm_sched_entity_pop_job(entity);
> > > > > > > > > >                 if (!sched_job) {
> > > > > > > > > >                         complete_all(&entity->entity_idle);
> > > > > > > > > > -                       if (!cleanup_job)
> > > > > > > > > > -                               return; /* No more work */
> > > > > > > > > > -                       goto again;
> > > > > > > > > > +                       return; /* No more work */
> > > > > > > > > >                 }
> > > > > > > > > >                 s_fence = sched_job->s_fence;
> > > > > > > > > > @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
> > > > > > > > > >                 }
> > > > > > > > > >                 wake_up(&sched->job_scheduled);
> > > > > > > > > > +               drm_sched_run_job_queue_if_ready(sched);
> > > > > > > > > >         }
> > > > > > > > > > -
> > > > > > > > > > -again:
> > > > > > > > > > -       drm_sched_submit_queue(sched);
> > > > > > > > > >      }
> > > > > > > > > >      /**
> > > > > > > > > > @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > > > > > > > >         spin_lock_init(&sched->job_list_lock);
> > > > > > > > > >         atomic_set(&sched->hw_rq_count, 0);
> > > > > > > > > >         INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > > > > > > > > > -       INIT_WORK(&sched->work_submit, drm_sched_main);
> > > > > > > > > > +       INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > > > > > > > > > +       INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> > > > > > > > > >         atomic_set(&sched->_score, 0);
> > > > > > > > > >         atomic64_set(&sched->job_id_count, 0);
> > > > > > > > > >         sched->pause_submit = false;
> > > > > > > > > > @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
> > > > > > > > > >      void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> > > > > > > > > >      {
> > > > > > > > > >         WRITE_ONCE(sched->pause_submit, true);
> > > > > > > > > > -       cancel_work_sync(&sched->work_submit);
> > > > > > > > > > +       cancel_work_sync(&sched->work_run_job);
> > > > > > > > > > +       cancel_work_sync(&sched->work_free_job);
> > > > > > > > > >      }
> > > > > > > > > >      EXPORT_SYMBOL(drm_sched_submit_stop);
> > > > > > > > > > @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
> > > > > > > > > >      void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
> > > > > > > > > >      {
> > > > > > > > > >         WRITE_ONCE(sched->pause_submit, false);
> > > > > > > > > > -       queue_work(sched->submit_wq, &sched->work_submit);
> > > > > > > > > > +       queue_work(sched->submit_wq, &sched->work_run_job);
> > > > > > > > > > +       queue_work(sched->submit_wq, &sched->work_free_job);
> > > > > > > > > >      }
> > > > > > > > > >      EXPORT_SYMBOL(drm_sched_submit_start);
> > > > > > > > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > > > > > > > index 04eec2d7635f..fbc083a92757 100644
> > > > > > > > > > --- a/include/drm/gpu_scheduler.h
> > > > > > > > > > +++ b/include/drm/gpu_scheduler.h
> > > > > > > > > > @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
> > > > > > > > > >       *                 finished.
> > > > > > > > > >       * @hw_rq_count: the number of jobs currently in the hardware queue.
> > > > > > > > > >       * @job_id_count: used to assign unique id to the each job.
> > > > > > > > > > - * @submit_wq: workqueue used to queue @work_submit
> > > > > > > > > > + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
> > > > > > > > > >       * @timeout_wq: workqueue used to queue @work_tdr
> > > > > > > > > > - * @work_submit: schedules jobs and cleans up entities
> > > > > > > > > > + * @work_run_job: schedules jobs
> > > > > > > > > > + * @work_free_job: cleans up jobs
> > > > > > > > > >       * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> > > > > > > > > >       *            timeout interval is over.
> > > > > > > > > >       * @pending_list: the list of jobs which are currently in the job queue.
> > > > > > > > > > @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
> > > > > > > > > >         atomic64_t                      job_id_count;
> > > > > > > > > >         struct workqueue_struct         *submit_wq;
> > > > > > > > > >         struct workqueue_struct         *timeout_wq;
> > > > > > > > > > -       struct work_struct              work_submit;
> > > > > > > > > > +       struct work_struct              work_run_job;
> > > > > > > > > > +       struct work_struct              work_free_job;
> > > > > > > > > >         struct delayed_work             work_tdr;
> > > > > > > > > >         struct list_head                pending_list;
> > > > > > > > > >         spinlock_t                      job_list_lock;
> > >
