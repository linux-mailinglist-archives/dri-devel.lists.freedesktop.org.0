Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A03B18A57
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 03:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1C910E331;
	Sat,  2 Aug 2025 01:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WDTg/TAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C96710E32E;
 Sat,  2 Aug 2025 01:59:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTzkke5dpaLpBgCgooNa2lUMo/DZSMT6J7Jmlc3AQ4IZkxR8dwD66gNvxXqDcibhOW8PyTUS8DsWLiwfjD5TmWDkEH++Bchu6zPwrLjy9KSjgQ++YRfUg2vxwE0gomH5Cu9Pmvin1tcc0VR7WsbklKuLG60GpKOizGXleL830RAObN9guSiNOFY9RT/Foxex9RZDJTU0L+rQJU8c96bwNhsinFtslYMoKYJYzkVSnw6KUkgc5tKX/EAMupH/LgWhWdzL6jYoAfT7RlcSWsgKESsFn5muwYKFFlxWqTZ9mLlrZfTUfUImThOGyGF+rp2MKyY2MKQ5ZFGuJe2hTmHV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eb/oaDynCSiMWVfQXVQmvKaCU7avIcRrO9U+yT3MXRE=;
 b=XIEq49nGllmT82rN1g4lFqcimvXcBevIB1PIQsQ92VSpLK3KR16V6ak5EzzcvMr1J+PMZTBZ5ifIEoZhczf90eO2iSnFss3KwRN9lrwpI7H2+jntLFNTn+ad/9/T4OdaI955oyF4HNkGOI6+T4aUIdqOjk2V7bYZJk9tDqQaGKIsv5u2pAI+s81itadFW6vU9IudtziF0btGnIemo4cudFbcOQMU7EoGka6ue+434RZ8+v3r0DTPiftd19Xppm4Yuq0u6vkfD5zx8klUmibDnlHNu7bAhtU8V8SD4/IXzsBq1eMMOoHwGONpn4eDqcTM+zd5F2v3/4rjBHDvirVIKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eb/oaDynCSiMWVfQXVQmvKaCU7avIcRrO9U+yT3MXRE=;
 b=WDTg/TADDXB8PtXfb1O75q0C+J4QXY4OuvYq9V7y4InFWWzsqOfedcP9ujr9D9STi+6flPDiW5e6cRA/pEk7cMfSqNqnaUdbBvK9UjCkblG/EAl9d4/+milyMcWBn2UUdhL8hwSUsxjO+uq71mEzmW8QSQ+ZNFVu9ORumWPyIN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA0PR12MB7076.namprd12.prod.outlook.com (2603:10b6:806:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Sat, 2 Aug
 2025 01:59:13 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.8989.013; Sat, 2 Aug 2025
 01:59:13 +0000
Message-ID: <05498ef3-967f-41f5-82a2-1300f56e53ae@amd.com>
Date: Fri, 1 Aug 2025 19:59:10 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 45/46] drm/amd/display: Ensure 3D LUT for color
 pipeline
To: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, arthurgrillo@riseup.net
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-46-alex.hung@amd.com>
 <a56d267c-734e-4787-a035-c39eb062bc3f@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <a56d267c-734e-4787-a035-c39eb062bc3f@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:303:b6::33) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA0PR12MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: dd9ce7ce-2afd-4ec1-6661-08ddd1682de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3daZmN2cUd4a2E5dVgrbUwrZUdmOTFDdzhGRFdyMkMraEkwTStXdzdMbWlV?=
 =?utf-8?B?TzFZVkl6Q0VJOEl5Q2JoL3lyakZhZ2l0SnZOSXJNVEtGUzBEcC9EOFd1UFkw?=
 =?utf-8?B?anFLa041ZGVUMngvYVJNWHBNakZHdE4wWHJTRWJzU2ZqNExFVGZHSnQrbEJl?=
 =?utf-8?B?dFF0UlJwOVAwZHVuaXlybWV4ckIwN215V0s1cFF4K0FsYTB0UFBpRGo0UWIv?=
 =?utf-8?B?N2RIeXJIK29YOThNL0R2Ny8vcWhCQnZza2hHUTI5UFliaUttOXF0M2s5d0M2?=
 =?utf-8?B?Vi9KVnZVM3lYVUlpMEJteHEzbVBieTFveWdOV1BLNTBkbDAreDRHVHBacjNa?=
 =?utf-8?B?QlV6Qi9YWUdBVlVqcjA4Vmh3NDU0WGpBb01kM0NWa0pqSG93dDZmNE5leFhR?=
 =?utf-8?B?K2dqWXdhZ3pzK0kremFFWkE2N0I4QkV0U0JhZTFQOWVjby96eUQ0S0gyRytY?=
 =?utf-8?B?bkFWS0NCU1pjS2pxeExaQjYwY0l5eFJZVDk2SWUzYnM2R01Nb0MyRmxpQTJM?=
 =?utf-8?B?eXVVSHJpV29QRGdFb0xLVHZ0Q2E5WVF2VHBadUJNUXYxME5FTGV0SERldmFH?=
 =?utf-8?B?NXAzNUhLR3kwWGYvV0c5ZVlMQVlEUU9Xa2ZhcWxteGdGMzBlblg2am12UlBK?=
 =?utf-8?B?djFVZys3Unc1TW41YnYzanNwZ0xISDRnbklOWWZlRkNLbFZsU1k2anNzdnc4?=
 =?utf-8?B?K2dEbEhoZHgvRkUvRlR5VGFURDRZd29HSkNiMzFkSUJ3b0JNN3hqWEdyWDBB?=
 =?utf-8?B?RU5tWDFMMHBERzBLU2p0TVlHRzVKSEJGMmNkZ05VcU9uRVNZQ2lQazdmY0ZJ?=
 =?utf-8?B?UUQ5M3AzVWh5L0RldWJTZnNPbFUyL1BzNGdPYjF4RGxMVlZ1bC9VOFFUZmFj?=
 =?utf-8?B?TlpVYjRVeG5mQ3dnYzFIM1VGMlRIMlZlaHJLdmw0Tmdya1VzeGtacUpVTHpy?=
 =?utf-8?B?ckxOcGxMY1dWMjdMaHJZZ0ZWVTFnRFd4a2ViYnd1QjdlRk5RdkRYbzV5TitH?=
 =?utf-8?B?Q0hJY24xNUNwYnFWa1JzYUFnZDQraDZ6dERLaWdTN1hXd2dPenpFb015TlRt?=
 =?utf-8?B?SE1SbFZiOVhGM1p2KzNmVWQvQ1pYR29KUnhyb0xJbm83T3p4dGlWa3V0MzNm?=
 =?utf-8?B?MWpIdE41QmhWYkRsUzlXRko0N253OU1LN3o0dERXQWZwa1Btamo3alJJUjFC?=
 =?utf-8?B?UlVXek85c3ZVblFkWDltZTdsdUh1eUNJeHBGZEY5VCtHRTNkQkgvUXc3TEY1?=
 =?utf-8?B?RXJGaHpLSTZzQ0w3d0o5NWp0dG1BMGNOUGZDUEdSbVlEelVHbUlaMS94NEdm?=
 =?utf-8?B?cFFSM2xNdks2YzhOZDk0c3Z4bkZWdDBHMmlnUmpheXJBMkVyMEF0WVZPWEYy?=
 =?utf-8?B?cFpIZFQrdmNGOFBmazQ3SFlWNlVxOWN1Y0d4OVVtVEJuRmNKT3hoQjVnZmRr?=
 =?utf-8?B?SE5lNWszVlFnd05rYkFnRzVZSVE4bU4vdlVncHBGcGExaTcxckd5YlNFckVt?=
 =?utf-8?B?YnI0a0UvdXJlTzlaT01sNGUvQ3o5cDhRSFpXM3oxMmIrZUlCcmdNcVoyTEp5?=
 =?utf-8?B?QStwZVBCbDJXQzltU0xScmQ5NFNuZFVwbVFmTFBCZ0hkWkRkWkNLaW5ublk0?=
 =?utf-8?B?Q0R2Y0FEK04xNHJZcjV0NHFQaUhOaXNKVHFEUmc1RE85OUhvMkNSYjNNcEkx?=
 =?utf-8?B?eFhxL09KODlwWDhmZjlvYXo4WUpRd0U3eDJHa0FpY0VMZDdPZjN2KzlRRnBR?=
 =?utf-8?B?NjRqMTJzTHI0dUlYZG1rTk1MWjRNbXh1YUd3bXc3YzVuNmtkZmtlVzB1cWQy?=
 =?utf-8?B?dUExazNQd212N0dreStVYjd3UHd0Q0xTOGszS1VwSFRCYlo5NWtaQkRaaE1D?=
 =?utf-8?B?MGdpaGJUanhMSDlwM0VnOWU5NXpSWUtSeTJWS3NGWGlFNVA5RS9sRmVYNnVV?=
 =?utf-8?Q?DYzNSDVxNTE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzhIZC9HZmxCbDczVGdqeU12UzErMWJpK3lHNlNqS2ZvQkFuT2gwS0xmT0lG?=
 =?utf-8?B?LzN5d3lSY1ZQdU9COG91Zjl4cmYyL09Vc3U2d3ZBZHZRR3VqVXVHeDNLb0Fr?=
 =?utf-8?B?T2N1M1NMVUl4MDhoblJtczdrVTYrWTNaamR1UU9Zc2lySUNiVE9LMVQ5K2hn?=
 =?utf-8?B?NHBHSUJZSWNkd1FhbTJGeHZoREJZUHNRblN6U3lLN1FiRFdEY3JnRkt6WlVH?=
 =?utf-8?B?dFFOUzNhVnFnR1N1WlRwUkFzS245Q1lPNHlJb3lLOHJWYmgwWHJBdjMyQlVY?=
 =?utf-8?B?WlFwMDUwZU9UTW1mbWJuYjYyc0FSclF3SWIxZUF4cHZvMEwxOUo0aTlSQmJE?=
 =?utf-8?B?OXRBeE9xVUxMQmxEeGpJSmYrcEV3cC95cllDdmJPYzBUWEVvZytabGF3djJp?=
 =?utf-8?B?MGlTMTgzeG1jZjVwK21JQXhrSzlYMjFUdnlUMkFCWFhZSFhIL0FZSm13aGg0?=
 =?utf-8?B?Sm4ycXduT1ZwMCtLWmxWa2p4b2hEZTZjZm8xdVFyVjZqNDZMSWpUOFh4a3ZW?=
 =?utf-8?B?N0ZVNnhLbnl1YStDbmw5am5wMmJvR21XOHZEVGdqZFhGckpJVXk0WE5ET2dN?=
 =?utf-8?B?U3lGbmFTQ3ZEYVJJS1VyTDhycGN2QUhSbUNjNDVwTjd2eU1DRjl0aHN4Yk9Y?=
 =?utf-8?B?MlM1UFkvaWxpSDJQaXpGV2hyWC96bncva1V1UFdKalNVRWEzeHRkY3owUWVa?=
 =?utf-8?B?Q2FXOTBPUVVrMTNkejNKN00vNThHN2lZU2NtaUtaUTJzTFcwRUwxK05xWEZH?=
 =?utf-8?B?dld2d3E1eGlSTkZVOXdpM3ZxWHgxNzcwZUpDVGQ4bUVtalhmUDUwTGlBYWhM?=
 =?utf-8?B?UVlkVUdnUm55Y2hDbWRtbGl4RGdFNlRFQnRQdkVCMnhnTEV2U3Bubk9wLzJv?=
 =?utf-8?B?K0ZPemFvdnVTamRUSzNpOHFXT3A3M1YrU3M3NlZWVFBzUmdhWEZ0ZU1CcTdk?=
 =?utf-8?B?bzdRWE9WaWpuVXM5aWV0TUZyWmMyNU8zS1NibUF0dW5ISlJKdFNrYnN1QnNV?=
 =?utf-8?B?Y0Fqc3AzVFJQOHcwblJFeTRVdU1rckY2NEJyN050azZncGtlWjdEK3g1N3VU?=
 =?utf-8?B?RmE5NzBITTFGLzNyWldoNnJ1N0U4MlFyRzNhWnB3R2lhWHB5blZFb1dFeFEx?=
 =?utf-8?B?SlpXTjUvV2JZYzczVzUwM2Fmd1V4RDREV3gyTWxOcmdFQStIdjJ1dFZkbDJP?=
 =?utf-8?B?NmVTYStXQlJvcjBrVlpxZEhUY05uOVBWaTk5aVZBUVV4ZmdvUkVXQzltS2l4?=
 =?utf-8?B?ZzNBYWdVMDU3UFhBaU01Mm8ycVk0ckIyTUJORFA5TUNEMEVBZDEyQXFUSUM0?=
 =?utf-8?B?SjJ5bFFnQk02dGd1YW03UHcxQTF4TTlqcTI5OHdBOGIwRkEyRnh2YVVxWFo2?=
 =?utf-8?B?NnlNQU1JcURaaGQ0SkYrTzQ0MjZOSFJaLzRtTjFFdStwYXREQjR3NGNScE03?=
 =?utf-8?B?c0hMTTY0cnpZTmVUSkpHa1hGU1Q0TzgyZGFoSHVKNjhLNExGZnBoWDBuQnJW?=
 =?utf-8?B?a0p2UHdZRk1JVlFweDRndTNIZHNrckRZWVQ3aGhjYUt5RnNXU3RJNjBUOHFH?=
 =?utf-8?B?N2VFb0hXZDhTdUtybW0zdlgvRC84aUc2bW1zMFprNW03OGZ3VWFPeG1GcGZH?=
 =?utf-8?B?Y2F6YkFabEg5S0ZPTS94NjJ0Q09DellmUDNOWEF3blVHL3NkYnBBbVZqdUNk?=
 =?utf-8?B?VjV4ekRObnZwcnc0M2xOZDlGaXV5cEFrcEZXL21RdHkwM2JlM1VzNjZKdEhP?=
 =?utf-8?B?L2hnZ3A3ZVpLb0RPOU5ReFl1YWdhWGRvbkxDZnI1bSs1YjVmUURCRFVkTzdx?=
 =?utf-8?B?dWRZaTJFbWwyOXlQR3BVbDczejFoaE11eEt5UlZtYnptbE54WWRJdFcvUlZE?=
 =?utf-8?B?V2VBMlAyN1djdityT1pZV2Y2NURKZUlzZU1PaUVtMDhibHptL3dPQzBuR3d4?=
 =?utf-8?B?K0tSc3o4ZWlGd1RmdDI5YUsvWnZ6K1VIMnFCVGVFRWk5cTdJTUFab0NGdXoy?=
 =?utf-8?B?RzROSzVUNEg5bWQ1RENSMmVZSlRSZ0NONTdFUEVPR3dCK3V2WC9DcUdOTnpL?=
 =?utf-8?B?YlBpOUpQMGthbkFlejdvbXY2M1JlYlJSQ0xFNENRZGlCTytMTHN2eGloSlMv?=
 =?utf-8?Q?8zG2g7bKUSL2aKbBrQu6VKuIS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9ce7ce-2afd-4ec1-6661-08ddd1682de5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2025 01:59:13.5997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MWTHzBHKb+k4TLXtcFvrsum6P1foldUNo/f3ks72YqQPn6f9Ci64atXgN2AdFovV2D4Vt1T6cUZfrMfxfXnwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7076
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



On 7/9/25 13:56, Melissa Wen wrote:
> No I think it will not work as expected for movable 3D LUT, since 
> movable 3D LUT is a MPC capability.
> I have actually sent a patch in the past to clarify this on DCN401. So, 
> this check doesn't cover this driver anymore, for example.
> - https://lore.kernel.org/amd-gfx/20250425205236.318520-1-mwen@igalia.com/
> 
> But I also don't know how to make a more generic check in this movable 
> 3D LUT case.
> Any better idea?
> 
> Melissa

In addition to "caps.color.dpp.hw_3d_lut", "caps.color.mpc.num_3dluts" 
in theory may be used together.

This is specific to AMD and has no impacts on the API, and I'd suggest 
to keep what it is now as this is already verified on a hardware 
(DCN3.2) and get this patchset merged. I will verify new solution on 
more AMD hardware.

Cheers,
Alex
