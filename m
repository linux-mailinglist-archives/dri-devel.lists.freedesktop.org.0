Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0139F4793
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 10:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F8C10E8AA;
	Tue, 17 Dec 2024 09:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xiQGTams";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2052.outbound.protection.outlook.com [40.107.96.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0475010E89F;
 Tue, 17 Dec 2024 09:30:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fT4JrtB+Rv2aFR5c9Hcke9FOttpJwcE0hTiOZCHxl4+RyozsaUmuBJQxs3sIyOvrpzMy0wSqAZPzTBoNV510UGSJ1uQYNHEMYuudA27E3CZ13KGLPyL9hyYhpi9PsoZXLaZYk4kgyZEFkI4BA6q9EsujFA+1H0hp5MJWuRarrf54wf2YH2uNcNansktpXdo36/tswNcOlN7U0x9D0BSK02UGW9KrZux9jIAgWDzThDdFgqf3xz3xvySia9GBl4HGTJ5DJ/FxLZkgiiupGlnA8mVESHp50LgHtF1VvnBjOSBriWLvXxGP3nmRhASf/rJJ9RO0GmNcs8Oh3J438qFB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2jspTWxqTOPlDH5PA7g7UngYTT78bT43ofnmxeAAJQ=;
 b=oVWczSY6TdvdCbU7FFV1GA+/mCTANXl3QnLaOdk9zJO61ZYyjvDj9sn00wgjDjGVdQDAdSCcWwCWpWL4f/x85j53Us6Zzbhh62953zngeBajkQ237OlMkB1vRmqcWuBLPOJY06QFrL8xKSa/SAxkEnWkQHFVhw6i1ExT8pI9DBqfH5S0NLsCq1EcKOGGEGtxoRucjVqZf2/PInXvWhnzgvrboWkwmfPovVc3a4vjoMOyvydMHxhIf5lJdR2yoXb1uQxPVb9eSQngZGj/+ni/WWAVjLwlGBRVIN5VIxhKbo4inE+ge19HfPW6VaeQ1weLmV1RLQLUXHDvbuoq5JAbgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2jspTWxqTOPlDH5PA7g7UngYTT78bT43ofnmxeAAJQ=;
 b=xiQGTamsjoZLhhSFgLfWFRo3DA54k8cwarEZONf5qNE9xGqjN4QsbbYeUPgvmMaUOyAsghP1EyQ5aXSnR0nk5uSkdNR9AhmZvr7xZF2UT2SzZ34LavnH2JQwD21MQSwA4GYS/L4zscNEZa8MmcyCpg+vfAHS4CbnTdj3G5zZHHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by CH2PR12MB4117.namprd12.prod.outlook.com (2603:10b6:610:ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 09:30:51 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:30:51 +0000
Content-Type: multipart/alternative;
 boundary="------------M9HVscxx8SuRrqfRAhhdYTcV"
Message-ID: <b0498534-0aa6-40eb-ad2c-fcac01df828f@amd.com>
Date: Tue, 17 Dec 2024 10:30:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Make the submission path memory reclaim safe
To: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 stable@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <pstanner@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tejun Heo <tj@kernel.org>
References: <20241113134838.52608-1-tursulin@igalia.com>
 <e30428ce-a4d1-43e0-89d3-1487f7af2fde@amd.com>
 <154641d9-be2a-4018-af5e-a57dbffb45d5@igalia.com>
 <61ad957b-34be-4ee5-944f-261c7a412962@igalia.com>
 <14e6e7a3-4077-4074-aaae-3be4b6fd071d@amd.com>
 <0af583a5-85d0-4c33-84e9-3856bde9fb4b@igalia.com>
 <Z2DFKfqzhlyHOjpd@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z2DFKfqzhlyHOjpd@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR4P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::8) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|CH2PR12MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: 16399eb1-42c3-410e-e096-08dd1e7d7f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2dnZXBZaHhXWTc2SHBYMzF6cmg4UXEzeTlDRkVTeDRnTVlYRnByMzFkS2lv?=
 =?utf-8?B?eG9jV1JKeVdtbGlSb3BUeEt1QmtwS2hIcGNUemQ0b2V3TVNydlVlRTlWa2xE?=
 =?utf-8?B?Ym1CbkVGM2JHVk1Nc2xlb2NseU5wN0l5bEttTS9mTW1LOThJS2FlQmpRYmI1?=
 =?utf-8?B?bVF1V3ZTSytvQ29DTkV5MVN1OHZNUlZ5YWtsSjFMWHphNVhpQWZOdUd2NGgz?=
 =?utf-8?B?WWFnTWJMbU40OGxzbTdRZmFvd1NJZUx3Q3ViamprTHdhc3ZGNUZKQlkxS2t4?=
 =?utf-8?B?VWZ1WDlkT2FnMjdoYy9NRWNNejRlZ056YUJKa05qa0ZCemtGVWsvR0t4ZUpt?=
 =?utf-8?B?NCtaMUdIREEycmJodlBtNkczZDZxU0UrQUdsdGdWWmZCSjdBRzMzSXdJSzZj?=
 =?utf-8?B?T0RSVjdiK1pMckZDUWl0ekNsaGtaWFBsV2lLUzJUYWhUYlhocDR5ak5YZWJx?=
 =?utf-8?B?d0ovU1djRWJJWDA3ZnBaWnBvQldpdndaMXZ3T3ppbDFNOFd4dk9yU3lPZmFm?=
 =?utf-8?B?NjhqMk9ibS9KcWU4TkxWZUFYVFFnSm0zRXR4R1ZRQU1QQXgxTzBNZDI4YjBX?=
 =?utf-8?B?aXE1V3FhM3VWdnFJYVlYTlVJSTBZNU9JQi9VeStnV1FQbTl3R2V2K1JNUFZk?=
 =?utf-8?B?Q1orN0tXR2UvTmdLVHluNXJnYllFY2tQU2s1UHVZb2Y0VXpZZnZGMEtTRTVC?=
 =?utf-8?B?eE04ZzNNTnUyUVQ5M2RNaVRzR1ZiRzJzRk5HNEdpaWxxeGxmODNRdmV6azgx?=
 =?utf-8?B?Zmtid1dvYkdjZ29ZVDUrMm1YaVZwVFdXQ0szRW1YTGxWMENLejJMSXR5SENB?=
 =?utf-8?B?azhsczJQK3hNV0RDb1MvQW91dDRLNVQxSktsTnhWRkhRTWdCSThrNjh3SDVn?=
 =?utf-8?B?aVI3a08zT21wTmQzd3plb21hcGk4SnJhUWxWZEVoUGVIdUNqSlBsWWlvSDRw?=
 =?utf-8?B?OTFsdE55RnZTMmQzMU5laUM4aVFDVmlKUG0rNmIvdXA5WUNjTGVtV0F4a0Rr?=
 =?utf-8?B?RzBuNHdBakpDUTVoWU5JakhMekdvN0I3cFZYdktsakVQOTd2RXY5ckQ3RUdj?=
 =?utf-8?B?TDBYdGlDaFg1K1NyWUNWRnF4UGlCMDRNbldOWnQ0aHpaU2dTOVRFeEZITENw?=
 =?utf-8?B?MUV2SzB5VHJpSGZJQWxCY0l6Mld0LzhvVXFQeE9WMGdwTytycXpzWjRHZm9i?=
 =?utf-8?B?dGViRXBuaGF3bVVUR1pPc3hqU0hxVDNLMmlwYWlNZ2d5SkFGbFNkcldJZExj?=
 =?utf-8?B?ei9RVWJSUkZRd3QwdGdBTzdTQVVabFI1WElmeTh0S0R3cVVIM0VacytBa0pk?=
 =?utf-8?B?MmJZNEcxcmo3eFdFTGNRZlI2c3Bib1dNT2hRTHVtK1c3bDF0R2h0WWRuaXl1?=
 =?utf-8?B?YndVcFpvTHZOOVp3M1FLYXh1RlB4RzBhakJua3h4cDF0UzlONFA2QUtReG9T?=
 =?utf-8?B?K2xLc2lWRFJyRkRrSHdxdU5Ta2FKdVcyT2FrZ1VJTUhTR00wcEZXczRaZDA5?=
 =?utf-8?B?YkFyMXNvSVdTaFpGdUFzK2hIT0FRcnA2UEorb3ErbkxpMGVMY2k2WFdPaHdP?=
 =?utf-8?B?ZXdEMXIxR0xWMzYrUDJQQ1IwWXhBeDVxalRxbHNNbzZDOUFyNndIKzJ3M1NU?=
 =?utf-8?B?Uy93cGV4c3hyeG1NR0RXNVVjaTRUbUkxYnFZSTVIQXYvRG9aTFBrK01tWDFo?=
 =?utf-8?B?c0VSNEZhcnppclp2RWFUd3pRZTdCTVJKTGVNUHFpYzdmaUdaZWVjL1BnMDJX?=
 =?utf-8?B?MWhvdk5VelQ0a1drU05OcUZjM090WUp3bHFsUGlOcmIvcHJadnVVcmpBVy9P?=
 =?utf-8?B?TzYzdVo4dmlPS3lsamd5QWdlL2JlVEVxbjFLaGVWbjQ5Unc0M1VrT0VDZUZv?=
 =?utf-8?Q?K5oW+iXc2ZEQi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUl5TElXdVRlZUZtbmxGUjNjcjBObHY5cHRuS1luaWJubWJzWngxZDFvY0tB?=
 =?utf-8?B?ZVBEV2NBQTJONitjeENTekN1SXBtTkVXbFplQlhBUVFmeDFPS3N2d0hCWEtD?=
 =?utf-8?B?aWo5L1Rhb2tPeityTlZDOU9XTUcxV3ArOXRTanlXR0s1VlZmQmNBejI3WFNR?=
 =?utf-8?B?STB1c25hT3VuQXBxY0hHcWx2MG54RzVxeVpTV2sycHUxUGhKV0RONUVXTTVD?=
 =?utf-8?B?TGRHenA4UnV3UTlRUEFxVTd3b21vSmRGeE53ZUI2L0ZMUmpTRTFsN3VqM2lq?=
 =?utf-8?B?VmthRysxRjFpWWF3UmFxVFZzNXlZSjFqbEFQSjNmWEJlVmtsVmc1Mi9pVmo1?=
 =?utf-8?B?SW1vQlo4Vkg4a09tOVpVblAzS01YUmROQ1Z6cm9sMVE5UFlBK2JXOXZLOGNs?=
 =?utf-8?B?ZFFKSzJxVk85RElKUDBMcW5KOHlkNVdFSHBFR1V0RHVhakdXNU5YQ2oySVBu?=
 =?utf-8?B?WFVQSUlvZlplakM2WlNnME5tQkRudkpVbCtETStVNFFFWmp3UkpqS0pHZU9R?=
 =?utf-8?B?TzM3NjVtTGxQZkJHZlpOZ05nSG4rNW5rdEYrWjR3NHVGNTZOeUhneWJKVGh2?=
 =?utf-8?B?R0RTeWNOOW9WU2t1V2dVNW96T2VFcUNYWnJreHF0QnEvTkRLZnlXZWJvV0tZ?=
 =?utf-8?B?MC9INlNjWlBiZGE3a1BockFTL3pFRzNxZ2JwaG5PTFVFL3l5SkJ2NjlNL2R2?=
 =?utf-8?B?Q1pkQVdGS1NqWWVYQlFZcC93VVNMbVFWTFJnYnJlL3lyZjRJQWcwaFF0QUl3?=
 =?utf-8?B?aUJrNm9HcVJpMjU2S3pPTXFPN05MODVjNnZIYWtMK1RQYk95SWpJSElUQ040?=
 =?utf-8?B?ak95U0lRSlE4T0c5WW9WVkZqZ3hrcm1sN0ZBVnFUUTRIaEhrUHVyVUJ5eHRY?=
 =?utf-8?B?YVo4RFhBRmwzYWhwa2M2Z1ZuRVpWSDF1SzZkRnovMTJjc094dS9ObFNJMkt6?=
 =?utf-8?B?TGpIdXBNdDZhWkJIYTlKN1JRbzBDeVlINEVsMFV5c3gxRCs2S0VWUFd5RU9X?=
 =?utf-8?B?UmZ0d2RhOFg0ZXlEM251eHdOaWF1T25rN05ZS2dPZjdDV2RqZFBlTlpONGhN?=
 =?utf-8?B?K3hhSXFCeTdsZy9SajlEaHNHRW1wdHNJbXJJM2haTVBWVlhKWC9mWXQrMmRv?=
 =?utf-8?B?YUwyd0J3N3dJYTc2endva24wYUgrbS9JeXIyNzZNM0JEcHlGbE0vYjhkVis3?=
 =?utf-8?B?RkpVOWp5R09HdDg5WkJacytzeUNjN1liL24zekYxT2Fnb0lySTBxd2liT2FR?=
 =?utf-8?B?ZExoMHJidnp6VzhkRzZMeElrQ0MxUlh5QVN4ZEM2YlBKS2dsWVliL21EWXpn?=
 =?utf-8?B?clF3K2xITGpYRWhQTkRnYTl0UitkaEUvdm9BY3dXRDhMdk5CMytDeGJ2Szc4?=
 =?utf-8?B?ODV4S09wNmVEbThyaXIzUjhwRG9oNWFLUENhM2dkUFF6SmVBVGljaHF3WG0z?=
 =?utf-8?B?bU9RdWZJQW94eW8zUVFrNGgrejRhNTJGaXoyWTZtRE8wVFpWcHlDRjQwMDNi?=
 =?utf-8?B?V3BwZXhlT2pOVHk0c2didGNBbVZ3ZGFxY3R3dzhGSmVUaTZhMkYyV1hYaFpI?=
 =?utf-8?B?STV2THRUb0lYeldlYkVPMmxzbGlSemVnMlpneWFkZHhmamliVHpnUkFWUnpx?=
 =?utf-8?B?ZlBlLzQ5VG1TY1BWdEpOakVod1lwaWgxUk40QXRyUlN1dHQwa1c4d2ZmNVFI?=
 =?utf-8?B?dndQSzRDamFDcWV5aVJSWHpyZDN2TEFVd3M5VDZIQXNGcWFXbFZ2eEJNdFMz?=
 =?utf-8?B?ZC9ZTzdoTHVzeHVaTitZNFFSQ01ObHdhM1R3OHpmaDIrdTlTSUk2dHZDN0pK?=
 =?utf-8?B?dlBMSkZ3L0VuRjdqUFZqWE1CMFlHdlhYd2I5bEVnVWpPejVYNFlSaXBDNTVG?=
 =?utf-8?B?RVR5TEtvb0c5c0dyQ1lCZ3gzZHltR1c4NW9kVE9ROHhUVCtrR2dJV25mNTNT?=
 =?utf-8?B?MUNTTXlvWnJJTEdvQnk2UjBVWFZLNUhtT2VnTWRkeXRZMUNMWlJYRGQvVE15?=
 =?utf-8?B?TTk1M1BNekkzZjBFM3Bma1Bib1MxcmdNcTdzNjZoT0Q4alQyQ3R0MFdMNkxK?=
 =?utf-8?B?MEZhNmd5cFhkenlPSnlDdU1uSlB2NmdrYkVNVmJHYWx4L012YlluTFduTjRE?=
 =?utf-8?Q?EZR7GKvSZPYR9S1IT8R8X+zd9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16399eb1-42c3-410e-e096-08dd1e7d7f6d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 09:30:51.7456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7b1PcH//165n8aV/S9F0XXdCpQHT99M+TFsjKY1D9sKtaEm0CBe7yNdv6tusSgWR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4117
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

--------------M9HVscxx8SuRrqfRAhhdYTcV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.12.24 um 01:26 schrieb Matthew Brost:
> On Fri, Nov 22, 2024 at 02:36:59PM +0000, Tvrtko Ursulin wrote:
>> [SNIP]
>>>>>> Do we have system wide workqueues for that? It seems a bit
>>>>>> overkill that amdgpu has to allocate one on his own.
>>>>> I wondered the same but did not find any. Only ones I am aware
>>>>> of are system_wq&co created in workqueue_init_early().
>>>> Gentle ping on this. I don't have any better ideas that creating a
>>>> new wq.
>>> It took me a moment to realize, but I now think this warning message is
>>> a false positive.
>>>
>>> What happens is that the code calls cancel_delayed_work_sync().
>>>
>>> If the work item never run because of lack of memory then it can just be
>>> canceled.
>>>
>>> If the work item is running then we will block for it to finish.
>>>
> Apologies for the late reply. Alex responded to another thread and CC'd
> me, which reminded me to reply here.
>
> The execution of the non-reclaim worker could have led to a few scenarios:
>
> - It might have triggered reclaim through its own memory allocation.

That is unrelated and has nothing todo with WQ_MEM_RECLAIM.

What we should do is to make sure that the lockdep annotation covers all 
workers who play a role in fence signaling.

> - It could have been running and then context-switched out, with reclaim
>    being triggered elsewhere in the mean time, pausing the execution of
>    the non-reclaim worker.

As far as I know non-reclaim workers are not paused because a reclaim 
worker is running, that would be really new to me.

What happens is that here (from workqueue.c):

* Workqueue rescuer thread function. There's one rescuer for each * 
workqueue which has WQ_MEM_RECLAIM set. * * Regular work processing on a 
pool may block trying to create a new * worker which uses GFP_KERNEL 
allocation which has slight chance of * developing into deadlock if some 
works currently on the same queue * need to be processed to satisfy the 
GFP_KERNEL allocation. This is * the problem rescuer solves.

> In either case, during reclaim, if you wait on a DMA fence that depends
> on the DRM scheduler worker,and that worker attempts to flush the above
> non-reclaim worker, it will result in a deadlock.

Well that is only partially correct.

It's true that the worker we wait for can't wait for DMA-fence or do 
memory allocations who wait for DMA-fences. But WQ_MEM_RECLAIM is not 
related to any DMA fence annotation.

What happens instead is that the kernel always keeps a kernel thread 
pre-allocated so that it can guarantee that the worker can start without 
allocating memory.

As soon as the worker runs there shouldn't be any difference in the 
handling as far as I know.

> The annotation appears correct to me, and I believe Tvrtko's patch is
> indeed accurate. For what it's worth, we encountered several similar
> bugs in Xe that emerged once we added the correct work queue
> annotations.

I think you mean something different. This is the lockdep annotation for 
the workers and not WQ_MEM_RECLAIM.

Regards,
Christian.

>>> There is no need to use WQ_MEM_RECLAIM for the workqueue or do I miss
>>> something?
>>>
>>> If I'm not completely mistaken you stumbled over a bug in the warning
>>> code instead :)
>> Hmm your thinking sounds convincing.
>>
>> Adding Tejun if he has time to help brainstorm this.
>>
> Tejun could likely provide insight into whether my above assessment is
> correct.
>
> Matt
>
>> Question is - does check_flush_dependency() need to skip the !WQ_MEM_RECLAIM
>> flushing WQ_MEM_RECLAIM warning *if* the work is already running *and* it
>> was called from cancel_delayed_work_sync()?
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>>> Apart from that looks good to me.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Signed-off-by: Tvrtko Ursulin<tvrtko.ursulin@igalia.com>
>>>>>>> References: 746ae46c1113 ("drm/sched: Mark scheduler
>>>>>>> work queues with WQ_MEM_RECLAIM")
>>>>>>> Fixes: a6149f039369 ("drm/sched: Convert drm scheduler
>>>>>>> to use a work queue rather than kthread")
>>>>>>> Cc:stable@vger.kernel.org
>>>>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>>>>> Cc: Danilo Krummrich<dakr@kernel.org>
>>>>>>> Cc: Philipp Stanner<pstanner@redhat.com>
>>>>>>> Cc: Alex Deucher<alexander.deucher@amd.com>
>>>>>>> Cc: Christian König<christian.koenig@amd.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  2 ++
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 25
>>>>>>> +++++++++++++++++++++++++
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c |  5 +++--
>>>>>>>    3 files changed, 30 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> index 7645e498faa4..a6aad687537e 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> @@ -268,6 +268,8 @@ extern int amdgpu_agp;
>>>>>>>    extern int amdgpu_wbrf;
>>>>>>> +extern struct workqueue_struct *amdgpu_reclaim_wq;
>>>>>>> +
>>>>>>>    #define AMDGPU_VM_MAX_NUM_CTX            4096
>>>>>>>    #define AMDGPU_SG_THRESHOLD            (256*1024*1024)
>>>>>>>    #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS            3000
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> index 38686203bea6..f5b7172e8042 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> @@ -255,6 +255,8 @@ struct amdgpu_watchdog_timer
>>>>>>> amdgpu_watchdog_timer = {
>>>>>>>        .period = 0x0, /* default to 0x0 (timeout disable) */
>>>>>>>    };
>>>>>>> +struct workqueue_struct *amdgpu_reclaim_wq;
>>>>>>> +
>>>>>>>    /**
>>>>>>>     * DOC: vramlimit (int)
>>>>>>>     * Restrict the total amount of VRAM in MiB for
>>>>>>> testing. The default is 0 (Use full VRAM).
>>>>>>> @@ -2971,6 +2973,21 @@ static struct pci_driver
>>>>>>> amdgpu_kms_pci_driver = {
>>>>>>>        .dev_groups = amdgpu_sysfs_groups,
>>>>>>>    };
>>>>>>> +static int amdgpu_wq_init(void)
>>>>>>> +{
>>>>>>> +    amdgpu_reclaim_wq =
>>>>>>> +        alloc_workqueue("amdgpu-reclaim", WQ_MEM_RECLAIM, 0);
>>>>>>> +    if (!amdgpu_reclaim_wq)
>>>>>>> +        return -ENOMEM;
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void amdgpu_wq_fini(void)
>>>>>>> +{
>>>>>>> +    destroy_workqueue(amdgpu_reclaim_wq);
>>>>>>> +}
>>>>>>> +
>>>>>>>    static int __init amdgpu_init(void)
>>>>>>>    {
>>>>>>>        int r;
>>>>>>> @@ -2978,6 +2995,10 @@ static int __init amdgpu_init(void)
>>>>>>>        if (drm_firmware_drivers_only())
>>>>>>>            return -EINVAL;
>>>>>>> +    r = amdgpu_wq_init();
>>>>>>> +    if (r)
>>>>>>> +        goto error_wq;
>>>>>>> +
>>>>>>>        r = amdgpu_sync_init();
>>>>>>>        if (r)
>>>>>>>            goto error_sync;
>>>>>>> @@ -3006,6 +3027,9 @@ static int __init amdgpu_init(void)
>>>>>>>        amdgpu_sync_fini();
>>>>>>>    error_sync:
>>>>>>> +    amdgpu_wq_fini();
>>>>>>> +
>>>>>>> +error_wq:
>>>>>>>        return r;
>>>>>>>    }
>>>>>>> @@ -3017,6 +3041,7 @@ static void __exit amdgpu_exit(void)
>>>>>>>        amdgpu_acpi_release();
>>>>>>>        amdgpu_sync_fini();
>>>>>>>        amdgpu_fence_slab_fini();
>>>>>>> +    amdgpu_wq_fini();
>>>>>>>        mmu_notifier_synchronize();
>>>>>>>        amdgpu_xcp_drv_release();
>>>>>>>    }
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>> index 2f3f09dfb1fd..f8fd71d9382f 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>> @@ -790,8 +790,9 @@ void amdgpu_gfx_off_ctrl(struct
>>>>>>> amdgpu_device *adev, bool enable)
>>>>>>>                            AMD_IP_BLOCK_TYPE_GFX, true))
>>>>>>>                        adev->gfx.gfx_off_state = true;
>>>>>>>                } else {
>>>>>>> - schedule_delayed_work(&adev->gfx.gfx_off_delay_work,
>>>>>>> -                          delay);
>>>>>>> +                queue_delayed_work(amdgpu_reclaim_wq,
>>>>>>> + &adev->gfx.gfx_off_delay_work,
>>>>>>> +                           delay);
>>>>>>>                }
>>>>>>>            }
>>>>>>>        } else {

--------------M9HVscxx8SuRrqfRAhhdYTcV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 17.12.24 um 01:26 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:Z2DFKfqzhlyHOjpd@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Nov 22, 2024 at 02:36:59PM +0000, Tvrtko Ursulin wrote:
</pre>
      <blockquote type="cite">[SNIP]<span style="white-space: pre-wrap">
</span>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap=""></pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Do we have system wide workqueues for that? It seems a bit
overkill that amdgpu has to allocate one on his own.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
I wondered the same but did not find any. Only ones I am aware
of are system_wq&amp;co created in workqueue_init_early().
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
Gentle ping on this. I don't have any better ideas that creating a
new wq.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
It took me a moment to realize, but I now think this warning message is
a false positive.

What happens is that the code calls cancel_delayed_work_sync().

If the work item never run because of lack of memory then it can just be
canceled.

If the work item is running then we will block for it to finish.

</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Apologies for the late reply. Alex responded to another thread and CC'd
me, which reminded me to reply here.

The execution of the non-reclaim worker could have led to a few scenarios:

- It might have triggered reclaim through its own memory allocation.</pre>
    </blockquote>
    <br>
    That is unrelated and has nothing todo with WQ_MEM_RECLAIM.<br>
    <br>
    What we should do is to make sure that the lockdep annotation covers
    all workers who play a role in fence signaling.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Z2DFKfqzhlyHOjpd@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">- It could have been running and then context-switched out, with reclaim
  being triggered elsewhere in the mean time, pausing the execution of
  the non-reclaim worker.</pre>
    </blockquote>
    <br>
    As far as I know non-reclaim workers are not paused because a
    reclaim worker is running, that would be really new to me.<br>
    <br>
    What happens is that here (from workqueue.c):<br>
    <br>
    <pre style="box-sizing: inherit; font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 0.9em; line-height: 1.2; padding: 1em 0px 4em; color: rgb(0, 0, 0); margin: 0px; min-height: 100%; tab-size: 8; white-space: pre; word-spacing: 0px; word-break: normal; overflow-wrap: normal; hyphens: none; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span id="codeline-3414" style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span class="cm" style="box-sizing: inherit; vertical-align: top; color: slategray; font-style: italic;"> * Workqueue rescuer thread function.  There's one rescuer for each</span>
</span><span id="codeline-3415" style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span class="cm" style="box-sizing: inherit; vertical-align: top; color: slategray; font-style: italic;"> * workqueue which has WQ_MEM_RECLAIM set.</span>
</span><span id="codeline-3416" style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span class="cm" style="box-sizing: inherit; vertical-align: top; color: slategray; font-style: italic;"> *</span>
</span><span id="codeline-3417" style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span class="cm" style="box-sizing: inherit; vertical-align: top; color: slategray; font-style: italic;"> * Regular work processing on a pool may block trying to create a new</span>
</span><span id="codeline-3418" style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span class="cm" style="box-sizing: inherit; vertical-align: top; color: slategray; font-style: italic;"> * worker which uses GFP_KERNEL allocation which has slight chance of</span>
</span><span id="codeline-3419" style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span class="cm" style="box-sizing: inherit; vertical-align: top; color: slategray; font-style: italic;"> * developing into deadlock if some works currently on the same queue</span>
</span><span id="codeline-3420" style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span class="cm" style="box-sizing: inherit; vertical-align: top; color: slategray; font-style: italic;"> * need to be processed to satisfy the GFP_KERNEL allocation.  This is</span>
</span><span id="codeline-3421" style="box-sizing: inherit; vertical-align: top; display: block; padding-left: 1em;"><span class="cm" style="box-sizing: inherit; vertical-align: top; color: slategray; font-style: italic;"> * the problem rescuer solves.</span></span></pre>
    <blockquote type="cite" cite="mid:Z2DFKfqzhlyHOjpd@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">In either case, during reclaim, if you wait on a DMA fence that depends
on the DRM scheduler worker,and that worker attempts to flush the above
non-reclaim worker, it will result in a deadlock.</pre>
    </blockquote>
    <br>
    Well that is only partially correct.<br>
    <br>
    It's true that the worker we wait for can't wait for DMA-fence or do
    memory allocations who wait for DMA-fences. But WQ_MEM_RECLAIM is
    not related to any DMA fence annotation.<br>
    <br>
    What happens instead is that the kernel always keeps a kernel thread
    pre-allocated so that it can guarantee that the worker can start
    without allocating memory.<br>
    <br>
    As soon as the worker runs there shouldn't be any difference in the
    handling as far as I know.<br>
    <br>
    <blockquote type="cite" cite="mid:Z2DFKfqzhlyHOjpd@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">The annotation appears correct to me, and I believe Tvrtko's patch is
indeed accurate. For what it's worth, we encountered several similar
bugs in Xe that emerged once we added the correct work queue
annotations.</pre>
    </blockquote>
    <br>
    I think you mean something different. This is the lockdep annotation
    for the workers and not WQ_MEM_RECLAIM.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Z2DFKfqzhlyHOjpd@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">There is no need to use WQ_MEM_RECLAIM for the workqueue or do I miss
something?

If I'm not completely mistaken you stumbled over a bug in the warning
code instead :)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hmm your thinking sounds convincing.

Adding Tejun if he has time to help brainstorm this.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Tejun could likely provide insight into whether my above assessment is
correct.</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:Z2DFKfqzhlyHOjpd@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">

Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Question is - does check_flush_dependency() need to skip the !WQ_MEM_RECLAIM
flushing WQ_MEM_RECLAIM warning *if* the work is already running *and* it
was called from cancel_delayed_work_sync()?

Regards,

Tvrtko

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Apart from that looks good to me.

Regards,
Christian.

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">
Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@igalia.com">&lt;tvrtko.ursulin@igalia.com&gt;</a>
References: 746ae46c1113 (&quot;drm/sched: Mark scheduler
work queues with WQ_MEM_RECLAIM&quot;)
Fixes: a6149f039369 (&quot;drm/sched: Convert drm scheduler
to use a work queue rather than kthread&quot;)
Cc: <a class="moz-txt-link-abbreviated" href="mailto:stable@vger.kernel.org">stable@vger.kernel.org</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Danilo Krummrich <a class="moz-txt-link-rfc2396E" href="mailto:dakr@kernel.org">&lt;dakr@kernel.org&gt;</a>
Cc: Philipp Stanner <a class="moz-txt-link-rfc2396E" href="mailto:pstanner@redhat.com">&lt;pstanner@redhat.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
---
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 25
+++++++++++++++++++++++++
&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c |&nbsp; 5 +++--
&nbsp; 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 7645e498faa4..a6aad687537e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -268,6 +268,8 @@ extern int amdgpu_agp;
&nbsp; extern int amdgpu_wbrf;
+extern struct workqueue_struct *amdgpu_reclaim_wq;
+
&nbsp; #define AMDGPU_VM_MAX_NUM_CTX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096
&nbsp; #define AMDGPU_SG_THRESHOLD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (256*1024*1024)
&nbsp; #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3000
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 38686203bea6..f5b7172e8042 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -255,6 +255,8 @@ struct amdgpu_watchdog_timer
amdgpu_watchdog_timer = {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .period = 0x0, /* default to 0x0 (timeout disable) */
&nbsp; };
+struct workqueue_struct *amdgpu_reclaim_wq;
+
&nbsp; /**
&nbsp;&nbsp; * DOC: vramlimit (int)
&nbsp;&nbsp; * Restrict the total amount of VRAM in MiB for
testing. The default is 0 (Use full VRAM).
@@ -2971,6 +2973,21 @@ static struct pci_driver
amdgpu_kms_pci_driver = {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dev_groups = amdgpu_sysfs_groups,
&nbsp; };
+static int amdgpu_wq_init(void)
+{
+&nbsp;&nbsp;&nbsp; amdgpu_reclaim_wq =
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alloc_workqueue(&quot;amdgpu-reclaim&quot;, WQ_MEM_RECLAIM, 0);
+&nbsp;&nbsp;&nbsp; if (!amdgpu_reclaim_wq)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;
+
+&nbsp;&nbsp;&nbsp; return 0;
+}
+
+static void amdgpu_wq_fini(void)
+{
+&nbsp;&nbsp;&nbsp; destroy_workqueue(amdgpu_reclaim_wq);
+}
+
&nbsp; static int __init amdgpu_init(void)
&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;
@@ -2978,6 +2995,10 @@ static int __init amdgpu_init(void)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (drm_firmware_drivers_only())
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;
+&nbsp;&nbsp;&nbsp; r = amdgpu_wq_init();
+&nbsp;&nbsp;&nbsp; if (r)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto error_wq;
+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r = amdgpu_sync_init();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto error_sync;
@@ -3006,6 +3027,9 @@ static int __init amdgpu_init(void)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_sync_fini();
&nbsp; error_sync:
+&nbsp;&nbsp;&nbsp; amdgpu_wq_fini();
+
+error_wq:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;
&nbsp; }
@@ -3017,6 +3041,7 @@ static void __exit amdgpu_exit(void)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_acpi_release();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_sync_fini();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fence_slab_fini();
+&nbsp;&nbsp;&nbsp; amdgpu_wq_fini();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmu_notifier_synchronize();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_xcp_drv_release();
&nbsp; }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 2f3f09dfb1fd..f8fd71d9382f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -790,8 +790,9 @@ void amdgpu_gfx_off_ctrl(struct
amdgpu_device *adev, bool enable)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_IP_BLOCK_TYPE_GFX, true))
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.gfx_off_state = true;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
- schedule_delayed_work(&amp;adev-&gt;gfx.gfx_off_delay_work,
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delay);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; queue_delayed_work(amdgpu_reclaim_wq,
+ &amp;adev-&gt;gfx.gfx_off_delay_work,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delay);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------M9HVscxx8SuRrqfRAhhdYTcV--
