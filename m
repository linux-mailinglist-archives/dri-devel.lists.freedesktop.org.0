Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C118643F7E5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 09:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0456E9FF;
	Fri, 29 Oct 2021 07:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308EF6E9FF
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 07:35:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEqFVwVwWu1+oXIXtPvTCKDAFiiL7jFu1JCIoHUWbpjs4O2m4LH/UXM33Z/QGstbi0gQkdbwtfOjN4xIDwAiIssb3B3CossCQGrKBfK0jIY4IXJXX8YhOKf5t/wI3XNypci6wW4x2MKxkAIBBQkCPmNiWr3KtVBX7p/sTM+OSIHxfv3CKxxDgCKUF9CJdjQMLgraW8TS1yXQLtUoUOiPupYP75tNO0flHrG0hnYcoU2D5J6VhIiK1uY5j/RhjkJrgSwEVuWdVI4xfO/ToVP3bC3TZ35GxO15FUu9QuDFOsaKTeH3MQkiBjZ8S7gD+4ehZxShyy/+TY3cH2BtHkErnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P55RarXZMaGwpDtoV4tVIGNKZTIOr2kIHTkHUb2xiPo=;
 b=R99OZEejtGW0foAOgep02fL8H7ca2MNmtalP85q0KhOYzRRCbRFK8wG7U7x+Ct+yW+NBjxnCSo7GMbCBgRjxPaUTCI5X3syE7Ml3ikkzkBaeIuC7Hq1UDEFo8qbNv4O54/GY3JV+rkUy1e48wNLg0zFyvl5AFRP3wYHVj7M4lqCQ2zDINkkDc6UPvGQwxGu7T6KThyBd7VRPNL8dcvv/d4EYVKSsct+IrbNr4rR0utDUDeDAScahFMCcm4ocuNVqj8yyqbTYfzIkz1Fm7b0lmoLigkdGPT+jIHHMA62JlCwMxs2iRXUNbMp+rpJ3bbVZzFHvEHWPIWp52neqgsg24g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P55RarXZMaGwpDtoV4tVIGNKZTIOr2kIHTkHUb2xiPo=;
 b=oFwa7P/JD6oZ8R6CY3P1yHWjqB9rZddYTO1W8CN+GwuTfetGMqz/M7WjRIN+a5Q0nWPPXmCmXsU0Qz0RqhxnmqSayIMHQIW13cTrknw7WvXie9/IEQe1ANtqJiNuIeUGdzIgzS5H6ppn/UDaZ5L3+HJbcZwIO6eBHJbF40Rv8gc=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (2603:10b6:4:5b::9)
 by DM6PR12MB4236.namprd12.prod.outlook.com (2603:10b6:5:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 07:35:00 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::9d0d:c67d:2610:ae74]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::9d0d:c67d:2610:ae74%10]) with mapi id 15.20.4649.015; Fri, 29 Oct
 2021 07:35:00 +0000
Subject: Re: [PATCH v2] dma-buf: acquire name lock before read/write
 dma_buf.name
To: guangming.cao@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, sumit.semwal@linaro.org, wsd_upstream@mediatek.com
References: <169957a7-302b-1de9-39b0-415c4675743a@amd.com>
 <20211029021541.101157-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ba926a86-1262-00ae-87d3-fa4150a1eb3a@amd.com>
Date: Fri, 29 Oct 2021 09:34:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211029021541.101157-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR04CA0134.eurprd04.prod.outlook.com (2603:10a6:207::18)
 To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM3PR04CA0134.eurprd04.prod.outlook.com (2603:10a6:207::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Fri, 29 Oct 2021 07:34:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47d1d1fd-9547-46c4-45d3-08d99aae9d12
X-MS-TrafficTypeDiagnostic: DM6PR12MB4236:
X-Microsoft-Antispam-PRVS: <DM6PR12MB42361C0C0B573932CF846DC083879@DM6PR12MB4236.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L5XdYxgtAvS70oE7VEAuMdr1ZFkIo+D0Nof/ZyoSUavHgDqhqexNVMzzuzHlnr3fG/KccuFQTR8Z5sbA+GUumOZews45pWT0mw2OhAviOaD5qeF0QJYv6lFIuipVkhRBO/Yer427Cs1wqiXs/MVMGi4PszHT2MBqKABP5oQrfOhL0ktwV+M1+TO8KEP1TvUOax/6lfJe6et8woVpTSNJm/W1FY87G3zK+CFYfOmKMUc+PZgumrwqckryRQ1oUNYs5Cum5ovyPDPbBLaWnMH8VxGZdH2WZDVwTquEIwZoewzFc75VxPD4mtrPQGWBg3K3vK3aD0LgTB3UPBiGEQPgQDT+HmQ5gHoa/r8iRPpBeI6D5u6m5cVjpx+Vynne8b9G2S1zLnMmdOs6vtDSCPsk+v8MC+X0tenhJdNsEjGRX3DjkAdlefai4ZvVAynqmNY1m1j1+1ignKXmaVZp7oooCv8Pc2w8MklaoHLQEuEgbR7VyhVg7CcrOsBZW/6hHwGiPL0Ad6FXB+RpkM5B59pLwli5gHYEtcEfI0uX0J1/upN4kT1PQx0WAw4x0P2jDkDqKSUD88hhsm65FyBJ6/DOD4v0OQJKmirsYGRpYwQmeYLUOuJZPmBbGdlCPrBVs6WvsxzOh6fYdYzYJkZOAhcjfC4D1zlL1v4t95t+EwKTTkayOx/qGXFBcnF5EPnPhw8uHbA641szAyUMXKQgUKHT6QFeS027foVxmLylzAo/K4WPrNtvSC2IItLGJozZXTnWTACWK9EVkytSZi2nlpYGXjd1FsGD1Av8nOfwY+HFPGFts9GlgBPPll4ENoLfRVPz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0187.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(38100700002)(8676002)(966005)(186003)(26005)(6666004)(31696002)(6916009)(86362001)(7416002)(31686004)(316002)(2616005)(956004)(36756003)(16576012)(66946007)(5660300002)(6486002)(66556008)(66476007)(2906002)(83380400001)(4326008)(45080400002)(66574015)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2F5eDNMMDVtSzFtRHlUV2RvcDFWb0lMUHJZZStiL0l6MW16NlN3cVpReEtu?=
 =?utf-8?B?eWkxaE42MUp4ZjVzS0JsR0JMc05MbVVJTDQxcGIzOUN0QU1TUzNJbFdaSXhS?=
 =?utf-8?B?bDZIWDBzaVIxZUo4UGN0UDBhVXQ3SXU5TjJaMVJ0L1FDMzFLbU4vOXFqMUFH?=
 =?utf-8?B?b1RDMnk4NnRBbndYU2VsNThVK0QyNHIwbUkrdVlzNGN2YnFNdHJ4SVBGdFNy?=
 =?utf-8?B?bHdxMkJCdllVNHRqNm83Lyt0RnZkNmJySVlGU2t3TEJZUGlCWkJuQ1lJT1c1?=
 =?utf-8?B?OEJFSXB5cXVCdklUYnNxV3lDTGRjTy9yY3YrRTJ1QjFtS2c5cWZLUEkwZUZ6?=
 =?utf-8?B?THlWWmVQTEs1R2Q2SU5reVZUbzZLVEprTUh2ZU5YdXNnMGg3bmo2Vi9GWXcr?=
 =?utf-8?B?bkg5RkF4dk9VYkloaCtiWnlDbm50VlpxT1I3RkcyTUNIajR6endxS0h4QnpH?=
 =?utf-8?B?b3ZSa0IrYmFQaWVreFZNakQvOG5PeGltTmJIbE4xaFlYZHNQelFMd0pMcEhX?=
 =?utf-8?B?VGR1bFFkYjRHTTBQKzgxTmNhWCtZdU5Tam5FRTI1WFIwL2VCUTcxTHJPUnZW?=
 =?utf-8?B?Wkl6c29yRExHekpjM0NaMjhUV015WTRMRlVER3RDOEV3WGU2YTd6YVZvdGFt?=
 =?utf-8?B?cS9pRTVBcXkzRldwY2dnUkZnREF1N0pwWUEwQUw0cjR4Q3hsdCtWVFNLQUd3?=
 =?utf-8?B?eVBrUlBiWlQ1Ym02MnlFVWN1bDVKOXhyMGl0NHYxMzdXOG45S2xNaVV4WTYw?=
 =?utf-8?B?cUVlUVBTaWpuUTZNRmhtbFlSRGhOWkVFZmtsWGk3QUcvQVVvWW5Ob3RZaWRw?=
 =?utf-8?B?OE5uUk9oOHJVM2JqV1JVVDNOVjFuTnBqR2owZ0pwR0luSjRwTHZaL2dPOG9u?=
 =?utf-8?B?V1RHejRBdkE3MC82U2hvQm14WkRVNE40K1FQYTJFaFEwRW8wV0crdmFUTDJo?=
 =?utf-8?B?QW1rOXhuY2JzeG93VFhxanNSMUh2c1Z2eXJ4Q0VOTWVJOGpUUys2d0pFMnQ5?=
 =?utf-8?B?NjhSYmpIVUFjMU9NeUZFQmNCRkNCSk1LdFM4cTV2aEFXb2ZrOTNOYU03aTlU?=
 =?utf-8?B?QmxBdHNLSnhzTmNMK21URUhudzl4MlB5cFFmaUJ0bWQzOGxReW43ZnkrdE03?=
 =?utf-8?B?R25vR05NNHFsVENiWXZLK1dIQnIyL2p4V1VMS01aQXRkMGgyRWw4UFhvZDNh?=
 =?utf-8?B?c0NvemRDZ01OUWFlelJRbmExRUVlWHpBL3JWMDRkald0ZXd0SDhKRktjaWxl?=
 =?utf-8?B?bUI5SWFPMVVoRng4VDlKL1d0ZnRlN0dKZENzaWlJMW5sTDBuVTRXRXdoUjdi?=
 =?utf-8?B?UFRnY0M5bVhhcHZLZEVZMTRNMDk1VjJFd1RMZGt4dng4Qzd0aS9oY0RudEN0?=
 =?utf-8?B?N0VvUklLYVUwTmtuQ1ZsWGFITmZCNVFQc0NFc01tN21EeFAwWnNVZldUSFdB?=
 =?utf-8?B?SDY2RTZ4WndoYXQvL0lPV0UwQ09adHk5TVFxejRrRUw4NDBjb0VJc1BycEJK?=
 =?utf-8?B?RmpBYmV2YUhyL2RjTXdOdnZuYksvSTZDMVBCV0c3S3lUSm9Vb2RyL3JqWnlY?=
 =?utf-8?B?MmcrRFp4V3pZc2wvTC9KY2M3Z2pObGFHVGZjd3pSZGNhK3VYdU9YcnM5R0RY?=
 =?utf-8?B?bGxIOTJ2QTlPd0JzbEcxVlkxK2VkellnZ044d25tb0FVK3B4c1FlS2dCZkFH?=
 =?utf-8?B?eXRUS0YxK0xBU3JrK2hrTkxScFBoWm1HQ3NoTkVONnN4THdBY1k1TXI4YjZj?=
 =?utf-8?B?N3pxeksxQ0FtT0lmdXQ4RFYwV1E3WWlwNEhzdzF1RWptbDBkZnNCMisxbGps?=
 =?utf-8?B?UkpWL1o0S2lkNW82NE5JVi8zY2JaY2N6Wk1CbXhBd09KMTV1ZDRMQkNkWWFn?=
 =?utf-8?B?aXc0OU5RbHFrQkR0bjZYMkpVeUEyTS9VemdiUS9xMXg2Z0NGUWFtcGNrRzds?=
 =?utf-8?B?ODN3NEczd0QxOGVlK3hrNmhhZmwrRlBvQ3JJNmN1ckZ4cmVLQk5GRTVwTlBC?=
 =?utf-8?B?enVremh5Q3pJNWRmeFlXYlIvejlEbG9oQzFvV2djTHJsTlhkeXhQenpCbHBL?=
 =?utf-8?B?aWVPeVZpeGc5NXlHQk5WalFmQThmSUN4Q0luUEtRWXdIbGtUeVJENDRFbVRY?=
 =?utf-8?Q?5IQs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d1d1fd-9547-46c4-45d3-08d99aae9d12
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0187.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 07:35:00.5100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOqZc4CLwfmH6vMrYbHcySvyj8mFCfBzbOwuRlgfSgmBGhh9IY0B++lFaG/59PN+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4236
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



Am 29.10.21 um 04:15 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> On Fri, 2021-10-08 at 12:24 +0200, Christian König wrote:
>> Am 08.10.21 um 09:54 schrieb guangming.cao@mediatek.com:
>>> From: Guangming Cao <Guangming.Cao@mediatek.com>
>>>
>>> Because dma-buf.name can be freed in func: "dma_buf_set_name",
>>> so, we need to acquire lock first before we read/write dma_buf.name
>>> to prevent Use After Free(UAF) issue.
>>>
>>> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Going to push that upstream if nobody else objects.
>>
>> Thanks,
>> Christian.
> Just a gentle ping for this patch, please kindly let me know how is it going.

Ah, yes. Thanks for the reminder.

I've just pushed this to drm-misc-fixes.

Christian.

>
>>> ---
>>>    drivers/dma-buf/dma-buf.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 511fe0d217a0..a7f6fd13a635 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -1372,6 +1372,8 @@ static int dma_buf_debug_show(struct seq_file
>>> *s, void *unused)
>>>    		if (ret)
>>>    			goto error_unlock;
>>>    
>>> +
>>> +		spin_lock(&buf_obj->name_lock);
>>>    		seq_printf(s,
>>> "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\t%s\n",
>>>    				buf_obj->size,
>>>    				buf_obj->file->f_flags, buf_obj->file-
>>>> f_mode,
>>> @@ -1379,6 +1381,7 @@ static int dma_buf_debug_show(struct seq_file
>>> *s, void *unused)
>>>    				buf_obj->exp_name,
>>>    				file_inode(buf_obj->file)->i_ino,
>>>    				buf_obj->name ?: "");
>>> +		spin_unlock(&buf_obj->name_lock);
>>>    
>>>    		robj = buf_obj->resv;
>>>    		fence = dma_resv_excl_fence(robj);
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.infradead.org%2Fmailman%2Flistinfo%2Flinux-mediatek&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C9e95ae08d63d440fc4d108d99a8200c1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637710705542841586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=HdiD8%2FX853nQ1vD8n0Qsfv93NaHCCIJF6Pb2rOd%2FLOQ%3D&amp;reserved=0

