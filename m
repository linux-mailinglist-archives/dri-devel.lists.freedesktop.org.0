Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED3DAE9FFD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 16:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C79010E8C0;
	Thu, 26 Jun 2025 14:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qCTl7KvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483A310E8C0;
 Thu, 26 Jun 2025 14:11:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USij2zj0whsftx/YGWbrgMnV/oTGOmHiFdLLeHkS8rXHbuL/Mmpl7VFCQZ+IyIcpeYjO8F3Ka3rnsSBtwS6EH8pEClTjLHI2gPsJ5zZNDSsoHbAX4UwmInWEc3g73gL8cRRemY4mdtpvixX4U4ys0BFDG0ly1WLCS6XUtRuFuBJHgPwQzwd0cq67L6pI+lAOX+D7h8PpskdKNXAfvW6TbOdhWnlyJ6w85sm9GxLt/Dm5Wga5QvKrpyqRtY/HO8d4n8n89clbT2lJD2X/6PvPfC1SdPVyq/aclaUDcpKfQwj/dqG7MSiUSah5Cb9L6loxlZX75EQh3JSZYbDYd4i7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=on0OPUWLpFYVjD7leXPcsdb9K1eM3vLtx37jWNGWnwA=;
 b=sNyg024ARTNfB9IkWknezHHRxgyRN3QawnnVwtZNhy7CdIt/FrayMNvvZLeWTiPHSnEmnl7HJ2e0EuL6XGqypm51+3VDh0jBt/2Oel+EKOVPg7hLsuxH9Vkq8pXHptZFY+PqvZf4XdD1oWlNQh9OimL04gfnzKmYKEtWUjDtPVauV4dnxTPThF7H4pc8TsXyPvj6fAaiSSVhjV6S5PYEqgybvqoEhuUB/9PGUfOYmBVX3rPv+wXQVPQiHe4jfz9QSQkqTyUyJessnPqZEIItjbP0LFvOTAqUhawi3cOz8POPOr9XNIy+BxJL5ckeK7y/nj/ab34ID3Mu8n7yq1uvZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=on0OPUWLpFYVjD7leXPcsdb9K1eM3vLtx37jWNGWnwA=;
 b=qCTl7KvQ6IA2USrVMFNQSQSVqUgqR4EDypl6rx1uJS93QbC8Hem1xiEn+obpYOGpVBrRxgnFUyp3cPL68/QvmeGoiGYaVczY7mIjEvLMl622UD+kMpp3oDpONXZYRkSgU22jbnQpP/BsgOItoShqnxYmvkLn3NuRGaFgwzwJxJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10)
 by DM4PR12MB9069.namprd12.prod.outlook.com (2603:10b6:8:b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 14:11:53 +0000
Received: from LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec]) by LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec%5]) with mapi id 15.20.8857.019; Thu, 26 Jun 2025
 14:11:53 +0000
Message-ID: <7749f9d5-e8ab-44f3-99b6-b69e6f108022@amd.com>
Date: Thu, 26 Jun 2025 19:41:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/amdgpu: add debugfs support for VM pagetable
 per client
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250624113454.2322935-1-sunil.khatri@amd.com>
 <20250624113454.2322935-4-sunil.khatri@amd.com>
 <cbad6610-dc6c-47e2-a982-6a991d680627@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <cbad6610-dc6c-47e2-a982-6a991d680627@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::14) To LV2PR12MB5776.namprd12.prod.outlook.com
 (2603:10b6:408:178::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5776:EE_|DM4PR12MB9069:EE_
X-MS-Office365-Filtering-Correlation-Id: cf598878-ed6d-4d73-50bb-08ddb4bb66dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmdBaFlIQnB1Sm1FZ1BURGhiWGNRVHJzeUlxSHczZUJUb0JObFhKWjkxckVt?=
 =?utf-8?B?cEtDMDgwbm4xSDVzZDAwR3lTU0tHbmQwNjhta2xiSmlicjdTdzQvdVFsT2Fz?=
 =?utf-8?B?bVZ3M1p3L3VwcTdvVnMvSHhMQVlaenM5cGoxL3g2TkhEN2NJdW5lMHEwT2Ew?=
 =?utf-8?B?SStCOHVwaEsweURtbnBKZi81UWt0RHA4SGpIbzIxeWx1d0dQZWlNTjNveTFF?=
 =?utf-8?B?MnJicHRGR1RhMEdNa0dmS3NGUG9QOXMrWkRRRHk3eXlUbDl3UDF4OS9JYmY2?=
 =?utf-8?B?RXl5YWd3Ykd6anhXTHB4NDRQTkY3cCtWZHJyU1prakFwRjdUdW5pTEl3VmF6?=
 =?utf-8?B?R1ZlejJvTVB1eWhFU3duc3VCcFord0kwQVdpbjNsY3ZQd094a05xd29ORGxq?=
 =?utf-8?B?RmlZNDEzeW5qRnZiVDI2djUwdVdTOFNOODIxKy9wZEhzbGNPWkVBTHFHYmhs?=
 =?utf-8?B?UTJSbEV4ZGpaLy9obEV2dm9zSVJiUFdqRFBDKzFlUWxKVmV3TjBDaDQ3dVFX?=
 =?utf-8?B?WFUxMElMQ25FMElVTzhBVG55NGM2blpHME83aVRlSWZqM1dEdExXRHdUTk81?=
 =?utf-8?B?VUhubkZMeUJBTTBqK3BDMElmb0JPTHZBVjhpOStSeUl1Vk9wTGpqUXJSdXRH?=
 =?utf-8?B?R3MzQjcyVTMyRnZOZGduNnVVVGxhdTlaVEliM3RsdlFIY2J4KytRSlVzMEx0?=
 =?utf-8?B?L3RWTDZSL2R0V2x0cDJaVE9SMkZjOE84OFBIQU9sUUxjTGkwZUNhTFoxbmRZ?=
 =?utf-8?B?dWl5NVVQOER3ZWZPdjdRZmlxYUVZWGRKdS9ZcFUyVllmUTU2bGsvYWZySDQz?=
 =?utf-8?B?OGFNZkx6QmozL2hKamNGMW02MmdPL3pCOWRsdEgwWXdRY0kyOGlneHlPR2po?=
 =?utf-8?B?dnI2cWRDOHI5dnp2L1dEOUkycVhzUDBhZkVIUURIN3Y4aFlpVjJyVjFXWVF6?=
 =?utf-8?B?QjluRFo2cnN3UDFMTHNTMWF3U2taMTdlUWZMTjhnVWJ1Z2NVYTVyMFFvMVM0?=
 =?utf-8?B?OFM0dXU2Q3A4U0JjdUpxdUZBdEx0QzZ6cHFGdzIwUzdRTXArU1BxdW1DK2Uz?=
 =?utf-8?B?a1BaQU9qRjFwSysyRGVScVZCWDBxQ3E2WCtBTjMxNmZzYUlqMGtMeWlUZitn?=
 =?utf-8?B?R1YrdVJWUHBFUS9qNnhtSUxhR2FxVE5CdkxqOHdBRGJ3TC9mc1lBVzRyb0xW?=
 =?utf-8?B?bW9Scy9yUFEyb1haV3JNaWxobHlUS2ZqendvWURpU25BeXhuYVF0Szh5bkF5?=
 =?utf-8?B?NTZNcmdzQUdRUEtKSkdJbURjZ3I4bnV3WGxMZm9wVUZ0WGxFbjRWS2hhWHc2?=
 =?utf-8?B?NEF5TDBNbDZyQVo5dkZpR3BqMUZHekFOa1hDcFhtNjlLR2ZtcE55aUFNaVhT?=
 =?utf-8?B?V09TSVBMWmxBYTZtR1U0dUYvN0pKMG1xVG5EQVFGalJFK3B1VFRGNy92VFI5?=
 =?utf-8?B?MTdvZlNuU2hmWUduVnd6a0pWbTJWM3Q4dytqN2JaNW1laUZJTTBGTmNLSXk5?=
 =?utf-8?B?SzE5VHJBSCtxQi9QbFBkT1pCR2pENXZUYVVneGVEU1pyQ1IzMHY5RU0zSFV1?=
 =?utf-8?B?QjAyd2J2YnpmZ2pKYjdobWYvMDR4N3F4MlZ3YTlRWkJZVlcwMmliY1k2QVVM?=
 =?utf-8?B?UWFHZU15dmhsTHRrWDJEeElDMlU3UHNWMmlaSTl4U01LNTVhL1ZKREQrUlJa?=
 =?utf-8?B?OEFEbEZvNnNaVGZJbDBSZXEzSjFNV1pNMlpxbEFZRkVLeEkraENlc2pNR0dB?=
 =?utf-8?B?NktwUnhnRitYa3hyQXo5Y3FEeElCK3Y2d3BuWXJEWVJ6OTliM3BQUWRxbjZh?=
 =?utf-8?B?ODBNdldNZ0JMaDd3R2FsTWpTYmhwV0E1Ky9Jb3VKTExOWkIrWEI4cGJnQ1lh?=
 =?utf-8?B?ejdhZlh4VWNhWTNEaHVGRkxzT1hYbHo3YjNUZHVBWkhqVUFHZFJRUUcvZENC?=
 =?utf-8?Q?kCrL5siDerY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5776.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3pMM2Z0eVlJOW0zLzNpOUNhYWVybERaV1UzdGRMaW5La2piUlFjRHhlSkpu?=
 =?utf-8?B?VGZSN1RiMG1hTEJlcHo5U3FHaEJnNStaSkZYQ284S3BjWWdGRFdvUndOMTBV?=
 =?utf-8?B?bXF1RE1sMmRJN3NQS2N3V3hFSlM2aXNyaExWNFJKWGF6dVRXN1l4RW4wVEto?=
 =?utf-8?B?V0tjbUZMSUpzUUF6cnlETENUSU9MVno3NWRoaXY4Njg3WGpPOThpa1hjVEp0?=
 =?utf-8?B?eWtyYWFaVytSaGRTYzFWZEw5QkdjcmF5d3QvUWNocm0xek9xOGhhcVNhVVhT?=
 =?utf-8?B?THZVZHVOUStzZWdjam1vSE1tVWhxeHNHRW9ESUZCQVZJa3ZVeWM0bS9aQnFm?=
 =?utf-8?B?UGVBRUFDNGQyOTZudWFTTnM5SVI2aEhndlJXMGRBVmxjRzlIWkpwdUEyZjlT?=
 =?utf-8?B?R2dZZXRiZzZyRTBMdFRsUk5BSEZwdVFraldkVE9idUNKdU8rZ1ZnOVJ1QXRM?=
 =?utf-8?B?R2ZYNGFjVFJHenQxZTFSVjcrWk5mbFYwbm83Q3FHbENOTllqVzNsUENaTGtZ?=
 =?utf-8?B?NHRZNXBFeHllUnhZNVEvcGJ6Sk9leVpLVy9zeXR1bjlBaHYrejl2RGJJcDIx?=
 =?utf-8?B?cDZlRWhEY3JFb0tHMVFUQkxJM3Vpb085dkZGYXJnUVpHcHg0TXR1UTgybVBm?=
 =?utf-8?B?WVFIY3NQeEV5QXFiNHpTSVFZNVc1cUM5WDF4TnUzRVRidXc3ajBqMkU2S28v?=
 =?utf-8?B?bUk3VGhTdytaWUdvZzBlYmN4SUxxVklDcDJKUkVBcXJSSUthYXBLWDZRKzJJ?=
 =?utf-8?B?Ynkxd2FLZnZCMUVXbkR0SGk5RGVOOXJpcVk5Nnd0emk1cXVvcklVbmJpYmdq?=
 =?utf-8?B?bVJyMlFiMXpNK3A4OVF6eFlIN1VObkRpV3pDTG9QQm9ZSVJLV2RIekJqcmZV?=
 =?utf-8?B?Nm1xZkhaTi8wNVZ5eW1SUmtia2gva0lwWk5SenBEcEc4ZFBOekdsN2ZuWjBV?=
 =?utf-8?B?ZUlHSGhrS3djUERPcjJJQ2lPZFBpL0ZJOGZmMk8yWlNVK2p6WHJxbGpUbDYw?=
 =?utf-8?B?QjdGMGFocVg2VVEyWkdjT0o0eWdpcGdTTVRoSkJtMHZpeFhGNTZQMmZzWnpl?=
 =?utf-8?B?cEd4TVZhVG1PTjVWRXhyZVB1bU1xcHVpa2lCbHAwcUs3SEtGWndVbDlNNFlu?=
 =?utf-8?B?OGdJMzEyUW5TcktWRmwvR0ZtZ1BNREZueUFnOWRLMGN1MmcrRlp0L3JjS0Y5?=
 =?utf-8?B?a1k3OGpNeG0yaWVpWVU5OFJLMXNQL2dkdDA1ZFlIbVpmMTRhWSsvQW96WXU1?=
 =?utf-8?B?eTRTcXNFUnp1VkQyRVJJSWpLczRWTStJRjhYc0RLRjJSTVdGQVRpQ2tqNCtR?=
 =?utf-8?B?c1ZJVS9hRkpTMGZKWHZhVFRzaFRXUjI5R0JTNWhsQ1phanhZV2Uvelh6V21U?=
 =?utf-8?B?UDVSN0FjRm5YUWp6L1IrV3BBaGhOU2ZTU3loWFFRYWFqc1R3cnVhUnJ2Wm5i?=
 =?utf-8?B?Y09FSkQ3c0MzdzhDbVRPaUdwWjJFbVR0SDZDK3F4a1pTeElwMWF1RDk5anhY?=
 =?utf-8?B?MUJYelRLZVJqWTRNNm10QzNBRUZiNy9udVNOcTdZeUEzV0l3dm1FVUExNTNH?=
 =?utf-8?B?emJjK0ZVNi9rUWFXbE1RUDUyZmFVdjFzK0dyZ0tWWVBKb0RmelJLWUJjVE8y?=
 =?utf-8?B?VGlQZXhkU3M4bHIydFB4a2FGWWFMN1VtWUYxQ1BGT2JjbWFhWk1uRjk4RGNH?=
 =?utf-8?B?NnVqZHFFd2ZnQzdHYThLSXlUbkZjZWpadjFFSlFtOUFiQlVhZWlWRmJ0QjVU?=
 =?utf-8?B?UWYwd0xYV1BkMEY5K0dpTnh5MDQ2Wjk3eFRwQ21YOExuMWVDamZCbEdVRHFS?=
 =?utf-8?B?ZmhFYlc4SDJadFYzR0VEVWNVZ0dhajVrTC95UHVialZNTHJ0dzZFR21FTjIv?=
 =?utf-8?B?bkc4RXUvempDaHQ3OWV6dFZoTm9YczdJRENTTHMvcHVpMkM4Zmt5TUxJQzln?=
 =?utf-8?B?L0dmS1ZMU25vL1N0TEJ5RDNiQkEwYzVmZTJFclBlQnkydFl6SXRaR3k1ZjE5?=
 =?utf-8?B?RzU5dkFZZTVKTFVFR0k3blhyR2k0RFRBWkh1Qy9KVEQxMEl4RXlUbjZhVUcr?=
 =?utf-8?B?S0QxeHBkb2plVy9uVlZSOEZoK2NhL3NyZ2tmSUw1M21EQytrSkdWVHZ1UGlw?=
 =?utf-8?Q?0kOstTWweuq5/Iedi6PMRPSVH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf598878-ed6d-4d73-50bb-08ddb4bb66dc
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5776.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 14:11:53.7030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oKzu37nUouUf+GQc/HvkSqiGrW0g+8+oHW4rFZdqNQe8vlaEKl/FGxQJOoGwL+xkAzdcmFonCztIq/IccKrjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9069
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


On 6/26/2025 5:48 PM, Christian König wrote:
> On 24.06.25 13:34, Sunil Khatri wrote:
>> Each drm node is associated with a unique client-id.
>> Create a directory for each drm-file in the dri root
>> directory. This directory is unique to hold information
>> related to a client id which is unique in the system
>> irrespective of how many drm devices are on the system.
>>
>> Adding root page table base address of the VM under
>> the client-id node along with the process information
>> in debugfs.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 58 ++++++++++++++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  4 +-
>>   3 files changed, 61 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> index d2ce7d86dbc8..aa912168fd68 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> @@ -1395,7 +1395,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>>   	if (r)
>>   		goto error_pasid;
>>   
>> -	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id);
>> +	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id, file_priv);
>>   	if (r)
>>   		goto error_pasid;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index 3911c78f8282..9e3dd187b597 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -2520,12 +2520,67 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>>   	get_task_comm(vm->task_info->process_name, current->group_leader);
>>   }
>>   
>> +#if defined(CONFIG_DEBUG_FS)
>> +static int amdgpu_pt_info_read(struct seq_file *m, void *unused)
>> +{
>> +	struct drm_file *file;
>> +	struct amdgpu_fpriv *fpriv;
>> +	struct pid *pid;
>> +	struct task_struct *task;
>> +	struct amdgpu_bo *root_bo;
>> +	int r;
>> +
>> +	file = (struct drm_file *)m->private;
>> +	if (!file || !file->driver_priv)
>> +		return -EINVAL;
> This here is racy. It can be that the debugfs file is opened and read in just the exact moment the client it belongs to is closed.'
I dont see drm_file ref_get being taken anywhere in our driver. It's 
directly being used.
>
> You need to do something like this here:
>
> if (!file_ref_get(&file->file->f_ref))
> 	return -EINVAL;
>
> And then an fput(file->file) at the end of the function.
>
> It would probably best to have a helper for that in drm_debugfs.c since that needs to be done for all per client debugfs files.
In case you think we still need it then why not directly user 
file_ref_get and fput itself. why need a new function all together for 
one line.
>
>> +
>> +	fpriv = file->driver_priv;
>> +	if (!fpriv || !fpriv->vm.root.bo)
>> +		return -ENODEV;
>> +
>> +	root_bo = amdgpu_bo_ref(fpriv->vm.root.bo);
>> +	r = amdgpu_bo_reserve(root_bo, true);
>> +	if (r) {
>> +		amdgpu_bo_unref(&root_bo);
>> +		return 0;
>> +	}
>> +
>> +	rcu_read_lock();
>> +	pid = rcu_dereference(file->pid);
>> +	task = pid_task(pid, PIDTYPE_TGID);
>> +
>> +	seq_printf(m, "pid: %d\n", task ? task->pid : 0);
>> +	seq_printf(m, "comm: %s\n", task ? task->comm : "Unset");
> Thinking more about it, the pid and task name should probably be a different driver independent file, e.g. implemented in drm_debugfs.c
>
> Because that is something all drivers should be able to provide.
>
> We could potentially print the same line of information we print in the clints debugfs file.

We do exactly same thing in drm_debugfs in drm_file_err, and i am doing 
exactly same thing here. If not, there in drm_debugfs i will have to 
create one for debugfs file there for each client but doing it here for 
both information in one point here. But i am open any if you think that 
would be a better approach.

Regards
Sunil Khatri

>
> Regards,
> Christian.
>
>> +	seq_printf(m, "pt_base: 0x%llx\n", amdgpu_bo_gpu_offset(fpriv->vm.root.bo));
>> +
>> +	rcu_read_unlock();
>> +	amdgpu_bo_unreserve(root_bo);
>> +	amdgpu_bo_unref(&root_bo);
>> +
>> +	return 0;
>> +}
>> +
>> +static int amdgpu_pt_info_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, amdgpu_pt_info_read, inode->i_private);
>> +}
>> +
>> +static const struct file_operations amdgpu_pt_info_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = amdgpu_pt_info_open,
>> +	.read = seq_read,
>> +	.llseek = seq_lseek,
>> +	.release = single_release,
>> +};
>> +#endif
>> +
>>   /**
>>    * amdgpu_vm_init - initialize a vm instance
>>    *
>>    * @adev: amdgpu_device pointer
>>    * @vm: requested vm
>>    * @xcp_id: GPU partition selection id
>> + * @file: drm_file
>>    *
>>    * Init @vm fields.
>>    *
>> @@ -2533,7 +2588,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>>    * 0 for success, error for failure.
>>    */
>>   int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>> -		   int32_t xcp_id)
>> +		   int32_t xcp_id, struct drm_file *file)
>>   {
>>   	struct amdgpu_bo *root_bo;
>>   	struct amdgpu_bo_vm *root;
>> @@ -2609,6 +2664,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>   	if (r)
>>   		DRM_DEBUG("Failed to create task info for VM\n");
>>   
>> +	debugfs_create_file("pt_info", 0444, file->debugfs_client, file, &amdgpu_pt_info_fops);
>>   	amdgpu_bo_unreserve(vm->root.bo);
>>   	amdgpu_bo_unref(&root_bo);
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> index f3ad687125ad..555afaf867c4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> @@ -487,7 +487,9 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>   			u32 pasid);
>>   
>>   long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout);
>> -int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id);
>> +int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id,
>> +		   struct drm_file *file);
>> +
>>   int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>>   void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>>   int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,
