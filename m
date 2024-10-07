Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC9E99506E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C79910E54C;
	Tue,  8 Oct 2024 13:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ssW7Ip/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BD610E0AD;
 Mon,  7 Oct 2024 12:28:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmGs9bf5fZBk0C5CPdpvqReuNGYpn2dxpf1Mq7/D1X5YjjRNb0dagShO7584OIXF04/2h6hj1RZZtQbDd5w1E9tam1rLTt5mC3gbMZn7tgj0meUOmhbC6JBBLsBc3vGq5oywwHxHq25Ciirdyek7svfSYCHahBfQZDdDlnYsmvDmOEWwGSEV5mBv7bstTiV5sCNJmtThm7x+03tQguqFYUa9+dyNmlLMeIyqBV1iVepFK+JMD7bcnpYFnmtir74IlOUFm5poQytBgnFv7LAjMyKkv6vsdRuR4gNtoEKvngY8IR88SBZWc/xjdllnGlmBuHaE5kGB9u9ArvVDxgnPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CctZH7L+yPRG4QhflR2Z+mL90lwc/GBr/Bs9VMgF1/U=;
 b=sABCh2BZ6gbmnY/c5pbTOQcjAR47dBkIc+1l5U456InP129+vcRUZqXPybbD6r2mirtU+evZ7Ojrdjthv2cHrkCLTD+PiOcjZU7ZzuD17udf7Qe3pN/trxXLZBtNfA7uUDFTEe+T7jlQvh3Y1+aUZwETGtw3ASlvtgmn/NyJHPaCtyF6g6HbUg4WXmPbgWj0CTenhxdaJnMw4hefMRjxJXsUeNfBXg5ZbZjNDL3M0xQvilyKaQw3faNIjUImmNI3Hxu1ksh2xKJK7/9qeJRNlUS3jydgbgNEbvR3Ee/zJoHsqlCZ+WFNLF3rduQriRDFyyoLciMaf23o/2owgDNO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CctZH7L+yPRG4QhflR2Z+mL90lwc/GBr/Bs9VMgF1/U=;
 b=ssW7Ip/Rrp4+DDyMEQsFFRbnmgcvHgsURJTaMAMp2gSWycTVQSHtjw/1RRBxE2kvBYWBScRPp1/I6Znk6eGRsHuQ3VFilJ9/QSIKvtzyZoQLXQ775MWw910FAtAZ0HWawk4ncPpFJUMEXcqf4Jq9Z9erKevhyNZesF3Et+MEHKEDfsUg9ld1i50iVJLt3T5wiy86uFlJpfhuF79g+zW/EAemjJhLwNhBTKzkj8/z2a8R+1mHUWF0Pt/MVSciqxecwQxpxOqyO7y30BPzqBT8rlobXzFSc/Wc8w7mAG2DxY/3yvKSowvwWI039LoSWXXHwX9D4A1AdQivUhvpkCYD/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 by BN5PR12MB9512.namprd12.prod.outlook.com (2603:10b6:408:2ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.9; Mon, 7 Oct
 2024 12:28:31 +0000
Received: from BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938]) by BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 12:28:31 +0000
Message-ID: <f9fa14c1-f487-4ad9-9bc9-7c1db6de1ae6@nvidia.com>
Date: Mon, 7 Oct 2024 15:28:22 +0300
User-Agent: Mozilla Thunderbird
From: Yonatan Maman <ymaman@nvidia.com>
Subject: Re: [PATCH 2/2] nouveau/dmem: Fix memory leak in `migrate_to_ram`
 upon copy error
To: Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org, Gal Shalom <GalShalom@nvidia.com>,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240923135449.356244-1-Ymaman@Nvidia.com>
 <20240923135449.356244-3-Ymaman@Nvidia.com> <ZvqJgMVBs2kAWguk@pollux>
Content-Language: en-US
In-Reply-To: <ZvqJgMVBs2kAWguk@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0516.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::23) To DM4PR12MB5866.namprd12.prod.outlook.com
 (2603:10b6:8:65::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5851:EE_|BN5PR12MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3e0782-1427-4645-5dc2-08dce6cb8d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0doV1Z5c2ZUSE42WU5ZTVVrSmVXSENJTldPR2h0SDQ0UFZyL01VaFdjdjdY?=
 =?utf-8?B?T1VYUGF1ODhKUEo4cThaWnNCSTlXRnMyYnZ6TFRScjhDYU15LzhMUU1oeW54?=
 =?utf-8?B?NFMrOWhxYmhaLzloUUFCQUFkR2tGU1pWTmVQRFJ4MC9KcXMyOWc0OHJPNVky?=
 =?utf-8?B?SFduNXB3eElueWxXUFg5MzIzVTFhNE1yRlVrZXl4MCtpNmhSVGF5VFJPVTFH?=
 =?utf-8?B?SHRKbmhGUXgwWkMvdFBucXQzQ3ZwTUZSazBCVGlmMnNHT2YvN21TRUxIRm5l?=
 =?utf-8?B?S2xkeE16b01zWDhkTS9jVWhTc3ZqSVRxbTg5dk1RajRNbHVDaURwMEljeEk4?=
 =?utf-8?B?RG9WTll0K2FaY1plSmxZR0FQdTVSQjM3QW0vZHY4MTBWbFdhQTYxM215SjlS?=
 =?utf-8?B?ME9JSE0ySzgvZVBWUC9NSWN6RWRBQ2tqbUxMZVcwWDFsNVpGSGNVQWpJMHkv?=
 =?utf-8?B?U3hyN1BjT0pUOWlEbEJ0VFlBUzh3YlhuL011SGYwSks0ZDRZUVlma2ZCVWI4?=
 =?utf-8?B?UVEwdUVvbFFwRmIyek1lVWZRUmI0RVRwMGEyV2syZngvMmhMdnlwTUlBci9s?=
 =?utf-8?B?bjJxa2VmQmNLNmRleThjalh5RldVTVZ2VGVjUzdzRStyQU1ncFJaakpQNlFL?=
 =?utf-8?B?bFJ6WkFVQ0VPZGI1c2xNNUVZYlJJaWQveFdQWWNrcUYyRjlLd0lqOFU5YUpR?=
 =?utf-8?B?czlxQkExdmhLeGVTQTY2U2ozYzdjQVoxVGxQb2lXbkttL0RVQ2lLNGYvVEls?=
 =?utf-8?B?YURHbnNob0JIWUwwZHdjbUtvTjZLTkNPdmxxdjdsRE5DRit5ZTJ4T0o0czFm?=
 =?utf-8?B?bFBneGdRVFQ4MHpKQ216NWUwdkVXT3RLRWNQTEdoVHdtaTA3Wi85bkpWak9v?=
 =?utf-8?B?dUlQY0ZhOUROZW5wejIwblBnbTN6cUpLSlBWcW9DMEw1OFpsMUpUdkYzTFdN?=
 =?utf-8?B?VWJjbU1aUCtNVUEwNkZLSHN1ZDRjVFduY1N4cFRnSGFYOTlOMVFMTnA2R0Qv?=
 =?utf-8?B?Z1JKdVZqU25QYnZmK1RqUEwvRFFLRTRFc0xMTFg3NWJpRjhVTG1xWFNudmhF?=
 =?utf-8?B?NGVIYmJGSlUyUTVIdTAwdFZCdElaZTdodGZuSWFtU0NiR2ZYYlBzK3JkTGdF?=
 =?utf-8?B?aFRLOFVIQmdNRjQ4Tmg4R0VFTXE3eGhvenpiUGVIb0N2S1dNVVBvRFBxY1Vq?=
 =?utf-8?B?STJET2l2cHlNUWRIMXpwVEx5Z3VOOFRxMTlEdEJUTlFlaTU0RnBWdXlEd040?=
 =?utf-8?B?ckJSN3RETkFla3FWZTcxRGRHcHRrVS9DL2JFUFZwY3BsUHlRcEo5aUtpN0dE?=
 =?utf-8?B?aHlseGgvdUJMRHpmR3RKVFNuWEM3MlM5YmR0MDVlbmtackorWHJyRTZRTUtv?=
 =?utf-8?B?dDVCR1I1ZHlSK0tHdWxmRTZ0aGdXUW92VFJVZ1RzZEFManphZldXRTBucTZy?=
 =?utf-8?B?RVJpdkhpNDBIZnZVa1dmVm9ZcGIzNHNhVTQreFQxS0YwejZ5NFB4OUJFbGRN?=
 =?utf-8?B?UnJvb3BDeFBXdTU1ZjlncUltdjJnZnJJZm9Va0JGeXhOV1pDZnpWTUpEQ0Vn?=
 =?utf-8?B?R1RBWjV4KzRFalI5S0FDS3Bpck50K0xnaHZ4Y2RvMHJxYXdCVC9nOE82MFo2?=
 =?utf-8?B?a2hpM3FjVWFTQVdQWit4SDdrTWJPcktwWS9HMklpenBoQzlZc0FkMkpPL2xV?=
 =?utf-8?B?NS8rMzd2d1o1bGR2OHJVNmtKVU5MNC9oVXU2WDkwU0o3NWVDOGoxNUpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5851.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnhjNWI2QVduYVdXSTBVRDRvSW40cnYvWHVwck9XZ1RZc3BhRHluQ1o1VjBz?=
 =?utf-8?B?Q0Y3em5FL3N1UHB3Q0RRaTkxN2VubGVlYkNxbzdPQWo3NW1vV2l0VDM3MENG?=
 =?utf-8?B?cCs5ZTVXZG5zNmZiTlVsVUFFNUdGUitFaUJEWGl3b0JHaThpRFhvd2FCZnYv?=
 =?utf-8?B?c3VJUU5yMW9OYVJOdmxvY1pSZmV3R1R1YW5IMU1mU2QrRWxsUlBETkRRR2NM?=
 =?utf-8?B?L09nVU80WWNSRnUvQ0xFaDVpc2tTWEVYSkVySjdvN3JyNWFGWjBlalNYTUNt?=
 =?utf-8?B?OWk2TzlrNzlhK3VkYUt6YlhNMW5ya0h0WGZ2WUhyUXhwSUFkY2crRFgyVGRM?=
 =?utf-8?B?YVFiNjVqS3l5ZUkzQ1B2ZWl0RkwyV2QrdEVzbTFVZU1mampDZGs1KzIxL0lo?=
 =?utf-8?B?YXhFM2g1YTVOZ2Q1S05UVlJEL05HTEg4TTVBeVRuR1BLZzUvM1dpQnpDTTlK?=
 =?utf-8?B?TkxaSm5iMnU4SGNVNktaNEEvekFNVXVTYjNuU0s2VXVWYkUvd3NRUDFXNDk2?=
 =?utf-8?B?UTRKbmVXTVBIai9RbVUvWHZuUlc4VkhqTzBvSitkWXlLMVh1cXRJU21nVVk4?=
 =?utf-8?B?RnBKMFhQeGJ5Q2JwY1plL2dzNkV4MytnemE5bkJkK2tFWXJYN3RraEpDZGlv?=
 =?utf-8?B?V1F4ZTNja0QyUUQ2WjlTM09Ya2h1dDc1a01xbUo0dzFnS01WdGNUVzhaaDJ6?=
 =?utf-8?B?TTBmWDhuVXRBeGRlSG1SS2hvek56d0s5aHVwZ00xWWxnUHFOM2NKTmFsbmk3?=
 =?utf-8?B?d3F2N1REbjhnY3lBWmgweXhxNUhSdFJJR0RxUGcxdFBIcUdZYWowR290dVMw?=
 =?utf-8?B?OW93ZUVkSXAyd0J4eTRIbFF0VWhoUjljZ2hVZ0M1dk5GVEFKakxwL0hRUjlF?=
 =?utf-8?B?QkRUVUtYNDV4NjhOK2pkdzlGNHlxSUt5MExCQkJUbnAvdlliaitFYWRzelBx?=
 =?utf-8?B?dnNVVEJDYlBRdHM1cU4rNTA3OTJJQlhzVjZuL0M1Rlk4R2hVR0wzVVoxcWFK?=
 =?utf-8?B?QThhMFVyQlJIdGVlSWZneUNURVRZTWdMTGtFT290NWQ1YXErZThuY3lRWGVJ?=
 =?utf-8?B?Mk1BWE5mdFF2RW1HWms3ZkVtK254NXVnZm5peDV5WjJCdGs3djViZ1czRFg0?=
 =?utf-8?B?aitKblRxZDd1cTlHeWswNGlaVkh0Q2VFRlhTTzFlRzZEOEJjblh4TUxuNzFV?=
 =?utf-8?B?NmNRTnplSjJaZ1g1cU1WZG5iTG1FQUwyM2cyL1JKSlViQzJDdGNuc2t0ZXZq?=
 =?utf-8?B?eTVqVFo2eG1GTUlqWDBkYTFjNXZyeG5ob3RHNXo5QVlDM3FDdmh6T2tyL2dm?=
 =?utf-8?B?Y2tFdTdlaHRpbklLSWo3QlJYMmdoNzVpYjJWK01sODNXZExnam00NFFpRHpE?=
 =?utf-8?B?QUowUGpYMWJFZlJmdk1SbFN5dktzbWkwQ0R0eTJGdmlITjdVQTlCVU1aVVB0?=
 =?utf-8?B?enh5eUJ6Q1Q1bGQ0QnBqTVZ4YTlUQ21KRUlla1c2bGx3cWVFNlJkNHJ4THVr?=
 =?utf-8?B?OG44UFN3VVdlckkvY2lqZkMyUXNxcmM1cW1TcG9jemRhZVRWK2htUkk5R2xk?=
 =?utf-8?B?eElCUk93SVBUM1Bodm9NQ2ZKVElPZUFDSWlheXZpWm4wSUhHVmlDb1VGMnIz?=
 =?utf-8?B?L25qNEM1MnRDUEJTR0crUEhWemsrNVluVEtJMU8rcmhUcVg1eTcwMXdnODYw?=
 =?utf-8?B?VjJBWCtQTmZCMi9LVndoZUh4STMzYW81VFhSa21QTGFzVDN2Z3dRdkdhYlpT?=
 =?utf-8?B?SHNjRkJKSzJOMzk2eFpiTWVpekhmNjVuWkZkckdXRW9EYW1PMlNtZDl6Nm56?=
 =?utf-8?B?U1V1RHp5YVRDNXRaUlBOeWZlRHFYbUlla0pTcUtsMTY3ODBMVVJBVU8zeUtG?=
 =?utf-8?B?RW54bGM4YjZFYlFhb01odjJQNWJ1bjV5ZjByNjhGZVJrakJUdzl2ak1qazUr?=
 =?utf-8?B?WmtrOEpUaWM3b0ZmcmZBMGRjYnR6YlVueVBBTVVhZUlOalVSNkdqWndycEhN?=
 =?utf-8?B?NXZXbE44RjdudFRTWXVyRHR3YXc2NXpJakh0WTJkd2VVVWsvaTJMbStYV0w2?=
 =?utf-8?B?ZHExOFFMQ2xuaGRyVGpBdHpFeTNmaXBPQWJZRnZqaThFZ0cvM0FUSG5TRWxO?=
 =?utf-8?Q?b+yxoUq5v6RbWDCsiANRL/0+b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3e0782-1427-4645-5dc2-08dce6cb8d5d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5866.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 12:28:31.3829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSsnaENVQquwraiGkWxr/wdf+gAbaQU20du/542RwTP0WuWpaQyOPsd2GQIg5aIFxHYfk8uPNQp9V1bITN7i7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9512
X-Mailman-Approved-At: Tue, 08 Oct 2024 13:41:08 +0000
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



On 30/09/2024 14:20, Danilo Krummrich wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Mon, Sep 23, 2024 at 01:54:58PM +0000, Yonatan Maman wrote:
>> A copy push command might fail, causing `migrate_to_ram` to return a
>> dirty HIGH_USER page to the user.
>>
>> This exposes a security vulnerability in the nouveau driver. To prevent
>> memory leaks in `migrate_to_ram` upon a copy error, allocate a zero
>> page for the destination page.
> 
> So, you refer to the case where this function fails in nouveau_dmem_copy_one()?
> 
> If so, can you please explain why adding __GFP_ZERO to alloc_page_vma() helps
> with that?
> 

The nouveau_dmem_copy_one function ensures that the copy push command is 
sent to the device firmware but does not track whether it was executed 
successfully.

In the case of a copy error (e.g., firmware or hardware error), the 
command will be sent in the firmware channel, and nouveau_dmem_copy_one 
might succeed, as well as the migrate_to_ram function. Thus, a dirty 
page could be returned to the user.

It’s important to note that we attempted to use nouveau_fence_wait 
status to handle migration errors, but it does not catch all error types.

To avoid this vulnerability, we allocate a zero page. So that, in case 
of an error, a non-dirty (zero) page will be returned to the user.

>>
>> Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
>> Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
> 
> Since this is a bug, please also add a 'Fixes' tag, CC stable and add a
> 'Co-developed-by' tag if appropriate.

sure, thanks, I will add, and push it as V2 patch-series.
> 
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> index 6fb65b01d778..097bd3af0719 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -193,7 +193,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>>        if (!spage || !(src & MIGRATE_PFN_MIGRATE))
>>                goto done;
>>
>> -     dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
>> +     dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
>>        if (!dpage)
>>                goto done;
>>
>> --
>> 2.34.1
>>

