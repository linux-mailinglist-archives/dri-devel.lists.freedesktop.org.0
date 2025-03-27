Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D21CA727AF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 01:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0688D10E833;
	Thu, 27 Mar 2025 00:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3OuR/e87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B16210E831;
 Thu, 27 Mar 2025 00:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4CfeKfiFXN1l5SunlV5Gmyg3NgyodrpzrlUgu38a6qgQy4+hAgtuv+h66epS+4LuIeH4Uj2iFDm/99aNOcQwcaV3uq152VTDVQjwUeDTOYYKyOmdzOXwzjHFqeXM+d76xZqh6ud5iky7npdDKxt/PpaksvSjMbwRy1UWiYdqGBuzxMBqMxcd0/nuM2QYBAcvFJcUHFN0ZT4DpzhfRuEbDJlyZuN7jwcpRPTv/0JENjuVGgwZ1JvBFP3rkM0APkX+sl8/5CC2MJeLHjgNvOgsZIGSCY9omsTylcUdrKr8nmgQkcvZtH/MvQiw/4cJCwchrhgTlzAci5vq9MnHHXQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewynmMOGrUfZoj91N1dbsrmQilsxdiHMwgHk/Mwh7yg=;
 b=LuTE4lWUa/fGbKYbOqBJZwhISbTszfh7Hw+hvuELnobRcdg/PY/nfkjcXpeYqa8hoHZBd8jjMcDspYybEoRTfxGo/+OzqwoW+Ekyy1RZzJULKd1jKnY9us3Hpt5iXPFVZ9xfc8PbikawITjSrs1O9KP/s/ZzV5yxJ+wLr4tvf7kK32LS09MFbtl3NCTkTKAkUG13UPLimzHbkYok79Hdiz7W58H1UdE0sUyhgF9elmkGV075EVh+hVHEA/4efMwpxy4nxf+zUkGg1B8igiSv7Z0w/LkPr2KFr7rSNje8magpCcjMKC4/q0ets9eJFAo3RRr/5z/QsVuXkxYvFvz4Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewynmMOGrUfZoj91N1dbsrmQilsxdiHMwgHk/Mwh7yg=;
 b=3OuR/e87X6wM2E3PgXowA4679g+WL5Unenp5GCEL/nlzhxH4KVDzcE64c+NLLDMncqOyH2q2Kg6YHFfYTtCB8A9K+oPUXdblVm45XBFu9l6QpcOS+54s1EdCD4ZeBrO9q+k1utPE4VQ9o9ZoV37n4TgaGnRkcO9APUUdHLv5bgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB6539.namprd12.prod.outlook.com (2603:10b6:510:1f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 00:10:15 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 00:10:14 +0000
Message-ID: <712b77ef-c7f7-47a4-9609-47b179f15662@amd.com>
Date: Wed, 26 Mar 2025 18:10:11 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Protect
 dml2_create()/dml2_copy()/dml2_create_copy()
From: Alex Hung <alex.hung@amd.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Austin.Zheng@amd.com
References: <20250318111717.2161235-1-chenhuacai@loongson.cn>
 <b8c481f2-a280-4f86-8080-2c6dcffc4629@amd.com>
 <CAAhV-H7cch+koOSJAFe70c8Pk02snK7M=andyfwbCgiNdg4aVg@mail.gmail.com>
 <87d0601b-c1cb-402b-aecd-23a5d371da66@amd.com>
Content-Language: en-US
In-Reply-To: <87d0601b-c1cb-402b-aecd-23a5d371da66@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::28) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: e8729faf-30d3-47bf-c70e-08dd6cc3bf97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDJHMlRZZ2VidDFOVWpiSTV2dDAzNUJCYXc0ZUZVTzVVYXRodFZrNXVsaVMr?=
 =?utf-8?B?N0FRazNCK2RaQ3dtVlVncmNoTlhZMXFLeXdGUHBzNjZBRlJTWURFdkNKdDYx?=
 =?utf-8?B?UXNZL0RCYjgwWmxtZ2Rhb3ZwRkZIZVZZOXdJYndDMDN1WHBWaSs5RFpENmo0?=
 =?utf-8?B?QzlONnFTL1ZvRE1GWFc2UFA3ODd3bEtoamhWVi8zTEtRa0lnS3lRRmVaWWtr?=
 =?utf-8?B?OFpVNmFyK2E1Tktadjc5aVFnN05CbDM4dDF2T3NGYnNyT05od2VDK01qb3cx?=
 =?utf-8?B?ek92ZEMxTVhmY1Y5Ui9leXhKNjNiNmUvelpudjB0L1FGbWQxWlRKM21vV3Zt?=
 =?utf-8?B?STN2dnFLS1ZlRHlISXZqOGlEWDlaS2tvOWg4U3hhd1llV0loUVVwVHlTWHcv?=
 =?utf-8?B?TEhOQUlVTlltU3pBU2hUSzl1V1FtNlNoVEN0d204NVBFekRWbE5ZQnVZTU5p?=
 =?utf-8?B?TE9paE14NWVXRjc2ME1FRUJ6eVF6Vk1ZeUVlMW9jYlR5NjFZeDhHeUQ1M1Mx?=
 =?utf-8?B?Tm1majRyMWZVVWxWQ1pqNlNzaWFUZmdWU1lSMTh1UUhGZE9sNTNDd0gveUpt?=
 =?utf-8?B?RjY2bkVWbzQxdWFQNWVqdDFNUmVGOWFvZEVjQzBiWW5yU1BuY21GdEkrak1C?=
 =?utf-8?B?R3Nxc2dTeWk2M0VVY25vblp2Ykk5dnFNTWtFVkVPMi9XbWRIcUlxN01Dd3pl?=
 =?utf-8?B?VkZpY2JJU2diaVY2WVpwSUdNa3p4TlkvMnNRUVM0YjZobkNjTjgwbDBaZUJH?=
 =?utf-8?B?UFJuYVJiRjYxQWxSaTZTdHlJS0VyNTBOYzBteHJHRFZrYy9haGNOeUMxSDNJ?=
 =?utf-8?B?cGlzRFlheFZHWlhaRzBxMzUvM0NkblFqc0VvTzdKamJEK3JIM1Z6a0NsMk54?=
 =?utf-8?B?VjJPd2h6L1NsMUMxZkJZc1oyWTBlNGc3YnMvSnR4bERPV2pYY2o5V0p3aTBB?=
 =?utf-8?B?WWl3Znh3S2FiVFFaOGFHTmQ5aCtuQWVrTnZ0eHBqQnFLMjcvRE01WU9WblNG?=
 =?utf-8?B?RUo0KzJEWkp6N0RtZElYSklDOUZ5V1N5Z1ZkUnk5amZmeEJXeFJzcFAyVHBR?=
 =?utf-8?B?QytybnljNVdyMjRFRzlUazdhcmxOVndwTWU3bXdCQW1raVdhTDJQWUFFZzJy?=
 =?utf-8?B?enQ0eGpGQTg4NjNDMExpQVIvZU0wdnpSaUxqQSttam9sYm1GbDQ0R2IxYWND?=
 =?utf-8?B?WFZDN2x1NmIzc1ovNzJYVEt4emh1R1hlUE5LWlBmdDdtb3BwRTNCNEhuRUVx?=
 =?utf-8?B?T2ZaVnY5a1VuQ3lEdTBMeDZjaEZwM0pyZ0pZL3FvYmd1ZWNlcENCaWgzV2lZ?=
 =?utf-8?B?RTdjMnRpekU5R3hZM09wUGdhR2hCUjFSTEdHZzJuN0dsV1htZGxLd1JOeE12?=
 =?utf-8?B?ZjRnN0RVYVdYNFMwTzBqZXVQbnRGMFEzQnFEZkVKemVUSndwQ0VaSzdSVFRJ?=
 =?utf-8?B?MGNzS1BGRFFNRkFNMm90ZWF0OW1SUlg1bHFIU0JRbmhNK1pEaUFQQXV6L3BX?=
 =?utf-8?B?MmxnQXlHNnJhbWY1MFpWUFVwZ3c4TW9hUnB5ZmYrcGUvSjlNdXBqM2t1R1NP?=
 =?utf-8?B?d0xXTUNWVDhROGVDQUdBT2dwc1NFd09ncHJDVFVZdjFYdXRhYUoyYmJFTkNp?=
 =?utf-8?B?OHZ2OXIzN1hFcWFITHNQaHRINkNmSlI4TlljLzZuejlqK3BiTmNEbzhnOE42?=
 =?utf-8?B?eGh6RWRjcDhDTGsvWDFXb1FnaThWK3dvcm1sa05tcVdZUHR4SitSY0d5UktG?=
 =?utf-8?B?Q3pVM1crWXRaMXd2UXM0UTd3c2lzMkIyNFBYa0ZXcUtUWXM3MitKU0QrTGNz?=
 =?utf-8?B?bU11QkZRTUxXYjZ4SUpzR1I0K001KzZkQ3J0U0dzZFRLeXkwT1RHY1pJYmd6?=
 =?utf-8?Q?WvhQQklDnRya0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZC90WW45dFlaRkNuMEZoNElvSWRQb3BLd21xaDdjRHptSnNnbTBkMmtTS1ln?=
 =?utf-8?B?c2RUbzNsbHNsZElYa0J6alc3SVNFV1h6TlpuMmVuRUhBS1RCM0JVQVZ3cW1H?=
 =?utf-8?B?enVPdmdNMVM3OU0zeU1SWjBNRkxsVVNmSmhUOXo2eG5DR3BYU3pwUVRWUFJV?=
 =?utf-8?B?ajFrNk1XUkl2bWExajRNZ1Zkb09xdU5iMUFVSXM4cUYva2NOdnUwZDFUU282?=
 =?utf-8?B?NDZnRUJ5S3dZeFptay8ySTB3WUFsdEhMdEREWmZZdlpKd0dZWFE1a2Q0aS9Z?=
 =?utf-8?B?cEREbXRaZjJMTi90cmIvclg5MFhjaTc5SkxsNUVLMC9VSzVVTWFPWFZva1RW?=
 =?utf-8?B?M3RTNERzVVMyZUh3TzZlampoVVdKQmNYYk5sTXIxWWoyZFdtZzVWZW1US0Ez?=
 =?utf-8?B?TU53djA2bXBFSlUrZkhEaTJtd2VnYk5jRWhMSkNIWmhQRkVOajBzUDk5RS8r?=
 =?utf-8?B?dFpXYm5qUHpCUUJ5dER4dVUzZ2ZxZzkvTllUZXVOZEVEWjBVOUtTNnErclBF?=
 =?utf-8?B?d2duNDcraENxNGZsYWx0Rjlvekc1bC84N3VZaE45eE9KTFR5cGR6c3R4aEh5?=
 =?utf-8?B?MzErNnFyMGJKM1ZsVGprL2o1WnVMMFFlaU9rM203S0FObjJxSFJtWjA3eE5G?=
 =?utf-8?B?SDRTdG1adGI2dFBWREFNN0xtRGZ6TkV1ekNuUFNPc2V3MXZTR2w2Lzd0R09a?=
 =?utf-8?B?V1k4aXhHOVNwZzBZRmI4QU1DTGRJQzBCUlpWQmFRMFBPUjUrL2xQbGhYdnBI?=
 =?utf-8?B?bCtkT2JXdnNPbUdRSkxMVDBGL2ZCemVtTHphMmdneWtQZkVRencyZ1V5cFEw?=
 =?utf-8?B?OU95VG5BNFdkdVF1azZBdDRSb0w0Zy9pZjJZdWMrQ2w4eHdvR3RSeEtmRFFD?=
 =?utf-8?B?TXNFcTZrcUR1SzlwamViRURZQ3g3ajBqVnhwRWg0V0RLQ2JVSHNrOGszRFBG?=
 =?utf-8?B?MktzUUFHSzZWYks0NmpqbFRoc2prWXFSYXhnaE5VcjZiY0VhY0tqZk43em5U?=
 =?utf-8?B?d2MwTyt1NjFlaldvOWZJVzUrbE9XWkV1Z2JQYkJ5K0FySWpwRDRwZnIzVU5v?=
 =?utf-8?B?N3k1cXVhbjlEREZnTHB1TEM1SnZ4emhFWmFoR3ZmQUQ0TmpiWEFORDRDMUIx?=
 =?utf-8?B?MDF3aW5kVzNnWFlpN2JPRXVCNnR2a2NraWZCVGczeGJGU1pmZ3Bjd2NObU1Z?=
 =?utf-8?B?Y1d2YnZWcm5oSXBkWnNoS3NFak5TYmFXNy9rR0s0MFR1N201aVloYzhlL21G?=
 =?utf-8?B?K3ozRGpvUWJPKzVxWDQzMGRxQ2s5MUhXOWx6Yy9ENENIYXJGMTNiR1V0aGZ4?=
 =?utf-8?B?VGZESXR1bXlZcDMwV0U1UnJIMTVpU1JjQXlRd1h0TzJqaGxVK1JGUmdmejFn?=
 =?utf-8?B?MGJPa3pMTFk0a3pCbDZ1VmdLMCt0c0JpNGRPUnVTbmlTa3NWa0pnSjRKU01t?=
 =?utf-8?B?bTJqTzZxeWtmRk5KcFZ5cmpFQ0RYckl4NnZDMCtkZWJhY2wrb09DdkVmOWVT?=
 =?utf-8?B?OURiMjFXeFVGeHNGVVBQUVo2QXFqTSsrb3hHazRvVmJ0N2pRZmtWZ3dnRHhL?=
 =?utf-8?B?a080emdUdEU2Q0M4R1U3Slc0aTc2T3loQk9EYThGS0ZtY0FVeWlJYk9oQUNy?=
 =?utf-8?B?ZkpJajlndzlsTkpTcE9xMWNGNnBCdFlFUDc4bFI5Z3cwZ0RkUHhaL0JHUHRC?=
 =?utf-8?B?OWVPSnpCUEJVdnpkS2k2ZCthYWhRQ3MzdVF4akFlQ1dTY29SZElhY3IyNUdB?=
 =?utf-8?B?STNLMG1rcjNpZGd2RU1VRXZFL2dNTEhXSkYxQmpvNWVKOE9TaUpWSktYOE56?=
 =?utf-8?B?RUc2TnZvMWxwVUx4VVZQUjA3eGN4eHFWR3JnYVZYWDhsbWRmMzBsSTlaZWFX?=
 =?utf-8?B?N0x1RFBINHlkdWI1N1ltMDF5SHV1enRuSjBxSHZSREhiTFFnZzlBclRYaVZ1?=
 =?utf-8?B?NjBJeHFxTU5yZTlsYi85Qm91L040WU5zeFRjdlpCeEcrTFJRZmNjT25uaUJC?=
 =?utf-8?B?c0IzNlVjTWRoWTRoSkZxS2pHakwvN2VOMTZpdk1Cb205d0lPNEg2VHZKNkMr?=
 =?utf-8?B?U25kRmNsMWxPL0pCM0Vwam45ZlBMUUxjdHhpdVFybWcwUVpWYUZXck9vamxh?=
 =?utf-8?Q?u9tEuSYcSmzJUxxM0jEwpfm40?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8729faf-30d3-47bf-c70e-08dd6cc3bf97
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 00:10:14.6989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+LI4BygKmDsNEnUQyYJCfITds/vC4jMJW/j5Q81iEsNcV4z0krhC295sw8d9abUUUbdjL9uaSihZUi4OQ5KXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6539
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

The following error messages showed up on an APU and a dGPU during testing.

<3> [100.231411] BUG: sleeping function called from invalid context at 
include/linux/sched/mm.h:321
<3> [100.231414] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 
1711, name: kms_color
<3> [100.231416] preempt_count: 2, expected: 0
<3> [100.231417] RCU nest depth: 0, expected: 0
<3> [100.231418] Preemption disabled at:
<3> [100.231419] [<ffffffffc0c2843b>] dc_fpu_begin+0x2b/0xc0 [amdgpu]
<4> [100.231626] CPU: 4 UID: 0 PID: 1711 Comm: kms_color Tainted: G 
   W          6.12.0+ #1
<4> [100.231629] Tainted: [W]=WARN
<4> [100.231631] Call Trace:
<4> [100.231632]  <TASK>
<4> [100.231633]  dump_stack_lvl+0x5b/0x70
<4> [100.231638]  dump_stack+0x10/0x20
<4> [100.231639]  __might_resched+0x170/0x1d0
<4> [100.231643]  __might_sleep+0x44/0x70
<4> [100.231645]  __alloc_pages_noprof+0x22f/0x370
<4> [100.231649]  ___kmalloc_large_node+0x95/0x150
<4> [100.231651]  ? preempt_count_add+0x4e/0xc0
<4> [100.231653]  __kmalloc_large_noprof+0x1d/0xb0
<4> [100.231655]  dml2_create_copy+0x27/0x60 [amdgpu]
<4> [100.231827]  dc_state_create_copy+0x7e/0x170 [amdgpu]
<4> [100.231995]  update_planes_and_stream_state+0x23c/0x600 [amdgpu]
<4> [100.232189]  update_planes_and_stream_v2+0x22b/0x530 [amdgpu]
<4> [100.232366]  ? amdgpu_dm_atomic_commit_tail+0x1310/0x4100 [amdgpu]
<4> [100.232569]  ? commit_tail+0x96/0x140 [drm_kms_helper]
<4> [100.232577]  dc_update_planes_and_stream+0x5b/0xe0 [amdgpu]
<4> [100.232730]  amdgpu_dm_atomic_commit_tail+0x1fa7/0x4100 [amdgpu]
<4> [100.232908]  ? stack_depot_save_flags+0x2c/0x730
<4> [100.232915]  ? wait_for_completion_timeout+0x1d/0x30
<4> [100.232917]  commit_tail+0x96/0x140 [drm_kms_helper]
<4> [100.232923]  drm_atomic_helper_commit+0x12b/0x150 [drm_kms_helper]
<4> [100.232927]  drm_atomic_commit+0xad/0xe0 [drm]
<4> [100.232939]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
<4> [100.232956]  drm_atomic_helper_set_config+0x80/0xc0 [drm_kms_helper]
<4> [100.232961]  drm_mode_setcrtc+0x22e/0x910 [drm]
<4> [100.232975]  ? kfree+0x18f/0x350
<4> [100.232977]  ? __pfx_drm_mode_setcrtc+0x10/0x10 [drm]
<4> [100.232987]  drm_ioctl_kernel+0xa7/0x100 [drm]
<4> [100.233004]  drm_ioctl+0x29d/0x500 [drm]
<4> [100.233015]  ? __pfx_drm_mode_setcrtc+0x10/0x10 [drm]
<4> [100.233026]  ? _raw_spin_unlock_irqrestore+0x1f/0x40
<4> [100.233029]  amdgpu_drm_ioctl+0x4b/0x80 [amdgpu]
<4> [100.233131]  __x64_sys_ioctl+0x92/0xd0
<4> [100.233133]  x64_sys_call+0x1205/0x20d0
<4> [100.233136]  do_syscall_64+0x50/0x110
<4> [100.233138]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4> [100.233142] RIP: 0033:0x7fb21e71a94f
<4> [100.233144] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 
10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 
0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
<4> [100.233145] RSP: 002b:00007ffdd9a52e50 EFLAGS: 00000246 ORIG_RAX: 
0000000000000010
<4> [100.233148] RAX: ffffffffffffffda RBX: 00007ffdd9a52ee0 RCX: 
00007fb21e71a94f
<4> [100.233149] RDX: 00007ffdd9a52ee0 RSI: 00000000c06864a2 RDI: 
0000000000000005
<4> [100.233149] RBP: 00000000c06864a2 R08: 0000000000000000 R09: 
00005609537f7b08
<4> [100.233150] R10: 0000000000000000 R11: 0000000000000246 R12: 
0000000000000000
<4> [100.233151] R13: 0000000000000005 R14: 0000000000000000 R15: 
00005609537e2848
<4> [100.233152]  </TASK>

On 3/25/25 18:02, Alex Hung wrote:
> 
> 
> On 3/19/25 22:23, Huacai Chen wrote:
>> Hi, Alex,
>>
>> On Thu, Mar 20, 2025 at 10:16 AM Alex Hung <alex.hung@amd.com> wrote:
>>>
>>>
>>>
>>> On 3/18/25 05:17, Huacai Chen wrote:
>>>> Commit 7da55c27e76749b9 ("drm/amd/display: Remove incorrect FP context
>>>> start") removes the FP context protection of dml2_create(), and it said
>>>> "All the DC_FP_START/END should be used before call anything from 
>>>> DML2".
>>>>
>>>> However, dml2_create()/dml2_copy()/dml2_create_copy() are not protected
>>>> from their callers, causing such errors:
>>>>
>>>>    do_fpu invoked from kernel context![#1]:
>>>>    CPU: 0 UID: 0 PID: 239 Comm: kworker/0:5 Not tainted 6.14.0-rc6+ #1
>>>>    Workqueue: events work_for_cpu_fn
>>>>    pc ffff80000319de80 ra ffff80000319de5c tp 900000010575c000 sp 
>>>> 900000010575f840
>>>>    a0 0000000000000000 a1 900000012f210130 a2 900000012f000000 a3 
>>>> ffff80000357e268
>>>>    a4 ffff80000357e260 a5 900000012ea52cf0 a6 0000000400000004 a7 
>>>> 0000012c00001388
>>>>    t0 00001900000015e0 t1 ffff80000379d000 t2 0000000010624dd3 t3 
>>>> 0000006400000014
>>>>    t4 00000000000003e8 t5 0000005000000018 t6 0000000000000020 t7 
>>>> 0000000f00000064
>>>>    t8 000000000000002f u0 5f5e9200f8901912 s9 900000012d380010 s0 
>>>> 900000012ea51fd8
>>>>    s1 900000012f000000 s2 9000000109296000 s3 0000000000000001 s4 
>>>> 0000000000001fd8
>>>>    s5 0000000000000001 s6 ffff800003415000 s7 900000012d390000 s8 
>>>> ffff800003211f80
>>>>       ra: ffff80000319de5c dml21_apply_soc_bb_overrides+0x3c/0x960 
>>>> [amdgpu]
>>>>      ERA: ffff80000319de80 dml21_apply_soc_bb_overrides+0x60/0x960 
>>>> [amdgpu]
>>>>     CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
>>>>     PRMD: 00000004 (PPLV0 +PIE -PWE)
>>>>     EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
>>>>     ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
>>>>    ESTAT: 000f0000 [FPD] (IS= ECode=15 EsubCode=0)
>>>>     PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
>>>>    Process kworker/0:5 (pid: 239, threadinfo=00000000927eadc6, 
>>>> task=000000008fd31682)
>>>>    Stack : 00040dc000003164 0000000000000001 900000012f210130 
>>>> 900000012eabeeb8
>>>>            900000012f000000 ffff80000319fe48 900000012f210000 
>>>> 900000012f210130
>>>>            900000012f000000 900000012eabeeb8 0000000000000001 
>>>> ffff8000031a0064
>>>>            900000010575f9f0 900000012f210130 900000012eac0000 
>>>> 900000012ea80000
>>>>            900000012f000000 ffff8000031cefc4 900000010575f9f0 
>>>> ffff8000035859c0
>>>>            ffff800003414000 900000010575fa78 900000012f000000 
>>>> ffff8000031b4c50
>>>>            0000000000000000 9000000101c9d700 9000000109c40000 
>>>> 5f5e9200f8901912
>>>>            900000012d3c4bd0 900000012d3c5000 ffff8000034aed18 
>>>> 900000012d380010
>>>>            900000012d3c4bd0 ffff800003414000 900000012d380000 
>>>> ffff800002ea49dc
>>>>            0000000000000001 900000012d3c6000 00000000ffffe423 
>>>> 0000000000010000
>>>>            ...
>>>>    Call Trace:
>>>>    [<ffff80000319de80>] dml21_apply_soc_bb_overrides+0x60/0x960 
>>>> [amdgpu]
>>>>    [<ffff80000319fe44>] dml21_init+0xa4/0x280 [amdgpu]
>>>>    [<ffff8000031a0060>] dml21_create+0x40/0x80 [amdgpu]
>>>>    [<ffff8000031cefc0>] dc_state_create+0x100/0x160 [amdgpu]
>>>>    [<ffff8000031b4c4c>] dc_create+0x44c/0x640 [amdgpu]
>>>>    [<ffff800002ea49d8>] amdgpu_dm_init+0x3f8/0x2060 [amdgpu]
>>>>    [<ffff800002ea6658>] dm_hw_init+0x18/0x60 [amdgpu]
>>>>    [<ffff800002b16738>] amdgpu_device_init+0x1938/0x27e0 [amdgpu]
>>>>    [<ffff800002b18e80>] amdgpu_driver_load_kms+0x20/0xa0 [amdgpu]
>>>>    [<ffff800002b0c8f0>] amdgpu_pci_probe+0x1b0/0x580 [amdgpu]
>>>>    [<900000000448eae4>] local_pci_probe+0x44/0xc0
>>>>    [<9000000003b02b18>] work_for_cpu_fn+0x18/0x40
>>>>    [<9000000003b05da0>] process_one_work+0x160/0x300
>>>>    [<9000000003b06718>] worker_thread+0x318/0x440
>>>>    [<9000000003b11b8c>] kthread+0x12c/0x220
>>>>    [<9000000003ac1484>] ret_from_kernel_thread+0x8/0xa4
>>>>
>>>> So protect dml2_create()/dml2_copy()/dml2_create_copy() with 
>>>> DC_FP_START
>>>> and DC_FP_END.
>>>
>>> Hi Huacai,
>>>
>>> Can you try to put DC_FP_START DC_FP_END in the
>>> dml2_create()/dml2_copy()/dml2_create_copy()/dml2_validate() instead?
>>> The code will be cleaner and less error-prone to future changes.
>> At first I want to add them in
>> dml2_create()/dml2_copy()/dml2_create_copy()/dml2_validate(), but
>> commit 7da55c27e76749b9 ("drm/amd/display: Remove incorrect FP context
>> start")  said
>> that "All the DC_FP_START/END should be used before call anything from 
>> DML2".
>>
>> Huacai
> 
> Thanks. I sent them to testing, and will share results later.
> 
>>
>>>
>>> Thanks.
>>>
>>>
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>>>> ---
>>>>    drivers/gpu/drm/amd/display/dc/core/dc_state.c | 16 ++++++++++++++++
>>>>    1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/ 
>>>> drivers/gpu/drm/amd/display/dc/core/dc_state.c
>>>> index 1b2cce127981..6e2cac08002d 100644
>>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
>>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
>>>> @@ -210,17 +210,23 @@ struct dc_state *dc_state_create(struct dc 
>>>> *dc, struct dc_state_create_params *p
>>>>
>>>>    #ifdef CONFIG_DRM_AMD_DC_FP
>>>>        if (dc->debug.using_dml2) {
>>>> +             DC_FP_START();
>>>> +
>>>>                dml2_opt->use_clock_dc_limits = false;
>>>>                if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2)) {
>>>> +                     DC_FP_END();
>>>>                        dc_state_release(state);
>>>>                        return NULL;
>>>>                }
>>>>
>>>>                dml2_opt->use_clock_dc_limits = true;
>>>>                if (!dml2_create(dc, dml2_opt, &state- 
>>>> >bw_ctx.dml2_dc_power_source)) {
>>>> +                     DC_FP_END();
>>>>                        dc_state_release(state);
>>>>                        return NULL;
>>>>                }
>>>> +
>>>> +             DC_FP_END();
>>>>        }
>>>>    #endif
>>>>
>>>> @@ -240,6 +246,8 @@ void dc_state_copy(struct dc_state *dst_state, 
>>>> struct dc_state *src_state)
>>>>        dc_state_copy_internal(dst_state, src_state);
>>>>
>>>>    #ifdef CONFIG_DRM_AMD_DC_FP
>>>> +     DC_FP_START();
>>>> +
>>>>        dst_state->bw_ctx.dml2 = dst_dml2;
>>>>        if (src_state->bw_ctx.dml2)
>>>>                dml2_copy(dst_state->bw_ctx.dml2, src_state- 
>>>> >bw_ctx.dml2);
>>>> @@ -247,6 +255,8 @@ void dc_state_copy(struct dc_state *dst_state, 
>>>> struct dc_state *src_state)
>>>>        dst_state->bw_ctx.dml2_dc_power_source = 
>>>> dst_dml2_dc_power_source;
>>>>        if (src_state->bw_ctx.dml2_dc_power_source)
>>>>                dml2_copy(dst_state->bw_ctx.dml2_dc_power_source, 
>>>> src_state->bw_ctx.dml2_dc_power_source);
>>>> +
>>>> +     DC_FP_END();
>>>>    #endif
>>>>
>>>>        /* context refcount should not be overridden */
>>>> @@ -268,17 +278,23 @@ struct dc_state *dc_state_create_copy(struct 
>>>> dc_state *src_state)
>>>>        new_state->bw_ctx.dml2 = NULL;
>>>>        new_state->bw_ctx.dml2_dc_power_source = NULL;
>>>>
>>>> +     DC_FP_START();
>>>> +
>>>>        if (src_state->bw_ctx.dml2 &&
>>>>                        !dml2_create_copy(&new_state->bw_ctx.dml2, 
>>>> src_state->bw_ctx.dml2)) {
>>>> +             DC_FP_END();
>>>>                dc_state_release(new_state);
>>>>                return NULL;
>>>>        }
>>>>
>>>>        if (src_state->bw_ctx.dml2_dc_power_source &&
>>>>                        !dml2_create_copy(&new_state- 
>>>> >bw_ctx.dml2_dc_power_source, src_state- 
>>>> >bw_ctx.dml2_dc_power_source)) {
>>>> +             DC_FP_END();
>>>>                dc_state_release(new_state);
>>>>                return NULL;
>>>>        }
>>>> +
>>>> +     DC_FP_END();
>>>>    #endif
>>>>
>>>>        kref_init(&new_state->refcount);
>>>
> 

