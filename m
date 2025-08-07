Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0284B1D9CE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 16:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6102410E86A;
	Thu,  7 Aug 2025 14:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="g2fOYa3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013002.outbound.protection.outlook.com [52.101.127.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE3F10E86A;
 Thu,  7 Aug 2025 14:18:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSK6rAnLQvM0OyvuFQNlVO92xw1Mj3dttbBQBsE0hKWUIU5VcXAj5CcImbASVwHRmIOas4OruiT5Rz+nkM/HH84eTCjiWF9Ri/gLCtAaiZmUZNLDmGwABm6wDBO3PQpvTuQBPW6bho04r8Mk2nQHOSoCb3Atf5YjVWl2bBpWmMzy5nMdtznl+p+srxjOkJcA/LsdlmP+d6aQPKAyB/lLSKBiHGRBJnx/n410cljeSAamkAMi/9YlTuQ5869lKDQ9RWbj2PPTKeVuUvn081YSXOiiwkloyn3qhakiPAlZFQkFPFDwqcKOmSW2vCJITDqAUtz2RpnBCTFl/+H7PPvQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDdgPZyi/XUD8kxvRagB6G5FoaLQk20w+UFgNO6Tb8A=;
 b=XjjlDZu1cWXra7UrZHtYpYHXJN21c05J+onfoqDzSo/8Zh5ixOGEmpIiwAGc5eMBOCxIQHy6EX5U9K3eSQISM/BxEDj1s7PgX4BE09ztoeGBxeeB4W117fiorgKc8rja3XVCeeYJCd/uXROSqjlBVSw+BJ34Jq6YSuFXB2NS7FeDVWLb6wADt4ZUPMEa61+/ZADKvqid3pme6xnlOzy9N+Q5YfERjhxX0GbA4NZZUXM+DdJjIZOB6j2s5E2+AYP9CX8hpnNiHjHD3cWJ0X1sU1q8Ncyzb4Yh8NY6wLW4jufkim2n+3t6N8VMrAV/PscAu5WDsi5Y1nlWVwi+NvipFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDdgPZyi/XUD8kxvRagB6G5FoaLQk20w+UFgNO6Tb8A=;
 b=g2fOYa3B3EqEZq/eI9+mjU5A8kRQEDODpRF3Jzx4w8i5MkqYLTGNrAyTEm4Hi431tSmKDLkF1C4gV+2Pu+z5/aWctePs/3fPdEYXFgt/bHjU7D0jSAnQI52TOeivE7IOjDQPavQ2CjrPJ6Tj9/nf05FLBJoBoKx9Mecp5yf6zFoU0YnPQVTtXa82AkdXt98L6MOFzyb1lyM1yhkMrVCSLllZctO/PrgqiZeNyca9DQioFr0ocaFjMWU7B1ntmeX6YuwtjB8a6lGDgKV61zF0E5FRyhxch5hYgEvZ0020+oKmHn65nik57CllususX4iqYj9xfJB5Fs+JcM03+7RgaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SE1PPFDC587DD38.apcprd06.prod.outlook.com (2603:1096:108:1::42c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Thu, 7 Aug
 2025 14:17:58 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 14:17:58 +0000
Message-ID: <063e8aa4-a571-43e7-9a8d-752b04e6dd63@vivo.com>
Date: Thu, 7 Aug 2025 22:17:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Remove redundant __GFP_NOWARN
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20250807134639.555274-1-rongqianfeng@vivo.com>
 <69a17c463c6351b4e0ee03445f59b2d245e85e97@intel.com>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <69a17c463c6351b4e0ee03445f59b2d245e85e97@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SE1PPFDC587DD38:EE_
X-MS-Office365-Filtering-Correlation-Id: b33d53c6-bfdb-4cd3-20d0-08ddd5bd35d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1FINkZ2RCtHVWM2Q3ROelJBL3J3ODZ4ZjJTLzBOa1Y0djF4SVZxRFNGekg0?=
 =?utf-8?B?L0dTRzI0V2FkR2g1blQyU0pIOVFrbFNBem5tWE81VEl1OTRJRFhiUEQ2bVZR?=
 =?utf-8?B?bGgrcmUvQ2JVWUV0RW4wNmNpc21hclBhcFlIUHUzNVRrTW52NmsvZzUzMlhr?=
 =?utf-8?B?dnllTUl3dDc0UDZBVUlmblMveVo1SG05WldzSUQwdFVXZTBZS1NyRHMzOUNM?=
 =?utf-8?B?WkhiRWZxTWhOalRsTHhKR2VKN2EwQmF3eGJLQ0QyLzdKNjZjNU92QVM1MExM?=
 =?utf-8?B?WWluOUZ5S1g2KzRvNlRXOTRDbDZBdlpRV1hTK2R0TkNHMjlQeFprUzRCK0Jz?=
 =?utf-8?B?YkVqeHJCSFl5RTZkTkxvSXNXejZYLzg2MnNVSUZHY3NoOUc1YzdOVWtvdTBP?=
 =?utf-8?B?RGlsTHpoQXRvZFlYNlNxanZEMUxYNkd3WjlKYnhUYTdYa29NMzBSa0w2NUxt?=
 =?utf-8?B?eWFNalJHVUNDT0ZMM1Q2cHh2OFJiOVQ2cFF5UThabHU0NlhERzNiM243bDhB?=
 =?utf-8?B?OTJOTFNjWWhvdlYwRk9TdlBUSWZOWTVPSFdsM0tHeHArMTZudWZ2ZlFGOWtM?=
 =?utf-8?B?cXdVRHJhWmdPVE82TFFFV2JKak11cnhpKzBTSkVvMnBtcUlpUzNEWlJpT3hv?=
 =?utf-8?B?dnc4WFJucUZmaXQ3RmowTkxlRnN2Vk1TUTMvS2VQQjZrTnZWZ3FTL2ZFN2lO?=
 =?utf-8?B?QUk5S1dvaU5rTnM4S2JGOWR6Q0J1d2E0bVBuaG5ES0xkZk1rNmNlNkQ3WGc0?=
 =?utf-8?B?ZGhrWis2eWZtUzFUd3pKdTM0YTdjQytmL2l0OWFLMjVwbzBUaXFoRzE2QUlT?=
 =?utf-8?B?a3dwK1Y5N21ibEVDSzhVQ210U1p3WmZZNm55VTAycG51MzRqMkpKVlZuL092?=
 =?utf-8?B?Rzg3c2tzV0IyL2RGNFp5NWUrdnBQa3piM2VBMFpORFZTbURSWHZJaWxHRHR6?=
 =?utf-8?B?ajhPKy9Ib3kzcDBVVlBER3JqS0VlRHNFUGtaQm4vNFBKdUhoYXdtSkhHU0Fw?=
 =?utf-8?B?eU9IN2RjeTFsQ05Zd2luNXFSejNOQ0hmZitsL29JT1lCc2NvMVJwM0ZCd2hK?=
 =?utf-8?B?eHhhQmhUMTNMb3JkWVpBZnZtVWJwRi9FdVh6VlltS3lZSTlrQ1J6c2gzSDQ2?=
 =?utf-8?B?anh5TVpXTTgxeWJDeU16QTR5NWdHNVRIdDBPSUFQWk9nZ1RNODNMckplQXZ6?=
 =?utf-8?B?Zi83NGY2WGd4QmFWK0RzdjJQQjNvUkMxNkhzcGFXOG8reWpVSFpTb3NWNUdl?=
 =?utf-8?B?NDRkV3NISUdiUURQTDZRR2d4NmhGdlk5MEpsNzNIY0ZWUjVJNEFlSnJNa1Va?=
 =?utf-8?B?OUQ0enlUVXV2SGlVMGxkVjF3Y3JUNlFJSW9UMjRhUDJONWZDWThuNHU0QmNq?=
 =?utf-8?B?QnpodFRZcStTR1pZL2oySWlRdVVIejdYbkhzVHR5QXM1bDVuOWdVRlR3VS9I?=
 =?utf-8?B?MWVaVmtHQXcvN1RlTHdRUmRuK3ZrRDhDNmMyaWhTMk5rcmxSUUJ3UW5rSXBH?=
 =?utf-8?B?cDVjYnFqRUZDRjhNOHg3a0twTk1laHQ4ZUpPc0trSzBFbURGNEFvZ3AzUlQ1?=
 =?utf-8?B?c0NxY2lqdktDUmh2a3VTT2hUSUR4cEFmeUNOUHNRQ1FUQWptanZTTGw2Qm9s?=
 =?utf-8?B?OUJWaUQ1RlZWR2V5RlN0TWlQY2RSbE9RKzN1WXhVTjdwV09nNGNYcWtjaVlB?=
 =?utf-8?B?ZTZVRHpEeXJUU3hNNENJeGk0aitGb2RaVENyVGszeTh4NjVXOXJYZUp1SWlR?=
 =?utf-8?B?ek9ZMExyNlJ1UkxxSTQ4MmhkVUxQd25tZGdZK2NQTldURVdGZzJJMmZBNVBC?=
 =?utf-8?B?UWcwVm9aM2ZTclZhUW9Mcm11SGJiUERiRDc4NFZTWG5DV3FUSzBMbHVsaHlh?=
 =?utf-8?B?Um5xbko5OTZ5bEtIc3Qzd08wQVVvZGZHRkRTcFgrYUVzUnBnUFJ4aFlpRW1k?=
 =?utf-8?B?bUM4dXN3TDBFbFhuc1NwRkxvTmpxbU0xR2dMdGkzNGprdHhiczY5MVVyeG9q?=
 =?utf-8?B?cW5LMWpKbUhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXcwOEhIeEtXQUNSY1g0emROc1AveXFDRUdYMFBEYmxsM1ZielpJL2dCOC9H?=
 =?utf-8?B?M0FMc3V3VlFTaWo4OGVuYXpaMmphTTd5K1lXY2pPUUVxVDVySVBSZ2VTSUVW?=
 =?utf-8?B?TkRIakVWSFF4Z1BrRWhBWUxJeXJsOVBWRVNwa3U2SU1yY2hrVTQ3OXlQSk5D?=
 =?utf-8?B?MmpFcGZsejdrTnU4NFRLOFhwWW1mL3FNOXd4RzNwTXprd1lFdExIbEdlak1C?=
 =?utf-8?B?K29SUFBpWGcvZWxnN0Y0OFF0eHk2NG5zV2t2NmtJVUEvTDB2T1pXZWN5MVNs?=
 =?utf-8?B?N3JTa1Z1TTc4U0hGK0VwakpBbW4vZnY2YjdnY1l4ZllKNUVqYVhMZHp4c2lx?=
 =?utf-8?B?UWZpdEhYRkhSSGgrUW9oZmpvMXIwanhVaE8rbzZuT1h1Qjl5WFBySXdFWFY5?=
 =?utf-8?B?WFdPMDE3aFlWQUhBV1RudG1ib2NqMWZZajRJa1ZsQjNRUVhOTXMrNEQ0dTVp?=
 =?utf-8?B?enhWbzdUY09TcFY2NndJSnpTSTdOQXRZdFc5L1Vzb29RRlUrN0l4dmlPY2I5?=
 =?utf-8?B?S205RTh0aDVwcHZlZm11RDBiN29Ed0FtVm1ReDlLQkVncC9mWGpQeEU0dmtr?=
 =?utf-8?B?OEZLWHA2MnBOdWlPZFgzbk5ydkc2S0dEU09MY21DKzJRbktuNTM0MzM4bGdw?=
 =?utf-8?B?bkJxVWN6WGh3ekFRK0FxOWJGUEp0c2pNRmhxM3dXUDE4cTZYbDczVHJOb0JJ?=
 =?utf-8?B?Y1dOblBVVm5mNEVqUTR5Z1RjRnF3WFpJQXM4aWNmQno1SFlaK3RSQ3F5S25H?=
 =?utf-8?B?dDhRQmY2TUI3VnI4T1BEdGJaMWlZVjBZQWNwcEFhSWhyc1hnKzF2MnQ5YURl?=
 =?utf-8?B?NlZuelRRWFJDOE5qK2preUlBYzhSdStKcFJwdW9XUTFZSXYzU01hOENXZTdL?=
 =?utf-8?B?MkFOaGY0TldaQmliMFVsRGlxNStFbXMwUFUvQUFjUElwbXRqdVhxNDZOZjhO?=
 =?utf-8?B?RXVtVXo0RU1YN2tEenE3U2xMVmNLSnZEMkJ3Vy9CYjhKeEhJSlZ2VjhrUnZK?=
 =?utf-8?B?VnJxYWpMZTlTcjZzNUJGM0FwQmVRN3p5bGh6ZHZvYXlKdHJWWENoRFNtaEJq?=
 =?utf-8?B?MkVMWkpmaEZyUGlVbXVMeGtGWWN5N1YzWnh1WlBwbkM0cFY2UG1RVGZmcHdJ?=
 =?utf-8?B?VzNiL2tsM2orcGkyaDRLMVZuRHRZM01iOTdpclByeFFiYUxONVhxN2hxQSt1?=
 =?utf-8?B?QTF6eVE3RGhzSUFYQUp0VFUwOTFUb0NmSko4TzA4NExaVHdzWi9iamtQSlUx?=
 =?utf-8?B?RnlMV05UTjJEUyt1TjBYTGZoSys0OHlvU2FwR3loRlJZMVdDRHBzOVVRa3FR?=
 =?utf-8?B?cDN0bHhCaklIR01Tc0VMUDE1cVUwTlU4TURyVFVMdWZGRlZhUEVhbXdRTFRM?=
 =?utf-8?B?MEhJR1pEamVWb3hzWGdsTmRMNlExL05xWmRndjVzck1xR05WQ1VCZGZBTDls?=
 =?utf-8?B?Qnp6WnlOaWxNK01RZ2pFTXpBOWRrS3JmNDZBa0s5amtZRmZQWWEyOFZQam5V?=
 =?utf-8?B?OFdtQzB2K0tjTjFpNzhZTWJRUFZYenpBOG9jSmU4OFNtUG9jVDZwSWhnOWFa?=
 =?utf-8?B?OTNGUzA4eXhBYkJ2SmxYVDZxSk1RNlVINS80bGRNc0FTVFowNFphT1lDS1hI?=
 =?utf-8?B?VkR5MVRPWlJzeE1CcHlNdHBuQ0xaeXdwbXZWK2dPWXNCbkpCbzBVS2ZIcGpn?=
 =?utf-8?B?ZzYwblluemJTQjdyNXhKZlh1YnEvQi9GNTNxQVZPK3kvdHVzZElYNDJSd3Bp?=
 =?utf-8?B?dkN1Q1pxVDJZUVhiWDVTYTJ1d2ZzZmVDNXFTZFNkUE1kMklJQ1kwMktpNzNZ?=
 =?utf-8?B?cDZmQVYyaEorazcxV2l4TWNZWEV3elg3ZG90bUhFVlRoRDBqRDQrQTZVbVA0?=
 =?utf-8?B?ZnMxS3E4WGVjSzZtaU9SZm1KcGdTTzhYNDN4eUcvWkVWaEsxMjd6TS9IV2hV?=
 =?utf-8?B?cXRlVElBUGF2NjNtT0ExSnJHZVJoSzM3Mndaak5JODdoeVNyNzZ0UnBkWno5?=
 =?utf-8?B?N2NZcGduVTJGMXVrM2RRSHZTTWUwZFdtLzQwcWozWGo3M3gzOC9CVFNFV3dL?=
 =?utf-8?B?UFdaTHF2NW00VnVBcW14Z2swS3dWTnlyeEN3Z25OM3dNVXFITG9PdkZlU09v?=
 =?utf-8?Q?3xYKdCdzfBQ/cqjzZAN0bTO+P?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b33d53c6-bfdb-4cd3-20d0-08ddd5bd35d2
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 14:17:58.6659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uvnxq0oZgXNBZCcONH+fVM10C+sld+zyJ6130dNb+IFaQDydOGqdd6/7CDBFVW8djT3pjQVpMZlPyzBxXgBhqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFDC587DD38
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


在 2025/8/7 22:13, Jani Nikula 写道:
> On Thu, 07 Aug 2025, Qianfeng Rong <rongqianfeng@vivo.com> wrote:
>> Commit 16f5dfbc851b ("gfp: include __GFP_NOWARN in GFP_NOWAIT")
>> made GFP_NOWAIT implicitly include __GFP_NOWARN.
>>
>> Therefore, explicit __GFP_NOWARN combined with GFP_NOWAIT
>> (e.g., `GFP_NOWAIT | __GFP_NOWARN`) is now redundant. Let's clean
>> up these redundant flags across subsystems.
>>
>> No functional changes.
>>
>> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
>> ---
>>   drivers/gpu/drm/drm_modeset_lock.c               | 4 ++--
> Please separate the drm core changes...
>
>>   drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 4 ++--
>>   drivers/gpu/drm/i915/i915_active.c               | 2 +-
> ...from the i915 driver changes.
>
> Thanks,
> Jani.

Ok.

Thanks,
Qianfeng.

