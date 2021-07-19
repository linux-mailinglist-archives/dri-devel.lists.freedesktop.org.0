Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 563C13CD39F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 13:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E24F6E0EA;
	Mon, 19 Jul 2021 11:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638836E0E9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 11:16:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyFO7/n31Jgq9M3CEfgCJyHKK1c1auIg07rBBM/IXnMLf/8yEfNCFrPeJEkjt6J1hrhZ95xIhPMEadhxcF++W/b3xOfeUZTmS9TJXovoUiMW1i5ToBt5euaId5HqMYHweieJINr530F+n/IqE2gAOwDdmOYcifXPPTCvPaTgSuF4ITyUBqT9ZY1S/Mtsssp1aAAdNaV8M/+2pCov3uEoDuuSh7uln15xhp9TkBIf3zdBxstjCJSRzC1GNTYWMAE7AWAk2c4HUashe6uUsY4geyFzCkToB/Amm3R6/SSeS6rDL9r3hyUWGZaXcxEEWtXD94mtfMX/WkxQUzK11Jnf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ6V5OcKN6ILxojyzNa1F4TUsdRwAcQ2GDCK5pUeKBc=;
 b=H/fyYWt0EKoPJMcaRR3uMkQvayLy50aO2yETka/rbvytAqxOa9LklUH9GXCWQ4jgzmJqQ60ziBLU3dAFBvtmkg9kPCXOIWjMvSZi9H4WAmSQADVAbD4hzeifv0zPqlPtkTHSik7nxdY6yTmuxXp1RIyAkhTOlQh9W/bmOlIwfaYSN2zOuu5vg71c4wQSVFi6wyBru7iDM59R0+8YSHfA8/u8vFGK9RoZTVDxSXiLNYqrHF7o/Hu1rumCwRlIEDXQjqiOKxKglrcWV1Qj7ow0AkKuw3CDIqq1UVnmX3ZWVPeNDtJQXdqwHKDrm/I8QekiplCu15kkKoeu9ItsDGXwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ6V5OcKN6ILxojyzNa1F4TUsdRwAcQ2GDCK5pUeKBc=;
 b=QyrqFEmo/nvhY7/kGBxcOQnFtWWfD9rJPj2C5E75vJvkm/CQBk6tEYI4WAy4Ve+UGOnyla9K7B8Pj7D2j3ZQ7c5Vt95V78jfxL3cHjcRaMvIZEv1YTZajhU3CIBlJGpP4pYntsjFFzS4tvjgQZTVUOHlmXMQilaZC8T8XSlQfJ4=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2515.namprd12.prod.outlook.com (2603:10b6:207:40::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 11:16:28 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 11:16:27 +0000
Subject: Re: [PATCH] dma_buf: remove dmabuf sysfs teardown before
 release/detach
To: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Hridya Valsaraju <hridya@google.com>
References: <20210719051944.40871-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c29678a7-e1fc-c7c8-4b5c-04b812fa683a@amd.com>
Date: Mon, 19 Jul 2021 13:16:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210719051944.40871-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR1P264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::10) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e48d:68a9:5ef4:9e09]
 (2a02:908:1252:fb60:e48d:68a9:5ef4:9e09) by
 PR1P264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 11:16:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 492a9c0a-0958-47b6-18b7-08d94aa6a677
X-MS-TrafficTypeDiagnostic: BL0PR12MB2515:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2515A339270DCC03045CEBEB83E19@BL0PR12MB2515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HtA/yspFOqnfEosjOIejoTxYU8YXtuxVcRojbmAXDJIuolkRHmUTESBP6+wACcTe8KHQ05iNAsNBCXnKOdpx32FnhhCIZoqxHK9ar4knvjfoqz4ctrJ1ogGmpTDRnHjXc0fPEuDDPz+Pw7McMj9IAdgx4agJiOFvM6ZvYFsfl4ZopaOOtSnZfpj9dso857d03g9jPRMHXvCi72XjnVx1SFDjPGO0EwRw3mTuxha7hzHH2O3oXbH1kqZuSNFhT0TK5bvpJ+U25o9uDIAFfW2LFsXOSUCAnc4VZxmf/KqMJNu0d1T34ipJL12drdN42ag8xnVdAI1suwFbZ7nmaJimiwfpBv3Q8nCpB1z8LowuAPowLrBMk1N+8x8YWhpijKJ0RBIrITY5Cp3rZG/t9jwfDkdTd4p1ZvmodWCXlHPu9FdkQOwF+uiRNvJaSpIupYlAsZgpiWGSe6YeHjPWQ9ih0jB06agZ3wM5ZSDDG4SlaahB0P14cgbdA0KPAODwxxGgVo49+CeZ0g672v/mEKCVTzN1Bt9llcghVcADO65/Y/2PjjEV6SFDN8rmnsJnyrGJkMvEJX00ScUPyuh10kK7ZwcVgERf0+rj2bcOYAJO2f61skqMZYuPFNwY99ukZrYSYbXP/8pKqqTDsoj8uU9Ze+2AO0DCpn0mqc+hFbVN18r7pfbMV21IkGAe9mHvI1ApmbS/CI0IGwkGoH4xjb9sXhCmy4FHrpoBDDSaWaIo0oz8Irge7b7OeWVD2G4XV//g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(478600001)(83380400001)(31696002)(4326008)(38100700002)(36756003)(2906002)(5660300002)(316002)(7416002)(2616005)(6486002)(110136005)(86362001)(66476007)(921005)(186003)(66556008)(31686004)(8676002)(66946007)(8936002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXBoK0prQkw3N0djOTJLaGNzUjljSm9wYjk4OWxCRDlGd0pqam4wd05MbHIw?=
 =?utf-8?B?UHlkS2VzK2ExR1haNU9EQTgrdjlVWEY5bmxoNzlMS2JRNlJyQVVSV1ljT1hx?=
 =?utf-8?B?TXlWdzlraXcvUVU4aW5OM3VZc1hjOGw5bnV1U1pPaWVHOG8rbjhQSWV3OVlX?=
 =?utf-8?B?Y25uR1dna0V2dGRETm1hTTRyTFR1dklORFdnNHVCRXVSd1ZnSXhXemM4QVNs?=
 =?utf-8?B?NENCMG1LYysvMmJrYk5HNE1oTDVQV2tWSE5BbTRRZzRBQ2sreFg3ODZDaWZr?=
 =?utf-8?B?bkREMTdIMFN4bXBWb0lnNnJvQTgvZEZ3RXpqZ01hc2lKd3lmSTFaeXFoNWxP?=
 =?utf-8?B?MllJS0RwSDd1RitOWDFHZ3Q1RmVFRjBjMlNFa08yS2l2RXFBKzRIOCtuaEIy?=
 =?utf-8?B?SnhZTlZmeUdFMWREOWpWSDAzVFNTZG41dDFIY3E1RjJGc0RwaWxFYWRlbUV1?=
 =?utf-8?B?YzZZck1UZEJWN1Q1Z2crV2NiZU9Wb1N2ekNWU3lLT2pwYkJpbFROYjZrMG1G?=
 =?utf-8?B?YXBaRUVueWJiUXJTR21xM3BlcVllelBJTU53Qzk0SlRrZ0dqMUpFaXd1Qllp?=
 =?utf-8?B?M2lPb0RWS2g3NWpDOE5QbldCejRGYlBJbWJpdjZ4b0Z5OFJBd1dDSzNCZWl4?=
 =?utf-8?B?c1J2T1FRMDhyK2g1OHJqeTNEdGM3cituZ2Q5cWkyQUlHeDJmemxBSk1laG5t?=
 =?utf-8?B?bGxrWnN6YUdtKzlJQml4YnVmOFl3dStNcjdvZi9PS2wzb0VjdW1sQnUxaEpS?=
 =?utf-8?B?VW56YnNDdlZ0VUp6aTh0dTA5VmNaYUlKNXZ2Y3M3VlZCUDkrZVY1VzFuVncr?=
 =?utf-8?B?OVlXNGZxWHpBenhudWdkZ0dlTDErb0gvZ0dpMEEvdlduSHlJTlN0YUFRNy9s?=
 =?utf-8?B?bGQ5TXBGTWpCNHNnNVpaMzN4ZWNGOER5NDhuRlFEMDJsN0lmWUlrcytNYWhI?=
 =?utf-8?B?aXBQTE9WWjd4ZEhVWENraVVMalhweWdFMGlaTi8rcDZUbW1DMWVyK1Z5VXlK?=
 =?utf-8?B?cnNtK2V0REpQZUF2akFkazJCLzZEbnpIQWhBc3BGSzZsWXN2WEwxdlQzeTE3?=
 =?utf-8?B?SkhZZ2s1Zmo1bEJZSGRZbzlNUE1wTDRkUkFNWC9IdWcrODc3Z0FRczJSNk5k?=
 =?utf-8?B?anJubUY0WU9wdktzR1lpa1dPT2EvTnQ5QytHUW9JM0tjL0h1Wm42dnFmTkVK?=
 =?utf-8?B?MWFkOXREdE9wUEpHRnNZRWIyUWc4TEU2TmJPRm1VRUduaHRQMmh1U0dDZThK?=
 =?utf-8?B?SFAvWXExeHhWaDFCR2haLzZ3UlYrY3Q4OUU3WkYvYlpyZ0xpY3FRb1FwZjBz?=
 =?utf-8?B?T3NZeks3OU55QXRqMWpWTG1BanI1UzBsOHVFZ1pXNGR6VEs2TDl0b1R3amx2?=
 =?utf-8?B?NlIvKzZKcUpna2w1Y1dMZ3g3Y1NRaDR5K3ZKWjN3MW5UeU5Fa2JyRmpyNlRa?=
 =?utf-8?B?WWNtUjdkdm1CTHd0Q2docmlXc1U4ckFtYVhFQ2ppZ1VieEZ6Y0d0VXBLS2Zn?=
 =?utf-8?B?MjFzTEJLZXJickwvL2NYbEF0QXZiWmZxZGZBcGZsaW9qRGI2VGNvQVFQbXl1?=
 =?utf-8?B?UzFWSElzbEZ4WE9waUFQeXEvci9RTGpHbVRsRzBHeW81KzRHdHZudEZ4QktH?=
 =?utf-8?B?cGxaWkMxUWZKVSthMmpkOTJtZmRRZUp2bWNqbFNDTUdKVmppRDhrT0xLQUZC?=
 =?utf-8?B?TG9Sbi9iUk90K1RCbGx0WEpsZ2NMeExuMk5VYVJrQTJzL0F6NnRDRFpYWXhE?=
 =?utf-8?B?ZzdWTUhXd1JBa0FJMmJnUks1cytRQUI3eE52bzhlbXlZbjZrQVNHelFpK3pu?=
 =?utf-8?B?QjQyWVRpK3NmNHZPOWt3TDZUVGxwUFBOY3VwSWRNc3ozUlVlRnZCeEkveFV4?=
 =?utf-8?Q?obK1Iwk2Xjwso?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492a9c0a-0958-47b6-18b7-08d94aa6a677
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 11:16:27.8868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rI8YZPEeimXa/YrBts1kraWhq5UN76sR+QhIY0Xc3POyVEg9HnjCiQody6bF7xIE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2515
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
Cc: wsd_upstream@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guangming,

Am 19.07.21 um 07:19 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> Dmabuf sysfs stat is used for dmabuf info track.
> but these file maybe still use after buffer release/detach,
> should clear it before buffer release/detach.

In general looks correct to me, but Hridya already send out a patch to 
partially revert the attachment sysfs files since they caused a bunch of 
more problems for some users.

Please wait for that to land in branch drm-misc-next and then rebase 
yours on top of it. I will give you a ping when that is done.

Thanks,
Christian.

>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/dma-buf.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 510b42771974..9fa4620bd4bb 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -76,12 +76,12 @@ static void dma_buf_release(struct dentry *dentry)
>   	 */
>   	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
>   
> +	dma_buf_stats_teardown(dmabuf);
>   	dmabuf->ops->release(dmabuf);
>   
>   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>   		dma_resv_fini(dmabuf->resv);
>   
> -	dma_buf_stats_teardown(dmabuf);
>   	module_put(dmabuf->owner);
>   	kfree(dmabuf->name);
>   	kfree(dmabuf);
> @@ -875,10 +875,11 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   	dma_resv_lock(dmabuf->resv, NULL);
>   	list_del(&attach->node);
>   	dma_resv_unlock(dmabuf->resv);
> +
> +	dma_buf_attach_stats_teardown(attach);
>   	if (dmabuf->ops->detach)
>   		dmabuf->ops->detach(dmabuf, attach);
>   
> -	dma_buf_attach_stats_teardown(attach);
>   	kfree(attach);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_detach);

