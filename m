Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81716CFB6AC
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 01:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC24810E55A;
	Wed,  7 Jan 2026 00:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="soW/1Eie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013005.outbound.protection.outlook.com
 [40.93.201.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AC410E558;
 Wed,  7 Jan 2026 00:05:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RICTf/l2pJLPhJjgNKRrrdd4GRHOfSVb/CXbRryL2ycPUCQYDm2jJce8un6b+o2ArnWRyYPRiQSiS/8EvDcTbwDGECwJU5Eq3QSCh5GxE4qd6Z70r++17T3vE8/mmItxJScV3D3M3H3waHPHdOsvXN4DUGcv2JeiGx+Zl1u9B/QADdBhDjjWTR4c2OswBRSYH/BH1JeQ8s17DXZ+/r99JmG0Vj7y+qf1Vf3Yl7DIuFEbzR90zZKuk095o94Blb1z/0hxRcJ1w/QdDHaUUxezeY1EozYg33zvKnxWm18YmqOM/X1iuOj6LOpyvIEPJur/w3nEvpHXtl1UZXKOKvsWpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox3oC6cpwRR4Jlt8sljIm8jNQ702Wm1ig1H1O6PPLpM=;
 b=An9zmXIl6OD7TBelSNzDHK56I32rDXgE9d1nohy5A0JP7HEEu6XoTCY2kxgJTAzGR7rZJyeoSwaWzbkKQkXsW0D4Y2Hf5AMlvPX4lQcwx3o4OUKx+x9bt7ioUMy913Ucb34D+HPUEgPMZrC5RrzO4OjrXmNQsdyKDvpo3TLPYjUjIKV+m3DPqxkGu1xZ65bpacJuoOMy52+GLrvOV8WoPpNPMRiFlTkzjJdmaySbEdr+5xF4jPGpIv9y+RvVf0Ujh8bvdnjrYW2Ez60WDg41oDq4KI1v3aUy6Hoq+e5zHMDHB/w83XnDZOuiMgaBcKEYVrY4g6YP5qcucXG5gudg8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox3oC6cpwRR4Jlt8sljIm8jNQ702Wm1ig1H1O6PPLpM=;
 b=soW/1EieSxKN9++IjOMgY739VYepFMyUtbzGjXdg6FpvV6qNNUoz0Jgrb2nPOLSeJwhFFXtxregILCoE7yiQBl7HJus85+5voQ/99IlzHj2uE0gvdXJ59nCF5fzh5Kn1ZwNoVFwms/QQjDlR+KrWA2MeTzMZdk6Sw7Z+T77I3Uk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN0PR12MB6343.namprd12.prod.outlook.com (2603:10b6:208:3c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 00:05:33 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 00:05:33 +0000
Message-ID: <924e88fe-e2ff-4faf-8800-a056ef775599@amd.com>
Date: Tue, 6 Jan 2026 17:05:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] drm/colorop: Use destroy callback for color
 pipeline teardown
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 daniels@collabora.com, uma.shankar@intel.com, suraj.kandpal@intel.com,
 nfraprado@collabora.com, ville.syrjala@linux.intel.com,
 matthew.d.roper@intel.com
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-13-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251219065614.190834-13-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:303:8c::19) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN0PR12MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: ef472afd-7c53-45bf-8547-08de4d807a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUt6OXdiMDVDUHlkSS9yaHNNYzg2VFc5R3VEcDVqUkVtYjEwMjQzaTQrdFBY?=
 =?utf-8?B?NXBrSm0vOFFVOEFaU0h5L2FPOU9INjdjRFhwd3crWE5VN0VlcVRUaWFJbTdB?=
 =?utf-8?B?NnhUYzNGb0dkWW9kTDMya1U3b0pVZm5HMmkyT3NmQ1JOdDBhcHBFbHZKS21K?=
 =?utf-8?B?NDVtZjVHeWdSZzZMaDJTeXBhNTV6Vk9kYys0bDQ2YWk5MklaWnAvSXdiSVBx?=
 =?utf-8?B?enhqN3grcUJCVC8xYXJHWGRQbGVFNlROcDNyTXF1cTdvWng1bWcwQXM5ekl6?=
 =?utf-8?B?RHFHTGFURnFZdytXZVVqSVgyZnBmS3JnNkhFUGg4eFA3N2ZRRnZ1ZXdVN3dB?=
 =?utf-8?B?eTc3L2NIbUh5N2dxT25CWlpJamN2WlhwUDFWSjBBQzB2bzEvVE9pSjVNWmZV?=
 =?utf-8?B?ajZ3MTJQVnltV1VSQWpLcHAvY1RqWEFNRndraHp3VXBJN1ZWMWRDSUhoNmU4?=
 =?utf-8?B?ZGNORlA3SkdudjhGZmpWQjgvU3lsUHg3bU00SDFLbWg0ODRUMTA3ZUl1Nld3?=
 =?utf-8?B?QW52SE1WTW8vZkROZ2V2ZmFSeXErYW9odmFnWkNvTzJjbmFLeURXaUVncXk3?=
 =?utf-8?B?Zzl1aDNpR0JQd2FPdk5EMkhra3pudG5mMGQxQXFXdVdBS0d1a3NOei9ZS0Zp?=
 =?utf-8?B?bjlZanp0WThuZTZkZFRVSFpENUxaQkJiSWo0VSsza1oxb0tWSEpwRmRZVWRB?=
 =?utf-8?B?VVlwMndFSjhwZ2xqSWZ5RlA5ZVhJNmFJODBYazlzY0NvYmo1OHNxd1RueExU?=
 =?utf-8?B?Y3Z0a1JHbmxWbnpXQzh1elJTdlk1djhLZDVpMHlJRjFwUFFRZXVVOWN2L25J?=
 =?utf-8?B?WS82UGVnMXcvczJxRE5BYi9mcE1zb2tlblN5c0t3aUZUYmhwaktTZlUrZGNG?=
 =?utf-8?B?OFhPSElrdEVnNXZla01ITDdtaE1TbEVlQU84QU8yZ1ZzQkE3emxLalpjTU5u?=
 =?utf-8?B?dDVCYXZkWUZ3b1VmcmVqRG1zeVB6THY1aGJRT2laMzFBZlppQmxlcEFkRWFN?=
 =?utf-8?B?c1RCSWxoWGNoOCtmdEcrZ0pPTEJ5cm0zYTFINE1oTWZxVVlPMkVNZ1phbTF0?=
 =?utf-8?B?Z3dEdm9IMDNxNzZkQVpwWDFPQjVSWVdlTWRRZmtrT1hPeDRzQzJ1Si9Bc3du?=
 =?utf-8?B?MEZ4SnpQakxJbnYwTjhnQUxEZlducVdOVmZ4UGRHTDB5d21tYXhvTE5MWjlE?=
 =?utf-8?B?ZFBsMTBKa1g1S1NyT3ZYRkR4cGV0L3BhQ0xoN2p0VGIycy9UQ29OK0w2OElq?=
 =?utf-8?B?S2M1TGtaeHdseUdvYXFuMlg2Y1MyR0RCQ1RDNXVJbk56TWFrajdrcXVXN3NS?=
 =?utf-8?B?TnIyd29VWXc3akl4QUdyMEF0QVlESUpPdlJBcENHZkxLcUdESUxMOUxjeDBl?=
 =?utf-8?B?WmZPT0FzUDd3ODI4UVdrRlBZdSt4VXovUnpUcW9DWVliYU52R0J5aFRzQXA1?=
 =?utf-8?B?ZVVtNUFSa3doUWIwazIxT0JVSTE2QUZ6NXVVK1BnNVJ6dmNBd0F6V3g0dkEv?=
 =?utf-8?B?a0tJaEZTVjh2cHUrbnFvZVVwN2x4MkVzSXBSRTYxRGpDQmk2UkF1a0VaeG9M?=
 =?utf-8?B?a1ovOFI4Wm1UVHpPVUprTkErK1pTWHdIaEZnVjNUNTJNbElTdDJHbFplMmZz?=
 =?utf-8?B?Sm9qL0haTDdyVVc3Z1FiVWEzYzI1aXp2c21QVHFrOVdHNmo0N3VhdEMvdGlW?=
 =?utf-8?B?TlZVREk4UkpRelh5Yk85WWQyK2RsMDltUHpMU1FyeXRhYis2Y3IrckRsZ3ZV?=
 =?utf-8?B?SU8wSFdiZFh1NVJlWTg2VU5idG0ycjVXdkFHSytHMzRqbmxOOUt2cENQM3Nw?=
 =?utf-8?B?Mjg4Njd6dzNHVHR2TzczOHYrWTRXOE5ES254MlhraWFFTEg1UFgvbTJSVWkv?=
 =?utf-8?B?cW1JbmZaMzhrR0g4cDdJNjhEeSswV291MDBPZHd3VGFVRytIU3BJOWVyRVJh?=
 =?utf-8?Q?ziFzNOc7Nb7BKguQ0c8AafzQOjcKRI3J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkVhVHdwU3Bhd0x6cUFKbHFoZzFLb2NsVnhNZEFVMncyZy8vSEYzL2ZlV29j?=
 =?utf-8?B?UFBHdWRtKy9XT1FKT2FJdWUvQXZ2TUZRS1Q5bENzaE9KdTlpNmpnelhRSGR2?=
 =?utf-8?B?MDRuTk9HdnNmVnBHdXV0Y2Fod29KaXNUNDlHQUxtM1NmcVMwd1FRa1EzcER6?=
 =?utf-8?B?K2FLbFVUcStqalM1blQxU3dVQ1F1QzJxdzJoV0J2djI3NUtxUU00SGtVVHZj?=
 =?utf-8?B?NjkzU2tYNGtmeTEyS0pDOGY1aGY2MGZIMnl2RDhualUrLzN4WnpZelZ1SUh6?=
 =?utf-8?B?TDVTbGlJTkhtS3p6eGVTaTBzd0NGLzFiTHJqMURxdU1KbXNvbUhmbE5sa0FE?=
 =?utf-8?B?V1I2TmZiUmlnUlh6ZFU5QzBCeTBFK1E5TjBsSFpib2lOSXJBZk1idmREd0NV?=
 =?utf-8?B?MERtbGxRMzR6V0FSUWsveEZyUnBjNjNYc3BWOWNLSVdyd1JUNEdIT2RqdmVt?=
 =?utf-8?B?NzRxVUtqRkJ3N1FLSWtWTXRBNllVNXVzSGIzYWRrQWFFQ1lsUVZHcElBUmRD?=
 =?utf-8?B?czJOaDdxcTVCWmw2TVBGeTlqNk45WGtQbDBtRDV6ZmptcDBTM1pmOTlBZHZW?=
 =?utf-8?B?NDdhaDl6eFNGVVlMelNiQkhucUhrQVdDQnJsY3JNcmhwVnp0SnBLKzJGR1lT?=
 =?utf-8?B?Ym42akNmZndidHdhbFZWR1ZkNDYyMEhTU29nalhYMGZSaUVwWEZyb3h4elhZ?=
 =?utf-8?B?M0dBQUNkRDNPWVRkcFVvaUM0azZSR1VMcG41OTcyZXlnNU5Bbm1LdHhiZnd6?=
 =?utf-8?B?M3F6T3FtZW1lSnBBMFFFaThPZWMxR2MzMytxc2thNE4rcm9KSkd0eDQwQjlF?=
 =?utf-8?B?S3dianhrWVJxaGpuSThoOXZNZVlaUTh2OUh1SWJBYVNQb0N1TjdHWWVDZmFp?=
 =?utf-8?B?MVBWS21pc0xYUG9NZjUva2czVEhqVVRFVE94TjhoUXJjOWkrYUdNMlpobVBI?=
 =?utf-8?B?cm9wMFBRSmxHRlJOb05HaVFVUFpFM0oweUpXS3V5Q0tJMlp4UExsMjhTRUZD?=
 =?utf-8?B?aElobW05aUJycUt3QzhIZnpwQjhOdXFKMFFiTXdZNjhIeVJwcTJROUNFYmJY?=
 =?utf-8?B?L3JPT1BvRzhSOEtPTUEyNzFJaFk5ZjIvMGJZRTdRaUpKZ25ORzJmMzV0TEds?=
 =?utf-8?B?amNrakF0dGc3Q1pVcnlvbDZXRDVDbHhmNjUxSlBINnZYTmNWZHBwQlJENlNz?=
 =?utf-8?B?UHFDcFlzd01jRXg1RkNkS3JBRlhzVHZSWXBCUUFMYkFiOTA1WGVzWmlJRWZK?=
 =?utf-8?B?eXdtOTZqYnVwRlVTdlVSKytVNjMrejNSR3ZKckg4MXludko2TXdCRm1QSy9K?=
 =?utf-8?B?S2QxU3o5QjRJZFhkSnUrcFQyMFBWR3ZTWHF4NUNFVnQ3NEdxK00wSTVONFRj?=
 =?utf-8?B?RHN1cWZQWXRTSnhTVzdIbWtFNXFMVG5BVEtTYWplOUlONzl5OUR2Yld6Zjdv?=
 =?utf-8?B?eVNKa3Y3LzZTR21jQ3JWZTV0VUc4TjhxUlZHZWVaQ0pWMWIxUCtpMWlJSGoy?=
 =?utf-8?B?LzE0VHEreGxHWEtUN3dlWE5HaTVXeE80bG9ray9BT0ZSVWFlaVlBWEw4aDRt?=
 =?utf-8?B?TCtsZDI1ZG1oa0l2WGEybEd4M2VRcUNra25FK2I1MGxsY3djblVvV2RmN2cz?=
 =?utf-8?B?NHB6RGdxVS94MEV4eTdpYnBpWGdoVjVEVXZqYWdYdmpMM1dncUdOQ0FkR2E1?=
 =?utf-8?B?QnZZVXh6czZ3a0c2d0xjbDU2Qm9VZHVBd295S0phNy9NRWFwVGZZeTZDWTdN?=
 =?utf-8?B?MlRTM2NraThBempPYThsdVU2aXA0N1lEa0lxMTBMYjJUK2R4OFlmbXIyV3Rw?=
 =?utf-8?B?L3dVemU3YTluakplRzJIOXVVUWp3QW9EaE56blR0QVFQQ1gwb3FpRndDM3pz?=
 =?utf-8?B?a3hUNUw4RHA3N0ZVNFdXZFJ0L0RSY2hyYUNteVVaS0FkU1k3d2M3U3Z2WjRj?=
 =?utf-8?B?MTNqVEpIeGljQVJyRWdhR3d4bkZOTENRaERnZ29IdmE3QTFvait3QVdISXZn?=
 =?utf-8?B?WXFvOG1iMGFud3pFeUczWWN6YTZIZjBQWnZiM0VKWkN3bGhQVFRGQXMzRWlN?=
 =?utf-8?B?SDZsTHQzK09mWlZiZjZTdzd4dFdPdHg3cUNJWUR4VVcyR01kVDIydHVSd3M4?=
 =?utf-8?B?aGlIQWRyc2Q4ZWQvRTZaM21VVTJ4b3R4NThIeitEb1lJSExkZVFONVVaMzJ2?=
 =?utf-8?B?aWlnL25LdllMYnh0enJtcmRxcnVYcTRlVHFKZWxXdERjNmppaEU2T1E1VUlR?=
 =?utf-8?B?Vy9GZUxSTElJVXJLSGVua3pWanNyNE9OSVNneGtpTmpvaDRrSWRkbzd1b29j?=
 =?utf-8?B?T1NxblhjNFNSWHcvWlAyc1MxR1JWWk9ONVdyRC9qVzlSTWVQazZyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef472afd-7c53-45bf-8547-08de4d807a47
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:05:33.7356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vFRQpaI07kl/7/vzkhR/OIJJ/wO0UNVuHc1qs0lguJwjONFzvR+qsT/uJwk1VY/pmXAfjpHXglEB6UIPmKlsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6343
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 12/18/25 23:56, Chaitanya Kumar Borah wrote:
> Switch drm_colorop_pipeline_destroy() to use the driver-provided
> destroy callback instead of directly calling drm_colorop_cleanup()
> and freeing the object.
> 
> This allows drivers that embed struct drm_colorop in driver-specific
> objects to perform correct teardown.
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   drivers/gpu/drm/drm_colorop.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 4b27804bb0bd..fafe45b93ff8 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -205,8 +205,7 @@ void drm_colorop_pipeline_destroy(struct drm_device *dev)
>   	struct drm_colorop *colorop, *next;
>   
>   	list_for_each_entry_safe(colorop, next, &config->colorop_list, head) {
> -		drm_colorop_cleanup(colorop);
> -		kfree(colorop);
> +		colorop->funcs->destroy(colorop);
>   	}
>   }
>   EXPORT_SYMBOL(drm_colorop_pipeline_destroy);

