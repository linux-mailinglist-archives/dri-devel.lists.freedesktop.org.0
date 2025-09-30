Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E92BAC6B7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DAB89F01;
	Tue, 30 Sep 2025 10:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3FIv/RgK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011017.outbound.protection.outlook.com [52.101.52.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D0D89F01
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 10:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6ZljR8pF4DhR1qXQPTd8qJPyjzUlTJ7pZ2kNqCAp8dTa+gQhMcDQHR7tksm9junte0VQYuFsLy1GdIvnQIN7HkOmdgV2IhV1qqSJnaUm9zZFjETjqa6IW9/zx0Jfsg+xTsHEz7qwCN7BJUz33lyG7X8E3DrlzLbRADuw3szkfIQOc4Pk6nvy98nJUbdnuJp1c+xl+VSZgTxq29FpKJ79T2BOe5PIYUD3ZqhQQKKQAmB3fJwyM/o6fjhYZymSbPEEl8O42roCYYzu/6fPgag7HMeyC+wCoKr0EYryRoG109SzIveq1BpuSc80BZKrJVgi9yvkiz43XcJeVZ6hh6k9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKQy59tPIIwXSCsvhjeu4LBXJh+317t0cgQotnBCM5Y=;
 b=UmFwxMK/yohFBwyK0GUmZKHlXlRDHW451VljScpwLNhGpxYreG7K9en2ZDl3VTALYniH7OscS9GBX+GUoZzG3Ajf9R9r54X4Z9Vn8ydBbrqP/ZFwiNLwNMF5StUONDB3laZC0Lizzczx3eM/1Sy0X573EdG2sWnIu1fIXISUFNYLmfPveR+Zceo+bjibeMdGwD+c0o3mQDkUQY4TKZbePX4xEzFEM4eNmkVvt9YJqBnzyt/w4RzGsg9X/zruY6RIRyTKQ1Y1IGA2Q5Ff3KMIYja+9bAMwcgODVKqBebI5Ed70sPVLdgtDcOXCtpmz/WD9YQa0xi4X5/x7Jj/IJFV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKQy59tPIIwXSCsvhjeu4LBXJh+317t0cgQotnBCM5Y=;
 b=3FIv/RgKH8JQ6Gz+uCoWneD7y9H9t5gGQHdJIb0l7AorcNpRhuWegY0Q4q6ImvvTO4Es6DRac822EU7cGNd4ve+MDt+s3WnP/2LqdOfLAIJwt0e+RI+bGfyLnWByfohLayb9DsCbrT7hQSWGv5hGJ0OaXhuRYgYNi0/5SteBOYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA3PR12MB9178.namprd12.prod.outlook.com (2603:10b6:806:396::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 10:11:54 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.017; Tue, 30 Sep 2025
 10:11:54 +0000
Message-ID: <60291e97-534e-463b-ba19-6811e0fa3e08@amd.com>
Date: Tue, 30 Sep 2025 06:11:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/16] drm/vkms: Allow to configure connector status
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>
References: <20250901122541.9983-1-jose.exposito89@gmail.com>
 <20250901122541.9983-15-jose.exposito89@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250901122541.9983-15-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0127.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA3PR12MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: 81934d8b-5cb3-466a-d6f2-08de0009c7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bytlcmkzRndCK3Foc2RBdGZvWURzOGEzVTA5MzBacnVnM0M2YzJFVzN5RWVj?=
 =?utf-8?B?TWR2LytJMnhPL2g2Q3lrWmZ3OGYwTmpuSVhKVW1SVEludTdSYUJ1ei9vSEVl?=
 =?utf-8?B?d1ArRzFCL3dSTURBZkV4UlV1MXVLMjNxb3djMGdodXJpdFRzRkVCbDNJU2Ro?=
 =?utf-8?B?RmZCY3ZPYnZXb01Janc3VXBrZTJPZHJFMXY3UnNVQmtXcXZHeTdUU1ZPaFQv?=
 =?utf-8?B?UVRxUk1UQUs0eTFndVBKb0JyaHkwekhYN25wK0lEbHdqeDIxZThtYzhudGRQ?=
 =?utf-8?B?eU01T0ZSVllIRVVCRUJWVHk3WFE0d0Jmby9zSWgxZmdmaDFkbTZXWWdxZlQ3?=
 =?utf-8?B?M1NiSkhZc1oxTnZyaVNYRlhHWTZtTW5TNG1zOTMyekVLWGk3ZGFKOG5GWDIv?=
 =?utf-8?B?YmZsMjhNcXAwelJQSkltUExvSzQrQVkwK3h5QWJCeFd0Y2tjT1FZRVBLNjJ6?=
 =?utf-8?B?aGFJUkFyRXE3UXNoblZ6cXJKU2xQaXpFOUxZV0lkaDFjNnQzTy9ZS0YvdW9m?=
 =?utf-8?B?MXFvbVlGaWNtQ1FJWEE3TUVtYkE3Rmo3bWhsMW9wS1JyT2dtNkpYN3Y2RGE4?=
 =?utf-8?B?b29EVUtxWUxCMGZkcHNjWXdoUm9kQmtPTEdnY1NHNTFlSUZTUEdTclZjOXF2?=
 =?utf-8?B?ZWFsU0JCN1Y3VjU3eFIzUEJucXc2UWhveWRsRjkyeGIrbDJsOXUxMkREQWxK?=
 =?utf-8?B?YzBrQmJOTy9lVDN1UkJZaG53RFk2bnd4bm94N21SQ1J1anA0NVQyWUNFMGx3?=
 =?utf-8?B?eTF1Rm0yWjY3dnJEYmlvaDgwTEdMbURWSmlIQmJGa0p4TTRNRkJremJsc3pH?=
 =?utf-8?B?cGEyTUs5TU9Fa05JTEg2d0czMXJQdUhpV3hWQkpyYWt2a3BQbGdKMGJTRC94?=
 =?utf-8?B?RXZNZXh1VXlPOXVRNDFTKytRamZHcVlaeGpRS3N4K2JSZ0dReXdYbmhsS3Uw?=
 =?utf-8?B?d1E3OWcrM2VsSTJSNmRrSEVJQ2gzaGNLbHgreit3R2VrTDBBY28zb3NublJx?=
 =?utf-8?B?STNmaXZWNWZyNmY2N3BxdWYvSzVYbHBrL3pERVVXekFteStaTXdFb0dYV2hs?=
 =?utf-8?B?VEhlaU5wNU1LTGV0L3JvQ0VQT0RwdXVQQ1pMN0JuWDVxMmRQdFZ5eVAwdmNI?=
 =?utf-8?B?WFBmK2VOQW9ZK2tOK0tCNmNCMkJMRXBXY0haell3N216alVtYitKaDlITlMw?=
 =?utf-8?B?dGVZRWJ4QkVZdlBGOWlDUVZJMFdqY3FUaW10K0ZPYWxvQURBOTRsN0VmbHhu?=
 =?utf-8?B?dlVhQkgwNUxPOGdxcjcxZE90YTBiNWJxTXlCS1c3TVhrSkdHRXB6Z0JrMFN3?=
 =?utf-8?B?QVNlNmJ5Ymo4NEVhQ0Z2amtCdHNnVDQydTlyOXNnZkkrT2c1TVEzYmVadTgv?=
 =?utf-8?B?d3FJeDl1dDdRUkdQeVJxUEVUN09nSVhCUHBlZ29YZDR1dEx1U0tpRGVDYTJG?=
 =?utf-8?B?eXd0VWVpelB4RFF5R3R6bllEeEU3c3BFNXBSTUlNTkJTcEdXbmhxQndjMWYw?=
 =?utf-8?B?Y2QzcnY0RmFwUngwazJTcjQxMUpFZGVCMXRBdGE2SG5UMkpwS2dDa0ZVNlhx?=
 =?utf-8?B?aXpBN3NEYitpY1VKNjVMOVFPc0l5aTNHWk80T2phOWFMQndpN1pXVzRHR3h1?=
 =?utf-8?B?eFRqV0VPOHFtRFd3VDFKb3pQWmFucmZ0TVlBcW41dUo0RVhPdnN4MVhtZTRa?=
 =?utf-8?B?bkgzdHFpWHFhUVh2THNTTkFhSjNwMjJVWTM4UytIU00vb3ZxaXhmMUZ3a3g0?=
 =?utf-8?B?WURmR3MwdmNTcXNlZE83YzFKN08xdmF0YUtHQWZxN1p1VUFuQ01JU29TaXg1?=
 =?utf-8?B?YkQvSVpZdEpXbnA3U1lwd3JHVG03eTJrNWVBbENnODJ6UUg1TW5vaFUxSlgr?=
 =?utf-8?B?STRLN2VCdmNCVlQ0ZmxoMWZJSzBmTGQxaVVra1BVUkdXbjh6TlBJTWIvazdJ?=
 =?utf-8?Q?EaS/jIEimX27NpLt+U7UeLKzHwzgJHoz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUNIdnRra0lEclF1SnVrN29nYjR5OHZKd0U4MzVDL3NzaVFKakwwQjA5RjFJ?=
 =?utf-8?B?M3p0S1lkcytvZXB1SXlxalBaSVc0dys2WWRkT0pScW1LN0ZlNk9lYUtHVita?=
 =?utf-8?B?T3lscEhBUXZCekN0dTV1YXNLbll0bDZtMVRaSGQwSm1nWWFldnI3MTYvOTBj?=
 =?utf-8?B?VFN0WTVrRGJFRkROMHB4elJIMmVWUHJRa3krQWFwNUZFc2NNZnNYRVZ0a1px?=
 =?utf-8?B?MnQ0YTZRbjVuOFkycmw1VGx5YmVKdU8rcFJ6Z2dLU24vcFB5V0tibGtUMnM3?=
 =?utf-8?B?TXh6R3doQ2VETU1hU2VhU0ZSRFNFWkV5QlV0Rmw1S3puNytnWHVOaW9IaGtO?=
 =?utf-8?B?eXZJSXFEZDBmNGJRUFMvMHZCeUxJUHJsd3ZZZDFndUtZanpSMitkOGthNGVn?=
 =?utf-8?B?Vi9RYytmRSt1OEZqSlFML1djTU5SUzNYU1hiOEFXOEtJOTVybmhNaTJvczM0?=
 =?utf-8?B?UjNFU2swMDV1SmJTbVdmSnppd1VQMW1yUGdVSVdFQmF0TTZrYjgwWTZ2V2ow?=
 =?utf-8?B?RFhObVRhaXBPZGNiZ1hSajUvU2w5akV2K0pYdFFENDJveTduU1dGeGhTYUdo?=
 =?utf-8?B?ODJjWkFCbnVMNkhjbGdpSzB3UGViMzRpS3ZwSytsRHRLL29yQWRuTEZ2Z29F?=
 =?utf-8?B?T2NnWEdIZklmTTlUMDM1bnFlNVRVeGlYL0VlcGxpdTRyUm05ZnNJL1ArTTEy?=
 =?utf-8?B?Qklwc2ZqdHNPeGVTZ2syTDhvRVRnY2ZaNU9XUlhaYllmZDA4OUttbm45aTRp?=
 =?utf-8?B?Q2pPbXhtNHlxVXozMGRyV1FtZUM4am5SMDV1MlRFVVNvOG14R0QyRHQrQ0hv?=
 =?utf-8?B?S1RRV0ZhMm1UTXlLVGt4MVp5cDAveFdxZ0lqbUpkSmRxTjBuVnR6YlJyOFB2?=
 =?utf-8?B?MU1QSHR4ZDNhNWRmNUxKVHZYeFFsZHdGZ3ExN0VtQ1RmaUdxekdqdGt1V2g4?=
 =?utf-8?B?WHJUaXJQekpTK05BVVlvYUhVN3VjSEtIRUVBckdXeEJzTVRBaWRQdng1SUpF?=
 =?utf-8?B?WDhPc1liVHh3OFBYdTBhQVYxQXNFbERMcjhMUVdDQm5KWGlBZ3ZkNnhUYm1r?=
 =?utf-8?B?dElnS2FVREF1STRqMlIzZlA2OFRDb0Rub1ZFL1JxeTRNSDYxbzVnQ3gyOUUz?=
 =?utf-8?B?aXVaVHp3bEN6RURTd2dJcjQ5WUY1Snl3T0RGT1lyYXRWcG5GNFp2TVlzb01D?=
 =?utf-8?B?Q0Z0SWNldm1iL2lIYzRPUTBZZHlSTjQ2bTNock4rdy9LK2FTZHRMQno3TXc5?=
 =?utf-8?B?REVBNndCZkRDcXBsaUZkRTcrWHlRUnMxVDNzOVpoUVEzR3plVzRNc0V6aEp4?=
 =?utf-8?B?d3NxbnJJaWluWmJNQ0JCd3VOQTROOFUyN2hzSlUvM0VWd20zZk5xRlBwMGhs?=
 =?utf-8?B?VFhDZDh3N1lnOU03T29YNkZIVFdEZUdZUHdScE45bGh6N2RnU3lRRDZhNzBt?=
 =?utf-8?B?YkZVTGtpSDdRRFJldWdhMC9ieWhMcFh0STFkK2NhMlA4SkNPUXRQdVV0bmRx?=
 =?utf-8?B?YytBRUZxUDh5TjBPZk12a1l6SXQrdkcvcWZKeXFtNkFlY0dvSlhkL2JZN3Va?=
 =?utf-8?B?RVo2cGlaMkxSWERZR1dQTU8ybE53MFZTQmtuYWE1N09sTy9NTXY1Zm93My8z?=
 =?utf-8?B?TmVqWjkyNS9IcnlKTGlKZjZLSVZGUHhoYzY0VUNZc0dQV2JBWnFrZjVnbTJO?=
 =?utf-8?B?aXEvNUpnVGRsN2ZzKzBYTmVrL215TkZ2N3Blb09QTWdFSTFKNElPNklaa2lD?=
 =?utf-8?B?aFJ2WHdKSWFRYzRjc2VTaFpOZ2NIM0d6aXhrUkY5YXM5Wk9jSXdwL3Q0OWQ4?=
 =?utf-8?B?cXZWWVdLL2dSb3pPN0MwY2hBU3FSVXNNUjFqKzlJTXpVcmV5WXRFT2s3dFhi?=
 =?utf-8?B?TnNRdU9taFBLK285MzFtc2VjRG56R0hieWovekpmSVp5TEVoVm5QdGlwUFhz?=
 =?utf-8?B?bzMwb0ZhQlhtOFpIamhMdTBYdklKTDBuN3pscnhOc3dCM24rcDIxOUJqZU85?=
 =?utf-8?B?QWxJRW01ZHFvSE9sVEd2ZTRIcTRHR24wcURvS3krNVBGQmFOOUZuaFNtOXFT?=
 =?utf-8?B?U2JvekFwalhZd20xTjBSTlp3YUZNKzIzUkc1QlV6K2VjMnZrM1FIQmJRSEg4?=
 =?utf-8?B?aGNjL1VweWZ5KzllVHhLN0IzaS9veDB3cXhnOVBFaE55Qlk4VW9kODFVVXZy?=
 =?utf-8?Q?QXAxPRkOmoMqalF36d7OVG0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81934d8b-5cb3-466a-d6f2-08de0009c7e5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 10:11:54.4390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t67AYkUSCRYqKS8Kj8+Gg7ueOIcQP/6sjFLGH/BLbn/EjgUPaLuqV+2i4VRAaERvzwzqCKrB4p6rFlfFy3ESMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9178
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



On 2025-09-01 08:25, José Expósito wrote:
> Allow to store the connector status in vkms_config_connector and add a
> getter and a setter functions as well a KUnit test.
> 
> This change only adds the configuration, the connector status is not
> used yet.
> 
> Tested-by: Mark Yacoub <markyacoub@google.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>   drivers/gpu/drm/vkms/tests/vkms_config_test.c | 24 +++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_config.c            |  8 ++++--
>   drivers/gpu/drm/vkms/vkms_config.h            | 26 +++++++++++++++++++
>   3 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index ff4566cf9925..3574a829a6ed 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -916,6 +916,29 @@ static void vkms_config_test_connector_get_possible_encoders(struct kunit *test)
>   	vkms_config_destroy(config);
>   }
>   
> +static void vkms_config_test_connector_status(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_connector *connector_cfg;
> +	enum drm_connector_status status;
> +
> +	config = vkms_config_create("test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	connector_cfg = vkms_config_create_connector(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg);
> +
> +	status = vkms_config_connector_get_status(connector_cfg);
> +	KUNIT_EXPECT_EQ(test, status, connector_status_connected);
> +
> +	vkms_config_connector_set_status(connector_cfg,
> +					 connector_status_disconnected);
> +	status = vkms_config_connector_get_status(connector_cfg);
> +	KUNIT_EXPECT_EQ(test, status, connector_status_disconnected);
> +
> +	vkms_config_destroy(config);
> +}
> +
>   static struct kunit_case vkms_config_test_cases[] = {
>   	KUNIT_CASE(vkms_config_test_empty_config),
>   	KUNIT_CASE_PARAM(vkms_config_test_default_config,
> @@ -937,6 +960,7 @@ static struct kunit_case vkms_config_test_cases[] = {
>   	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
>   	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
>   	KUNIT_CASE(vkms_config_test_connector_get_possible_encoders),
> +	KUNIT_CASE(vkms_config_test_connector_status),
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index a1df5659b0fb..f8394a063ecf 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -361,8 +361,11 @@ static int vkms_config_show(struct seq_file *m, void *data)
>   	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
>   		seq_puts(m, "encoder\n");
>   
> -	vkms_config_for_each_connector(vkmsdev->config, connector_cfg)
> -		seq_puts(m, "connector\n");
> +	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
> +		seq_puts(m, "connector:\n");
> +		seq_printf(m, "\tstatus=%d\n",
> +			   vkms_config_connector_get_status(connector_cfg));
> +	}
>   
>   	return 0;
>   }
> @@ -588,6 +591,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>   		return ERR_PTR(-ENOMEM);
>   
>   	connector_cfg->config = config;
> +	connector_cfg->status = connector_status_connected;
>   	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>   
>   	list_add_tail(&connector_cfg->link, &config->connectors);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 0118e3f99706..e202b5a84ddd 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -7,6 +7,8 @@
>   #include <linux/types.h>
>   #include <linux/xarray.h>
>   
> +#include <drm/drm_connector.h>
> +
>   #include "vkms_drv.h"
>   
>   /**
> @@ -99,6 +101,7 @@ struct vkms_config_encoder {
>    *
>    * @link: Link to the others connector in vkms_config
>    * @config: The vkms_config this connector belongs to
> + * @status: Status (connected, disconnected...) of the connector
>    * @possible_encoders: Array of encoders that can be used with this connector
>    * @connector: Internal usage. This pointer should never be considered as valid.
>    *             It can be used to store a temporary reference to a VKMS connector
> @@ -109,6 +112,7 @@ struct vkms_config_connector {
>   	struct list_head link;
>   	struct vkms_config *config;
>   
> +	enum drm_connector_status status;
>   	struct xarray possible_encoders;
>   
>   	/* Internal usage */
> @@ -434,4 +438,26 @@ int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connect
>   void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
>   					  struct vkms_config_encoder *encoder_cfg);
>   
> +/**
> + * vkms_config_connector_get_status() - Return the status of the connector
> + * @connector_cfg: Connector to get the status from
> + */
> +static inline enum drm_connector_status
> +vkms_config_connector_get_status(struct vkms_config_connector *connector_cfg)
> +{
> +	return connector_cfg->status;
> +}
> +
> +/**
> + * vkms_config_crtc_set_writeback() - If a writeback connector will be created

vkms_config_connector_set_status

> + * @crtc_cfg: Target CRTC

connector_cfg: Target Connector

> + * @writeback: Enable or disable the writeback connector

drm_connector_status: The connected state of the connector

(or something like that)

Harry

> + */
> +static inline void
> +vkms_config_connector_set_status(struct vkms_config_connector *connector_cfg,
> +				 enum drm_connector_status status)
> +{
> +	connector_cfg->status = status;
> +}
> +
>   #endif /* _VKMS_CONFIG_H_ */

