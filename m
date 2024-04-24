Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FF48B02E3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 09:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98F811389F;
	Wed, 24 Apr 2024 07:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Pv/6W9fP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C144611389F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 07:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWdsWf0A/BxyNhmRmJC218Rd449lKF3f+pB3S27+n8hT1h2mOyepjG6XTUApHE6jdVCXrEBPa9XmVizM07E+fd2fOCDTMpFyjP4zfuyDHkam14N0+wFSa7S04ic4cpwIyNW4LOZTK+RNnwty1NTyBHPkUAbCQinx9aWlmc7iVmBKO8iuNAjfOdfqr/n5IxvvDK9a/UOoiXxZfOvmZCHToYS/Sft+bycevd1kT0f/UW3nw8v2GfH+Bo1JA/Zg35A/qQTR6+NV/8ucVJynsp6mYzRxKwcIILHQICs37CNgJeycQWuzlwL40m1gANTPSgYom6BHpQMyx9ok4SF0en0/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2c48z4XS4Qjc8+pI7MgasVpd38QNrcrvN5F4SWY/dw=;
 b=njaRnJPhASoUBmlbRZdeTmjGe4ww4o8YFrr9H0vGjxkyj+i/m/QaG7cqVwPs9QaN8kvHBLqBfx25uhzxhz0uQAkSi5DRrLWxlkCssuWtsd4BrLQyGZa6krlfQT3/Dubc38ULCdt254CuNV6rqauU8r6+Q24w84dmsOaggTbx1/sldRpyTej2OHW371kNgyj599p2rBAuHF8kihBJTf/zbVXR26TzVAMAuwS8lKwT7U8BK8WCguZvKNNi+qFjkNkBT/fHVUW0rQ0UKVcitzw0iSfdIjQfqkQFIkiy4AHOTIdWZQ9eiT5ahGrgglJhyudZlnvrCrmSKTc4a3Ntg4+tIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2c48z4XS4Qjc8+pI7MgasVpd38QNrcrvN5F4SWY/dw=;
 b=Pv/6W9fPcBIitN+O3aBOBDKQIAq47NTNa2gLTKVu87mh4MuVE9SuDcgtBJlofKCN/SEUbElaQr1TfAvdAR6fS+FOWWAO4Gw+mhv9Gj2nIpcZ4eiuERWX7nbqwlVjjvCeX5+QgO3GjdN1GLgDWIeOFwpTWgzSXz8ndkvK3WDO5kw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5835.namprd12.prod.outlook.com (2603:10b6:208:37a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 07:10:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 07:10:03 +0000
Message-ID: <85b476cd-3afd-4781-9168-ecc88b6cc837@amd.com>
Date: Wed, 24 Apr 2024 09:09:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] dma-buf: fix race condition between poll and close
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lvc-project@linuxtesting.org,
 syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
References: <20240423191310.19437-1-dmantipov@yandex.ru>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240423191310.19437-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5835:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ab3a07-f817-42fc-038c-08dc642d9032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFRyRUZ5T2hZT05rdWZYRXBYZDhMaTJBdUFENURqaTdlKzJBbjBLcDVFYklD?=
 =?utf-8?B?eGdMMjJYeHN6RVpiS2htcytDamJ2engwNmlPSDNxTS8vaDY2dXArT2llSWRC?=
 =?utf-8?B?YWcwUDB2VHFSajRmbUZQTnUvdEFnTEJtOGFDclVVcCtzRk1sS1BZdzRlbEdP?=
 =?utf-8?B?WjczZ0tLL3I5dWtDcWY3NmV3K2FZSVB2UmkvSzZEZ2RWei96bUVoMmhra0Nn?=
 =?utf-8?B?a2VCMnZPb05FeGF1ZDZ6Vkw3aU9XTDVqRGRrL1lsWlJiMnhUY3c4OWNwRVB1?=
 =?utf-8?B?RGdPNnYzU3pmUW5RTEx4cjdDNXdWSllJZGlta2xqWHpZQW04bVdnWlBIaUlX?=
 =?utf-8?B?bDZnY1dqeHFvWTlOTHNCaVZkbjJHSTFEN0ZLVzRPUGJuQUlocWhJaHUwUDdJ?=
 =?utf-8?B?azJvUW1yb1QzRm9hcUhGdkEyOGxCYjhnQVByTDVrMVY2STRzWlJaMDZ3bVhQ?=
 =?utf-8?B?WHVUaHRaWHRIL2todTZjaWViVkFiTkxwMllIb05XL3JqdWxVbDR3elY0bk1u?=
 =?utf-8?B?U21OU29pSGxUSTNpWW9sZnBOZEEyaWIydFZXd2ZMV1dEeXYrZDhZOE0waWx3?=
 =?utf-8?B?Q254KzNJR1FaVXBhS05KaGFZaml1OEhRakNHMFJncWl0cktlRzhqcWNuZTZV?=
 =?utf-8?B?bi9OelZ1aWxyWStYaUh4ZkROMlgzUGJZRFBYVjE1TlIxcElnaENZYllKbmkr?=
 =?utf-8?B?ZXNoMGdYNnY3alhlK3RiRFF0WSt6NUhsdFNMa1hPZXo2VzhQMzV4dTBvWFh5?=
 =?utf-8?B?enkxRVppSXd0ckU4QTdjQ2ZWQ2xKWklaT1Y2Sm95ajNad1RPZzRabnVIZTRW?=
 =?utf-8?B?ekd5NUdCejRtcmdZV0xGTnlFcVZ4NDRqSGY0a0tJWmlnOVZ2ZFRnNWFlN20v?=
 =?utf-8?B?UWhqSWcyWXBVVWpoNk9HdzdoYnpyNFRTTnpHVmdhYTdiY21zTjh5ZjRYY0Rk?=
 =?utf-8?B?TDljc0ZyQXRwUmlWTFd0VTIvYldjanc3NXQwVEpyOUFXdDJzWmlGMnY5VHJl?=
 =?utf-8?B?dm9oSHlYaHR3OWVwY3lCVXRGcDFtdHBFci9ZQWo3ckhIUUJtbWpNaytWRDlP?=
 =?utf-8?B?bGtrWTRPOXNSRThHbEVMWDJLaC9sOUREdmVrcVVNS3VjYk9hYUxFNEJYcGlX?=
 =?utf-8?B?UmQxZDFKWUVHQkVQVm1DSWdRaHRYeEE2K1FBSXE0RFByeGFxWVNPNzZkUmV0?=
 =?utf-8?B?WG1IbFRzZTRYQ3FHQUFFTDlsc2t3K0pTdmc3UkZzZk1FNXQwaDdISVEvRFEx?=
 =?utf-8?B?R1VWbE9RYU5rN2g0SC9uNjhOaEFla2FhTnM5a2I2NWtCZVc2YStmd2cvMFZS?=
 =?utf-8?B?YURtclJCZDlSRlduQ2ZieEI0M3ZJT3JzNDIvUkEyR0VhUFRBdiswWEpoNGk2?=
 =?utf-8?B?UUw0WS92R0NDZEczSG43TUV0cnF6Tkl5RGVOTzkrK1RxTFg3M0VMR0t5d3p1?=
 =?utf-8?B?eVEzSmdTOVY3SUI3bmxQU3JGNGdlZ0FsaDJqamU0MFpLSld6WlE5d0RvVjdU?=
 =?utf-8?B?Q2FySjhhSjlIV3p1MW0yZ1lLa0dMMTQ1NTBHRk5Fa2RJQ3RqUlNtZTliWFBk?=
 =?utf-8?B?QVo2bUIyd3hzYnBzZXFLdGdTMm41blVRbUlqZW56U2xGUW9JbHR4YWlqU2NN?=
 =?utf-8?Q?CjILkegeth0b6RRcbZdc/uJytBlsMNeE23O5AnFucZDg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTFtdXU4K3RNUktYSDRDcGs1NXdvTlZKUTFTSTA1d1ErWDFPdmdRMFZkTGFP?=
 =?utf-8?B?eCtXOTIzR1loTGpnMEhtOCtEOTB5M2Q4NG42ckc3Y093NndEUUR5cE0rcFNt?=
 =?utf-8?B?TXlNYXN1MUIvSURNTDRCNVZRK3dqUkhuZmlpV2syRUovMlNrZnM5YUxPb2Nj?=
 =?utf-8?B?Mm9LVm1MWXlPdHJNUGJIQm1NY1dnT2ZXdW0yamFKck9Wd3hwb0xOV3NkcElJ?=
 =?utf-8?B?enU2dU1ZVWFwRHE0OUpHbWlRcjdOdmFiRDF4a20vbFZuUWtWaTZ1b2tTMGdj?=
 =?utf-8?B?L3pMeFNBNGY1MGZ6M2tMOHRpSVVnY2VqaGR2cjE1MERaaUhoOU5ZMTlVZzJ1?=
 =?utf-8?B?Y2FqWjEvN1pKRXZIN2R4SmQ0YmpNbjNIVGZMZ3Z5bldYU1VGdWdJdWNzS3V2?=
 =?utf-8?B?cWtMMTRiR2JBVzlnaXplWHVjM2ZrNG1lVkMvdW9ycHRZUyt6K2pPTmFTZDlk?=
 =?utf-8?B?SU9Pclc1M2RPMStWaWdMcmhGckFsbDJOM3dXa2JlU3pLK1JudG8wTTgwdnZ5?=
 =?utf-8?B?bG0wSGhWV1lIcnIyZzdrdnJyMkZwbHVWbE5zdGFOMlB0c1NVcDdrZHRkQzND?=
 =?utf-8?B?SnBROGJ6NHY2enBsRnpjMGZnVUFyRERYb2lBOUFzYzZWQ3ZySSsyRHpTcGM2?=
 =?utf-8?B?VXdVM2ZlZ25JcFJrbk96Q0JiaDRBU2ZzTHc4dEFSSGpRMElnYnpycUNUa25l?=
 =?utf-8?B?ZTROcktZK2hiZVpNa0hVUnR1WkM3T2lIcW9wTnpRbVVydzg4UVpVbDA5OU5y?=
 =?utf-8?B?azliTWJOVkcvYTFyL1hLQkVvK0RRSkRHWm1HZWpGOUI1c0gxRGFWSldsZGs4?=
 =?utf-8?B?NDZEL3VtbjJITnBZLzg5YlhNZHZBUjlySER3bDRCNm1tV1JlY3B4dm11cHZE?=
 =?utf-8?B?WUNTcitZKzI4ei9vNzdOeWc5VmtIN0ZWS0gxODZITjNUcVVqZVpMS0tJSnZF?=
 =?utf-8?B?eVFLQTY0MWI2VVRSN0dyOVBaTmhnOGhLc0hrNnpMUVByQU0ybWpGNmxLNG13?=
 =?utf-8?B?VVVoZytJY21JKzZFdzQvYUgvZzh4RS9Xb0Y4Z3dhOUVNMmF6bEt6Z2E0ZDFk?=
 =?utf-8?B?bytjRjNTZGRuNHBaWnhNTHdxTXRqNTB0eS93VXNiK2JFcVpqVnh3Q3NtWFB1?=
 =?utf-8?B?V2FyVkpNVVRyUE9UNDZGTkJ0Qm4wZG5qbjNHTFRBNVhDYWc0RlVuUlM5VC95?=
 =?utf-8?B?UDR3ODBHSm5oWXR3WG8zNmU2RklScm5rcVhoUFlkaVY0ZEZLQ2ZlOGpTRG1r?=
 =?utf-8?B?dlZjWkZ6MjBlRlk3K1MxUWZIOGZ5cTcvbTlpS2JISGlVWHdPd0ZVdWFNcDFN?=
 =?utf-8?B?ZUxYWGRsVC9JYVlkcmRFTU1HZ3A4RXJnbjNSQU9nNjhoeGt6UlZwU0lWaXBE?=
 =?utf-8?B?MUptYkFaNW5QMm1QbWY2bEE5THZybUJ2a05sNTIvMCtDV0kycm1PdHRDUVhH?=
 =?utf-8?B?YmxQUm5JaWdpckFpQTNjY1ROZjMwWjF3czdDN3RHOWIrckdnWWJ4bG1OUG0x?=
 =?utf-8?B?SjdMWlBqcndaUUVBWjNCbE9UWHJZOEZtZWZFRDlWWmQ1V0FiTjI3Nm8wSHhZ?=
 =?utf-8?B?Zk54cGJpUEcybTFzWUVFNVA2TkdoYU5JRlpNcXJReWZLYXpJVVdNa0xFcGNw?=
 =?utf-8?B?SElzdUJKKzRKRVV5bEJRT01FTWtWT3lnbW5JTUI3c0JUZnh5bXNTSXhQTnFk?=
 =?utf-8?B?akZRWnFHWmdHSksvUklHN2pNR1lvZURGcjBSeVBoZjRqZ3dQU2NwUEh3VHho?=
 =?utf-8?B?WmN4MGtaQUpiVnNIM0FYL05CTStIcWROQnFKS2I4VFhSc01VRmN2NDZVcklI?=
 =?utf-8?B?SVlFdkljaE9wOHkzeFNvWThNQzY1V21RZ1YwaEZ1SFhGRG1iN2t2T2xnV2Nl?=
 =?utf-8?B?ZFkwcE8vbkFrcy8vSjdhOUJJYStHSFdwZkJXd3Ywa1I2OTJGSys1anZndjY3?=
 =?utf-8?B?aXBDbytVVGd4dWJmZGhlMUxMQUNIZUJWeitKbDlIRnlxMGRPUE10NThaU0ll?=
 =?utf-8?B?OXRRZGtCbnp0bGsrTHdyNCtGS3NlVWJkS3RLU1hLNnlEY3FqNmhYK1hHTits?=
 =?utf-8?B?eEpDYnVjSHhBWERmdllmb1dQbkI0R1J4blZVRm1iV3pBYkgzS0JhMFgydW0z?=
 =?utf-8?Q?KG/Q3dPIT3f1B0jb03dLtDZkF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ab3a07-f817-42fc-038c-08dc642d9032
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 07:10:03.6531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtVarH1uZiCyksxgJKkJm3YVP/bFuWf57yq+SxCY5wgMZvsU3My3RbhjCMqijSz+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5835
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

Am 23.04.24 um 21:13 schrieb Dmitry Antipov:
> Syzbot has found the race condition where 'fput()' is in progress
> when 'dma_buf_poll()' makes an attempt to hold the 'struct file'
> with zero 'f_count'. So use explicit 'atomic_long_inc_not_zero()'
> to detect such a case and cancel an undergoing poll activity with
> EPOLLERR.

Well this is really interesting, you are the second person which comes 
up with this nonsense.

To repeat what I already said on the other thread: Calling 
dma_buf_poll() while fput() is in progress is illegal in the first place.

So there is nothing to fix in dma_buf_poll(), but rather to figure out 
who is incorrectly calling fput().

Regards,
Christian.

>
> Reported-by: syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=5d4cb6b4409edfd18646
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>   drivers/dma-buf/dma-buf.c | 23 ++++++++++++++++++-----
>   1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8fe5aa67b167..39eb75d23219 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -266,8 +266,17 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   		spin_unlock_irq(&dmabuf->poll.lock);
>   
>   		if (events & EPOLLOUT) {
> -			/* Paired with fput in dma_buf_poll_cb */
> -			get_file(dmabuf->file);
> +			/*
> +			 * Catch the case when fput() is in progress
> +			 * (e.g. due to close() from another thread).
> +			 * Otherwise the paired fput() will be issued
> +			 * from dma_buf_poll_cb().
> +			 */
> +			if (unlikely(!atomic_long_inc_not_zero(&file->f_count))) {
> +				events = EPOLLERR;
> +				dcb->active = 0;
> +				goto out;
> +			}
>   
>   			if (!dma_buf_poll_add_cb(resv, true, dcb))
>   				/* No callback queued, wake up any other waiters */
> @@ -289,8 +298,12 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   		spin_unlock_irq(&dmabuf->poll.lock);
>   
>   		if (events & EPOLLIN) {
> -			/* Paired with fput in dma_buf_poll_cb */
> -			get_file(dmabuf->file);
> +			/* See above */
> +			if (unlikely(!atomic_long_inc_not_zero(&file->f_count))) {
> +				events = EPOLLERR;
> +				dcb->active = 0;
> +				goto out;
> +			}
>   
>   			if (!dma_buf_poll_add_cb(resv, false, dcb))
>   				/* No callback queued, wake up any other waiters */
> @@ -299,7 +312,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   				events &= ~EPOLLIN;
>   		}
>   	}
> -
> +out:
>   	dma_resv_unlock(resv);
>   	return events;
>   }

