Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76623C26424
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF7B10E2F2;
	Fri, 31 Oct 2025 17:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f3+wSJl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013054.outbound.protection.outlook.com
 [40.107.201.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7412510E2F2;
 Fri, 31 Oct 2025 17:01:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AY1Z3pLI27WHKtqhyqONzfbjf5uz/jXhpSCQXL6+CNEySm0Vv4OpobriHffw5SWixC/gbK2PyHJOmLzLIQquy+shHKh92ZsAgLJpr4fn5i0aMuvh4QeIBLT4r8GWN2v1oeNRRy+8BEBTYsliBeUYKlexVgI3BJ/GT3WNA/MQmt/0TRSqTUugIh5agA9L6mYARNJxvff6hPMcq0QsKF8dZYZMAQ7Uvv0jCflIc8/zYONh/YhnpVyRebSPZ0MX30rlGAdzfVif4jfmjUcOIEMkGvet9WNaMLFyXkwPlZOgyBpPyfMv65VV/MIiox8Xdfs3ecBs5HW3aSxH37I7EPsy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BKp90wjcGKVwXeV9pzKp2ndRARU+FsZCQqsYlp0CZE=;
 b=A47CX2CWyRLa63PYq1OlR+/lNprLBy8blkQ93OJ3XXc45QmwxiaSOCrnVqmcpXyipNFXOP+4YGSPo6f8zaIIl/+xXfmTaQB/xiqwvYEIxJPJNmPIkWObdqUM7IlGAj4dEc7BexIb+T9qkyMMgpugBbocqKYn9zgN0eWMnt2gkJn1bTCKc1JZx/MC3IiEln5pYm66NjFFdFeZvYgYA53pvCRCnfHBQO+2BMk4E/xCA4ygwaPosIF8vxBM4mnWTe+p4joezLGgmkEM0Z/0xye94KOVtIyoAGSUob6LOGgt+igiCUuD7e7cm6/ErnxvAWnovft8bFzlPauYYrbvQezeVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BKp90wjcGKVwXeV9pzKp2ndRARU+FsZCQqsYlp0CZE=;
 b=f3+wSJl+f5qvQPKbyf2RTjgQLPsuzEzSTGwKYrzANP3tzijTyxsElpnGREgXBc7BubFAvBHPH0h0cQGYiww++WICiIKsUo0MIW+ieGyw7dF2xX6f8yRhy+VQq3AmDoX84UF+R70W3j4+gxsi1g3zEigcm5I3pGWDDhZy0r1aYtvHJL3JP0K6sgSQggpd8lpd5dw/wZqJupix5PAz9Uayd+JNLkCuHkXBiG1PekKRFjDkwtmogAja0a/CZrZ+qFnzefmH/dQpLX+3uB6IXFNaNZcsJzaTI6D0REUE8RH0iIjf6DtSm/4ElrO9WMQ0Wes59K+cFCEdZV0f2IHmYJH38A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by DM4PR12MB7526.namprd12.prod.outlook.com (2603:10b6:8:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 17:01:23 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 17:01:23 +0000
Message-ID: <0bffd718-3659-4add-90fc-fb0e098f2897@nvidia.com>
Date: Fri, 31 Oct 2025 10:01:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/nouveau/uvmm: Allow larger pages
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
 <20251031104924.10631-3-mohamedahmedegypt2001@gmail.com>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <20251031104924.10631-3-mohamedahmedegypt2001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0046.namprd07.prod.outlook.com
 (2603:10b6:510:e::21) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|DM4PR12MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f86c5b-c14a-4a8f-bd6b-08de189f1f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzdGNHNXQVNpYnZycHFMYWpSRjg2WEprRjZySlphWHQreEQ3Y3lPVnVMaTQ4?=
 =?utf-8?B?YzA5ZjA1RlFVZnpNRkhDRHBta25KTk5xVkkzcEw0Yzl0Mkx4VGJkaVlnN0hp?=
 =?utf-8?B?SVlBTWErNG5XN01HRlBrT2xWVUE5czZIbksxY2lscThNSDJEQTg2OERtR3Ru?=
 =?utf-8?B?OGhLL3FkbGpMdWp5VS9WTkFDK0JoNzJlNndleExKMXF4bGxxVlFOWTk0ZElJ?=
 =?utf-8?B?S0ZVM1hjeWwwMlRESERXZWNwVlc1aWdwVGU2bU1tRDd0UE1yVjRsOWlJN1U2?=
 =?utf-8?B?eU5ZL3UvVEdld2NXanlvTi9QazFmdVA3UE9IYjZScHYzd242RUMzdTkwY3pS?=
 =?utf-8?B?ck1aNit0TjFEUytVQ2JiSTB0RVJSRkcxRHEwUklKUUtTV0dlODFYQVF1TGZF?=
 =?utf-8?B?SzQ1VkFITFFGTGVvQUNVTng1TTFzdHd0RXEwNmxybDY3WGt0QTNVSnpLOUpw?=
 =?utf-8?B?bERwYkNPcXZzeGhNOU14UHlKVVFpTnUwcjZxbVVKWXNZU2FaTTQyL1p6VHNG?=
 =?utf-8?B?WHk0L1JFYkVJZmhBdm9WV3NDZlpBUC81TXFsb2p5OWN6TWlPMTFSZm5DL0Zt?=
 =?utf-8?B?Ylh1em9LbW5OR2wyZUNXdUs4TnB6ZkZVSFRLQmlZTzJYWDJrNlAxeENMN0t4?=
 =?utf-8?B?OStXaXNIakNJWm1ta0FhRUtCVXozOXR2MFhQRXpFS3lvYWY3clIrTnZmb1J0?=
 =?utf-8?B?dENMUFN6bXNyVkUxRWtFaDFsQ0s5dEJOeE85MmdVeGdDTkVyd0diSWs5bTlF?=
 =?utf-8?B?dFFLZzNic0Z4cjRFZmdDdXVhRDA3WHdGSDhtMWVlN0dmNEdIME1XWXhIKzBY?=
 =?utf-8?B?dFowSlR3RHVUa1ZnLzVqeTdSNmI4YjZFdjVGMTNzaEtmdlNhVDF4cnBGSEkx?=
 =?utf-8?B?N3FoZE1WODJjbWhDTXVpSkU1NHlDdndBanEwbDlNaGFJTjVCYzZtY2hVcGdM?=
 =?utf-8?B?QmJPeXFsdVg0Qys3eU9NOVlPU3BlT2crVzJwcFkrUFEvZW5DUWNIbTB0amNl?=
 =?utf-8?B?VHhKNkRRMTMzWGNqekJmT2swV2laMWNUMGdjb0lSaWt5c0QzL2o2b3V2M08w?=
 =?utf-8?B?ejRHSE01b1FIOXU5cXloMkgxS0Mxbnhjang1NDJ0ZWxMckpuZ0VjRE5ZUEh1?=
 =?utf-8?B?Z3FHZ1dlOE5ZemZWazd0WWpPUVJrOWswNStERUw0YndtRXhoNndMeE96Qi9N?=
 =?utf-8?B?RmJvQjVvZWJFRkNXcGtJOFpNUjJDVEljMHdkajRMWTZIU2FnN3RVVDNPY1Q3?=
 =?utf-8?B?NlBNNVc0eVFZR1NlTkxVV2ovNXVTeTZjeFFCNmFkdTgzWEVQdkxnVXJXYmYr?=
 =?utf-8?B?ZVgvdS9LRGdCdkdYdTlBa1JacHJzSHVnVkZGVUNhR0hsU2l1V0RPaE1nbFl5?=
 =?utf-8?B?QnNOVExLd2wzbE1kRmlDV0JtZVIvRG5hWUhMNVpOTjFRYkZxdm4yNW5rcVlh?=
 =?utf-8?B?ejlVYzBZNkdZWFFuOWpVcHVSWFFhSnpuQlY1V0lvUCtlR3FsQ21IdmZlRXM0?=
 =?utf-8?B?eVYvVjcydTBTWHQwQlhmN1pFbFRvU1UrUmpuVkQ0d0ZIYnMrcSt4L00wdlZN?=
 =?utf-8?B?VURaVElTS2VyekZ4Ui9wSVkwRk52Y0RrUU8wNXlzODdBNmR1RjBBWjBsQmdJ?=
 =?utf-8?B?SUZYSWY0SE1FTFdYUzM0UGtVbXl0dXFtcHkwMFEvK2loM2V3SnNWOG02T2Rq?=
 =?utf-8?B?QjljeW5yWnJhYmpTbnN6U0JyWWsxMGNMV3hPaUFyLzk0S3Vha1RCcStUYWxv?=
 =?utf-8?B?dmQwdFM5eTQwZ21LRnBPVkxRUDJ0VkhIVmdtMmYyQmhUdnBkTTkvZ3pyMTZX?=
 =?utf-8?B?VG1JWUZWQjFTN3g1TnA0QUZ1U3JWNGNaanE2V1hDeXc2R2p3N2dlRzM4RDZw?=
 =?utf-8?B?bXRtdzN0cEZKbTN1anRLRHpuMnNzaEg1L2JkRi9DbGRqSThpYlQ2YjlpenhV?=
 =?utf-8?Q?/IKgOTzc+Kj0cDlEErXJ1Bl3m120Yb/P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDI3KzFrbkxBc2JUWjVWTHN5WHFMSTc4MWdiVTBQM2ZoY3pjbkNXNHhHVWVw?=
 =?utf-8?B?TGV3ZzYvQmxoRldqcHZBdVNlNUxSSXFlcHJ6OGdXb2Y0TWRJOUNHdlRYQk5X?=
 =?utf-8?B?cFNYelNtQjNZL0hwNzNuTUZRM3RhbmIvaFBiYndmWWVYTG43dUhCbEFGMytO?=
 =?utf-8?B?cHVSS2Jtc2ZyZlBkM0xuZGRyNzE2K29zQzgrL1BvM05oeUpTdHFHNkxZUTVV?=
 =?utf-8?B?NEZwTlZVN0t3WkZTcnJoWnEzMU5JVGEvUlI3WVE3eTgxcnJuVHZHWGJXUlNH?=
 =?utf-8?B?aDFDVWwyeWFjZThMV0ZGSXIvMlNpNTd1VVNvckYyWEp4ckNGL0M5cHdNc1RV?=
 =?utf-8?B?Yzh6OElYRE5weXQ4dmdUOW1xVVBSSTBJVmRvUENYSmhDcVdqQllQdWU3a012?=
 =?utf-8?B?WUhETmhtS01uTittYmR1VHV2ai9HQkFXU3pJbnI5SzRIc25TUEFNYktZdkU3?=
 =?utf-8?B?SDhDY2VoU1p1NnlHN0cxZDZpNkJORk5hVENOQ2hZVjJKcGpIY1VoR3hjZTRh?=
 =?utf-8?B?VC8zem0rcE5QQ0NkSVNOZkhRblpoZmFWSkJ1YW5aOFEzblV1Q0hKN2FLeFFS?=
 =?utf-8?B?NVZucER4b3c5cWhTSmZzZjZmMm9xYjNJSEE1VzU3N3Y0TTk0VkdBSGRod2RI?=
 =?utf-8?B?ckxSU3lOclc0T20ycGVPR1B6dEtvMTduTkhyVUdlUWlNM2I2YkdST3d3cmYz?=
 =?utf-8?B?eDZKd2xiemtTbXQyajczNytKcEhjRHE3clR6ekZld0lNdXVJMElWOVJmOHI0?=
 =?utf-8?B?U0hiVlpEU3FvZnFpQStRa2gxQWxaOVhWQjhkQjZOU2ZMQVljeDFlQXpyVkkr?=
 =?utf-8?B?WW1PbjN1R2t3Sm9ETzlhbWdvejI4aFlLL3NIcUNqV3ZsWkw1Rkg0THFvcGRy?=
 =?utf-8?B?N05ocGc2TDhRNjNhdU9RVWplVjY0MlhUTG5FTHMzb0FtZEozeWtRL2FXRkJy?=
 =?utf-8?B?dHl0ZjNZblRpeVpGU09PTU9iUWxZTVlEVmNiZGtUNkxmTkZtZWFSU3JwRFVQ?=
 =?utf-8?B?L2FHSkZ3OWhqT2VPbkQwWmtlWTNLQWpLOXJlc3RvNjFEL1BVVmx2UG52aWMz?=
 =?utf-8?B?V3dITWp6Z0lMUUpFRG9jME0xdjZDRjA2NDlyTG13V0pKR3p3OUI2WENxN3kx?=
 =?utf-8?B?c01rNmVNOWRCd2krbmtHTFZiS0dXa1NzdmJkcVhZNHFibjhGbGg1NVRMMWt1?=
 =?utf-8?B?Y05ERExjR1JTQ3pVODU0QllHek9nbUtLemMyTEY2TGlxQ3Q4TTlOanRxVjd3?=
 =?utf-8?B?bitTY3p1QzhORDB2YTRSVUdXMGFzK3RUbGtndzhnTXQ0RkFGNlVrM2NkSzF1?=
 =?utf-8?B?Y2VqbktmNTB5NVNZYVBQYWc1akk2VXZvdkxlVmVPenJXbjZyVEk1MmtHVHIz?=
 =?utf-8?B?VEZ4TS9Pd0xSWFg0b2tUTy8vMjcrRVNPeHdwNXdmUnVlZmFZZlcwOXBnSFVy?=
 =?utf-8?B?OGEyMmJDNldIV2s1ZVRSM282QWtkSEo0Q3dEWTc2cW45bkFtSC9ETjJ6NUJk?=
 =?utf-8?B?dnp2cWlVZTdQNDRIckJMQUl4cGdjb2FNUW90K2R1ZEdDZmQzYkV4Z3ZxSE5F?=
 =?utf-8?B?allDL2dkN0Z4dGg2ZGdUQ3gyU0ExZ2plUjM5WDduVnNacU9tVTVsTm5nTEt1?=
 =?utf-8?B?b3UrRVIzZXRQNnUrTVpKdTlFdnFUWEp6a1NiZVFZTTFtNmNmZHJWMlMyckJx?=
 =?utf-8?B?cEFJZC9CZTZGUVh2NTR5UUlOa1FvL29QSmVGc1R1S2EvSm9XV0ZUaEMrS3J1?=
 =?utf-8?B?djdVeUxNZ2t2UUkrNEUzZTgxSm93d2dPcjBST2N4OXhDYzJtNGo3SDlEWEhD?=
 =?utf-8?B?RzJMckVmNVFhMC9jZSt5TERMSm1TVGRBVVJEYjFJZ3lyQWJMaVhaV0JNNnc2?=
 =?utf-8?B?Z3M4b0hWNks0WldZWU52SDFOZnIzbXJycGdKTWJTK09IMGZDd3Q3cGVGeGNB?=
 =?utf-8?B?VzRjN2s0ZnV5bDl0VUV2eFZFemxIVzRoZ0VzS1dyNTJCajJ3SjdlQnFCaW4y?=
 =?utf-8?B?eis3VlBQaTZXSlF6aUNjUmdUYnRWdEJjUmt6NGJ0VlpqSGtYN2h0T0hNUzVG?=
 =?utf-8?B?K3BTdE9LWFhUL3lCMDkxV01oOUI2QmxQdVMvZ2ZFT3pHWHpRYVRPckIrSEZn?=
 =?utf-8?Q?YjTEGPV6V9M4w04NaI1wIARu4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f86c5b-c14a-4a8f-bd6b-08de189f1f13
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 17:01:23.4933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTqmZ/fTgeqJAePPVUizcnaa0sw7stnzTOOEfZ9JuHiNNKLWAM8LVHMmSkJm8/B0soBMnI/+TO+anGyhUegulA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7526
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

On 10/31/25 03:49, Mohamed Ahmed wrote:
> From: Mary Guillemard <mary@mary.zone>
> 
> Now that everything in UVMM knows about the variable page shift, we can
> select larger values.
> 
> The proposed approach relies on nouveau_bo::page unless if it would cause
> alignment issues (in which case we fall back to searching for an
> appropriate shift)
> 
> Signed-off-by: Mary Guillemard <mary@mary.zone>
> Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 60 +++++++++++++++++++++++++-
>   1 file changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 2cd0835b05e8..ab8933b88337 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -454,6 +454,62 @@ op_unmap_prepare_unwind(struct drm_gpuva *va)
>   	drm_gpuva_insert(va->vm, va);
>   }
>   
> +static bool
> +op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 page_shift)
> +{
> +	u64 non_page_bits = (1ULL << page_shift) - 1;
> +
> +	return (op->va.addr & non_page_bits) == 0 &&
> +	       (op->va.range & non_page_bits) == 0 &&
> +	       (op->gem.offset & non_page_bits) == 0;
> +}
> +
> +static u8
> +select_page_shift(struct nouveau_uvmm *uvmm, struct drm_gpuva_op_map *op)
> +{
> +	struct nouveau_bo *nvbo = nouveau_gem_object(op->gem.obj);
> +
> +	/* nouveau_bo_fixup_align() guarantees that the page size will be aligned
> +	 * for most cases, but it can't handle cases where userspace allocates with
> +	 * a size and then binds with a smaller granularity. So in order to avoid
> +	 * breaking old userspace, we need to ensure that the VA is actually
> +	 * aligned before using it, and if it isn't, then we downgrade to the first
> +	 * granularity that will fit, which is optimal from a correctness and
> +	 * performance perspective.
> +	 */
> +	if (op_map_aligned_to_page_shift(op, nvbo->page))
> +		return nvbo->page;
> +
> +	struct nouveau_mem *mem = nouveau_mem(nvbo->bo.resource);
> +	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
> +	int i;
> +
> +	/* If the given granularity doesn't fit, let's find one that will fit. */
> +	for (i = 0; i < vmm->page_nr; i++) {
> +		/* Ignore anything that is bigger or identical to the BO preference. */
> +		if (vmm->page[i].shift >= nvbo->page)
> +			continue;
> +
> +		/* Skip incompatible domains. */
> +		if ((mem->mem.type & NVIF_MEM_VRAM) && !vmm->page[i].vram)
> +			continue;
> +		if ((mem->mem.type & NVIF_MEM_HOST) &&
> +		    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
> +			continue;

This logic doesn't seem correct. I'm not sure why there's a need to 
limit the page size on the host memory type, but assuming there is due 
to nouveau architecture or HW limitations I'm not aware of, it should be 
applied universally, not just when falling back due to misaligned 
addresses. You can get lucky and have aligned addresses regardless of 
the target page size. Hence, this check would need to precede the above 
early-out for the case where op_map_aligned_to_page_shift() succeeds.

Thanks,
-James

> +		/* If it fits, return the proposed shift. */
> +		if (op_map_aligned_to_page_shift(op, vmm->page[i].shift))
> +			return vmm->page[i].shift;
> +	}
> +
> +	/* If we get here then nothing can reconcile the requirements. This should never
> +	 * happen.
> +	 */
> +	WARN_ON(1);
> +
> +	return PAGE_SHIFT;
> +}
> +
>   static void
>   nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
>   			       struct nouveau_uvma_prealloc *new,
> @@ -506,7 +562,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
>   			if (vmm_get_range)
>   				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
>   						     vmm_get_range,
> -						     PAGE_SHIFT);
> +						     select_page_shift(uvmm, &op->map));
>   			break;
>   		}
>   		case DRM_GPUVA_OP_REMAP: {
> @@ -599,7 +655,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
>   
>   	uvma->region = args->region;
>   	uvma->kind = args->kind;
> -	uvma->page_shift = PAGE_SHIFT;
> +	uvma->page_shift = select_page_shift(uvmm, op);
>   
>   	drm_gpuva_map(&uvmm->base, &uvma->va, op);
>   

