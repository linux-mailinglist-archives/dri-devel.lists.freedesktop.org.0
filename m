Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F447BA8BEE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 11:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5164610E10B;
	Mon, 29 Sep 2025 09:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mFyTw6TI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012013.outbound.protection.outlook.com [52.101.43.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B45410E10B;
 Mon, 29 Sep 2025 09:50:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1zBM4QPiRec73eZeYyoBvFJi3plUO/SxgVbbCGMUdc1CyqKxXdh1EA+ykdFlutguZJUDd66ml17NO79UC4zbfhRp8ZDtAfIuLS0qAhbj7ecgkLWJ5xaX7SYgeyEYFsQbCJV3fq+APh9sY/7IjUxjfIjN+2nQVF5t1ii7TIYhZ7rS/39Ht2JF8MwVwlSrSOdBCYmUQ4rC8cc3F3wJPIq3iCx4GoZxl4gpMCiKRdark6YOKvIC10jCuBEu0exI0IN93KDH3XE+ezZnQpX8GzboUJyzEBGMy+A07xGeKUfFCJvdBN1jeX5TOOyL6TmAf2R0wF0eEO1ha/z3hjWk45VtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wR3vruUFP/QjN+IoX5t0DjrBkXJ0n1E4OHUtYj197EI=;
 b=uuZ9R0SqiIlGmvWpcbPoJMWW+cv9O7XTG6DxkoJtUCXCuT8bYNeva/rAxLgsYOnMHvEU4c4yM0i7V5vKstjHj0/pwkJT3Cv1EEZ0ZAzULQE5IBS+RwNay8yXhmwLofZD0FzygRbvVJEX4KRpg7LagArJFGXdWjbI2Yz0ZNF/RnfSUNfMZlXwT7WVHfj8luyv3PmiEQNvFJHwy4g1ju5XRgi4HpYV4JRgYqRllykjD6QagC6jh/TshNCUCdCKuyx5qydUk16vCVuDT36kXCjNFitsPE+c1evw5yAsEz9PK0RYqVTYVfOmGZ33sA4ljkY+AS6csSu3GFp61yTIzljTfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wR3vruUFP/QjN+IoX5t0DjrBkXJ0n1E4OHUtYj197EI=;
 b=mFyTw6TI6b4nZDFnAFpfBcVr13WbIVxaaMK/SF3pEOp1762PkwmXBeEEYoHDg/CExdRzhAy1LvRImiWT70+Kni5m6iWkhudnpAWXvZvQz478UwMFv438cfE05jLYzTgRhCC/nW3lhjRcS3ir4LhK54yF6yKpTIeNu0onz2sEtIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 09:50:18 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.008; Mon, 29 Sep 2025
 09:50:18 +0000
Message-ID: <93edf489-c4f6-4f0d-a0d5-673da051983d@amd.com>
Date: Mon, 29 Sep 2025 05:50:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 07/20] drm/atomic: Pass post_blend_color_pipeline
 client cap to atomic check
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
 <20250917-mtk-post-blend-color-pipeline-v2-7-ac4471b44758@collabora.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-7-ac4471b44758@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0102.eurprd04.prod.outlook.com
 (2603:10a6:803:64::37) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: 0752e3c3-9254-44bd-24a9-08ddff3d98b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3VKd0tpVzNjU1oxVk9kQ25uUksydVJnSUc1RVk2VVRMT096TmMyY24yTi94?=
 =?utf-8?B?ZjZmaEJLVm9IODRoOEtXYXFEd1BVTnR3QXRCZTRTMWt1cmNjMnRrMnJyYnE4?=
 =?utf-8?B?OFpHNTVDWjZlSWtLb1FpbUF0ODNrWVJlQ28yN2JUeVVDWTY3WHhvUnQ1TDZI?=
 =?utf-8?B?TUEyYzRTOTV3TzgwSmVSVFdqZzF1WkU5VTR2VkVpVnlmWStCZTlmM0pDYUZR?=
 =?utf-8?B?dnJ6Z2IyYUE3a1JWdndPWGFmYW84Yms1K0ppU2MreUZ1MWcwT3FmdmMxRzZJ?=
 =?utf-8?B?VDZiZVQvUk9icE1Pc3Noa1hFT3hPMnVNWEZwL3Z3WVVwQzJGV2tXVENHU2xJ?=
 =?utf-8?B?VWdVMGk4WS9ucVhacEpYbGQ1N2FvbTNBYkFKenMzc2QycHIwTjdacFRVcjlY?=
 =?utf-8?B?a0NYV0pWbzNMWTc3ZkZYa1BJdEovWWlEd21SK3AzN3p2czQxamN2WmJ2WVl2?=
 =?utf-8?B?WHZQbU82Z1lyaDNUWm5WODg3WlMzWmZyZ2ozVkNxYzdYUlgwMi9tUjdiYVlZ?=
 =?utf-8?B?TnpaWlh3dWI3WjArQUpOZ2MxaXVWSG1tSFRYWnhaMEhrNlpCVmRyMlhoZ0lN?=
 =?utf-8?B?NkF6U3pVc25WNWhKbHNoQVViSjZvOVIxemEzd1crSnQyYXpROXRBZko4Nkx3?=
 =?utf-8?B?cHhFQzFoM3hKcjA5ZjIrM1BWMU5tK0FBMzlCc1RYVDUrUnV3M2paeHVNdmI0?=
 =?utf-8?B?L0pyTys2MkwvRjlvT040Tk14TVgwc2VjMUVXa0I1MHRCMjhISGFodHgzYUEv?=
 =?utf-8?B?ejJxdmhna0paeHkrVXpCNW5IUG9uNUN1QXNrdjEzeElOQmdaU3ZLdUl5dytH?=
 =?utf-8?B?TllLSHg2eld5Mm4vdmFyT28rVUpKNCtUN1REc0lPcGs2d21VdUIza21pcFQ3?=
 =?utf-8?B?VEUzS3NNR2JuNzZnTkZvNkNpbTlsRHQxUjhOaEU1aXpEWVBaWE4rZW8vRS9T?=
 =?utf-8?B?UFdUMjV6SGlxMW45MzZZUHVsS2NwbkZUeFk2RWFrVHJBOThmeUNvbDVnRDFG?=
 =?utf-8?B?ZVRBMkpxa2tqUFF1bExJZTkxWnNqT3NrNEg1N0UyWWJaaWszbkIwTlhyZUY1?=
 =?utf-8?B?WS9CUGtEMXVzSjlxamJqRzJzQlBZN29TNFY3ZDNqalJPREYvVGl0alZaZ0Ni?=
 =?utf-8?B?eVdrWDBXWFFtNHhFRzM0RzErdEZPU09zS3BiYnBnRnVhd3l1dG96QUUzdEtx?=
 =?utf-8?B?Z0xERUdCQjZ6bGs5NjBMY1RvMGIxV2VFbFVkSXBxR3ZXengyWmVEUnRtbDJR?=
 =?utf-8?B?b01BcEdOblNTemdvNEZocnZXU21tUDhHTWt3WHY2M0RqYVJRK1B4WHVFc2dI?=
 =?utf-8?B?aE52M2I1RjhIY0xJMXRVOFo0Qmk3VEV3UENuVExOb3ZXMlFka2FTMkZrc1k5?=
 =?utf-8?B?NUt2dk9TMU9JVEF2UWVKN1hBaDVzVXVKdy9uMlBvcXNCOUt6NTJKUzFPbmZ2?=
 =?utf-8?B?alp3cXMrR2dtR0hUSVVOaVJ2MHJNdTdxSXFYOE9mTGt0Tnk4WHBsQnBTSytl?=
 =?utf-8?B?VmJDMGlaelVqY1NyejRQMVFQTFkzRVVaaG81R0kyc25Xb0pRS1FtbzdkeGNN?=
 =?utf-8?B?aXBDSXBvaWlja1lwWURyL3BHSjF6b0pmOVEySFJQSURoVmVJVEROVW1mby9W?=
 =?utf-8?B?bmxzYTF1dURkdGpobFlTRTFiTCtJNkx3SEVRZkFUTlRqWjRDSE5WQXM5YXEw?=
 =?utf-8?B?d21LNGFBVmdLVFRXZVRpV1d4RzNacXIwMHYvaklRTVY1K0p4eDRBTGFkQllZ?=
 =?utf-8?B?dStlNWVKcFNRNDF3b29DMlFpL3VhRmJZSlZ6MUQ0T0Q1U3J1QXNERllXaDRY?=
 =?utf-8?B?b0dKS3BxZldwcFlMS3Vyb3QwWlN2aXh2TVBrakF2TFZOLzBscm1sNXphb1Rl?=
 =?utf-8?B?QThad1B0RVpaaERpcFM0ZU50T25DQmw3ejVxMkFJUlFGdjlJenBxVmlSWTNl?=
 =?utf-8?B?cWphMytXZG9meGxIODVlTDRvWDIrcW9tTDk0UHVtMEpMR24zVnZqMVV2d20v?=
 =?utf-8?Q?4J8oywHbgvklBglhXZwVhZnmFvqDc4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTJIMzlRdGYzRHpMMFYyVG4xSmRiUU9iQzZIMS9KWXZxMkpQeWl6OUZidURq?=
 =?utf-8?B?U1VxV2hmNHRvMUYvSVVQLy9MT0NkWHRzQitKa1dIZmQvT0FsNUpYR0Y2YzZr?=
 =?utf-8?B?V1NXd0s3WDhac045TFRhdHJDV3BDblVTRVVzKzRZTENrTnVOc1ExdTIxYlVW?=
 =?utf-8?B?blpZMWRoeTZjeXZEbjBEeFZYU3VsR0hLN0traTNhaHNlVC9WUkJLMW1tMlRO?=
 =?utf-8?B?dkxZUFV1R3p1YnNPd1JxdUd4L0pwdnFGUFVROU1qOHRYdkhxM01XV3VtKzBM?=
 =?utf-8?B?WkhHSUUvUVdPazFLY2xTaDJSd3greDdqR0J3MU84TU8zOWNCdjU2OW5sYzFT?=
 =?utf-8?B?YmZGUFBTeFZyUjJSRGE0THpNSmNnRlA5ckN6L01JQVU5VFRjWElPbjJITy9j?=
 =?utf-8?B?QnVIak1nMTVOL3NiS3JQYjdyUDQ4VWVZY1JYZlVaVXVEdVRaZlFxbDZXUkVV?=
 =?utf-8?B?UjlBM21LZGd3dEliN3k3blhIKzVBVGJ5UjE5Qkk3VGp1ZGNWbzJGc25sZWlT?=
 =?utf-8?B?clcrdDJob1o5WEFMTU8xcm5uRmFYWHdoRlRZVlhpYW1lZG1pWUFqTUg1WDhL?=
 =?utf-8?B?cXpjNStPNUsxaHpoekNFd2c5R0FON0VSc1RJVEdwekNhSkRna1ZwOU1CWWUz?=
 =?utf-8?B?bG5lOWFuU2ZkMGNSR1NzeHJRenVPWlo0NHNVS28zL1Nvc0lhbUxZOGU5VndI?=
 =?utf-8?B?bnpUZUgwTDhBeEs2cEdOSW1XZDJ2WWVPTVNqQ2RLOEdWN29WVWs1NnpQM3pQ?=
 =?utf-8?B?dERzeThLSmU2ZGQ4SkxiUTRMTzB0OW1hNmpRNnNYNHltcXBTVFRLS1JuYmI3?=
 =?utf-8?B?bEJoT05vMVpoR1Y4OGxmRzF1TjI1NkxndjNxUVdKaUMrT3RaUU9FNWxSaFdl?=
 =?utf-8?B?YUZCaGVjdHBhQ2JoSml0SE15ektKL3RudzVZR05rRktUa2Z6c1lMaTQ3ZGhM?=
 =?utf-8?B?Z3MvUEhLdnljVEFpU1pMZHVWY3MyeGNCS25YcnkrUmI0U1NZakx4MnJzU3Nq?=
 =?utf-8?B?ckpYY3JxZS94Vk1WMHltY0dMS012WCszZnZFYkM1b2lDTWlVV1NGR2J3aFRh?=
 =?utf-8?B?OUkva3hpTUZYQUdPZGU3UkZyb2k1NUpxTjZRZWJRUS9uMkNlazVrUVgxcElM?=
 =?utf-8?B?UjJLSjNaQ0NDY2N6VDRqT1RyQTE2czVuUFBEZDdZc0tJZWpWZHVCYzVaWG5t?=
 =?utf-8?B?SU11M21nOWpRRGd0VVVFbk1IY2RCb2QzVzdud2Y5NS93TUpxcFZmQXpveU4v?=
 =?utf-8?B?RGh4TGpMdkxYYkphdUtvTm8xeVhZK0o3RkhCNG9YQlcvYlpFb1IwbmZrNHZF?=
 =?utf-8?B?dUxJWFFVaERkSXgzb2Q4eE9iR2oyVHcrWk0rS21UU1hGMnhXT3F1TzM4OG9E?=
 =?utf-8?B?SkpkRnBCbWdKL3lFQXhCUFZ4T3JCcndFRk94YUlMUlZ1UW9halNOM1NJZTc4?=
 =?utf-8?B?MmNKVnNDbEg5dm1NbG9wdDg1UlNpaXVQemdIZ3ZtSmNVQXk4WVkwZzljREg3?=
 =?utf-8?B?OVk4TndCLytrNldFUjR0eDFaZlZpemp0OWpKekxDUjJNZnFaRGJyQ3Z5OG1E?=
 =?utf-8?B?S3dBYmduTnl3MW12ZnFnUDg3RTBEU296cjJYbG5HaUR2YnhQVmFwVkY3bGl2?=
 =?utf-8?B?b1RhbDRKUlZwK0VWaXFhS1ovaEUvaXZ4cmNnNVJoMlc4MXl1YnJNY3UwOWNO?=
 =?utf-8?B?bHk2ZEJXZzIzcFN5L0lwOXd0VTd6Ui9PdDJsRzM5MVlkNXREcmhhREdTQUkv?=
 =?utf-8?B?dklUUXdFanNYeExMNUhOR0NZQU5UMnFZQWlvK1RMQ3kzL2JhUUpzV1Nxa2dU?=
 =?utf-8?B?QTFBM2sydEJsZTF5eC9KYWU3R1pMc09EUVN4bWx4S3FBTUZTZGxpeGEzb1li?=
 =?utf-8?B?aFcwajZyMlYxM1lKUCtHcmZ4TnJNUG1sZWJWQU4wcEhaNGlUa1VMbmJ2R09j?=
 =?utf-8?B?UGRtcWwwd1RVSUhDa3JmbUFKaVdFendNcm1oWVIzNGtkTnNoU0pKQUZBUWVj?=
 =?utf-8?B?cE9FUkpZWDUzc0x6b2lVdy9TUGlRTDBEaVBuMmpORU0xWTNaMkx4aGhqS2U5?=
 =?utf-8?B?NWdGWXpHaGxDL2p0eXR6VW10Z0w5RjA4YzFjU3FBeUtyUm1DTFFyZFBFdGIv?=
 =?utf-8?B?WTdjL2JBbFpwWSs2RXlPdHg3dnZEK0R4eDJJcUM5QlNvWlJxbVFydVNMbE9a?=
 =?utf-8?Q?oertlJXDJe5GPf6lVte3isA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0752e3c3-9254-44bd-24a9-08ddff3d98b4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 09:50:17.9402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5EOydrlcqtGQdb5Cy6A62ERV5zXyLZ8sOrQG9tzWYHziYzAswRQQOPuvqEuqS//kfmQ7sgDs3Xhvc4hkeX96Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082
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



On 2025-09-17 20:43, Nícolas F. R. A. Prado wrote:
> Pass the state of the post-blend color pipeline client cap to the atomic
> state so that drivers can rely on it to enable color pipeline
> functionality and ignore the deprecated color management CRTC
> properties.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c |  1 +
>   include/drm/drm_atomic.h          | 20 ++++++++++++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index f5125fa3fa28ff2a6ff07fd7cf07d4bdf77ab738..56a440a9390c7730c4c41b491f29b933a2bbb889 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1660,6 +1660,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	state->acquire_ctx = &ctx;
>   	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
>   	state->plane_color_pipeline = file_priv->plane_color_pipeline;
> +	state->post_blend_color_pipeline = file_priv->post_blend_color_pipeline;
>   
>   retry:
>   	copied_objs = 0;
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 678708df9cdb90b4266127193a92183069f18688..8c42c584aefbf0034b2163d90538e80099b0dadb 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -482,6 +482,26 @@ struct drm_atomic_state {
>   	 */
>   	bool plane_color_pipeline : 1;
>   
> +	/**
> +	 * @post_blend_color_pipeline:
> +	 *
> +	 * Indicates whether this atomic state originated with a client that
> +	 * set the DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE.
> +	 *
> +	 * Drivers and helper functions should use this to ignore legacy
> +	 * properties that are incompatible with the drm_crtc COLOR_PIPELINE
> +	 * behavior, such as:
> +	 *
> +	 *  - GAMMA_LUT
> +	 *  - DEGAMMA_LUT
> +	 *  - GAMMA_LUT_SIZE
> +	 *  - CTM
> +	 *
> +	 * or any other driver-specific properties that might affect pixel
> +	 * values.
> +	 */
> +	bool post_blend_color_pipeline : 1;

As with the client cap name, I recommend calling this
crtc_color_pipeline.

Harry

> +
>   	/**
>   	 * @colorops:
>   	 *
> 

