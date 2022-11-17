Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F19262D7CF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 11:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F78210E5E4;
	Thu, 17 Nov 2022 10:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2063.outbound.protection.outlook.com [40.107.101.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BDB10E5E4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:16:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebSYXn1C5E+DPP20J8qehvI/fuccj7I4SpdESZNvHGidGT9fSqHBsjaIKSfogq+UQvv/dE3F83hxl7fre192TKDIWoGhMb7XvU13uOLgVvIgZ6P1iWNFuSCpapLA06hGcYQqIqG4hjva+I4+r/Fpmf8yuKsuixZ2lujSsuIUIPybXpeTebcwcAQcY0qeSZ2rQtYNT2U+MRZCO1tbt3olsa5U4Lu1txV64HJAtGYGmlSLMQ4dJ2Bd7htc4bXG3GXGBXA7fY6m3E1gHhC4bv+X1l5CHJsjavk85ene4RYQX2leUvLsCwGwnqDDEucZqleeg4yt6yK4x+NDmk0dVRLU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdNP3d7uZnqEOwrnXF29NxXc0xyThAH9iT1NgA81phI=;
 b=BwziglQdxao5IIKFEU25Dijnzot8TWhgkTVLtg7xwq7w+L9jYPS7M6VFBvuOMo9K2oY78VcSEidKWXFQVeiGiZF6u5FXx0SZd+Njj03gYOcQ/fffkDaKTW9pohDNwg1SgtphPAq9FW+Q1B/QDr+u1UbMmqrnyzKG4c7FCJz8yG/2CfylkCoy7WIN0fZd0rHQg+1Nt8wS6rLPgGES18hd+v6YaWyCP5uUnYqQqa4/PaahzSXvm4m4Ojs9w1fIodNP1H4LGfAhh/luzGf+qMc7r0oA9ZcQx2KIeNSNLcv+rUP2BQavlHlXpPDc0oj4ZP7MYTxtegweCo/Xcel6RdzUJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdNP3d7uZnqEOwrnXF29NxXc0xyThAH9iT1NgA81phI=;
 b=xIu1/ZVjChSSwi7HNkFyOgD50MOh5/IRZ32/l0RCz8hLcn3NpDIHSlxBCQ6W6pYQq79k6mrU9tm5YFI8SGm5WqW70UXQOcRfz8yUZ0FTuHCY/5V+RQlYha0FDj1YAn9avRSs9XLchHTE0hihIJby21ms0gWfT19YBgXNe+bO/GQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5609.namprd12.prod.outlook.com (2603:10b6:a03:42c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 10:16:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Thu, 17 Nov 2022
 10:16:24 +0000
Message-ID: <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
Date: Thu, 17 Nov 2022 11:16:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
Content-Language: en-US
To: Charan Teja Kalla <quic_charante@quicinc.com>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, sumit.semwal@linaro.org,
 tjmercier@google.com, Dan Carpenter <dan.carpenter@oracle.com>,
 Pavan Kondeti <quic_pkondeti@quicinc.com>
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: bc88bf7c-9916-44d7-273b-08dac884c7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0IHynsVd6teLHp2LImVccL+P1SlCO6D1VgrUWa3RUXzAWVGTIG3bsjmHabpIUEDQ8807Fto/n9mz7rM8v/1KptCdeyZ3ak8dtjGju/jMht7HcNLf5LUKjnYS6/hAs5vUt71qabL+KbLGL7MumR6IoYQ1pgkCv7Tt4LMK9B60ehHSGFo+ggnqQ86rIA66DAvsSfhbukYZWocCGrXwiyGHzPMHkhm8tKvtUmFE+92uWv04DLk+GWpKRy9VGOoWa37J12IAGGkF4Du+RwX6klViX1B8lkhV5hAnkD3ige1hpizNsnWqWKKWgsK1SkWC/lEtEqpqpeSkfSqS/TfQi3b0kAwK1FNFl8UV+Y3pG8zcKaqpGUaLnFyw6K6NcGMX0JtWPA1uIzGDtJsZhfwQKFUhzo45PR/lfab/ft7dYVmJqjAb25JMc/fPHEw/LD0uzLMQxWxmThQQP8RtZorYpAoITYG0erOgyZZjt2najz/WjmbTFiUKvnMAHMUqhQmtvt++tWlUc1Nxos2czHN4ypS0tJqE+96a56FQjqWQBgN2HoecpnEggAWf4TCmaV3klLBjo2iWbstYJ2o/Zje1AVXEE1BEEiyfSGpSb7F8vOddVFc2tSujgW6/5AAvyLqcgyC4fRWuAv17tXu7HcNFNU9teS+wzZc/riRlbStv4MBq7vgkmZPQCo7/g3BLaX+A5a8rICWdeoAYjsROAXUm1Qxk1n002tkE4NnSmShdIgiSHjPnMk0rM+IGWcKq0qHzhRbJa3PcNDaXhSEwvjuRVXgLnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199015)(478600001)(45080400002)(31686004)(53546011)(6486002)(4326008)(66556008)(66476007)(8936002)(2616005)(110136005)(6666004)(8676002)(66946007)(6512007)(83380400001)(26005)(41300700001)(2906002)(186003)(5660300002)(86362001)(31696002)(38100700002)(316002)(6506007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlkzVVU4cloxUG11aDBwbWJ5dTQ1WXNtVXVjbUx0SHUxRjdNN3RqamhoczZE?=
 =?utf-8?B?RGpFYVlSaUg4aW1RTkM3Wi92YXNsTVF2VGFIQk16TnRYaG5jY2kzMjVMalhK?=
 =?utf-8?B?N01kU1RTUkM2dmRGZVN6cmVMQXdrQTlRZk44MDA5YVdCN2Zxc0U2Z3ZBdnZl?=
 =?utf-8?B?amNLQXRZNVpMNXlKQnRDRzRCa1ZnTDh3OUVJRUVnY1FyOUhRd2M5VXN2UmxF?=
 =?utf-8?B?WDkyb0x1WVRtYWlEc2FhUnNTZ2szcDNsZklLTHNsVjN2cHlNbE53cGtMcEFT?=
 =?utf-8?B?MzFvbTV6d0g2UmFuT1U0Q2p1cDBxdVppWDhCOVFidlpuVUloMW0rcklMMHZI?=
 =?utf-8?B?L1VHOTNlQUp1VjJ4Q01LUHBjU3dra25SOUVJcWpqY1kwVGkxaU5XVFBrWlBN?=
 =?utf-8?B?ZFZhV2h4dTlsOHBrVHpib1JaRU5peStnWVpNSG5JSHA1bjlPUE05Y0VZbW9w?=
 =?utf-8?B?SzR1NXE1T3FqWExCamkrQnFKNVBhaXJXKytOSmZEajROWTFxQVJWaG9ET053?=
 =?utf-8?B?SFFnaGNGOU83cVFmcWVqUlZUNitHRGFaakdBSzhTZVduaG8yZzlYRVc5RnJm?=
 =?utf-8?B?V05JZXl1aHN4NGQrdy9yWXVQUThodUJTQmVGcFRLTkJRSkdWV3lsOXcybkJS?=
 =?utf-8?B?V2hoa05wNVpxMnBXT09zL0lmeWhUTXBJYW9HbVhOOXZwOGdTQnVVb0JIRGVw?=
 =?utf-8?B?TW9VaFFhY1BRbkIzRWJyKzkrSTI4YmwzcUJzU3htN0NkMHJoNXZSWisxREwv?=
 =?utf-8?B?aVZIRzhQWjNsUmNNeDNWeUxNVXpVOTBSNUFCWUd5dGZpUXBmZ2ttcng0SjNJ?=
 =?utf-8?B?bFZEb0JEYmtrdkJKUEpXdnQvQURKODB4OEROV0t3M2RUZ0VlRHhZbXh1YmJS?=
 =?utf-8?B?cnlKMldFVDZqOGZEOXROT0lBdS9ZYjduMVNUcWViOGlJOHRaVXJpVWRzTENv?=
 =?utf-8?B?czlnU2twY0ZESzFPdElNZ0tPWTV1K0V3ZkFEbnVZUEpOZGxuRmtGVjR1WFRs?=
 =?utf-8?B?WnRWZGlkbzNvcCt5NERkNEZYYUJ3bm1tSy9YUXpYZVBUWEo1V3VsWDZkVUJC?=
 =?utf-8?B?Qlc2ellhZS9Xd1BxL2d2ZlhhZzR5OUJYSUkrelQzN1FacVR1UnpxcmVPekda?=
 =?utf-8?B?RHlWaTJBODI3d0tXVjVGSjRGV1ppSjZiOUs3WXU0VG8yVVpUUG1IMTQ4eXVB?=
 =?utf-8?B?dkplekZlOGFYRHEyNkg4YWNGSzRpOWFBbzl6eTgyNDVXU0JYQTdmNm5OcXhR?=
 =?utf-8?B?NnZaZE1obEU2SEI2dnkxN2c2eFMzV2ZrMzRkckh6a2dLV0szVXNMcGYvTVk1?=
 =?utf-8?B?aktvS0dtQUNDYzdCUTAxek1HakJJZHRwaFBoS3FWcmJKWE1kZTY1ekRBSXBw?=
 =?utf-8?B?NHFwRzdnSEVJaitoYkE2MGx2amJSOC9CSnJuNE9XVHRPZVIwdlU1dlZmWmJD?=
 =?utf-8?B?YytrU0cwMDBJWFFVa3NaMk5kN1NaOHVEWjEwTDJpVFVrV291WXdsc2NTQzM5?=
 =?utf-8?B?UktvOUdWV0xsSDRHSGxHMU5TKzFhaHRqYjdaVi9NUHprMDRNYmdlYVlSTjhM?=
 =?utf-8?B?b1VRbFIrakJ6bTVxZ0xtczFCcGdKSDQ2ZjJNUG5KdDhVeUVUNnFDelZhQ05Q?=
 =?utf-8?B?WDN5VWk3MW81T1ZCRHN3Sk95VjBxbGxKcjVQd2xZNTJsa0h3a09YMzFVZUlS?=
 =?utf-8?B?ZzFNdkwxd3dXZGg0L01MZEFhWi9KOGN2MEZXM0RHYVZSajBpZmFVQksrcWdL?=
 =?utf-8?B?SWsraE1LUDl2a1dsaDFHeVlCYUdyb0ZteXpsRGFmdFhKYmcxOFIvTTRkZlEy?=
 =?utf-8?B?TTl5VG50N1dXQTRmSFRYenhwV0RHemx2ZUhhYTB6V3NPQnVDUkxMRER3TjdO?=
 =?utf-8?B?ejAvS2Q5eXN6Nk96MmxzcDVVYmh3dEVaQXo3Y1RZbk83ZjVBOVV2Y3hlVS9o?=
 =?utf-8?B?NUt6d2NzeXZ4endwdlRUOFo3SkRTVjkzWm92aW5SSmNRSFd0WXY0TzFubXpJ?=
 =?utf-8?B?L0RvK2k4WEdYSkV1MGlTZ0pjT2xkODRDWGhFYmttanVuVUZrSjBBYUdyNml6?=
 =?utf-8?B?N3hwaXpwTkIxMVRaNUc1d0JqM1lZNmVQSzhteUxyRzdqb2tJRG5JL1dnajZ3?=
 =?utf-8?Q?ehpCnF7evC/iHDxwI6O5wjdPM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc88bf7c-9916-44d7-273b-08dac884c7fa
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 10:16:24.3738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+4GwVmgfFMRGFvUWhDxxWJEsdyrmHNsTxsH70jIZA/q96R7S6A3VdsyGqsUJoCJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5609
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.11.22 um 08:48 schrieb Charan Teja Kalla:
> Sometime back Dan also reported the same issue[1] where I do mentioned
> that fput()-->dma_buf_file_release() will remove it from the list.
>
> But it seems that I failed to notice fput() here calls the
> dma_buf_file_release() asynchronously i.e. dmabuf that is accessed in
> the close path is already freed. Am I wrong here?
>
> Should we have the __fput_sync(file) here instead of just fput(file)
> which can solve this problem?
>
> [1]https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220516084704.GG29930%40kadam%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C115292dd7a874278b3ed08dac8701320%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638042680960627756%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=NYNIAJjt%2FSUXoc3wCz2vPvo%2Be%2FIVcABEA2JYZ8%2F2q04%3D&amp;reserved=0

That doesn't look like the right solution to me either.

Essentially we have two separate tear down methods for the dma_buf 
object here:

1. It's not completely initialized and we can call kfree()+module_put() 
to clean up.
     There is actually a dma_resv_fini() here. That should probably be 
fixed.

2. The dma_buf object is fully initialized, but creating the sysfs stats 
file failed.
     In this case we should *not* clean it up like we currently do, but 
rather call fput().

So the right thing to do is a) fix the missing dma_resv_fini() call and 
b) drop the setting d_fsdata=NULL hack and properly return after the fput().

Regards,
Christian.

>
> Thanks,
> Charan
> On 11/17/2022 11:51 AM, Gaosheng Cui wrote:
>> Smatch report warning as follows:
>>
>> drivers/dma-buf/dma-buf.c:681 dma_buf_export() warn:
>>    '&dmabuf->list_node' not removed from list
>>
>> If dma_buf_stats_setup() fails in dma_buf_export(), goto err_sysfs
>> and dmabuf will be freed, but dmabuf->list_node will not be removed
>> from db_list.head, then list traversal may cause UAF.
>>
>> Fix by removeing it from db_list.head before free().
>>
>> Fixes: ef3a6b70507a ("dma-buf: call dma_buf_stats_setup after dmabuf is in valid list")
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> ---
>>   drivers/dma-buf/dma-buf.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index b809513b03fe..6848f50226d5 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -675,6 +675,9 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>   	return dmabuf;
>>   
>>   err_sysfs:
>> +	mutex_lock(&db_list.lock);
>> +	list_del(&dmabuf->list_node);
>> +	mutex_unlock(&db_list.lock);
>>   	/*
>>   	 * Set file->f_path.dentry->d_fsdata to NULL so that when
>>   	 * dma_buf_release() gets invoked by dentry_ops, it exits

