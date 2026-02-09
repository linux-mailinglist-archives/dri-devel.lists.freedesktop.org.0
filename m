Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFTaHjUtimkjIAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 19:53:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8FE113DE1
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 19:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C512310E459;
	Mon,  9 Feb 2026 18:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DeEDYWeg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012018.outbound.protection.outlook.com
 [40.93.195.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882B410E455;
 Mon,  9 Feb 2026 18:53:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXtFmlzOE/A3IwbImxi+/Nz8IIQVWlcNG3u27k+6pXkC7D44iJW0qHq4cruVbBFklyRvPV7aetFiBF1hiPCMjM2Rp4cA5YhlaZ3nXlVzsPT6w6EdlVLrw47u/x7lMkyAzlDrTlDZ8rsv/Pdv4X6AgdlmxrfHIYp2SVMCf+fiF1s1Ej2FL4oCrTU2RwL9u3bPpVb35tMUitZI6SEq7Nl1JxGMYZUVR09zPSvGDldt+z9q63nr82BpoLF1Qdo5n2h+O/hFzxVkShsE0QB6i7xT3t6k3VHIhCwlPOwDz5s98CfzfQaSS6nj5f5bhdZpOR8u+Eq6k0Z8jOkiJngPFEcmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdPCy7VVlM2FpWwitjQlrjnxbUgbbIqch38aTgZ9ySM=;
 b=Zh1rhazGaY7v8KLIzvHKWKlREpF8pSIHcCTpOr/fwvjfLpZKJ+5/LM4xSnaxrkSBE/3aWwGjTr6VLOQvZf35JIOi5KH32oCk8NpfaI2SOFILlgXsd5hgiwF9FdKwwWDc3mx4+0mU/PxfC289XwPXFRUHWl5gW7+un5xGG9mZ8CiFOrCZ863gCxIn/AoNKrULPpMA1HQooaOFRpLRCCuFxoSPC9eD+L+BqxQjNXIavjbPU44hhyGxaMCYAGllRQ/Hb/PIJsTKhFcwcXaRf4Sbffr78mWHLs4bt4fJj/f/XNn3/NFYHZqJdpXkDc6npzfiB5/BuFHY19IC2KlNa4fpZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdPCy7VVlM2FpWwitjQlrjnxbUgbbIqch38aTgZ9ySM=;
 b=DeEDYWeguFzsNdZRgmc13dJPe5SOQgy6BuNqA2q5zzFtcO+arDO6KBYzzT7sCF997HXgcbApfToiYptPXTwAqLAEWPjUnw+2qW26s8GSGtYzTUmhb/Oi4evlT19vn6UOTTyAoL+Tjtdh0prIHbmjlP3gRS2OF2sOHL+YD5tNJS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by PH7PR12MB9150.namprd12.prod.outlook.com (2603:10b6:510:2eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 9 Feb
 2026 18:53:28 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9587.016; Mon, 9 Feb 2026
 18:53:28 +0000
Message-ID: <eaf22961-3900-4a53-92f9-90e5e1080ca9@amd.com>
Date: Mon, 9 Feb 2026 13:52:47 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: events@lists.x.org, xorg-devel@lists.x.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org,
 xorg@lists.freedesktop.org
From: Harry Wentland <harry.wentland@amd.com>
Subject: X.Org Board Nominations Open 2026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0179.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::22) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|PH7PR12MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 859bdf41-6d7a-4a22-7bd2-08de680c8287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3BIOCtGK0ZNdFlVSHFnaWs2V0lBaUJpQW0vYm1kMzFsYTMzcWFJTlNDbCtq?=
 =?utf-8?B?YjI2UnRmUzFxemxpNHhPNDdYWmpuTGFvWTBVcXYvZjR3L25mbnltdGd2Szcv?=
 =?utf-8?B?RkZRaGpwRkRTTXcxYWFySmxCUHpqZFVlS0tYMi9uVDNLcDJSYUpMeFB1QlpS?=
 =?utf-8?B?MXN6RVRRNm1acDJ3eFo4cUR1eVQ2TFZLdS9iLzJUMDVSdzJNZ1ViejdlaGRp?=
 =?utf-8?B?aUlzckludnp0OFloNXJoVnp6Slp2OTNzejNNNU83TGlRQjN5WElubDFRZkUw?=
 =?utf-8?B?S2ZQcTNjZDQ2TFN6eHU1WGpMRmozN1ZFZG9jTWJlSE5mUXZRQ1hJK2txTkJM?=
 =?utf-8?B?L0J3bGhYTllPeEdBQzRwNGJBVmNzWlF0T09neHVNbEp4bmhHL2EzMWVvYU5I?=
 =?utf-8?B?QUJGMmQxbW03djQxNkxrZ2NXL0U0R05YNkNGYko3bG1STEEzWFU2RHhnQUY0?=
 =?utf-8?B?UWN1K3RGNDlkS2dqMVB0dWlsdG5HeFlBRWNQUnBocGxxZTQ4V1htV0tod2Vx?=
 =?utf-8?B?Q2phMXMwbUZ2NVVsQzlDTjVGYWF2U3ZVQlQ1STY1eWdRbHhGTkdyKzQyeUdC?=
 =?utf-8?B?ekdvWFpha2M0ZHg0eVNqY2N0cXhNRlR5UDRycCtkZjJocUkvSmJKMnRWRHNR?=
 =?utf-8?B?YWhXYmZTY3ZEUWFlWkNWblVIQWlxQ1Eramk0OTRZemNFZFVqNFdwUFdCNVZL?=
 =?utf-8?B?ZUliZmM4RytKNXJoU092L3lmNG1xc0lkdjgvclBqLy9vWTY3RTJkQ085cjEr?=
 =?utf-8?B?U01lNkhlK2lHUWJCS1NTeTE5aHgvSk9Zc2doUDVicng0U0JWT0dOSUpEV1dO?=
 =?utf-8?B?YXZETnZpQ3BxWDlubTRDd0xJTFVBVmVyN2oxK08vLzNvWEpSckllNVBPTDJa?=
 =?utf-8?B?cmJoMTBDc1F0RmV6RzBpU05RdSs1MWtvVGJTOHFucWFVVzcyOFlZSlo5dUF3?=
 =?utf-8?B?d2tNZldWbCtnajZ3K1I5M28vNjRrdEpoUjVEcmFZeXlDcmdZOUhvNjBzb0t2?=
 =?utf-8?B?OElNcm1nNFdoaGdJK2VZSWhzT0lLRDF2U1UrTGt3QzcxMm1jblZqdnhZbW4v?=
 =?utf-8?B?b2NTYVZoZCtNT2IvMjREeU1pVEd4eDlpZkNlcWtJOFJEMmZqb2tzRTUrc2Zz?=
 =?utf-8?B?TVNJb0hmMU1jbVVaMVRZa1VPMFlDMTJrbTYrbm42bWN2Z0JuMWVDQ2JMa043?=
 =?utf-8?B?cG4zMkwxMHpZSk5VZ3VDMUlNZGVaT1VoZnlFWU9SZmErNzFwRmxlc2NYNnRG?=
 =?utf-8?B?QWNVKytBdlkzb0J2cTQycHFOSzc3ckl0SURNMmNkMk1MZHNNTStSVmNNUzRm?=
 =?utf-8?B?K1htMGdMNVJQcjg1OUdlZXREd0c4NWVsampsMU95SnBhQlNBeXpuaE5lOEFj?=
 =?utf-8?B?aGtFeVM3UU42ZU5IcFdEOE81K0F6RjFLc1JIeVNUMFJlR2RzUXZ1NEVTWVAx?=
 =?utf-8?B?QmtsbThXWkh4L0xIanhJekxOZERQQjJLV2crMHJtQTIvak1YM2RCZGQ1YW9k?=
 =?utf-8?B?Rzl1cU5DZTFHQmpFMVVvOVRHb3VoRi9SMWhKaWx1dVRnSmVTNE1DckQ2QmRv?=
 =?utf-8?B?djB5WVFGSnd3V0tXWEdMekM0UkJBd1dnREFRcmFNbWZSRjhoVUQyVUJ1b2d5?=
 =?utf-8?B?aVgrZVdVYzB4L1lvMERxZUxzME96TUl6NXhPYlNwd092L2NwSHNFc0dFblZh?=
 =?utf-8?B?M0JTd3pnQktIclE5OFdWclhLTGRjSlI5VDBhYS9sUnErY290Qm9qRERKWGRz?=
 =?utf-8?B?amRIZjlWcGZrVExWTnRMY1pIdzhqMW9ERUl1ZTJDeUswUUdtRUtrQ1pwRDZq?=
 =?utf-8?B?eDdmSHBpRGRqbWtSZnlvdFRKektQby9OVFJOSFBQVExNSDB5elpNc2toZVJl?=
 =?utf-8?B?U2Q1WVRlemVmT1pDUE1Md0JjNzdBT0N4d2tDYjYwUjdCKy9RcEJ4YU9MdDdY?=
 =?utf-8?B?Nks5VlV0SWJTbUgzWWowUlV2UVhxKzJieWFBeEREdFVFTi8ramxzMVZ5VERs?=
 =?utf-8?B?dFZzZEFsSXdrclNwNlQvbVEveEpBRlVnTmMxU0xSSVVoQ09haEx6MEprT2hX?=
 =?utf-8?B?bFBNZVp1SERqNmRRVUYxQ3hxQTIva3J1dW5uSWh1OTJkSU5jVHowdDl0ZFR3?=
 =?utf-8?Q?LH1M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkpCeDVZcmsrdHlxamtzVnliVWprWkUzWnhwR2VWTVlPY0Q3UEdXaWI3WlVp?=
 =?utf-8?B?UVpjdnNZZGZPdklNQlVadVNMck5zVW9GQzIvQnRERHRjajFPeUdRMGxncUJW?=
 =?utf-8?B?YUlMb0s0Y2RVY1dLZXFtQVp2YWpwZ3lXaC9uVnlYb2RjUjI1ekE5T0l0Wi94?=
 =?utf-8?B?QXNMQkt4N3Z2ek1DYU9WdmxCbmFldElkWDU4aDZYOFJlQ1BDemxKNlRtVm81?=
 =?utf-8?B?TmxJeFZiLytCWHNWYUNpeWpaSk5PeTRGNXd4STBUNFlRWjlGRXhabS9qeTFF?=
 =?utf-8?B?Z2ozOFpRR3pweFpsZzFpYndRUW1iYXdrV1VKUkRqcnpqamp1M2NwcWJxRVVt?=
 =?utf-8?B?SkdMT2N5UzNxTTI5dUxseFBSRE0xbmR3a2FBM2YrTEtScEVoTUxucVp2MXJa?=
 =?utf-8?B?UVY3aHlub2lLVEhLRm9QL0wveFI5N0VXNFVkdU9qYmJZdlhJNHZmTHdnOFdR?=
 =?utf-8?B?SVUzWkVEVDRTUUh0S29sb3VOeERocTJzZVhKanVIQ0ZaU0hHamF6T3Vscitj?=
 =?utf-8?B?Uk9hWmdWSlUyZDN6WU5lMVNEVEFSVktJcittUitGN0JVSjZjWk9WY1FWb0Nm?=
 =?utf-8?B?NjF0enY3V1l5ZDNEenJLR1ZkeG5FNzFZc001MGVxckhpRExEbDFNTlI2N0JD?=
 =?utf-8?B?b1IxRW9JQlU4SmNLWGJoc1JteWhjMU81MFNCLzlPbGQ0MEIwNkk3WWtJYktX?=
 =?utf-8?B?dmdtU0dadktYVzQ1bGtJMG5GZ1RtTFVCUVFCMTRqNlc4ZGZEUC9DM1NoM3lI?=
 =?utf-8?B?am1CVVZEQy9FWFllTTMrUUJqTEVnREE3NUd2cDBqN1QyNUlZN2t0UWhMYVB0?=
 =?utf-8?B?UkQrTzV5eUhFTzlCLzc1VU1ORExObU54TDR6aWxUUS83a3ltZFRzdFA1ZnIy?=
 =?utf-8?B?bzdPMzZuODdlNGRoMDNKNjBpRXU0R1NEWk0xNE1ZQldFMnQ1aEpsUWRIRml5?=
 =?utf-8?B?WVUzTVN3STN3VUJQTmcvNHJ4MERMemplWUxGQlNyWlNaSmNEQ0pJaXI5WVhR?=
 =?utf-8?B?QnBQdXBTdE1Cc1Y0VEtIZWVabzhkWXN5aG5KSEZxaVNKU2IvNTRzL0E3YXJj?=
 =?utf-8?B?bUI0YVhaSzc2OFl0bWt2NFBicGRzQTZxcURKYlF5TElkbG5FYWJTcTdCVXRS?=
 =?utf-8?B?UEhYM3dJU0FuN09tMG8ybHNjbEZLNm95RkhaNURqSXdKbmMxb3lsYkV1Z0Vj?=
 =?utf-8?B?Q2t2eDM5ajJUYXFWZTEyYXhHeWoxOHhJZ3FMZlR0VmdjZ0UvMkJBYlZROTJx?=
 =?utf-8?B?VWtGZjBGMTZBUU5MY3ZFRTF0RnFzcVFOV3ZtNzBXRmVkeWFNd0hrZTFXaVlS?=
 =?utf-8?B?SHQvUnNVNWVvdFRleVlzRm9QU3NnODFNb3dxa1NOQnM5Q0VxM1dZTGNaeUp5?=
 =?utf-8?B?QnVCclNIMm9OVTZLZW9Kb1lqTStqVGU5N2Z0bGVNVmhFZlFnWG1nbHplQ3lZ?=
 =?utf-8?B?K2MwSmlCelNuWlNiM1U3cGZSTWs4Q0JENmlCbmNwaVVabVpFcjZidEpsZnpT?=
 =?utf-8?B?d09HUHRlUytFdmhWNG1LYjZKY0haNUw1TmdwZWJPUnZQOW5qc2dkWUIrUVgr?=
 =?utf-8?B?NzFIdy8yM01PTmRPY3IrS2xiUnV2WWFOYklXN0hkcGIvemFZdTNiZHRzWE9t?=
 =?utf-8?B?UTZlZnlhVHNFc1N3ZkVTUHVRV3JXWXZ4QWdPWWhGaEtZNUh4UXN2L01WeS9p?=
 =?utf-8?B?WndTWGVNYTlkTGJXWmdDS1BEbFRWTWIwZUMyaGtZNk5yMWQxVEZtS1o2WEYx?=
 =?utf-8?B?OE9wL013aEIrTVptVmhmUTVNWEhQWXVRam5zOTZIZEFScFdYL1VEdDlhWUdx?=
 =?utf-8?B?dVYyUk1EdUd2TjYrQlNybVpkeDFjTTNLQ2RQZmY2UmtpbkdBMkdKOWNJaDRF?=
 =?utf-8?B?N3hLQVVkdFdIKzRtY3ZMTnl0T1JabzZQa0dIeUdUVk83cy9jZlFyQlY2MU1L?=
 =?utf-8?B?NlpVK1hLVGhTK21CQVBveWNWZHg0eUZpR1hXYkpDaURpSlJNdTJsYStLdnVl?=
 =?utf-8?B?NGZqYkJkL0MwZmFWU3hpTkQvdkVZZ3RUbnlINFFsVkpselF6dUJjbFRiVU12?=
 =?utf-8?B?eHRlT3pqUmpZZW1JajBoaStiM0VaNkFON1B3RythQkFqK0RyY1ZKRWxKWE11?=
 =?utf-8?B?Wjl5QmNXZVVXMEdhOVhHVTlHSmhEL1ZoazBPVjluREdydFZnWXlhZjBZNlpo?=
 =?utf-8?B?V292TzFuWlRSQUVDWXFUYVdxZEE2dXN6ckFsSlU0cFBpMDdkekF2bWJOMEZI?=
 =?utf-8?B?Q2ovenQ5aFVPVEtYUjNaK0ZvYWhYV0NkME80WmlhdThFYWxBcEQzUUsxUHdJ?=
 =?utf-8?B?YVEzYVJHV1RlV0VLR2NQVWlFRVBVaWVXSUh2VzJIVWtOUjdtU0FGUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859bdf41-6d7a-4a22-7bd2-08de680c8287
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:53:28.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnhw7ajlFGJ/Br5qsJgoBl5Uzu2HiFWXTtRTW1BogKbbFGtidFaOk9R1i//cjN/cobagO4TvcfaI/rCGizK5fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9150
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,x.org:url,x.org:email];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 0E8FE113DE1
X-Rspamd-Action: no action

Hi all,

Nominations are now open for the 2026 X.Org Board elections. Four
positions are open. If you're active in the community please consider
running and supporting your community in this way.

These board members' periods will end this year:
- Mark Filion
- Erik Faye-Lund
- Simon Ser
- Neal Gompa

These board members remain on the board until next year and therefore
comprise your elections committee:
- Arkadiusz Hiler
- Lyude Paul
- Andres Gomez
- Harry Wentland

Self-nominations are encouraged. If so, a simple message to
elections@x.org is sufficient. Please include your affiliation, if any,
and a personal statement. Examples from last year can be found at [1].
You will receive an email confirmation within a few days.

A renewed membership period is required in order to run and vote in the
elections. 32 people have renewed their membership so far. If you
haven't done so yet please log in to members.x.org [2] and renew yours
or apply for one if you weren't a member in the past.

The key election dates are:
    Nomination period Start: Mon February 9th
    Nomination period End: Mon March 9th
    Publication of Candidates & start of Candidate QA: Mon March 16th
    Deadline of X.Org membership application or renewal: Mon March 16th
    Election Planned Start: Mon March 23rd
    Election Planned End: Mon April 13th

[1] https://www.x.org/wiki/BoardOfDirectors/Elections/2025/
[2] https://members.x.org

Cheers,
Harry
