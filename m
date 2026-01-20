Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C3BD3BECC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 06:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9344B10E239;
	Tue, 20 Jan 2026 05:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZfwfEeuO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010006.outbound.protection.outlook.com
 [40.93.198.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6D110E239;
 Tue, 20 Jan 2026 05:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYlzQA4ASqA2HMI3rJ30dmqq/IgE/z7eNUeqK5zEBN0q4l8lAFX84y3lpMRCXcUqYV/n+4/PJ2ffpU3iewZ0vPCZBT+nR4MmA5N8LeL7L2U43+piJx5BZkfMHszOVRWypcQl9kzlBgfJAb6WFq4pBXfNl85Wo91FH2/oTopdpciy7TpS+LgXcVZAMhd7HzUhY4Zb+cB1iSx5FebrPzOvIDeT6EUHc6OPwwSei4iUCnNSgi2eZHmVWnZifogLXWBPu+EboROVOZFfOF0ci9Qxtl58Vo/95/0S+THarW+nWESi/AGPkvJ572W2aLaD+fXVAh1aMu7kzhLOopckcvq6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHetAPF0BggPeSzjqhpgyNI0czEMO9oZ1EBrH1+DU78=;
 b=nsaC/CE1/pj4Zd8tPtIq4pagpHRB22brqvh2dnZcwS5yivl+0ijuzV7nFIxjp6DG145paJFEvgZHeQU4nYgALuCGhGhWQZHj9CpN5141eXgdBByz2ca2j5zxlXNuTB08VPHkzH8+2At4szldblZ6VO93Cb4mqnCt2CWq6902gUUfErv+8Bl7eQelIbxRcNFotF/R38an0fETJTr45fntNCoHY+2zSul9kiGAokcuOqdMrbIuPqbfW6LfLEbOQXIkeU232zU1cA3xEtAzpZgEZzNbPPdMkT0TSfa4uKaeKQon7qPh6JWUTiSXt64NU/rrlhbU2yv7LmG5zC5YZeRYYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHetAPF0BggPeSzjqhpgyNI0czEMO9oZ1EBrH1+DU78=;
 b=ZfwfEeuO9wcRgbvujKl5dfHh7uFJk5264Ex/egHav9OdoCnby2bxNYV5gadLevUnmYZis2zAGpm/x6Y81YRTLQZPc5CWLSIUH8q5P//rDrsHnFqiJD9rYw8bSbD8k5Ynmx6q/Hqkf1+3qFStajC/+FNFQZuEJ10lXen0p17p8Sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by SN7PR12MB6911.namprd12.prod.outlook.com (2603:10b6:806:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 05:27:38 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 05:27:37 +0000
Message-ID: <3ffbe456-17c1-46b4-83e1-e26792aa5248@amd.com>
Date: Tue, 20 Jan 2026 10:57:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND 1/1] drm/buddy: release free_trees array on buddy mm
 teardown
To: Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20251219193237.1454565-1-michal.grzelak@intel.com>
 <8c553c8d-2b09-4c2b-a744-dd789e5a1f64@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <8c553c8d-2b09-4c2b-a744-dd789e5a1f64@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::8) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|SN7PR12MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e07b23-e8d1-4f29-2a22-08de57e49f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWdiLzhXb2lnbGVzL0Q5YXhhOFA2WlNpcm9lR1lCMC9ia3pzS0s1R1Rja1J1?=
 =?utf-8?B?aVdzUHVsb293VFpZUkJHZEk1K20xeEduZjVCYmxSSEJKenFZS0daL2Y2YzFG?=
 =?utf-8?B?Y2JUWFMxNVdjZjFUVHpZUm1NVGNtczVPZ3VGengxRGV1VWRPVkhHNVBkdGZ1?=
 =?utf-8?B?Mm4xQWFobXcwTTdpVWg4R1dkWWZhZGxBSldGWTFIWTVtdXB6eFNwWjBuUGVz?=
 =?utf-8?B?cnJkMHo4dzhiaFdTYzVtWVIrbVVUUGg1T1RIUU9qbkE4V0U2Tll4NG9aZVpW?=
 =?utf-8?B?UEZ0VERzaXlidzJkNFYvaENBT0UxUG9nbE5KSWp5SUhUOEJ4aVgxd2V5UHE4?=
 =?utf-8?B?d3VmUDVtNUxUVFFpRm5EWWJORFcySGNFaEk2S0oxajcwSzNJRTVpM2s5MHpz?=
 =?utf-8?B?R2VmRXJ0NkQ1c0p5OGNMa2hqT2ZMVWliUUhKMDdaRENGL3pyYTFaSXpUT0dD?=
 =?utf-8?B?QXQrSjErai8yV3d6bXV2ck9aZ0VWanhqWlNzOFl1YThZWkwxb2tKM1VvRmRh?=
 =?utf-8?B?a29zQ3F0alFNaHV0QmgvcWJRemNXSmJmTVN6VWo1QXozL0ZUczY4eFlEZUFU?=
 =?utf-8?B?bENvOUFOVjBQUXNOWS9MV1RyYW9oSi9ONjZjYWRxL3BKeS91ODA4dDAyamFC?=
 =?utf-8?B?SlJRWmoxN3VXQnQwbXc3clM0UjFlT3pLc2haQjA0K3VDR1JudE4vMjZnYm9C?=
 =?utf-8?B?M0NJYTJmSHo5WVlEd0dYZTJwbFQwaDFmUXRna1hIYUZYb0VmK21yTHhQNEFP?=
 =?utf-8?B?bjFSSEErSlBrR3JGN1Q2cUpDMUNOQWo5OXIvdS94RGVOWDFXcDlkc25XRm1E?=
 =?utf-8?B?aXpJaGtvODlORTBYUWN0TmpWWUJ0eHd6UmxvTE5Rd05uSnNBWUxEUGJVdnhF?=
 =?utf-8?B?N1doTVJ3a25HMUZYbGZPMnR6eEM0YkZuM2RPZSt3VnBaUW9UYy82aG1qS1Jr?=
 =?utf-8?B?dEkvV3hXU1dYeC9nb08yNkovaUgwTG5SQXh4UVVVUXEwWTZHYmhOWG5TdzBP?=
 =?utf-8?B?K21KZS9VUUVBRXJ6TGE3a0JXTU42QS91ZGVmZTlrM0NQamtsR3EvSlJPM0pN?=
 =?utf-8?B?VVlLN1JydTVKQXVPZ0paSnJ4aUI2aElFbHpieDBFelFRUGJYU1crR01SdlJ0?=
 =?utf-8?B?RDREMHpQWnJ5eDhWVGZxLzAwVmFqWFJ0MEt6MTJhVzJBRTA5NHRXUWpkOCt0?=
 =?utf-8?B?aVI2UGVqUEVWN3VmN2s3bGFwZFFIcFhnYnRLakdlYVNjVW1GK1NLVDVGODdO?=
 =?utf-8?B?UHBFMDB4a0RRUHBlQUFFbHlaVEJyeVJtZmxFSS9xSDM4R2k0L25vQ05WVkVa?=
 =?utf-8?B?UDZNNGV5VllDRnNrOTRodHd6OXVsbU9KdHhLQ3huanFCWTJDL1B4V2NRM0NV?=
 =?utf-8?B?emlCcTllSFBQVjFvK2dsNTJNVHRzVklqSGJLMXNyQ0FYa1lQeGc0R0Z3dnFK?=
 =?utf-8?B?REhHNmdaWnhhUU8vQ3JuL1pucVRVYlFoSkZPRnlSV21LUFVqemxidUZ1RHJw?=
 =?utf-8?B?eVpvRk1tMHJJd0c4WUJlMzd3L0ZrclZhYkxOa0xMQXdXMUxNdERMUkVGY091?=
 =?utf-8?B?Wm5CNnJFRCtrL0RBL2JrZFF0S3ZrTUROK1ZhK3BQTmRsamdIWmM4bzNzaUZp?=
 =?utf-8?B?NkdYZlpKa1Rlck5QVnhuZ0J6RUhpbmtCS1I4cmRhWlhONG03ZG5YSEtTQVY4?=
 =?utf-8?B?N3FldzZFcmVQdnhGL2h3NEp5YzM3U3NvL0pRRGFKemJ4YVlIc1d6c2hPR055?=
 =?utf-8?B?QW9Pclo0YWJIZTVDUWVHYlpYNE9lNXNmaWYwWm5QQ2VLdk9qQm5QcHl1cVRt?=
 =?utf-8?B?ekxtejlNRlR5aVZlb3dub3NOTzFLa2pHSEVLMEhXTlZjdTJmTGJrMHVKTnIy?=
 =?utf-8?B?Wk9IU0I5QkIvQTl1b0NaNHJyZDZzNk9RY3Y5MFUrUmJqek5pYlc4MVpmN0Ir?=
 =?utf-8?B?bjRuUnA5ZTVIeW9YemVMWXFkdGZhTERkdUYxNVdwYXBkaEhTQnZDSVVQR21R?=
 =?utf-8?B?SCtqU0d1aFdaUzlUVFZwdDlZbTYyRWRKanFFT3hwUzlPcndBL1ZjWGZGN1F5?=
 =?utf-8?B?MnRRN0VQVXRPVWpuUHpwWnFPQStvandlb0ZWV2tGQytFVFFaV3RGblhOMHB3?=
 =?utf-8?Q?yVS8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUpUeHFYMERwZ0hwOU9qSDNZbU5CSmpMd2lRVzZVeFdJQ0FqRnFnZTdSRDhy?=
 =?utf-8?B?MnRYeVRLUXBDNmhrL3czQThyVUZpbkgwdWdBb1R2ZGYwbk4zYzB2ZFJxMXBC?=
 =?utf-8?B?WC9JRkI0d1NQalBhYUlVeXdRV3pzcUc2dVJnd3R0YVNQaXFmaFNVU0hQMFRL?=
 =?utf-8?B?NTZoSlorelErVjhtbklCQ0NrYWJpQ25NTzBtWTh5bUxCWG1RcWdHeGQ0OFZV?=
 =?utf-8?B?S3k1dElBZFljamhySTN4dU1scXdIV0V0djNLOFRWZVk2dUdJZG1yLzJLcml6?=
 =?utf-8?B?c2NiU3NSUHpnUEMrNllyS1pQS1V1SlRBbndOLzNEZkVycEZJT0VzWXN4cUw1?=
 =?utf-8?B?TXowc1pnZmx5ZktEVmlYNmR3N1lVZmxxNmZGVHc0eGE2UkwydVYzK3k3em1l?=
 =?utf-8?B?dVVwZ3ZwU3I5RFJuQ3djb3dyQmgzVndZUDFwSmlTazFFY1ZpdEJjTUlhNUJa?=
 =?utf-8?B?SC94SHFGNWVDN0tDaTRqRDA1U3ZWT0xxVG1vZFdjVldnQTZmWHVHc0FLMWdj?=
 =?utf-8?B?TUdGOGZNbE1iNXpCOUdQZzdOY2RveUlqUWlkWFJxLzhiQkFoL2w2L25iTHRI?=
 =?utf-8?B?T01SS29mNGdYY3JtcjY1akxDM0lqMTJ6YkZOWFR4T3JwS3BVWU5jK0swaUhv?=
 =?utf-8?B?cTF5cG9DMXN2TGRqSzVXWTlMUTRpUHQzajB4VHdWa0FzWE9aWU5vN2FYeW5S?=
 =?utf-8?B?SHduT2NSVkNxZkQwKzlQSHBuZ0loSUsvbUpIOFd2dElqNnMzaVY3RStIUjVF?=
 =?utf-8?B?OXFxREJtMDVqUXVlM1A0SWMvK2orMUVEQXJ0QXdNV0pObnNidHRkcmFZOXhN?=
 =?utf-8?B?WFIwaFU1T2p5ekJzZkJoaVYwb3JvbThKSjZDck5PdjZaVDd4TzhNT3YrdVlu?=
 =?utf-8?B?M1RRYVk3MllzU0F5UzBWOTVxNXNqdDR1WHdRQzVkaHk4ZVE4Q2ZtdTZxcTA4?=
 =?utf-8?B?V2oxMlpsMGZlUFRoS3R3SkNLQ2xwdXhoV1crWGZ1UHMzODd1RUxVdDYyMm1P?=
 =?utf-8?B?bjJrL0Qralc2RzNrb0Vlbjc0SkprZ0FQQVduUU5kSEQvazFFL3NGVDZ5WkRY?=
 =?utf-8?B?Mk1JN3M1RFozTlVoWXBUN1ZKc0RhQTYzZWFZSHpBOFM1dkIvcEV2a2FnV0U5?=
 =?utf-8?B?TzlhVnFoTUtQeTlHbUVuaFlvdGM0WUtHM0F6K04yNW5XMUpya0tNMkNER08v?=
 =?utf-8?B?TFlhTlVOTUQybGRUT1BJMnhvMk1rZ25HQ0hlMzJkZHoydUhmNmlTQUFXdTNm?=
 =?utf-8?B?Nlc4SE9MaVZ0clcxdkNta2FQaUYzUEpoU2pZSStzWlZHYVdWOGlsQkFuaVNH?=
 =?utf-8?B?aVM0WkZTemZvWmRXenA4WXF6NGozVEdBSjJ2bjFNYU4wRTRnb2QzNnpsRno2?=
 =?utf-8?B?aE04V2dBa2t4a255RTZwb013d1FjTzFWWkZHUDkwU29OczQ4K0I1Q2IxTjYz?=
 =?utf-8?B?NGg1K2RNSHgyU09XTXprZm5NZEFQbFFEWlZmdTgrOE9hL2VUQnoxSEtjM2Fa?=
 =?utf-8?B?WEpyWUMrWFFKOFNFSW8yaGNlVm5RNklMa0xsRVN2RElaZk5UYURVWm9hZG9Y?=
 =?utf-8?B?ZmkzeDJYV3pnS2Uvdy9ldFZ3dWRIV3pqU1NUWk9uU0tyMDB2OTU3ajRwQ0pu?=
 =?utf-8?B?STd4VDlNUDJNR0NrbFdUMCtKOUdoWE9vb3dORTFBRENFTkNXVWh2ditOTDRi?=
 =?utf-8?B?NG91VWY4WnFCMENVV3piVjNGQk03T1RxMXF5Yk1BeG5pdy9jc2JiWS8xeG43?=
 =?utf-8?B?NjlhY3R0Y1hTRHpMa29vYlFHSkVYajU2WmJkaXc0Q3oxQlN2UU04Mm13aktj?=
 =?utf-8?B?VlQ3dWRPeEdVem9xZUVlWVJVczFPQWd0SnFyRE8yVEYxNXg5MHYwem1xOTZW?=
 =?utf-8?B?S1VGazAvQURISWgzOGh2SEZVVU51Z2Vub3RuM2x4bG81Y3Y0ZUcvUkI4dU9h?=
 =?utf-8?B?UWt0RzNCbncrK1Boa2NYekU4aXBVZEZFc3U0YVNOelFucURWNEFaWnE1R25K?=
 =?utf-8?B?ZFFFbXhjL2p3VTYzOE1LUWt5TE8xSTFESVJaWit3cEJYbE5DYnRvYlV6ODNv?=
 =?utf-8?B?RHpKTEJwUjJ6UTFlUXBXSXIzcU5hN2JibDJSdWswMENMcEZST205UktZQS9y?=
 =?utf-8?B?bFdhUTEwc1daZzcvMy9xOXY4bHpnQWtIMnYzY1dJQ00xUmdTcElmOUZYMnJE?=
 =?utf-8?B?THdyQUx4cHppeG5JbU16TkZ4UjBYWGlLaU95V1ZwRWhEQ09KYzR6b2NyTEl0?=
 =?utf-8?B?cCtDYTYyT0EzZEJpeC9mYncvU3NBUzh6SVg2OVV3aHZNZERhTndRK2ltcVVa?=
 =?utf-8?B?QnJFMnpvNGZTNDl3ZEc0N0JPOC9qTk9KL1JRWlhIZTR0TXFZTWxBZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e07b23-e8d1-4f29-2a22-08de57e49f6f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 05:27:37.7400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4w1ebdkBi3R/fH0bEckje9KdAxAOWufl94lIKd3EGqzenzJMXZ3ZIzn8QmgVgETVQawxAB2psZ8OGu1B+70xdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6911
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


On 19/01/26 21:55, Matthew Auld wrote:
> On 19/12/2025 19:32, Michał Grzelak wrote:
>> During initialization of DRM buddy memory manager at drm_buddy_init,
>> mm->free_trees array is allocated for both clear and dirty RB trees.
>> During cleanup happening at drm_buddy_fini it is never freed, leading to
>> following memory leaks observed on xe module load & unload cycles:
>>
>>      kmemleak_alloc+0x4a/0x90
>>      __kmalloc_cache_noprof+0x488/0x800
>>      drm_buddy_init+0xc2/0x330 [drm_buddy]
>>      __xe_ttm_vram_mgr_init+0xc3/0x190 [xe]
>>      xe_ttm_stolen_mgr_init+0xf5/0x9d0 [xe]
>>      xe_device_probe+0x326/0x9e0 [xe]
>>      xe_pci_probe+0x39a/0x610 [xe]
>>      local_pci_probe+0x47/0xb0
>>      pci_device_probe+0xf3/0x260
>>      really_probe+0xf1/0x3c0
>>      __driver_probe_device+0x8c/0x180
>>      driver_probe_device+0x24/0xd0
>>      __driver_attach+0x10f/0x220
>>      bus_for_each_dev+0x7f/0xe0
>>      driver_attach+0x1e/0x30
>>      bus_add_driver+0x151/0x290
>>
>> Deallocate array for free trees when cleaning up buddy memory manager
>> in the same way as if going through out_free_tree label.
>>
>> Fixes: d4cd665c98c1 ("drm/buddy: Separate clear and dirty free block 
>> trees")
>> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
> Arun/Christian, can you merge this one?

Sure, I have merged this patch.

Regards,

Arun.

>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 2f279b46bd2c..8308116058cc 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -420,6 +420,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>         for_each_free_tree(i)
>>           kfree(mm->free_trees[i]);
>> +    kfree(mm->free_trees);
>>       kfree(mm->roots);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_fini);
>
