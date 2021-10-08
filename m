Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D0C4267B8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 12:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1884A6F415;
	Fri,  8 Oct 2021 10:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266916F415
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 10:24:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grzzX2bv/KOtFKvj8TcPDWaSCTdDlHIQTQoj3/SkUu648tuzEA6a3kth53d0I3iZBRJpYlVLSyH2RpuD1UQvFq+QW3iMTVvrwixaRq9fBQFS9cyDKqR8E74mOk8fKzauXw642uPB86h8ZBC4teRjNLqrDcUc83meb+lkNGENZWGnT3DGkF/akssjpll2YxK0rS2Xjsm3vXAnRfzUOgBs8X8w1hkXU16VlsajoGmx9oHByHWcQekbyTQOloG3TOPBiUwwCveHGkE1/wxy2sQbjxmR9MT6kZIONzUvLZrXYjbATdU8SS25Lr5kW0/Y55anznD7D4l2+hL24wcKoTJdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSgI1n9OX8M1wngxHyzalUPKmItZYwTszpp53TBTQJ8=;
 b=Fbw48/ue1eVLYoAzIMZNQWVZc9+QtUjrxhqmVE9vSdnTYxYPTHTKINNLTwU+Vsl+jBtZLc72s4TsBH5AycmG3KSNXLghE7/BJhZUEAZnKvI2V8z7FxtsrMBVfLsW2CAAdCzRA7m4JX8f2ZuwCWRW/zmYZQiPzWbF5fcvesEeU2OnRNosv1d7MmDAiwES6tmBK2/X0Yroh9/qFThtJDLLozYPGIX7k2J1znOtUX1c5JQFKpmnL3kHLZITQuOrp4QZ5VfXFUVmxvlghrSFX1zKKLfrZ/ELLdjkbV3Buz+3M+2VtlpKumAbZn1BrT3xuWfar8Gw7c/jrgUpoCJ8Zb1XuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSgI1n9OX8M1wngxHyzalUPKmItZYwTszpp53TBTQJ8=;
 b=O20ZIc/nzZB86+qWJoPTspf0ia/JWBfO9tXMPcP5ZVOWO2Hgx+jM4ZoYaM5gdXiNP18UrYD4BHsEd5eQfHF88J5hv/DweusVpX5IUaJp04VT4UD5dJbstLNI8O3ZSFra14ow4d4PFzc3uRImcLZmthBCAeV6MqxhHOE0TbeKG4Y=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4457.namprd12.prod.outlook.com
 (2603:10b6:303:2e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 10:24:14 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 10:24:14 +0000
Subject: Re: [PATCH v2] dma-buf: acquire name lock before read/write
 dma_buf.name
To: guangming.cao@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, sumit.semwal@linaro.org, wsd_upstream@mediatek.com
References: <5b7cdb6c-45f2-6b31-bfdd-5cc68a2fda5e@amd.com>
 <20211008075420.42874-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <169957a7-302b-1de9-39b0-415c4675743a@amd.com>
Date: Fri, 8 Oct 2021 12:24:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211008075420.42874-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0157.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::32) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:efac:61bc:bb73:d6b5]
 (2a02:908:1252:fb60:efac:61bc:bb73:d6b5) by
 AS9PR06CA0157.eurprd06.prod.outlook.com (2603:10a6:20b:45c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Fri, 8 Oct 2021 10:24:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d16ec1aa-ac55-48fa-f891-08d98a45c6c8
X-MS-TrafficTypeDiagnostic: MW3PR12MB4457:
X-Microsoft-Antispam-PRVS: <MW3PR12MB445799C908859C0E46B3823C83B29@MW3PR12MB4457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VE4SUBr6f7+R+U8ocdbuRZv46QZo8+6XLdGzqASLFu5zFQN/LZz8G0TKbURHQvXOVQUYHwKoOp2jTRflmoMzVD0DWKDZ+hU+ex2EqUeMywdzPnBqVIMVpJopNKKMWBgKM4ql2nuhx5hchkO3188wrqD+hOqAoiOfQr9OlOslzLBZDDEHnPeV3CECXNs9Z89EgVbukQDXyKEq02Hu4V/2JeSQpxWUAyWD8hteC4XLo0Gama8JeoVMM/xMMptTpixsAX8BX5e/cDzFzkPv4E0PLxRUZC5ii33JpOryp3GJVkGCzoC2Howq6Jw2ZZXJTXgOCR5MKMF0FJwvzffZj8j+kBwtR8d1IqjfhfMnufdOVh3VTdN3kH+OF/pWKUmO+xALu+GNb3CbJzhnVXQd8EJFOdV0ZSPUrZyX5l33k8cFvC9DlxhIWtIDBouTwRfEIXYUMtIQvem+VaoZoQBA81FaE7LwMNaWzuouOMaOm+1DA439O/fobIxhIkADkay9BLThXVypu7UUxjqKXyA9svzNqbfypTlS0DovDFd14ee3fChplsvMtUj85PAZxxIJUKQR2oG+ZiO+vrV1bT3ilFr1jHSewuEkmjXamWSB0+Lo9XmF9qRGty+P+AEn35TSz98j8vnKMo6BqnmwGP1V1Kzbc6IRAxdY3FPIpe+JeOjHMASPBQH/0xRi5pYOqwG8UCGo17beD0Awf8AsL4W5pyLDFOs23dPUrg+D4RWpEqeF4H0BTTzCbqecqBkwzap26qu2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66556008)(6666004)(83380400001)(6486002)(31696002)(316002)(66574015)(186003)(6916009)(8676002)(2906002)(2616005)(8936002)(38100700002)(508600001)(31686004)(5660300002)(36756003)(7416002)(4326008)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWoyS0VjWnpnSjBnMmdqQldzY0xFc2Zob3pUWGlhVkI4a1F1WHFRZG5FODE2?=
 =?utf-8?B?dkZmVDdqM2F2blNkeFEwL1dsY3AzcTNHVkdmUFVkb3plN0RhSjdGVHI2Tzgr?=
 =?utf-8?B?T2ZvRmVJbWZjdW9nYWdCYURVMU9vQlhSb3JkTitPVjVQTnczTzFJekx6RnJU?=
 =?utf-8?B?TWpJcWsvblFQdm1mL29UcjhPN1VsaHBnWVNYa2M2K005OXBtSmRKZjh5WnBH?=
 =?utf-8?B?ZjJtTmd0VkJBM2tOOU1Oem5paHBxQ0lQS3FqWXJjOS9aWG4wdWRCQTVhNERV?=
 =?utf-8?B?ZXFFYUplMGlleUsxSC9VQ2dsMlVuT0RMMzdJNHhWY3Q3Vmp0TGtKeklHV0Z1?=
 =?utf-8?B?VkxQQUp0cEdUWUhrekJGZER6RTNRK3BrSmN6M082S2kxaTM4UUNFc0hmN2c4?=
 =?utf-8?B?Q3MyWk9uOWhjVGpMZFNXUEszVU5lS2V1V3BNdU9YTUdLTXcyL0haSDVYSkZi?=
 =?utf-8?B?UWU5MEUvRWg2aUlZNUovZDFkRWFnN2lHVTRiN1l0eG95U3BrNUY5dXpqQ0Ri?=
 =?utf-8?B?U0hnbExCOHdqK05TTCt5OWRGOHQyOVdMQlNMREhwbFVSZWZGS3NObDR2eTVh?=
 =?utf-8?B?cGhQSHBicFZ6Z042blhLTk11YWlscktlY2ZCWnlIK1F2YXZORm5Xc3kycVRH?=
 =?utf-8?B?TjhIZDZMNUc5a0orOThvWHRaQTJ2bnJ2ZGMyMGdlUTVrdE1ieHlBUTFGMTY2?=
 =?utf-8?B?eHVFWnVZZ2xNcU5Hbnh4cHJOUnR6aklGMTNJRXhvRHFMS2VQL21XbHRPbTN6?=
 =?utf-8?B?R1oybUt2QURLRmxGbGExbzI4K1BCS3E2alptVW9QMUhRcTBpSkkrSUxxajhp?=
 =?utf-8?B?S1JueWhLOEN3eU5vTWt2VmFXVHBIYmszM1JUVEdyckdmRklSREsxNFdWazVP?=
 =?utf-8?B?aGZHQWh4QTZtZlNTTmtLdUNDRlRtb3VnVjFQajdSM08zdnJQVG5qcFJjS0g4?=
 =?utf-8?B?MnJSYU5XQWxGbUFxRmJXMSt2YXFrTUsxRTJoSlpNNnFzM0s1aFUrRGh0akhs?=
 =?utf-8?B?TTNWdTJCUjVmR0pGNzVKYld1WU8yOU1NTmtNaG4zVGVEMkR3cFgyMHROZ3Y2?=
 =?utf-8?B?S20ybm43ZGhJbmZ5SkY3U2V2OURBQ1RTK3JjY3NQbDlNT1J6OHFNdHpZbXlR?=
 =?utf-8?B?bEFWVjFTWnJoN21CZGVRVUU0RGYyK3JLNGpYeUtBa0pvTkh6S0pnQk5TRCtQ?=
 =?utf-8?B?M0dWZlUvRk40TlBRMm5uM1RMdVJhcnFwcm5iajZqdzV6STFMdnlXbXk4T2VW?=
 =?utf-8?B?NVREdFFLOFdKa3ZOTGtLSmNzUkdrZWVpMldqMHZuMnl3V1h4aXZLTElwNTdn?=
 =?utf-8?B?ZzBuZlV5b2ZUd0ZhaTVFbUNnUmFxdko3SFRXLzdadjZXeHpxN3R5ekZQNkpV?=
 =?utf-8?B?RG9ndzdkemN6RUhramFUWWJhYTQ2YWdKby83d1pDVVNHbDVQVzgzL1VDYkNV?=
 =?utf-8?B?MlRUMzltcmw2V1NiVnh5T1ozTjlkanc0czJkdG9pSjNKaWhVWUNWcmdSd2xI?=
 =?utf-8?B?VjJkNitFM2JLNHZMcXpiTHRFRm9LWndMaFRMUXdFcUpZRENuOFhzNURZM0JM?=
 =?utf-8?B?NGl2ajljcW5SNjRtSW9PblhrSlpEbG9vb2s3L3dBdk1HRm9PamlZTE1kWW1B?=
 =?utf-8?B?TldENnluVTBWbk9LeEkycUlPV2MzN2hJSHB3VDFNOENRMkNtbExDZ1RRNjF6?=
 =?utf-8?B?cGx1eDVMVGtITGFBOXkrd3ZCRm9SR0hSNnRydkVDdmxpbm5QMU5LMXV6UWRp?=
 =?utf-8?B?S1BScjFBSUFDR0ZrUFI1Tk55YUNnRnE1YXBWWXc2b1oySWs1QWhOTklWWkFD?=
 =?utf-8?B?WWt3K24xdTJ3b3BvUEttYXNnRDI0b2FJRXJjc0VLMWxEL2JudFFkeWExOGpm?=
 =?utf-8?Q?aDMAPy+8xIbDR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16ec1aa-ac55-48fa-f891-08d98a45c6c8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 10:24:14.5800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6soHBbQ6mrafBu/Gov1rihbLRv3i/RpbNtJlUmufgs5/RQhsWiU/RavSiSuAVrH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457
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

Am 08.10.21 um 09:54 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> Because dma-buf.name can be freed in func: "dma_buf_set_name",
> so, we need to acquire lock first before we read/write dma_buf.name
> to prevent Use After Free(UAF) issue.
>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push that upstream if nobody else objects.

Thanks,
Christian.

> ---
>   drivers/dma-buf/dma-buf.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..a7f6fd13a635 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1372,6 +1372,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>   		if (ret)
>   			goto error_unlock;
>   
> +
> +		spin_lock(&buf_obj->name_lock);
>   		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\t%s\n",
>   				buf_obj->size,
>   				buf_obj->file->f_flags, buf_obj->file->f_mode,
> @@ -1379,6 +1381,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>   				buf_obj->exp_name,
>   				file_inode(buf_obj->file)->i_ino,
>   				buf_obj->name ?: "");
> +		spin_unlock(&buf_obj->name_lock);
>   
>   		robj = buf_obj->resv;
>   		fence = dma_resv_excl_fence(robj);

