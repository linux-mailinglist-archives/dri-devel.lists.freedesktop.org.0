Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E698B18A23
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 03:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018BA10E22E;
	Sat,  2 Aug 2025 01:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L5tRWXFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD07310E07E;
 Sat,  2 Aug 2025 01:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dT3O4xOi9AS7yzTaAirbbI1YaMp5acYnC6Q2bSTC10m3jUwjICtepWVevONwj5DMfiiqK9EHyKXxefd/KDtI129L7bvLGmZtbnnXkF5Ykoz3pnlywDoSG+jw1cQzWEugcMTXpBx1znXmP5hKjpHph29+xeBbMSRA8r3QXDIhk241u1l6ZfIMflmEqbKhzpjKzU2LsxcTSCxgy7GG8FRghXE/WX5J4DxWEKIDGNAM2VdCDNc1ReSTxzzWnK8AvXiMQyyNa76sTBvtChYrSzItLeOLgT6cYNu+DZSkCzkX0bVbMsUOsG1MjcqqfeidgZfyKTNF3bBOZgjQr/mBE6Ep/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVb0Sjwj/PcjCzmFa+Yb5KxCbF+PeCve+tkLYdrIjbQ=;
 b=ZqTr7/nMLQW7j2RYo74q/eSyUo1gUlgVp9lO+rsEUdnr3WGXUaaWoeI0cUuao/pjMPcu3G+EZIgXxUagns6aW8asoiyeELWmgf9OVkihA7rZ5xUANKWF1rrqrVPBTGfnekADONXunDH7jpJIqCGw55WaLzdHEXdYREcwICQkhOafZbXzmdRsYQbXRtqqwiBc9Mf6sTmjtmk/tZU1vFnjOjGyGzXDiGkGZzbZXsZ6zzvonaUT1ljJt3yLOHS+aB6zVFtrbGE878RaiuRsBglESKaGAEPuUGNEj5NFlY9VI/3BrGDuCnSCu24DXyDdXFqS7/fa0OVZ6gvGFuVTsiBh0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVb0Sjwj/PcjCzmFa+Yb5KxCbF+PeCve+tkLYdrIjbQ=;
 b=L5tRWXFZs0hVJFqTsEa2OQL7MNIJNuf1iooQv+kkTXcfXzmUbQp04qEmkNpM5M9Pg4a5/3ScddjAd0qM1kkln3lz5yG6yyhZ5ApNDgu3/GstsXQlxDa5E9rdDm2nmjl9KJMw0xV1nfea0MvScbF+CANYWAwYmcUj3zm3xi7sGb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Sat, 2 Aug
 2025 01:49:33 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.8989.013; Sat, 2 Aug 2025
 01:49:33 +0000
Message-ID: <3f3f50e5-3a60-4d7e-855b-773c868ca14b@amd.com>
Date: Fri, 1 Aug 2025 19:49:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 40/46] drm/colorop: Define LUT_1D interpolation
To: Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, arthurgrillo@riseup.net,
 Daniel Stone <daniels@collabora.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-41-alex.hung@amd.com>
 <xn27XZjdRP83I8eaTGnDdLyvppJUppZ_GVsnDJQ1wK3UINAwh4FEutAlh02CtvZoPbB4D7zhof9rGj1DsxHpccpGK7ID-S-DjGi5VRhAD8I=@emersion.fr>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <xn27XZjdRP83I8eaTGnDdLyvppJUppZ_GVsnDJQ1wK3UINAwh4FEutAlh02CtvZoPbB4D7zhof9rGj1DsxHpccpGK7ID-S-DjGi5VRhAD8I=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0016.namprd21.prod.outlook.com
 (2603:10b6:302:1::29) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f374d8-85a0-415c-8912-08ddd166d443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REptbVpIc0NEYkZyM0N5VDVaOGZGR0UzK0s2Q2dqMnZTVllOVytUVFN5MmRt?=
 =?utf-8?B?SXNnNkVtZUFIOVQ0R09SOUM4Nkh1Ymg5SEhDdFdhdXpaOWxnc3BPWVBRaDNH?=
 =?utf-8?B?WmxNK2pVT1g2M3lwYUYzcW5DNmE1ZXdidCtCWTFsbEJTa0lybmJOUXhLYnJN?=
 =?utf-8?B?c2N4OVoyL1U1RHJPVWo4a2cwYXdhYUN0ZllKcysrcThXd1YxeUowUG9iY1cv?=
 =?utf-8?B?eTgrSnd0bTZnSkFHY0IycFd3MDd4ZlQ5ZEpMRlFWb2hSdkdkL094YXpRTkhu?=
 =?utf-8?B?NWpTb0VjQXFzemlNWUM1Y0MvMnUvUEI5eUIyeXBnMGRHNWVqam9mVHI0Y09J?=
 =?utf-8?B?c0Q2VTlXZkkxRjBtRmF2VmdDK0hNR1N5MzA3RU1YenBpODlBaGZwQTZWcGts?=
 =?utf-8?B?S09TT2VJazJ0blNTTkdoeUcvRmpWS25kL1lTNi8vQ2diay9yS1ZBNEJaZTUy?=
 =?utf-8?B?ckMwNUl5eThhWm5VVG1RK1FHYTRQVHFsNmtKdnhFSHg2WHJVT2xWaG8rTWZU?=
 =?utf-8?B?U3JNNURjS3hKU1FGRTNRVGx2UGVLSVRBT2pHNHZ1WlFtQ3F6ZGlqMTdYL254?=
 =?utf-8?B?QnkxU2xhN29yRlNqZS8wNi9xaHM4NGU0U2grRDFRN1F5TXUwQWJYaGhBY3Vl?=
 =?utf-8?B?QlkvQ2Nvbnd5Zy9HSkNNblVTODBrY1d5YTVCa0N1ak8rVE5JcGpjWmRjL0kx?=
 =?utf-8?B?cWdRQ0QwUVE2T3ptcDEyV1VHYzY3SWgzYkZZUUw0ZUIxTDYwSUJWMGM3OTFq?=
 =?utf-8?B?eFZyOXNhZ2MxSm9ZMTMwSlhMQU1WTytFUUZvS25KdW5lMDJlWVRhdGx6L1gv?=
 =?utf-8?B?TENUNjMyNFdNTDBhU3VvMmFSajV3dnpPRWZod2toQ21IWUNUcDNHNUJRVDlS?=
 =?utf-8?B?UlRuaHBRWEJyclltNlNKYWNJbnhuR1Q5V0oxVnJETyt4ZGltZWtDekdCWmtL?=
 =?utf-8?B?QXJNYlV6cUwrVTBibmlWS2NlUnpiZW9nUmdKaU9hVFcxWDNIVGdBTzNDa3dv?=
 =?utf-8?B?V21lcUFwZGxSdyt6UHZ6RnBBd3EyNmg0UkZMY0lscXZjVkIwMGhMblRFdTJh?=
 =?utf-8?B?dmRVWnVYalRzSjY1YklGZmhRRWhDZ0daaDJQOXdqbHhRYUlrU09ubllrL0J5?=
 =?utf-8?B?VGNGZTh0Y1J1b3VIWTBSZDJnS1hXVWRJZUFTa1pZSlI3SXhYTkJEWFk2clFi?=
 =?utf-8?B?dTEzTTlKZHdCNGpCZXI1akhOcE56enFETFk2TC9LRWxLdzROS1ZQSFF3bWRP?=
 =?utf-8?B?dktQNUV0K2kyTEMwc0xkYitkTkQydkcwRjZIRVZXUlVmRUVxT1Y3WXdlbTBz?=
 =?utf-8?B?aEI3a09TbEEvTSs3VEh3dnR3NEVESlVncW5ZdmVlZHh2SkNCWTJkYjZvb25E?=
 =?utf-8?B?NHZ3b0NCS3lLQnBTNm5EK2gvWCt6M2xid3ZhTVlFdFo3aWR5T0t1Q1lIc0Vn?=
 =?utf-8?B?TGZYWFJaVXYyb0VMajZNZkhWOGdiUEU5Tk81ZVF1eC9ubm1hTUs3OVFNaE5G?=
 =?utf-8?B?eXFKTDF4UzdkUVNUR0xKbmtZNVdsL1M4QnhpdUZNR210ZXZOT25zTmtGVjIv?=
 =?utf-8?B?T3BnN0tjL1ZISHVGUGVXb1M4RWNRVWtxTzV0ZDV6SGMycS9YYi9iNDV5Z05L?=
 =?utf-8?B?MjFYcG1WbUNneklFT1NYY1RnZmVxTkJEcUdnR2gzSzRVeGI0THlCNlZDaGFl?=
 =?utf-8?B?N3F2bjB4UnRFbmVsZnVoM1VyNFdJcEpQdEhlTlNESjBVeVhMcXBpZ0dQdGl6?=
 =?utf-8?B?a01zalloTnNRbGJnWjhjV1RrTW1pbTRsMFJ5Zyt5R3hVbFZGYVhaWFFCOThp?=
 =?utf-8?B?Wkd1NFpDR1ExZnFYWkFjTTRWZXBaUUUwcFR1RGkxaGh5RmxIRmZUR0NtTXcz?=
 =?utf-8?B?WU1XVWZQSHlzbVFRbWlJdlFIMU9HQ1NhUWVtZFhVLy9QUGV5c0ErWDQ3R1hW?=
 =?utf-8?Q?0HJwjTYkb5o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEw2OTFScVI5MXNuS3N6RjkxNEFKWUlXdkNIeVVZNGNNY1hrWlNpaWt0dGR6?=
 =?utf-8?B?azgxNnFVY0I5OWowZFIwRFFRSXBwZE9najYyNVhHb09YbVBDQnVNVmI5Umts?=
 =?utf-8?B?RzBnRm1YYnVHWENGamw3d1lyV0RVaUJINHMxalduV0xjdGtEemNlVnc5Rk5U?=
 =?utf-8?B?MVJDa3BraVFrWk5paXFFck9JWkExZWdQcHUxVjZXVmVCbTdGaTQ5blNMU3hz?=
 =?utf-8?B?QnVIRzJBZlplNG0rYW5VdWpnQ2Z4M3JmRHl5SzM2NmhTMkYwUmJHNm9YVmQ5?=
 =?utf-8?B?dnd6ZDRmUHNhRjQzT05hT0IrcGN3Y3lCMXJEUjE5Z281STZMU01xRTFSRUxF?=
 =?utf-8?B?Y2creVJuUGV3L0ZQenZ0aExWU1REd3IyRFVyYVpsbzhMa1lreENhc0srK2hF?=
 =?utf-8?B?ZlV4aWRhYUlWNmh2MVE0U3VaQ0FRaC81K2J3L2hsSlI5UzQ0Y3pBQlhJbHNS?=
 =?utf-8?B?ZzljeW9Mc3l0WmZGSDZKZXJFb2g0SjhQY0RtazZoRG45UzFIQll0TXd4Y1ZD?=
 =?utf-8?B?MGZIUUVWK25IR044QTFGNFpxbzVCK0ltd2dBNFppbFFsRjI0Mi8zWHlwWUF0?=
 =?utf-8?B?WFU1NWpuM094VXpqZ3ZSY3U0b1orQXhycDNVUUx5VThSVklra0VUeGYzVW5D?=
 =?utf-8?B?U2phYy9ERWh0ak9Pa2J3UmlZYjNnOXBBaDJGSldyNjFVM3pDaHh1anRZWmhw?=
 =?utf-8?B?M0VTbFlSWTlxaHlCR25oSXFuOVI1cy9GbzFKMUIwcXhBQi9wNUt6cG83Nzh3?=
 =?utf-8?B?OFFwRndZN3haa3dTRTN5UjM5MGV2d2U1YmNnRGYxTkw5VkdPY044R0NNa3o1?=
 =?utf-8?B?U0JXVUpIWmUyUlduQ2U1YW1lcmFHaDRlazFVYnJJY1lFZDFvcGZndnBZNHE2?=
 =?utf-8?B?Uk5xTUoxTnZuUXhHejlGWWNQT29Id1dXamF5YzlRNUs2RXJJZVZPTG0vSVgw?=
 =?utf-8?B?akU3Ykpia3hQTlJRL3UwTUY3VTV3bVNlZmNiSWZhNnFPbXM5N0ZVYTZBRVFL?=
 =?utf-8?B?Z0ZOR0VRc0FlOTJLREw2UFFjOU1nTVdtQlJ2SlVmREM2ZEh0bm9HV09WOW5X?=
 =?utf-8?B?UzNpOStVb0ZVOUwyME9hRkNHQ2JuNnVxblBjOU1tMGI3K1RQYWtRVGlsa05m?=
 =?utf-8?B?OEh6SWc4cERkRCtCcmJuSS8yK2w3ekQrcitwL2JCMHhqdkkvb3I2alBOVWc1?=
 =?utf-8?B?MEdFZHNhWUM4STFSMHhqcmw3YjVTcTIvSytvZTc4NUZaRElxcEZTNjNqYWMr?=
 =?utf-8?B?b0RJZXE3M2NOdHZMc28yajlPd0h0c1YrVVdQOHc3T0wvNzZQWmZyRExwa21U?=
 =?utf-8?B?cWlVY2dHRXRjZ3JzQk1KSzR1WUFvbHAvRHlHYWtZekFZVHFIOVB5ekw0T1p4?=
 =?utf-8?B?SFBQNmxodnBiK1c1K3JDRDVFWGdmckkrdUdwV1FPSk5aeUkyUnBVNmhwcDla?=
 =?utf-8?B?aGJsODlMUXVRWXVoRmJSS3F3YU5KWlZQUjI0NGhROWh4ZVV5UjQ5K0RNRU1W?=
 =?utf-8?B?cHhocW1OcG01YW1CRTlEbGx2eWdScWJncnpmQkNLTFFuL09MQ1NBOEVTOWdP?=
 =?utf-8?B?VXlvcGNPRGJxQ2JrR2Y2ZHZRZHRvU1dtYzBOaEVGekZrK0MxREhkSVNCQU9H?=
 =?utf-8?B?L2xoeHJDZm1sY2dxZm9ZQ3Zmc3ZUZGRxeU9YV00zSHZvdjB2OG1kQUdEQXFu?=
 =?utf-8?B?UXBWZ1RpUEhMM0RFUWQzVnlZR1hKa2YxV09qQWlkbnkwMlhDWFBuSktNbVc4?=
 =?utf-8?B?ZjhPYk9xdzF5YmQwTTdEdkxFbkx3cStNOFFLV1FzeUJmU0cxUG5tUk55T1lR?=
 =?utf-8?B?V2VsM0VOTmtqZm04SHBSeGo1SEZJZnB0TUEyOWJ6aVRvc3htbkVpdWxYN0RK?=
 =?utf-8?B?NlNmNThwNEFxakE1OVgxRzFXUjJZRW52SW95eDlWSWwySjhmN1d3RmgxbG5T?=
 =?utf-8?B?cDBITzNseXBWMjY1SE16dkxqQXVOejQ3NE5TamZoazNoZHhXaUpQa21sREM1?=
 =?utf-8?B?dmJsbHR2ZjlNYUd1ai9Cb3lHUldwV0k0V0QvbjBWQXJVOFhBQy9GM0hXZDBt?=
 =?utf-8?B?TWtXbDA4Si9RSlMrMWs0TjF0ZTY1dFVNRFA4YkhmVTZRa3ZvNUdRRlkvZHZr?=
 =?utf-8?Q?+K/SGNvC96UBi8SJQUvUrG3cY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f374d8-85a0-415c-8912-08ddd166d443
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2025 01:49:33.7141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDW/uBftBwS0UK+jhxCIusYbOc0geXr9CTsQQdSMy+cfEVgH0zWl93wO/fsDmG8uhZH72PBpB6JVktca5e9HJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648
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

Hi Simon,

It may be better to change it now if we know it needs changing in the 
future.

Hi Xaver,

Do you think this need to be immutable or mutable? Do you believe this 
need to be mutable?


On 7/9/25 14:30, Simon Ser wrote:
> On Tuesday, June 17th, 2025 at 06:27, Alex Hung <alex.hung@amd.com> wrote:
> 
>> - 1D LUT is no longer immutable (Xaver Hugl)
> 
> I think we should keep it immutable for now, and we can make it mutable
> in the future when we want to extend the uAPI to make it switchable by
> user-space.

