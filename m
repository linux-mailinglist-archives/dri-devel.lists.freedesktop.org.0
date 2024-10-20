Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A7E9A54B9
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 17:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8905610E10C;
	Sun, 20 Oct 2024 15:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E1Pe8+FF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C5410E093;
 Sun, 20 Oct 2024 15:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDcO8edPa3ZbsXZu8YujVxpN0BP7psxlp5BsBmMncxrg1p4ejnurvZFaJ+IdjFZ1gKLRc907tCI7lJXvkRvwAYIc3WVIjjMG9vcSHMSQlcJtPvq3ZyAOnbdj/88vnTyc3gmQkfA29Va+v1dFhIDTcDB42HXijWdSILlNSOKWCZqYRcy3VlGHCgL/FZhOX93F1LtxNa4kmp3IbcGQcVbe4fNQUMvud9kbOMNVPMR0my9ccHPG+GAqCFAhHwMkix/Kl3jDU1fvKmKG5DTFpuLVdHpQblzPz6PR6uytv9h5i2+go1Cfp4v21eI7HxLeHVxa8TwPJnB5ivWG2nKX+QpV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnsLuffDyY8OM8IYHmEjajuZWdKpkipr5kcm4MKFdRA=;
 b=lhtlbzRlvKd7FFrcODkbLqggEg8yTOFEVbpMQ6vHZ98L9TdRtNQ1jngdufZzpRXghftkuAtAg9z0vpElpIicGiqIixULk5gYTKa60cHj5ycZ/UuJjDfkSryuBdOeAUj/p4oOAfBVJeIJfEcERpGMPQn3/YQDuJhZ07CHqkZZO+n0gR9+gmrtGJwAFsgzM7wBXPze6JGws3stKhs4x1JPD3NqEextw9N/A2f4TKz9vshMcquMx8TOOwX3sE9iZQ7mkTcn4BNzGI3pLmZOnuUa0IaFlN8A6LD/8p5wfmchhazS2hgSppQcqKvpowP665QF8ZhBfOBlHn+IJN+qxelVzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnsLuffDyY8OM8IYHmEjajuZWdKpkipr5kcm4MKFdRA=;
 b=E1Pe8+FFxG9t57UGsjWhftaQXFx062HV8i0fZUcqVzVK4+r+nxY6JmynZIc3yVn4lEZRvkXrBb3qQ4v+KGFNQqgvlEy8+SJBLBZU3Yx71MFdqgYX2oi/WLvQGpU4Mlsw2QvTCKaYWhMMX/04muNPXthcJbMI1W3Y3lsXRz7E7YfwPhvcK65h7atbC6DGPO3FxWyh7fs2JD4li8yPvNWYy0RRVDY8oUo5Peqhw3cZkiFbRy0ZhNWhsji+4RdWNjBC8cF7C0wZFL4QEHJ/lvCvObaA4cYPmZOqC+3vxU7hFETWIbdgEtYqruTdZgIoBBEq6Y+fW5nDCfnv2w1G9RKM3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 by SJ1PR12MB6315.namprd12.prod.outlook.com (2603:10b6:a03:456::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Sun, 20 Oct
 2024 15:26:45 +0000
Received: from BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938]) by BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938%6]) with mapi id 15.20.8069.020; Sun, 20 Oct 2024
 15:26:44 +0000
Message-ID: <9e2ee23c-d91b-45e4-a413-048f8d68970d@nvidia.com>
Date: Sun, 20 Oct 2024 18:26:38 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] GPU Direct RDMA (P2P DMA) for Device Private Pages
To: Zhu Yanjun <yanjun.zhu@linux.dev>, Christoph Hellwig <hch@infradead.org>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, herbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 jgg@ziepe.ca, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 apopple@nvidia.com, bskeggs@nvidia.com
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <Zw8_x0Tvux9IMbly@infradead.org>
 <1a667504-72bd-445b-8bf8-a6604b7beb2b@nvidia.com>
 <5472cead-7965-47f5-9ee1-77d40062b897@linux.dev>
Content-Language: en-US
From: Yonatan Maman <ymaman@nvidia.com>
In-Reply-To: <5472cead-7965-47f5-9ee1-77d40062b897@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0029.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::19) To BL1PR12MB5851.namprd12.prod.outlook.com
 (2603:10b6:208:396::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5851:EE_|SJ1PR12MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 375506ac-4225-42ef-f65b-08dcf11b9af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmVZWnJEM2UyL0FXUVc5NURBb2xxMkJrSDJhRG9MMG55Vm80OW9oVHUvcDhp?=
 =?utf-8?B?ejlqRlR1NWxjdmdDTkJML004U2UybkRleVZTQm1TaFRQeWFaZ3pwcWJkbHN5?=
 =?utf-8?B?RlB4QWlnYUQ4d1JuU3lGeThCSkxBRTRSZ3NtdHowb2dSYzY1OGdSMlVCVVBY?=
 =?utf-8?B?eW5GblBtcVJPZzFCelVPNldmSk5vVFNkNlZSc2VBc0ZGejJTL0VjTEpJUERj?=
 =?utf-8?B?Qm42UmV4Tlo2RDkyQjJlVm4vNWk2T1dVamlMS0FEbi9VSjhtQmQxeldjMWtI?=
 =?utf-8?B?dXJ0Q2gxV0NvSjJ2aXBoeU52M1poMldMcDlVd1B1ZjA0MHIvZXIwUllRcHhi?=
 =?utf-8?B?c2FiTTU4SnVQUzY0T0JaTFVzYVk2Y3ZNUEo4NzZHVjluVkpSNDlDejVCN0lv?=
 =?utf-8?B?Ujd2amk0eUNxc2RBRUo5aUVTM2NhRWVPSjZnc3JUVVF0eHE4bzJtWFROS0JG?=
 =?utf-8?B?SnVqOG9XUmtFOGM1eHRQam55bDI0SDg4ZExLelRnMUxodHJ5TEJpMG91SEFo?=
 =?utf-8?B?L0JjMDAzbU1SRGY5Um9hY3ptMStOejdHNWV1S3EwWkRpRzdOV2pNSFplcy9Y?=
 =?utf-8?B?RlhxMzd0RFduY3F3U2ZIL3NVTVdXbDJBVHBWbjRkMVFPVzg2MVFWOFJWTlpT?=
 =?utf-8?B?MlZ3bTdPVE9xRStZcWQvOE1zdzhBSnJsSE5Pd3UwVHFoM3k2MUtnVHpnN2tl?=
 =?utf-8?B?YmZ0Ny8zM2oyUy9OWHRYa2FUNEZRb2xTSmhNem15SEFObnVTbmtDbitpWVJt?=
 =?utf-8?B?SUVBUmFvT3Fkblk0anpUMVIzbnRnd29oNCtuaHBFYk96eDBRY29VenRyT01E?=
 =?utf-8?B?TWN2bmM3RHVRbTFsNEk5Tk9oeDdnQ0ZLakM0MWZkS2pReFFMMm14QkMwMnJG?=
 =?utf-8?B?RjUxT2twM1FUZDZpZ0x4TVRhMUZTcnpPRGJtTytQRVllVm5VWXcwMkkweXI3?=
 =?utf-8?B?cHNFM1AwYTJWdzJERHNWNGg5UkE3VUtKZk13RlhQaDZvL1ZRZmZuYVZxNllI?=
 =?utf-8?B?QmJjeVRzK1NIVGJqUjF4K0VlMmF1L0ZRRzhoTTBtQXF1SjZnVVVPOXhaR0hx?=
 =?utf-8?B?STRGQWduOEtXYXhzT0s3Z014aEJXVnFKOVhHVEpPdDNuVngzaTBROUZ2a3E3?=
 =?utf-8?B?VzNxUXB4cTlCb1BlVjl5ZVlXTjVXTlo5dkw3em05bVlONUl0TUtJek5XQ0dR?=
 =?utf-8?B?ZjdDSEIyeDQvbWlDZk5TOWdmUFUxYnF4Sy9qT25yVW1kNlVFTzZPd1RRb1Fk?=
 =?utf-8?B?V05keVhMYkRkdi8zdzRCdTZlazU1SzNlTGZWNlo4UzJiRnFGL3RuVGV6SzVV?=
 =?utf-8?B?QmFPK3ZsZGJWZFdnN0ZjT1pTYnRJU1FrblU2OTIxdnA0WFFsTmdFU1FFYTlZ?=
 =?utf-8?B?cENhRGltc3BHcWpZWjUwV0FiMjJvSHY0U2M5YTNYMmxaSzliL0RrcDNKQ3h0?=
 =?utf-8?B?MTd4YjRoVVQwNGRqV0Ivclhwa2dvMnV4SjcwYjk4VWJ3RUFFRVR0ek1XdFhG?=
 =?utf-8?B?NHBLOVhiTjhJdERMY2V2NGdZVnNRb1grd2RoaXhyc2VNMHJUWFY4RUtxT0k1?=
 =?utf-8?B?T1N6M3YxL2Z6NDZUdmdoNDhlVXl0VXFDRTNWT3F6L1podnpKTkxXR0hUL3l3?=
 =?utf-8?B?MUE5ZnpwRW9yUGF4dWR0NHJxVE5XYUhUVUNoUERZOXNpY3R5TXhBRWxkdEdG?=
 =?utf-8?B?RDc2WWlBcXR6YlQ3L3ZlZ1oyWlp6MjJBK1g4UE56azYxUWNBUDdpd1BJOVpH?=
 =?utf-8?Q?W2NJg+fYrCeroiv2YgpV4gsn6SNJyyTdh2ZlS16?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5851.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZCtBbDJOZm5hQ2EzSS9nVWE0RkI2R2QrNW8zelliSThidkUvMGRpSWxqdjNS?=
 =?utf-8?B?VUErYnh0NzE2YTcyTE1PNUJ2TFkzVUcxeWU1cEVFREpHVDZRYzArTEdYczZx?=
 =?utf-8?B?OEVhNmY3cVR3bmNUVFpwaVVTT3BtWW53K094WEQwUENxQkQ4L1lOSVBLTVNv?=
 =?utf-8?B?R2Yyc2lYdDF5Nko1YmJjRHhUTUh4NXZnODdFSjVLYTdMRU9BSGNsSjMyaUls?=
 =?utf-8?B?cERzeFVTVjRDTlVBdkZ5UHNFSGJqVzJBK29mNTlxRDNJY2Myb1l6TmVjaU1i?=
 =?utf-8?B?Z1hjTExsVjFYcng1eEJSS2R4cHQrUC9JRWZLVWI4allPTkx4UDRhREJPb3ZU?=
 =?utf-8?B?d1UyTEtiT0Z1aWxkZjFiV1Zvak05TFo0L3E4em0vdFQzTWdUcm16VVIvTUxk?=
 =?utf-8?B?NWovWVhwZ0ZZaCt5UUVXa0FOd3UvU3RlUFRRbFVaczFFLy9RVWMrNlZCQnF2?=
 =?utf-8?B?RTFFc0d4WHhhaXlxOU9FWWVQb0JMYmJSL2o4aVA4MGFZVjJUT1ZjeCtYRlVj?=
 =?utf-8?B?UnIxdWJhZ2pDODAxMjlXSTczNmV5dlJIMnFndkc0UWhlZncxVkJQQUoxSE9o?=
 =?utf-8?B?Vm0yaXZoMSt2QmM5SEMrb2k5d1ZwTCtPYSt4WE1qWlFZMFZ3VDVocmYyejZV?=
 =?utf-8?B?RFdZYlI3cjRjMXl3dEZUbndtZ0k3cnVZek1TeHBibE1ldXI2UGlObkJIbUVE?=
 =?utf-8?B?ZkZXeEFybjFtSDNiWFpWeGY2ZnRDSVdWMkIvRHNHR2cvUXRGSEZ3dlZlZjlm?=
 =?utf-8?B?Nk9nMkY3aHJOVkJzTy9BOWI1VWhKbzAyMU9BNk03ZnZIY3V4SFZPaklvL0k4?=
 =?utf-8?B?NGlRZ0VRWGdYLy90Z0dzZE1NS2xKNWkvaTRNN3p2bXdWcVlIekR4T1hsbktt?=
 =?utf-8?B?b0xOdkphSmRWT3RSc3l5b3BrVm1BZExGL28ycjF6YmhjeENoVnp2OHd2cytO?=
 =?utf-8?B?LzBNNzNoNmRMWHBkeWx2QjIxa0NlKzR3a2FacTIyc0ZSbThpamQ3eDRtSE1U?=
 =?utf-8?B?bFhlM1FRUE94OWVibXZvUG9ZUzNpUWs4ZHRpTGVObmdtQ0RQYXZNVGhiVjk1?=
 =?utf-8?B?YWpSSHZIQThhSmZYS3FCSFlHNEMvWVlmSmJuRW9CWU12RTAwTXJYeTY2OXVm?=
 =?utf-8?B?OXhUSGI5WmppWUFBNGRPRlFMSE9FTkdXbWZ4UXlxSVdrUVhIcnpia21abk5i?=
 =?utf-8?B?dThvN0MrcUN4YWJ4ZmZQQnJzYndXNXFKZGFFek1iRjBzUE53QVRPQjRrS0tv?=
 =?utf-8?B?NFdseUs5dWUzV3FXanRGRzFNK1NOUnltSmdzMWdwVWwyVkxWamxvNStMTE5m?=
 =?utf-8?B?d3VrL3hMdllGSWwwUWpMQS95bm1lU0FwTEUxb2ZOTDJoZUE4cmUzWnJrdGlS?=
 =?utf-8?B?dmpqc2F3a3JvOWFwbnlkRnVDcjkrWHBEZHVpWkFMR1ZKVk9wb2FzTWJvaWcy?=
 =?utf-8?B?WnlKL2ZtT2h0RXB2VCtrRkhlMDViaWNrdDB1em1LZTA5UTZlMFBqbkJmOTBo?=
 =?utf-8?B?U2JHNmcrVTB1V3I5aFBFcExSNFl1dWE2WDcvLzhsYWkyVlN0eDU2TzBJYVVz?=
 =?utf-8?B?Rzl2NU1NeGtjUjJuTmgycFBDcEpJOXNCRUliQ3NaMHZwejZsTnU3ZSsreXdz?=
 =?utf-8?B?TmlGYjRsY1gvREFNcVk4MUdiUXp0QUZqb2x4b0J4c2pCWitHTm9Sb1dLZmxN?=
 =?utf-8?B?YWFmdW84bWN2RmJYVlRPc1NycEFROFZFWVJxZThlUEVHbURMdWtQNlRzN2tQ?=
 =?utf-8?B?NFZWT1Yvd3ZpbHlCS2Z6VExhRWgvL1hHNmxkRTN2UUxYQ2JKMndUS1NEWVc0?=
 =?utf-8?B?ZkdDRzVzSHpsOWlNME56bTQ0eTMrTGFBTi9Cc3czRklSc3MxR1NTVDVZQmFz?=
 =?utf-8?B?akJTM2thcDB3OUFHOHRDcFAzLzloTXc4cFErbmJHTGF6dGVYOWp2OHgzOFho?=
 =?utf-8?B?OHBvQkJTcnVoc0FVZmt0d29yLzVBWHQ4d1o0bUhhSEJHRSs2QkFQV3ZrNFU4?=
 =?utf-8?B?QUFJWG1teWQ1YnZlUGpLN09oVTlCOThGWFp5bHo3VjNHTzF2MmwrclhERFpu?=
 =?utf-8?B?dUp2Zkp0NFhOVGY1NTNnYlJJQ3Q5ckFvV3RKcHpTbnJEMVdiSklLeWNncXcz?=
 =?utf-8?B?SmNnQlNEZXRVM3NZb056WndNN1JFeENHcEgxeTV4Q01LU1pxS3hvdHM4THJr?=
 =?utf-8?Q?9aQ2YLr4Kq1TDxDIbx8413awRv0lur71ZmuX7AvWZUW3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375506ac-4225-42ef-f65b-08dcf11b9af9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5851.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 15:26:44.8911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IW7WVHvTOgPhNWN3OjD1YOnGmH2UbwZ/36BOj6o/M+pRswTCdRXW0cW7XQkAiyfXlVk1Xa9h6upFHm2RVDFk2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6315
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



On 18/10/2024 10:26, Zhu Yanjun wrote:
> External email: Use caution opening links or attachments
> 
> 
> 在 2024/10/16 17:16, Yonatan Maman 写道:
>>
>>
>> On 16/10/2024 7:23, Christoph Hellwig wrote:
>>> On Tue, Oct 15, 2024 at 06:23:44PM +0300, Yonatan Maman wrote:
>>>> From: Yonatan Maman <Ymaman@Nvidia.com>
>>>>
>>>> This patch series aims to enable Peer-to-Peer (P2P) DMA access in
>>>> GPU-centric applications that utilize RDMA and private device pages.
>>>> This
>>>> enhancement is crucial for minimizing data transfer overhead by 
>>>> allowing
>>>> the GPU to directly expose device private page data to devices such as
>>>> NICs, eliminating the need to traverse system RAM, which is the native
>>>> method for exposing device private page data.
>>>
>>> Please tone down your marketing language and explain your factual
>>> changes.  If you make performance claims back them by numbers.
>>>
>>
>> Got it, thanks! I'll fix that. Regarding performance, we’re achieving
>> over 10x higher bandwidth and 10x lower latency using perftest-rdma,
>> especially (with a high rate of GPU memory access).
> 
> If I got this patch series correctly, this is based on ODP (On Demand
> Paging). And a way also exists which is based on non-ODP. From the
> following links, this way is implemented on efa, irdma and mlx5.
> 1. iRDMA
> https://lore.kernel.org/all/20230217011425.498847-1-yanjun.zhu@intel.com/
> 
> 2. efa
> https://lore.kernel.org/lkml/20211007114018.GD2688930@ziepe.ca/t/
> 
> 3. mlx5
> https://lore.kernel.org/all/1608067636-98073-5-git-send-email- 
> jianxin.xiong@intel.com/
> 
> Because these 2 methods are both implemented on mlx5, have you compared
> the test results with the 2 methods on mlx5?
> 
> The most important results should be latency and bandwidth. Please let
> us know the test results.
> 
> Thanks a lot.
> Zhu Yanjun
> 

This patch-set aims to support GPU Direct RDMA for HMM ODP memory. 
Compared to the dma-buf method, we achieve the same performance (BW and 
latency), for GPU intensive test-cases (No CPU accesses during the test).
