Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62957B7DF6E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA1010E3F2;
	Wed, 17 Sep 2025 02:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zJ1lI+2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E0B10E3F2;
 Wed, 17 Sep 2025 02:01:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cuym1ClFz6Yzo4lvFc23SO6mD6itJBgrFL2RJfZ6V5VlLXUoFj3b2lWz+HUyxBs7bmSOmOjfDgDIUaJ/qDXQJg+akGCNY/+7cVW5vF+/OvlR53bMEQYha7ihRxyvuM03pRtjeAqZ8W4keOzxaFqzl4bgMEwyWVnNbkUhQbKxhcE0pNTkCUoC7k8uA/tlWA3ks19VOP4uBcbfjKrG2OOp6eeAdF1qAdYguI+eFPdhwyhVTUpihRIfBJG9HHEW8a99zUmGnaKKksBB35lQe4aqPwUtcZSq7SABt7JE+fRh514Y4Vhl8Yfp+zjAtf75CbvSpQHez34aWA3rb1X44ANvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFRNBxhMYioO3X7jOk5khJpnmr30gyKMhF8fisIJWUg=;
 b=ldeg5n05+zHSWZ/m9z9Ufpznny00sUTI7b0LFcSIhWPBvh60a0TPFeySDBvTR7XtvC4MuI5lmhjkiVUFeZgirq/1WBRCtm/rNGzqbI/9Vy85LKKjqftBvMNA+E50imGiEdpC2SYm4Hq6P2ni8YaSgqCAo8Bx18T0SxexfxG4epZ6FBUmqHMlS3OzZmASgoxkB1w91j+ibq93grY6MeKOVr0JSvmXOuo1T3LSXuRjM+e6FvKP0mD6LeHIDkMD+ZD0HbkCqDaJQut3zLKv+gC1ni64ehBfVhERY7r7IPJTBLdvLGWTpzk3ESpFh+vA5oR0/YGM2KyQzcTU3b2BRSY3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFRNBxhMYioO3X7jOk5khJpnmr30gyKMhF8fisIJWUg=;
 b=zJ1lI+2qwFAx/v00xloFIekmguqXpBOrxwwUSwDSzDp4uxOcs+Mtu10Xnl7Wj1eJ3Pcy5vBC/x7h1vIjBnCTRx2qSwYcLK5PkaS4gCT1bVJtub8qeihI6pnoGuMc800zInsAvO8xWgcW5johWCP/jyEMT7OypAR+K8KSeq1Sb2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by BL3PR12MB6619.namprd12.prod.outlook.com (2603:10b6:208:38e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 17 Sep
 2025 02:01:28 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 02:01:28 +0000
Message-ID: <73c5ddcf-885c-4c90-9393-6ee6e2fdd984@amd.com>
Date: Tue, 16 Sep 2025 20:01:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 13/47] drm/colorop: Add destroy functions for color
 pipeline
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 mcanal@igalia.com, nfraprado@collabora.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-14-alex.hung@amd.com>
 <59910838-4ae7-42f1-9226-3845b3a4ab52@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <59910838-4ae7-42f1-9226-3845b3a4ab52@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:303:8f::10) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|BL3PR12MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf259f5-d78d-485d-562f-08ddf58e1d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUJhOWpQdXd0QTBQWVVVUGgrQjYxR3NVTXBSZ29xSS9MZTJueTNTQWdDOXpn?=
 =?utf-8?B?VUxHRG1xakc0ZkRHVlBqWWFZRW15SlBDRnBlZjJkR3Nmb0VySkJ3QTU3eDEr?=
 =?utf-8?B?ZStSS1BMVVVrdTZIc0tySnBUMTEydnBkbmZoSUM1MGkwM2ZFa3ZwZnNzVlp5?=
 =?utf-8?B?RjlXbHZpQ3RIdTUzQmoxL01LUlJrdGRNQnQzaXlOKzF1RGJzYWMxV1RyeUJM?=
 =?utf-8?B?cXozWElhOHZ6TGZZYWhNWVZGV1o0SHNoUFBubDlBQXhnMkkzSVFDMnMzVHdE?=
 =?utf-8?B?NUlZYi94bDhHa0M3cXpoV1FkV0JibE1BRE5EQzlYek91Si9XUDYzUzV4M24x?=
 =?utf-8?B?aU81THdyRjhsbUZON0VWM2hNTjE2bnZFM2haKzJiK1p3RUZFL281UDBmbWJs?=
 =?utf-8?B?YkhZYmZxWVYvSGdEbEJncHhTNmd1T0xaVUdxdVVBenZkUG5zQ1RPVHVheVJT?=
 =?utf-8?B?aUJEdEg3a05IM3kwM1NnRk8rR3FCVXB5WFZnSW1sckp6V280ajhMeExPeTF2?=
 =?utf-8?B?Y0xtNFlLZzBJYkZXLzByUzQrYXZTQ3lueDZYcGFJYjhFQlFRNlE5N2lzc1Fv?=
 =?utf-8?B?TFVpWHdoa0Z3emxDK3dFVE42QjQxdG5BMHBSZmx5c3VZWkpjNmhCZElWUFBF?=
 =?utf-8?B?dGRhMjZQQVFodU90Q1dDSTdjbTdlbTRRZ0JwVG82RXFBWElnSkRaK3kvSkU2?=
 =?utf-8?B?Y05qczFEdGcyTlQvWC9od3JHTnhyZ3ptS0N0NytjUlkzbC9NenZRZklob3dx?=
 =?utf-8?B?S1czR21xZFQzK05XTmt3Z1RGRkE3U1ZFUGFMUzlCUHYwRm0vT0k5ZVgzdDlI?=
 =?utf-8?B?TXpvQTc0T2xmaVp5dDM3U0R5bGpKdzFmVFk3T3lGMHdxQ3I4N3Nra1J0VmtV?=
 =?utf-8?B?UmZ4YUZTUjh2YXNhLzFSZU9wTGhhcVBLQjZ5b2tmMVE1enJMblhaTGZCK0FI?=
 =?utf-8?B?d0FKcmJKMDc3ZVBDNGtwNmdPd2hua0tTZStmdVl2N3ZZc2I2Zm9ib3lUU2ty?=
 =?utf-8?B?dklzSmFjem1scTNaYk0yY0VpdElaazI2YXBlcEtCa1ZTSFRpWDVCZ1diS0pj?=
 =?utf-8?B?NGxwM0VHbmZCbjI3NXJmWkY5Q2dtQ1VuaTd0VlhTWGw3c0ZDdWJGZzJZSHdk?=
 =?utf-8?B?c0Rycmtuc2JnamFqRXNGcTh4c1dIVVh0QWNOUDJ2bFpTaFBTM29VNndoaGl1?=
 =?utf-8?B?Slpwdno3TTFJY0oycEJycGI5eFZGc21qemJXMGl0L3hGUEovb3lodllHOXAy?=
 =?utf-8?B?MzZtNGhkcHJ4eHVRby9EbU0raHQ5OHNvSysza3FuajNjY0k0d2hlNGVmNUcz?=
 =?utf-8?B?SzFYRzZBSzUxbmU2TEZtRWFhWVUxUzM1T1JzV0JlbmRwd0hteitlbHovKzJH?=
 =?utf-8?B?ejh6SW1xb04zVzVQdHV5REVJOXVIU0tZL3plY0xrZE5ORmUzbFpYSVFFNndv?=
 =?utf-8?B?TWllU2pNZlVGVEMxb1FrdDhLZEdDanNZYkFuMG9OaGM3bXVybmxjVzNudzl2?=
 =?utf-8?B?Y3RFaEd5NzhOL1F0c01ZNnlkd25FdFkrSEVDUDFMLzR1SExkZER4QjNoTHQ1?=
 =?utf-8?B?NXNCVjUrZFJ0ZDllc01DRUlUOGlQaytTRGNBOElaTzliWHcxeDFNV2sxRkNr?=
 =?utf-8?B?Q0FLM1RBTXV2SFd1N1JRZXExN2JMVUxnRWY1VFFSaGRQUXRZbWxEUXp1SWRU?=
 =?utf-8?B?cldMYkpKeXpNVi9iOVcwUnlzVmxYZnpkVW1JbDlsWVdYczI2cTBpR0lDUldI?=
 =?utf-8?B?ekVtWVdsa3I0NVk1TjkrWlp0ZC9jWThRdkEzYlZldzNZNHNEbVBBaFpJUHZJ?=
 =?utf-8?B?NUtkcGRqNnFrOUlOYStRU0dhVHdGeXlxL1Bza1BXdDFyNUVFTVVZUytSYlhs?=
 =?utf-8?B?OVc4VFhleUU0S1l6N0N6ZXRUbGVYVW5PaHJOR0pDcnVwalVJMUtUVUZZM01z?=
 =?utf-8?Q?vdr6Qie6SYw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjBTRDVuYzJOVVIzRE1QZ05xZkpaRnAzT2tRanBleU91RkRSdFAwdEZUWG90?=
 =?utf-8?B?blZQUFJlYVdQc0NCcU5oUCtoWTBQR01nZGN0aGRrQnA3THpkRVN3Y1pqaWFB?=
 =?utf-8?B?NXlGa25oY21PNExXWlFuRDJUd2NlTjRJRjVDQ3pIVFBjQUt0dWdGa1RneXZo?=
 =?utf-8?B?Z2JTMjVpYUFBRXJHblJrN2VZdHIreWU1ckRsV1JrU1dXNU5xdUVrRnJmajJV?=
 =?utf-8?B?UDdxZHZCWkJEaWYxM1ExL0J4emM5MmsrT3dMQ1ZWa2RqeGdOSUo5Nk9YeWhu?=
 =?utf-8?B?bW1YMERXOGN5Mm5yNUdSUGd1VUFyZVVsdUFiRzIrakpINTdmUklxN1BWV001?=
 =?utf-8?B?MjZXSm5Cczd4bndiTUZGKzZ0b0h1WHNRcFRpSCtRNk1xK3FnUmtLbzdWdlRm?=
 =?utf-8?B?RENWOXovV1l4RjhJRkd4b2ltQWlsM3h4SWcvZWQ2T0pqNEdOWFh0RHl1RTAw?=
 =?utf-8?B?cEFyQ0hGa3NoVmZ1d2VCOHQweVRMaERnMzVvVkpMOVFSck1VdEU3ZUlJeUhS?=
 =?utf-8?B?cGxtejFvMFRZdjhyRkpLa2x2Ri85RkVxa0VUa214L1FQNjlOcGR1Q0p4dzBt?=
 =?utf-8?B?YXBGWkxBeW83UUtqNDFWaW4xUUlJRmlDeTRZZWRkN2hzTy84WjBrRDlsZzZO?=
 =?utf-8?B?NzJicDZCUVFkenRLa3lrZjJnMlpwTjdPY3hUTnRab3ByUW9XdFhQUmhSMGc4?=
 =?utf-8?B?Y0NCeVFGVWc3cU52ZmRKVG5UQjQwT3F6MGdjeTMvRUVhK3BnOUZjQStoUmsw?=
 =?utf-8?B?SWhGMkNGWHdQMFIvTlh0LzF4aUR3MGpjeDdTbjNHZlI0TnRwSFo0bmtlZG4r?=
 =?utf-8?B?R2lGZ3Z5NUpJRm5NVFA2ZU9tOU9Qd0xWREZkWExocW84UEpNUVJhTzh5TVR6?=
 =?utf-8?B?akM3SXdjWW54VnlZdlpTa2I0bUtNVUdLekdCOFBFL3UzNVBTVGxsU1BCbEVQ?=
 =?utf-8?B?dGloekkrQzQyQnZjSDliTnlqZzBkbUprMm15MEJnckErcGxaY0dDZ3V3cGxx?=
 =?utf-8?B?OHIrcmJqWnlRUUU2YXlsTEZOandOR1pxMG1MUkNyT2tFOXdWNUFtWjdjYnY5?=
 =?utf-8?B?U1d2T1JSSDJMOUZXTGZDYmtUTXhoNUhlZXl3Ukh1dmt1QnJxYk9zRmUrR2Nt?=
 =?utf-8?B?dUY0WDN5Q21Qa2s3dHpYa08vR3J1VVNTVE0zb0NtSFovbjFweW1YcEUwNUk1?=
 =?utf-8?B?ZmtES0VxcGhCeVh0MmxjMmpCa2VRTXk2ekdZSStaR1NKRWJjTmM2UFpQSzls?=
 =?utf-8?B?MFlaRFpkMG0xVTN0ZHQrRjQ1ZTNkTWFzV05ob2MzYWVZRjJLMVNsaEFqQzJt?=
 =?utf-8?B?VFd5UzZYNGp5WWR4RTU1YUMwcS9aUERROUdockJXY3NESU4xaFFSckc1MUM2?=
 =?utf-8?B?L3VwSGZxN2p5eGE0NVpkd2VITWZPcUhQOGZiZVYvNS96V1hJK2I4bGFPd2R4?=
 =?utf-8?B?TC9ybEcxMHdRR1p3eVNyRXlSQkxPdkZhckdFV0FEU1Q5NlAyc3p4MThoeSt1?=
 =?utf-8?B?NkEyeStMZHJXY0Z5QjJtUlp2eHcvOG1YRTJDSHJubmlncXVBMmFMeDVaMFlh?=
 =?utf-8?B?THdGWkU0MURQaUxIRkdJZHB5bStWdkpmdUxUVlR6WTFIckQrSGlxaGdlR3J2?=
 =?utf-8?B?NkZXaW9tTnpGQUEzMzhvd2lsVXRzek5uUXdzcU4zS2FXTWdveFgwR2Nqa3hY?=
 =?utf-8?B?dEt6eTBwMU9xMjlTNUUrdi9TSHBxR3NaYzVlKzNDaGJwdnlVODZMNEtiSjB4?=
 =?utf-8?B?SHRUUitFUHJCK1k3R2tVOGxMQ2JRdlR1K0hDM3R2cE5TSmpMaFlrSFpkVnpr?=
 =?utf-8?B?eWNvQTRMTEJXYy9CZU5HYnFlREVBVHNjN29mKy9HUVFMNWhDNm1GVSsrK1ds?=
 =?utf-8?B?dHJPcjcrWUVDSEQ3eWtFYlYvZlhzYmdLelZpbDRvNytBbEl3UFdvaGhyM0dp?=
 =?utf-8?B?eHNGNlBCQ3Z0ekN6a0FMeTNGQXgrR01zWHNsenhEREZwYjFFQ0UyaDBNNkYy?=
 =?utf-8?B?N2lEZEVmMGdWRm1KSjZkZmxZUnpraXplMzZuSUMwdytERmFOSUp1TFlYS2t2?=
 =?utf-8?B?Zjg3WGRsMTBGUTR3OHhGYStabmw5cjduUjNSZi9VbmJRcWJXT0ZqWGxJbjFS?=
 =?utf-8?Q?YiB+umTv9dh7+ulOQirvH57TV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf259f5-d78d-485d-562f-08ddf58e1d5d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 02:01:28.4724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSPDPrxhkwF8TTksoUKmxjcbBYiViQoxVaZJCRNtwjVrFDlkWa47h8Pl9f4BpsIxjSt5s4OqlzUfnnxmc21MQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6619
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



On 9/5/25 11:12, Louis Chauvet wrote:
> 
> 
> Le 15/08/2025 à 05:50, Alex Hung a écrit :
>> The functions are to clean up color pipeline when a device driver
>> fails to create its color pipeline.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>> Reviewed-by: Simon Ser <contact@emersion.fr>
>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>> ---
>> v11:
>>   - destroy function takes drm_device *dev instead of drm_plane *plane
>>     (Nícolas Prado)
>>
>> v9:
>>   - Move from from latest commit to here, and 
>> drm_colorop_pipeline_destroy
>>     is called in respective commits.
>>
>>   drivers/gpu/drm/drm_colorop.c | 35 +++++++++++++++++++++++++++++++++++
>>   include/drm/drm_colorop.h     |  2 ++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/ 
>> drm_colorop.c
>> index 7b3ecf7ddd11..6930d39c8ad3 100644
>> --- a/drivers/gpu/drm/drm_colorop.c
>> +++ b/drivers/gpu/drm/drm_colorop.c
>> @@ -135,6 +135,41 @@ static int drm_plane_colorop_init(struct 
>> drm_device *dev, struct drm_colorop *co
>>       return ret;
>>   }
>> +/**
>> + * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
>> + *
>> + * @colorop: The drm_colorop object to be cleaned
>> + */
>> +static void drm_colorop_cleanup(struct drm_colorop *colorop)
>> +{
>> +    struct drm_device *dev = colorop->dev;
>> +    struct drm_mode_config *config = &dev->mode_config;
>> +
>> +    list_del(&colorop->head);
>> +    config->num_colorop--;
>> +
>> +    kfree(colorop->state);
>> +}
>> +
>> +/**
>> + * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
>> + *
>> + * @dev: - The drm_device containing the drm_planes with the 
>> color_pipelines
>> + *
>> + * Provides a default color pipeline destroy handler for drm_device.
>> + */
>> +void drm_colorop_pipeline_destroy(struct drm_device *dev)
>> +{
>> +    struct drm_mode_config *config = &dev->mode_config;
>> +    struct drm_colorop *colorop, *next;
>> +
>> +    list_for_each_entry_safe(colorop, next, &config->colorop_list, 
>> head) {
>> +        drm_colorop_cleanup(colorop);
>> +        kfree(colorop);
> 
> This free here seems a bit strange. I don't see any requirement on the 
> colorop pointer in the init function, so we can expect it to be embedded 
> in a bigger structure, so this kfree may affect a non-allocated pointer.
> 
> I would expect one of:
> 
> - a clear documentation in drm_plane_colorop_*_init documentation that 
> explicitly says that you need to pass a kzalloc pointer => very error 
> prone, if the user don't read carefully the documentation it may lead to 
> undefined behavior
> 
> - that drm_plane_colorop_*_init will do the kzalloc itself (so we 
> garantee that the pointer is always a kzalloc pointer) => it will forbid 
> to embed colorop structure in bigger structure. I don't think this is 
> the case today, but I don't know if this can become a limitation for 
> other drivers.

Yes it makes to have kzalloc and kfree done both in vkms/amdgpu or both 
in drm_*.

Does the following change make sense to you?

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 1551b86471ce..67aa443e53e7 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c

@@ -214,6 +216,13 @@ int drm_plane_colorop_curve_1d_init(struct 
drm_device *dev, struct drm_colorop *
  	struct drm_property *prop;
  	int ret;

+	colorop = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!colorop) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
  	if (!supported_tfs) {
  		drm_err(dev,
  			"No supported TFs for new 1D curve colorop on [PLANE:%d:%s]\n",
diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c 
b/drivers/gpu/drm/vkms/vkms_colorop.c
index 0191ac44dec0..f11dca61b5ce 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -24,12 +24,6 @@ static int vkms_initialize_color_pipeline(struct 
drm_plane *plane, struct drm_pr
  	memset(ops, 0, sizeof(ops));

  	/* 1st op: 1d curve */
-	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
-	if (!ops[i]) {
-		drm_err(dev, "KMS: Failed to allocate colorop\n");
-		ret = -ENOMEM;
-		goto cleanup;
-	}

  	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs,
  					      DRM_COLOROP_FLAG_ALLOW_BYPASS);


> 
> - that drm_colorop_pipeline_destroy does not free anything, this must be 
> done by the driver itself => "more flexible" solution, but also require 
> that you can attach a destroy function to each drm_colorop structure 
> (like drm_crtc_funcs->destroy) or postpone it to complete device removal 
> (using drmm_kzalloc or manually in device destroy)
> 
> In addition this function leave config->colorop_list in an uncertain 
> state, I would be nice to add call list_del(colorop->head) just to avoid 
> dangling pointers.
> 
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>> +
>>   /**
>>    * drm_plane_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
>>    *
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index 791ab940c158..0ea1a01ca04e 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -239,6 +239,8 @@ static inline struct drm_colorop 
>> *drm_colorop_find(struct drm_device *dev,
>>       return mo ? obj_to_colorop(mo) : NULL;
>>   }
>> +void drm_colorop_pipeline_destroy(struct drm_device *dev);
>> +
>>   int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct 
>> drm_colorop *colorop,
>>                       struct drm_plane *plane, u64 supported_tfs);
> 

