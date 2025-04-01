Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38DA77250
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 03:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D417910E4C1;
	Tue,  1 Apr 2025 01:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1qsTkUDe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5A810E4BD;
 Tue,  1 Apr 2025 01:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQKl0XDjiGAGqSlQAWEngs1wzrZt3ZNlgL62Y0t+h7gzzS8wRcuz1PzE4B4/P4CUBYVj7pOyMSLNC0P+EeSv0mAteo3zj+ky1qrmWaDhT8629H7qgfzbhr0wVJ+DajgL925vRxSXUlIS/Y6vDMYCLCgiQo5YErnOZESvKMZGL3lQaDMm4X8fgPDHP3/FTXLKMq4maHAwIK4pOuNnTDAMLEZxXmVF7bBIeeCB93uwgHzGETWPVKgTgsmVbhAjESNoVn4eNWYIFBVsKlyniIcn75c/MihhrPJJd8ZLkg9epvVBwt+JT14rPnnEa+c7rAE8qc4emlkS3rrZFHgXvIMH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouk6Y9hmPiQxDkerRGzz/Njzlb2deStC8/0IX1x5+9s=;
 b=tsJSGrEoPC4H7cMwa7gK3X+BttjbzelYL+/mczb9ktHk5toiPXo0MqpPVg4e/B6PvGARLIpg2slVFxPBFD3V01pBKnqR4MpBK7nO/HWlvHvt4t5tsdg2EtZ7Y2SsLOBganOKmoTpsC9jBojnJl2ZfxnTnY+4H5CC9Om5VXh8njQAAdTBuHdvmDFF2Z8gKkDoVRfyj17hwTUN1bNp/3hYVlhydGVU2n3Ix45liwW6uLRfnwZPM5Yud/fA9maOt5bmFPLNs2+hlC74C9MoPRJU8VTSauzCpUz30kpQLClNKsU8zyXfYDn/o+9cIdamBvZudCivAnYd/N6dQOUb0CzZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouk6Y9hmPiQxDkerRGzz/Njzlb2deStC8/0IX1x5+9s=;
 b=1qsTkUDeEImD6T+qdsYJxt5YoSwvI676/sRKgCS4f4KIfX2EPBYSFCo9cB7RzCGuDgZJ20+n+sxHlfh8zd2xyOEvW3ioeGTGn3VH1Nt2lg6kZNrlO5yMheY+HH0TGR42jImhPJI7hQxEtc3ltUvDmKa9msiX7KwE+mwTKaB1+Ok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Tue, 1 Apr
 2025 01:24:29 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 01:24:29 +0000
Message-ID: <a25506c7-c7b0-43de-8fc9-d41c4fd21965@amd.com>
Date: Mon, 31 Mar 2025 19:24:24 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Shengyu Qu <wiagn233@outlook.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
 <TYCPR01MB84376CBEF57BE8D6E1C6830998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <TYCPR01MB84376CBEF57BE8D6E1C6830998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::27) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SJ2PR12MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: b902832c-ee52-4ab5-ae76-08dd70bbf2f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3NOSUxnaTRVUHAvekRRbnhHblZ6YWk2VkxjNlpoVTZrQVpZcHZuOWxQbjhh?=
 =?utf-8?B?a1hEZHhaaWJaVzlqRUJnaVpINmxmNzErOHBJckFWcFF3OGdKZnpjL3dDTXhv?=
 =?utf-8?B?TWRqV2xiS2paYVFiTk9HdmM4WGN3QkFqZlo3SUZSMjVrY1AvNVZHYlNhQ1Rs?=
 =?utf-8?B?QU1aa1preVBTTERzYis5YnYwMW0wZTlXMUV3NXdUMWNseFozV05lb2c2ZXRk?=
 =?utf-8?B?MGJqTFFmVXg4L0huTjE4TUxUOTFJSFNUaXJWN0hHaTVlYkpJeXRUamFKcWMz?=
 =?utf-8?B?ZXNhZlVtY0tlL3VkRWNDYS92T2pIWVJsSjJLWWsvNTJZR0NKTGxocGpJcjdx?=
 =?utf-8?B?dWx1VjV0SG9SK0ZsV000cnNJRWJJRjRRQVJoOVpqN0U0cXNSajRqWkZ5MDdJ?=
 =?utf-8?B?S2Z6Mi9pdHVVRWsrMDg1UjhvblJKYk9hb0tVRURFOFZldjV1YUVkeHBienVS?=
 =?utf-8?B?d3BhQ0hSVVFRZEl5cmYyd1dZbGVUZ1d0eVI4WnFPRTZSejBsZlIrbjlqekFm?=
 =?utf-8?B?dEd1UDBvV1J6azlJQ0NnY25LUmtENktLZy9ReDYxK1FoZ3JTSFNpNE1Eeis4?=
 =?utf-8?B?Q1ZiWUZYMmNYQ1N0Y1hFMGlFZmhDQjRyNlo1UDcxL2k0R3djVm84Z25yclJq?=
 =?utf-8?B?UDN0a0VhRGdnQUMybSt6eVJIWU1RUERhenVHWnRZL0hwLy9Pb1hmbW9oUmY0?=
 =?utf-8?B?ek9tT0xlY1NtVnljZEg2UTlSeFNrNUt3WG5pOXJoVnFhU2syRE5JMjREWGlJ?=
 =?utf-8?B?WE1kbVllODVMVjV1TTY5cHZlRGRac25xMmI3U1RqRXJWOXVFYmhJSG82Y2JD?=
 =?utf-8?B?aDBQQVcrSTRtVi9SVUN2bmh2Q0ZDUThBRUlBa1ZQY3luZHlINUQyMWpBeHVJ?=
 =?utf-8?B?Wmc1dTBlalFUMk0vQWZObXl2OEpsZkJ2SFhscmVrOE1KK3c3OXhkalpiR0lu?=
 =?utf-8?B?MEtFR1NnNUdJL1NVd0pLU1ZGTGNGNlhxZFJxcm1FMkd4ZEE2NFA0WWh6Sk1o?=
 =?utf-8?B?Nm81Q1lMU3NlTDJleXgrYXVUK0FiWG5CTFpIaWYrVC9iVHhFaTZYbC9JNmh1?=
 =?utf-8?B?RVVqNjFrVDhBVVBtYkNsSnl6YUpTVXBnWHRPalVaQVg4aHNraUhSbnM2b0hw?=
 =?utf-8?B?SFhHWkVzVDcvUFBUaDQxaTRmbCs4UG4zd1BCUmxWK0wrZkNtVnRRZEhLdGpt?=
 =?utf-8?B?UTdXbzdBcnFveHpFTWRZMmY2MTdPV1M4UHRqTk1wSnNrcnBWSmloNVNOYXJQ?=
 =?utf-8?B?OFByM25wcVJsaXNjcDVoT0EwMEZXZ1NOL01mNS93bzVlaW5GYWhVUEErcDdZ?=
 =?utf-8?B?RE1oekwwd1NUWjdTZHQzOGQ5UlVxN2ZhSHFhSHBRNnIydm5KU28yMDhsb3pR?=
 =?utf-8?B?YWtoYXdLR3VNUWZxbklOWE5kRVYzODQrTUN6TzdkWnNOK3hDVTQ2UURXeUJp?=
 =?utf-8?B?VkFaZXJDNm9LS1ZITWdId04zWUw5Wm1RL1ZKVjQyMjQ2cUtGeFdLMHZOdXF3?=
 =?utf-8?B?empLcW9LbzJSMUordFh4YTBZakp4aTd4UTR4aUFlK1JqQjZvMkp6N3dBdXBO?=
 =?utf-8?B?ZnhNa3c5eDJTZThPTmE1ZUZxL1BKYldaQ0QyeU9OZHZBYnBOSjJXVzNPWVlK?=
 =?utf-8?B?aW1Sc2o5dHBaT2dPYlFUOGxFMm9GNk5aOTZ3emVxM0QzQ0crVlIvQVpCSkJ0?=
 =?utf-8?B?d04rZ1hjRHpUY1VmSUZiWFdWbHpXWFgxV2pwbG9UTFYzcjhDam5JRlBVSjd5?=
 =?utf-8?B?c0Nmb2pCS3VyRHhDTnZCVzdneUg3UXA1UndwdjJQRkxkWkY5QWtQcVJjSGc1?=
 =?utf-8?B?aWl1TWlZYW9IUkRST0tRcTNUREwvdU0waHdsQ0gwYUFsZENQdXEvQ3ZTUXlB?=
 =?utf-8?Q?qk0pwLs6k2YY/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnJwMHUzRDVXQUdlSUk1VVJBaGw2Mkg4R3pPZWxyZzZYaVV2ZTNGVFozbGI3?=
 =?utf-8?B?cTdHZW1rUFJsR3pId1Yxbk1oQjMzRDhLSzliZGVGZENtb1d2ZkVieVJPWWVP?=
 =?utf-8?B?Z2h6eTBDOHRiK1BIbWtYTlBFYU5TY0QzVlNzM2x4K0V4enYvM1BseWxzWWdo?=
 =?utf-8?B?VGp1YnlENmdLNURvZ2VkQ3ZRNDk1dktJNUdXVG1BaFRBTWNuVWo4ODF3RjVi?=
 =?utf-8?B?aXVKNkhDL2dQVzZLSWJidGdnVUUxakZrQzhCUWNVUEhlaVM1V05ZZmVITGgw?=
 =?utf-8?B?dmNuZGtFVmNRM3pMUEZFcnVBQ3RkVjVVUTdqekhCbzdQQzhyaDVBVFhTa1F6?=
 =?utf-8?B?L2N0U3UyMHNoblU4SU1kYXhWZm9mZGlhUmI0dWVCUG1RN3E1S0UwK1JrckVW?=
 =?utf-8?B?ZjgyY3pHVUpqOGhmb3V4VUZvbmpXbzFTZDFMSzJISTJ6dXlGWmtwd2FwNTZP?=
 =?utf-8?B?dFoxaFQ5UVZ6cWQ4MnlzTGlMdCs3ekl3MFhDcndIcDh0RVdTRUVpVzM4ODg4?=
 =?utf-8?B?SG4vTE11c0tWcXAxMi9rMkxTQS9QVVdKTUVtbFN6NFZrVUdjRjdhbnZpZ29I?=
 =?utf-8?B?aWhxcE1LZ0hqTy9oM3ljc0tjTlFDNS9EZTluRjJyNFhLaUY3N3d2Z1NScFFB?=
 =?utf-8?B?MUpxRCtJZDVtWXYxbVdHek1FY3VmQ1ZvTGt1YTFhdElpSTJNOE5Jb2Fic3hM?=
 =?utf-8?B?WFVkUEQxQVZ1dnYyUHFYN0NTY3ZHdkpHOU43UStsZXN4Y0I3aTE5cWJkZGYx?=
 =?utf-8?B?NXBPYitMOXBjL1lWNjRWNDVUUU1aUWkvKzg1YWpkQ2FjN3Z2cGlPZ1JNbG5I?=
 =?utf-8?B?UDhHVjBUYUpYdXFBb1JtUW5abFhuVG9RU29SdVgvaDhxMTJFWDhZL2FhczNJ?=
 =?utf-8?B?RVhZdUVndjZTa1M1bVBJNzRQU0RQaFMwY2V2dDVTeDFIWElmRy9sZnpJMWsr?=
 =?utf-8?B?ck9DWEVIN2k3ejduUTMxQ3JVaCtwc2s2NmxNazVHOFNEc09HbVhkRHhLOWV6?=
 =?utf-8?B?RzFhVjBjYlVneUxaanNuczI4b0Y4NEg5dE5UaDRWMUIzbEp6dE50MUtnajlq?=
 =?utf-8?B?dEZPN3lBWmU1bXJScU9rOHhvZ3dCZWk2Q2l3K1BjWVBCSGJGWTltQVRnQ0VN?=
 =?utf-8?B?K2Frd0FuajZrZ2o3Vkw2MDk2TlFTMjFhVnhCek1Ia2NSMm1iU21aQ1J1YmRj?=
 =?utf-8?B?Q2FoalhkK2doUWNTU3lsdFFmRHR4OVJac3J2UFJvNndSNG1CTnhYZ0tScnZP?=
 =?utf-8?B?RkQ1aERtME1SVWkwUGs4YUJPWWNXSjNYSWpnVkN3MXVRVkZPVTJIZmxPL1V1?=
 =?utf-8?B?T3B5bVhmTithVmVid3l1TjhzZi92TmxNTXVzZzJ4ZjUwL0RaekhpcEFObVhU?=
 =?utf-8?B?aGlCdUZuVkJYd0NqWTVHeGxXMlMrU0VQUUkrNUtpRzFRN0kvRHE2VWJPTkV0?=
 =?utf-8?B?UUZTUXkxUU5ZSGowVDB1Nnl5ekQzc1BjU0lqOXZVR3VoRFprUy9aMFp3TjFI?=
 =?utf-8?B?Zyt3WFZ5WFRQTkdQQ2lzNDVOd0ZLWm1lRCtJVjZ5SUluN0tmZGJseCtDUTNX?=
 =?utf-8?B?WlJYRVRraFhNOCtmbjZ6QVhObjAzVE5wazlYa2hDc0JTOVo1NjZQY2IyU2FB?=
 =?utf-8?B?NTZvQ2NVN1RXTC91S2NLZWREMnZKSVJRRG5tVkFnRlk5aHRWQjREYnBJcEtv?=
 =?utf-8?B?K3piQ0Z4Q1l6aDNySEFXem0yUVNXeXdwMGdDMDI5TnRoRFVkVHA2Y3hkcEEw?=
 =?utf-8?B?cmtPSkxOTUdaNkp2aTRkd1hqeDM0MXk2amFmNnRDazY2K3JHV3VMNGVQb0Fm?=
 =?utf-8?B?YzNRYzQ0YVZpdnpkeExDdVNRZlQ3UVMyd21rLzF0MkduOUpJQmV2ZVNsTm5u?=
 =?utf-8?B?cHhORmJDbVBRYjdpY2EvTWZHTzRZN1p3OXM0QkpBWE5kRkN5NXdmeTFNSkR6?=
 =?utf-8?B?RjI4bEVjYXh0N1dWMVdieTY0UElrRzJXS2gwRkdxV0lUNTVnVWExdy9sMlJu?=
 =?utf-8?B?NzJJMzlyemtiTG5sb3JnZThNS2xaZVlxcW9sNm9obUUxaTF1ZnFKYm1Rb295?=
 =?utf-8?B?QUFab0doWVpZWmdqWVlMYUFGZysyS0c4V3l4OXplSTJwbjhNQS9mTHRwYUFO?=
 =?utf-8?Q?uLwdyKFyb0GMDA19v+9mEX/F+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b902832c-ee52-4ab5-ae76-08dd70bbf2f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 01:24:29.6256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jm6DJ7LIP/rxBMsqOLtROqmCdIgXNjQeEYos3cYduI9Ev9x2G/IBApXBUACrWSMvBoArj91bDI1M+Dd6G73yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739
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



On 3/31/25 19:04, Shengyu Qu wrote:
>>
> My understanding is that currently the driver would just report no 
> colorop support on cursor plane and actually implement the background 
> plane's colorop on cursor?

No.

> 
>>
>> Again it is up to compositors or apps to determine how color pipeline 
>> and colorops are used (or not). For example, both primary plane and 
>> overlay plane have the same color pipeline, HDR can be enabled only on 
>> overlay but not on primary.
> Still this is the cleanest way to let compositors know and deal with 
> this special cursor plane behavior. Or if compositors want to use all 
> planes with hw colorop + MPO(for power saving or sth.), they have to 
> detect the gpu they are running on and apply a quirk for this. That's a 
> "dirty" implementation.

Unrelated to color pipeline.
