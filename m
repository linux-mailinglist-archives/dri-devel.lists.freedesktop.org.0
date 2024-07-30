Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D919940FBB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 12:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F0F10E0FF;
	Tue, 30 Jul 2024 10:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XBNU0BRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1178D10E0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 10:43:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSko0NXqTVZ4p+JEDZ5ta2oJrfvkhpGrPUUZmZ0y6HUo9sZ+Qc/x7h6qLxy68YkjbPZHfeV2dZq5/FVdEnJH54wAi5t1cAgJX4rsSIKGg2+QAoEkY+bR9rEgmQCWGgMUEBb2RwzYcpXCBjBin8GjchF9/qpgdfrNfx9iwHpAVhGGDqwWbYEExZKMvbJYNkpfVMMCIo+A1+xG4Kj6uux/WIikjJMC594IpirUWWA4FrdYOnPBMtQGEYGxsTdg6N6uAIkzAZApxw35bfuGGL6GWJF0m1e1wsgunMqNw/VJB3C7/WYfedIveQHSVhO0FWWPDU8+6ZdMx26/nfJmn/BEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYFEDCICLcazBmDax5FlR1fSsS7SVujMUBvO5ed4FDU=;
 b=O5Keb/YFq+EMV+9Gj3ysE6bWC3LBhR4hGAS/3CCvZdywcgt/oFjBkoIm+OLX8+vtlIxikCEGDwkW0OenQBsE1eiaSW0abeNt+9CXmVmYXiqLwzyRBoa59u6huH/P/KaEXV14CjnK/36xfwTtXXzNzx9di0kL/OI4rSdeD12bP85N5bVXtLnXnVvs5x6iB3uusF3IYbK+8hsm3lsi9tTNIiNPrjdLK609OIv4A0Ip9Mid/su/T0+1daFojWC5VTMNUET4VZ8E3UK1+zLZ5JwX70EzFKW3bczpoT/TYdLfEj7D+48NcoaURXCfenMvmxxC1QK0u+eHfacj8IEXkRJ+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYFEDCICLcazBmDax5FlR1fSsS7SVujMUBvO5ed4FDU=;
 b=XBNU0BRq7TfDsqvziwN8ngEg42oPMLRm7r8m1h9uRjKNqhrp74Pjwsra2tlNflbnXHco0RqFcspORWJvXor3U+hYHRSbSR0qOqfnO55QsWbCmET8q6PxtYj1Y0hanLmnkCnxAxE3Chb0RAqIXsK58T+PCnVDQFlTkLfvyzY819c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7491.namprd12.prod.outlook.com (2603:10b6:930:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 10:43:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 10:43:38 +0000
Message-ID: <d8529566-249d-4ae0-87fd-04cdc7e4e573@amd.com>
Date: Tue, 30 Jul 2024 12:43:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <d2f56198-a3c2-4f7b-9d10-616deb348351@amd.com>
 <966651c0-42fc-4827-bf3e-2170dcf4688c@vivo.com>
 <d5d7674b-eab3-465b-97eb-e33bdbecd7c0@amd.com>
 <79b51a8f-9c28-488b-9be7-b5ce715aa1f2@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <79b51a8f-9c28-488b-9be7-b5ce715aa1f2@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: cf13eac1-2460-408f-464a-08dcb0847845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFRuMG9WZFlrY29OMGxSUHJOOEx4REgzK3NzcFVLam1zY3IxQjM0cENtVzkw?=
 =?utf-8?B?N2hNb0RObXByeWpFRjlDYlJNSEVlMmNxTG1IV3h4SDFoV1AzOHllc21wQjQ5?=
 =?utf-8?B?T3htVEdBbXhjTVFPMlZ5RXd2NS9Rd2E1OG0xR2w0Si9vREx6RXZ2dHV1NzBQ?=
 =?utf-8?B?NE9mQ1kzbXdGQVpyYUtJUmZxaEc1ekg5UnJjLzZOUit1NWNFNWtUVTZldmQz?=
 =?utf-8?B?aHV1Q2tWaHFXQXhRTGFnM2pFR0h4M2JHVStkZjAva3MyUzUrYzkyaXB0dlJZ?=
 =?utf-8?B?RlV5ZnYxdENCWmFUZ3FPVE1MNmlIUVpkblVhcDY3N0tjcHhuRm1WTzNQVkg5?=
 =?utf-8?B?L2k2L0dmM2c0eG81YUY4ODZleXBOY2l0eW1vZlU0aDFGRzBqTVZNelc3ZVYv?=
 =?utf-8?B?UkZpZzRvNFBra25oMElnU2toMHV5RnZYUHNTQUhVUTVGMTNHTG5zdTFTc3hl?=
 =?utf-8?B?WmxtNWRHZ3hnWHhwdHBONWJtRmgrTEJpeHIwTW9tbjBxMkVvR3JJdTcvd2NV?=
 =?utf-8?B?MnRkWEhJRGRKaE5HdTBtRmtiVVRIaUplNVRERExhMmdtL082a2dNRktubWV3?=
 =?utf-8?B?eXh5bjZSZHBsU2gxZTRrVjl6VXhPdHB2L3M3YURJc0NENE1xWGlTUWdLbUpw?=
 =?utf-8?B?OFd5akFKc0orakRSdUxPOEloUjVkT0orU2dxbjh6cU9UTDhaVTZKd1g4cEwz?=
 =?utf-8?B?VWNFeE90L3pCdmpza0xmb0tOcmhvN1ZGS1c4TWpFano1NnlKRksxS2VnTFMw?=
 =?utf-8?B?UkZQQjhXOGNTOVJlaXN4aTFzc0VaUWt1WHZZUER4Rm0rMTdXbkRZQ3d3ZHdL?=
 =?utf-8?B?a1BSU1c4bU9BWjVYcEtXcGs0Z0t4TUREVFVQYVdGeEVQakNsTmpHS0dOUk9K?=
 =?utf-8?B?V0ZtUTFLWjFMQzBQcDdzRUJucXdjWDhzV2x2bnV6cWk0RXpTbS83OXRrT0tS?=
 =?utf-8?B?SWVsdTJ0ZDU1VkhHMDhNdkF2akFpa1p5aXFHa3lPWGNYajNtZEZwR29DcTJF?=
 =?utf-8?B?QjlWV2NScVMrTk42MDBrM0dmUVg4N2dnN3ltSUZua1dkSUwwZUF3R1FINDVK?=
 =?utf-8?B?S2R4OEM5SEgybmY4aVNtSy9NTTN4M0YyTjNxRm5FUmhLdi93UjV4Y2VDV3Av?=
 =?utf-8?B?Z2Z0eStYZkk0cjRQVmRCRXFFdFYxekkxeHEzRHdoeUJzUGloUWlabXNzRFJp?=
 =?utf-8?B?MHFObG1oR0V1bjU3dlpjZnhoeDFsRERYcUp6OHQ4WVFmS0EwbkU3NkZxUVN2?=
 =?utf-8?B?M0ErWUJDektjK0dUcWtsSExEVHlJNWM0Z2xGVzF6RjVyaXFxMWU3T040S0pp?=
 =?utf-8?B?MkN3bkJpb1FWR3ZPRHdDZ3Y2eWI4TC85bW1pWlR3YUg5Vmk4WnZ0QjJ4bEJL?=
 =?utf-8?B?VlhHV2QvKzRhWHU5OGN6VHJTSU1IVUxkN3FSNnliVDFmb3ZYZXd6L2FNRWpt?=
 =?utf-8?B?OFlLWmt6VFlhOTBhY2NlZWJCV05VSEVWN2JmcGVVTmt6WVc3UStPVDZEMjA4?=
 =?utf-8?B?RkdBV1ZacldlcThVcWNFNkpjNzBDUWlkUEIyZnJPVnFmU1JzU2MyQ0hQYWMr?=
 =?utf-8?B?eE9KZFoxSjNWSWNDTk9rZ3QwWHA0c2ZIeENwZi9jNmdMSk94U2FpelVuS05M?=
 =?utf-8?B?Q2dIS3VVV2xZby9KaEtUdDIxMVdYbWJ5ZkFTTk5oMDlJNWxKeFJaYkhWdnhp?=
 =?utf-8?B?ZHN2WTFKQnNhSGtidkpYTXZwRlRXelhXS3BFRThZZ0RZc09QYkRoVHlvUkls?=
 =?utf-8?B?KzQ2UW5vVmNDdjIra1lNNGwxV08vd3FwT09FN0lOYzExeTdzeUhDY2szVGhU?=
 =?utf-8?B?SmdIT0ZHOTJ6aE5uajFBdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U254TFV0RkR4Uy9GMlBuOGcvblhJSGw1aFlzbW9zdmdXL0xCMVc5U0tLVkUz?=
 =?utf-8?B?OGRoQWwwcGR3eWphb1dzZXBWVEk5TjN4WG03cDBZOHlqQ3hGRFl2MHY2WEl6?=
 =?utf-8?B?KzhvOUtSbkZuc2FPeXFLSlNKRGFoTHAzSlFFS3diaG5INDdxYWRtRHp4S0Ns?=
 =?utf-8?B?czh0d1UyMEFpRExaVlc2YlduMklwUjRUbHdHZ2owbWtJRkpyeUNGaHNYQmps?=
 =?utf-8?B?WVA3NGpWWFdoQ3ltK0lJRXpoZ1AzdEdBc2dKSHljUEQwWlgvM0wzNVZ5blJB?=
 =?utf-8?B?WVNUWUUwQ1doYTBINU55bjJpaWg5V1o5ZG5uRGQvbW5qayttaFlKd05YTWEw?=
 =?utf-8?B?RmRRNzIwSkFnMk5ORVpVWFZ3S2RKc3V1ZFgzNUVZR1ZqSFJyYklMR25wK2NR?=
 =?utf-8?B?cG9WZmowNnB5dHFiV0Yvb3haclB0UDF0RE1INjJhREpWb2tidVdVb3NocVEy?=
 =?utf-8?B?UmtSdG5KdnErMStGOHd3SzBFZHRFWVMwaXppY0hGTUtEcStISGk1bWlrdnU3?=
 =?utf-8?B?ZFNzUkhHSTYvc0o4QkdrK3FTbVBPVU5kZGRkTHdQTXptQzdJVVhkSWpsckFu?=
 =?utf-8?B?NWhrOEpJZHBkaWIzajMyM01hczVFSW1ERzVYK1dzZ0VSaVlyd1kvY2NZN1pT?=
 =?utf-8?B?ckd5bjI4LzlrMFFkbVpWT203dUg1dXRIZDB1YzA0TjN5ZVpBeXRrQ2JLdUl0?=
 =?utf-8?B?TjFUUVc4TVZyTDQwNUNBK2JGMWdndHJoR05SZW55aW05Tmh1TkVoem52a1lH?=
 =?utf-8?B?TWY0eG1pdXRiUk9SNEU3MmJtYmxUM2dQQkJ6YnAwWnhCVzFPNDRqUTltb1Fa?=
 =?utf-8?B?Z1RPdzZYY2QxQk9SUC85emoyY0JnNThyMUVWVUdCUWtsSUVxUW9PU0NEQ2tN?=
 =?utf-8?B?cS96SnJ2aE42U29PYzBqNktEL3FkM1lPOXJpcFBMbmJuZmNIaTdEZDA1TGx0?=
 =?utf-8?B?RkptQTE4MmdBZEtVckJnS2lHN3k0TU11NGpERXNlSHlVeEtoUXo5bEF4S0pn?=
 =?utf-8?B?aEN6eEtWaVdJNzA1SzM1UTQ4eW45Q2x6MkR6eTZBTVozNTVSTStHMW1XU2pN?=
 =?utf-8?B?VWVodHAzQWd5Wml3aUpSZGg3YWxrd0ZVc1lTUldGVmY3YUxnMVlPK3dmcTJS?=
 =?utf-8?B?azFYT3BIai9WbGxrTkNORUlUVnFETGxiMjVFVDJ5SlhZSFJ3OWhUbmJmT1Vz?=
 =?utf-8?B?NWpBa2s1MnJTbk5uUzFpTjhmci9LWC9sOUxYS2FEUXYwZFJyRnRnT1RINnRn?=
 =?utf-8?B?YkhidVFVb0dTNzk4eHdUdnVYRVRkVnBvRzhTOXhXaWdiQ292ZDc5QVhYc2px?=
 =?utf-8?B?TGdWUnhKeVRsV3VMbzRCdHF6KzR0a01lR01FMUl1aDRZV25aY2hMZG9kbjYz?=
 =?utf-8?B?YXBXakV5dmxpY3pTaStVcmM4NEpwSDd0TnFocUJ0QS95STcxY3ovRHlXRjEz?=
 =?utf-8?B?ZSsrYWdXUHpLakptVE5nS1ZNODIreWRmeUpHZ2FOeWtEZW1ocHdkMytUR1pV?=
 =?utf-8?B?UFRVU2dCaERtNjN2MmpPRWpFY0hJa1RYRlh3Vm0yK3FBd0RENlAxNnhDNkI2?=
 =?utf-8?B?TnBGNjhsNjJtWUVFdzBFTEN0NHYrZHAyU2h0ajNXSk5iaUZJVkc1RTlVWElL?=
 =?utf-8?B?Q2FDUFBQYlRMM1A1bkJZdEc0VTRzakt6Ky9abTlEZnZFalJTVG5BdUR2RSsx?=
 =?utf-8?B?T3kxZkJSYjRNMlRmUVliY1pUUmdSRnRJb3N1WVU2QnRyV1FKOEd6cW5FejJ0?=
 =?utf-8?B?ZU9RUlN0dFljOXdNODZGRnROSnprTFBac21UTzUvalhqVDhOc0V5a1Q1MDJI?=
 =?utf-8?B?QWhXc1NsQWpCbjczRW5hbHJiTk56eUxLQ3ZOMXZpNWdIODRrcGRxOGdYS0RG?=
 =?utf-8?B?bEVsZ2dzYjVua3NGK1FwUzdLVklmOStyNTkvcVpXWU9adGtscDRMRmcvcU9x?=
 =?utf-8?B?VVBqNGRsZTZtS0NvMUZlNjRnWUN0alFmb2NXTUVjbFgvMTBURnNhNXJlZElM?=
 =?utf-8?B?dXRJSHNxaURSVE50engwdzk0MUM3bmpPaFoza2NMWXFqeGtzYVk1YnB1b3Fk?=
 =?utf-8?B?bEhuRk85WXlDcFJ1VlhlTE5mcDF0eFRuc2lSZTYyK0g4RGdnNXFxRkFPNFo2?=
 =?utf-8?Q?nbd86MG/4+8uCChC3ygzNJKkW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf13eac1-2460-408f-464a-08dcb0847845
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 10:43:38.0828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPrXioYSkZ3TCxj0rYINTWLSbTkfZ4rNpkegJGIlJ8bKhTeJMhlhIDUM9VE/Xh8s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7491
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

Am 30.07.24 um 10:46 schrieb Huan Yang:
>
> 在 2024/7/30 16:37, Christian König 写道:
>> Am 30.07.24 um 10:14 schrieb Huan Yang:
>>> 在 2024/7/30 16:03, Christian König 写道:
>>>> Am 30.07.24 um 09:57 schrieb Huan Yang:
>>>>> Background
>>>>> ====
>>>>> Some user may need load file into dma-buf, current way is:
>>>>>    1. allocate a dma-buf, get dma-buf fd
>>>>>    2. mmap dma-buf fd into user vaddr
>>>>>    3. read(file_fd, vaddr, fsz)
>>>>> Due to dma-buf user map can't support direct I/O[1], the file read
>>>>> must be buffer I/O.
>>>>>
>>>>> This means that during the process of reading the file into dma-buf,
>>>>> page cache needs to be generated, and the corresponding content 
>>>>> needs to
>>>>> be first copied to the page cache before being copied to the dma-buf.
>>>>>
>>>>> This way worked well when reading relatively small files before, as
>>>>> the page cache can cache the file content, thus improving 
>>>>> performance.
>>>>>
>>>>> However, there are new challenges currently, especially as AI 
>>>>> models are
>>>>> becoming larger and need to be shared between DMA devices and the CPU
>>>>> via dma-buf.
>>>>>
>>>>> For example, our 7B model file size is around 3.4GB. Using the
>>>>> previous would mean generating a total of 3.4GB of page cache
>>>>> (even if it will be reclaimed), and also requiring the copying of 
>>>>> 3.4GB
>>>>> of content between page cache and dma-buf.
>>>>>
>>>>> Due to the limited resources of system memory, files in the 
>>>>> gigabyte range
>>>>> cannot persist in memory indefinitely, so this portion of page 
>>>>> cache may
>>>>> not provide much assistance for subsequent reads. Additionally, the
>>>>> existence of page cache will consume additional system resources 
>>>>> due to
>>>>> the extra copying required by the CPU.
>>>>>
>>>>> Therefore, I think it is necessary for dma-buf to support direct I/O.
>>>>>
>>>>> However, direct I/O file reads cannot be performed using the buffer
>>>>> mmaped by the user space for the dma-buf.[1]
>>>>>
>>>>> Here are some discussions on implementing direct I/O using dma-buf:
>>>>>
>>>>> mmap[1]
>>>>> ---
>>>>> dma-buf never support user map vaddr use of direct I/O.
>>>>>
>>>>> udmabuf[2]
>>>>> ---
>>>>> Currently, udmabuf can use the memfd method to read files into
>>>>> dma-buf in direct I/O mode.
>>>>>
>>>>> However, if the size is large, the current udmabuf needs to adjust 
>>>>> the
>>>>> corresponding size_limit(default 64MB).
>>>>> But using udmabuf for files at the 3GB level is not a very good 
>>>>> approach.
>>>>> It needs to make some adjustments internally to handle this.[3] Or 
>>>>> else,
>>>>> fail create.
>>>>>
>>>>> But, it is indeed a viable way to enable dma-buf to support direct 
>>>>> I/O.
>>>>> However, it is necessary to initiate the file read after the 
>>>>> memory allocation
>>>>> is completed, and handle race conditions carefully.
>>>>>
>>>>> sendfile/splice[4]
>>>>> ---
>>>>> Another way to enable dma-buf to support direct I/O is by 
>>>>> implementing
>>>>> splice_write/write_iter in the dma-buf file operations (fops) to 
>>>>> adapt
>>>>> to the sendfile method.
>>>>> However, the current sendfile/splice calls are based on pipe. When 
>>>>> using
>>>>> direct I/O to read a file, the content needs to be copied to the 
>>>>> buffer
>>>>> allocated by the pipe (default 64KB), and then the dma-buf fops'
>>>>> splice_write needs to be called to write the content into the 
>>>>> dma-buf.
>>>>> This approach requires serially reading the content of file pipe size
>>>>> into the pipe buffer and then waiting for the dma-buf to be written
>>>>> before reading the next one.(The I/O performance is relatively weak
>>>>> under direct I/O.)
>>>>> Moreover, due to the existence of the pipe buffer, even when using
>>>>> direct I/O and not needing to generate additional page cache,
>>>>> there still needs to be a CPU copy.
>>>>>
>>>>> copy_file_range[5]
>>>>> ---
>>>>> Consider of copy_file_range, It only supports copying files within 
>>>>> the
>>>>> same file system. Similarly, it is not very practical.
>>>>>
>>>>>
>>>>> So, currently, there is no particularly suitable solution on VFS to
>>>>> allow dma-buf to support direct I/O for large file reads.
>>>>>
>>>>> This patchset provides an idea to complete file reads when 
>>>>> requesting a
>>>>> dma-buf.
>>>>>
>>>>> Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>>>> ===
>>>>> This patch provides a method to immediately read the file content 
>>>>> after
>>>>> the dma-buf is allocated, and only returns the dma-buf file 
>>>>> descriptor
>>>>> after the file is fully read.
>>>>>
>>>>> Since the dma-buf file descriptor is not returned, no other thread 
>>>>> can
>>>>> access it except for the current thread, so we don't need to worry 
>>>>> about
>>>>> race conditions.
>>>>
>>>> That is a completely false assumption.
>>> Can you provide a detailed explanation as to why this assumption is 
>>> incorrect? thanks.
>>
>> File descriptors can be guessed and is available to userspace as soon 
>> as dma_buf_fd() is called.
>>
>> What could potentially work is to call system_heap_allocate() without 
>> calling dma_buf_fd(), but I'm not sure if you can then make I/O to 
>> the underlying pages.
>
> Actually, the dma-buf file descriptor is obtained only after a 
> successful file read in the code, so there is no issue.
>
> If you are interested, you can take a look at the 
> dma_heap_buffer_alloc_and_read function in patch1.
>
>>
>>>>
>>>>>
>>>>> Map the dma-buf to the vmalloc area and initiate file reads in kernel
>>>>> space, supporting both buffer I/O and direct I/O.
>>>>>
>>>>> This patch adds the DMA_HEAP_ALLOC_AND_READ heap_flag for user.
>>>>> When a user needs to allocate a dma-buf and read a file, they should
>>>>> pass this heap flag. As the size of the file being read is fixed, 
>>>>> there is no
>>>>> need to pass the 'len' parameter. Instead, The file_fd needs to be 
>>>>> passed to
>>>>> indicate to the kernel the file that needs to be read.
>>>>>
>>>>> The file open flag determines the mode of file reading.
>>>>> But, please note that if direct I/O(O_DIRECT) is needed to read 
>>>>> the file,
>>>>> the file size must be page aligned. (with patch 2-5, no need)
>>>>>
>>>>> Therefore, for the user, len and file_fd are mutually exclusive,
>>>>> and they are combined using a union.
>>>>>
>>>>> Once the user obtains the dma-buf fd, the dma-buf directly 
>>>>> contains the
>>>>> file content.
>>>>
>>>> And I'm repeating myself, but this is a complete NAK from my side 
>>>> to this approach.
>>>>
>>>> We pointed out multiple ways of how to implement this cleanly and 
>>>> not by hacking functionality into the kernel which absolutely 
>>>> doesn't belong there.
>>> In this patchset, I have provided performance comparisons of each of 
>>> these methods.  Can you please provide more opinions?
>>
>> Either drop the whole approach or change udmabuf to do what you want 
>> to do.
> OK, if so, do I need to send a patch to make dma-buf support sendfile?

Well the udmabuf approach doesn't need to use sendfile, so no.

Regards,
Christian.

>
>>
>> Apart from that I don't see a doable way which can be accepted into 
>> the kernel.
> Thanks for your suggestion.
>>
>> Regards,
>> Christian.
>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Patch 1 implement it.
>>>>>
>>>>> Patch 2-5 provides an approach for performance improvement.
>>>>>
>>>>> The DMA_HEAP_ALLOC_AND_READ_FILE heap flag patch enables us to
>>>>> synchronously read files using direct I/O.
>>>>>
>>>>> This approach helps to save CPU copying and avoid a certain degree of
>>>>> memory thrashing (page cache generation and reclamation)
>>>>>
>>>>> When dealing with large file sizes, the benefits of this approach 
>>>>> become
>>>>> particularly significant.
>>>>>
>>>>> However, there are currently some methods that can improve 
>>>>> performance,
>>>>> not just save system resources:
>>>>>
>>>>> Due to the large file size, for example, a AI 7B model of around 
>>>>> 3.4GB, the
>>>>> time taken to allocate DMA-BUF memory will be relatively long. 
>>>>> Waiting
>>>>> for the allocation to complete before reading the file will add to 
>>>>> the
>>>>> overall time consumption. Therefore, the total time for DMA-BUF
>>>>> allocation and file read can be calculated using the formula
>>>>>     T(total) = T(alloc) + T(I/O)
>>>>>
>>>>> However, if we change our approach, we don't necessarily need to wait
>>>>> for the DMA-BUF allocation to complete before initiating I/O. In 
>>>>> fact,
>>>>> during the allocation process, we already hold a portion of the page,
>>>>> which means that waiting for subsequent page allocations to complete
>>>>> before carrying out file reads is actually unfair to the pages 
>>>>> that have
>>>>> already been allocated.
>>>>>
>>>>> The allocation of pages is sequential, and the reading of the file is
>>>>> also sequential, with the content and size corresponding to the file.
>>>>> This means that the memory location for each page, which holds the
>>>>> content of a specific position in the file, can be determined at the
>>>>> time of allocation.
>>>>>
>>>>> However, to fully leverage I/O performance, it is best to wait and
>>>>> gather a certain number of pages before initiating batch processing.
>>>>>
>>>>> The default gather size is 128MB. So, ever gathered can see as a 
>>>>> file read
>>>>> work, it maps the gather page to the vmalloc area to obtain a 
>>>>> continuous
>>>>> virtual address, which is used as a buffer to store the contents 
>>>>> of the
>>>>> corresponding file. So, if using direct I/O to read a file, the file
>>>>> content will be written directly to the corresponding dma-buf 
>>>>> buffer memory
>>>>> without any additional copying.(compare to pipe buffer.)
>>>>>
>>>>> Consider other ways to read into dma-buf. If we assume reading 
>>>>> after mmap
>>>>> dma-buf, we need to map the pages of the dma-buf to the user virtual
>>>>> address space. Also, udmabuf memfd need do this operations too.
>>>>> Even if we support sendfile, the file copy also need buffer, you must
>>>>> setup it.
>>>>> So, mapping pages to the vmalloc area does not incur any additional
>>>>> performance overhead compared to other methods.[6]
>>>>>
>>>>> Certainly, the administrator can also modify the gather size 
>>>>> through patch5.
>>>>>
>>>>> The formula for the time taken for system_heap buffer allocation and
>>>>> file reading through async_read is as follows:
>>>>>
>>>>>    T(total) = T(first gather page) + Max(T(remain alloc), T(I/O))
>>>>>
>>>>> Compared to the synchronous read:
>>>>>    T(total) = T(alloc) + T(I/O)
>>>>>
>>>>> If the allocation time or I/O time is long, the time difference 
>>>>> will be
>>>>> covered by the maximum value between the allocation and I/O. The 
>>>>> other
>>>>> party will be concealed.
>>>>>
>>>>> Therefore, the larger the size of the file that needs to be read, the
>>>>> greater the corresponding benefits will be.
>>>>>
>>>>> How to use
>>>>> ===
>>>>> Consider the current pathway for loading model files into DMA-BUF:
>>>>>    1. open dma-heap, get heap fd
>>>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>    4. mmap dma-buf fd, get vaddr
>>>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>>    6. share, attach, whatever you want
>>>>>
>>>>> Use DMA_HEAP_ALLOC_AND_READ_FILE JUST a little change:
>>>>>    1. open dma-heap, get heap fd
>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap 
>>>>> flag, set file_fd
>>>>>       instead of len. get dma-buf fd(contains file content)
>>>>>    4. share, attach, whatever you want
>>>>>
>>>>> So, test it is easy.
>>>>>
>>>>> How to test
>>>>> ===
>>>>> The performance comparison will be conducted for the following 
>>>>> scenarios:
>>>>>    1. normal
>>>>>    2. udmabuf with [3] patch
>>>>>    3. sendfile
>>>>>    4. only patch 1
>>>>>    5. patch1 - patch4.
>>>>>
>>>>> normal:
>>>>>    1. open dma-heap, get heap fd
>>>>>    2. open file, get file_fd(can't use O_DIRECT)
>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>    4. mmap dma-buf fd, get vaddr
>>>>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>>>>    6. share, attach, whatever you want
>>>>>
>>>>> UDMA-BUF step:
>>>>>    1. memfd_create
>>>>>    2. open file(buffer/direct)
>>>>>    3. udmabuf create
>>>>>    4. mmap memfd
>>>>>    5. read file into memfd vaddr
>>>>>
>>>>> Sendfile step(need suit splice_write/write_iter, just use to 
>>>>> compare):
>>>>>    1. open dma-heap, get heap fd
>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>    3. use file len to allocate dma-buf, get dma-buf fd
>>>>>    4. sendfile file_fd to dma-buf fd
>>>>>    6. share, attach, whatever you want
>>>>>
>>>>> patch1/patch1-4:
>>>>>    1. open dma-heap, get heap fd
>>>>>    2. open file, get file_fd(buffer/direct)
>>>>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap 
>>>>> flag, set file_fd
>>>>>       instead of len. get dma-buf fd(contains file content)
>>>>>    4. share, attach, whatever you want
>>>>>
>>>>> You can create a file to test it. Compare the performance gap 
>>>>> between the two.
>>>>> It is best to compare the differences in file size from KB to MB 
>>>>> to GB.
>>>>>
>>>>> The following test data will compare the performance differences 
>>>>> between 512KB,
>>>>> 8MB, 1GB, and 3GB under various scenarios.
>>>>>
>>>>> Performance Test
>>>>> ===
>>>>>    12G RAM phone
>>>>>    UFS4.0(the maximum speed is 4GB/s. ),
>>>>>    f2fs
>>>>>    kernel 6.1 with patch[7] (or else, can't support kvec direct 
>>>>> I/O read.)
>>>>>    no memory pressure.
>>>>>    drop_cache is used for each test.
>>>>>
>>>>> The average of 5 test results:
>>>>> | scheme-size         | 512KB(ns)  | 8MB(ns)    | 1GB(ns) | 
>>>>> 3GB(ns)       |
>>>>> | ------------------- | ---------- | ---------- | ------------- | 
>>>>> ------------- |
>>>>> | normal              | 2,790,861  | 14,535,784 | 1,520,790,492 | 
>>>>> 3,332,438,754 |
>>>>> | udmabuf buffer I/O  | 1,704,046  | 11,313,476 | 821,348,000 | 
>>>>> 2,108,419,923 |
>>>>> | sendfile buffer I/O | 3,261,261  | 12,112,292 | 1,565,939,938 | 
>>>>> 3,062,052,984 |
>>>>> | patch1-4 buffer I/O | 2,064,538  | 10,771,474 | 986,338,800 | 
>>>>> 2,187,570,861 |
>>>>> | sendfile direct I/O | 12,844,231 | 37,883,938 | 5,110,299,184 | 
>>>>> 9,777,661,077 |
>>>>> | patch1 direct I/O   | 813,215    | 6,962,092  | 2,364,211,877 | 
>>>>> 5,648,897,554 |
>>>>> | udmabuf direct I/O  | 1,289,554  | 8,968,138  | 921,480,784 | 
>>>>> 2,158,305,738 |
>>>>> | patch1-4 direct I/O | 1,957,661  | 6,581,999  | 520,003,538 | 
>>>>> 1,400,006,107 |
>>>
>>> With this test, sendfile can't give a good help base on pipe buffer.
>>>
>>> udmabuf is good, but I think our oem driver can't suit it. (And, 
>>> AOSP do not open this feature)
>>>
>>>
>>> Anyway, I am sending this patchset in the hope of further discussion.
>>>
>>> Thanks.
>>>
>>>>>
>>>>> So, based on the test results:
>>>>>
>>>>> When the file is large, the patchset has the highest performance.
>>>>> Compared to normal, patchset is a 50% improvement;
>>>>> Compared to normal, patch1 only showed a degradation of 41%.
>>>>> patch1 typical performance breakdown is as follows:
>>>>>    1. alloc cost 188,802,693 ns
>>>>>    2. vmap cost 42,491,385 ns
>>>>>    3. file read cost 4,180,876,702 ns
>>>>> Therefore, directly performing a single direct I/O read on a large 
>>>>> file
>>>>> may not be the most optimal way for performance.
>>>>>
>>>>> The performance of direct I/O implemented by the sendfile method 
>>>>> is the worst.
>>>>>
>>>>> When file size is small, The difference in performance is not
>>>>> significant. This is consistent with expectations.
>>>>>
>>>>>
>>>>>
>>>>> Suggested use cases
>>>>> ===
>>>>>    1. When there is a need to read large files and system 
>>>>> resources are scarce,
>>>>>       especially when the size of memory is limited.(GB level) In 
>>>>> this
>>>>>       scenario, using direct I/O for file reading can even bring 
>>>>> performance
>>>>>       improvements.(may need patch2-3)
>>>>>    2. For embedded devices with limited RAM, using direct I/O can 
>>>>> save system
>>>>>       resources and avoid unnecessary data copying. Therefore, 
>>>>> even if the
>>>>>       performance is lower when read small file, it can still be used
>>>>>       effectively.
>>>>>    3. If there is sufficient memory, pinning the page cache of the 
>>>>> model files
>>>>>       in memory and placing file in the EROFS file system for 
>>>>> read-only access
>>>>>       maybe better.(EROFS do not support direct I/O)
>>>>>
>>>>>
>>>>> Changlog
>>>>> ===
>>>>>   v1 [8]
>>>>>   v1->v2:
>>>>>     Uses the heap flag method for alloc and read instead of adding 
>>>>> a new
>>>>>     DMA-buf ioctl command. [9]
>>>>>     Split the patchset to facilitate review and test.
>>>>>       patch 1 implement alloc and read, offer heap flag into it.
>>>>>       patch 2-4 offer async read
>>>>>       patch 5 can change gather limit.
>>>>>
>>>>> Reference
>>>>> ===
>>>>> [1] 
>>>>> https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com/
>>>>> [2] https://lore.kernel.org/all/ZpTnzkdolpEwFbtu@phenom.ffwll.local/
>>>>> [3] 
>>>>> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
>>>>> [4] https://lore.kernel.org/all/Zpf5R7fRZZmEwVuR@infradead.org/
>>>>> [5] https://lore.kernel.org/all/ZpiHKY2pGiBuEq4z@infradead.org/
>>>>> [6] 
>>>>> https://lore.kernel.org/all/9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com/
>>>>> [7] 
>>>>> https://patchew.org/linux/20230209102954.528942-1-dhowells@redhat.com/20230209102954.528942-7-dhowells@redhat.com/
>>>>> [8] 
>>>>> https://lore.kernel.org/all/20240711074221.459589-1-link@vivo.com/
>>>>> [9] 
>>>>> https://lore.kernel.org/all/5ccbe705-883c-4651-9e66-6b452c414c74@amd.com/
>>>>>
>>>>> Huan Yang (5):
>>>>>    dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>>>>    dma-buf: heaps: Introduce async alloc read ops
>>>>>    dma-buf: heaps: support alloc async read file
>>>>>    dma-buf: heaps: system_heap alloc support async read
>>>>>    dma-buf: heaps: configurable async read gather limit
>>>>>
>>>>>   drivers/dma-buf/dma-heap.c          | 552 
>>>>> +++++++++++++++++++++++++++-
>>>>>   drivers/dma-buf/heaps/system_heap.c |  70 +++-
>>>>>   include/linux/dma-heap.h            |  53 ++-
>>>>>   include/uapi/linux/dma-heap.h       |  11 +-
>>>>>   4 files changed, 673 insertions(+), 13 deletions(-)
>>>>>
>>>>>
>>>>> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
>>>>
>>

