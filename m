Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0801FB08767
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 09:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BC010E77C;
	Thu, 17 Jul 2025 07:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2UqNtaYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F6A10E0A0;
 Thu, 17 Jul 2025 07:58:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvJmt/3JvdP3gINOsQHkxzxugCa62vHivQIpgGTeQ8j52lakyu57Gbo2QZt8rdN9IqE5HrQ9QIq5C+P2UUG1kvrbqea783HiFxUof9CzaYXwhMKJveTQHWi2VH/QMFx5oGm6AQ2r6kENt1S973bFs0oUoGt0PsDIk1V/Ey/6IdwL9mmHobRCUPmzWrFhZNEr4THdoF8+8W9ML/+wK/isw+gJcS1seYP2DiCVlMSch+casB9RzBQfr78Fn2dfUS0pMs/jB+aHD0TMMyRTWBZvByjWH5Y5SmX/5dYdrjAoB8ddENQHl/MiPg8CeNaKkNwbv4TDNaBCXgfsCM7EmZDuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRdaL72VEmzj5Uxqxe4WV4SIE8febqNRWyfELEQaSfU=;
 b=UhPiACchV/AikYh8h65AHZ4dBRmdZlW23xazqGqfV91CUGeocjYAqIFCvGSNN7VEFYS7bia695Goa7mdc6U9BXZvS0c8CzJCHo/+HfuBNEBIY1CTvxlEjVE3umegWo0qJGXq/yJMZzfBHejWUSNS0EqVfJIemZtXftq4F/B8qJcJomC0/H8wUh533kEyYZd4ZbamI9YTr38rYviv3rnI8sOUaZuu92MMUlM5FEahfvTvfHLNvuh2Zcb2+YsUk1F6nLKhrAaa1IiaSkJgfTck7O4+mheqQtb8wAoO9zgOTULKWbEIK4M+sc0S8vamisG0UOv9XbS23UhMqFuNLjsHOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRdaL72VEmzj5Uxqxe4WV4SIE8febqNRWyfELEQaSfU=;
 b=2UqNtaYvVjotTUGskmeRrhTUZ+pGXWgJxTOIaZbpt+0CBeA2ne5pNdYs8Oxi9Oy0iRZZVkgr71QJ0uq5Ez9jpREzpe2NrzS+GHwzvnB7ltoGYufR1deqS2e61OoXajIsYAwdr2ktxLuOpiu2V+R1+xR9ZWOi64r/55NF20/aikU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 07:58:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Thu, 17 Jul 2025
 07:58:11 +0000
Message-ID: <13478054-3b1a-4b23-9709-4d176ad8894b@amd.com>
Date: Thu, 17 Jul 2025 09:58:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Brian Geffon <bgeffon@google.com>, Alex Deucher <alexdeucher@gmail.com>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, Pratap Nirujogi
 <pratap.nirujogi@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Garrick Evans <garrick@google.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, stable@vger.kernel.org
References: <20250716161753.231145-1-bgeffon@google.com>
 <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
 <CADyq12zB7+opz0vUgyAQSdbHcYMwbZrZp+qxKdYcqaeCeRVbCw@mail.gmail.com>
 <CADnq5_OeTJqzg0DgV06b-u_AmgaqXL5XWdQ6h40zcgGj1mCE_A@mail.gmail.com>
 <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADyq12ysC9C2tsQ3GrQJB3x6aZPzM1o8pyTW8z4bxjGPsfEZvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cbe319-60df-4852-fdea-08ddc507ac3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFFXbFNrWGl6Mi9Menpwb3k0QUl5Z0hWSnE2Y0owM3EyQ0M1TGluZThsTmV6?=
 =?utf-8?B?cmNSdDVoQVBtNy9kcjBZVHpFYmtXRW83RU9PeFpSa0NKQXRCNWpyTWM2djQw?=
 =?utf-8?B?YlpNazZyaEwxUDdRTE1RcXhOOEdERVRPSGF2MC9kSFdVQzYwMVdXTE9CbktR?=
 =?utf-8?B?MHVXOFZza05FMWVsSEhUbTl3Vm1OTDByL1d4VDhyRlIwU1YwWkVqQ1pBYUFu?=
 =?utf-8?B?Z3RyaU92REpZb2V0bnF5enR2b2ZnaVp3R2gwL1F4V25DUkNadFVhNGZTSGk2?=
 =?utf-8?B?MjlZOGRTenp1VjRmMGV3QXkwNkdvUzZEblVBUGVkTmR4Q3VsVTJTeXRuSndp?=
 =?utf-8?B?dmJwUFhGTGlBVW4wanBjc2t2MHh2NlpVR0dQbkdRSktnS042ZjNHaDlBaDcy?=
 =?utf-8?B?bGs0VXdRQ3lQQmRVKzMxTGwwczZ6dFFHdnM5TVNYSWx3aWZVcU9BR3E2ejZu?=
 =?utf-8?B?bHRiVSsxa1dmK25IZmJpT0tZTExQUnFoUHpCajY2dGtkRGw1bFFFU2JJWlVD?=
 =?utf-8?B?MnpxaCtuU1hOQU9aZmtVaHpDVGNwc25zRVBSUzFpelh1ZW0vVkhKZUw3VDdw?=
 =?utf-8?B?Q2QzTXJDUG9Pb0FGSzEwOEx5WG5WUGQzUU5VVEZmK09xVGZWamhuSmt6OUIz?=
 =?utf-8?B?Y1Nab3NQbU9JQ1RIWU1Lak83VHVhVlVualNGbDRXQ1VFclVlTGVmbW9FMjBx?=
 =?utf-8?B?MVpqbTNoYkFQcVBMalMvWVkxK3lLbzMxWlBwMDVLLzh2bXNmL0Z4YW0wSHo0?=
 =?utf-8?B?V2xmdWVHWFNpd2NQTm9sNGlnQ1IrcTdsSGpKS0lZYjV3UmQ0OWxrTWt4MWti?=
 =?utf-8?B?QTlxcXkwUGRCN3c2Uko0SXErNVJ2aG81NGl0aGFRSXoxdGpUSnhySkJld2Y0?=
 =?utf-8?B?b0xoWmRGTTgyQ2FqVm9sYVVoUHBlVWd3WlJuSStJNC9aOWhwZ3lySGgveWw4?=
 =?utf-8?B?bnBuQU5kVW14SEFjZER0QWhTSmxNN29OT0htU2ZzWmRsbVAvZy8xa2RxaHRP?=
 =?utf-8?B?alZCSWJ3RHNndVJuWUpyeDlBNlVDa3pZMDMzWU5oYzZnZk5oaG5oUENmRkl3?=
 =?utf-8?B?c2h2OVd5UWhKczg3SWw1SXFMbC9XWXM0L3JlenRGaTV1eXZsd0xDVTRPWWdz?=
 =?utf-8?B?a3AzT1o4RWdjVG5tUFNDMkxCOXZTZWNrKzlLSnVhbDRvVG5KaGM4a2VLd2ZX?=
 =?utf-8?B?bjJLM25TUWlnN2hmRENHVzRqWFIrb09KMG5MRk9wVy9RMmpBY3dMOE16cDQy?=
 =?utf-8?B?a3VkSXlaVjZSUDFzcHMxTXF5R0VJUDdESGVsTi9XWDczYkRrME4zeWttUG9r?=
 =?utf-8?B?cFJUYWFZZ2VoSVBjOVU5NWlzZm1TakN0YVU4MEdObWdPcGlpMzQzMVpucjBp?=
 =?utf-8?B?K2JSbTFZbWJ3MWxod2JKTG9ScVNweTFacjJzV1NTeDk3VkZSYVgzbG1qMFpu?=
 =?utf-8?B?NE9KSlAyTktWVEQwd2p0M2tQWjFobUEvT0dMTGlUM3I2b1JpakhRTENWL21y?=
 =?utf-8?B?c0tybWNycFJwVmhMVkQvaWJkRm5ldmhPZHB1L2pKek1aakYvcno0Mk9RNUJO?=
 =?utf-8?B?NkJGZ1JubkVoYVVRRTUrWUtxTjFhbmdDN3hqdTZqOWRSM0pJK2ZlUWptS1Zr?=
 =?utf-8?B?VmhzaXZSVndwbnEwclI4OExoOFJoQ2M3WXBaMzVWOWpOclpvR3BmWjF0U2VP?=
 =?utf-8?B?SnVDTEV6b3lTd3N5MFJEd3RXU3FkcHNWdWVkakw3Qlg3S1JiR1YvQ0hLU1Fk?=
 =?utf-8?B?Yzg0RDFFalJ6NWlzM1RNM0gyVCt1TndOS2ZJTmNvWVlVM2RSRVdMTHBWWlRQ?=
 =?utf-8?B?VlUzaWlYcUdrcWRBWXY3Vy9jSTA3STArelhremRvcSswUEdwejlOeE1YWnhv?=
 =?utf-8?B?ODNKOTFrL0NLNVRoR3lhVlNDbm5VUVVGYjVSZmkxRk5kWk9OUWVBaTk4WExR?=
 =?utf-8?Q?nFhVxQNdNxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWJyM3VyUUkvS005NTFiLzJnYjRRSE0xbGFiMzZaM21hTjAzZ2MrbW9JL1FR?=
 =?utf-8?B?QWdmME5CcGZXNmh5NUNWZHZFempYL2txaUU2aEZQb3ZXVXphSEhKenFhTW5a?=
 =?utf-8?B?WmovZ00xRzZzNSs2WklFNnJzYTZOcHBrNzBteEZnVGZHWHhCZG9NaFVRdVpN?=
 =?utf-8?B?dE5NR2JKR0VOQ3h1Q1BSNWxaQVJRdnpycFREeEFZb1RqSXJ1RXVCWjJsN05o?=
 =?utf-8?B?YU1MbE5KRERKajlwSG9acE1oRXBQbTFOSjBJUFUzOWVRK0xQWVFPbng0YldQ?=
 =?utf-8?B?ME02cGdLSzRyZnJPQU5JWThBcHQ1Y0Q4L0RIVTE5MWJkVXh5REpuNXhpaHFp?=
 =?utf-8?B?eExaN2hCWjYwS1l1eGJvQTVLci9sd3ZuNFFYcGpnQTZoM1p0eWo2azlBRUJo?=
 =?utf-8?B?WE0rZXRMc3IwUHJYYXl2bjNBbGxUSS9pS3p6aDJxZ1kzeFkxY0hOdXVHcHg0?=
 =?utf-8?B?UDZ5cUd5V2VJVFRFMUplMlRJMm4zTzdHdk1senJ2TUVrV3llcUx6UW9ncEdy?=
 =?utf-8?B?ci9Zc2Jnd0hSajZ2dy84VzUzeis1SmF5b3ZLTUd6eDk0YitOM3hiZ2RjVDFu?=
 =?utf-8?B?WFh0Z2pGejJXYzFMK2pSelpHaWdQN1lzcXFmdXNjck8rTEdzTG9ueEgvUnZK?=
 =?utf-8?B?S2pnSGh5VWtzdDQxV05NNllid3E1NnREeU9SR05JajUraHN4T2hjNTZDV1Nv?=
 =?utf-8?B?TGJrdnRFRVBiaFowMzAyWVVQZXkvMUZrQ3NzRE5OY3U1dyszeHVNUHVZWlpk?=
 =?utf-8?B?WVJQYTRQbllZdGlxS3FJOWFweWY3dWtZNmNWYjZLYzJoQ3VtcjM1ZVlnNVNj?=
 =?utf-8?B?S0N0RjZYQXUyWWd6RFp0N0JJcDlSV0gwWE9EU0dsVHdsVkxQVm9Yc3ZiOWdT?=
 =?utf-8?B?SXd0bHlGZ3dvZU5YUFBGeFIvb1JjT3FXVXIrREFxNWVBbkJLOUNvUWFkd0pG?=
 =?utf-8?B?OVgxKzRsa0plSEFXY2xNeHQyaG9QS0tKT2k2Q1N5VUVCL3hmVmthcWJkaXQx?=
 =?utf-8?B?bDNKd3I0aWFBeVZ2TkNkOEZQZDV3bVdHOGNSNlZWRkxSSFVWeVh0SDdPZGpB?=
 =?utf-8?B?aU9IMjJ2NW5BaGd1Z0JOSmZOYUh2d2k3VXp5eUQxcXM3cHpZL2lDWWlGTlNy?=
 =?utf-8?B?K1ZmUWFUVmhMYVdRWUw5NnBGanZGQWE0UUFBdWRQWGlMMTFic2xDeVJUNzFy?=
 =?utf-8?B?WWc2akVFVWVSZFBJRk1HWXZqWEJoQm42N1p5VVZiaVNTM1R4aFVCNTcxRlBV?=
 =?utf-8?B?V0oyWm9pYS9yL0VGbVMybjFxd3dBaWlTaHJDSlQvUXluR2RJQnhnOEtNQzZ3?=
 =?utf-8?B?Y1NXN1R1d2o4VFhHbE4xU1hETXZ5bWVOMnFWY2hJWUJNdHkrNWR2ckpEVCtJ?=
 =?utf-8?B?R0FocXNSb0N6WUwyQ1RWZHZPLzkvWklEZVplR20waHgxbjdMbHozNUJkOEdi?=
 =?utf-8?B?V0VkMXpQL081QWtxZ3FjOFowQVJuN3hzM2hQaTNQRkY2UjlOdkZZdTlEeFlU?=
 =?utf-8?B?dS9icnpxSkVMMnZvSVlYcVY0VlM4TnhnZk9vTVlwOTgzQ243aWZDRzNzQ3h2?=
 =?utf-8?B?bG1nUmJSOHFnS0w2bkN2UXM4TEN0a0t2NDhjR2l3RXdFZGJ2M0RwOGhKMEt5?=
 =?utf-8?B?R0k2eVM4TUoxOWlsKzdlL1MwTDJnQVl5NFJZZ25RYlhXZkFadU1pYkFDRkRr?=
 =?utf-8?B?dk53NDNlMmxLRTNmTyt3N2VzeVJpY2hRTUgwUEwwWUhqTFN3d2tIa09yaFFz?=
 =?utf-8?B?STNScW5wVUNPUk90WFdINjRXdlFlRmtvcnBpZTlGbkN4NDhFa01qY0ovVGIr?=
 =?utf-8?B?WUhOM0o3c1FqekxyY0NMVnpiZ296Z0FlOHp2Q1NLVnc0a2lxYm1PR0M2aEQ5?=
 =?utf-8?B?NGtpdVNsN3ltZDNvY2IwdlZjeGplTTF0QVRkS3kwbTlXaENUUk43dnFpY0lY?=
 =?utf-8?B?dk1VbFhmd1pyQ29tVGFpcFcvR2gweDNsWUpyN2c5WU1RdE5tb2N6QStFQjVS?=
 =?utf-8?B?WEdpTGVxMk03Rk1tT3h1RUxncVdMTy9Fa2ozYStLcFk3bGZ0TCsySVBDR09v?=
 =?utf-8?B?N3ZvTG5vZS9QNjlxeHJVNVR4UE9hZlloTm84RnVwTHFNVEhBbFZiaE9rNjNZ?=
 =?utf-8?Q?HWaGuROPWMWfcw8pi4PF9pLbF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cbe319-60df-4852-fdea-08ddc507ac3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 07:58:10.8711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ykQgoSUEbdvqYhNv/3XN3eA67sirTVFK20LoNMnP9EsxzNWCQvTblMWa1ph2uio
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
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

On 17.07.25 02:12, Brian Geffon wrote:
> On Wed, Jul 16, 2025 at 5:03 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>
>> On Wed, Jul 16, 2025 at 12:40 PM Brian Geffon <bgeffon@google.com> wrote:
>>>
>>> On Wed, Jul 16, 2025 at 12:33 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>>
>>>> On Wed, Jul 16, 2025 at 12:18 PM Brian Geffon <bgeffon@google.com> wrote:
>>>>>
>>>>> Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
>>>>> allowed for newer ASICs to mix GTT and VRAM, this change also noted that
>>>>> some older boards, such as Stoney and Carrizo do not support this.
>>>>> It appears that at least one additional ASIC does not support this which
>>>>> is Raven.
>>>>>
>>>>> We observed this issue when migrating a device from a 5.4 to 6.6 kernel
>>>>> and have confirmed that Raven also needs to be excluded from mixing GTT
>>>>> and VRAM.
>>>>
>>>> Can you elaborate a bit on what the problem is?  For carrizo and
>>>> stoney this is a hardware limitation (all display buffers need to be
>>>> in GTT or VRAM, but not both).  Raven and newer don't have this
>>>> limitation and we tested raven pretty extensively at the time.
>>>
>>> Thanks for taking the time to look. We have automated testing and a
>>> few igt gpu tools tests failed and after debugging we found that
>>> commit 81d0bcf99009 is what introduced the failures on this hardware
>>> on 6.1+ kernels. The specific tests that fail are kms_async_flips and
>>> kms_plane_alpha_blend, excluding Raven from this sharing of GTT and
>>> VRAM buffers resolves the issue.
>>
>> + Harry and Leo
>>
>> This sounds like the memory placement issue we discussed last week.
>> In that case, the issue is related to where the buffer ends up when we
>> try to do an async flip.  In that case, we can't do an async flip
>> without a full modeset if the buffers locations are different than the
>> last modeset because we need to update more than just the buffer base
>> addresses.  This change works around that limitation by always forcing
>> display buffers into VRAM or GTT.  Adding raven to this case may fix
>> those tests but will make the overall experience worse because we'll
>> end up effectively not being able to not fully utilize both gtt and
>> vram for display which would reintroduce all of the problems fixed by
>> 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)").
> 
> Thanks Alex, the thing is, we only observe this on Raven boards, why
> would Raven only be impacted by this?

Exactly that's the point, this is most likely just coincident.

As far as I understand when the registers are already initialized properly by a previous modeset it just works out of the box.

We potentially need to change the DC design to always program all registers independent of the current placement of the display buffer.

But I'm not sure if that is even possible or if that has some more problematic side effects (drawing more power etc...)

> It would seem that all devices
> would have this issue, no? Also, I'm not familiar with how
> kms_plane_alpha_blend works, but does this also support that test
> failing as the cause?

Correct, it affects all APUs which can do scanout from GTT.

dGPUs are not affected because they can't do scanout from GTT over the PCIe connection in the first place.

Anyway Harry and Leo need to take a look, it's clearly not that easy to fix.

Regards,
Christian.

> 
> Thanks again,
> Brian
> 
>>
>> Alex
>>
>>>
>>> Brian
>>>
>>>>
>>>>
>>>> Alex
>>>>
>>>>>
>>>>> Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Cc: stable@vger.kernel.org # 6.1+
>>>>> Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>>>> Signed-off-by: Brian Geffon <bgeffon@google.com>
>>>>> ---
>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> index 73403744331a..5d7f13e25b7c 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>>>> @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>>>>>                                             uint32_t domain)
>>>>>  {
>>>>>         if ((domain == (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT)) &&
>>>>> -           ((adev->asic_type == CHIP_CARRIZO) || (adev->asic_type == CHIP_STONEY))) {
>>>>> +           ((adev->asic_type == CHIP_CARRIZO) || (adev->asic_type == CHIP_STONEY) ||
>>>>> +            (adev->asic_type == CHIP_RAVEN))) {
>>>>>                 domain = AMDGPU_GEM_DOMAIN_VRAM;
>>>>>                 if (adev->gmc.real_vram_size <= AMDGPU_SG_THRESHOLD)
>>>>>                         domain = AMDGPU_GEM_DOMAIN_GTT;
>>>>> --
>>>>> 2.50.0.727.gbf7dc18ff4-goog
>>>>>

