Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14588B09C56
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BF610E8E3;
	Fri, 18 Jul 2025 07:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ms5prnwL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFF110E8E0;
 Fri, 18 Jul 2025 07:26:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EvujyMub8wIog6ILKQ92fUI+OEiAZOFe/kzOCQT6aZZVUlmwC2TFyfKyd5/lky50HBTY9tgNSy9GMr6iYns5pffD/snVBGEhnvVhgl7KpchXgAdszT1Rq5UoDuqvf8n1DUrxD/A88Jmy3nyJU3zsUSSC7u6P37MBhF7vVVmQQPkvOUiHhksveGeuASZFPO/nnMDSUtv9VFFirGaLBR5ew/XKavv/LAbDe5eTiLGGCsPcKajsDo6W9L5jUvciM3SPHfGUC6uJ+fghGUrZ5DrldftYvMnlmKRDIN16kfqe694rfuwAqIZxtYoF0/urCiGfpmQ+41YidBrighyy8rA89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTTFd7MAq6g/U6VVaqsisaS0z8V5M2OjRG8f+zlV/5A=;
 b=gM6IfcUzmXRx+1CRVYyuRPjFczCJ1TElTt73UIKxfqfb6Jk6SeLfR1WsQofYU/JIp6Jp/ScJntSVAFyYoBe9rjBBkh7CT+OmUYQZl132LVMzLsXhVhpg8KiACv0Gjc2lbUf+Dmo5r2Ar+02xumiIg00ym6jnDpiSR2UXbj/aaY956rMlfkvq9MC79AIHCu7kGKgRGwLZQjWR9qtcws/S1a8vp5kCaZ2X48I7a+Ebj6qyVgO/IY8FhA/Oa9K/qsuw1G8frH5uVme969xu37c30mh/KBdJS73j3rs9SRewBwzbCSIkWjxziuYj2H/TfAqGbz/Zm4sD/10Gi0TftHrWVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTTFd7MAq6g/U6VVaqsisaS0z8V5M2OjRG8f+zlV/5A=;
 b=Ms5prnwLI6IrsYci31OM8/vJkZ6cLLLZDRdr1GZBX9nE970SInKuO1FmaAgUWxJb8h2aiVr96gybb+BXZuiYPPALmZtNZrzJykHJVRdB4qmKNrlzB+JRJ4ljQG55KngCqTjyKMs/w/HIQObFqM9Y6toiba742hi4zj85Agi9uR9wkgoI9Qlmh3y3G5GLrA7nBFTp3Imbgrqgr6hMXdZCDhIWIRpoX/ETZFL17+SFrkHS4gPvpcWFU/KPzstqNrONUaBrBR/Lrq9P6aAxpznpN5tZopFgAOPluBl6eG2mXN3o/PeNBi6e9uEh4N+YLq3gzgi9he5QqqMk5Le/zWF+lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 00/19] gpu: nova-core: register!() macro improvements
Date: Fri, 18 Jul 2025 16:26:05 +0900
Message-Id: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA33eWgC/03MQQrDIBCF4auEWXeKGkOkq96jZGHjmMyiWjRIS
 /DutYFCl//j8e2QKTFluHQ7JCqcOYYW6tTBvNqwELJrDUqoQYyixxCLxURLRqWdc+QHf7c9tP8
 zkefXYd2m1ivnLab3QRf5XX+K/lOKRIHeGCeUGY20+hoKO7bnOT5gqrV+ACuhMjOjAAAA
X-Change-ID: 20250703-nova-regs-24dddef5fba3
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0169.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f8b4d67-070f-453a-b929-08ddc5cc62c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFNqYlNacWhOTVI1dk05Um45WnkxbFVLdmU2cTlrWndDbENQdzdNQVNZcnlU?=
 =?utf-8?B?M1JrTGtGcWU3VFVVVGpVMi9WV0lpazErcGlHeFBOaGJNNi9qKzB4NHZLejlh?=
 =?utf-8?B?dE1MSCtTTmxERVlQYTdWbC90YWg1aFhqcEtPZ2dZbzBab3lCOFY0d0dYWmIy?=
 =?utf-8?B?VEpHWjRBQ2xvVmhZdWlhSWx4SDllS0Z2bHZYVURnUGNacE5RQ1dFdnJrbFNN?=
 =?utf-8?B?ajVxYkxQYkZac1NmTDljZFBtN2d5UzlkejRLa3JsME5NV1VoYUZSK2o4Rkty?=
 =?utf-8?B?a0I1SDdxU0c3MXE5cS91TG1OL2sxbW9vV3RFcGl0Y05hdnpnWklyVjMwK1B3?=
 =?utf-8?B?ZTNIRng4V1Y2L3dreWlKNTFpODR6dllkcmdLUjYxNTlBYnNKTEdKbmdYWEVW?=
 =?utf-8?B?eWxLUUdoMVRtaHZ4TG9QUHRzeGFySlhjTG1VNjMvb3cxZFRnZTAxVXZpc3Vm?=
 =?utf-8?B?S3Z0VjdkUlROUzJNb1BHUzJVN25TLy94VE81bE5vYjNycmZDQWZXR1hORUlt?=
 =?utf-8?B?a0REUmVCT1Iwa1NpRk5PRTRNQ2ZzQ29GSUM5bDdhbzFCdUh3eHp6R2ErU0hS?=
 =?utf-8?B?dXdMOFNzd3hNMFV5NzQxektMM3ZVTUdPUk5neGZYcDhtNmV4cm1mbmw2UzBI?=
 =?utf-8?B?NjYrL3RaUzgxYWdISytQdTJOTzRScVlVUzQ4MlhTMnI1OERyeGlQSEI4WEU4?=
 =?utf-8?B?UE1HN3F3MHhMdzM2NjZNUk9SWUE0cGFnWExTeksxaWE5K3h6TUJMUnFoU3pW?=
 =?utf-8?B?RzlZQzNhcC9OWWppdlozVldlbVpqamxPTldaRUlHZFRkb1U0aWtyZTBRVXJO?=
 =?utf-8?B?Ky8wZHlVdUtsWWl1dFVhTzFkRkowbXpmcGVMQ1NvdG1hS0tZWlZwMHd1aVBY?=
 =?utf-8?B?Q3l1aE5oaXhVOE5RcEVuY1NYbmZGY0szWDNPcmhGb2YxNG5NNFhxbEY0VWtk?=
 =?utf-8?B?VldkV3N3dVczUDNLQXVzT1lLamQxS0MrclJ3WHRBTEJlWkttcy9MbHljdWNT?=
 =?utf-8?B?REs0elptbHMwNmJmTEdySmdDYUZVOVJwOGYwUnd0Q21Zbm0xSHRwWGpZUzB6?=
 =?utf-8?B?ZW9DcFFURmdhTWlIRGpaQktJSTNkKytJRkJDdWU5MG82WkFFRndJWlgweWNT?=
 =?utf-8?B?T3ZFcloyaFp3TWdidlRZTjVFdWs5MVpqYXVxMTFickZ5QXZycENRYk04TVVj?=
 =?utf-8?B?VFVmWFgrVWtQU2FTNUxrMEdzZm1Lc2hUOUxkZU1JWUJsM0haK3Ayczd0TlZl?=
 =?utf-8?B?aXY3RjR5UldjYnFrSmZ6NVV4OTRMZDdhMHRQUURhNU41RVE1VFVYOTVhYjNj?=
 =?utf-8?B?aWRHOEpNT2tKRCtjMVNKZk9hME9YTU9oUE5LdjJtYWxhTGNLbEdJT1dWekVo?=
 =?utf-8?B?OXNuYjBFclMvZHRITVhhQi92eVRRaDlNbThtbTlMRFhDL1JzWDRsMWNzWjRD?=
 =?utf-8?B?eVZRaVR1VEI3SnN1aXR4eEtkMXlldStrY1VENDVCS2c2K2ZIVmxjeVJmWW41?=
 =?utf-8?B?TG9PWi9vS00vTVp4SFNEZnNDSXpMSjVzbmQ3Z29wZjBLY2MwaU40VDh6VlZL?=
 =?utf-8?B?OW9Xb1ZUZUxtdnJYWFdidFphUWo1TFVLMERWbTI4NWMxa25IcDdrREhXeXdR?=
 =?utf-8?B?VDBvcGFBZXdNL01nL01SWlVPNnYxWnc5UWIxYXlFeTVwMDc0eHBsYmFpWkJK?=
 =?utf-8?B?bmxZMmFiUDg2K1E3NSs0Y2Z4V01adlB5TjJSNkdBRFNYWEhySW1UM0NTUTlV?=
 =?utf-8?B?M2xYOG9aaTY0TW9Nb2dWMytYQmIyN0F0WmpZYWxTUHdqM1pOd09ZcExRQitD?=
 =?utf-8?B?NGNHLzZ5Z0ZiM1hLTWM2c3Juay9tUEMzZjFaUTlyUGI2djA4aTQ0S1pEbUhM?=
 =?utf-8?B?VGtJekRxbXdYM0lvVjUra1JYTkI1UWx3NGlFd282aVBGNHpPS2M3d3ZOSmNO?=
 =?utf-8?Q?jKvn1y3gnBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVl1aWVSenV6bkIzSHNvVlFibkVYUGtLVTIrVUJNazZNSXJObFNwU1I0STU0?=
 =?utf-8?B?UURqMm9WUW5GaUg5cDEvT1IzcVJyZVVadXNJelA4bDZIK3dEc3B6L0piem9K?=
 =?utf-8?B?bU91eDEyRytRcXhhcVF4QndrOHRrTUcvOXJoU1hwU3Q3ZENZQ0JSVWhwelF2?=
 =?utf-8?B?RFhTYXVPWk12TzhXbUVmTW5oN2VZSm5GNFFKU0Z0ZFhyTFZNbTMxVDdRb1cr?=
 =?utf-8?B?ZDduVmJYUVNDVlNnNHpVZFcxcG5Vd1V5RHdwU3pyczBVcjJpWmcycEIwNWw4?=
 =?utf-8?B?ODF6VHhRZTlDVkNET1ExdHhMUUxERDA2eklXQStSYW9DOVZ3c2lLWlJmRW84?=
 =?utf-8?B?WmJRcnRjcUs1R3QvR2ZsZzdSOXB1aU5BWk5UdWhxVE9ZVXc5dGhsMDkzZVJB?=
 =?utf-8?B?SnhxUHErNTBlU1hNdGdwWFR1NWJwQ0JKQVNodUpIOE5DemRuQmxVTjN6aTBz?=
 =?utf-8?B?emY0ditGNlkrRnUvK0RxZkROTVRoWlcxT0xQaXQvUEFCaHpSVHY3emNJajND?=
 =?utf-8?B?ZW5qNHA0SE5ybkpOV29USmgwWXVFUCtRd0I1Sm1STDExdkE5MjNKOFNzSkpV?=
 =?utf-8?B?NG5QNjE3UzQ0L1VPRGRvR20zdmdHVkxYS2RyTFVTclVQNHhvSjk1MFU0SGlk?=
 =?utf-8?B?YXhLY1JVNmRUVTBKVnVSQldMV3VybnRtWm14OWlqbkNXNjY3c3hyK0JwSmxp?=
 =?utf-8?B?NWUyWWJGWnRxcTRqVVpaRnRzcWppTzZCNUo4bFVTanBMRXFCSHFRZGI2aUd5?=
 =?utf-8?B?QkxXTjF3NWxZd0xiWEZyS3VjWlIwRTdjZzFOTDJ3Mm5Ka3liMXhYZUpQaHdR?=
 =?utf-8?B?cVIxNkVkMi9wOEpCYVVGRmRLMEY0WFFDTWo2KzdRZTFPbzBPWWZvVjNMNmUy?=
 =?utf-8?B?Y2tFbmNtcWtya2FMYmI3NW1zQTlGQmVxb21jZzhTcmh0eW1rSWsxbEJvTk1D?=
 =?utf-8?B?VUQ1MFJONU50OTE4U05jd2pGU0UxOXROMUY2V05keERTK2M5TnlJampsMjlB?=
 =?utf-8?B?ZEJpWTFvZjJCRmN5ZWNGKy9UdjNMRkNEWkE1R1dkUWVUL2NkK2I2QVN3bERN?=
 =?utf-8?B?ZklWTnB6SlU2OU1zcU1UMS9qejBxa2JxVTd1OUdva3luK2VmY2xZZUpQMTY1?=
 =?utf-8?B?MlNpSTBpZmUyN2toNStDM0pYS1VBcWxSWmszMHJVUjcweGNlcDRaNnhXMmkz?=
 =?utf-8?B?bVE0UGtmcDJ1UmZiOTJnbW5GbXAxcUpBSTAvN21keHdJcUNhb1JpaTlpVnBt?=
 =?utf-8?B?aytMY04yS1JLYUZQaHE0Q25WOVhsdzI0MnBpdUFNK1hKZ3ZzY2RoYVpYVzVX?=
 =?utf-8?B?L0trR2pFNWJ4U0dSbXk0VGpVWDRzM1FWZDB4WVFnZGRzYmN3SzZnRGgxRXJn?=
 =?utf-8?B?NzNndGdXbFNLRU5IZStRNzZGeDFlTzN2bVM1UUJzdTZkdEtyNm1qM0VuN1My?=
 =?utf-8?B?K1ZFOEs0L3ZlVEhMSkxyVDRLTi8rVTRsU2xqSEF6U0NMbS8xYTlteTZXbkNs?=
 =?utf-8?B?SzY4RGZTQzIwdWZ5Zk0yWU9ZdFZaNkZLbkduYmRqQlZ5bExCdStZcCtVWmpQ?=
 =?utf-8?B?cnFBbGhCTWpIOTRFWkgyTnU3azRLUjBJeGszbFBJNzEzemR6aG9Zc3p0dCtM?=
 =?utf-8?B?WWc3cmtETDVkRkdGTVVobFlEWkZhdk9oRGlEYmxSb1YxeGJsSEJqT1pHcTdB?=
 =?utf-8?B?V2x2RTJ1ZXNpaGhkSEhzSVdWaTFrL0NGcW1iSlB2WkRQSFhsamZLdG1zbDBv?=
 =?utf-8?B?UGp2K2VaaGxSdk5oQnFQZ0lxZktoeWhzdE9FR3FrZUlUaEYxN1k5ZTgvZ2pj?=
 =?utf-8?B?U1RhaytOdWltZnZ4bDhURnlwZmF1cnUwYmVnWjlZVnJNeWRpM2pJVEpMUDJq?=
 =?utf-8?B?UTdCK1p3MngrS3JqQjJKMDdXckFBU2lTbkZneWQzMzlmYXYzZVRlbTZEaWJ4?=
 =?utf-8?B?dGM1VXhGL2lFdGJiUnR3UnlEcjBQeWg2OHVTMTVUL2dxSDdvMWpNTnI3QnVP?=
 =?utf-8?B?elc1aWFEOXJ1aDNtdS9zUkxnTmNtQ3hTY3dvQWRjaVAwenZPTkJTY0dWOEd6?=
 =?utf-8?B?cHlsd0tXSWxUNlVYNVJLREExUXM5NTA1MVkwOEhrUzl5NGpVd2RUb0ZPV0FZ?=
 =?utf-8?B?VDlKeUN6L0VBRDQwQ3cwOVJIMXRUTys4WXgxMStqZXdNQjVvam81N2hSK0Z3?=
 =?utf-8?Q?AgbEJ94L1cQC5mYb79Tu1+OJy8YG7ZrGtSt4/Jn0tygi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8b4d67-070f-453a-b929-08ddc5cc62c6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:18.1460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXjbDmVIZJEXY3abjRMyUm4+cD281lV6FQNKyPTqVWj8z8DlUs+jjbiaFZGHHIy4x9D+uWoty1HRbxTIG9um9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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

This patch series introduces a number of improvements to nova-core's
register!() macro in order to make it more useful to Nova itself, and to
bring it closer to graduation into the wider kernel crate.

The first half is trivial fixes and code reorganization to let the
following patches apply more cleanly.

The interesting stuff begins with the introduction of proper `Debug` and
`Default` implementations leveraging the field information that is made
available by the first half of the patchset. `Debug` now displays the
interpreted values of all the fields on top of the hexadecimal
representation of the register; and `Default` now initializes all the
fields to their declared default value instead of just zeroes.

Then goes a complete redesign of the way relative registers work. The
previous way was very unsafe as it accepted any literal value as the
base. Now, valid bases can (and must) be explicitly defined for specific
group of relative registers. All these bases are belong to us, and thus
can be validated at build-time.

Next come arrays of registers, a useful feature to represent contiguous
groups of registers that are interpreted identically. For these we have
both build-time and runtime checked accessors. We immediately make use
of them to clean up the FUSE registers code, which was a bit unsightly
due to the lack of this feature.

Finally, combining the two features: arrays of relative registers, which
we don't really need at the moment, but will become needed for GSP
booting.

There are still features that need to be implemented before this macro
can be considered ready for other drivers:

- Make I/O accessors optional,
- Support other sizes than `u32`,
- Allow visibility control for registers and individual fields,
- Convert the range syntax to inclusive slices instead of NVIDIA's
  OpenRM format,
- ... and proper suitability assessment by other driver contributors.

These should be trivial compared to the work that is done in this
series.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Improve documentation and add layout diagram for the relative
  registers example.
- Fix build error when fields named `offset` are declared.
- Link to v1: https://lore.kernel.org/r/20250704-nova-regs-v1-0-f88d028781a4@nvidia.com

---
Alexandre Courbot (18):
      gpu: nova-core: register: fix typo
      gpu: nova-core: register: allow fields named `offset`
      gpu: nova-core: register: improve documentation for basic registers
      gpu: nova-core: register: simplify @leaf_accessor rule
      gpu: nova-core: register: remove `try_` accessors for relative registers
      gpu: nova-core: register: move OFFSET declaration to I/O impl block
      gpu: nova-core: register: fix documentation and indentation
      gpu: nova-core: register: add missing doccomments for fixed registers I/O accessors
      gpu: nova-core: register: add fields dispatcher internal rule
      gpu: nova-core: register: improve `Debug` implementation
      gpu: nova-core: register: generate correct `Default` implementation
      gpu: nova-core: register: split @io rule into fixed and relative versions
      gpu: nova-core: register: use #[inline(always)] for all methods
      gpu: nova-core: register: redesign relative registers
      gpu: nova-core: falcon: add distinct base address for PFALCON2
      gpu: nova-core: register: add support for register arrays
      gpu: nova-core: falcon: use register arrays for FUSE registers
      gpu: nova-core: register: add support for relative array registers

John Hubbard (1):
      gpu: nova-core: register: minor grammar and spelling fixes

 Documentation/gpu/nova/core/todo.rst      |   2 -
 drivers/gpu/nova-core/falcon.rs           |  72 +--
 drivers/gpu/nova-core/falcon/gsp.rs       |  16 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  47 +-
 drivers/gpu/nova-core/falcon/sec2.rs      |  13 +-
 drivers/gpu/nova-core/gpu.rs              |   2 +-
 drivers/gpu/nova-core/regs.rs             |  83 ++--
 drivers/gpu/nova-core/regs/macros.rs      | 789 +++++++++++++++++++++++++-----
 8 files changed, 795 insertions(+), 229 deletions(-)
---
base-commit: 14ae91a81ec8fa0bc23170d4aa16dd2a20d54105
change-id: 20250703-nova-regs-24dddef5fba3

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

