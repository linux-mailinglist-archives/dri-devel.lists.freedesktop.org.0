Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9569BA65207
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 14:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1277010E249;
	Mon, 17 Mar 2025 13:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="woKuEWU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8981F10E249
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 13:59:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/FMvPCMdtQX5skzWdX+NuWrt0c6ieNdnPK19ShniTD3ivX/ubIyMnGvsuLxEnLcmt8vGnIlOYO8UnPC3DPbsnFozrmOqkup8I7jHHRkdlV2aHEeK4Clj2+glY7W536kVCPAQns8buzXUJ9jhJg+iMncy85zP86sL1IJfRwdvqcTRpXYcdy76z03+plgW6E2dIqgkBOFiFkbB5gQ9S/Pv1RiT+Bwtk9COcKrSevfnFTry4oRfHAMp2E7j1WUPLHYTs1B5nJVWgYMYfCXsQGYxHCMyWsWU7pVWJJP4BLeVypCH7iIun7uSsp1f2xjJI9kaFqxiPhmo0QYnQoQZ7V2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zc5WA573st4/gpX3lCdurB215hdiIpiMHBytD5vOjuY=;
 b=ZBU4ZrUFKu5xoGwW3PDU1T1ZCmuQwNQrlH8IEGhFkwxtJ2/fSt5O/GLOUE9pH8hUoriHXmEUqtGHFLiYrxQfCaxjH577Wy9OaYILWJxvsUSGYTZrSWvmDMllulQCtciGzC9UUR+j12YDykkc1vHIYwTc3uu89NcaQ3hctIxIwlObnmOmbBb9fTE/iLn5t/EEBQiFikkgYG1b5B/AdXK29wXnThZ4BZpQOVIr1QLn55oYBbFmqQ3lQzHY6zIEUe2dV2U1d9NJaQXfb3+2vwzRL/ZnW032FHjyH3o4Pwzl4NBbM8T8aktXTK5CAEu5z3cwCtgyM4ra7Sl3isHQs71nrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zc5WA573st4/gpX3lCdurB215hdiIpiMHBytD5vOjuY=;
 b=woKuEWU+TSfdaCXZeAzkFixFtey9/62PtZvlqXePai0I6gcwCFDXgIYU1Ty2qYhz1mp/v2P+Zx570rbN6F9jMaLep8cAz69n6IsuxzLLpOw3h7Q1EpSEmGhfVvW8DPmzst9ldq2k+acrPMOYa0RHAo7Nl4u6JxUCsGVqU2IJXIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6816.namprd12.prod.outlook.com (2603:10b6:806:264::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Mon, 17 Mar
 2025 13:59:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Mon, 17 Mar 2025
 13:59:25 +0000
Message-ID: <9351765f-685f-4de8-b1e0-695627a29af0@amd.com>
Date: Mon, 17 Mar 2025 14:59:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Replace nested max() with single max3()
To: feng.wei8@zte.com.cn, sumit.semwal@linaro.org
Cc: benjamin.gaignard@collabora.com, brian.starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20250315124009404aGYiofkCnWFti1fQoFZ58@zte.com.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250315124009404aGYiofkCnWFti1fQoFZ58@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: de446ab8-243d-4fa0-071a-08dd655bed27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFppbDhBNTY4N1I5ditHdVQxQjZmbEtFQXVZQ3l6YmFjcUU3TG5tLzBVWFg0?=
 =?utf-8?B?N25KY0ljcEpRZ0lLTWdsdUdEcnpjdUxFN0lYbFUvZmZxUzZwNlc2ZnM0em1M?=
 =?utf-8?B?R0FtRXRoUkY4S2ZnWXBaQmJXZmY0YWVVUU1RdkFQcS9wOXhKazBlOGk3RHBi?=
 =?utf-8?B?TUxxNy9zejFoMThqM2hSRHZaYzJHSmVqdWxDbnd6RHBxUFcwVmRYc2xHRkU1?=
 =?utf-8?B?Y29jZ3BQQVZMZThaOHhNc1B6VHlWSHk5N1RlSjVOMWF4WDk2TEc0QVZrV1kz?=
 =?utf-8?B?aHFjdkpmOE9XNU5aQlA4NVJiaXJ6ZXMxQTdqV25nd2xnQUdXOFNGZ2tkMUtC?=
 =?utf-8?B?TXpubzJPekFoRlhHVTh2UHl6VmRjSlhLYlIrY1JkWmdEK1lXMzNCU3ZRcFpM?=
 =?utf-8?B?NVhueGM4NUZsUDN0bEFEaU45NmtScS9ML1FMa01SbEo3SWVWTFViRlhZWDNN?=
 =?utf-8?B?TWU4ZThQMGhIWTZ2QW5IUkJHMVdVZ09PNXNXMkliNUFNRDFNZGMySzNaZ0Fx?=
 =?utf-8?B?Y0NmY1FYbVlVVzZkVVFoeWEwL29zUlpRQmtqOGZoVEh5WTVRYUxUb3RvVEVI?=
 =?utf-8?B?NVd0K1hPOUpzZVlRZVExZGdxYmdpNXdkV25nVmNMZWdtVWlyZkpPWDQ2WFIz?=
 =?utf-8?B?RSs4MkRKRUdMM2hEWXplUDlYdHBpSGtGUXgxMEJpQklXazlMTVlVSnF5Z2pt?=
 =?utf-8?B?SE1UT3VWekFGZkhHNlVlMXduYzhvSi9YMGllOE1DdEpDeDJBRFFzVmlHVnVE?=
 =?utf-8?B?NTJxbDNrZVQwd2hUZW1abFk0bklqcEVLZGRJb2pZRWc0ZjBMMVB6b3FMRVJZ?=
 =?utf-8?B?UUNUTmg5V2dEaDNKKytWQUN4ZXJ6c25KaXNvaXpwVHlLWStOVmdqY2FWWXd2?=
 =?utf-8?B?T0ZsdytTKzJkdXR3L3NVN2tudHc4M2NPT2Y3Tk9VajJCQjl1VitOY2xGLzh0?=
 =?utf-8?B?NnJsRThDd1Fodk51TzF0UHlFUEdnUWphZjF1eVRCRVB1dXJ0ODh4SUcyWVVX?=
 =?utf-8?B?RXU3RXFJWGlMMjdTbGpjSVhjb05hb21Mb2hudjc0TTZzYzVPMkNJM0I0RTZs?=
 =?utf-8?B?cFNWSVBHZ0tsZVhSTnFrOWhZcE5ZK3V2Sm0wczRWa3VZRy84bWN4T3M2QU5D?=
 =?utf-8?B?OHR3Vnp3VXNzbzRMaHg1Y0dZUGxRRURPakZzdlFVMm1BYWxjbTNacUFJQXJT?=
 =?utf-8?B?bG81d3I2S2UrdGpMVDRmajM0T1ZkVUpvYm9nd1ZTcUVEdE1HSllHRE0rejFB?=
 =?utf-8?B?Zm5nR2hnMkFxNFRadTMrT3VrWms1NTNoZ2diVUZ1SXBqZE9qQkVqTy8zbHpo?=
 =?utf-8?B?N2RCV0pCN1dvRzJGcnRkcDhPVGZvdDJ3dTh3amlYM25CYmtiR2NIVjl1d2hm?=
 =?utf-8?B?bnJvaE5vQ3hqcEVidXpiaFhIcUhMVTY1R3lDWldQaHZleXJBQ0J3enBrQWxn?=
 =?utf-8?B?TGtiUER4MXNBY0MwRWd0QnhHcnRFSlExWGQ1UXpEYkJWbHA4eFlZd3lyTjhF?=
 =?utf-8?B?bEUvUWhtNDdSMXNSSXN4UzVNYmttL2w1RHpCSHcvNXJ5Z0ZITXlKZU1KVUZ3?=
 =?utf-8?B?ejlCYVB0RXZUaDFyenJmOUswbWpQSFkyaUJxak9EZUZyR3pPazRLazlzQTgx?=
 =?utf-8?B?RFJ0Y0ExQzRRTjQvZjFyZmo5OTdvTDdlMVFpYS96OFQrZWdWamRua3ZUMk5G?=
 =?utf-8?B?VjBxYTFxOGlkWk1OMDJ2NXZnU3V3SDdpVU1zR2FLaS9QZXVQenVOa1E4RVh1?=
 =?utf-8?B?WDJrYXUrVG5tQUxqaG1naFUxbTc2djByOTRPNVZsMVh2U1phSThiNjg1MXJ1?=
 =?utf-8?B?M3J5Mll5U1B1a0JHcThzUjJodzdRVXhZRUV1KzMrQnllcTR3US8wcjlTTWEr?=
 =?utf-8?Q?EoDa8665P/7JJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGc1eUZmbXB4UVNIQnRSQjZ1Y2hFdWxjSHViNFBiK1hzUDZGVVNpY3FMclhG?=
 =?utf-8?B?Q1d5MmZreXV4RTJLaWloakJvaW1CU3NEUklrcWRqMlNlNmRYV2wzVVJxdzVJ?=
 =?utf-8?B?TnZVZEd6NTVSWDNjcEtML1prTis4YVlWUWtPRjQ5dFFnaXE3YUxHNjN0Uk5Y?=
 =?utf-8?B?VnF0SkxPdWJpYms5eWFTbk9GZVVweTZTd3EyMGNiT2tJTktKd3hlRTZKcXNa?=
 =?utf-8?B?bHNpb3Y2ZVZ0Ym0xTUNFUVRGdFNQckM1ZDJ6cEJTemxhSXhBT2dTUzF5Wk1z?=
 =?utf-8?B?Q0cvbXUxVFZZaEZxeWNMOVc0MFNzSjRCYVl4TS81NWo0ZGR2MDBTV3F4QmVV?=
 =?utf-8?B?SXdTSi9BanE1WDVvR1lwNHJOOXJweU9mcEZNUVYxZmFkbFd3SE0wS29RcFla?=
 =?utf-8?B?cm1CN2JRTVlMVE5ONVhDdG04N2thQ0p5SjVFQXlTR2ZoUk9UeExTczlKTzVt?=
 =?utf-8?B?elNZeFYzOG1pRy9GZExKUitieEFNanZ1UnEvSU5LL3M2UitJRnhqQm1jNCtx?=
 =?utf-8?B?QzFZOTRsOGFTaUhmRGhzNjdrbERvYjJWRGh0dGRUNDJobmNJcktBWGpicFFq?=
 =?utf-8?B?UWxMMnFheU5FZ2FUS2d3VnZRVVVGSndqME5LUnFBS05CRnZ0c1ZxUTVOOUlo?=
 =?utf-8?B?N2Q0eC9BMHMwbGFVQXZzWkduZjAyY0RLQldMa2pIQW4wZDIzM2thd2tuc255?=
 =?utf-8?B?VDFWeGJmYTF2ZFkwbExNVmd4Smp3V0xDc0hqS3UwWlkzZ0FJQnhLMXlOMGZk?=
 =?utf-8?B?akUyUm1VU3lsUXpGVENvM2xVYXdzQ2ltYUZHb2lUWERnN0ZIMXVOZndwcXMw?=
 =?utf-8?B?TFpCY0hYajhETTVqbWlaODlGamRKc3JQQ3llOVlpbVZCU2NyUFhTOTEwU0c0?=
 =?utf-8?B?aFJ4dVFYNWdqeDVRd1QyUkNPVGNMeTVWVkl6cjEyZU42cENjODg5YzhuMmZj?=
 =?utf-8?B?czh1TzdXQm1XVllRYlovMkJxRXpFNWJsc055Y2dxc2lFaEFiMDN3bitCMEZJ?=
 =?utf-8?B?SkdNNm5mZTFWZWJ0SHNzNUttTWo5eDBLOFdvR0QwVjhNK0UrR0FrNXo3UllH?=
 =?utf-8?B?THBHc000WFlCeXU5dW5VSzJCQVdVaEIwZlZFa2wzWXhobDVzT3RLeE1TZzRK?=
 =?utf-8?B?WDYxd3BwVkFXblRVSitvYkVBeEFuUE5Yb0hwMmVDclNNKzZpazRUSGtiVUpX?=
 =?utf-8?B?bmVVZlZZTFdNZy8xWENrdCtJSlJLMlgyUEVVdTNiVEdqb2VwNHdoQ09FSTV0?=
 =?utf-8?B?eEtvVW9SZkFtcEllZDNVN3JSTXpGMUVHTE5kRFRldVlvN1dXTFBQa2hHZXVP?=
 =?utf-8?B?ZklJNnVHT05VazNvY3hWb0d4VG8ybFd0cVZBUjJOWFBLMUdBVWYwTlY0RTRp?=
 =?utf-8?B?MVpZdS9uNThYTGJuaUVaZjVzUEp5bWhXNmI2VDV2b1FvYldPMTFtUDA0dEVh?=
 =?utf-8?B?dGdUMmFvU0lFTjRmc1YxdzhuNStQOEFsYU43VXUwbEF6Z1B2ZUx0Nmd5dEJ3?=
 =?utf-8?B?K285RmdwTWkrZ080VWRLOWdSTW5wR1Ewd3M0YzJiZTlCdlJjUU1SRXRZZ3lU?=
 =?utf-8?B?cnJJUHV0WkpCL1IyQTFRMDg2STR0UjdOajVVSzBCeUlwL0lkbEFJNXdaMGQw?=
 =?utf-8?B?VUFaZlJiZnpsZnVlbTdFbVNTQ1pUWWlaNElrc205djhqV3NITEt0dkdyOEti?=
 =?utf-8?B?RzVJcmZVZkJMZTQ3bGNSUmNLbzlQMW1YZXRuaWZ0OVpjbkN2cUlvaENLWENk?=
 =?utf-8?B?bXo2WnRhSFhzcmQrM2ViN2FLNnlJN3FRZEEvbGtQRWU5R0FMK1dBdlA0ZXJu?=
 =?utf-8?B?clZ0ZHZXaFZRUWU5VmFvZ1JJNzk0QzlaK2tlcitNTWNyNENWa20yUkQwcmRX?=
 =?utf-8?B?L0tMTm50aGNvSkRHemtpVzkyai9FRXQ3MnRkVkoyenkreE1BOVZPdFlHcVV1?=
 =?utf-8?B?QXcyWGVuTEtSTU1tbjVTaEhPbDBZUkhhRUdmcTZKV0ZmZ08vTGZxSWVIa0Jv?=
 =?utf-8?B?b3NwUVFEMFVkbUdGZWtIdTVXamkzaTFPS3lmYlJOK2hjaWxMWXhnSHFVaUhJ?=
 =?utf-8?B?dkQvVHdJbzM2bWEzYU5wS3h2U2R2K21EWEh6V1RZckdDaWtIRzAvQ1pRZGFQ?=
 =?utf-8?Q?ndx8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de446ab8-243d-4fa0-071a-08dd655bed27
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 13:59:25.4784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wq+kQobFGJ+W+aifu2zlvOXNP7nUE9fSrkBZ+D6K/s5Daqkk09oyICxsnrXhw73A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6816
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

Am 15.03.25 um 05:40 schrieb feng.wei8@zte.com.cn:
> From: FengWei <feng.wei8@zte.com.cn>
>
> Use max3() macro instead of nesting max() to simplify the return
> statement.

Please add a "dma-buf: heaps: " prefix to the subject line, apart from that looks good to me.

Regards,
Christian.

>
> Signed-off-by: FengWei <feng.wei8@zte.com.cn>
> ---
>  drivers/dma-buf/dma-heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 3cbe87d4a464..96cb9ab5731a 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -147,7 +147,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
>  		in_size = 0;
>  	if ((ucmd & kcmd & IOC_OUT) == 0)
>  		out_size = 0;
> -	ksize = max(max(in_size, out_size), drv_size);
> +	ksize = max3(in_size, out_size, drv_size);
>
>  	/* If necessary, allocate buffer for ioctl argument */
>  	if (ksize > sizeof(stack_kdata)) {

