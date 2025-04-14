Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE38A87B91
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 11:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D587B10E4F5;
	Mon, 14 Apr 2025 09:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XvlFI277";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BDA10E4F5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 09:11:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qa3QqhUzgMJAYGdnpYI95uDBdTsCBO1VMOusm5iYQjrWQYBqL3LvapizM5or1HsxN0/z1PsDLkpEcZPIQkKNSD7SrATibMEeJr4jcQpuG98R2NEETx7O+XpQMd4xr8JegHqW5tANxCUBuVQ26SY1z9c8ZJGCvviD+RHbYycaw8vhIDZp2WdtAx4u0+tfWDbGtlfkV1kztrhYEuVomV3bc9mzVMuEOQC449GDkAnxLE4Ju63ok63KFGQ3W3WJcGfNMtv/GkmXMrOZgQTEUjcV0ZC1UpjGzK+aJt6fsKj/G7x1LFNjeVsF6ZrddZsrFSeY8v/QZR+M49dQ3mCqTGTKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMrPhkLyyGWO0N7t+iXK46ETTPMo6fwsYOiqS/DOjfE=;
 b=Y8bEDr9iYSiPLZnuanNZXq27Z/iXMA7jhHGFRQS7s3Jnh8CmqMsf3Yf6+DmHY8TTpi+8K19njRwOuZlew0U5LfF4d1W1AB/5NbXoRZ7QXXLCac6YuAzyUACRf7AYd3BPZ1K/WrtnWDjWnrDO34yiXEvwsW03UPa1u3JzIwXCMIQNZC21EwLhIm+GYklyKkY8DKnUITTcGDPcCs0Lud1CgoEuiHpLDXqjnLMVtocMUeZ0NLH4bhJollscmKCL60PdFRP5x3WBzRXSx7geUdcfGzunClygeOwCfFSleEBNTRa5vxG93PASS9hkV5rRkxxXCnuK+QnnFAc8HDkf11Y6SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMrPhkLyyGWO0N7t+iXK46ETTPMo6fwsYOiqS/DOjfE=;
 b=XvlFI277NyFhRFjCQr9w4VrzbGUC8qJ1iCHjr9urDskFgMw3mMnTStW/Wq/rnsNFj+ub0hzoqeP1l5g89M+j+jbPYaa9xTh1dZKqKGDdROc2NeGCsLRcN18wCdvlPBY0FyrbTHtwnXDPp9f+C3vcgLYkPsMLNMmoThRn1RnRkWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN6PR12MB8514.namprd12.prod.outlook.com (2603:10b6:208:474::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 09:11:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 09:11:52 +0000
Message-ID: <29eb3698-7dc2-4c32-b636-8ef0ee6d1f47@amd.com>
Date: Mon, 14 Apr 2025 11:11:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christoph Hellwig <hch@infradead.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <Z_yjNgY3dVnA5OVz@infradead.org> <20250414102455.03331c0f@windsurf>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250414102455.03331c0f@windsurf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN6PR12MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 8def9ca8-06e4-4c48-f343-08dd7b346575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3lNVzBINnQ3bXppTldBY2NjMXh0SWlsMkNEQTN6eWR0THhiSmt3eFkxRmhV?=
 =?utf-8?B?UlZDWUo3OUYwSjlUb0VtbjREcnFSNVlPRjhGK3A5MGs2bEhmSmtscDBhZStI?=
 =?utf-8?B?Q3Z3S2NaZ3VOVkpPNjVPbkUvNGlWN0JPOWQvWWt5R2ZFbFdHQXI1U1kxRVVV?=
 =?utf-8?B?cFIwczBCSWNkZTh6NEtNeWg3UUpKU2F3R2s1OGNTVGVSeEVreGQ1OXIyTXR2?=
 =?utf-8?B?T3lJaEQ2RG12Q01TZENuM2pMdGNBTmh0Y3oyRXFpRFpWc2dXNWVrYXlrL0dE?=
 =?utf-8?B?NWszSjNjaEdkWGdjRmhFWTFJZHhqcHQvVUJIdUg2bkxQWm1uREpvdlkrRllq?=
 =?utf-8?B?SnZVMis5VmQ5bjRBWHZlS0hMZmhQdzdPblg1M3piOUdFWnRZdEIzQWRSQTJl?=
 =?utf-8?B?NUxNcWRXL0UvSGNueE5QMXFNVHB4bjJPeldVOFhyS3FpNkdkQkRrazg1ZU95?=
 =?utf-8?B?ZHhienZOMXgwR1VIU3NNcHJpVTR0S0I0eldtekJncWR2NGU0UnVCUVhkaE4z?=
 =?utf-8?B?cmFEdE9LUWNqSndtU3FRVFAxUUxpdXBaVVhSaFFuTW1tMlpVeVNLM1JCVnlt?=
 =?utf-8?B?L2F5VGg5US9rZXNxeUJ2M1NydzY3K3luWXhxd3hIaHA4eVdrV2FoUlZJOE5U?=
 =?utf-8?B?ZmFqanJPS09hNVN3RVd6OUVLeWdqWEZCeTlaK0w1UFFWRWdDT1BvRGVybDdn?=
 =?utf-8?B?MThENFdXQ1dnK0VGYWltVDhOaGhLMXNoZW9nOU9xeStsOWEyNnVXbVpUR0xo?=
 =?utf-8?B?SHhoNDVSeEN2YkdSRXN1MmxMQ21oWHZsRzdzZUQ3NEcwRUhlN0hWR2ZzSVRo?=
 =?utf-8?B?QTJvcTdrRUNheUM2ek1nRzB2bjVVWHNwU2RoVDRwMnE2MzErU2swWndZYklQ?=
 =?utf-8?B?cWtNUkVlUUxjMFRVazdhYktKQ2hKQWh5b2VyMkxJeEZEZVR6cGdUNTlHMVdj?=
 =?utf-8?B?bmNrbUJNS2R3UG1UM3pVQWpLOS9teEVnZFJ5QWtTVEJicmxoa25YdnFFK0RZ?=
 =?utf-8?B?MXVoQUlCSi90Z2dNMHd4SUlOSE50S3cxTEJtMGxmUDg4eGgyYzZaNVNTY1Z3?=
 =?utf-8?B?Uk1hbzNtYy9VRmtXVUZXKzVpQWpyQ0pyaVBDRDBZK29UNFAvNkwvalRScTNj?=
 =?utf-8?B?MFJsK2VsRXVUdEgyWW9pY3Z4Q3ZISUFYdWg4VEFEU1VUWEY4Ylp0LzdTY2xv?=
 =?utf-8?B?VkYvTzkwZ0kyYVc1bTU1dkdRWE5QTEd1QnpIQVBZMmRyb3lZaG1TTTNDeEs3?=
 =?utf-8?B?cG5SZlRtTFNRYmUxYjIwQ3VlWDJLWDhXNmJpRWhSY1EwMjhFenFUOTRzV1kx?=
 =?utf-8?B?akpRWVNvR2F4aWR4bkF1NURkRU1BZjVRK3NrTzhwSHpvcHloL05FVXRUM2Nr?=
 =?utf-8?B?Tm1ZeXBIWEtjcFlWM0pRckUyRGtFMWozNllqWDJUZHI2MUR2NW0wN2xDMWMx?=
 =?utf-8?B?bFBxTXpGR3R4cTRMUlpVdnRJR0tEaFVRUkJLTFJoa1dxNjBkcDlEMkNEazF5?=
 =?utf-8?B?anFSYXZYMVNPcm9XOUxiYnhLa05MZzA3bjY2SDBZZytLU3EwTnRLUlIrSk44?=
 =?utf-8?B?TUlTTzJqbjZBVUF6QVMwMFNOOEtoTlM2VEhTeFNXWkFtdytpb2FOc3lKUTRa?=
 =?utf-8?B?N1lKRlZOV2xPMWtuYU1DQWVJQVluMUZ3dWkvSW9GM0RSQ3lyelU1VjI5b3Y1?=
 =?utf-8?B?VktvUEw5dGxveC80SnVUUjBMNWhJbENSZmhBa3gzczZRelpBazFmalljMmV3?=
 =?utf-8?B?bi92Zm1ZM1VxS1lCT2lhSEZMRzF5aHlZL0FjMFQzcEdSelVsYzl1TERqWHdR?=
 =?utf-8?B?U3RaSEpac2k5VDFBRnVQdks5R3B2b1BONDJYZXJoNTJzZWdaNjFHN2JPSmRM?=
 =?utf-8?B?bEtVNy84Rm5uK0JsNGExaDVUOG84bTVrdFZwU3NLWmliL1l0bHNUVjBINU9R?=
 =?utf-8?Q?vLEkyoBt69w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dy96NWE3bTRKVlNRTkhLbjd2TXlhbmxFVnFxc0RDZlRKRnVHRy9TUTJ3SXdz?=
 =?utf-8?B?c1Vkc1ovRzkvZFVsOUk0cjFSUlFVUlhvbkRKVHpoby92aXA2NGhPOWR2TlNV?=
 =?utf-8?B?bDF2OEMwS3BadXF4UkVpbTI3SDF1cDVyblR4dVJDb0hvcDhOTk92NldZdmhH?=
 =?utf-8?B?NVdCSXBwc3VoY1V2VVlrNXRtTlRHVnhrZFFlZFREaldJcmFQVVEvYkJXdTd3?=
 =?utf-8?B?YjdKSUptRzRSSzZtWUJkemVsaDF6cWM4VWtncmdrOWI0d0N6S2JaNlZ2bzdL?=
 =?utf-8?B?UmdGUndGb0VLQ2I1Tk1KbENkb2txYk9UNk5VeEkrK2xZUU5DblVZTXczbEow?=
 =?utf-8?B?UWp0eEY5L3lZcXMycWh1UlBQUE9kS1VLTlNuVTlEektLQUR3NzM4a0t3dUo3?=
 =?utf-8?B?ZXh5bUtnNkwrb1VSTTdLRUM4Z3lITldvUW4vdjZpSTZiZDZzUnJTa0xiQlRT?=
 =?utf-8?B?aVVjdVBNVVJQVWtjQitFSlZOS3VvSFJyQ2ViN085eFI3cEovZ3FVSGZFckNP?=
 =?utf-8?B?VkNEc0lUQ2NXY28yVmRpK284UlBkZktBMDRUaDhXa3liZ0dma296NzJFOGlx?=
 =?utf-8?B?UWNUSDA1VkxGWndTRHE0RmhBVkcyYUNvVDZIbmtQTWE0U2xMemZjdzdrNEx5?=
 =?utf-8?B?VENKaFRHbkJzY2t3ZXNYUUVjTmFxRy9Ja280bmMwM3lwZVFESGlxclJyZzRW?=
 =?utf-8?B?NklWa3FHWnZaczBKSXRKVDBJSC9OenhzRVdnaS9rZTMzUEZaYU00Y3lCYUM1?=
 =?utf-8?B?Z2ZhWm1odU1EbEs3OUpNamE0Q0hEOXFGUDNmcE00K0I3UDYvY21RRFdSYnQ1?=
 =?utf-8?B?TDVPaGRZbHJSUHI1VTRHblc4QUROc0RmcFFtTmQ1Qit0SkVjaERGOWdBV0s0?=
 =?utf-8?B?aklyd2txOWFiaEFpWGkrZEwvd2NTMUtTSS9kT0JyeDZUYm50WVptRVo4R2R1?=
 =?utf-8?B?OGJlVmhzbzlrOURnRXFGbGdKaHJuNm1yTVJXd256WlkzR1hzZmw1TkhIZU5k?=
 =?utf-8?B?Z2taWE05NTFrczJIZE5sbEhpS0hoTGpjSUNyRW5tR3JiT29TalhMN3ZHNE1S?=
 =?utf-8?B?QW8rZXJNZFU0ZGdYcXEyTWpQR3VZRkVEZlE2c0lGekNYUUxycEgvNndYQkdp?=
 =?utf-8?B?K3pjUzY3RUJoRmtnTEFFdTVnSlhHelVlOGpsSklmZmt0eXRnb3dSSFpaUmJk?=
 =?utf-8?B?REZMYldpTGVyRVcrOHZuQjhRbWhpZE1DTUR2ZFF2NXA4TlM2c3Y2M3ljcTFT?=
 =?utf-8?B?c0VLTXhscmdBdjRFK2Z0dlk5TGtCNmZyL2dsaWlSblRMdzAxaXd0ZVp6WUQ2?=
 =?utf-8?B?dDJ2TEpnTkR3R2FIUXVGZkFqNS9abTQ0U0p3NnE0ZUZLK2VkVnQrRTd4bUJy?=
 =?utf-8?B?SmFiWDE2aVEzRlJrM2dsVzBxUnZ6QjViUEpXZnY1dVlvWFBwUVRKUGJqMWFy?=
 =?utf-8?B?aUQ3L1Z2cjRzcGZtTnBUTzVoR3BEWTBYcDBMTFZzMFZpUjJ0YVQzUWpvZ0dp?=
 =?utf-8?B?UVpOZmFUSmhxaS9sWUNTWlBTay9LUWx4eUNSdFJ3VGhlNlYwL3R6akMyaDBI?=
 =?utf-8?B?eGE3TmNibGZZZXVRaGY2T01vaFduYVNLcExRVmRiOWcrNGNOd09KOTcxN2NY?=
 =?utf-8?B?d0wzQmdwRzF3aEtDaytQQldYRXEvRHdDTGFzMjJLMHBVSXNXUnNsbk1BYWZv?=
 =?utf-8?B?WTl3UlYvVzZCR0JuM2JtOFp0MmpuanMveVNVQk9rQjdLMFZXbHFtQ29hSTZ5?=
 =?utf-8?B?enZWdHMvRElZTDJzYWJOK2pCZy9adXRrVjZoMk15VGVxSE1Yb0VRWENJaXl6?=
 =?utf-8?B?bGFtUDFxM21zVVhiNXBzcU5qSk9xVDkzNFkzblg0dEh4U01UNWxYTSsxcXEx?=
 =?utf-8?B?VEwyaGJyeGdnRTdVaGVGRDcvaVFaNVNraHFvTTdISTB3ZE0vZEpJTkhOK253?=
 =?utf-8?B?bEFIQURXZzdPWWxzNTR3SzhkcTl2NTdJTmszaG9KY3ZnSlhQVlU5Q05DT2I2?=
 =?utf-8?B?cUNsbkdpUC9CK1RLcFJ4dHJuM0Q4YnBBNXZIZW9RQU1ieEpwYTJ0dzVROGV2?=
 =?utf-8?B?QXB1blhtZXdtWDdzbUl0ZEZPZ1pNc2lrS2NvOGJoNkhwMW1sc1d0bE1FNWFG?=
 =?utf-8?Q?ulH4CVRBeLN9HbIPWsl1zVeG6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8def9ca8-06e4-4c48-f343-08dd7b346575
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 09:11:52.8273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUlWsq6KkSHu8gUgokRM4R4+O1Ve0dq8Ep1XW/EmcFSDbVTywGgnCy9FljV0hmyl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8514
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

Am 14.04.25 um 10:24 schrieb Thomas Petazzoni:
> Hello Christoph,
>
> On Sun, 13 Apr 2025 22:55:02 -0700
> Christoph Hellwig <hch@infradead.org> wrote:
>
>> On Thu, Apr 10, 2025 at 04:53:17PM +0200, Bastien Curutchet wrote:
>>> Hi all,
>>>
>>> Many UIO users performing DMA from their UIO device need to access the
>>> DMA addresses of the allocated buffers. There are out-of-tree drivers
>>> that allow to do it but nothing in the mainline.  
>> In which case it does not matter at all for mainline.
> It is impressive how "out-of-tree" triggers kernel maintainers, and
> then end up not even reading what the patch series is all about (but I
> forgive you, because it triggers me in the same way).
>
> This patch series is NOT about adding new kernel APIs meant to be used
> by out-of-tree drivers, which of course would be bad, and we would have
> never proposed.
>
> What this patch series is about is to add new user-space interface to
> extend the existing UIO subsystem. What my colleague Bastien was
> mentioning about out-of-tree drivers is that there are a LOT of
> out-of-tree drivers extending UIO to allow user-space applications to
> do DMA, and our proposal is that considering how many people need that
> and implement ugly out-of-tree drivers to solve this issue, we suggest
> the mainline kernel should have a built in solution.
>
> Please re-read again, and realize that we are NOT adding new kernel
> APIs for out-of-tree drivers.
>
>> FYI the proper and safe way to do DMA from userspace is to use
>> vfio/iommufd.
> I am not sure how this can work in our use-case. We have a very simple
> set of IP blocks implemented in a FPGA, some of those IP blocks are
> able to perform DMA operations. The register of those IP blocks are
> mapped into a user-space application using the existing, accepted
> upstream, UIO subsystem. Some of those registers allow to program DMA
> transfers. So far, we can do all what we need, except program those DMA
> transfers. Lots of people are having the same issue, and zillions of
> ugly out-of-tree solutions flourish all over, and we're trying to see
> if we can constructively find a solution that would be acceptable
> upstream to resolve this use-case. Our platform is an old PowerPC with
> no IOMMU.

Maybe I should try to better explain the concern here. The question is "Where is the source code of your FPGA driver?".

I mean that you are trying to replace the out-of-tree solution is rather welcomed, but the out-of-tree solutions are out-of-tree because they don't fit with requirements to be added to the core Linux tree.

And one of those requirements is that you need to provide the source code of the userspace user of this interface, in this case here that is your FPGA driver. An MIT/X11 license is usually sufficient, GPL is of course seen as better and it must not be a toy application, but rather the real thing.

And that is what people usually don't want and that's why no in-tree solution exists for this.

Regards,
Christian.

>
> Note that the safety argument doesn't hold: UIO already allows to map
> registers into user-space applications, which can already program DMA
> transfers to arbitrary locations in memory. The safety comes from the
> fact that such UIO devices are associated with permissions that the
> system administrator controls, to decide which applications are safe
> enough to be granted access to those UIO devices. Therefore, providing
> access through UIO of the physical address of well-defined DMA buffers
> properly allocated through a sane API is not reducing the safety of
> anything compared to what UIO already allows today.
>
> Best regards,
>
> Thomas

