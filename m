Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C8A813B0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 19:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E86C10E718;
	Tue,  8 Apr 2025 17:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f0GVkbnr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66E010E714;
 Tue,  8 Apr 2025 17:31:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0nlSYCpIMPw+01bdf6w/j+YZKgYZz7aOIfUpwwwO1jWxTfg/ShF40NFR6zzMJPtHC8aT6lRXvXDwG6JHMswLDv/9l8KL3wCHa8ANUeGIsEXAm7QSnWhUMLUZY9oLjghdX97Pa2AQFUWN0GCbe8LjFcbZSXi+7ClIGEa0l+Z1SRuLBkAYhBp01K6y8CrzZOhlJaqKC2XMQSPg3cGllMEBOZXkOMkoatBsDBpZ/8323yz4ZD1qLMCsMdsax6UItTYaoomYYUDxnnws1+twc6Cq71AD4CRc8Rk+PeLL7ReS5+OzKl/VXuORp8V2CJH/TUXthQ77W5c0NhiqCqMrCvrvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jIsaiuakjm7odaPzVSvk8t1OWuVYu3ZSmeRQZcuC7g=;
 b=U2SYzuJ82XDID5AZLSHwvN9cnlztQNmHPi+3Ub/mq1voms1UQwvJO2DVtsLlC+uLpuZ+4cI1/gCD0CVznnNsMBPgqg7eI1+r0KM99HED/IKoAhsK52EToM2RNTiB2szREvxqzee62GaTS0P07nLw9A5pau57fjpqIdydRbfrUk9TPoWaV5KenOrdVLSZzo1QK8QQrjnmLuW/SKZeBBxpGpixOo+2Jk8wAl1bx6zd3P509kqETApSFmo86LkwYvQ19mURnsXBVdOz/SJVFK8ppAq64VoZAEAslRXjBSUPklSyWMkwRy/rDzVxkNCZMv1gYnFDrSXaUxjTPT4/RN+Yzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jIsaiuakjm7odaPzVSvk8t1OWuVYu3ZSmeRQZcuC7g=;
 b=f0GVkbnrQV0PynMcG0K2UisecNkrNsXTcraTpppIxksWc9Gziu3y2H5Ixl/Oq4EaXpe1uTuf9YQwWJ3A+tF6WlbpW8neGVm0UItzdO79O1bhdbcgocgtIg0QhnxChWBt/I6HYJGzieI3RArvY0YHKa4jWeF+IWCdS4Nv8jGJsmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB8980.namprd12.prod.outlook.com (2603:10b6:a03:542::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 17:30:54 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 17:30:54 +0000
Message-ID: <87fd7840-b021-4d3a-9d0b-2724e941c5dc@amd.com>
Date: Tue, 8 Apr 2025 13:30:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 06/43] drm/colorop: Add 1D Curve subtype
To: Daniel Stone <daniel@fooishbar.org>, Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-7-alex.hung@amd.com>
 <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
 <46R4JuwCeyu56R2FsAN-j6n0Pu5VSeLdju8KUycQ3PF5cVQrlUO3C5SX8CgpRJ-QL5_-XS2ds94pPjhzEl6hOo3iyLl0y_d0Syzinn7BxSY=@emersion.fr>
 <CAPj87rOpp8CE_kmcJmp69pM5NhxBkLOGp-BKdALX4F8GL5-29Q@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAPj87rOpp8CE_kmcJmp69pM5NhxBkLOGp-BKdALX4F8GL5-29Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0236.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: c8fdd76f-0eb0-4374-4060-08dd76c31d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzhzZVFIVTMvNkNMUktYNDJXN2Q5YitBSUlNYVh3MTRyeWl1ZjVPUlo3SmF5?=
 =?utf-8?B?ditsSnh5VGJJM2c0N25FVXYxR2hoQUxPOUxhSkNGa1pNTjNML1NKUzZRWWUz?=
 =?utf-8?B?dXhUOXhxMW8rbzROZXZxRDJHYkMrS2hYTzRNWEZrNTVvMHBwVU5YVmxRNEE4?=
 =?utf-8?B?MzdaQ2YzbWMzTm1BYlhiZkJBRDh4Ky93T2Mwc1pPc1RRN3NEcndDc2phV1lN?=
 =?utf-8?B?NHQ4QXRjSlpXVWVHY2htRENxYk1GOWdjL2FvN1A5MVhWQlZwVWk5bnlRWFV0?=
 =?utf-8?B?cXRpQW90c2RZYjRFdERyMWl4UHZDUGZwWjJPUU9hdm1TSnc4d0QwT1dkY3V2?=
 =?utf-8?B?T1BlZ2xvSVVFTTBIMXErOWtFbHVOR1psZXNoRDdoTUZJWFF2THpWZHdMd0hz?=
 =?utf-8?B?K1hNVVlVWk5UUkNocEl2RU5CUk5PU2RQWjdMZVhYVHNEVUJzajNVWWs4eHoy?=
 =?utf-8?B?UTJvUHErdDlTVVhzWmpJUklVU0pjWDZhL2dNNytQTkhBUmlJZzRjd1dXSFov?=
 =?utf-8?B?Q1R3RVhrYWhwV2hHUFB3SEtWRFBxRVRsYW1oUjNNS1JER2dNUllYa3F0Umdp?=
 =?utf-8?B?MjdMa3VGd0hYc2xRdlQvcEcwVDE0cXpNRnZoSUVkQmVoL1BzbnY2WEkwQm1w?=
 =?utf-8?B?a1NodUxQRkhFd3E3bUQ1OWYycVdZU3U4TVJiQTc2SDdoQlFwZVo3UHlRYlgv?=
 =?utf-8?B?dFBoWmFLWXc5dkdETkg4VmFsUWJoTW54NkdISnlnWnJQRUxIbENmU2F4VCt3?=
 =?utf-8?B?R0RIbHVGSXlFNzVXNjhISjMyb0lGZEcybU1zTmtNSDhkekV5ck1Cb2ZmWGFG?=
 =?utf-8?B?eEx4K2dHQVdmWENrTXdqTEJwdE9kbWIvZFRLREVLN2hkNitpUVAycFpZUTJt?=
 =?utf-8?B?WGNRcGl2cUMyMERJWW5rZ1ZZeDJwUGFpcjZnM29UQkNUcnRKeGJQWGROVTc2?=
 =?utf-8?B?MlQraGxZZnpHWDhCR1VxZCtrc2k4MFNKNER2QS9mdzNtQWdRd3dtWlVvQXNr?=
 =?utf-8?B?MGNuaFcxd3hUNE83aFRBRDV6WjNBNVRTZmlLYW5Gd2RXOTRmcEY3VE5wSDNX?=
 =?utf-8?B?dHA0bHpKcHY5bnNZMVFaUk56Q2dZdGk3WjV5a1dwTUkzdG5abm1jaWxYQjdP?=
 =?utf-8?B?cFdJcW1JSnNSWVp6ekQvMnZiTTZFZlozMjVwdDZuNU9teERya0dPcEJaazZK?=
 =?utf-8?B?ay9CTGRkOTN1eVpMT2huMHZqK1lNV1hRNEhUS2t3dU5UMjJPamljSGdWMjlV?=
 =?utf-8?B?dTNYVytHNHQzZk55a2NBaFh3bFN2VkZOdFFXU3RGQ1RPWUJXVGhkTUJwNFJo?=
 =?utf-8?B?cGsvZHVsdHVSQUZ6TDBaK2hINXMyUmIrQ2lyazJpV0tCVW9tRzlnM2tFQkNC?=
 =?utf-8?B?QThhMXExdU1DcE5sR2g5QUZnU0t4ckMxb3ByN1pMcFVqSm5kWGttd29xYVc2?=
 =?utf-8?B?SDFSRWw4S3NEL0lFUzlDSC95QzFuRlZhVTBEcnFjdUV6S3NuZjVNNG5XSm9H?=
 =?utf-8?B?eHNaL3I1WGVkS3cyQXpnT0h4TzFHTEh5amF5TkN1c2ZMdFRxRXFCNVBNYVl6?=
 =?utf-8?B?ZWlXSEw0cFV4d1NYUmZncXNPSDhTZisvTUtoNkFUdW53RXFPUmFnK1N6c25G?=
 =?utf-8?B?dmFKVDZ4L250d2Z1VWo5MW5TT29jZytuUFBnbXFuWmRLNDc1Z1JGVnQ5TWhN?=
 =?utf-8?B?amEvbGNpYTdJVGFub1lqVWFncmpwaEF6STlkV1hwYmxwSFBIVXRNendXb0Zr?=
 =?utf-8?B?b3F2ZDZqVDF2eEhPWDB3MHoxdnI2Z2h3Smc3Zi9Vdk9wb1FOSHhVMHJ6YWM1?=
 =?utf-8?B?ZGVRWU55WHZhRTI1RVNwQm5xaFl5eFpNYkx5ZFRRUlJtV1JzT0dtTXV1WG5K?=
 =?utf-8?Q?wcwHrkwCqowQP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVoxajAvd202UlZwOExoanJyUEVaamx3LzZzSU5yTWwrZjlUK2x6RERkYmgr?=
 =?utf-8?B?Qno4R3E1NG1waEJzNVZJS1ZNM0gxa1ExdnBrdTR4MWdnTFp1OGtKTlcyR3c5?=
 =?utf-8?B?LzhDbzlwRTdDSUE1ZVdEMENUS0hWNi9VYVdZRlRWdk9sRzZsOUJTZllKSXdM?=
 =?utf-8?B?K0oycm90Zy8wOThFMEVTY1hQSjN5aWJPUnV6ZlVBL2dlbFpxamZvODErVWRT?=
 =?utf-8?B?Rm9EV05wZG16cG5MUjRpeitBUEZIQ3V2dUNoOEpwdHNheURuR2tjN1htZEhs?=
 =?utf-8?B?clJrRW5lWFpmUlREVGoxRVVpak1Xcngza3hHWW00U1gvblgvYXdFSVZrTTl4?=
 =?utf-8?B?VU1wS3Z6OXNBTGdBVUszbG1YcEx4WFZaVXdHcGQ4ckM5c1lveGZNMm4xMGxD?=
 =?utf-8?B?SHRIOFZvWjVqN29CZmMwcnk3R1RoRFJJWjMzMWdHeC9kcGZDSWllZ29kQ3kr?=
 =?utf-8?B?S1l3VEhCcVZqWisvdVY2eTlOYTB5cjZYMFFhRXpLNXhrYVhmWCtJQzNkV0F5?=
 =?utf-8?B?Nk8yU3lmQ0p0QjA1T1B2YnRmWTQ4WGFLKzNObW43aU81amwybURQQTN0V3Jp?=
 =?utf-8?B?NkIyMHJrakk5YjNRVUNGMkFtQUdJU2hnb2pVRUpweWUzK29MNmZUS0VYNkdl?=
 =?utf-8?B?RTlVbG11U3g4b0MvOEdYbVhpTTFyME8zYzNIM2lHNS9oQ2kxQUwxVC95UDZN?=
 =?utf-8?B?UU1hYTY2OXRJMEhaVFIxNVR5b3NTUDJ0TzBSWCswam9kdVVBZ3pSdk9OOFAx?=
 =?utf-8?B?NENBMG5LSmo2cDlSRUhDamJSTFY0c1o3RnNmcm9Md0IvUTFrSld2Y2h2dC85?=
 =?utf-8?B?OXUxRDk0Z2hBRTIzZStjeXExSHBqVmVDNWdtTStZVys5blF6L3I0Sm9INmhj?=
 =?utf-8?B?VFR1ZzlPQWJ2elhacmRKZE94dlNKWFkzZUtuWE55K2pxdURkdDMrZ000MC8v?=
 =?utf-8?B?NThPcEZsSXBTWjNobVJScVZMcnZnMUdwSmNnWm5BblhWTEtIeVYzS3BxUUxn?=
 =?utf-8?B?MmtLaTdzUGhRUGhoVTZVRXZqbGh6amtmUFJIZTJYV3pheGtBakxsd1NkK2pZ?=
 =?utf-8?B?MXp2M0toa01kZFA3aW1ycFk1SVRyZEF3M0VqVXJxdjZyWHI3dS81MWtJdEcx?=
 =?utf-8?B?MWhZc20rYUQ1VWZaQ3IyVjZiU0o2R3I3WEk5bFd2czBzRm1uSzQrbHdnRWNj?=
 =?utf-8?B?UWsvZ0JPZDhHMjBuak1IUFo1bGJ1NGJIUWxLdEJMSzdzc1Z1YjY1d244M1Zu?=
 =?utf-8?B?YWcraDdmYmVqb0ZzQVFFVUdJUkg3eldQWDd5N09rV2laVFgyRmRUMTRSSTls?=
 =?utf-8?B?blpIR1VhQm5EakRLN0lSODdHVVpMUUYrdlQwOXNLdUpXd0hET3Vpak42MEF4?=
 =?utf-8?B?MGxVK2M2Mm9MVmgzOXBzQno1b1JzMkZ6aTB5R2g2OVRFdytTR2E0NHQzMi84?=
 =?utf-8?B?RUFFSzJDaThlTUMvYzlwM1Y0aCtaSU9qckJ4eGhaWmpJSnVhd0d1MUlrbVhk?=
 =?utf-8?B?d3EzUG9rT1czcm5Xa0tzeU1NblNBck55dWpSSmgrRzJacUFHRTdHSzIySzJY?=
 =?utf-8?B?ZGxjQ21qem9TMDdoaDRNWXNnMWlsTDVFTzRScXQ1NmJ6M3JjMlNBanJsM1BK?=
 =?utf-8?B?TVVVNFBVSGRBc1RZdERCSlU1UmZZM0hETUlLVlFjcEZmQ0ltUmdES3gwVW16?=
 =?utf-8?B?WUZxZ2ZzNmcybDBDSmtISjlzaWVNTDQ5ejBGbmZEb1J3RmlqL0VvOHF6Y1gz?=
 =?utf-8?B?MGhFQXlienZOeTdPT1RtcTdnU1dCam13S3k4OVg3RkhBMGNhSnZNTVY3dVFC?=
 =?utf-8?B?Snpld05YR1QvcmhDZURLSkE0OHBrcmI4d3RMbjFlMDJDb1Zuam1TVjR5cjRo?=
 =?utf-8?B?ckZpaG0rcUZwekd1RDIwZ1AzcHpzUU1nTVVrU0xJTHdHTWgxWmJXbGhpWjlU?=
 =?utf-8?B?djhUT0pOdHlBVkI2clBxNE5BOTJlNXd3QjNaUkVSS0QyZ2R0LzZXMXVnZWRJ?=
 =?utf-8?B?QUorWUdvOUZXUk8wUVBSSWRaMzRoK3Y4dTd4R05XRlBOajZ5MzhQWkFJRkUw?=
 =?utf-8?B?bUdBUmVOZllZUXNUa1UvWmZKYXc4V0lXMVA3ZFBGQjhPd3I2bnI3MHlxQ2hP?=
 =?utf-8?Q?dRQvi9BFVXak6Vji7TkLk0yPh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fdd76f-0eb0-4374-4060-08dd76c31d47
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 17:30:54.0222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9U2FTesQmnDAHEaWHW4xUS7wFG4U8ebLXtYjSlvInhFP9QMLKbZANV8qP+HslIXxmXBt3QhIsr8EuDzIqowQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8980
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



On 2025-04-08 12:40, Daniel Stone wrote:
> Hi there,
> 
> On Tue, 1 Apr 2025 at 20:53, Simon Ser <contact@emersion.fr> wrote:
>> On Tuesday, April 1st, 2025 at 17:14, Daniel Stone <daniel@fooishbar.org> wrote:
>>> 'plane' seems really incongruous here. The colorop can be created for
>>> any number of planes, but we're setting it to always be bound to a
>>> single plane at init, and that can only be changed later.
>>
>> I don't think the current design allows a single colorop to be re-used
>> between planes? I think as-is, drivers create one set of colorops per
>> plane and never share them between different planes?
> 
> OK, Harry's reply cleared that up perfectly - the flexibility that's
> there at the moment is about being able to reuse colorops for CRTCs in
> post-blend ops (great!), not shared between planes.
> 

Just to make sure we're talking about the same thing:

The design intent is to allow drm_colorops on a crtc (once we implement
that), not to be able to share the same drm_colorop between a plane and
crtc.

>>> 1. Is it guaranteed that, if any plane on a device supports the
>>> COLOR_PIPELINE property, all planes will support COLOR_PIPELINE?
>>> (Given the amdgpu cursor-plane discussion, it looks like no, which is
>>> unfortunate but oh well.)
>>
>> I don't think so. (They could all expose a COLOR_PIPELINE with the only
>> choice as the zero bypass pipeline, but that sounds silly.)
> 
> Works for me: so any planes could not have colour pipelines, and the
> result would be undefined (well, less defined) colour.

Yes, basically it would be what we have now (without color pipelines).

> 
>>> 2. Is it guaranteed that, if a COLOR_PIPELINE property exists on a
>>> plane, that BYPASS will be one of the supported values? (The current
>>> implementation does this, which seems sensible, but if the plan is to
>>> not make this a uAPI invariant, e.g. to support planes with mandatory
>>> CM steps, this should probably be explicitly documented.)
>>
>> Yes. This is a hard requirement, mentioned in the design doc IIRC.
> 
> Nice. I guess that's kind of implicit given pre-colorop behaviour
> expectations. We'd probably need a client cap analogous to universal
> planes to expose planes with mandatory colorop steps. This should
> probably be enforced with igt.
> 

Yes.

The API allows for the option of non-bypassable individual
colorops, but the pipeline as a whole must support bypass
currently.

>>> 3. Can a given color pipeline potentially be used on different planes,
>>> i.e. a colorop used to represent a separate hardware processing block
>>> which may be used on any plane but only one plane at a time? (This
>>> should be documented either way, and if they are unique per plane, igt
>>> should enforce this.)
>>
>> Right now, I don't think so. Could be a future extension I suppose, but
>> I think we need to properly sit down and think about all of the possible
>> consequences. Maybe using the same pipeline ID isn't the best uAPI here.
> 
> I'm with you on this. I think if we were trying to express a single
> color-transformation block which was shared between multiple planes
> (MTK is probably the closest to this conceptually from what I've
> seen), having an immutable COLOR_PIPELINE_SHARED = { ids... } property
> would be the best way to achieve this.
> 
>>> 3. Can a given color pipeline be active on multiple planes at a time?
>>> (If so, the implementation definitely needs rethinking: the colorop
>>> would need to have a list of planes.)
>>
>> I don't think so.
> 
> Great. But probably needs igt.
> 

Right, otherwise a driver dev might implement colorops in a way that
breaks this. Though, if DRM helpers are used it should be fairly safe,
I would think.

>>> 4. Can a given color pipeline be active on multiple planes on multiple
>>> CRTCs at a time?
>>
>> Ditto.
> 
> Ditto.
> 
>>> 5. For a given colorop property, is it an invariant that the colorop
>>> will only appear in one color pipeline at a time? (I believe so, but
>>> this probably needs documenting and/or igt.)
>>
>> I don't really understand why that would matter to user-space.
> 
> Plane A: COLOR_PIPELINE@123 = { 1D_CURVE@456 }
> Plane B: COLOR_PIPELINE@789 = { 1D_CURVE@456 }
> 

Yeah, a simple IGT test that parses all color pipelines and checks
that colorops don't occur in multiple pipelines is needed.

> If userspace wasn't defensive about this, it would program the curve
> for 456 twice, and unless they were the same you'd get undesirable
> results.
> 
> The existing implementation is fine here, I think it just needs better
> igt to codify the expectations we all have.
> 
>>> Either way, I suspect that clorop->plane is the wrong thing to do, and
>>> that it maybe wants to be a list of planes in the drm_colorop_state?
>>
>> I don't think so, for a given plane, there can only be a single pipeline
>> active at a time.
> 
> Yeah, again that was just not having grasped that the colorop not
> being derived from the plane was actually about allowing for it to be
> attached to a single CRTC instead, rather than potentially multiple
> planes. I have no concerns around this.
> 
> As it stands, I've gone through the implementation pretty thoroughly,
> as well as our use of it in Weston. I'm happy with how it looks for
> pre-blend, and I'm even happier that the implementation is written to
> apply easily to apply to post-blend CRTC pipelines.
> 
> With the suggested uAPI doc fixes and igt additions, this series is:
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> 
> Thanks everyone for the immense amount of work that's gone into this. :)
> 

Thanks, Daniel. It wouldn't have been possible without the help
from many. And the hackfests really helped.

Harry

> Cheers,
> Daniel

