Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3F9A6996
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3864310E12C;
	Mon, 21 Oct 2024 13:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="biyh/uac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC2010E12C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:06:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrE256Yc8mZtCO64i/5zAWB1YZBGosozF5KuZmuvMUgSH7t/HjKuxk322iFzQSFvXctQ/IRS4/9KQG8iXn9yew7rTM5dcYetmzHC68zq/wFT2EUxW+xPj4B0jPLJfwjJc5VUOCUAU/z64rJ0zwZJgW2xExef2ZtMqNoOzMRnDRAwgm2Ck9LNH3u9dW9j12mAKFKoPmFf52njsKhvKl5BEMS8m3wvyg5/FWyTq2UAI7hguXXE9ktqbVvC2bUGXX6wFVXjhknqhq+Ae+rGXMyfaIMZaD1paQ0dJ1dT80TTEQrTloZGVv5PJv3aNgaQ5ghFhk2SUoukdgFBVdELGcy+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6EDaeYjAbFkUpqzmw/2hv2sV+Rpv8TFtGJ74/MbF9o=;
 b=Q8uO1rBxHRIDRQI03pqIERKgca1qDCUCfHVOBEw9Q789Y1Y2Zdf8gLIPUYoNCi0218MVE8aykMoYdeamfPIUrbqq8pDzLLY9NmspTecBLZOeJKhsXL4Pqi7xjDYYZZ9o/rRuHMNXmaOT4rHTHNWLfkivNULJy/eett5a/BWNIWnNrc03yw06/asGQqLnEriYuRxDREYRf8wRxBEy9z4dJWPvyEY4M+7xgD2Tu7zu5N/0ajmMWAeCMR46QNl3awOO3wN17qrEgdVbJRSKpPDL5GunEo4zmrOM6w7odSl5Eeocok+C1LB1RE0wG2s90u5ENCdsB+pylbDJRikVx44H+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6EDaeYjAbFkUpqzmw/2hv2sV+Rpv8TFtGJ74/MbF9o=;
 b=biyh/uacgq6AKzz0cTnD+P8vWXZN4g2wooSHLP38T8nQFN6UDEdAso8UFk75oUE871oRatjD02wOXK2ibElMogWEGiEEnMy4ArpR8ywcEQLjUdSV5wJcZqs1hAuHw7vFaGMTZEjwv+WL710riFCUmKo7iCme9tHuUsyCOT37D6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6557.namprd12.prod.outlook.com (2603:10b6:8:d3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.21; Mon, 21 Oct 2024 13:05:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 13:05:57 +0000
Message-ID: <9c1f72ea-06d9-4615-b2f8-d98a0aa78aa1@amd.com>
Date: Mon, 21 Oct 2024 15:05:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: memset() 'job' in drm_sched_job_init()
To: Philipp Stanner <pstanner@redhat.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241021105028.19794-2-pstanner@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241021105028.19794-2-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: 882f0fa1-c0b4-4afe-b1ca-08dcf1d11a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnMycmNDb3phRUxGR1dBVEFlSDdJKzlqWEtsOTRPSE1HVFJWM2QrWDBhMDNV?=
 =?utf-8?B?aFJHSlpnV1U2dlNFa0dlV2pmVGZycHNyeVd4MGgzcnNGUVVjTEtBaHczUzlP?=
 =?utf-8?B?WFJQVlhZazIydFcrOHo1ZU8vUDJ3dnlBV01YNitVOWpIMG4wTVE1RWRuNjdZ?=
 =?utf-8?B?a2RuajVmZWhzYUhGZTdIZWM2VG5RNkh1YnVyUXNETnhkK0g5blZPZ09qMlVQ?=
 =?utf-8?B?aWRNaDdlUkNNdUk5MHFwOXUxTzR0b1ZtV1Jpb0VnOUtvdFJZSnVaYkZydStN?=
 =?utf-8?B?bTRhcTA5d0d4VlBXSEJXM2tnbWg0R0poSTM5ekp0azNpVVlGSDhpL3J0Y1lk?=
 =?utf-8?B?U2hhTTkxNnQvTDRDd3RYa0cvM2E3K012T1V1L0hMWENnVkxzVHFzMTNHOGRr?=
 =?utf-8?B?a0tXdlIrbmhPSG00dmxHNDR3SlBBaFJIV3h6anIyY1NRaThWcFBzb3ZmeTRG?=
 =?utf-8?B?STJoMSt1cVJpdW9LR3FxYXdCS012VlY0N0ZuUXFhWTBFTWZTdjVQV3ZRemQ4?=
 =?utf-8?B?SXFBWUI2N3BTSm92Z2h3WHYrR09ucmh3M0tSaS8wbW5ROTN5ZTRNcGxFbkRm?=
 =?utf-8?B?N1U2dFM4QzBPVHJOTWRqazZpbFpXU1grSVNYSDFRbmlMRCs5akZDbTh4S2VV?=
 =?utf-8?B?dU9pMllhbEJtcjdReEdyRnFnQXlqaXNKd1N3SDF4ZUFVQ0c0UzNGSlhNaTlD?=
 =?utf-8?B?ck84bEVWd2pQWThhRHMwS2ZmU2NOSXhsaFNkYWwvOHlJeEJuc0Zxdkt4Y0JR?=
 =?utf-8?B?SEUrMDNpV3pEUmRoZ0ZDSnlNcktoblNIWlM3MGROS3hjRFBpd2dhVUN5dzRB?=
 =?utf-8?B?N25PcEVaRlpDbWhIRWFVMGgrcG1LRFZhQmxJZ0JVWmZyU3BpWTViNWkzV1dW?=
 =?utf-8?B?OG51TitqTWU0NnBCTUEwdXBscGt6WlhSV3h1NnNPdWJneDRlR1dOYVNXWkt2?=
 =?utf-8?B?RUQvWFB6NkQ0RkxNTzVWRDREZWk4WDdRTC9sNFY5Q0xIbFRPc2dDeGxvVFh0?=
 =?utf-8?B?U3hEYUFyZGh2YlVoY1MvZWZ3QUpsVEVTaitWQVFmSTJyci9qbHhUOEhMN2Fu?=
 =?utf-8?B?MURPbTF6V0xYTzNFZlRmSmo4MDFHSW05YWNPVlQ0VHdhQ2hmZHNmNUJ3MmVy?=
 =?utf-8?B?T0w2dlkySk5PbzlkakREVm8vUkVMSlFZaFMrczdiR3JCTFFVMEN1bXUwU21G?=
 =?utf-8?B?T1puTGJIc3pkV2c0cCtkVThjaU9OK2pqVW1wQjRCdUNpdjNKUVYreGUyMytm?=
 =?utf-8?B?ZGdHNzhPcGtmTEMwa3l1UnJtWGVDNUxYaXJjYnp5Q2RUQ2Fxa20xTG11c2lj?=
 =?utf-8?B?eS9lMjJwZVhyV2VUait2UzFIOWpGSVlTbnNDTnQ1Q0h3TyswWFVkcTc1M1Fp?=
 =?utf-8?B?bUhzZFkydFJGbkhFREd3YWgxOGRhQURUNlk0UVdtbTFZWFgyY1ZTYm93UXZH?=
 =?utf-8?B?WjZQWGtTWUhLVXpPU3IrT1pxejdBMU9tQ3FjVnFqZVMvNFFPZE12aXVuSEFT?=
 =?utf-8?B?ZThXNXp4Y0IrZFpYNjltNDluV3ZXUmlHWmh4aUZOQjZVSXprc0hkVjZCM3R0?=
 =?utf-8?B?L2Y4cE90Q0JXaFA0d2NSdmJZdXZWL0tVQzJiRjBHWVlVb3NCL1UzK25LemEr?=
 =?utf-8?B?SGUrUDRXOXlPajNOV3lBaUUxSGprWGhTMkZhMmpHVmtKVERnK1JBckhrTVY0?=
 =?utf-8?B?ZWVlRm1FN0ttUW0yUEZqVUdPSzhkQmVWZ3FFRDgzVGh4MS9TZXZlbFFlekU0?=
 =?utf-8?B?bkxzQ2NjcE9Bb2JKd3lMZW41cytlNFFnR0tsdG9TLzJiek55M1Z0VFRiR0kz?=
 =?utf-8?Q?+w4E0WsN8OOiYzZllx7J1iZrzYG5dEjOFiCpQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDRWMVg4UFJFelY0OHdlLy9uYmhZSVZrdXZjWHgxZDVDamswTFhQT0NyS3Qr?=
 =?utf-8?B?R0ViUzdmT1NqdzZKZVpDZnhTS3RXSFRjVHJuTUNEVVFrRVJmNTgyaXhOc3Rm?=
 =?utf-8?B?WVdySWxCOFN4bHdrTHZPNTZVK3dyek9PODJ1VGtsSjNxbk5QbzZCTzlsNWxt?=
 =?utf-8?B?NXRCVVpKTkN6NGZNN011QmJDaWFPVEZGNFBjTDdQdCt1dFBCd2gzYmdIcHB6?=
 =?utf-8?B?UGJQWE1vLzFGMXJVSXk3cVdQalpZTnJVQkpNQVJybE9PRWlKcGRnSkxMaUh3?=
 =?utf-8?B?UERaUEk4RjFHelFLYXJrZUFvOTIzdXBHQmRNQjRrOW83MXF5REwrZlhaRVd3?=
 =?utf-8?B?SHdrWWZQVGhuczNwZEdvcU9BeE5HY2psTnBsSUtqbVJSQXFzbEdtVHdkSVEx?=
 =?utf-8?B?eCtGSExMN0ZodXZ1NFBBUHN0Zk1hZzNkd0RkU3EzVkxIS2hBemZvRHZSZFJ3?=
 =?utf-8?B?LzBaRlhUcVJUVmhWVVhsU2tONFdKSTFFMThwOFIyWENRQ2N0STNKQ2ppc2hD?=
 =?utf-8?B?RlJjMmlaTFVtU3k1TExmMXlXamxxUWprT2tIdWRmbWFSWUtNOXRwQ2FndFgv?=
 =?utf-8?B?cGVWSEZTRnJiRnE4c0FMZEtHRzhBYlN6aXQ5V3gzd2tmcnVQMzZQNDMxMzdC?=
 =?utf-8?B?VklwYy9RczdDU1AxbW0zbmRrSEFqRjhESVdJaGFnV0J3TWNsckhnN3lxR0J5?=
 =?utf-8?B?ay9PTTdFdm1WSlNZM0lYOU8xUmFiRDhNc2cwQ1FpQlZnTjdLSHZ6cnI0Um5w?=
 =?utf-8?B?bk82UkR3ZE03SGs3NDIyWGhoQXhaMTRGRTZXdEt0SVFDSWdFSlJCbFA3Z2Zk?=
 =?utf-8?B?MmZUbDlTbWZZZDQyRDNiUlg5aUM5RlBZUjRPcDRFNGRQU3B6SzdISE94Q2tE?=
 =?utf-8?B?Nmh0TkRxcXpBS0w5eG9uT3VEMVBmYUZwWngydzdQMnprekNlclJobGcxcUlk?=
 =?utf-8?B?U1hDaHRiZ3FIWm9ZalhweFYrZlBNYXJsTUFwMlJYeEtZNnpsejB3dzZIbDFv?=
 =?utf-8?B?ZW4zOFVhbDdxbUxvaS9lRFk2R0tKZVVvVTJaRlA0UGpNVDZveXdmaUNtVWpL?=
 =?utf-8?B?eGdERTRoRWplQkRPeW11Z2pWK3dpZDJzRlh4aWNFQzBvYnpwbG5Fa291VGQ2?=
 =?utf-8?B?VlpTUVk1NEdkUmkzM05qdmJSVjhCRzJnUEc1Z2VJb256RDZFR29xcC9zMGdl?=
 =?utf-8?B?dTBvSE1maUdsTHhsQlRuWGQvaThxeGtySkpIR2dRelRDNERLTlJXSHlVbHhm?=
 =?utf-8?B?NCtlTTdlWUtleUs5S2hoNUcwMld4cTYvYjV2NzViYkZITHhMUkJBTnIyR2xo?=
 =?utf-8?B?bWFTN3Nhano2SEt3cHVEOGluL0NKVzR6czdDektqQjBzS21OMjh6UzJabnBm?=
 =?utf-8?B?TFFKdzVuM2JvdGZpOTFud0szQXFPUzlYVElEVGVyNkNrZTJuUTRQQ0tPc0kr?=
 =?utf-8?B?WXd0MzBMQWFnd290OHRLcE16dWo5dlpZdVVzY05tMm5UUXZJM1o1UEdvbDNi?=
 =?utf-8?B?TDJhTXRyNDBJT1ArclhTR3R2bzc0TXFVU1pwRGQ0TTR2elZObnJnSlhUZndI?=
 =?utf-8?B?eDhxemdIY1lzbWQrM2hPTTdoa3I5ak83Y3pGcnVBd3NjTVlGY3ZBWFlnL3lr?=
 =?utf-8?B?L09SZDB3UE1XNG93VlZHTGhMb0xQRGhWT1hGT0EwelJOaGtEUm9XTE9Va25j?=
 =?utf-8?B?ejloMFkwR2JYaXJjc3NiWXI1NlVHNUJqeVlzY1pzci9XNkhTd3FXaVJ3NG5o?=
 =?utf-8?B?MlJKRTI3c29DK3Btc0NQL0k1ZCswOGZ2elFyRUlERmE1NUpmQ3FBWEFOeU5Y?=
 =?utf-8?B?OE0zZXZJa0Y2MC9LZmNtUUMrYTdRN0dlYk90Q1VsWnQvTmdwNUF6eno1WUVx?=
 =?utf-8?B?NWY5ZlBNTGkyVTVJYmtKVGtZb2tGdndKSkx5WTZLdVdTcEVBQVBFNmhVeUtZ?=
 =?utf-8?B?YnhOWnpYems2Qlc5Zm1YZ2tiaDVnazRXRDlTdUxzRXhVNkh4UkV3OXJzOG15?=
 =?utf-8?B?QkQwYlJuaEx6K0tzRkt2QWFCcnpBTlFJU1EwbmIrZlN5UGFyT1B2Z3dlcjRn?=
 =?utf-8?B?OWpCYm9WMlM1VTJ3cklqZE1tVm0xZGxka0pEWE9MWFNWQUhtVmliTVpmVnRW?=
 =?utf-8?Q?KyiNcmpWd/3IYysAd8LZ9lKg6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882f0fa1-c0b4-4afe-b1ca-08dcf1d11a7b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 13:05:57.6604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfAPvW+JdK4wGxo1iZ0F66lnMC+bDsPvjBIfg2NsgW+MAt5rUYJtJO02UH2lJ6Fs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6557
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

Am 21.10.24 um 12:50 schrieb Philipp Stanner:
> drm_sched_job_init() has no control over how users allocate struct
> drm_sched_job. Unfortunately, the function can also not set some struct
> members such as job->sched.
>
> This could theoretically lead to UB by users dereferencing the struct's
> pointer members too early.
>
> It is easier to debug such issues if these pointers are initialized to
> NULL, so dereferencing them causes a NULL pointer exception.
> Accordingly, drm_sched_entity_init() does precisely that and initializes
> its struct with memset().
>
> Initialize parameter "job" to 0 in drm_sched_job_init().
>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> No changes in v2.
>
> +CC Christian and Tvrtko in this thread.
> Would be cool if someone can do a review.
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index dab8cca79eb7..2e0e5a9577d1 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -796,6 +796,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   		return -EINVAL;
>   	}
>   
> +	/*
> +	 * We don't know for sure how the user has allocated. Thus, zero the
> +	 * struct so that unallowed (i.e., too early) usage of pointers that
> +	 * this function does not set is guaranteed to lead to a NULL pointer
> +	 * exception instead of UB.
> +	 */
> +	memset(job, 0, sizeof(*job));
> +

Maybe just implicitly set the sched pointer to NULL here?

On the other hand compilers these days are really good at optimizing 
that away anyway, so feel free to add Reviewed-by: Christian König 
<christian.koenig@amd.com> to the series as is as well.

Regards,
Christian.

>   	job->entity = entity;
>   	job->credits = credits;
>   	job->s_fence = drm_sched_fence_alloc(entity, owner);

