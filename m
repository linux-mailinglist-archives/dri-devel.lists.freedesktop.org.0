Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681024264C0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 08:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01586E0A1;
	Fri,  8 Oct 2021 06:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6DF6E0A1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 06:38:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caUDA+d98zkWVC1ZMAzFvq9MTYaKBmNwEY3xt2AxaMQGyv9nO+dDRd0bcg6IWEOQiutDGiBEGaCYYwmMwoITAB1VnwxYdYYItZRV2uLEcl1TwCSPu78MdKdXjerlK3MqUV/sODE3L0FJZ63kb27vaD11ezptbdakh7Y84wTZwLEwQY9ct/yp2FSb4aVT9RR4Yv4qKaWnqel89A0XVRUh/LfTO7ZEjUR60iR15JC/x4ApD067d24TovsMm0uF+CFlJjNoDj6t8moZxzmiLGmX422zDpoECWtGeuhZfWM+FepdQG78wGIaM+JdmJQ7va9GzCZD9fEW1B1sw+gYInT6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfntloW1/8jqQt5frkYyu7KmltIQEdgNm/0O8thuSeQ=;
 b=KIu0WedbtXtLseX+OXfOBgH+Uf/u4b/CVYgUf/Z13LiCl91b67qTOlJqLaimzW5PUmHfXzFan8u37yLNL6MC9MT3GzCXroJqng6dQOX+gDvVsuXjGas/wW5bPWB78l2NIbMCExWAljWD8U/lahp+pHMXc7gsvZMZrDrQ/9wMFSyGQHmynsnh+KgODJY7GBmuPAivRrFX/7tIW30EZN0ULykkwWKQO2+Uy6dzJu+ThouiF6o0Od0sRexP9vIE5+JpwFehWKKNYphxmDJesL85F+C3jBcuEAwsxg1tCqvL6AgoqFWVywlbPX6kE2/X22mTqfWG70Dcx62+aBqmJxMCYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfntloW1/8jqQt5frkYyu7KmltIQEdgNm/0O8thuSeQ=;
 b=JFkB8NYuFEetsYEjsc49+fh7Q9WgOEQCW4HAY6PURk9X5tXoCtrGB2O4Z9ndoGugHywva8cUoHsc5gN40H7zL+zcQdJt/cVvZ8FIaQ95oGRwv//tfKt6v/7VYIlQy7G50E3XSBYrYf1o09hg+QrfITp2oa+NOp80pxOg2H9GuT4=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2363.namprd12.prod.outlook.com
 (2603:10b6:907:f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 06:38:36 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 06:38:36 +0000
Subject: Re: [PATCH] dma-buf: acquire name lock before read/write dma_buf.name
To: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: wsd_upstream@mediatek.com
References: <20211008062903.39731-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5b7cdb6c-45f2-6b31-bfdd-5cc68a2fda5e@amd.com>
Date: Fri, 8 Oct 2021 08:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211008062903.39731-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR05CA0054.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::13) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:efac:61bc:bb73:d6b5]
 (2a02:908:1252:fb60:efac:61bc:bb73:d6b5) by
 AS9PR05CA0054.eurprd05.prod.outlook.com (2603:10a6:20b:489::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 06:38:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97a6ea0c-4cbd-43fd-f48c-08d98a264128
X-MS-TrafficTypeDiagnostic: MW2PR12MB2363:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2363B05B47C78BF4C4406A2083B29@MW2PR12MB2363.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wzqws2rV79CaFv56fzgYsWPumi3zaU51mJkmQHeSojxRZHO5FK/NnbeRQWVeKWL4hxcaRXNMUtUG7I72Ni/yJKy+uq6GHXCdIMYToy6o/xaFWkrcGrFeFjbj38fPLzNdGhDbKzHwdVDNOpS5evqcuSxoCBhewhivgPimUexTVCg0HHmMM6LDpHt1ObfdqwW3kuKrwWid7TkspYhLFgRYXZmkXutHgU2sLNbsGLkTNgvTF+DMESiOnIGRELs7DL5mEINwt5mlxl7Q6ub0BJm4ZLX/pAG2L663TtC69Run2ceBLVLxQNDqHMEpcKMKlgWj8b7ahI9k7gD/U/Tf8O/El1ykeS9GVrpHyI8OJqYBzfJ2L+QgRMg0hb6FcKGYCYDxgi2eSGRlKZufCTATZpgf2cNySBHZue6kThbhVhtt2CPRypVD6QO1KxKjoT7H6aLKAv6T2rHAY364sg/jI0DYKI2PykDgBeD/e1g5e5tJa4m5Eks5cGUJlivxhbQHMFPrrJQdALKj0ak36lWyhwzeYtD9PU2Rw0AC22diPGfmha2fmul2AnMHODSxpMqxjDagsC/e4gy7eHFdue0rxr60P9f40kEe/jsRnRmE+g9OPiZS5Gg0WvsNRHVY1i8yr1kgahTNTz1P4Rutk/VRja1WBKxqPshSmAcsvXzUyInZgvxA4eBoSUzUh6JUC0uYemD5iqIPvop+Nfff10iBwGGswlzdQsKZmBAx4rVryhEvgbuDoDL4j7TJREXiADSuG3oH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(186003)(83380400001)(7416002)(86362001)(38100700002)(2616005)(8676002)(36756003)(31696002)(508600001)(8936002)(316002)(4326008)(66946007)(6486002)(2906002)(5660300002)(66476007)(31686004)(66556008)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGZhWkNGbmRVNlJ3alZYVWVVWGVWL05PdUVUSVNuT2UxMll0U09hWFp6KzVF?=
 =?utf-8?B?UXVGZklJOVY5UWJOeVBrY3ZxcTVHRWZKSURvKzNGanNDSVZhekZxc1RDeG5i?=
 =?utf-8?B?eXZlaW5RdnZaZ0d0dlNTR1EyRitRQ1ZocHBpMk1xcnFBYkhvOUFKcjRQUkpS?=
 =?utf-8?B?S3FrdTkxWEdLb1pVTHVac3U0enVaeEhVUHBXR0pJa283Rm4xTXBjdmw5TDFK?=
 =?utf-8?B?YnYyU28rVUVvQk5zQko1R242VEQ5QjMwSER0MDNnMFRrMzF4TTYwM1l5UmNt?=
 =?utf-8?B?VjdKT3FOVklxd3RqMU52dy9OTUhKbHI0L1dLQjRXTFlwVFJrblM5TlhVVHRF?=
 =?utf-8?B?bEJLdzcvRGlZb1ZKT0RqSWZ5TWJQTDRYUFFidnFLeTFOTldBV0liNTBvR2hr?=
 =?utf-8?B?L1NUczc4QjR5US9WdnVqTkZraTQvY3l3ZUtOeXVVNnZvd2swTExzdm1aTUhU?=
 =?utf-8?B?cHF5OTFESlhDM2Vaek1nYTBZYllzVEVqWHNPZkdOeTUvaFpJRDIvazd1RVVN?=
 =?utf-8?B?Y1M0Y1BFN3p0MHZ0Q3pDdUZpY1VWVnBtUjIyMTNNZmJobHFqY1hmdmtBTzBO?=
 =?utf-8?B?cis2K1U2SW5SWWhIeGNnYUxQVWNBc0xWQTFGVUFTVEtVT3JuWERuck5IQkd6?=
 =?utf-8?B?YWNCbUk1WHBqNVIybXFSQndtWkF4eW9WZVpWUGFTN2pZR0JPTWVqaTBGRm1l?=
 =?utf-8?B?NGM4ZExWZUppVzlobStQS1d4blUxRWNHQ01heXhDZUNDRG5TN0hlZjhzTkJJ?=
 =?utf-8?B?aW1UemcxQzg1bHdMT3ArdTdKUCtRRUVDT29Pa1ZxSDZ5NHd4UllTOGFBaUc4?=
 =?utf-8?B?R0V6bXNyWG0wNXRHUWNkTU80RXhyOEtyaWVhNnpNNkVRK1hjelpWeXg5ZVFG?=
 =?utf-8?B?VEdlb2JNaUlpMmhUNkZ6RURxSHhrcXMyWExrSGNaQ3NKVGtwVXZZWnVkeXFL?=
 =?utf-8?B?YjkyU0hINkNJZURvY21DOUpHdVF3ZTcvTzV1SWdBZU1WK2FqTkpKTjJuZGl4?=
 =?utf-8?B?bGxaVGRPa2pFQW5BcjBtWHoxbGVtVkduUEYwYkxYT0NJSFRzTFE5WXByMWxi?=
 =?utf-8?B?ZkNock5tNlNBVUZmZ0FCdGdJaTBUM3ROd1o5VXR2WjJjOWRZZjZGRE4xdDl3?=
 =?utf-8?B?aWxTWndaQ2ExaitvQ3poSXg1aHhDY3k5Ni9Ma29mLzU1a0N4RHhpWmppdVBv?=
 =?utf-8?B?bmFzMGdJb081TzJEdmc5RUE0R1VzOGNiNUJ1VXNqQnpzaFBIYWNVdVlrWXhR?=
 =?utf-8?B?N0MrSDgvb0pQeFluRlFGTktER2k4T2pGMGhoVEErZ29JSCtTcXNUZW96cWxs?=
 =?utf-8?B?ZjRoZDJTYytmUmlOVDRVcCtUU0g3M3VEbFB0SFNPYmxYQzNIUGFvN0dURVRj?=
 =?utf-8?B?MGpmUDhUZE1la25ncmhjRUV0d0ZUaG9GUTcxcHQvZSt5OEhMWGNHMHdPcVM0?=
 =?utf-8?B?R3paZXpLd2J6eGZ1WGM5VEZHOHhqSEFYWWhyaisrRzZwNFBJUDRTL24zTGZm?=
 =?utf-8?B?dElSKzdhWUU3WWVRbFFMcStJdk1jODBNQXZqcWYwMVhYaE9wV0FHWllsWmVw?=
 =?utf-8?B?TzBxOXpPaXB0aFVjL1RNUFVCZHVPMHRuWW4rcnNKVFFJK3R4a2NjMTBJdjF2?=
 =?utf-8?B?ZkN6Zm0wYjYvY0NqNHFBWXNhWFFOTHFtTDY5NTdSNDZ2azVvOWN3MlN3Nkc3?=
 =?utf-8?B?bldnRTd0NTA3Z3U0TGRhcmRKNWFiYnp0Nml3bGdTSFVZYXhYWEpwcTBwcC82?=
 =?utf-8?B?UytRRlNRR3JOQ21ZVkdIVVFhdW9lK2E3TkRBYjBlZVFZREpHUGtyZWZiN29B?=
 =?utf-8?B?TDZLTkd1a0NYRG4zbW9JZ1ZMY3pKNVY3MDNQQTZSMk8rdjR6MDMveGRuRkVs?=
 =?utf-8?Q?vBANA6SFkUTmD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a6ea0c-4cbd-43fd-f48c-08d98a264128
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 06:38:35.9008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9tnrYRi2lsFiOcfrrfrBajuVx+ZIuCcDukfW112Rf8zSY9aedAA1A7xsZu52sz5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2363
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

Am 08.10.21 um 08:29 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> Because dma-buf.name can be freed in func: "dma_buf_set_name",
> so, we need to acquire lock first before we read/write dma_buf.name
> to prevent Use After Free(UAF) issue.
>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/dma-buf.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..aebb51b3ff52 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -80,7 +80,9 @@ static void dma_buf_release(struct dentry *dentry)
>   		dma_resv_fini(dmabuf->resv);
>   
>   	module_put(dmabuf->owner);
> +	spin_lock(&dmabuf->name_lock);
>   	kfree(dmabuf->name);
> +	spin_unlock(&dmabuf->name_lock);

That here is certainly a NAK. This is the release function if somebody 
is changing the name on a released DMA-buf we have much bigger problems.

>   	kfree(dmabuf);
>   }
>   
> @@ -1372,6 +1374,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>   		if (ret)
>   			goto error_unlock;
>   
> +
> +		spin_lock(&dmabuf->name_lock);
>   		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\t%s\n",
>   				buf_obj->size,
>   				buf_obj->file->f_flags, buf_obj->file->f_mode,
> @@ -1379,6 +1383,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
>   				buf_obj->exp_name,
>   				file_inode(buf_obj->file)->i_ino,
>   				buf_obj->name ?: "");
> +		spin_unlock(&dmabuf->name_lock);

Yeah, that part looks like a good idea to me as well.

Christian.

>   
>   		robj = buf_obj->resv;
>   		fence = dma_resv_excl_fence(robj);

