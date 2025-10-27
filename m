Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C1C0F22E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE5010E169;
	Mon, 27 Oct 2025 16:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Cr743bjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9643E10E169
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:03:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9QX29d+fvl852aCvETZTWIUHAgvNOzwVOQf5A1w06nxnXZNVRi5UkemJ28ZMbs2Szdb1iMpcSo4X3TIQQ6Ua1knPq21X3M/AcRm4+iZbd96eZ7fQk0ZAbEe+D/fQG+yBxhy5eooTaA8WJFxOxQ6aT4nDwyB+5log3I47Xni/hduaXC+nRjp8cLwaCj5dtrrXG8q5uRenxJrSMA+2nZ3XoOiRJrX2ooJq+0B7cbcYD9N3+k2ZCJckpRGWaufkPfg415XVIjRgM/E1XamOxqSeXWuBeuvFY3lwnrW22Pd8AJBvpMnq7Oo9Br99v4VS7bMUUlf6WH0fLlWdV/MUDR1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofURNZ2bcbeCxDerFHMurBOS15Lh95O4IrgfDxLRruI=;
 b=AuyqYN01AXJtL12zBzmtySckYoWIRmkyaf6wVTTPmoMaA+FFBdhVHzZXM6RxmZz+jOJ2CntiGYYtr55HejBmeMeN4UBNi7AROey5gf2lIpv7CsoA+25VSAX5YtFJZe1m4KQ/GsbbkYwsPPatuFWZ4xAH5tU+Ge3IvHUPkZh1PSG+Y5CQPpxWVRjf9TLM0Leg3bswbE5f7FXa0jfT7fMEjmv36yddwXbdxa1jnGSuezsIUML2T24EGMCX3MCujlIgtIGTrhBU8nQDd2gOBPXF9Vg5RS+n9V1QDcuZZYT5tnGPJlMDZG5Kg9+W5X0E2GrEXfvkhaHa+W/sXqOorzhofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofURNZ2bcbeCxDerFHMurBOS15Lh95O4IrgfDxLRruI=;
 b=Cr743bjHf1g/ZwY4NjPiv+eoZLun7JGzajKETxr9mjBGXdnNnIxFN45/6tBqul2bf4Dh4lqs9/4Obrkf/zYvRIwiY4mhuYjpDyAAN7cL7BWveFrhgyFDpX9NEQFR6ieyFcTKvfgaDqH4UUBCQDPATZhY9duQ8snsXUWeVmF07hY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA5PPFCB4F033D6.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:02:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:02:52 +0000
Message-ID: <5ff10f7d-e9d4-4d4d-ae82-8986dc28d14b@amd.com>
Date: Mon, 27 Oct 2025 11:01:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Francesco Valla <francesco@valla.it>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
 <yq4btdc5qqukuqps7y53dratmu64ghyifgprlndnk5rbgml4of@rvca75sncvsm>
 <3edea192-6a3f-44f5-b570-7033776e2ce4@suse.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <3edea192-6a3f-44f5-b570-7033776e2ce4@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0126.namprd11.prod.outlook.com
 (2603:10b6:806:131::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA5PPFCB4F033D6:EE_
X-MS-Office365-Filtering-Correlation-Id: f7caec88-3b66-4fb6-df1c-08de157248b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnRGL01HKzc4aTJ0ay9FRjFkT1E1TVYxT2RvcmxTekJnTlYxbTloUWFPZ3Zk?=
 =?utf-8?B?ZzdkNlVVeW5rN3FjU3RUOVo0Qlp0WlpERjNSRHFJejVqdDNPa3RiUkplZDNt?=
 =?utf-8?B?Mk12R0NZM2VqeTZORzU3QnZuSnBzV0kvc2g1TUVDcysxR29OcEtPZEVzUkRS?=
 =?utf-8?B?dmplVURmbHh0aXUrNGc1cnpTMEJFUkdTa0MyMnB2OFhIN2dHNURvOWY5RmFw?=
 =?utf-8?B?b2xjZFBsTEdNRWlnMlNrUUIvaW9yeTNyMDdWaUlMVVhUSE14RlhDTE4zb2RR?=
 =?utf-8?B?cG9zdDlwdjhteG55cFArUzdRRnFZWnlGRkM1NktWZnc5cXVRQXdHcVNBSTRY?=
 =?utf-8?B?QmoxVUdZcmczWXlHaHQyejZOTDYrd0FCZWFvV3RpOUMxY0tjM2tOdXRzekhK?=
 =?utf-8?B?ZWQydEFLb29rZnE4VythaHM1dklqMllwN3BUUXovemc5Y3BpS2gyVWJaR0sx?=
 =?utf-8?B?b09LQTZIU1VuMEVDbFA4amlnN3RMTVYyMDVZR3ZjbnpvSW9BNXJrZVFIWWl1?=
 =?utf-8?B?SVdLMGQ0MWczMmdvYzkrV2k4YXpEQXRNVndWc0FMOHFydW9reWc1VzMzV3pL?=
 =?utf-8?B?VkxxSDRqVnVYY0g1amMzeFZNb0NhQ3JsQVNtaHRadldrMXgvVkdhVnhmVTlj?=
 =?utf-8?B?cUJvQlBVUE1jck5RK1JaOGtnVGIrd09vQ05xNitTWUdZeWZ6eTVuMnJWOE1S?=
 =?utf-8?B?Q1FqRHVlVVRudHN2bFVSbUgvVWF1ZWhLZGtYZjl2dEF1ajFEYmdwWHdMOUxN?=
 =?utf-8?B?MzNzUDdNUmdubHNhYmZWa2xmR2hqeG9hOCtpVFhOMFcwLzRzb293WFVMQzQx?=
 =?utf-8?B?UHU4SFlRTXJGZlVvOVZ4UGpSUi96akN5MFNEd25UaS9xVnNDSW9jL1Y2bkFR?=
 =?utf-8?B?WHBudCs4SDZxeU40cEVpVXFYK2RTZ0VmVkVpTFVjVXhIa2pHcklUS21Ud0I3?=
 =?utf-8?B?ejJBWjlId0ZHVjhaRVhxdzZnUlZGYUVVMXdTcVJ6M1NweTVJQzhEcDkxRUgy?=
 =?utf-8?B?R2tLWlhkL0xKMTBUbkh1aTMyZHYzWkM2SjBVek5TdWhxWXBQUXIxbXZZVWFq?=
 =?utf-8?B?dmNJbjJEamxmL0xkUFZxZWtaekFUT2p2THFJNlg4blVLTkxKMzJqMG1zTWw1?=
 =?utf-8?B?aU1zeFlvZ1k4Q0pYTklBVlY1SjJoMlIwS1BSZ1lOS28zSkdCbVVJK0hOZTAw?=
 =?utf-8?B?VElJUHRtdUpDNGV3L0I1WUhTQ2xpRGM1VWRSR3VtYUZxZ1pMZXR1b3NOOGFk?=
 =?utf-8?B?TTdtSVZWT0NWZGp6UndCTXFpZUtqVWM2L2F1UmMwM25LUUJrUVRzbmp2eldo?=
 =?utf-8?B?cTY5UlpITkdrbDdOSDFQS0lFN2NoOWVENkxaUFkyaldKeW5nMzllT1FlRURC?=
 =?utf-8?B?WUxaYTdmZVhHWmVWcnEzam9QLzY2c254MFJPZU5tTjNuUGpDSHF6TzMyYloz?=
 =?utf-8?B?UndHbWNhcHVmeCsyMmw3Y0cyY2wzY2ZiKzFlclZwdytycmNKNlQxSU9JMFpl?=
 =?utf-8?B?cFNIcGNuTnhNWkdWaTVSVGVWSHo5Vk13OGJEMDExalNjYVl2cHBQV3prUmps?=
 =?utf-8?B?NW53Sys2YThTbmNxK2lWYkFTM2owRUpHYzNqSFk4N1RvalpGM3VvZUpFZVNs?=
 =?utf-8?B?bVNRQlhmd21VdzdLc2hCWDBRbGRKU0JLOFZoMWFnNi8vTXV2YUwzZEtXM3dP?=
 =?utf-8?B?WEhqYkJrRmF2Vi9LZ2Q4ZzBEbExmQXJIbnkrQVdpY3ZhL0VQU2NmYmdiZXJE?=
 =?utf-8?B?SVRRcnU3bXU2SnRUREd5dXN1T2ZyNElCUUx4VHNZWk96Y0w2anFOMk5SN1gy?=
 =?utf-8?B?NkxEbjRjV0VZdmhFaU1iaW96dHcwYzBjREw1NjJZcWFVcFY4RmJEVGZUTzdw?=
 =?utf-8?B?U254bHJFR29MeWdrT05VSlRSVDVnV2hsbzJZWEFLMlRNY2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0w4U2VLRDRaS1BsbTM1OTdFM2I5TGY2VDN0bkc4bDkzMzNTOTJUUmNyekdm?=
 =?utf-8?B?WVpTRGZWcHpidU5RNE4rN2FvSU5MMnQ5c3hOc2I3akNuNTVTWjdReFFScWdY?=
 =?utf-8?B?ckxWZWdJNHVoK3lIWmJVUGVUVVJXeVk1Q1loOW9vMnRCQUZMb05rbW5RWnpW?=
 =?utf-8?B?R1JCWjgyWnBGUTQ4aTBrRHU3TmxES0NWZjVRSzBoZVNLZVVVTEw2NEw4bGEz?=
 =?utf-8?B?OVljTHM2UGdMRUpYS3QrbTZSN2czbzRrMlhMaXFwMGlpelJLcGRzTkR3M2Y0?=
 =?utf-8?B?NUM0U1VSaEV5c2tpMGFONVhPRmhVMFVGdjNLd3JtYVhjWDlIUDBPeUlrdHNK?=
 =?utf-8?B?TzhsMFo5UlUwM2IzZk1EY3puOVg1S3dxM2M3QWhsRHIrNFJ3VStSeXZBc3Fn?=
 =?utf-8?B?RDZlaGJOMlViQnVWb0QzL3k4cGxTeTRkYkg4R3J1NDl3YzdYL1NuVnNtcHFT?=
 =?utf-8?B?d1ZUWHN1dmtLL2cxTk5JaTdJWEJ4NWlkM0hHMFVjdzhTbTM1TFZCSVhPV3hY?=
 =?utf-8?B?WE9SdUNRemhzNnZBL2lQdWZYTVR4QUFJVk9hT1RLeFdFOVZvd2NjczZFd3d3?=
 =?utf-8?B?dnlkcERMZ0ZYbnhtaFNBWXRpL3JhdWNIanhEUlhGNEhCS3o0RisxYVdBdHEx?=
 =?utf-8?B?d3kwaEFkSllTNWd0enI5bkNETS80SWRsQUxWR3NtZlRZaDlRT0Q2RzJuMHRp?=
 =?utf-8?B?TVRab296R2JlTEM5OUdKL3VGSWluazg2SHNLa1d4RWE0S09DVnlJNzZ3TVBx?=
 =?utf-8?B?eHBjMVVUcnZUakg5NjFkSytiZHU3VjdLQUI1eXJnUjZmOHMycVBwN0FMK3Bn?=
 =?utf-8?B?TlUzMkpqbmN0cDFVTVhFV29pSmt1aUhuam5tZVdjeDNsUzVBUE9IS01UenBu?=
 =?utf-8?B?Wmp5QlJlTzdkU0J1bkRMNHpnWkFoRzR2UXpLV3NYUU5CelZoSnJhbmdTTVdw?=
 =?utf-8?B?NW94bFBwajZFM0xucXJ3NzBkV3U4Z0tVWkd6MUhwa1VPaWZCUnR2NXZxQlZC?=
 =?utf-8?B?Wks3RU9qMUJjQk5udSt5NmF6TXhOd05MNDNySFZhcElReG82MERPQUM4Sm5z?=
 =?utf-8?B?WGl2dnNNbThuTUZNSHJYUUMxRFBXSnh2bWk3WWZtUEJNYXpvdE9XVXVobEFH?=
 =?utf-8?B?QlczT3EwVFNIZDdxS2Z6Y1Nhb1Rvd0dSNXVlRWhWWGg5NnJrclBPUGxLQ1lE?=
 =?utf-8?B?QzlUTGVoeXlGODgreUE3a1R0TEEwV3hxSjhVM3FyaXJpdW1Gd2VMU2JBM0V4?=
 =?utf-8?B?Q0k2TldxUzd5cXl6bnRUWFVkV2tNRFpRU1V5NWZYVDNGV1pWaSszckhWeEQ2?=
 =?utf-8?B?aXR2UnBYK3NhT2pDNkRheE5KY0FVdXZRaDNqWGNuTlZqMkM3a0lSaU1yRjhs?=
 =?utf-8?B?akRtd1NGWnpxNlA2UE5qMWJpTzBrbWhWT3poRmgwQVJobVU1bzBJdFgzQmlV?=
 =?utf-8?B?SGpXZEVjTXl4eGIxQk90elZzWk03OFdvTmQxeDMvbllWS0g5MUtDK1dmd21x?=
 =?utf-8?B?VEcyV0RPQ0lRcm40RFNNbVBVM0krQWI5RmJpMWMzTVozZWJ5eHVwbXgzaG5G?=
 =?utf-8?B?bjN6ajNoa2U3bWtzZ1dXYUduUHoyaGhodVQ2SGp6WERxVklkcS9TSXJRVnlo?=
 =?utf-8?B?Rno0NU5SNDZmWnIyU0l2TXJ3U0wrbno2WFlncmxIM3NyWGt2SFRBVVhOSjFQ?=
 =?utf-8?B?R29NcC8vbFcwU0Y2QUVUYU5VRC9vaml2Y2t2SzNhMTZwS1FubW1NMFVrUytv?=
 =?utf-8?B?QmJFWW8ydGo0dnc3SjR6S3locGk2bFNXMDRLQWpzWHM3OCtSWmZKM3ArdFBi?=
 =?utf-8?B?NXhRZjN1RUhkOVZGOGtMcy9ISVZlTk1ubllreHZJamdVYlM3aWNjRWJUdXZj?=
 =?utf-8?B?UHRPSkhTSTVhelZjODA4Snp0cEMrMGYwZnBYd0xCZXBkdVRZL2lrVlpwSTZS?=
 =?utf-8?B?ZUJYQ2pSb2hxcmtOS2dKeEtHTXl5Mmp2U2NsbUZyY1ppOExNREl6a0MwZDNo?=
 =?utf-8?B?Mk9JOFh4ZTRRU0pkQk1xMVA2amFvM1l3b2UxZ2V5K216SmNNQlpqaVdMc0l2?=
 =?utf-8?B?OUFZSTIwZWlESU1vQm1hdDNFVjdoRmxJVUx3bG1oWHpjVnY1UWJzTU1ETmtt?=
 =?utf-8?Q?RyXbH2pdbGTfSRBgPeuQlJUeo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7caec88-3b66-4fb6-df1c-08de157248b7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:02:52.8631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22KESTRZzf1RP6dXFCb5uAf4y0FFbIj3QSUBbWrOetgqygiPJ4rOqJ+d5KF+SsJSztpiHfEZT9w5PVGL8zFsUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCB4F033D6
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

On 10/27/25 7:35 AM, Thomas Zimmermann wrote:
> Hi Francenso, Maxime,
> 
> Am 27.10.25 um 11:09 schrieb Maxime Ripard:
>> Hi,
>>
>> On Mon, Oct 27, 2025 at 12:03:00AM +0100, Francesco Valla wrote:
>>> this patchset adds a new DRM client offering splash functionalities,
>>> able to draw to screen:
>>>
>>>    - a colored background;
>> So, I like that part, and we were recently discussing about this.
> 
> The panic screen has configurable foreground/background colors. Maybe we 
> can harmonize these settings.
> 
>>
>>>    - a single-line text message, which can be set through sysfs or
>>>      directly from the kernel command line;
> 
> Put it into the kernel config.
> 
>>>    - a very simple progress bar, which can be driven through sysfs;
> 
> Once you have options to control these settings from user space, you 
> should do it in user space entirely. As Maxime suggested, please improve 
> plymouth for anything with animation.
> 
>>>    - a static image (optional).
> 
> Board vendors often provide an image, see /sys/firmware/acpi/bgrt/. This 
> is a candidate for display, or the penguin or a custom image. Please 
> make it configurable by Kconfig. Again, if you need policy and 
> heuristics for deciding what to display, you better do this in user space.

I'd actually argue that the static image from BGRT should be the 
preferred priority.  This can make for a nice hand off to Plymouth.

The (UEFI) BIOS already will show this image as soon as the GOP driver 
is loaded.  Bootloaders like GRUB by default will avoid showing anything 
or will overwrite with the exact same image in the same location.  This 
can let the kernel do the same, and then the moment Plymouth takes over 
it could do the same.
> 
>> But there's no reason to have all that in the kernel, and we already
>> have userspace components to do so (plymouth being the main "mainstream"
>> one).
>>
>>> Once compiled inside the kernel, the client can be enabled through the
>>> command line specifying the drm_client_lib.active=splash parameter.
>>>
>>> == Motivation ==
>>>
>>> The motivation behind this work is to offer to embedded system
>>> developers a new path for a simple activation of the display(s)
>>> connected to their system, with the following usecases:
>>>
>>>    - bootsplash - possibly displaying even before init;
>>>    - early activation of the display pipeline, in particular whenever 
>>> one
>>>      component of the pipeline (e.g.: a panel) takes a non-negligible
>>>      time to initialize;
>>>    - recovery systems, where the splash client can offer a simple 
>>> feedback
>>>      for unattended recovery tasks;
>>>    - update systems, where the splash client can offer a simple feedback
>>>      for unattended update tasks.
>> If plymouth cannot be used by embedded systems for some reason, then you
>> should work on a plymouth alternative.
> 
> Agreed. With an updater running in user space, that process should also 
> manage the display update. No need for this in the kernel.
> 
>>
>>> While the first seems the most obvious one, it was the second that acted
>>> as the driver, as in the past I had to implement a ugly workaround using
>>> a systemd generator to kickstart the initialization of a display and
>>> shave ~400ms of boot time.
>>>
>>> The last 2 usecase, instead, are the reason I dropped the "boot" part
>>> from bootsplash.
>>>
>>> == Implementation details ==
>>>
>>> The design is quite simple, with a kernel thread doing the heavylifting
>>> for the rendering part and some locking to protect interactions with it.
>>>
>>> The splash image is loaded using the firmware framework, with the client
>>> expecting to find a binary dump having the right dimensions (width and
>>> height) and FOURCC format for each modeset. Given a 1920x1080 RGB888
>>> modeset, the client will for example search for a firmware named:
>>>
>>>     drm_splash_1920x1080_RG24.raw
>>>
>>> If the firmware cannot be loaded directly, the NOUEVENT sysfs fallback
>>> mechanism is used to let userspace load the appropriate image.
>>>
>>> == Testing ==
>>>
>>> Testing was done on qemu (both with vkms and bochs drivers), on a HDMI
>>> display connected to a Beagleplay and on a ILI9341 SPI display connected
>>> to a i.MX93 FRDM board. All these platforms revealed different
>>> weaknesses that were hopefully removed.
>>>
>>> == Open points / issues ==
>>>
>>> The reason for this being an RFC is that there are several open points:
>>>
>>>    - Support for tiled connectors should be there, but has not been
>>>      tested. Any idea on how to test it?
>> Did you mean tiled formats?
>>
>>>    - I'm not entirely convinced that using the firmware framework to 
>>> load
>>>      the images is the right path. The idea behind it was to re-use the
>>>      compressed firmware support, but then I discovered it is not there
>>>      for built-in firmware.
>> Yeah, firmware loading for this has a few issues (being tedious to setup
>> for when built-in being one). I think just going the fbdev penguin road
>> is a better choice: you provide the path, and it's embedded in the
>> kernel directly.
>>
>>>    - Again on the firmware loading: CONFIG_LOADPIN would interfere with
>>>      sysfs loading.
>>>    - And again: FW_ACTION_NOUEVENT only has one user inside the kernel,
>>>      leading me to think it is de-facto deprecated. And still, uevents
>>>      for firmware loading seem frowned upon these days...
>>>    - Generating binary dumps for... basically any format is not so
>>>      straightforward. I crafted a Python tool with AI help which seems
>>>      to work quite well, but I honestly did not yet understood which is
>>>      the policy for AI-generated code inside the kernel, so it is not
>>>      included in this patch set. All client code is genuine, though.
>> BMP is simple enough to support so we should probably use that instead
>> of a custom format.
> 
> file /sys/firmware/acpi/bgrt/image
> /sys/firmware/acpi/bgrt/image: PC bitmap, Windows 3.x format, 768 x 256 
> x 24, image size 589824, cbSize 589878, bits offset 54
> 
> That should probably be the format for now unless your firmware uses 
> something else natively. Code for reading a BMP file can be found in the 
> efifb driver. [1]
> 
> [1] https://elixir.bootlin.com/linux/v6.17.5/source/drivers/video/fbdev/ 
> efifb.c#L24
> 
> Apart from the criticism for complexity, I do like the idea of having a 
> splash screen.
> 
> Best regards
> Thomas
> 
>>
>> Maxime
> 

