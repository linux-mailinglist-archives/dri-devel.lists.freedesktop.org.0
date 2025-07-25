Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809ACB125BF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C2410EA19;
	Fri, 25 Jul 2025 20:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qoggC85L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1581310EA19;
 Fri, 25 Jul 2025 20:43:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SU7i+JXqOLtzbeSWXj2HLVXvHRsVjDZQhzsDPOIYjVEjbiZdxYcfDqR2I01/W7vzMdvX9+na7Jgj6JebnVKCEo9BfyNjrcsASA29W1AlVMJz2xZMtUKRksNu6L5Ni0195h5U+gbNZ+S0oSlqrbpKBy9mu6YaOdKFENzUf2bE3/Sm6SQYtcRXZMiJ2XlMgAf0rFQoubcXw/J98i5aCx+iBL02TOdmsQZ1ghNaXNQC5FCmVDyEa9dXDELdd0MTZ+5AAO33TsQvAYUA/3rpmLYP902VmVryS+mb1j+YzydQ6bEXAFX4WlX0rFqB1r/6LtDejcDOs0LAh6PWFv7mgm3hfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BkFzL97UwRNVYfynkIf0DrE0tbt1HRvC9/Ph47xe18=;
 b=jCPpPvFrezPcZDSbLBGIGWGgkJdjOLIt66L0Bg7TQXI0sX0ZJMsmtBE00Olyjh0sbBkfd2qcwxs3j3T2IuDcw9my/jv/o/x3h6wekn3UypdXqdVtOudmrPKpqaVdVHZUdv2KdXyszM1ouAtoYemYi1HTY+sWaArhl2fbKswa/0qYoHtJ4AE8ooj/oyhV7rPukULmISbuJkohn+dyzC5Ytl/hUEWrstiAjFawSsBTjnfGfBMHC1cYOA+0SSzg9jm/xk7ue6rYVleKvYd95zW/TwAOMjmEqJcG8+3NHD1j+tuLnolWXsNQzc//sEzWUjqPihIxZFb/qMTAaJteruL0SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BkFzL97UwRNVYfynkIf0DrE0tbt1HRvC9/Ph47xe18=;
 b=qoggC85LkAi7c7+qX3ssu3oaV1SD7bStEevwHps4y/o019WvxPrvIVkgufaxYuvTW+p3cX2sMA9vJ3Scsw+57YGiRierwzn/v6Lap5DET16kRP+aqPAiEAg/CSi+kx4o2bWAfUBKuBdzuDFzOyvgZwoeToDh11517PCkobN7bryQ75nSU0ntEKy8qVK7fweK6x/+uyujRy/sgKPdIrXM/UZ42UTAv2by2a153m5Z3iTuM/J0Iu1ixj4MrEUXo7/e2cna1cHdUQ/2sMYVwOQ5Jw+AP/x5i9BrArPZLr6swb50TvrkdcpIYPTa/XhKHkhuAZmU4ANCYgm1HO8yBvSOaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by SJ2PR12MB7823.namprd12.prod.outlook.com (2603:10b6:a03:4c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 20:43:25 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 20:43:25 +0000
Message-ID: <3a051c5a-07e0-48f5-b878-c53b7425b1ca@nvidia.com>
Date: Fri, 25 Jul 2025 13:43:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] gpu: nova-core: register: minor grammar and
 spelling fixes
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, steven.price@arm.com
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-1-7b6a762aa1cd@nvidia.com>
 <B1AA6359-7854-4284-B533-F5CA3C18AF34@collabora.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <B1AA6359-7854-4284-B533-F5CA3C18AF34@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|SJ2PR12MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d027bbd-96c8-4f42-c921-08ddcbbbe6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzRjVWxPTDlvYnpGd0tOazVTSjJwdXYyVitId3NjdXBjcGFTY3RLbUhtUXU0?=
 =?utf-8?B?eTFWWjlpaTFVckF0LzNEWXg3NkVTRzJobFdVZExKalpzZTFuck9QNy9nWDJM?=
 =?utf-8?B?Uk96UlJyZWk0Rzk5MHY3U3ptVEFkNVY1YUQvSGFueEdKUFowWndFdCtrdWJJ?=
 =?utf-8?B?bGtBWS8yUkx0RDdIK1FoN1VQaGNldzNsMmk0TEpmVytFU0NGY29YdjBTeW9C?=
 =?utf-8?B?c3ZGZFZ4czY3ZkdvZitCVlcvQVM3VHNGLzBtYUg1MGNnSHh5ZENJMVh4UXJi?=
 =?utf-8?B?Q3ljOWFOdHVybUVNT00zeUphYzFEejFQRExEUk1CZzlCM3pOMTFISmRKdVB3?=
 =?utf-8?B?amUycHZDalVhWld4NzZTdG9NYlJERFJ4N2ZuMEFIbFNTdGJ0TnRRWWFOL3VZ?=
 =?utf-8?B?emFVNlkzZ1VqZ1pCanowVDFaSzJNY1owME0rNEJlS3RMeHhSVWE3QnIySzFi?=
 =?utf-8?B?elZIemt0RHNjQkdRUWtnY0lxbTdtbkliT2ZhSytTeE5uRE8zMTFOMVJ5V3oy?=
 =?utf-8?B?TWpiaTd6OGI4NlM3ektuSnJxS1lmbExBam9Zb2YrcU1aQmF1ZDlKcHVhRjVx?=
 =?utf-8?B?cEVCb2Q4eHE3akluSEd2dTZZem9na1ZwcnFrTXhhTEdtd1lmbUtDMUgzWHlY?=
 =?utf-8?B?UUdVSTJKbEtHNUxoN1FuQXZqSkZEcW15OWw2Q0R0bnc4T1d2UlBiSSs5UVhJ?=
 =?utf-8?B?dEoxU01weUpmR3JqV2RLSHVhekhyOWIrUWhzb28zc0J0dVF0bjQrZXcwWlha?=
 =?utf-8?B?WXYveUNpRWlidFVOY1djaFJaK0FaaFdJc3Z3aW1GT21mY1FJb1VlMDNtd21y?=
 =?utf-8?B?TEViZnRnemU3eHRoMTl2TVJqNzY1QW1KSFlDQS9udVVVTWxEM0RNeGgrekhH?=
 =?utf-8?B?RGlMMmZ1bmpLWktwVjk4RytaN0xKaUpRQUR0b0ZUaHgwTDVacm9tSDluYlBw?=
 =?utf-8?B?R0tFM2ErMDMvK2pJRDROM29jK0JnenNGRnRmSmJDMWpFWStVQlp2TkJnWmMr?=
 =?utf-8?B?WTB5Mll5QWJ6TXI4b3g0d0Zsc3l6V0ZDTkJ3bU4rT2JraTVnWWJ1UVFYbllL?=
 =?utf-8?B?UHRndXJLY0VNandyNnQrd1FkVHg2Vkxrd2huck5iRERhanl0Y0Z3d3gyamdn?=
 =?utf-8?B?QnFNUzRnMk55bUtLcnVoREl4UnpXb3U2RTZkRys3UnF1a1RMU0hmQmg3b2RJ?=
 =?utf-8?B?dEVpdGNZTjNHUXkzVTNRNlk0Qi83c3IzY0VjTnJ3TDRsOXppT1JjYWFDb0Fx?=
 =?utf-8?B?dSthUzFOeXR6T0JtRzl3dXBtTjAwNzdJYUN1d1VyelJTYmlvSmZPWWdzL2tO?=
 =?utf-8?B?bkxmVER0UXo5UlBWQ29LWlNKcXRMMGphVGtrVXN0anN4Ti9yMXpSbndmb1R1?=
 =?utf-8?B?WXlnWGttc21uTUh4WkpCR3FnNGlBSWVtbDdRRWZFTkpkYW1rZkhnamdzbjE4?=
 =?utf-8?B?eHhuV0cvQkw4ZXF4TCtHK2dvMEZzYnpMdytsTXZZSjJXYkZJS05IMERFY1ZI?=
 =?utf-8?B?eHZQQ2FPZlRrbWRBU2J0djRsMnB0M2dzaTZoa201aTYzSEJsSW1WOWxFL1RN?=
 =?utf-8?B?ZHJiVDRaWDlnMzZTeWw2eHBHMU1LOHEwOUFXWlAyamVDSmxNeVhGWmVlMnVY?=
 =?utf-8?B?QVBGVXpsYi9sbGkzb1pIcllVbDNMMFMrY2kydEEydVdmaXlObHhlUGQwQ3Q5?=
 =?utf-8?B?WkpPUjVEMEJDUXpHZVlndThUZHBXbmRrRHowZzRTS1VtVUx1eUVaaUJFeEs0?=
 =?utf-8?B?NXBUMWVEVmgvTTl5WTgveW9qeStYNWZkNEFWU2tOV2NtYTJJS3lVWGVEaEdi?=
 =?utf-8?B?VGZWV3kzd245OC9VWmYwN28xek1HaDN3TG1hNXNUQTZTck44RlpQeVBzd1FS?=
 =?utf-8?B?VXNkSkYrWERuRnhzbkJoSmE1cGt6V25RcExYOFdHQm5uMkZQbGFMSUMveHBG?=
 =?utf-8?Q?mklu82ggY8U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2JMZTVvcm12MzFTQTFMcTkxWFdNZW1OZlVjVGRnakpDNThLeWcyZE9YSFdJ?=
 =?utf-8?B?REFNOG9TcVAwbVROT1N3MERWMG5CM3V1cUswSzdWMTA1WWRWYU16MTV2TWky?=
 =?utf-8?B?SURUMHpITUZnemsrK3JrQnJocDhVcEV3TVZKZWttRDF2MFBwSkdmVG5IcjA5?=
 =?utf-8?B?eWVycFNmMGpJZitjbmhGRXZzaStiRHpFVFNmUWliQjRQUkZTNUIrU0JtQndX?=
 =?utf-8?B?TXF4NDNicE53Q3dNTGJRYjZlUTNFS1VZNVVML2k1QTV3aXpiZkVoaUFrbDhF?=
 =?utf-8?B?bmRvWkN6U3hXcytiYjNVZ1VzQXBwcy9FbS9XUktrSjloTW5mMG51T2tzVnA4?=
 =?utf-8?B?UTFpMkVIM0RSQmNLdW9CcXpNcTNLV2RCUW9iSmVVZnUyR1QxL2h5UEtVS0M5?=
 =?utf-8?B?MDFIR2NOTDZUNUFUU1hjazZqMDlKUklBSDMvckdrQ3FZeEN5YmxMZmNhc3g0?=
 =?utf-8?B?OWdYdFpObEk4QnUvZEwxd2tDTzlBMnMvMjZsVGtXWEJzUVVoNkppT0N4Y0hO?=
 =?utf-8?B?TUYrMlZSclZobjBRTVpMdFFBQ25lWEhEdzVuWEc5MDNnZEpxNXJJenpPMzBW?=
 =?utf-8?B?cG9TcFdDbmFLKzVYdEdEOU5kMXRJbTl6OTRpcDc0RjZIU3lyNGNEcmFNMUxB?=
 =?utf-8?B?Q1dXZUVDSTY2R0taYnNsb2JBaG1QQU0zbVcyVHJaZnZQVWVyRTdMRUxiTDFl?=
 =?utf-8?B?ejBoZ2pqYisxQnBsd3U2OVVjMEoxTlZGZk00UjFJUTdFSzFKT2FGcjR0VzVt?=
 =?utf-8?B?U1lNMDJRQzFZSGd3ZjQ4RFo4VEtTT1k2TWJsRnY0NlUyeTJUT2hXSkQ0UWFi?=
 =?utf-8?B?SzZidmVhOUNCUVpSVVlxVlZGSER5WDMvbFA4WlUvNXVac1hUUkNWT2diK2Fp?=
 =?utf-8?B?T041bDBxV0tKQm0veTNIM2J4SitJbTYweTFoNWhQbnllT1JiOHpUcWRNVkVM?=
 =?utf-8?B?cTdIdTE1SFpIY2VEbDJya25nWmZmakoxejVmRm5QSDVGWXIxbEFsSCt6aVVI?=
 =?utf-8?B?eHZ1bXFMMjNlWEZiMmhMZVBtNGkvckpNc1FZa2UzMktBdThMMWRkU2JvWE9l?=
 =?utf-8?B?SThaNzA1NkFybjNNVXI0dHF2M1NHa1hYSXhYZmpxUkNVb0lRR3Z0YnZwTUs3?=
 =?utf-8?B?bDhsYVVEVlhvSlc3OVZiQWlmaEs3dWZLWjBTWjlMMS9OYWR2clZqNG9TMEZI?=
 =?utf-8?B?Sk5nREJnNWxqY1NyYlR3RmhXY29MckhkNTNxd1ZFcmNKSFBZM09udjJHeGx0?=
 =?utf-8?B?Znh2THRWM1dtN2lzcVF6RUMyM2tFTm5Kblczd3BnS0RmOUwxb0Q0UmhYWVhh?=
 =?utf-8?B?MytjazlKYmJMTUs1UEtHZkY4VGJ3SU8wTDBsbHhGb1V0TjFjdDc0YWlnSFh0?=
 =?utf-8?B?OHlPNnRvTFNMWHdRbnR2SE9lSzJ4MzFETUhzOGtzY0YwR3dUN1l2bVRaT0VG?=
 =?utf-8?B?TVhGVTdqQ0VaVDdNZzM4dFRveUZXMGFOYWVhUjFRQjhlNWhqWmsyWEhXdG9p?=
 =?utf-8?B?Vk04MHZWdzcvU1JNcElaVlFBajcxYS8zcGIvMHpiS3FXQXNHS1B4UWtyRnp5?=
 =?utf-8?B?Rm5ReGpicDVQY0g2NXRUM3Y3RmdnU1Q3STVWbEpDZVNLd0RZM1BPWHNYQ29C?=
 =?utf-8?B?bFhoWDExQjN3OFJOeEdLaEthaUsvVVV1NFl2WS9NczFGem1vcUx2aWhyeXFz?=
 =?utf-8?B?aVhpV2pBaHBaSmd1d1VFWGZzM2N1Znl1UzVISHI2bGk4anA1d0w4dEZoSnlI?=
 =?utf-8?B?WSt2RWorMXdSdFNjbTZqY2l6ZjBNRU1uQzFpTi84RCtySmxodkNWc2ZsTkhT?=
 =?utf-8?B?MGJPVUdOZ3B4WW5oZzBNUWszQklGSHE1WEEyU2R3RGFlV0hEQkRzVnI1Rzl0?=
 =?utf-8?B?UkpMeWhBSmVMNXZvZzZvNjNsenp1dVhud3dEWFB2a25Xd0h2a2ljYnB6eE1M?=
 =?utf-8?B?MEprSTFoNk9GamZwZm1vaHhBYnhHd1dtTnlzZEEwZm96UFJyOGF0clptWTVu?=
 =?utf-8?B?TGhHSEZHT0RYRjBjOXI3L2JEVytVZXM5VFFSMGJJMDJzanQveHE0K3pWeTB6?=
 =?utf-8?B?SVhlY0k5b0JKcUF4Z1I3SWl6QlNnTGRKYnFhckQ1WW55dWNES0o0OHZsby9G?=
 =?utf-8?B?MzJwaUcxRC9iNUVyNnpGYTVva3RVVkZBRUd0eStoRjAwdC9tZGkwOEtzUEhn?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d027bbd-96c8-4f42-c921-08ddcbbbe6d3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 20:43:25.0126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKfbOjHgBSFrv2VgC6l1aKZFqOCW767jk9kYVhrAJOUnfijrBkKfamlWF8p7EXfDrGVNdCbgRXbgOblwWbKNQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7823
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

On 7/25/25 9:14 AM, Daniel Almeida wrote:
> Hi Alex. Thank you and John for working on this in general. It will be useful
> for the whole ecosystem! :)
> 
>> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>
>> From: John Hubbard <jhubbard@nvidia.com>
>>
>> There is only one top-level macro in this file at the moment, but the
>> "macros.rs" file name allows for more. Change the wording so that it
>> will remain valid even if additional macros are added to the file.
>>
>> Fix a couple of spelling errors and grammatical errors, and break up a
>> run-on sentence, for clarity.
>>
>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> drivers/gpu/nova-core/regs/macros.rs | 14 +++++++-------
>> 1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
>> index cdf668073480ed703c89ffa8628f5c9de6494687..864d1e83bed2979f5661e038f4c9fd87d33f69a7 100644
>> --- a/drivers/gpu/nova-core/regs/macros.rs
>> +++ b/drivers/gpu/nova-core/regs/macros.rs
>> @@ -1,17 +1,17 @@
>> // SPDX-License-Identifier: GPL-2.0
>>
>> -//! Macro to define register layout and accessors.
>> +//! `register!` macro to define register layout and accessors.
> 
> I would have kept this line as-is. Users will most likely know the name of the
> macro already. At this point, they will be looking for what it does, so
> mentioning "register" here is a bit redundant IMHO.
> 

Yes, but my real purpose was to allow *other* macros to be added to this
file, because its name ("macros.rs") implies that that may happen. So
referring to "the macro" would, at that point, be confusing, because 
there would be more than one.

So the wording is slightly forward-looking.

>> //!
>> //! A single register typically includes several fields, which are accessed through a combination
>> //! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
>> //! not all possible field values are necessarily valid.
>> //!
>> -//! The macro in this module allow to define, using an intruitive and readable syntax, a dedicated
>> -//! type for each register with its own field accessors that can return an error is a field's value
>> -//! is invalid.
>> +//! The `register!` macro in this module provides an intuitive and readable syntax for defining a
>> +//! dedicated type for each register. Each such type comes with its own field accessors that can
>> +//! return an error if a field's value is invalid.
>>
>> -/// Defines a dedicated type for a register with an absolute offset, alongside with getter and
>> -/// setter methods for its fields and methods to read and write it from an `Io` region.
>> +/// Defines a dedicated type for a register with an absolute offset, including getter and setter
>> +/// methods for its fields and methods to read and write it from an `Io` region.
> 
> +cc Steven Price,
> 
> Sorry for hijacking this patch, but I think that we should be more flexible and
> allow for non-literal offsets in the macro.
> 

I seem to recall that Alex may have something cooked up, for that.

> In Tyr, for example, some of the offsets need to be computed at runtime, i.e.:
> 
> +pub(crate) struct AsRegister(usize);
> +
> +impl AsRegister {
> +    fn new(as_nr: usize, offset: usize) -> Result<Self> {
> +        if as_nr >= 32 {
> +            Err(EINVAL)
> +        } else {
> +            Ok(AsRegister(mmu_as(as_nr) + offset))
> +        }
> +    }
> 
> Or:
> 
> +pub(crate) struct Doorbell(usize);
> +
> +impl Doorbell {
> +    pub(crate) fn new(doorbell_id: usize) -> Self {
> +        Doorbell(0x80000 + (doorbell_id * 0x10000))
> +    }
> 
> I don't think this will work with the current macro, JFYI.
> 
>> ///
>> /// Example:
>> ///
>> @@ -24,7 +24,7 @@
>> /// ```
>> ///
>> /// This defines a `BOOT_0` type which can be read or written from offset `0x100` of an `Io`
>> -/// region. It is composed of 3 fields, for instance `minor_revision` is made of the 4 less
>> +/// region. It is composed of 3 fields, for instance `minor_revision` is made of the 4 least
>> /// significant bits of the register. Each field can be accessed and modified using accessor
>> /// methods:
>> ///
>>
>> -- 
>> 2.50.1
>>
> 
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> 

Thanks for the review!

thanks,
-- 
John Hubbard

