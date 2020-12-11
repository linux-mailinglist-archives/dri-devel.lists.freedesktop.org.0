Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EEC2D81BD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 23:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9868E6ECDB;
	Fri, 11 Dec 2020 22:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680076.outbound.protection.outlook.com [40.107.68.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9D08912A;
 Fri, 11 Dec 2020 22:16:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSRb1YMxWvz6kg86AWu90d/akLirxfCMZov61e2evWWOzFIFBVcAYDlPL9XBj6JztyvcxgCyS5/1NilAPjidndq33/Rti79g+ZmyyKk6OWaYMTOlEtSkyTSt/G2MWncEZtXNWSDYl7tFX12nv4wBxjvER8BQcXhMVmHWpUJwy1nwUZUKFebsgSyARvxm/T7ENeF6CcQ0DZ4fw10jHByQehmXYuamJG4k2qe7cFgTPdryXUzGovmu9pOylybPZGX43WCePRgCFjmNnWhxYS2LkIS8IIV6CaGMT/o+zkc9f6S20mUPJOxWFTkD7Lr+11IlcU13F5UNAI5mWEuFlPrfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONXhSjunmNb54J8jCJLr8rUQuXNOvH2KAQQsYmMvhIQ=;
 b=KsD/JFnTQ1XiUh7pJD329lRV7M8ngnB1MvrWiHGNmCkF0uIe6nO5xA58wjiZAJbybkoWGUCqwX6FcbzwS1k9pq+7iDo6U9bMAS9BV4l6bfi1/zvrtiHBX+yEQsMemZgb+2+DpwHexXB0/G2cMUPb3kiTf3114YmlvAZp59Ze5JYfGo77axu8Gm7BIUJbo1yN/ImGIntatkclA0IcoUbeWpdL+xkxonEPuNuiG5uF2lJNGe0519AeJ5Yz8y6n4/jvx+oUfaMI24HJz8Jd1p5YoX6/Gg2GbaoI2lZ+hOieTGmOFI4HD5oukoIKnsAJOucSgJObyrQNiS3CT1pysk8Dpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONXhSjunmNb54J8jCJLr8rUQuXNOvH2KAQQsYmMvhIQ=;
 b=ubxaZgHTsake6nlswdfNOm0b+/OUixvfZYNl3sJTDay6sz1wcj17PS31CvFO5/QqDfzGHBCY7eh5rnJOsPxLaqpLPrl2YJIlNvsaOY7B/MfkVh+Xl1LWhZN158g2NBvI9lWYjVXdgDGVQm4HxpNZtwES+/U0Zn7NJROBf+REPq8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR12MB1867.namprd12.prod.outlook.com (2603:10b6:3:10d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 11 Dec
 2020 22:16:43 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3654.017; Fri, 11 Dec 2020
 22:16:42 +0000
Subject: Re: [PATCH 1/1] drm/scheduler: Job timeout handler returns status (v2)
From: Luben Tuikov <luben.tuikov@amd.com>
To: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20201210021438.9190-1-luben.tuikov@amd.com>
 <20201210021438.9190-2-luben.tuikov@amd.com>
 <5adf573f-8b56-9f85-96c4-727cc6fcadfc@arm.com>
 <19b4270f-2402-9381-b6e6-7ed508d4d996@amd.com>
Message-ID: <bb31086a-4d9e-f604-ea22-a2a2059d63c8@amd.com>
Date: Fri, 11 Dec 2020 17:16:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <19b4270f-2402-9381-b6e6-7ed508d4d996@amd.com>
Content-Language: en-GB
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::30) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.55.250) by
 YT1PR01CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 22:16:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 847ba335-ffd0-4aa2-e2bc-08d89e2270b5
X-MS-TrafficTypeDiagnostic: DM5PR12MB1867:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1867E015641939750248629699CA0@DM5PR12MB1867.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQto8ivytikWyXvJpLVjOeHA9BrRaKkcfCM5+3MbGsQkMqJch46Vhmxe3eVUGLvqOScG1A00L0h+Ir57gYmhq+EM53W+YCJ5+CmEoFCg2fGJ2wrOzSEP5sJC2PHMVioceHxWoHq2f9Sp7UD/66BYVwAR6zsdXCY8rgLCgS5K50QjX9qMe9jY0BpiI9biL0kgJh7coKs7MDiqhPxCMPys7yNSajLnFyDs2AK/fq5VyKwT83rLvp9B/9qO2OX1HU/iwx024iSjgIZ4uPilFWY3M+ipHJYm/FlsS/5okgSUFXXZfIZs+ELMyfVBIwvANUUwBjuiLehlNJY9SPgVz+NSf7eoM3L2t8u1fS7brAR2XQ/yVuOTUuFyBPQZ8C/mYAmxrmjKKLsBTJ8SoxwknBs+N3d9HlAFNGlG/5EtTAR178sTgiS8Ue2+jfRuJyLoFlIt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(66946007)(7416002)(86362001)(2906002)(31686004)(8676002)(4001150100001)(66556008)(36756003)(4326008)(44832011)(26005)(508600001)(6506007)(52116002)(4744005)(956004)(2616005)(53546011)(16526019)(186003)(31696002)(66476007)(5660300002)(54906003)(8936002)(6512007)(6486002)(34490700003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RUtPbDQ4NGhTM1RCcW85cUpCbzhmR1JKMm1lM3d0RDduVE51NzJaU0F6WXlI?=
 =?utf-8?B?ajdlSG5UeFZzaTYveU41dVRZRGNJNVVIaWdKTHNEb1U4Q2habUs5RVcxRGxR?=
 =?utf-8?B?Q0pBc2JTQWxkTzdTN3BOWTF2bmdaN2NQQXpYblZHcWpWdUoxc2ZEc2JJRDZB?=
 =?utf-8?B?NWpzNEVxbFNlcng3UU1FdGhEeEQ1VmljQmdsdXFaZ2RTZDdka21OUVYxdW8w?=
 =?utf-8?B?Q2N1bjNmME9WcUNobjcvZGRJem1xNzdMRXpOb3lBcU15YlpQc08wQVp3VXh6?=
 =?utf-8?B?dEVIZU45YXdsTnJXMTdvSFh4aDd6Z2R6TmM2bHlxbkdNaUw4dEtnUGFoeU9x?=
 =?utf-8?B?VVVaelJ1RkFHSTJKWGpaVDRVRThCMm1jdnJhVXgvUmxJb1lObExrVmVJN0t3?=
 =?utf-8?B?dk1xOWRSVm5mUmVhQk1pb0Zuc2RDc0kwamJsOHVjYnZiemN1M0prbExBckcy?=
 =?utf-8?B?bGYvcnJUdmJSNDgvejFyWVNsOEdzeWNtcDZqMDdwZ01YUzRoZkljaHhmMFd2?=
 =?utf-8?B?V1VjQ0VuTzZkVDNnQkhvVzdrekxUU2l6WTQvcVBkb1Q2d05aRVZ4K0JPL3VK?=
 =?utf-8?B?eTM0L3pyU2VVNmQwb1ZSU2VMVXVQT0FPZFAwdGJ0KytvZVoyOFd6RjhzRHZz?=
 =?utf-8?B?a0srM1g0ZnV0T0F0dUd5dTRqSDJBazMvYXk3aUdTZzVmQVNJZUNXZVpkL2g1?=
 =?utf-8?B?ZkpIT0VRWlJqYzQwcThDSzlnbFJWanYwYkFiYXVKWGdDZldNZWxFbWRUVWdo?=
 =?utf-8?B?djY1bGlkZVZhTnFIYTdHWmVGaEJvbmxKMW12RUZmaGxxVktDUHR4QnBjL2Jo?=
 =?utf-8?B?VHlpeWJzdEZ6TDlNOHlQRzNUbWVTcHFpaTJXZUN0b0tYVGlqUURiYy9yNG9P?=
 =?utf-8?B?QnVyMEt6MUF0bkNmTEE4U3gwd3phR2JVOGJhS0dtVkRnS2w0cEdiajV1VVpm?=
 =?utf-8?B?MHRpdXMwcWhXRXNSL3luSnF2dDF4WTlabTc5OUFmZ1prbFBTangycWdvMGd2?=
 =?utf-8?B?SVlxOEFDOGVtWlpLM24xblBueGIybUxEVEh0eWFySnY0VzlMc2hwS1AzYnJN?=
 =?utf-8?B?Rmw5ZzdQM1A5endjekR5cUFvYmpHMlRSY3hqNmtWNytHcEZGUW5KeEY0QWVx?=
 =?utf-8?B?NW9yT0U0WTdCWU10SncwdTUzYmltNXZhVXROSkxkUDRVbk0zTEx5YlRNcVlP?=
 =?utf-8?B?WWFrVmhXdkljaENOVzVvRWd3c1gxQ2Y2MXZxUmxnWDgxeXBSNkFTMjlFTGto?=
 =?utf-8?B?Z2RzclBDY2U2cUJLMWQrYTEvU0pNMllnVFdXNkU4ZTdwMTM2QjZqUi9CZ0Ur?=
 =?utf-8?Q?7b8h6Ae6EsSd+O1wH4tuFmSuC+IqQmPogS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 22:16:42.8940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 847ba335-ffd0-4aa2-e2bc-08d89e2270b5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vwi/WbPzctdiBKmGzlQRRnP163Wp1k2gl1QuekW+g9umfyMQgXLbLnjw26Ewvb1b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1867
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
Cc: kernel test robot <lkp@intel.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Qiang Yu <yuq825@gmail.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-12-11 4:44 p.m., Luben Tuikov wrote:
> If however, you never decide to send it to the hardware and simply
> abandon it (in hopes that the DRM or the Application Client will
> reissue it), then you should send it back to DRM with status "COMPLETE".

Correction: "... decide to *not* send it to ..."

Regards,
Luben
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
