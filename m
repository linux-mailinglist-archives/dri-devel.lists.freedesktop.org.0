Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD1ACC6C8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A522210E041;
	Tue,  3 Jun 2025 12:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="17FfEH+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C0B10E013;
 Tue,  3 Jun 2025 12:40:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEpn5WLJgAtHdrmgRlvOJO2KUH1eSg+DVv1tTfYJlnTiYegdH02+kmI6PW8UDRe9gsl0fhvueSSOQnGcpIEYAYVZEHnIqyLhzDJdpw9ed1+o/KavG7/tMoIbtsQPzkxBvT4wh7ENMC09O2voV1jPZMEmqT+bAKxblasdlJImtgmtv6pSRCnI85T/EgGMxq1jlhkD3atZJa7S0xDrvwGFBAvQvnFdAgOqvjsFay2D/bf4GjEIx+GnC/vzpDd6bxEH78zQraU07g5OGyO08a0tEVQgTq0SEaerBycuSr/pjZROppxZrnIHj5ZjFjxQuSvKRvH7efL4bfnsOyiee1spNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfBIlId1mNKskJDJnbtKi35W7rmS8Ux4nC8aHsLNIbg=;
 b=M43aZji7ByXbc1l7aXkFWu8XmEAetxeKMcXQbTbA01VX+nSr/qrPHGKILcuw3QOeoY8Kz4SDF5kvrvRZD0/7nlDl1brSmIJAzXx/rImGWII92kYICmLVREgZpGQdWkuFkh3JSYSh2H2ZCS/q0FOS+UjplEceXCOfs2l5yEHzo2jkhcckHdtMs6LDoj7iN7oWk7wBycxyVvJEl7s11MqedoSOeSJGvk52Fs9mE3ykyNwqtz8dkuvkg90/6rcsG7GbNpqMG/TyFJBW6UciUeNTDi2d+GJ9H7dldwhpP5L9XPtqgbml9jQGZ3bQCk65qrbqtr0rF5xmADKJlB67jOZ5Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfBIlId1mNKskJDJnbtKi35W7rmS8Ux4nC8aHsLNIbg=;
 b=17FfEH+72bUCsOOFowghByqyXDHDx1AKFwztCzO6+5YyC+8lbnSW0io1SsnGJxc/xB32Gj++1pl02WotQF4eLWzoGGznjdGzl2qEm+wa+9KGraIFp+XudWHU5q0ryEaowPNpvNdNNhVAO46hwh2DlNygShNdCMJ+tW+3a+RXf0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7081.namprd12.prod.outlook.com (2603:10b6:a03:4ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 12:40:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 3 Jun 2025
 12:40:15 +0000
Message-ID: <3b614b74-4e6a-4e8a-9390-6f65ce788d02@amd.com>
Date: Tue, 3 Jun 2025 14:40:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, kernel-dev@igalia.com
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
 <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
 <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
 <d483076a-b12f-4ade-b699-ee488df298ba@igalia.com>
 <2ffc513c-2d11-4b76-b9c9-c7cb7841e386@amd.com>
 <7598fd9c-7169-4a01-a24a-b9e666e9a915@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7598fd9c-7169-4a01-a24a-b9e666e9a915@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:91::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1f4e35-691b-435e-22b9-08dda29bc9d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWhYTlN2NkZBWXZYWGFkWmFkT2diUEFocTQxRzRZUzFMcTVxNld3VVdMMTFX?=
 =?utf-8?B?T2puTHFxTnpIUUx6TGhRWWJ6MWx2Nm5oNkpUMTNqcXlQRXUraWYza0F2aXZa?=
 =?utf-8?B?clg5Zy9sRXJaanIvVGFIaDFIZS9mY1Vqc0ZNTHJrc1dCMjBpY2dTYkh1eGdl?=
 =?utf-8?B?aVQzOCtMWlVhbDlyWUttN1RXK2htenV4N2hzRmc0MFIwZlV1NnRlWHYzemhS?=
 =?utf-8?B?dS82MjJsT3dkSzJNS3J4Rm85UXU3R3hQSmJmS0dQcm9xWitkR3dyWUtRVVlT?=
 =?utf-8?B?enJiQlg1T0JzQ2ZCV0xPUFc1b3FlUVVLK1prRFhISVEzQ1ZXUzUvVmlGMzZB?=
 =?utf-8?B?MGRqWFJlenRuMzF3UFVLRFMzeEZNTjJZMk84VFI4TzdkWmorTG4rZFBaaWFo?=
 =?utf-8?B?T2xkbC9rRzlDN0xkcloveGtBRTUvaUczYU5uR0hINVdKbWFVejU2RFBkbU1V?=
 =?utf-8?B?SC9CRWlrdW9pYWZEcHBlMjUxWW9HczJXSXhkQkRaV3ZCRWFWeWRTK1djblZs?=
 =?utf-8?B?MWo2TjFrNS90aDd1UU1LUWlpRW5sVFVjbWJvUEltamxyREgyZE5aWWNmeEIv?=
 =?utf-8?B?SXY0TlVvZWVZbWd4eThXVzY5b0ZSZzNQVG1lRU9KN1p5QnF1N1BRZURrOEhp?=
 =?utf-8?B?cnc1c0dWNDBnTHlncWt3WU9wby81YmZBOVFGMGg3bTk2VWd3bjdHZmI5d2Zt?=
 =?utf-8?B?TmdRdDdxVHlWN2ZRSVh2dHMzQ1JwVG1QTmN4ZGFLLy9pYXg4SEMvWXkxcmNn?=
 =?utf-8?B?Umc2REZkYVUycjQzNVI2WkdtcU14KzVEc29uSldrZG9CbnljUXdRbkwvQS80?=
 =?utf-8?B?anF5eWlYVlBTWVYwTEVqSjhNdUhCSVAySTRKdUlBOWkrQ2hVOVVKM2lYS1o0?=
 =?utf-8?B?a2xZRTk1OEhQdFpGTFBxaTJYZjhoTVRLeXQ5ZU1IZFkzc3RDYWxrWjU3ek1Q?=
 =?utf-8?B?UW13UHlRZFkwMllxeVB4dnZkS0pySzFOeVVBeEdZZTFKdDFXdlJ1Y0ZqVjlT?=
 =?utf-8?B?OCtocnhKZWpqempCQnNkSTkxc2dkR1BTeHRzdlR4OTlnUGJzQkRvSGkzcHJP?=
 =?utf-8?B?K0dRK0NlZHZncmtINEJGRC8yWEIzUzRlbytldmpxV2dxYkE0Y0ZaQVRvTmFM?=
 =?utf-8?B?a1ZNZkpkNUtZNVNWZVFnWStEYVFiS2ZOQzd1MUZRcjcxNWZZVGpkUks1ZDdk?=
 =?utf-8?B?bWw0UEFrMTZQUWVJUGlJb1RkbkM1ZWJBV1dDUWZNMmdLNS82WFljZFBWL05p?=
 =?utf-8?B?SWhkZmVDUTlOTktUbXVSbFBsWFRFSDBhSVJCU1ZSeEhXYU5SRXlsRmhpNi9w?=
 =?utf-8?B?ZkdVU21oN1ZXWExTbVppWHd1TVVmRlUvTDlIcFBqYnNnSkUraDRkdFlVZWZT?=
 =?utf-8?B?ZnArNThtYVhpTittaFVtUTFCcWVVank3RExnTUs2WS84Um51YmJHSW5wMkx1?=
 =?utf-8?B?WjhjNDBvRFlDaDkyMWFjUEJsQlFSTjFwWmM3QmNmLzF2dzVRZkp5bzNwSWFu?=
 =?utf-8?B?YlZmSGpYdmxmUWdRcVpyTklIVlpsWkdLOW1neEtacmtGWktuK09EMTBDYTcw?=
 =?utf-8?B?aWFra2hPMTVVTnlDRkJpY29KdTVYeGlYU0RJMGhKbWU2TE9td25IM2ZUUFhS?=
 =?utf-8?B?NWpsZWxqeUtOei9MWldHWXpXWEtZMWVhMk02RlkwcmFUZEZOTi81ZjFBdC9p?=
 =?utf-8?B?RndjZWlPZHdhVlZRWFpFa0laWGpWZ1dyc0c4Lzd6dGNiLzIxb1YxSG51UzdB?=
 =?utf-8?B?SmRSYjJWcGxvRUhGcWJEUmxsd1RsM0U5UXdoMlR1UldSSCtzZWF3M0pjSU9Z?=
 =?utf-8?B?eWVWZFM5WFpMK1V4MlZJbUJpbHVwOWNkZmtaMjl2cEtoN3FveUdvK0pHcDJx?=
 =?utf-8?B?RmsyZ0FRODdvRzJFeGJEVy9NTjBPYXN1UGxlUDZWVGZCdFR3bklBaDhJbVFv?=
 =?utf-8?Q?5I6oTynUS0A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2RZTG9PTWY4ZUxQcEpXTnRrQ3dXYVlaMFdKYjRHSmU5eUJ0WW1VcTZZZHJm?=
 =?utf-8?B?VXhNcE9ycDdqeGVkd1oyZ3V3OEhjT25qQ0RHS3IvbS93UU1iUE9LSjYwOGxB?=
 =?utf-8?B?SGFRNzRIY3drckNBQXJ6ZmRHZWpyaWJKbVoyWkFVN2l0VWVKWFdXWHNDSjUx?=
 =?utf-8?B?ODhtRnIvQ1lQN1BRSkdESCs4Ukx2NkFHNmRvQlpBV25VQUg2QlorMFJuYWpm?=
 =?utf-8?B?c1Q2NWRucEVkVmZPR1pwWWhoY0VZa2J5RktvZW42QnVuUEd2MmYrYmE5NVB6?=
 =?utf-8?B?VmxiZ0lGeEhkaTdDUmQyS21XNVFSMmZlVTYycjFXNFBvc2FVZkFDVTRaKy9u?=
 =?utf-8?B?NU5tNjlxRmtSaFJoZ0lVZ1JXNFBQS1JWMlFKODBQSUU4MWVnaGF0d29CRFpS?=
 =?utf-8?B?ZHZiVkkycmtIMHBWWkh4MC95VFpYQWtBRXlzZ3VZMWxPeHVkSVRBWCtTUGZ3?=
 =?utf-8?B?dk11VXkwWi9EaUhtenZMVWowMHNZbzlEU2FEaUhTNkxrUWVvK3BQQms1MXBF?=
 =?utf-8?B?Rjk5alYydWpkMDN2YzVOWEFZV0VaZDNtWXN3aVZZYWlwK2UrTFlwVGVPV2Q1?=
 =?utf-8?B?WE8wTFFWcWg2dHp6cEhDQUREbzFoSjY1elZIQmN6Z3RnWGNwLzQzYkhZTUJ0?=
 =?utf-8?B?ZnpYQUpBL3VSR0NqT1F0Vy9BRllXTGZYUTM2R2MxU2lzRVBJVVpUc3pCeDdN?=
 =?utf-8?B?ek9DZ1NMK1JUNTdCWGVEaC9SK0FRSGhNZ25zdVFRVytyY1Uxekg0a2s3QUVz?=
 =?utf-8?B?Qm8zV05aTk5LUy9hRHlxLy9NQUR5ZE80T055dkczdGZ3TmFtTWcrVGllZlN1?=
 =?utf-8?B?czlTRVNYcUI4S0k4eGZHNlV1dUhjelpPaFNCYTU2WXdDTUo3Rmk1Ump0enkv?=
 =?utf-8?B?TnYvK00xN2NaZTU2WGJxUjh1SDdYZXQxQ1IzTFMwcnh6dnZyZjZEbzgzTU9k?=
 =?utf-8?B?MGRReGhxYnBCbDF0N09UN21yaWF2MUhpeU5JWFA4WHpCNzFyUCt3bUFqQ0VO?=
 =?utf-8?B?NW91Z0NXNlFQSy9kUGJqQ2k4djViYzEyRXpaWERhcDRLT1lxNTU5RU9oeHp6?=
 =?utf-8?B?RG43akZKcmcrVUtueFNiVm96bXFRVnN6d0xoQmp4ZllJVUtsM2trODM1L2N4?=
 =?utf-8?B?QjI2OGpZVDBzYmY1dktDcjZZdy9DSE1FVlVORXNrOGRoa0F3MXU5b3FVK3Yz?=
 =?utf-8?B?aDZHdnd3enFXZnJKblZmSDArNEd3eWlLQW5zYTJzbWkzV0I0cHhlMFA2Z3Fi?=
 =?utf-8?B?NDhENWJ2dURWaTRHNmM5VjBkSm1LMmxuSkF0TjRTd0NZc1hRYXpXSE9NQTFY?=
 =?utf-8?B?T01EM1dXYVQxQmlzZGREWUdTUm4xTDdzbGg3Ujh3MTkzYjlhT2p3UDZENU55?=
 =?utf-8?B?MFN1dWlDNHF3NS9nZHlOZFpuRER5NFlDYUd0anpYdmdpbURBY2FCS2hHV1po?=
 =?utf-8?B?Zk1LaEtkMXg1SXN6MStiTm5tcEdXdVJoa2FJK0hMSHRYTEtDYWk5ay8yNWhD?=
 =?utf-8?B?WmdmWmdyZ3J0bmloOXRHekt4TGcvdENEQjBYNm9oSi9sa1FRaDRodUtHN3lj?=
 =?utf-8?B?M085TnZXcmlXcW1jOXdyNWVTL2pRWTcxWmJQVDRTMytuVk94RmJ5ZGhGalpC?=
 =?utf-8?B?VFhwM2svTlNBbXhiL0ljbUhwMlhXbVdubkM3bTJzdFpHeEV0YS85WlZiNVpT?=
 =?utf-8?B?dTVBTjhldCtvZktVSE5BMHRRWTdFNVRYVGo5VllDdmxqYVRrQmhORzc0RXFv?=
 =?utf-8?B?TERQTHlGM2xBRTFxU3JDUnB5M0hDc2p0MnlqOTlyM3U4YmloOGtienJ4YjJG?=
 =?utf-8?B?YmFIbU5MaUZDL2FVWXlLNDkyYnEzVkVHdXhhN0RQNVJWUFRRbjlHcmFibkxO?=
 =?utf-8?B?ZHNUaUN2cmJlUGpTUHB3ZTdjdkkvdDRTMnhjODFaTDlPZDJWaklQdkptRWw2?=
 =?utf-8?B?V0FzZTJHNGhLbmZGeEZBdnM4UkVobE9ucTJzRUZJc3l5UmdmdXAvSUtIVkFB?=
 =?utf-8?B?RTZPRmJjRFlhNGo4amdGNFlMZ2ZndHpuL01iZEQvUnVKNmNneVErV0s3RmJ4?=
 =?utf-8?B?YXA3M0Q1dVdOb0l3NGpMTUlIK3JJTG02TXVXRmh4RzVzUVNJTDlVckNaTXl1?=
 =?utf-8?Q?zi+wEAryZWlAxEn5mibHID+b8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1f4e35-691b-435e-22b9-08dda29bc9d9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:40:14.9077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xi62JLADt7i1aayb2yyJeaslz7dJgM/I/Wu5SWfRpysGwbhTwRyMbfAVg5KhALy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7081
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

On 6/3/25 13:30, Tvrtko Ursulin wrote:
> 
> On 02/06/2025 19:00, Christian König wrote:
>> On 6/2/25 17:25, Tvrtko Ursulin wrote:
>>>
>>> On 02/06/2025 15:42, Christian König wrote:
>>>> On 6/2/25 15:05, Tvrtko Ursulin wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 15/05/2025 14:15, Christian König wrote:
>>>>>> Hey drm-misc maintainers,
>>>>>>
>>>>>> can you guys please backmerge drm-next into drm-misc-next?
>>>>>>
>>>>>> I want to push this patch here but it depends on changes which are partially in drm-next and partially in drm-misc-next.
>>>>>
>>>>> Looks like the backmerge is still pending?
>>>>
>>>> Yes, @Maarten, @Maxime and @Thomas ping on this.
>>>>
>>>>> In the meantime, Christian, any chance you will have some bandwith to think about the tail end of the series? Specifically patch 6 and how that is used onward.
>>>>
>>>> Well the RCU grace period is quite a nifty hack. I wanted to go over it again after merging the first patches from this series.
>>>>
>>>> In general looks like a good idea to me, I just don't like that we explicitely need to expose dma_fence_access_begin() and dma_fence_access_end().
>>>>
>>>> Especially we can't do that while calling fence->ops->release.
>>>
>>> Hm why not? You think something will take offence of the rcu_read_lock()?
>>
>> Yes, especially it is perfectly legitimate to call synchronize_rcu() or lock semaphores/mutexes from that callback.
>>
>> Either keep the RCU critical section only for the trace or even better come up with some different approach, e.g. copying the string under the RCU lock or something like that.
> 
> Hmm but the kerneldoc explicity says callback can be called from irq context:
> 
>     /**
>      * @release:
>      *
>      * Called on destruction of fence to release additional resources.
>      * Can be called from irq context.  This callback is optional. If it is
>      * NULL, then dma_fence_free() is instead called as the default
>      * implementation.
>      */
>     void (*release)(struct dma_fence *fence);

Ah, right. I mixed that up with the dma-buf object.

Yeah in that case that is probably harmless. We delegate the final free to a work item if necessary anyway.

But I would still like to avoid having the RCU cover the release as well. Or why is there any reason why we would explicitely want to do this?

Regards,
Christian.

> 
> 
> Regards,
> 
> Tvrtko
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>>> On 5/15/25 11:49, Tvrtko Ursulin wrote:
>>>>>>> With the goal of reducing the need for drivers to touch (and dereference)
>>>>>>> fence->ops, we move the 64-bit seqnos flag from struct dma_fence_ops to
>>>>>>> the fence->flags.
>>>>>>>
>>>>>>> Drivers which were setting this flag are changed to use new
>>>>>>> dma_fence_init64() instead of dma_fence_init().
>>>>>>>
>>>>>>> v2:
>>>>>>>     * Streamlined init and added kerneldoc.
>>>>>>>     * Rebase for amdgpu userq which landed since.
>>>>>>>
>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com> # v1
>>>>>>> ---
>>>>>>>     drivers/dma-buf/dma-fence-chain.c             |  5 +-
>>>>>>>     drivers/dma-buf/dma-fence.c                   | 69 ++++++++++++++-----
>>>>>>>     .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  7 +-
>>>>>>>     .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  5 +-
>>>>>>>     .../gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c  |  5 +-
>>>>>>>     include/linux/dma-fence.h                     | 14 ++--
>>>>>>>     6 files changed, 64 insertions(+), 41 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>>>>>>> index 90424f23fd73..a8a90acf4f34 100644
>>>>>>> --- a/drivers/dma-buf/dma-fence-chain.c
>>>>>>> +++ b/drivers/dma-buf/dma-fence-chain.c
>>>>>>> @@ -218,7 +218,6 @@ static void dma_fence_chain_set_deadline(struct dma_fence *fence,
>>>>>>>     }
>>>>>>>       const struct dma_fence_ops dma_fence_chain_ops = {
>>>>>>> -    .use_64bit_seqno = true,
>>>>>>>         .get_driver_name = dma_fence_chain_get_driver_name,
>>>>>>>         .get_timeline_name = dma_fence_chain_get_timeline_name,
>>>>>>>         .enable_signaling = dma_fence_chain_enable_signaling,
>>>>>>> @@ -262,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>>>>>>>                 seqno = max(prev->seqno, seqno);
>>>>>>>         }
>>>>>>>     -    dma_fence_init(&chain->base, &dma_fence_chain_ops,
>>>>>>> -               &chain->lock, context, seqno);
>>>>>>> +    dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
>>>>>>> +             context, seqno);
>>>>>>>           /*
>>>>>>>          * Chaining dma_fence_chain container together is only allowed through
>>>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>>>>> index f0cdd3e99d36..705b59787731 100644
>>>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>>>> @@ -989,24 +989,9 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>>>>>>>     }
>>>>>>>     EXPORT_SYMBOL(dma_fence_describe);
>>>>>>>     -/**
>>>>>>> - * dma_fence_init - Initialize a custom fence.
>>>>>>> - * @fence: the fence to initialize
>>>>>>> - * @ops: the dma_fence_ops for operations on this fence
>>>>>>> - * @lock: the irqsafe spinlock to use for locking this fence
>>>>>>> - * @context: the execution context this fence is run on
>>>>>>> - * @seqno: a linear increasing sequence number for this context
>>>>>>> - *
>>>>>>> - * Initializes an allocated fence, the caller doesn't have to keep its
>>>>>>> - * refcount after committing with this fence, but it will need to hold a
>>>>>>> - * refcount again if &dma_fence_ops.enable_signaling gets called.
>>>>>>> - *
>>>>>>> - * context and seqno are used for easy comparison between fences, allowing
>>>>>>> - * to check which fence is later by simply using dma_fence_later().
>>>>>>> - */
>>>>>>> -void
>>>>>>> -dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>> -           spinlock_t *lock, u64 context, u64 seqno)
>>>>>>> +static void
>>>>>>> +__dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>> +             spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
>>>>>>>     {
>>>>>>>         BUG_ON(!lock);
>>>>>>>         BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>>>>>>> @@ -1017,9 +1002,55 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>>         fence->lock = lock;
>>>>>>>         fence->context = context;
>>>>>>>         fence->seqno = seqno;
>>>>>>> -    fence->flags = 0UL;
>>>>>>> +    fence->flags = flags;
>>>>>>>         fence->error = 0;
>>>>>>>           trace_dma_fence_init(fence);
>>>>>>>     }
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * dma_fence_init - Initialize a custom fence.
>>>>>>> + * @fence: the fence to initialize
>>>>>>> + * @ops: the dma_fence_ops for operations on this fence
>>>>>>> + * @lock: the irqsafe spinlock to use for locking this fence
>>>>>>> + * @context: the execution context this fence is run on
>>>>>>> + * @seqno: a linear increasing sequence number for this context
>>>>>>> + *
>>>>>>> + * Initializes an allocated fence, the caller doesn't have to keep its
>>>>>>> + * refcount after committing with this fence, but it will need to hold a
>>>>>>> + * refcount again if &dma_fence_ops.enable_signaling gets called.
>>>>>>> + *
>>>>>>> + * context and seqno are used for easy comparison between fences, allowing
>>>>>>> + * to check which fence is later by simply using dma_fence_later().
>>>>>>> + */
>>>>>>> +void
>>>>>>> +dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>> +           spinlock_t *lock, u64 context, u64 seqno)
>>>>>>> +{
>>>>>>> +    __dma_fence_init(fence, ops, lock, context, seqno, 0UL);
>>>>>>> +}
>>>>>>>     EXPORT_SYMBOL(dma_fence_init);
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * dma_fence_init64 - Initialize a custom fence with 64-bit seqno support.
>>>>>>> + * @fence: the fence to initialize
>>>>>>> + * @ops: the dma_fence_ops for operations on this fence
>>>>>>> + * @lock: the irqsafe spinlock to use for locking this fence
>>>>>>> + * @context: the execution context this fence is run on
>>>>>>> + * @seqno: a linear increasing sequence number for this context
>>>>>>> + *
>>>>>>> + * Initializes an allocated fence, the caller doesn't have to keep its
>>>>>>> + * refcount after committing with this fence, but it will need to hold a
>>>>>>> + * refcount again if &dma_fence_ops.enable_signaling gets called.
>>>>>>> + *
>>>>>>> + * Context and seqno are used for easy comparison between fences, allowing
>>>>>>> + * to check which fence is later by simply using dma_fence_later().
>>>>>>> + */
>>>>>>> +void
>>>>>>> +dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>> +         spinlock_t *lock, u64 context, u64 seqno)
>>>>>>> +{
>>>>>>> +    __dma_fence_init(fence, ops, lock, context, seqno,
>>>>>>> +             BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL(dma_fence_init64);
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>>>>>> index 1a7469543db5..79713421bffe 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>>>>>> @@ -134,7 +134,6 @@ static bool amdgpu_eviction_fence_enable_signaling(struct dma_fence *f)
>>>>>>>     }
>>>>>>>       static const struct dma_fence_ops amdgpu_eviction_fence_ops = {
>>>>>>> -    .use_64bit_seqno = true,
>>>>>>>         .get_driver_name = amdgpu_eviction_fence_get_driver_name,
>>>>>>>         .get_timeline_name = amdgpu_eviction_fence_get_timeline_name,
>>>>>>>         .enable_signaling = amdgpu_eviction_fence_enable_signaling,
>>>>>>> @@ -160,9 +159,9 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_fence_mgr *evf_mgr)
>>>>>>>         ev_fence->evf_mgr = evf_mgr;
>>>>>>>         get_task_comm(ev_fence->timeline_name, current);
>>>>>>>         spin_lock_init(&ev_fence->lock);
>>>>>>> -    dma_fence_init(&ev_fence->base, &amdgpu_eviction_fence_ops,
>>>>>>> -               &ev_fence->lock, evf_mgr->ev_fence_ctx,
>>>>>>> -               atomic_inc_return(&evf_mgr->ev_fence_seq));
>>>>>>> +    dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
>>>>>>> +             &ev_fence->lock, evf_mgr->ev_fence_ctx,
>>>>>>> +             atomic_inc_return(&evf_mgr->ev_fence_seq));
>>>>>>>         return ev_fence;
>>>>>>>     }
>>>>>>>     diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>>>>>> index 029cb24c28b3..5e92d00a591f 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>>>>>> @@ -239,8 +239,8 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
>>>>>>>         fence = &userq_fence->base;
>>>>>>>         userq_fence->fence_drv = fence_drv;
>>>>>>>     -    dma_fence_init(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>>>>>>> -               fence_drv->context, seq);
>>>>>>> +    dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>>>>>>> +             fence_drv->context, seq);
>>>>>>>           amdgpu_userq_fence_driver_get(fence_drv);
>>>>>>>         dma_fence_get(fence);
>>>>>>> @@ -334,7 +334,6 @@ static void amdgpu_userq_fence_release(struct dma_fence *f)
>>>>>>>     }
>>>>>>>       static const struct dma_fence_ops amdgpu_userq_fence_ops = {
>>>>>>> -    .use_64bit_seqno = true,
>>>>>>>         .get_driver_name = amdgpu_userq_fence_get_driver_name,
>>>>>>>         .get_timeline_name = amdgpu_userq_fence_get_timeline_name,
>>>>>>>         .signaled = amdgpu_userq_fence_signaled,
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>>>>>> index 51cddfa3f1e8..5d26797356a3 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>>>>>> @@ -71,7 +71,6 @@ static void amdgpu_tlb_fence_work(struct work_struct *work)
>>>>>>>     }
>>>>>>>       static const struct dma_fence_ops amdgpu_tlb_fence_ops = {
>>>>>>> -    .use_64bit_seqno = true,
>>>>>>>         .get_driver_name = amdgpu_tlb_fence_get_driver_name,
>>>>>>>         .get_timeline_name = amdgpu_tlb_fence_get_timeline_name
>>>>>>>     };
>>>>>>> @@ -101,8 +100,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
>>>>>>>         INIT_WORK(&f->work, amdgpu_tlb_fence_work);
>>>>>>>         spin_lock_init(&f->lock);
>>>>>>>     -    dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
>>>>>>> -               vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>>>>>>> +    dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
>>>>>>> +             vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>>>>>>>           /* TODO: We probably need a separate wq here */
>>>>>>>         dma_fence_get(&f->base);
>>>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>>>> index 48b5202c531d..a34a0dcdc446 100644
>>>>>>> --- a/include/linux/dma-fence.h
>>>>>>> +++ b/include/linux/dma-fence.h
>>>>>>> @@ -97,6 +97,7 @@ struct dma_fence {
>>>>>>>     };
>>>>>>>       enum dma_fence_flag_bits {
>>>>>>> +    DMA_FENCE_FLAG_SEQNO64_BIT,
>>>>>>>         DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>>>>         DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>>>>>         DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>>>>>> @@ -124,14 +125,6 @@ struct dma_fence_cb {
>>>>>>>      *
>>>>>>>      */
>>>>>>>     struct dma_fence_ops {
>>>>>>> -    /**
>>>>>>> -     * @use_64bit_seqno:
>>>>>>> -     *
>>>>>>> -     * True if this dma_fence implementation uses 64bit seqno, false
>>>>>>> -     * otherwise.
>>>>>>> -     */
>>>>>>> -    bool use_64bit_seqno;
>>>>>>> -
>>>>>>>         /**
>>>>>>>          * @get_driver_name:
>>>>>>>          *
>>>>>>> @@ -262,6 +255,9 @@ struct dma_fence_ops {
>>>>>>>     void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>>                 spinlock_t *lock, u64 context, u64 seqno);
>>>>>>>     +void dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>> +              spinlock_t *lock, u64 context, u64 seqno);
>>>>>>> +
>>>>>>>     void dma_fence_release(struct kref *kref);
>>>>>>>     void dma_fence_free(struct dma_fence *fence);
>>>>>>>     void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>>>>>>> @@ -454,7 +450,7 @@ static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>>>>>>>          * 32bit sequence numbers. Use a 64bit compare when the driver says to
>>>>>>>          * do so.
>>>>>>>          */
>>>>>>> -    if (fence->ops->use_64bit_seqno)
>>>>>>> +    if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
>>>>>>>             return f1 > f2;
>>>>>>>           return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
>>>>>>
>>>>>
>>>>
>>>
>>
> 

