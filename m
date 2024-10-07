Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6398E995072
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A2910E54B;
	Tue,  8 Oct 2024 13:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b6i7J+0D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391D710E08C;
 Mon,  7 Oct 2024 12:35:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUiPq+X5A+Gpf2QvA/O/vML9JZrsxThNhBVdWIfsHzUI9zbiDaV28P4Wro1h4LV7tYkvpbB6xpxlJv3sXYFBb9FCPoh3yTIazn5IOd5n8GwJVPKOHCjwgEDF9JziE7DVSLHIZZaqY+p2G4jCNPJ9IKE8HV9DpVGukUlBlTrkDvh2WwkFPXkZDHXPPeU8CEAJ+jBby0fJ1M8KAZlNhJBcZU/xuR4fnjTWZeRNFjQIAXLzhdfpMmf6j8QXiDwdZzD8YNJzKxlHBPaqFemIzgj8V7UnGsQIiAYW+1o0LXxtqWl4HYPJXXPXC1h0jARhA2Ne8NR9Q+LQO6ifyKNgP/cMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ3I7RT0w0HD4K2i8CWFYrq4tuSMc+0oJLjIHqUiFug=;
 b=UBEVFNS4vhIUA7VN4xPmKS1D5WqtHy+yxlX7X97X8HjBWiOwZDj5iSycc8xRtTdo3uNJyfX1TBfxRr3aScNruSV3c6okoIko8DQO2WdLG/4ovr3PY7fkgLWztI/v8IlB8IlPJ22v1sKBvtimdJr1Zbh0p2Fy/ezFtqd3qaSde5FEqzN1C72Us7PRHDHkE3FO3NOOwn3UDSzqQH07w+2vLBURKB5kk01qTn/2JJAUm5QrJh9BSioU4N4CEkLtMHl478XFoE51CrI+AEjj+iylNkMDkCX+HJsWb8wFVTYUYfMZw8rSztMdVOemzf6xwU4u7K21b1RVDy6j0ffFB39W6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ3I7RT0w0HD4K2i8CWFYrq4tuSMc+0oJLjIHqUiFug=;
 b=b6i7J+0D3KCjhHusj3Dgv2dSUyluaKW7QgWoLc61N39Q4VyGbUJVtRRZkKEPX7rOBbL2k9a+bHX6gVtypfLfsxuAkPmZq7MYtdKiI9NN9arOY2FNbd54N90nuXE3tevYTbyTiSrJx01LPz5AxKctPw0zjHZMG/vzkyD6AxGQwYXQq10YfGn+ndBKJCRRiSDN+ELc55j3KSY86SZU2Oc95VJqbGdhn3efXEiMnsaDeHOiaIiYvXIC3mIJ7nE4DF54Hb2FDhBr8+443inxdWkkG8kdYMLAPSMc4pkSzaJCoqwx+4reI9N+Pg2NKybPdwbOinZpHbD/99ephq+vg6raEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 by DS0PR12MB7632.namprd12.prod.outlook.com (2603:10b6:8:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 12:35:16 +0000
Received: from BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938]) by BL1PR12MB5851.namprd12.prod.outlook.com
 ([fe80::d4a:9ce3:c92e:e938%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 12:35:16 +0000
Message-ID: <c427098a-7939-4a00-b728-0e2da02d7424@nvidia.com>
Date: Mon, 7 Oct 2024 15:35:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nouveau/dmem: Fix privileged error in copy engine
 channel
To: Danilo Krummrich <dakr@kernel.org>
References: <20240923135449.356244-1-Ymaman@Nvidia.com>
 <20240923135449.356244-2-Ymaman@Nvidia.com> <ZvqHA76iSOYJexSh@pollux>
Content-Language: en-US
Cc: nouveau@lists.freedesktop.org, Gal Shalom <GalShalom@nvidia.com>,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Yonatan Maman <ymaman@nvidia.com>
In-Reply-To: <ZvqHA76iSOYJexSh@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To BL1PR12MB5851.namprd12.prod.outlook.com
 (2603:10b6:208:396::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5851:EE_|DS0PR12MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d00cec3-7a03-450f-93e4-08dce6cc7eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXR4M1hoZTdvanM2TXJPa0UzWE5yTGdRQmkzbkdGanNVMTM5NTdZZ0Y5SXRI?=
 =?utf-8?B?Zjh6NEVxTGMxNmZzZFNiZUVQazNFRFlYUnY4MWJRTi9BZ2cyQ3NNb1Ntc1A4?=
 =?utf-8?B?ZS84OEdVQ2NUOXQ0ZEhsWnVSREh3dmRCZGx2VlpVZlpSMkxDYVZEUk5sN0w2?=
 =?utf-8?B?SVc3cldDdURhZVlHWWg5Uk44ZnNyUWZ6K3UzYWRMaDFoRm5RUW1TOHc1eVlP?=
 =?utf-8?B?Ui8zQ1hkMmtISUIyVkJtaExRbEF0ZTBVRFlFOEVJc29qcm9MQU9VekNJNkpE?=
 =?utf-8?B?QURKRHY0OXlCTkdrU1VyWDNXZWN5OTVrRWZYQ1g2emZsZXl5TEhhNytYWVFy?=
 =?utf-8?B?N1E5SjY2Q3VoMTMvcmduNGpnL2s0Zlo3TGdnT2FCaFUyZE1IWnhFTFNNK1lh?=
 =?utf-8?B?RGlxQ3cvTU1xQ1ZvWHg1dERQbTFwaitXK0JaZklNZ2gwaW5GUXJOZXJ1MTFW?=
 =?utf-8?B?dzVTR2l3MngxR1h1VEQxQ00vVkl4OXVhamJ4eWU2T0FjYTF3bEEzbEJsZjY4?=
 =?utf-8?B?cUJGMWtwM2tGa1o1MTN6MittTlowaUxXZmU2ZVA5Q2Z0RmVtNVRwS05xWlUr?=
 =?utf-8?B?bjR5Rm1INElUZDVGYmYvQ1pIVXB4Z0lVaHY4MHRRTTRnelVNSE8vV3pQakhr?=
 =?utf-8?B?cVRnREZwU2FDcGFGaWNwNXBwZXpBZ2pUdHlHMmtJMzlydElhUGRSY255Z29w?=
 =?utf-8?B?MWFhVFBJRWFGS2lTYmI4ZDZEWjQ4UFQxL0dveFVlK3NzWEUxREZuM1ZvQ0pX?=
 =?utf-8?B?cHRzbFNjdHJrbU1sM0hqdU9MZDl4STJjYXNTMjl4THo2SEE4NVg4eG9SQnBO?=
 =?utf-8?B?RVc2NVdDNldFbzZuekp2c3phWjVMcXQxZGtDYTVEaHlRaHRKd3VzUlNSL2wr?=
 =?utf-8?B?S1dxL2FHYWJuYmJ2eFdoY1IvZTM4OFVXbzNhSXoyMVgxR05pVUNzbktrZjZB?=
 =?utf-8?B?N1VUM1lnSDh1OEgwTHltTXlhZUU1dlBzQjBBdWpPbHpKU0VxczNlRnNZM2RU?=
 =?utf-8?B?SHI2V09tbjZxUlgwUTYwdUxGMlVjK2RybWE4UTZ4ZEJEK1ZSdjVVWDRVcWZL?=
 =?utf-8?B?SFIzSFh4TVlBZ01aRXB4Y2draEZCOXYwZFZLbFFpK1ZLcWxrci8zbFhJNVUw?=
 =?utf-8?B?SlVqWTNrU3RTeWpUWmUwVzZCeGVWOXJCZG9xTWJZaXNMYUN1K3o2ZEFtbE94?=
 =?utf-8?B?SVB4U1E2UFNzV2s5VnN4TjVSMjZ4U1NFSGh6UVJxdHFJdkVtV0d4MDBSeEZW?=
 =?utf-8?B?UUxBbTFFcnNOdlJaUXZwNy9CemJyL0gzbnh4SUJnWmFOc3hqazFUS1lodW9h?=
 =?utf-8?B?VWhmTnVVcHVlV1A3S3dQYXB4MGtlV0xUWVhrWkZoZE5lMzY0ZjhNemdWNE5W?=
 =?utf-8?B?NXFhQ2ZLelcyN3lIbVEvdGNUWURreDhvS0hDUHo3Ui96SzhGVzdobWxCNnR1?=
 =?utf-8?B?QjliQmhZUXVtd294QVd3amtSZzhLRWw1Q2NvRmJQbllTYjN3NUplaUlTeHhT?=
 =?utf-8?B?V3ZPT0xrbGIwa0gyWndtQWV0VzM4cmgrRUtWbXBxSGhXamVFNHVlc3NDenhr?=
 =?utf-8?B?RHhrWXFueElZY0tOaFFMTlU5eXVpTVhYTFB6S0pna29IOGNsME4rQkV6S056?=
 =?utf-8?B?NmxtaVdxSWJVZXdkRUc5Q3JGZkd6ZFY2MXFHbDAzUUtLNzZvaCtveXhYR1Yz?=
 =?utf-8?B?Q2hsOGlPVTd3bkZoSlU5OWZ3bXowOWwyVUtxTTBhWkhjNzA1NEl5THZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5851.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q21oMUE0NVJtb3lZQnR3aU56ODZlUEowRUY4NE9WNzZvMkJOaGZaVmNmUFRF?=
 =?utf-8?B?ais1ZkFDS3NtSWF3T0liYUppdXVQZXlaMWwwbzFYVjBuWVptb3lFYXA4TC96?=
 =?utf-8?B?dTZaeWo0Mlo0bnFIL2pLczBlOGRaTlJCNVJLMzdZVFNCS25jWEFLdktadGNN?=
 =?utf-8?B?US8walB2S0JMYU5zNVQ5bDZaUzZlcG92TDlDZXMzUkdMSjU0Zk91MTFUZWln?=
 =?utf-8?B?RUxjaUtaSjhLcGJQZDBKdkhqcjAreW85VGxDRmVLNEhiL3kycXpaS1I1V3Yv?=
 =?utf-8?B?YzFreDljVTVtdFdkVGNzdjIwU3FiZjhDOVE4aFNwZ1BiZHBqTkxUdUtKYlRG?=
 =?utf-8?B?VmN3YzVOaUxzTTFFQXI2RlVjMElIUCtJYzlodkZTWW5ac21tSzdITDV2U1Ns?=
 =?utf-8?B?OXc1T2hadGxWTXZuWnFrcjhoSUpmQ0VFMEMwYWVuRXpJU0k0bEt3emlDblVI?=
 =?utf-8?B?ZEV6RU1kRmF4RXRIYnZaQTI0KzdEWHZtdVpDak1uQkVndVNlRnRKRlB3NGNo?=
 =?utf-8?B?bUsrOXBCakVYeTFNdm9yTWxSMW1KT2Zhd0d6RDJVTklid1lRbGlSUG5pcTdv?=
 =?utf-8?B?N1FobUxPMkNReHR6MmdiRy9KanFNT0VsTzJCMWFKU1RWQTZIbWRHNGdHRjcw?=
 =?utf-8?B?ekpXZ0JZRitjUEVhOWkwMHRLUEVtYmxiNk4xNGptYTBseGtndklWcjgxYVBC?=
 =?utf-8?B?QVBJWE1EekZPaU5Cc3Y5NWZUczBsSnhKVVI0RkdORFpPVUhhNXFPUEdnQ21z?=
 =?utf-8?B?K0p4SVdKcStlVkZNQU50SkNHOE8rWGZ6a21JNXdXeXhXalpqNmIzMDFINGVF?=
 =?utf-8?B?Q01EbTBoa3VmSXp5QnJEVWpzNXZlM3U1UHJOZGw0V2hMSFE0alVWdDlWT01G?=
 =?utf-8?B?WlBMZWUvRjY4YUNDSWMxQlJuWlJ4dFRZQ21FVmxQMTBORzRtVlpSTzVBa1VB?=
 =?utf-8?B?Tk9KNDJ1MHYyemJLQThMaTRpV1IyOXB0TjRPSE5nNjdlQ3VObllZV0tPSW5M?=
 =?utf-8?B?bGlaMFgxZ3JTUkRiZTZDcUxFWS9Pc0NhdnNac3FUTExta2grZ0JUaGM1bkg3?=
 =?utf-8?B?emgzZHhwUitjNTNOSFdkL1BhV2U5MFpJMUU0S1J5Slh6NndwYzZEQlFoYXcz?=
 =?utf-8?B?dE1UUUNlUThvWVE4SnlmN1doTFUrTTJQalo0azNqTWxvcDVrRnFPamxEQ2h4?=
 =?utf-8?B?cEZRZTNMYmFyamkxUGk2MGJmbGdVcU5ucjJGMjhyOU42QWtzMHpHS21FOHU5?=
 =?utf-8?B?dElwQTV2aWxNQ3dGZGQvbWxtNmY5WVZUeFZaR1lQeXY5WkNvMzhsWi8rMlc2?=
 =?utf-8?B?VnRGOFl3L2xIamJzZm8vZjJLZTlNejkxY0xGcjRrckVHVWxEMFYrQmdMRWk4?=
 =?utf-8?B?NkZWRFFNcWlJR3lqZ1NyenNRamVweW5oQ1RYQTZMSUNkVmRYcVVyVHUycEp4?=
 =?utf-8?B?NlRlU0lybSs1ckJLdk1Dc1NNVUZnajRyVGFLTStoUnZMWFJybU1DVG1VL0Np?=
 =?utf-8?B?bnNFM0pPQThZWUdna3loOXBSajhpRk1kL1Bnakx6QndTNEFZTTZJQS82bVlZ?=
 =?utf-8?B?bkJGOHQzb1dFRFQ5Tmw0MjNHWlp1RUZrKzJSSXo0c0oxZHg1QnNWWDNEQXJp?=
 =?utf-8?B?VFFOMUUzYUYwSHlCSjhQc0J0VURTSTVURUM5amc0RDU5cE41enBOVFJ3d2tv?=
 =?utf-8?B?NytueTVPdmYvVDBXMVZzbzFKQTFEWDRwNWVNS1hmTUNCb0dnUlBNK2lLenVB?=
 =?utf-8?B?QUdZT05KOHMxUDduRG5NdGFmQ1E0cmFxUlRVckFvM0R3MEdJVVRjT052OC8z?=
 =?utf-8?B?VWoybW56dUFPSVRvcFRuN2N1Uzk0WWcwT3RaVHRGT2x4Q3ZTbkw2MVQ5VHo3?=
 =?utf-8?B?QUFoOG1ydnVZVlkyYUNKbkszL1dqbkxYT3dGMUVHODg3TGE4b0hSbGNrb05v?=
 =?utf-8?B?c2pwTlpiYXIyVmhQOHdHMXRKQktsdUJlSGxqQitqU2lWOWo1ck5TSmFYVXZk?=
 =?utf-8?B?ZEhxVllSaG1yVHNiRnlNY2xNVHI1RGxJbUpCa1JPN1RxbXdWMzFPNmN1Rjl6?=
 =?utf-8?B?RFRrUWtVa0dGZE11QkszdzZtVkh6NVRlajRXaW1saUVqMnlod2NNbFFDanZa?=
 =?utf-8?Q?Huyuq94Wb1UJtqrHfAh7Gcmbc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d00cec3-7a03-450f-93e4-08dce6cc7eed
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5851.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 12:35:16.0276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3ecJIIlzkDZQeUtICRgwDiCtt81xjR7G2FzjhD1t3QLOJbWyG8T6mHVLZP6MCP3MUvrRAIJ7wkEHcOuaRcAUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7632
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



On 30/09/2024 14:09, Danilo Krummrich wrote:
> External email: Use caution opening links or attachments
> 
> 
> Hi Yonatan,
> 
> On Mon, Sep 23, 2024 at 01:54:56PM +0000, Yonatan Maman wrote:
>> When `nouveau_dmem_copy_one` is called, the following error occurs:
>>
>> [272146.675156] nouveau 0000:06:00.0: fifo: PBDMA9: 00000004 [HCE_PRIV]
>> ch 1 00000300 00003386
>>
>> This indicates that a copy push command triggered a Host Copy Engine
>> Privileged error on channel 1 (Copy Engine channel). To address this
>> issue, modify the Copy Engine channel to allow privileged push commands
>>
>> Fixes: 6de125383a5cc
>> Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
>> Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
> 
> Please read [1] and use scripts/checkpatch.pl and scripts/get_maintainer.pl
> before sending patches.
> 
> In particular, the 'Fixes' tag has a defined format, I recommend:
> 
> ```
> [core]
>          abbrev = 12
> [pretty]
>          fixes = Fixes: %h (\"%s\")
> ```
> 
> in your `.gitconfig`.
> 
> Also make sure so use 'Co-developed-by' if there is a co-author; I see that this
> patch is also signed off by Gal Shalom.
> 
> Please also send the patches to all relevant mailing lists and maintainers to
> avoid your patches not getting the required attention.
> 
> [1] https://docs.kernel.org/process/submitting-patches.html

Thanks for the feedback! I will address these comments and send V2 
patch-set.

> 
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> index a58c31089613..0a75ce4c5021 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -356,7 +356,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
>>                return;
>>        }
>>
>> -     ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
>> +     ret = nouveau_channel_new(drm, device, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
>>        if (ret)
>>                NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
>>   }
>> --
>> 2.34.1
>>

