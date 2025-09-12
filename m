Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB346B55690
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FAD10ECD3;
	Fri, 12 Sep 2025 18:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WmneMf6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494FA10ECD1;
 Fri, 12 Sep 2025 18:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS2RwR18zYj74qHm5gEeM0g70aAIgFC0AVP/4ADKWF1Ua+7NZLewqFUHKnjrqbxoRZZVpA1WKuQ6gCsohQEFkM92MakpH2wv4zpDC5Uc/ElyUKBh9IMEclHKQvmcZuE01nxazNNUDwt64loVOtO4FkZ0od17aXqbdlFhUyeDSJESqZTGOmdWsa2xOEeBh19reKEg0ijbRTYBSXfhb7tGTyUD8cOS6ik8GAkXwrQcdPxKJt32vrAYb10n4SeRCGBW74R6qO3qz8Az0Kwgd23b/d1bw7LT9jFmDDU5tg6XEpFPLbX/6ngO9BaOR3rU/ChuuNOuiELE0sJVOc3mLP23tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nlQtee+9xc9yQKdBQSDGfSOWpOtrERlJ9blqDiFCc8=;
 b=yewE+00UICh89HnN3bXnyPsH571syNL1MFnakQvG9lSUVvu5WD+tCNIwXEIrsEtC5lunSGjObvc5tF4wrAQl5YsmtHh5TCzPFIZdmnHHtEPNoMnir+9V3PrtJLTfP+UwgMkMRO6sJJw9GrS8B+V/94rBxddSZwk3skg42lNeePVVjlTkcqjdCO37IPmDJjWDRqxJfAQj0d5NysCtZfdeCfsIONMzTmS3k/nCOJwMqxCSUKZeZGuKN8LcFhJxdpYHl/4MvvCRYtCdnNPRs2ub0gTsM0B27uxOOpUJjdVpkwWnCV1a/W6Q5O62BAN9VwVWpwjPq18tnpQq4QuElU0mDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nlQtee+9xc9yQKdBQSDGfSOWpOtrERlJ9blqDiFCc8=;
 b=WmneMf6aBnupuLXK4DTGbfQT+GyFB3R3JbcDxwKv4WIMUcQpAG9IJqtHAl1lKf/6DqMheO/cAfK5t/eGtL2V1UQ5e7JkPKZ+YitQ4tIfqSUNcUEO2/Unt9EpDRQp7Emk2iJyAQbMFW8QrciGb0Pllsib0VgxPGAgPlw3VoytApw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 18:50:48 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.9073.026; Fri, 12 Sep 2025
 18:50:48 +0000
Message-ID: <3532996f-757a-4a75-b33d-e1d9aebe879d@amd.com>
Date: Fri, 12 Sep 2025 14:50:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/amd/display: change dc stream color settings
 only in atomic commit
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com
Cc: Xaver Hugl <xaver.hugl@gmail.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Christopher Snowhill <kode54@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250911173101.1960156-1-mwen@igalia.com>
 <20250911173101.1960156-3-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250911173101.1960156-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: 9280a3c3-8e7b-49a1-d296-08ddf22d4972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0M0bkpTOXFJQ0ZXZHpxbjVkTzlRdlE5Yk04Z2cwa1dNOGdyZ2VBZzVQV2o0?=
 =?utf-8?B?RWdLcEVaVkkxTzVsajErMmIzdEcrbWp1bkZ5OGJ1WFNYM1RORktFSm5lbXpL?=
 =?utf-8?B?WVYrODRydkdDSndiZm1ZblY5cGlocWN4ejV2LzF4V1doYnZuQUN4ZE02L1Q5?=
 =?utf-8?B?dXdyaEI2OFpwcFNmTmJOcjc4bXJGOFFjN1VQLy9jVXhEdUs5Q0dYWEpKS2U2?=
 =?utf-8?B?aTYyUVVidEZwaVpia2wzbmdlZHl2UlVUdVlOcFNtaGMvSUxSY1dXTFBGS1J1?=
 =?utf-8?B?UU8razZpck5oaUloMlFHL0luY0RBL0RIeHJCRWJJUE1XUlJTQzltNG5yUi83?=
 =?utf-8?B?a0d0RWhjODNPS09PcWlncHBmWGpDRy8xQkpGS0xQZEs1UThRcTJFOHcwb2lr?=
 =?utf-8?B?N3dGZWNvbzFGR1JTZm9OQkJoRXMwVnhEYzNQcEw5WGRTNStXaTZNWWdCRHJL?=
 =?utf-8?B?VVZMemJaUEZVaU5BbHY3dTBwYjNsTVVRdCt6bGl4K2hWUnNYTkU4bjEzZEpU?=
 =?utf-8?B?VndLc2YySWhCblZKRUtHcTdUb2gxTWJ4TjF2S3BLcDA0MVFEYVl4MXR1bmZZ?=
 =?utf-8?B?VFVPc1VsUTZjbnU3WThTK2tvYXhWN2lpWE5nTk14eWxHaW80VGZZVyt1VG1Q?=
 =?utf-8?B?N0pQcGdxcnJhZEVpd2dTOVZiVklaVGVEaU5hK1JEOW9pczkzbzNaeTdtZkJG?=
 =?utf-8?B?aURGTGt6K3hUWXJTNmNaSkdzRDBRelRpRmtrcDYxaHl6U0dyNkc1YkJMdkox?=
 =?utf-8?B?dzhOcDFtdkFaWWlpa0dkdUcrQ0hQcVd2VURYRXU3eFpqRzR1Mi93QUc4ZzN0?=
 =?utf-8?B?WHpkMXBycjhrU1dPYjhaTWRiRS8yd2lBNmRmajdQeks5SlJ1TzVJaUxzOTlw?=
 =?utf-8?B?b3N4OTFDZ0QvN1Y2cnk2WmlUTXZWUHpUSkN1ci9kV2NQU1pVcnhHMGRQVlZD?=
 =?utf-8?B?aUhMOVRtTEtnSFlJRGdoK2NOWFNONHBJd0RFSmtOUWhyZFYvMUxpVVVDQ2xK?=
 =?utf-8?B?eHc0WXdMQ2d0T2hQZ3hjNGgvN0JPZXd5cFFxUXdvNDNWdDJGSDBPdG9NSkNz?=
 =?utf-8?B?aGpFcjcrc3Q5bzAyb0w3UHR2WE96ZVFtOFE1VGlzTmVNNitGOTRZU050TXZV?=
 =?utf-8?B?a2RTUWg1czVHckVna2VvbVF2bFdHYjVJWExMd1RFV1h6MW5vWjkzRStkZ05S?=
 =?utf-8?B?R3FrNERnV0k3aUMraDNzZ2pqY0ovcUZjanVLVXdVdEhiK1dQN0hyOGN5RGFl?=
 =?utf-8?B?SWI4SDBYKytXOHVNVWVna3U2ZmNmWERuWHI2L0QzQlJjamhQalBYNHozUDFJ?=
 =?utf-8?B?MEFFQXBlR3o3Ry9xcmtyYm9NQzZiL01tWmNsWWlEYlQ0UllGQ1pCNGM4QUhI?=
 =?utf-8?B?SUlqT0l3ejZDaEdscW9mZjFEOCtuSElkMENya0xLOWhFV0U2ZTQrVGlvdzFt?=
 =?utf-8?B?S05JZXgyQ1Nka1BoNmx1Qmt3S2lwNjl2SXQyWjY0MVVqSFVnZ3FGdHpWSlNi?=
 =?utf-8?B?ZHc1d25FWVRyRU1JQ2U4VFZFcXB0OVY5Q2xRNDlmMk1PandVVTVVdXE3Mm1y?=
 =?utf-8?B?MXEzSUkzUGxLMXpFQmpBYXBmTG9wbldRQlBtanliZGJGS3BWWm13LzZ6R0x6?=
 =?utf-8?B?YnNNejNJcHVKZ09UeVB6N2Z5N1lLem1hb3VkSUNZaytRTzg2M2hTV2pyTXg5?=
 =?utf-8?B?eTR0RmFIR1c3aDFlaVhaUyt4NHBBVGZQOHQ2S05CMHFhUnFnaFpZOG1uWFVN?=
 =?utf-8?B?SVdVdExRVWV2enNRaWVyc2xOM25DTjQzZFVFZ2RET1gzU2JGcytHSXZ5WjNy?=
 =?utf-8?Q?Hm++Kzb12ljU9McSWjNBmnhDB6T5gB2vEjCZU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHA3QXczQURiZ3VyL1pMSFdYZkUwMlViZTlHSmtTYlpLOGZVdjRDajFqb0tV?=
 =?utf-8?B?aFo3STlLTEozb0MvbkRVTnZUY1JFSDE5bFNTbXBHVWo4M256ZnhVV1d4TThD?=
 =?utf-8?B?QXFWblVTMWdadmpWa3A5SXgvR3Axb3FvaUVlcUdsT3FQQTBpTWU5STY2RHg1?=
 =?utf-8?B?OExtS2V3ckRsM1BNdG1qcjZmVm1sdmZzYUUyQlhvMjBKOXR2cDBaNjd0aUh3?=
 =?utf-8?B?akNaMVdrU3dHTTlaS0U0dm5uczFYREdGY0FoTkV4MUp4V1NrWnRJc3h6S0tS?=
 =?utf-8?B?cmNHdDZlWWJyb2tPRFNCRDErYjJzSWVXS21NWFUrZjBOT011VWVBMmV3VVhN?=
 =?utf-8?B?K1ptUWhBM0hCK2o0MFd4MGZWR0RnRjFlcnByU2VXellpZWs3eWpxcjNLMkd5?=
 =?utf-8?B?NTQydU53OExhNld1SmRzYTRwSnB2OW5zc1BqVGhLeTlVeGxSZHB2anBFdnpm?=
 =?utf-8?B?WEFRaFNmQ1pFbXM4TFdoMno0b3ViSEoyeU9BZWQwTkJ3WDJMYW1hczFEek1R?=
 =?utf-8?B?UWJGdDZnN2tzNmVURjdvOVNZR1JRMU9BdURjVTJsampIeTFtSVpONWhhTUZ4?=
 =?utf-8?B?dXdRUUh6bkhCTkV4cVkwYjNIOFJTdlNNcnd5TXg1blFrcTFROVNabXVxQkhJ?=
 =?utf-8?B?OWxzSStJbDR2SWJhdDM4VGFnWkpUZHJlT2RNZ0ZUUGF5cVdyZXZ4R0xmZ3hW?=
 =?utf-8?B?b2ZuVCtUaHdCb3dMMWpISXg0UmlQaUM0VTNiRVdJSlY4a1FQdnI3T0tPT3Nt?=
 =?utf-8?B?WUdMQTcyK1JhQkZ1RG9KZjNDMVh2NTY2TS9UeUhvaTl1cG5DSlBrZjVONDhr?=
 =?utf-8?B?dkMvR0ZPcFRENTd4djBVc3lNWWd5OFZLSkw0Tk1wUlNDR0tHWUg2N2t5Q3M5?=
 =?utf-8?B?bCtKTTZNaVNhNWJsbEpKUndRd3BFbDBkL1BvWVZkVm1kdHp0VXNMbHI4UVNs?=
 =?utf-8?B?eUIzaU1wTnZCMkZYVU0zUzZaQ3lVUktUQnRNUkNvUXllYy9DeVREaTQ4T2tu?=
 =?utf-8?B?VmNjNnBrZCtneUJ4eit5ZHRreUF1enhUc2hxbDZUbWMvWklMQkpTZ1lVZ2pQ?=
 =?utf-8?B?OUx0aEVDQmRyRDdMelFjN1gxcUtSWEZlMXh0eGlaa1Z4ZC92cm5LdkkzRnVp?=
 =?utf-8?B?S3l4V0UyeTZDYzlxd1EzVFUxMG1CNkMyZk1kbDZEQ0FXZW11RTdITmdGakQz?=
 =?utf-8?B?aDBLSEVsbkJJbnVzcjQrSkExS0RxVUxUZFY5VGpIa3VXWFpST2QwYTUweHE5?=
 =?utf-8?B?ZnVZRXNXL3BiaFk5MFhRNEU4WGhyT1FtL204S0lleldQNkpvQXNuaE1xYmhk?=
 =?utf-8?B?Ym1iMWxMYlZ3TEhaMXBibkhvUEI1T1FiVzhDRUlzYllpZTJFMUUrdTRIV3pj?=
 =?utf-8?B?NGt0N2JWK1REd3U5ay9pMGM1M09VeDZKNkprYzAzTW04d1drTUVqQ3FjU1ZK?=
 =?utf-8?B?Ky94UkxDTlphWHc5M1VnWCt3RHpOa0tQendYYVcxU29hcEJKRmtwU1BWZjJl?=
 =?utf-8?B?dnoyNGZtbUJtZmRXWFp5L3RUdDA2Z1crSFRLckJ1WFlhL09tbUtGck1scEZ0?=
 =?utf-8?B?cjZueGpscDdoeWhVSzQ5TVVHQ01Ma01naTNOZE1MM21JbjR4RXYvbDMra2RP?=
 =?utf-8?B?emxCVHl0TmdtTTlyZFMxSnNHdXFJUzVnQ3hjQjQ5djNGbnY5bnZoWVNrTFZI?=
 =?utf-8?B?bnhXbEtEa3dYbWdTbkFPdGdVd2xCNnVrN2xNeC9MTEVZdVRHVG8vK1U3MGFC?=
 =?utf-8?B?N3JzWldVOEhOOE94SHlvRDVpVGkxOGFiN2pOQ3YrWi8ySWxqSjFKOWExVG53?=
 =?utf-8?B?M3Y0TVZOYk9FNkN5djBLS2FNVXZ1a2Vqd2NuVC92UXBUdmhqMFl1UGpHK1Nj?=
 =?utf-8?B?aHNWcnB6c0hGanB5Nnh6VmdNaWlZdDlnQ3NXUkMySmhGaWZMM1VDbUt1c2Ju?=
 =?utf-8?B?NytIZUdWWks4R1NNa3F6c29Zd2o4RE8wb2h2d0g1bGlYQllNZWVzRFVmMFFv?=
 =?utf-8?B?SW5sMzhGQy9Nek9VS1JHak9sS2R2dkNoQkhmSGRXOEQvRWhxbk5iamR4MXhs?=
 =?utf-8?B?NVhSMjc4SW5yYjQwMFV6WVJFVnBiQXIzcWxmYkMvTlhqUU9oSHBOa1lrYnpq?=
 =?utf-8?Q?doRiY92DETUgcI/7gMESXjtXC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9280a3c3-8e7b-49a1-d296-08ddf22d4972
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 18:50:47.8981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpzSeLo7aL5Ci8VCvMf0Kdq9rvSbvRRRTu77TbwGb6xZ1BEHqvp9gdFWo+qWE2ezmtGf8EuTVY//juqMfA693g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654
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



On 2025-09-11 13:21, Melissa Wen wrote:
> Don't update DC stream color components during atomic check. The driver
> will continue validating the new CRTC color state but will not change DC
> stream color components. The DC stream color state will only be
> programmed at commit time in the `atomic_setup_commit` stage.
> 
> It fixes gamma LUT loss reported by KDE users when changing brightness
> quickly or changing Display settings (such as overscan) with nightlight
> on and HDR. As KWin can do a test commit with color settings different
> from those that should be applied in a non-test-only commit, if the
> driver changes DC stream color state in atomic check, this state can be
> eventually HW programmed in commit tail, instead of the respective state
> set by the non-blocking commit.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4444
> Reported-by: Xaver Hugl <xaver.hugl@gmail.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com> #v2
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 ++++++++++++++-----
>  3 files changed, 66 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f6462ff7251f..50b3bd0e32dd 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -11118,7 +11118,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
>  	if (dm_new_crtc_state->base.color_mgmt_changed ||
>  	    dm_old_crtc_state->regamma_tf != dm_new_crtc_state->regamma_tf ||
>  	    drm_atomic_crtc_needs_modeset(new_crtc_state)) {
> -		ret = amdgpu_dm_update_crtc_color_mgmt(dm_new_crtc_state);
> +		ret = amdgpu_dm_check_crtc_color_mgmt(dm_new_crtc_state, true);
>  		if (ret)
>  			goto fail;
>  	}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index ce74125c713e..69125c3f08d5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -1041,6 +1041,8 @@ void amdgpu_dm_init_color_mod(void);
>  int amdgpu_dm_create_color_properties(struct amdgpu_device *adev);
>  int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
>  int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
> +int amdgpu_dm_check_crtc_color_mgmt(struct dm_crtc_state *crtc,
> +				    bool check_only);
>  int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  				      struct drm_plane_state *plane_state,
>  				      struct dc_plane_state *dc_plane_state);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index c7387af725d6..427bf8877df7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -566,12 +566,11 @@ static int __set_output_tf(struct dc_transfer_func *func,
>  	return res ? 0 : -ENOMEM;
>  }
>  
> -static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
> +static int amdgpu_dm_set_atomic_regamma(struct dc_transfer_func *out_tf,
>  					const struct drm_color_lut *regamma_lut,
>  					uint32_t regamma_size, bool has_rom,
>  					enum dc_transfer_func_predefined tf)
>  {
> -	struct dc_transfer_func *out_tf = &stream->out_transfer_func;
>  	int ret = 0;
>  
>  	if (regamma_size || tf != TRANSFER_FUNCTION_LINEAR) {
> @@ -885,33 +884,33 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>  }
>  
>  /**
> - * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
> + * amdgpu_dm_check_crtc_color_mgmt: Check if DRM color props are programmable by DC.
>   * @crtc: amdgpu_dm crtc state
> + * @check_only: only check color state without update dc stream
>   *
> - * With no plane level color management properties we're free to use any
> - * of the HW blocks as long as the CRTC CTM always comes before the
> - * CRTC RGM and after the CRTC DGM.
> - *
> - * - The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
> - * - The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
> - * - The CRTC CTM will be placed in the gamut remap block if it is non-linear.
> + * This function just verifies CRTC LUT sizes, if there is enough space for
> + * output transfer function and if its parameters can be calculated by AMD
> + * color module. It also adjusts some settings for programming CRTC degamma at
> + * plane stage, using plane DGM block.
>   *
>   * The RGM block is typically more fully featured and accurate across
>   * all ASICs - DCE can't support a custom non-linear CRTC DGM.
>   *
>   * For supporting both plane level color management and CRTC level color
> - * management at once we have to either restrict the usage of CRTC properties
> - * or blend adjustments together.
> + * management at once we have to either restrict the usage of some CRTC
> + * properties or blend adjustments together.
>   *
>   * Returns:
> - * 0 on success. Error code if setup fails.
> + * 0 on success. Error code if validation fails.
>   */
> -int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
> +
> +int amdgpu_dm_check_crtc_color_mgmt(struct dm_crtc_state *crtc,
> +				    bool check_only)
>  {
>  	struct dc_stream_state *stream = crtc->stream;
>  	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
>  	bool has_rom = adev->asic_type <= CHIP_RAVEN;
> -	struct drm_color_ctm *ctm = NULL;
> +	struct dc_transfer_func *out_tf;
>  	const struct drm_color_lut *degamma_lut, *regamma_lut;
>  	uint32_t degamma_size, regamma_size;
>  	bool has_regamma, has_degamma;
> @@ -940,6 +939,14 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  	crtc->cm_has_degamma = false;
>  	crtc->cm_is_degamma_srgb = false;
>  
> +	if (check_only) {
> +		out_tf = kvzalloc(sizeof(*out_tf), GFP_KERNEL);
> +		if (!out_tf)
> +			return -ENOMEM;
> +	} else {
> +		out_tf = &stream->out_transfer_func;
> +	}
> +
>  	/* Setup regamma and degamma. */
>  	if (is_legacy) {
>  		/*
> @@ -954,8 +961,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  		 * inverse color ramp in legacy userspace.
>  		 */
>  		crtc->cm_is_degamma_srgb = true;
> -		stream->out_transfer_func.type = TF_TYPE_DISTRIBUTED_POINTS;
> -		stream->out_transfer_func.tf = TRANSFER_FUNCTION_SRGB;
> +		out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
> +		out_tf->tf = TRANSFER_FUNCTION_SRGB;
>  		/*
>  		 * Note: although we pass has_rom as parameter here, we never
>  		 * actually use ROM because the color module only takes the ROM
> @@ -963,16 +970,12 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  		 *
>  		 * See more in mod_color_calculate_regamma_params()
>  		 */
> -		r = __set_legacy_tf(&stream->out_transfer_func, regamma_lut,
> +		r = __set_legacy_tf(out_tf, regamma_lut,
>  				    regamma_size, has_rom);
> -		if (r)
> -			return r;
>  	} else {
>  		regamma_size = has_regamma ? regamma_size : 0;
> -		r = amdgpu_dm_set_atomic_regamma(stream, regamma_lut,
> +		r = amdgpu_dm_set_atomic_regamma(out_tf, regamma_lut,
>  						 regamma_size, has_rom, tf);
> -		if (r)
> -			return r;
>  	}
>  
>  	/*
> @@ -981,6 +984,43 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  	 * have to place the CTM in the OCSC in that case.
>  	 */
>  	crtc->cm_has_degamma = has_degamma;
> +	if (check_only)
> +		kvfree(out_tf);
> +
> +	return r;
> +}
> +
> +/**
> + * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
> + * @crtc: amdgpu_dm crtc state
> + *
> + * With no plane level color management properties we're free to use any
> + * of the HW blocks as long as the CRTC CTM always comes before the
> + * CRTC RGM and after the CRTC DGM.
> + *
> + * - The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
> + * - The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
> + * - The CRTC CTM will be placed in the gamut remap block if it is non-linear.
> + *
> + * The RGM block is typically more fully featured and accurate across
> + * all ASICs - DCE can't support a custom non-linear CRTC DGM.
> + *
> + * For supporting both plane level color management and CRTC level color
> + * management at once we have to either restrict the usage of CRTC properties
> + * or blend adjustments together.
> + *
> + * Returns:
> + * 0 on success. Error code if setup fails.
> + */
> +int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
> +{
> +	struct dc_stream_state *stream = crtc->stream;
> +	struct drm_color_ctm *ctm = NULL;
> +	int ret;
> +
> +	ret = amdgpu_dm_check_crtc_color_mgmt(crtc, false);
> +	if (ret)
> +		return ret;

Thanks. I like it.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

>  
>  	/* Setup CRTC CTM. */
>  	if (crtc->base.ctm) {

