Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DAA68FA4F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 23:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB89C10E8B1;
	Wed,  8 Feb 2023 22:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE5610E8B1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 22:37:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uun2sb6HPEpsQ278EalMoO78PFOJr+7NYJUaNyMFcS3TW1nzMSTtO1T2sKFrsD2sQVaPhK7XMUBS/ZorGLceNSIaiJmP5Dmst74vlmUuIrnybZljaPtndbZifizQ/2+B/7kRwvD0YJ2esHH0Q5qM/6EP8UhgwnMyhFAcT8xLyU0ksk7XoSgJPx5s0XUab/snsET7Y8gjSd2Pnd1aWbUa0jfNq33lrBhOzDxSHL5J5iG+kgixTZ2NtkZHXnh0r+5e93NTy8T/Pkp3lhKBiU55IqWuKUFfHu+5G+v7izE4lr4A/pJufVx3nMwfZkSz74H2rxE3ybZmnJ8V9YG+x9hbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh/v4NVpg7ukhhECp2DKJOLYmaPF8CkRTq+EdU16m9I=;
 b=HwSeY4qTyuwhr8+YACU4C6U3PEvlCLi3wmF7PY+lAQcDEUydu/Yrq7mIE+BW2wMxtiYv7w7YCuXqzvHdhSdRB/c6EI0sKCiD+mvBAkDxtjrWJP1vS4whfRPl27AgclsfdRRoTq99+Vy8tN4w8tzD96i6Q2M+eCwlDVoJCC11SEKSyUiQqz7x8bl5/cp2jwOlVkJZ6NS6lQGvBHwhBiu/VtfGbe1eItSfFuvGUZEy99F1z+g1or+2o+m5ojbNa0v9XeSuucbFHB95dazT639mKSng0UCyxRMp11WS5DENBadq89EJ/k7clsCUWxiYQuVDpWqRfSN0xzxyjO3HoQQ/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh/v4NVpg7ukhhECp2DKJOLYmaPF8CkRTq+EdU16m9I=;
 b=cImjToxKFh0IfR/TxM5CM8JKxz+mHVpqwMMZucU1oZyCJ6x3cAMiFQCfrgF7KWJcM5lAMR29/tB77PPnpwotSNQonb4yGA8NG0VYJxdBcCIncIyt/vV98+wu9dn2ePBSB2iwaw4HBrRU7CVE9Q1+2deCbIHCnYAemR+cUwh+PBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB8016.namprd12.prod.outlook.com (2603:10b6:510:26b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 22:37:01 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 22:37:01 +0000
Message-ID: <ba03d45d-702d-b474-2787-9265f4ca05a2@amd.com>
Date: Wed, 8 Feb 2023 17:36:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/5] drm/sched: Create wrapper to add a syncobj dependency
 to job
Content-Language: en-CA
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230208194817.199932-1-mcanal@igalia.com>
 <20230208194817.199932-2-mcanal@igalia.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230208194817.199932-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0180.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::26) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d84616-3622-4d5f-008c-08db0a24fea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FLsEN9XzZca+H+dLfbOtVD8MLa8yMRTz1qnaPE+p7wlBdKCVvfdr7x8jQ2jn96LaPUTKshRfiBMqNbNj06BaIZA8dbMB//ChCxl9qhocmo7oyB+W1fz0dmDPc/GVh8gblpuZwyqHmiXEe7OiX1ETLt133x48Iy2m5qIUfZ9+/dkStqXQjLgfHvlVq5LGPymBLYK3rEwl7ogjtSETDgFZioi6oc0LV6a2k9TUsIKhhzKTw5InppgrJ/YlemO82uFcMZ4NosW1HmYW6m39XQWmzJNFcYF8prdNwkXzmA5dfP36eVKi4W6H1L6vPl0Kj9bh0iYhS/YDPg614ylsKLEfOzifKsDEpdXFjfeQ/303jR/ao1ePwd/kagAeKF1BPvof+KrUNHPO9klq7UR+bD1FVG3r8CxyEc07WmEiK5HKnYPRgkL/x7UAifb7zB5NKLjs9FTrE+4ZjVTafRNx4vN7Yof2werJFMZUNkDzdSh5nHRcPgjhl2kdBEURbas/fmbGKKVhw1o1xfaEl39uhUS6RAvzCyIKIbrFPx3Bp4rsH+cbUfFTwXSNs5t3HK8A+CjJ2km+eJIpS2fIS95x844+YLRUeQM+Pb6XA8Zn1TYoxr3/T2g7HLShp2m9fxzGgpr+NobdKLzDIjNssbiTCWw0mu4RS3d2el8nBgHW8ZJmbD1MwmzF5IYtswwnlH/aTYTlQYPH635lHkM0qw/pv+USb0+MQsFihzXYfX2mBbm7+O/kiPJxsVNSJ0Q5c5aA9Qcx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199018)(921005)(110136005)(316002)(2906002)(5660300002)(8936002)(86362001)(7416002)(31696002)(4744005)(8676002)(44832011)(66556008)(66946007)(4326008)(6506007)(41300700001)(53546011)(6666004)(55236004)(66476007)(186003)(6512007)(26005)(38100700002)(36756003)(478600001)(6486002)(66574015)(83380400001)(31686004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHE5WFdUK1Z3NVFvZjRJd0tnK0Q0R0d3YkMyL0ZpbnR3d1V6M3FPNmhaM0Zu?=
 =?utf-8?B?M0dxTnMrV2duZzhLdmRCa0Y1WUxFKzMrR3BjVXlrOUllMEV4bDBVYSsvcXF4?=
 =?utf-8?B?TVphVVBSV3BVbWZkeHdLdTZ0V3hiRnhQY2VmRkQyK0psdXQwUkZwaGozRlIv?=
 =?utf-8?B?ZFBoMDhUcTVqTWlZU2xnSDhWN3N0Y2dJS2kyazJBai9PT0FkK2w0SGcyekdo?=
 =?utf-8?B?WGVhQmJZeC9SeUZaM3ZMam1tbWlYSDZRVXFqbnVxVGRJRkhKbWhWaTdpMkxU?=
 =?utf-8?B?VW1Tak5WazFmOGZldUpON2YyZUZFMHBnaXJSOTgzSUF6QTNpdmRjOERiVVgx?=
 =?utf-8?B?MkZUSUV5aWZCR0dpRnV5bEZteUdDM3kxUFZkajFCNnl1N2g0TjFRcFF1aS9F?=
 =?utf-8?B?aUtScEdHYUY2RHVLa1FDM083K09kQVFoa24vcWhkemkzYk1EL2JRMDNSMlBI?=
 =?utf-8?B?OXpxZ2NlWjF4R2FFRTZTd2hna3ZDZVlBdG5KQnI2RXozSG9Qenc2UXNrT0tF?=
 =?utf-8?B?enJPbXFUcFRuN1llSFcwSTFSdG4vbEtJMGFSa2hFOUFkRVh4M09rNWV4am1K?=
 =?utf-8?B?RjgvMW80TVVnSFRzOG1OWFBVZVJJaGVxS0QzckdpeGhONmM5VjJoY0Zqejlk?=
 =?utf-8?B?dGtPNExMSHpvZDQ1YU1tS1FaWU5aY1hmZmhETEZYYWhsZXVvWWZQQmZkRytq?=
 =?utf-8?B?dXJtWjMzZ1JQVEdvMG9vZENYMGljQ0ZkdzR3cVJBU2NHMCtOMlEvYTczUExJ?=
 =?utf-8?B?REowKy9adHE2TVFqazNjQXhYNk83RHRSTFc5UEhlZ0tnZ01hZG9iNm1KdlJO?=
 =?utf-8?B?WVhaRFFGUVpTUzkzVVhDZ3dITVN5Y2Mza0VoTVdrclVMQTl4ZzVENjFMWEx0?=
 =?utf-8?B?di8wc2o3SG5HRGwxRGJCUktTYmZrZVA2QVdIcHFJNy92ZWpVYnoxcXc0dmdB?=
 =?utf-8?B?Ylkxc0FDd0Zhb1ZOdWduamlYVFBvMFFSNVkvOWhUaUthamNPVDJIdFIvM1BD?=
 =?utf-8?B?UVdMaWVxczk2TmQ4NmVLa1lRaVQ4ZjQyK2VtNFIvWVE0TlUrV05kT3ZGeVM1?=
 =?utf-8?B?S2M5VklwUy9RQ0JoMUx6Y3lmb01LM0Z3Q3d4elN2TTdGYnc0MDFrUGhwOFdV?=
 =?utf-8?B?T096KzVMODVVNW95QlBTOWFXMFNNNnRkL1lYVUdoVXJESTlmNWFBa0JXQjR0?=
 =?utf-8?B?Z1dxTlNpaS9Mb1Q0T2o5eHJCd1pnWGorekpiT3hzUm9jWnpManV2QmRhUjBX?=
 =?utf-8?B?RjJCTTg3dFMwYk9yN0hZSGx5YWMrT3Q2WGRsd1RpRUVPMnlza3prZEcrZUt1?=
 =?utf-8?B?blpwY1BsRmZvWDR5eW1hRnhZazVOR3VOWmY3NXFSTlJtVHdldTc4YjBwUWQ5?=
 =?utf-8?B?LzFjVGkxR213RFhETUtpM3pxaldIS2VDeTJhY2RzT3lCNUFJUE9XNjYycE5s?=
 =?utf-8?B?V3RWbktTaURseWdldGpwWllZbVd5SzdKTDdWUVpQTnZJWk1xcjExeVhUSndx?=
 =?utf-8?B?c05NZE5PaDFnTkowU1V4d2FkdTMvQnFqWEtma3I1anhCdTBuZXB1V2pkMi9W?=
 =?utf-8?B?cGF4VVlQcUJXOCtZT3JxbXJKMUhUZncxQUxpNFpLWkE5T2Y3anVuZkdjMlNl?=
 =?utf-8?B?eVIwcnNsS0wzTHh3Rzl3Z0dpa1NlQ3lUMExkMDhjMDJLdm5wQk9BWFhrMkZF?=
 =?utf-8?B?RXFpMDY0WndBRW1UMGJGdmhFNDlJSmNHTkIvc1hXOGYwWWFzSko3MWFBTmI1?=
 =?utf-8?B?K014b2MySXVqRVQrUklqV0hmWkRYTk0rY0c5SldSem5HRm8xVkdjbTlncFpq?=
 =?utf-8?B?a1laYlR4MjhQTUxHaHhvYmtlYmlUeG5sZlY3aGo4Qy9jTE9yU2lSVkwwT2dU?=
 =?utf-8?B?ZndMb3B5UFMxQkQyakd6NnZ6S0wvbC93RmhCWFhuTEdCYXIwaFRibVIybldz?=
 =?utf-8?B?Wk8rVDVya3JhcEF5Y0xlWkhVajMveGVUQ0JiSU5UTFMzZmdoRUtyMnB4SThI?=
 =?utf-8?B?dWFyUTkwQ2I4YzA0a3pMUFAvNUxFRGoycGdCWll1eUJtaW5GZDZhV2c1U1Uz?=
 =?utf-8?B?UVIrVE9DbVVrT1JoQVk2TWo3SGI1Y0hqZUZQRHc3d201TDdPemdTRFhBaEE1?=
 =?utf-8?Q?axL0y+Hz558oYsukqTjmWqAaG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d84616-3622-4d5f-008c-08db0a24fea5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 22:37:01.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gd16k8oFHUqfXIBKfkuumaCCREjR74xiyAZmg04+OdudXMyjjfNYya/W/kndJbjq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8016
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-08 14:48, Maíra Canal wrote:
> In order to add a syncobj's fence as a dependency to a job, it is
> necessary to call drm_syncobj_find_fence() to find the fence and then
> add the dependency with drm_sched_job_add_dependency(). So, wrap these
> steps in one single function, drm_sched_job_add_syncobj_dependency().

Yes, that's a good change--thanks!

Patch is: Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
-- 
Regards,
Luben

