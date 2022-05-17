Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF4552A475
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 16:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43A610E08F;
	Tue, 17 May 2022 14:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB6B10E18C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 14:13:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fq4uWOUaibbNCHNKYS9I/uFXItmWPJF+EuJGjg31NTJRJGzIvTYJxP3UHXa5qqiCMEZYU3vAIbHpKErEjmEZ2hnTneOshYZLRiOL+yPWe32CAJd5bSuUEKFRcHPb9rNdYHzDkKmzNek1DAupocSlf3Q/JmfgOyaRMrBJ3tlMWOUQ7jo40yos/l6fqgIcudxIRFYzWVElEz+ImGZIUxN+JtCTv7wSUOVIKPVvneW1FNVfgaYgcIE0zseYsKMxJnmiSaaDjLYNWvR60Rz7W/50/BsJEwzbuOcbk5Rqo8OU0TD1qKx2ysXV/fIarHkds/Q8eho604t6nlEku1jVng1SoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qyipFKu+Ew/EPnKfZCoihis4KISrOcpakaHNYbuaJY=;
 b=SEEmDBXuPA2nONkZzanVQ12rHL0AvHatyDdcuPIBUdb6hcTFGROv2YTKMfwy7L4StbTi4v4TLzTBTj/tT8NbN2U3BfL5MraozEK/SaXi/xzBCBZ4nZtdOVtKdh1otecR/TqEjpAUgsNe3xVroQ2werKMT5sPD7RJxud73k8GIvIph0613+KMuhTOc1/EdGSx6GNOMvZMT6/oQFq8UASjjgCmTv1elGDdRoytAJoAhBWp3EIfDwFyuvnq5F/3R2YYotPmhac4Gon/KcFq/5Lc/jz5cUBmXEuWns9nP4g52/Eq5Ww1XLZ/KoLfHFe89jbALSjJ67TeCm73inaA+vtE+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qyipFKu+Ew/EPnKfZCoihis4KISrOcpakaHNYbuaJY=;
 b=rat0bhDqPOkWviC/9GAdxwlwdmYq3924M6Gvh1+IoGL+cNP6eQOFclZelKieDsGl3zmXvYvVyjlxXcIGTtL1O6n+7Y811LpHDi59dKrhkb/qOqQ05+vE1ilDz6qWpi7esHz1yEXQE2voAjvD+OTtApAb/oyfRnQ3i/d2+Pvxf6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BYAPR12MB2903.namprd12.prod.outlook.com (2603:10b6:a03:139::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 14:13:19 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9d18:7a38:7c5d:4a40]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9d18:7a38:7c5d:4a40%10]) with mapi id 15.20.5250.018; Tue, 17 May
 2022 14:13:19 +0000
Message-ID: <a33ab7b9-738f-db91-f6ba-78a9641365e8@amd.com>
Date: Tue, 17 May 2022 10:13:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Erico Nunes <nunes.erico@gmail.com>, Steven Price <steven.price@arm.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
 <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
 <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
 <573fae0d-c9ab-98b0-c6f1-5b0d4e52dd01@amd.com>
In-Reply-To: <573fae0d-c9ab-98b0-c6f1-5b0d4e52dd01@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0079.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::18) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbf46a35-867e-4a06-d869-08da380f64b4
X-MS-TrafficTypeDiagnostic: BYAPR12MB2903:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB290341D546B41B6A36E3A255EACE9@BYAPR12MB2903.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l/eGiGHAGNl9CrDP3pkdqKjbTYMy1aQClZ1Qs1Ml5AfkoHdqrTIDuHs8Qt2/TEOHDWzML0dTVerIKdamI1acFm+IHRAMevjAHUYy2j9oscf/cCC3ybHANyU48JrRsh7+OFPkKwp7Bd9pWZJrewtz3xSBopm3ARiw/Zs/nl6tRD9IpJJ8CdoKR9Puc0ubk+2bfqqaK+UQIb2P0tz29ECqHyZ6VBLZHXeed7pl0W8h15fHWO1iyzrx7yGOiP2qd0jTUK8oKcjkJFMJiX6f79oGY8B3DlAryQJWP7zyDIaCeOCbpvOBYeEnT0bp7NqeEkzlmKNzAz793XGZAXx+bjl8oqS4R7hNWNeJBWmYfCXythJ1fTtlG8ps0VyvU3dud32e5i6KkFTN5TOPw/GLCVqjYCcnVPh6xpqCrSg1LoFtzg9KpJQGmlMtZ9nn9PnycLZMlqwrWebYuyjRDEZg66wg9Gg6v12LNdxyx2akBxYUBYcyWrxS/leYrL9JGb/HaQPXpnLbXrn93PCrP8S3QUBw6/wxaFPUCZ3NwRI7gG3hJtazbNL0jfs8j4Fdah+lkW2v4tsEUsvd+tD3N+XdqpHMCA+/0Tw8MGEd+wABSADkC93mdAMt+Slp1/9LdRrG0QPnyyFuXYWUZ96xRh223r2mdH2p5TKLYQd3hvlwIy8TSAsEfO/0KF4SckF+Yc4533DBIJJiM9M159j/8+SwUQQlkuPAvl67hQVCO8wRI4OZh/FZuD1E+XXIflrRFa4EQ8Ys
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66946007)(66556008)(8676002)(66476007)(6506007)(6512007)(31696002)(110136005)(53546011)(31686004)(54906003)(2906002)(316002)(6486002)(2616005)(83380400001)(186003)(8936002)(5660300002)(38100700002)(86362001)(44832011)(36756003)(7416002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NElxU0NHelEvRVRabHNsREgvV1RCV2E0V0s2dW1OOHphU055VHZLTEZYdWNY?=
 =?utf-8?B?YXhKT29jT2Z3OXpLZ2NVdnRQaTJKNUIra0ZnbklrR3pXUDRrZDc0SW9uWXNh?=
 =?utf-8?B?ZUk0bksrUThvbjJBaWdtUFp5MW9ZK0lLZnkwNU55TGVSWE40ZS9MQW9ldGhk?=
 =?utf-8?B?dW83eCsxbVBDQlZVK3V0cnJ2cGl0WEhENWxRNFFXMnZsU3lwTVo2K3dMTWtS?=
 =?utf-8?B?RUhJeEIvZzNBMXNsditpcUZYQ3lId0V5cW5RanZvQ09OMk1BTnJJZm14YWdy?=
 =?utf-8?B?SmttbGpNb1I1c1ZnV0VQcXpHdmp0bjN0N1ltdVIzVVU0MWtndXYyYVpIKzUy?=
 =?utf-8?B?NkxBNFlaN1V3aFJFVmQyOVEySVpIQ3lvdGw1SGR1WFU3Z2dtblZLcGJFaDZ4?=
 =?utf-8?B?NXY1UjZyaEZNSTREVjJPL2d6aWxPcHFhSEZyMXVxNEU2dVVPblRPaHhabWd4?=
 =?utf-8?B?blZPV1RONlJacGpoU2FaamlYSjVYS2s5djIwVUVVOU5ydExibktCMzlSTkl6?=
 =?utf-8?B?OXArblUvTUhVRURqR1dIZFBqc0tOaGU5dDFCbU5NZHB5Vk9QUGhWTXpManJF?=
 =?utf-8?B?UlBsOHJla296akFVYkpFUVJ0Q0hKV3lCS2EwWjBIUURpbUVLY09aYTJhRGJX?=
 =?utf-8?B?cFVTbG1qb25na2QwVDdaazR3NFBJUDY3YmRmSTV5MnpGLzdmeVhaUktwS3RQ?=
 =?utf-8?B?d1BwaTQreXVOVmFqMWFRUUFFYi9SWkhPZllMOTllR040dmU0M2FITEZWWW1B?=
 =?utf-8?B?WDZJSnQzTUtiV2FBamlFYVFIb1QrRlg3aGpyenlmZ1dSQnA4Ykcvcnp3MnNz?=
 =?utf-8?B?aHMxTXZyS01HMGVHRFlFWFNpRXB5NUprVlJPS0gwaFlZS1FqSHVCYlRyYzdJ?=
 =?utf-8?B?QWxMazB2OFFyQkRIdFVrNVhNRFlWUzgwMEJRK3RxeHB2NGlwYnMyVXJwVHlq?=
 =?utf-8?B?dlFabm5zaVJpZSs1WVBEY2QyOG80SHFnVFFuK2g4MTdZTXJyYVpCdG1GMlh1?=
 =?utf-8?B?VWJoYUtZbHIzKzBjVzVtbzhKc1JISkxpTDYyNDdPRFhEdmxienFJMk9NM1lr?=
 =?utf-8?B?eFkzRlErWUE5VlpJc2daQmdzcW1sSCt6cjVjMHhvb1BEZDBITlV4K2Zmc2VR?=
 =?utf-8?B?VUpiV0RaTzFVT0RycW1uNzBlRGl5U1hlUGhCSkNlSkdaNy9nWVp0V3NpdCtm?=
 =?utf-8?B?NzhrU0JuaS9QdS9IR0dKNzdCRXMwd3IwZkFCN2JWVHd4aFJkeFlEZW1IK2dz?=
 =?utf-8?B?RS9qbVIwZkFhdUsvRGlrTFdWU0FxeHdlVE85ek9aNVFWTkVOWExTRFdpbnBD?=
 =?utf-8?B?bEc2WXBGTVZ6NE9rYTFHeGNEd1RpK2xSSXJWeHpUdkxWUEYwZFRNYWlPWGph?=
 =?utf-8?B?THkxYWVqVU52Vk5EYi8xSVNxbWVydEhRT3RadXVxdmFKVEh2M3VjQXFaRzh5?=
 =?utf-8?B?NmNjT0pYb0xJWlo2R0VpUkNPOGNPMjFGOHhjd0lNRzBwLzNYTTNOUm1TbSsx?=
 =?utf-8?B?NWNoa0RYT3BIMGpOTmZnSEJ2RGh2TnJ4OEovTktJbzd4ZU5PZndtWGRkdW9O?=
 =?utf-8?B?ZEcxdkdOMmFZM3MvUDllY0kzRkFPK2x4MkZYTElXOS82V2RBb1MyZVJub0FX?=
 =?utf-8?B?eWZkTWdGdUlPRVh1c0lJWHpjWEtZZVJxd3NWOGRHYzNjcE85WThkaEtyYTA3?=
 =?utf-8?B?d2h1ZDIzT0ZMc09tTU1JbjdLWnBRRTlqTUpHMW5pYWppV3FiNjJEdEwxdEtV?=
 =?utf-8?B?MTl1VElEU0NKL0VGb01JeTBHVlcrMEZGMlR5QkJ3aXVIVnFKN2RsdXp3RXlv?=
 =?utf-8?B?Mk5LUFMvN0dnNXE3ckVPLzVUV08wdHJjdlgwZXN4KzMzR3pkbFNndzFKTWlp?=
 =?utf-8?B?S3Y2ZXQ3Y0lSUG1sSjdJRmozTW02ckphRXJTVVl5N2owL0ZTRGhKeGpONi90?=
 =?utf-8?B?QXFWd3Vra1c2Mkh4MFA4RmJFMzBXcmZ2VU05U2IzWWlrU2VMSTZZeVpJdzZt?=
 =?utf-8?B?RFppWmpHQnUwQXRlSUNwdWtNTkd3b2ZVcUdwTG5kaGtiK0JGOE1nZFR4RGRi?=
 =?utf-8?B?TnRyNVc4WStNS1NDdnh3ejgvclJjVEdWcHo2Y3BqbmZ3TDE2YStoKzkyU1lh?=
 =?utf-8?B?NFZjTGZ0L2VBYlFPMFZwSldDTmFDSDJNcWNQOUFiOWp3WFNwckFUdm9iZE8r?=
 =?utf-8?B?NnZhMFl0eFI1b0ZiKzdNY1FTaHVadTYwakM1Z00xcUNRZUpKWXVUZ2VCMXlp?=
 =?utf-8?B?MzJBSDhhOUxha3haWEpxVGk5VDBndE9yMkRBL0MyaG9CZ0ZsZThRUms1NGsx?=
 =?utf-8?B?bUl3elFjc1NhdTQvekoyN1VsVHMyRWpEaGM1TUl5eFBIQjdpVGgxdVVkMTZj?=
 =?utf-8?Q?CsiaQ6Qm31oRd91bDdyN52qpWGqru2vIJTfZ9SlKBbcmX?=
X-MS-Exchange-AntiSpam-MessageData-1: p8fZIYXPh5pNXg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf46a35-867e-4a06-d869-08da380f64b4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 14:13:19.3928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8WQEMDmwv1u6xUiO9e5LmsLMRBZOYhwTSmyYmGJLZuqwyiCTl02D+XhYoxqb1nTsSjAVIbCssRLhZo2r62ndQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2903
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Done.

Andrey

On 2022-05-17 10:03, Andrey Grodzovsky wrote:
> Let me push it into drm-misc-next.
>
> Andrey
>
> On 2022-05-17 05:03, Dmitry Osipenko wrote:
>
>> On 5/17/22 10:40, Erico Nunes wrote:
>>> On Wed, Apr 13, 2022 at 12:05 PM Steven Price <steven.price@arm.com> 
>>> wrote:
>>>> On 11/04/2022 23:15, Dmitry Osipenko wrote:
>>>>> Interrupt context can't sleep. Drivers like Panfrost and MSM are 
>>>>> taking
>>>>> mutex when job is released, and thus, that code can sleep. This 
>>>>> results
>>>>> into "BUG: scheduling while atomic" if locks are contented while 
>>>>> job is
>>>>> freed. There is no good reason for releasing scheduler's jobs in IRQ
>>>>> context, hence use normal context to fix the trouble.
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a 
>>>>> processes")
>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> Reviewed-by: Steven Price <steven.price@arm.com>
>>> Is there something blocking this patch?
>>> Mesa CI is still hitting the issue and I have been waiting for it to
>>> be applied/backported to update CI with it.
>>> Thanks
>> If this patch won't be picked up anytime soon, then I'll include it into
>> my "memory shrinker" patchset together with the rest of the fixes, so it
>> won't get lost.
>>
