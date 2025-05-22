Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B320AC0BA6
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D5910E2B9;
	Thu, 22 May 2025 12:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z777slBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C173310E296;
 Thu, 22 May 2025 12:34:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qv4Z8AljAj6BMXkLn/dyaCOCE6AM+PRN80OZZPekpgt2LoigJ8Pxfq06Z0L3auxRRrvOXwb4T2xF8pRaQUqwSJ2JtqCyiedgZo5I376yyiKTQvf1bdBW/HTJ+2Xj9UUfjCcnIawkqbZPWW65C7VPSCdaYMvdnOR5F/zf2/mnREOGJKKfnpZhAzvgt8QgpCKxr5TuV0H6ZzuXhkHBM4Q8BD5EXShxnWavJE3tIfwPz6SlNtEQpN8uewMXF5EvcL+mUKeEJPPrMQ/Yfm1LfeQHd/S+3DwW/4k4dEDszgxUyMHFjpILUwKNQOlyxahOC5IH0sh6wAFOQs2smMSI7Hwsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEG32OwmoQjO/y+69/sqrx7X0J02ZwqWs1cCv+KEnWc=;
 b=LD+bOYozzySJJ4A3UtdEpz/FpDNYw08Nds7zLqlb/oCt3ma00xfc5K/OCc6kty+xc4KuTPr3to76cLG6lr8jy996qJpzHvYfQJSlKEtahUq9dUn208YdG97jhtOdFs0tdqiEvlfdC31KkJu02qpahzbJjgUQF2fiiDKzgJ71xcPYLOoUgcQufK41vIrufoqoaLpp6nxuBWzfLLugp+1/KkTu5WahWWmmnL2g2//Y9skIRdGgFwiaUfE7LsvinQpcRjW/bkTvln/ujY8GXBcHpXp1pM1LygPO0rHGnkce8bTJ1M7rYLIyrSo2UhQ7wZ1g4N4dAtlDlSF6+FsrWiGLnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEG32OwmoQjO/y+69/sqrx7X0J02ZwqWs1cCv+KEnWc=;
 b=z777slBNzGj2XbT960ta7VbLRiEBZtm5YUIMwUAmAECD67aXvQ+UKEwC5eV+Zs/CJxyZ3viQKozvtVYSPVv+kc3UG5xlzzyaqFVcu64Un4J0Z6mRAXGOpnrp59UA2n8ErYwAUT7Jgn8tzsbQa7xPE/6cmjrOyVT+5jzgno7VSUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 12:34:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 12:34:38 +0000
Message-ID: <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
Date: Thu, 22 May 2025 14:34:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:208:c0::47) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4074:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4ef587-89df-4fc7-794a-08dd992d045c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHRXeDhldHlUMHZ1a0ZvZ3oyOFVMYzVWVU5odEJGZjN4Q2krTWhxcUJkd0dT?=
 =?utf-8?B?eXBSR2JjdzYyTzlIeUJndGMwV0x0L043ZVFJUE9hb05oYkxUQ24raHNqQlhF?=
 =?utf-8?B?ZlZqcExJeEcvSWQ4QS9ZdTdaVGgrdlA5REpTcHpVdTIwTFdTMnNXWVNLN21j?=
 =?utf-8?B?TTdkYkhrT09aLzErRmlmeExHSjlwWG9OQlI3dXNyVXpuVzN4MnkvNlRYK2pr?=
 =?utf-8?B?WmU3Mi91VkxWbDArN2ZsZ1dGNnRWQU5PRUtIUmFuUmxFRUtHRjFIQlZIaS8v?=
 =?utf-8?B?UStsdTRlYlliTVE1WWd0dFNzQlBZenNKVGlFSDdBVC85WSsyWHVMQkxoYjg5?=
 =?utf-8?B?MHN1Z3J6Z0FCK21ncVBtWURZWG5vZmJFenlad3NEbXArT3dJRHFxaW9iOUhC?=
 =?utf-8?B?OEZzam1sd0M1MEF5b2FzRlU0SHZqV3o3VDFpOWxhT3ZaUjRRMEFENVBWMlhS?=
 =?utf-8?B?eGZZR1A1b3l0NVg5NmVtNTJNWlFqTGs2S1k3RlhqbU1ZR1VRRWt5SzkwOU84?=
 =?utf-8?B?VkRpQWYzRFo2bFVzZ216Z2RXRmR0VUNxMEkwaUxqOGZ5ODhieHl1d25BQ3F5?=
 =?utf-8?B?aXFzRXBiRjBFSkUxWGU4TkR3cVFLczRWM0JkQzJubUZYcXFqakRBaStkZ0s4?=
 =?utf-8?B?SWVXcmdpK1BnZThVRDVRN1lzcFpJRjhrbTFraTdYaE93dFo1YnZxYlgzZUJH?=
 =?utf-8?B?bTZRVmVXV2tVN21NZ0dlMTVFVkxXV2d6ZkhTUkZPK1daYlI2QjZkekJibStU?=
 =?utf-8?B?aU42bHpoQmtGS3M0dHIzS3d1SjFoa0E5bHNWVUQzVTlrNG1seGVzeUFza2lG?=
 =?utf-8?B?T3B1K1NEeU9zejhrb2ZYRFB4ckhXVnQxZ0ZMR3hFY2J3L21taXJ0aE8xc0ZJ?=
 =?utf-8?B?NGFacDU5d1pHUkVkTDE5OXhjWnAxN3pvTEFqdGxrOFRtYmRLT2ZhMEhsWU9p?=
 =?utf-8?B?dnU3V3doeW5jTUJZQVVra0xjZVpBY1hIK0VabjJKRFVWL045VmM1U0tTR21P?=
 =?utf-8?B?NUZSbHl6RWZHeWNxNDZkZ2hVc0pyY1NaRENGMWZJOVVKV2ViMHFvS3hFVUVI?=
 =?utf-8?B?c3ZibzlVNFNXdXB5VGprNm83U0Vyby9jcDJnb0NRZzFra3RzS0VZWXZVMkY3?=
 =?utf-8?B?aTlzSlI5cnlMZWl1Y1RxQVh6ODF1dWRsUndlZkxNK282VDVDVjEweGhCQVow?=
 =?utf-8?B?SU1qWndGSDVHb1VEdWhOb202UzZzYUFha3Q5KzFiUzBRNGU2Z0VwNWF1dTFk?=
 =?utf-8?B?N1VzTDFwQ0pINHRtYVNpK2phdnVhR2hvbnJpenFOM2drcWxoYzh2SmVBOEUr?=
 =?utf-8?B?MmVRRHJHUi9nb1pFMGZhWGRlNHNrYy9JVGM4eFFqZUdVc3ZCMFBzeTFwRTRH?=
 =?utf-8?B?Z2VkR2l6N3ZRaDl5ajZ1dnlmSWhQNkh1WGxZd3d6Z05XL0FUYkZhQzhQZWlk?=
 =?utf-8?B?OUkyQ2NWTVVXdmRFTmR2Qk1TcVJ5TnRBL0JQRGRVNERUNlFPeHZwRE1vcTZ0?=
 =?utf-8?B?RGhiS1ZuK2MxbWMyMUJXa3JhRGlPL0hyZFFNMWtGYTNtb0tHRXBJUmx0bWNQ?=
 =?utf-8?B?alNjeWgxWFh5ODA5Y3N0dS9xbGRDYmtTcHRwakJCWGhqOFFKODNOeS9wTzJl?=
 =?utf-8?B?SmplUmhtOWVkcXBrSDJxSXFQT1ppMjRHU2xpYXlqRHNRUzF1MFdsdTJkOGxN?=
 =?utf-8?B?NkhoVm9xcWFFRmI1NFR0OEkrK0pBcDFXM1RVUTViMHZyZm1WcXc4OWhQejV0?=
 =?utf-8?B?Wi9ONWtxTFNHZ3ExYTk4cFJWWk92UGVod1l0Y28wV0ozZU9oLzU4ZWNKb3Jl?=
 =?utf-8?B?OUk5cEhES0kwK1Q4a0U0V0V4clRpNXI5bU9xY0RRdjJNNkJUQnVZeUpwT0E5?=
 =?utf-8?B?QVJuUTZhcnM2MTZXNER3TU5aR2NXbTZ6cmxNMG9RdVJDNlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZCMUVjS0ljbVA1RkZMZFhvS24raEhrY01meGovY3ZXekdmbGlyTS9wQlJj?=
 =?utf-8?B?S0g2Ui9VcDlOeUlWUVZwQUQzTENLUStkb2lhRkh3WHprdEg3MEkyRDdWRTNs?=
 =?utf-8?B?d1BRRERteWpkTlFXWnAwZHpjTXdSWU5yVDAwN0tNZWFtZTFzcUhETzV1alo5?=
 =?utf-8?B?ZUFTcFhFbVkxcklyQ3NqUGRqQUhrNmRkYW1PK2RiV2pPdEZpODQ2UElJNHRk?=
 =?utf-8?B?MXpLNEI5K0wzN0tUVUVvNFA1Tm12NlYwaDd5bkdXc3VCeEJINTRQbkdwNDVC?=
 =?utf-8?B?OWFaaVNVR29Cdmk1cUh1QkE2ajRZV216d0FSNHM1ZTJJbTBMaERLSkVPb0E5?=
 =?utf-8?B?TDBSTGZoVGdkQXU0UUNYMDI0Umt0UDRnb0E5V2gyVVpLazg5UjFhN0hEalg0?=
 =?utf-8?B?V0NGR0NLMDc5Rk9VeWdMN1lXK2Y5N2svSkRrSk9Ma05ldU1LTG82aDliWWor?=
 =?utf-8?B?MGpuUENDd2Y0andEeHpMVW5Qak5FSW0vdVFNTWhKbVpaK2hWaDZsUVp2V29k?=
 =?utf-8?B?TkhQTHBzY3p3TGlFdHZhQ3dSK3UwSitjR0VYekpVM3BTWEtoWHhBSWJoZVZ6?=
 =?utf-8?B?enoxcUc1TytwcEFYWFFZb3QwQjNkY2ZPRC91M0lTOHpEaTVaQmgyNER2UUt3?=
 =?utf-8?B?bGVqQWhrNmZFUlBsemo5c0xEeUJPVXd4OXJGTkZzZnZCNTUzcHJBWWlUQUhn?=
 =?utf-8?B?cE0xODMvMVhHVWdoWXZzVmZkSWJNSTdCNG96NGZXQXdhUGIyZG9YNFJ1cGpV?=
 =?utf-8?B?dEU3WG5NcDd4SWhmQmhyZnZLRmMwTVRsUGlpWmJZd3JjRm9QU05GMHYyNDNU?=
 =?utf-8?B?MExEWUFmb1Z4L2llM1dod2hXcThVRS9IbkNuSnd6TXp1VitHK2NkS2ZRQXJt?=
 =?utf-8?B?ZE41cmlRUzNpS3A0Q2w1eUgwa29oRTA4dDlQNGJuMGk5bGlTV21BQWNkSWxQ?=
 =?utf-8?B?U0dlUk5zanR4NnB3UmlDd2pXL2JDbWlyODZXb3BWeHJDQWowcERPTWRzQm00?=
 =?utf-8?B?bExkNVh2Zk12blJyK2t1ODFybXhpK0RtNWJhS21LSU0reC9BREpuYVNuZ3dx?=
 =?utf-8?B?RnZuY1NlbEJ4LzdYUlVVRlpnMHBXTDVNYzhaakNxaTBlK0JNRS9IN0llTkNJ?=
 =?utf-8?B?d0NrL3lESmcvZ2ZZS256dkt6TnloeGh3RDFFN1hURllRWVVqZ3dvTHZJQkxJ?=
 =?utf-8?B?ZjZIRFNwbE01NC9DcTExdmJ6eFpmMHhNWkJ4RCsveFpTUEcrL3E5dGtVR01o?=
 =?utf-8?B?WktJUGltaXRzcEVLdzRzMlVRNXI0OWZSLzRTeDREZ3VIL2hyY0lIc3V3NVhu?=
 =?utf-8?B?SHF4TzlHczViOC85Y0ZMK3dkcE1IcVVRNlpXRld5bGMyMDluNTFoSkRLaXE1?=
 =?utf-8?B?d3pwVThKdm15cDgrTG50NEllVWo2ZkNMbFlZMG9CaWtWaE94T0ZycDdFYmwx?=
 =?utf-8?B?Tlg5dGpMUWVCNWV3MGZadm9kbmRoMmpoR2cwZUVnZHFUTmlZN1FTKzVBcnZ6?=
 =?utf-8?B?UmtjSWYxeUZZR0RMT25CYXVkUXZVNFAxeUVSaW9YM21yNTNoU2VDb1Q3Vk94?=
 =?utf-8?B?VWQ5RG5KUnU4UGtVS1FEbDFoYXZKaGFSdW56QU5NczB2a0dBZGpna0tWbzBT?=
 =?utf-8?B?Y3NhN1pWeXZaaHRpUnFOQ2tsWjNBc0orMzF6UnUxd0t1Mm40MTlyU1h6c05y?=
 =?utf-8?B?VzZJY3N5K2pXN1B6VVBseW5KSlNOSDVoalVvVnlKYnNIN3IwVHNhL1llQ3pa?=
 =?utf-8?B?UkNhdkR3K0JxZjREMEZHSlZsMWpGTDc3TWZDV2w0UElaZk9yblkwaml3L0NG?=
 =?utf-8?B?RC83NHorRnNseVNsd1RabWRPWHBiTzFObDcwc1NVZ2ExY0pqTTBORDhHbm02?=
 =?utf-8?B?c3FkUFZCKzY2S0QrYit3QjZkTVZ0YjdYa1JOMzNTTHFsTkhRa1hTVTJBR21B?=
 =?utf-8?B?enZnSS9xaGI3bTNXK0RsSUtnRUE1Z2hMVGp2WWdPaXlSbTNsSlVnU0M4elVU?=
 =?utf-8?B?RUo0b0RONlNtVVFSYkhOYlF0UVFVeUFLYXZhaFp1THBJMUdaR3diejJrcEVU?=
 =?utf-8?B?blQ2bTZ0azJMRjljWnI1MFlaS3hiOFNOYzZVRU5scXl3OWowdmFDZU5PSGdF?=
 =?utf-8?Q?GktVZ+94HEW/Ie63dT1TZ5nLB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4ef587-89df-4fc7-794a-08dd992d045c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:34:38.4584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNZOYqVQdXAiWwGfz/H6TGT066k3GbdP4VEEG+aCQzbalIN2kH2VmJQMK5gLX8c0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4074
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

On 5/22/25 14:20, Philipp Stanner wrote:
> On Thu, 2025-05-22 at 14:06 +0200, Christian König wrote:
>> On 5/22/25 13:25, Philipp Stanner wrote:
>>> dma_fence_is_signaled_locked(), which is used in
>>> nouveau_fence_context_kill(), can signal fences below the surface
>>> through a callback.
>>>
>>> There is neither need for nor use in doing that when killing a
>>> fence
>>> context.
>>>
>>> Replace dma_fence_is_signaled_locked() with
>>> __dma_fence_is_signaled(), a
>>> function which only checks, never signals.
>>
>> That is not a good approach.
>>
>> Having the __dma_fence_is_signaled() means that other would be
>> allowed to call it as well.
>>
>> But nouveau can do that here only because it knows that the fence was
>> issued by nouveau.
>>
>> What nouveau can to is to test the signaled flag directly, but that's
>> what you try to avoid as well.
> 
> There's many parties who check the bit already.
> 
> And if Nouveau is allowed to do that, one can just as well provide a
> wrapper for it.

No, exactly that's what is usually avoided in cases like this here.

See all the functions inside include/linux/dma-fence.h can be used by everybody. It's basically the public interface of the dma_fence object.

So testing if a fence is signaled without calling the callback is only allowed by whoever implemented the fence.

In other words nouveau can test nouveau fences, i915 can test i915 fences, amdgpu can test amdgpu fences etc... But if you have the wrapper that makes it officially allowed that nouveau starts testing i915 fences and that would be problematic.

Regards,
Christian.

> 
> That has the advantage of centralizing the responsibility and
> documenting it.
> 
> P.
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> index d5654e26d5bc..993b3dcb5db0 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> @@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct
>>> nouveau_fence_chan *fctx, int error)
>>>  
>>>  	spin_lock_irqsave(&fctx->lock, flags);
>>>  	list_for_each_entry_safe(fence, tmp, &fctx->pending, head)
>>> {
>>> -		if (error && !dma_fence_is_signaled_locked(&fence-
>>>> base))
>>> +		if (error && !__dma_fence_is_signaled(&fence-
>>>> base))
>>>  			dma_fence_set_error(&fence->base, error);
>>>  
>>>  		if (nouveau_fence_signal(fence))
>>
> 

