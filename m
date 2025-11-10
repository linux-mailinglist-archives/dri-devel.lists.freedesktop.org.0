Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82489C44F77
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 06:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909EB10E154;
	Mon, 10 Nov 2025 05:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VG9l0NM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C0710E079;
 Mon, 10 Nov 2025 05:13:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPEJRAU12/gFqqrpD9ZWbb2wodlLnK2Fa0xYNYaTPFVXenFw5qU1g79whRhS5gI1mkc9uehH3Ene2/spDQURo3VpOzjEmVBBbJjokO6MeHs0h6MsJY4ul5RG1zJVSaPnRMFNPhFJZ/kKtnXH6uXBJXvOkonWOEjzysakSP7FOumjcD33+a6mRxQp4u/Wzf68Fwp7wTowZUlZG+KUZQmtKqWCagOCPWZ4OiDm7rKmiiOIoB7wJ3lzpA3xrvrh2SnWFpipo2O7dmn4uutBt4M8T+F4jz/obsqWI6rEQDMc73LdgZ/l3sTeAk/sWU5g4Nzq4IwDivfxFgHv5ySVU9xkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIaRcwX0nvP0ObzDWRKBKNcBeBrYqTRt376NNf2i0EY=;
 b=Lf0Qbw4Ol4+A1YN+IBO4VrLzFLxpXYDrobYFpTSSWgN6YJMofvaPLCJOOLuxgiBXMCoMSBPoeJHcV1YiSUmzEPGbeRMNVlPNyE+N+NkE9LrYb0atXRCKt4NAZawaf+bFVS3PcvHMVLiZKdgT9Q3B5WoqcAQp8XZyMaqX9jNquH8Z8jlIErosJlDdP0Hjc/oqc2WIu/xatSSDNEWD4FAQRBeulEQUfpE7K7ICrrnKQSRM/lSEMsHA7JyT5dpzD2IVFbIdlucIemI1COmJvaqqa0WiM5oC9yBriYvG3YHdtGLsS8WeC3gHdMY+rfKBo3bnlNTLOXqe4cJ9lt62qt7L1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIaRcwX0nvP0ObzDWRKBKNcBeBrYqTRt376NNf2i0EY=;
 b=VG9l0NM7QTT6EsssUDjWnfhabuTOgVFR+MkTK86iJ8/MPGhIHAsSZLeTYIGXaE7FgUHlEcCJXjGx4tucD6jbKXxy6D5TC/3OtqY1kfQOmk8PWh6x8UM14i5zIC3usUjtoeWu2UPFkHsEGqU1NRIlCKz/DNMsBvHDgGfor9fiWkB0hiID3Tii+DZ7uFEChzPJ20tZaozB2U5I6jrRrLqT+DEDXDsSuKNT7RFSwb8CH7ztjg+ePKJ1LzoDrzHkPBsHJ46rk0TbxUbb29C0LXrq4QBDOzmfJudJ03H2TS6zcwTs+XmD5iNnP+h+7KnAxYpcdJ3c/m1yhHfSphJjEh1YHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CH3PR12MB9145.namprd12.prod.outlook.com (2603:10b6:610:19b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 05:13:49 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 05:13:49 +0000
Message-ID: <46a79392-3fd4-4481-8db5-1014a5563434@nvidia.com>
Date: Sun, 9 Nov 2025 21:13:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: DRM_RAS for CPER Error logging?!
To: Dave Airlie <airlied@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Lukas Wunner <lukas@wunner.de>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Liu, Xiang(Dean)" <Xiang.Liu@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>,
 Will Davis <wdavis@nvidia.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <aQEVy1qjaDCwL_cc@intel.com>
 <BN9PR12MB52574F4EE2FF679D2230BBEFFCFAA@BN9PR12MB5257.namprd12.prod.outlook.com>
 <aQyftlgZN11YYQXy@intel.com>
 <CAPM=9tybY_LECdMNH6iw5pzxtd2=Z+4vwLt-_kuMQFUaEXsdpw@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAPM=9tybY_LECdMNH6iw5pzxtd2=Z+4vwLt-_kuMQFUaEXsdpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P221CA0054.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::34) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CH3PR12MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9e8c5f-4978-4f6d-c4c9-08de2017ee65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnU0SGZzeWJDWWswVzNidkJnZWFlY3pxMnhJci9pT2ZVaTJGN3hFNXpmRHhs?=
 =?utf-8?B?VnpNRC9UWGpZK2hxN0UxemljUHpqMFhldU9XVk5Ea3I5TnZhY0lVZC8wekFI?=
 =?utf-8?B?NXBrQkhBOEtlamY0eFJOS1NCZlgvL1Iwa0wvcTRzc3VkV3VYRTFtOXVzMHNq?=
 =?utf-8?B?M0N0RjJhMXE2RWZxOHYweXVBcXRXeFNWRGJkbFhhN3JyRzRENG5aTEtya0xq?=
 =?utf-8?B?bU9YRWt4dmVrWmhReFVqbk9SUUZMQW5qc3ZKbyttVC9MTHZLZHd2MTEyNWgy?=
 =?utf-8?B?eDZVNnFpVy9LZWZsNXRmT1g4TnY3R0IxMjljZi9JNzcyY1FJT3QvSlhpNlUr?=
 =?utf-8?B?d3dWRGpJakVnanhhOVQ4b3doSUQ0cHV6R2NLMThXREcvUWRuRFUrZ0JHRXI2?=
 =?utf-8?B?RjJIRVprL2xDeWxEeGU5UWVNZXh2c1B6TFpTUHpXdUI1bHQ0Mml6Zm55SDhi?=
 =?utf-8?B?T3R5bnVyRzZJUGJGZXEzVDE1eW81ZEQ2NmpzMVRhQ1VNVzRzdTZBYVlDSDcz?=
 =?utf-8?B?b3k0dVNiUDZXQzJPd3lSZnF5bWY2RGtQRTNzejVvZXU3eGt3ZndBSllWWmtr?=
 =?utf-8?B?d3o4elNhUGZGbVp1NEx6Qk5DSzJKZEdKaG40d1pxYVFrUTNjMDBIS3IyZmQv?=
 =?utf-8?B?RWpqbXhwRzZacEgrcyt4S2c1M0NINU9lbFBmVUVTQjdOU1hoMG1DaXU2TEpU?=
 =?utf-8?B?Z2FFUHhRNUVHdEhoeWJjMUM0b2ZIay9WaDRrcUxVVVhDVDV3My9POXBxY2tT?=
 =?utf-8?B?U2NpSmdWcXZGQVpwbGhSM2c0cnMxcnhndHZsWHRYbXhTdTBjYmI5UEUyTEI3?=
 =?utf-8?B?ejZRRGNqcXpobkpoQTg0cGR2RFJzV05McGllWWNIOWJJRkl3Y3lBNFU4cXBR?=
 =?utf-8?B?Y2JadnU0K0NkRSt3OGx1STEzZDZ0L2Nod21oRjhpaUFoUzJQUGlhNElmQ2JE?=
 =?utf-8?B?WmxMeTlYUWM0WHMxUGNzWm53M0N3SmswQ0lVaGpPWDREWktHZzU0MXRpUDZO?=
 =?utf-8?B?WWhISmtBWVR1NThDUTh2aFViSmZQM0xWemQ0Qnc3b3V2QUJrM1dRblZXNkZS?=
 =?utf-8?B?cUlRRUt2UThkUTU3ODlKYzZxQkhuR3ZUM29mMXFUMXJjazFWNTYvcVp5OVo0?=
 =?utf-8?B?REtNV3BCYUplOUNFN0d1bk10dkFmQ0ppejJBQ3BSZDVGb0hRMUtEWXE4TGFN?=
 =?utf-8?B?T1h6R1ZrSlh5bHJtTlRCdFJKTVR4ZVI4WVY3a2dsc0dySkNKNUJVZHlLMzJx?=
 =?utf-8?B?R3hJNUFaNEo5bkcyVkNGTW9pOEpOeTByYU4vNW55dTRUdTZYcnJaZzdrWEVW?=
 =?utf-8?B?R1BkTDYzakRmZm51NU5jOGp5bUhWODBDVW85UkxPNWl2WnRYc0orMUFVellK?=
 =?utf-8?B?UHJWUGNsSDFWbXNONERMM1RUNkxmWkJSK1FnaG5Ic01zZUdHWTczZ2xjdFN3?=
 =?utf-8?B?cVROWVp4ei9MR00yVFB6a0VKVHlFK3k3VWNuZGQ0am0vMmZQQWFGRHg4eEFW?=
 =?utf-8?B?UG8rSXc0dVRWSmhRT2UzenAvVXo1YU9sblRmMjM1dUlZL0puZkVId2x4dUJu?=
 =?utf-8?B?TkZ1dG0yYjJyVXl0TTgwcjhuTnV2a2ZtbWV0MitEQWFHY2t0M1R4V0dNOHAw?=
 =?utf-8?B?Unl3Um1TRGx6SUZsYWhSL0c1dU44Z043bFI3RWZORVkwWktxU0FEaTZHd2lW?=
 =?utf-8?B?eFpsWHcvdEN1THBRVllEYmhRTUIxdzlLMVF1eEFRamdVSm56cjZyRU1EN1ds?=
 =?utf-8?B?bTdhOVBxd3V1L3c1SWhkRkJaTU10VC9xcEw1bXhycEplb25VUytUdy8yMEVL?=
 =?utf-8?B?alNSMUhNSzViSlltYlRpOHJyY0FrenpVL0FiQ2FKNlJINjMvTmZsV0tJbFgw?=
 =?utf-8?B?d1o3MkQzK0NEay9GRmpuc2xkWW5BV002REJXQXRscytrQ0pvamZUemVLWm9Y?=
 =?utf-8?Q?lLdaRkBGsDDMXfNKhhGD6INlGMFqh3+z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWhFWXB3YktBend6TXpidEYxM1JvSFl1Z2toWVZBb0ZnOGtvakR1M3VzOWZw?=
 =?utf-8?B?bDA3L2hwN2ZpM3N4MzNXNWVPOW9lL25PazliY3ZOUG9sUzZ2bDJhWFd3dnBa?=
 =?utf-8?B?cVRTRzZmNUtDRTFLb3lCd1NCemJWckJyT1U4TlgwWFBHQWVzUG1vdDEyTk91?=
 =?utf-8?B?RS8xWmtKUlBzT212N3dySEh6RDY0Y3FWTkllc25wckdPOWYwNzRJNmc2aUxH?=
 =?utf-8?B?RGRoc3BlNisyN3BqdFRyRjd1Z1hRVWxYTmNoRGhwNGpVVy8zVk5EM1QvK25U?=
 =?utf-8?B?cERwMTFwS2hoY1lET3ArZGg0Z2UxcnZzYVd1cUREd1N0TXVJN2t4MEJMaHJL?=
 =?utf-8?B?MUFlU29SMEFKbXBxN1hPN2NVZ2RmMjVPeHJPTGp6RnAzZXNNbXhPcGZCcmIv?=
 =?utf-8?B?WGozTzJycTRpbHM4YkQwVEpSclk5TytzR29zb1F5R1ZNU0M0VElyQ1Vobi9P?=
 =?utf-8?B?NjJZZmF1WmloY20vaExXTm8vbnRjYkdwNnRrU0Z3OWFxc3BMSVg1ZWhUOVZF?=
 =?utf-8?B?MjZqMWNBc3FNUFlaQjJVSW9GUThTT3dsR1pNSmFJVk52WkN6TStqWnJFOFNG?=
 =?utf-8?B?YXdWUCtnZXlRWjRKa2NPRngrYWNJcllQTVY0OHB1WmJVSU8vQTdHVEE2Z3dF?=
 =?utf-8?B?Y1lkOXRVbWR6UFNwc1ZMdHNxQTZmMGVibURQNEQzZlZJbUFOZ3ZRdGRRS25H?=
 =?utf-8?B?akZsenVpVkd0TUhJQU10L0hJdjIxWnFvNjNkaUJ4TE40blBWcGZvUkIvbGo0?=
 =?utf-8?B?SjU5djJCYVdQR1dBQ2NnY1JOandoZnpCYmtmbWNTSXR3NUQvQXhmUDVKbEZt?=
 =?utf-8?B?NUdrS3pBYkVKUkNVdUg0N3VNZWEwYnlVOG0rTTV4aHE1eVcvYWZxemYrdHNo?=
 =?utf-8?B?dGFQSjQyancxVXBzNGJVd29TM1NMazNtRkR3Z1dYUCtqNnZlZHl4Vzl3MTFS?=
 =?utf-8?B?Z0xBeEwxLzZtVms2UmpMNTlrVGdtV1JqV0hpTmVJeXFCN281ZEg0engrWTFK?=
 =?utf-8?B?TUR3N1N5RThFUDR0Mmo1eGh0SzQ3VHl4UFkyTVhyUU5COHZwYVljNlhYYXln?=
 =?utf-8?B?cWJNaTd3KzNLcS8xYzVIN3VPZnJaNVdkVmpzOGZhUWszNFFlWEVYenlzZXVw?=
 =?utf-8?B?NURtTmhENjZRWlQveWdGSlBmR0NCT0ltUEtTdUhRQ2VIeVZSeWs4OE00cTVP?=
 =?utf-8?B?TGtFMzBuUU54bzRlTHNXSzdHU1ExWWR2Sm9ZT1pyMWw3SmF3amJMYnhUUDRS?=
 =?utf-8?B?eWlCME9UekVHRGtGcFgvcFFPZG5ldEhOVjlLdzc3OE9lRkFFZ0puYXJGSE5q?=
 =?utf-8?B?MDU1b0JEYTM2WFFvQ2tjalRzaUlIK21JRFVHQ0RYdWNrWDVhN0pPM3d4NlRI?=
 =?utf-8?B?ZnhpV2FuWW1FaGdoQ1Jud2dmdmlremU0VExPTjdRYklFYllCZ2k0UHZpblVI?=
 =?utf-8?B?M1JYTU1uekROeXE4UXRzbEFZZWJRdkE5OWpjMHdhUFhZQjFCQ3ljVWh2TlFy?=
 =?utf-8?B?Slprd2ZSRnBQWDdGbnBjWVJQTHRXSmJDc3BmWFFOYU9WTlJXclZMamRqYkF5?=
 =?utf-8?B?THpUMFk4YXZvR1ZvdVlOd0tLK0xER2hVbStDeXZGYmlnTjlaVitYWkIwVFFk?=
 =?utf-8?B?dTByQ0VXYzM0Q3FtUk1zOVY3allGd0llR2JJcHQ0bjIrbEVpb0xzVUJQR0xI?=
 =?utf-8?B?SzJVVVdOYTBDQVFHZnV5bjRxejlsQXVLZUtuU1Vvdlo2eUx0WVpCbE01eE1m?=
 =?utf-8?B?SFVOcHhMdkJ6MXNFemxNWXk3SWp4bHZCMGsrUHdwa0UxNFZwQkx6aFFVd0Uv?=
 =?utf-8?B?d0cwNzdReTBzRUt6WC9NUFFPZGY2aFN4REJSeTJ1YTN6OFMweWZxWHo1c2lK?=
 =?utf-8?B?NjdNZ1FaUnVyY3RoMVRnbEs2UkNkU1hPenZsakk4UG10cVFSQXNVQy9UMUFy?=
 =?utf-8?B?YzV4aXZFQk5EdWZoNXFlTzc0alZVSWNuQTg0dk92N0VDajFtbVFZb1k2NnVQ?=
 =?utf-8?B?cVNFY3dKT3ExZzREUlYvUXpldURscHp1VmVCYjh5ZC9xOUYwcmNaQURuM25q?=
 =?utf-8?B?OE1vVFZDell0cEE2R3ZsOWpRZlNacy9uaXV1c0tiQ1R3dHJKM2xUT0ZuaDVL?=
 =?utf-8?B?cW5XSGs3ZklySW96a3g1UERQbHYwQ00xRzY0c2RvWjNmWmU5ZFVmc0E1bjhv?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9e8c5f-4978-4f6d-c4c9-08de2017ee65
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 05:13:49.0744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xObdYVHX/1n6EZHutxh3ECXB4b4KvxCp4lrUSB0Xy3YCfr+OULNy6PYQpXxaTWlP2ImSh6MAVUWJvE9oBCE+aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9145
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

On 11/9/25 7:34 PM, Dave Airlie wrote:
> On Thu, 6 Nov 2025 at 23:16, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>>
>> On Wed, Oct 29, 2025 at 02:00:38AM +0000, Zhang, Hawking wrote:
>>>     [AMD Official Use Only - AMD Internal Distribution Only]
>>>     + [1]@Zhou1, Tao and [2]@Liu, Xiang(Dean) for the awareness.
>>>
>>>     RE - AMD folks, would you consider this to replace the current debugfs you
>>>     have?
>>>
>>>     [Hawking]:
>>>
>>>     Replacing the debugfs is not the primary concern.
>>
>> My initial plan was to go with debugfs like you are doing, but
>> I keep hearing complains that debugfs is not global and we need
>> to take into account some cases where debugfs is not available
>> in production images.
>>
>>> The main concern is
>>>     whether drm_ras can effectively support the necessary RAS information for
>>>     all device vendors, as this largely depends on the design of the hardware
>>>     and firmware.
>>
>> I fully agree. This is the main reason I'm doing my best to make the drm-ras
>> the most generic and expansible as possible.
>>
>> node registration with different node types, and names.
>>
>> I imagined something like:
>>
>> [{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
>>
>> based on the format that the current non-standard-cper tracefs uses, with
>> the FRU + CPER. But we could avoid the FRU and make the FRU as node name.
>>
>>>
>>>     AMD is currently evaluating the proposed interface for error logging.
>>
>> The design of the details and the implementation is pretty much open for discussion
>> at this point.
>>
>> What I'm really looking forward is:
>>
>> to know if the path is acceptable overall
>> even if different drivers are opting for different node types?
>>
>> Is there any blocker on using this drm-ras/netlink for the CPER?
> 
> sorry for delay on this, I just had to read what CPER was :-)
> 
> I'm not offended by the idea of using tracefs here, I definitely think
> debugfs is a bad idea coming from the enterprise distro land where we
> don't like having it.
> 
> I'm ccing a few other people that might have opinions on exposing CPER
> compatible logs for RAS purposes from devices, I assume there might be
> more than GPUs wanting to do something like this,
> 
> Dave.

I'm adding Will Davis, who was looking into CPER for our Open RM driver.


thanks,
-- 
John Hubbard

