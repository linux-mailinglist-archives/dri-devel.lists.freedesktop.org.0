Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C37C8CEBBB
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 23:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CA610E0AE;
	Fri, 24 May 2024 21:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bFqBE3Jp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F05310E0A5;
 Fri, 24 May 2024 21:11:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNmNzp6grKbYm02zzVc7cQZgA+ZLlj7JS4Y9FWbC7QXkXRweJKWEffI98w239qPjngogdfKRuGwaZM2FsVjazWGG4BL9N0PAfh3okstIjUt5eeac6SKtj+uSqKWXTWRT4YFab5lw2QYvC8n9MNW5lIIPsBRAfO10ESiQzTRaTU24MjNNO6rLTFyOwatmvgmWZGSPX/4mdx6KTP4wYOZd3+03ELKEmfEunxXhWmVUIgVpDe5O1z45dRjvir2e5Hkhf+rorYR0cqaz6n9RD2BCzWfWbs/Llo3AQ//z/Ydm6bjhSiNLeA2p97PtDU4a/BwQKQB2s0D/2hEo5Z+dUpk5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/4b2W7OSYsCjJvuBFILY50HA0LBjSoxhVIuS9ClgEw=;
 b=Im/hVj8OUyFPtIAELSA+E8gt/CjlfZR5q/xQgZn8HDMzLPloy3+cREEP3RSXR3toE0FcNOxqGfQguey1iyAASv9WCmZNONPvvet8ZUrJy5Bo2NXj1pIipxvHjw8if6wauSRAm3gDVpJofWQNe/wfyeF5HTt43mQdt0Q+vSRSzN1os9ykeqJOPWpIpiI8wbEy1+04mlPlRg3ioovAPgMF3fWayr7QDVKccBAbjpqfF0TNmxIw2EbXM2/ZQtmejILmEzp/i/QQ6ToI7v0qz4E5KhJeXGb/6bxa+InsMHTqoXxg69umfeMMux1auxVCAuEwRYKz5IWnALmnOOQhQItVFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/4b2W7OSYsCjJvuBFILY50HA0LBjSoxhVIuS9ClgEw=;
 b=bFqBE3JpYb6ElpbVZJiN33QNVmCo1iGZSN0jCocEPcHT5BnDY9EOGG9X+8gLTYFYV6tMuUXr/HcJwHia7YnY0ELfRAKGVZ3zXfvIZK0OgLRhYrsJ5hB3pCB/42g/PUW6kv8QOrRELmW2BcEs/9D9MfSYE5Miha5JnBdJw0wueXNTYhNWxGIHxlqdIUNLUwXOS2XbNDFw4qgXXWF0x37Yp/Zb91g6QlW5JTSTpOtwLUif3hT6+lGPvMmoxZAjFK2EXonqVr5WjqGryZECKk+Yn1DbBZeFhHqrfZIFswqun0APJ/TiaaARHkC1BdV6ek9VmJAcq2XuiJXk/fdcO28qEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH7PR12MB5832.namprd12.prod.outlook.com (2603:10b6:510:1d7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.22; Fri, 24 May 2024 21:11:31 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 21:11:31 +0000
Message-ID: <bc930640-f7f3-4867-8622-189cf1e8cf26@nvidia.com>
Date: Fri, 24 May 2024 22:11:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Build failure and alleged fix for next-20240523
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, paulmck@kernel.org,
 sfr@canb.auug.org.au
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <287206c0-b53d-4aa1-b35c-0725adc5e9ef@paulmck-laptop>
 <28db820c-860d-be1c-bb94-ed534622fdc8@quicinc.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <28db820c-860d-be1c-bb94-ed534622fdc8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::27) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH7PR12MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 41bbea12-97b7-40de-b724-08dc7c36154f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|7416005|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0lMNUppU1VhWlBLRzMvNjdFeUR1N2RiL0RWQmE2d0RHbmNqTHpLY01rbjhi?=
 =?utf-8?B?Z1B5ZTRxQUNGZ0V0cTR5YlpIaUR1WTJ4Yit4ZDBzYzN5ZXdqdXpUSXZsb3dH?=
 =?utf-8?B?WXBSRDB5QlZkQnpYb3lYN1BOVzhhaGJJdzY5bUhNUFdvTm1uWG40V1RBektj?=
 =?utf-8?B?c0l0VWYvZVJTNHZZM2RlNzRtUVpyb1Azdnc0ckR2UHdubmZoMlpvRTg4b3VG?=
 =?utf-8?B?U0tpU1pxQnMzdWJudjFUYjJVcnlKcDNnNHovRWpYbjBtUExTdlRpRlRrUEpX?=
 =?utf-8?B?ckRHdDhaZitKM1pzdWdGczdxTVYwa3A4d0hKTnNablJtYmtneEhGQ2J4R25z?=
 =?utf-8?B?VHM2VDVnNGVHejRuMTZ5ZXU1MTRYTnBGTUZhVURHK3licksxS01YdkJnMURP?=
 =?utf-8?B?c2dMSjBpa1Q1bGdQNHVFL1lQS3BhQ2hKQkw0d2xJZUNEVzhZUGRLTk0zREIr?=
 =?utf-8?B?cTdUK090RU5ad1BudWo1ZGlpZkhYVWpPQTVIbFV5UVcrQlpvRUsvVHBLTm40?=
 =?utf-8?B?T3BWNDFWZGNXa1d1ZjJMaE01S05nTWwyYXhOWGkySk1wQU1URzNMVGc2Mzlh?=
 =?utf-8?B?eTlaaWlXYmg4S1NXdlVSV2dQM3I0dnZXZ254WmdQODRlLzJCZXI1MVRzb1ZU?=
 =?utf-8?B?cHRJcUlkK3pYZWIyTUVMeW15MGU1UXAvL0Q0Q3lRVk9TK25ZSnV5YzhMeURn?=
 =?utf-8?B?WTNwNE5nQnpmZHJaWjRmNjlPUzVPdmkxZFRuUkpESWRVZEhOcXRTQUJrWWlS?=
 =?utf-8?B?bzRScm5LYUNUc2NqV0lWVzBwWFJJcXI1WW5IbHlDL1UrdTNZTWJ4RlF2eGhq?=
 =?utf-8?B?RUNyaWx4RW4wZFU3Y3FMRmZNRDI2U2J3TnlzaU9JQzN4R0QzbGlLanNMN1Zl?=
 =?utf-8?B?TVdGWVhIUmV0ek1tMzBtaXIyT3NrOFZ4cEVDd1FoSHFHR1JUdWlhTHNiMnVk?=
 =?utf-8?B?bGd5aTEzZE1WTjBudzVZcTI0N2F4VXBqVGFaSEU4MTB6Rnl2NVl6NkFuTTNw?=
 =?utf-8?B?U3gzYUl2YUV0dDNNSTJJeS9jRUo1dVZWRUVuZEJyTC9WT1Y3TlVmM01JRGgr?=
 =?utf-8?B?Si9ORkNvT3M1elNBSVZrZDhNMkdDNGZuR2NWV09yZjdZemlyTW0xRFF3ZVlt?=
 =?utf-8?B?M1BtYXk3NlVPZ1ZrVHR1dnh2TWZpQ2NNZXkrdUtIdjc1NlFEQTNnTW5CRkxn?=
 =?utf-8?B?TjJsRXRGT244OWxvMWJXZHJKRGY1WmNOYTdLRWhKZmF1WmpmZ1REYmRZQnEy?=
 =?utf-8?B?YTJNY0NMT2VTUHpCdVp1Zmp2TnZpL0lnWDNUM01uQlZheElvT0c5am01N1ZZ?=
 =?utf-8?B?Kys1MUNCei9FZ2MrQkE3cUdLUUJ1SEg1S2ZDc2MzcEVCT3Awakp2VEdLTWQ0?=
 =?utf-8?B?eTNVOC9Fd0lPQmVzQXdGUjBJRGhQNWFpZ0RXajd0WS84bmo1N2dEQWNkUzZq?=
 =?utf-8?B?QzlIZEk4WkhpTllGNVkwc3lEaURCVVZxOXJGaW1lU1dNa1cvczVNT3IreWNY?=
 =?utf-8?B?eEtiZTd3YkJuQ0hTWGJ4dUpKR3dGT295UitKbGdBUlQ2cTVkNS9CWnUwSlRu?=
 =?utf-8?B?bEhSRGliRm1DVlFDeElWbXhPWng1YkxGR1J4NXJmOHBid2VpKzUvYXcxOFFu?=
 =?utf-8?B?WlhUL2NVZmdZMk1jL1I4enVpd1l2T016ajJxYVM4Y3pZYS9ERXRFVWtFV3pE?=
 =?utf-8?B?MW1CLzNJY25CeTNxL1ZXYUVGS2hPRWNIMGNYejlvQjlvNnJoa2YvU1Z3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkcrdG8xUEFwaDArcnlBaVI1NUYrTC91SjgwcmlhbUVSZG16TE92Ym9PVzl0?=
 =?utf-8?B?c1g3VGg0MklyMDNTNHA5SVpUeEdNbXIwTERQZGxoaUtTd0Jid29xTm5CY3hB?=
 =?utf-8?B?MlBKamFKRUhVWnRvdExLam1uOVNZZTllR005cEFyM3dWM3BJSURJV0I0VkM0?=
 =?utf-8?B?TnVBN1pUVXNPczB2UTlYU2NMVndnY2pNN2VPQlFvTjB4ckhEbU9OVVEveTJp?=
 =?utf-8?B?YmxLMERSazVraG9zY2RuUVNwb2ZTY3NTdmhKVjU3eHdJbXNWN3k2dFlEWnFU?=
 =?utf-8?B?bmt5RDcrUzRBWW01dmQrMENPN0RneDU5aXFzN1k0T2NzR2ZBSjNHRDMrcytO?=
 =?utf-8?B?UnlxS1JWSEo4SFFRa0hoSkJlRFNnNHBMdk1qU0labVo2RGRFY3ZrZk9VSmxS?=
 =?utf-8?B?YlkyV1JrbzhaVEltWFBWQVRNRjRVRUw0TExMdXBDcnJCdmJZWkNHRkRZWUJT?=
 =?utf-8?B?TCt0QThoSW9KSElWM243T0xNVGR5UXJHc1UweUcrRHA0dlkwVFpDNFpCTW9U?=
 =?utf-8?B?aEtlRTNMc3F0NTR5bjR2L2tsTVVtcVVXa3BpV29oRWF0WEhINkUyVng4UFJT?=
 =?utf-8?B?cjhzdkMwOGYxNXlWVVI0blI1d0duNzkzL21ocUlCcWlHUkxBbGxyWWZnbjls?=
 =?utf-8?B?TGNEbDJrdEtYNFJqbHJrTkxmVXB1MjBRQjY3Ukh1NzJTczBpOGl0Umc2S2JK?=
 =?utf-8?B?OE5SWm5jMnA5RThZdU1tRlpCZEZzTGxXVTlmNG9hQWJkSkRmd2c4alZkQ050?=
 =?utf-8?B?QU1SRTdmYlIxc2E2dmpzUlg0Z0c0cHFlQnZrelhSa2lNRmgxaWJscEl3aWwr?=
 =?utf-8?B?TldVOER1Wmx1TENGZ1VsTlJnYlVqbnR6VzNNN1NjSkJzR1FUWE1QeWVVSll3?=
 =?utf-8?B?VVd3R01OYkp0blJFbDgxZEN4ZWhEVTFyVTZ5Q250VmV5cTdTejJNNXhDSnlz?=
 =?utf-8?B?cDlPVUJ5VjQ2RjFEdkNXU2FKeVhuU2RsSUlNS3BuaitiSlBsV2JLYzk5eGJN?=
 =?utf-8?B?dEJ5T0UwMGN0ZFRweVpvaG8xbjQrZ04yalB5ZHJ3Zm9XSGI3TzhIRERiM2E3?=
 =?utf-8?B?T1U5UktYcGwrdzgrbGpBQUlvYTRLeU0rSXlHdE5KZnFwcDlxWGFxUUNjMkJZ?=
 =?utf-8?B?cnF4d0xrZFNtckppT2dtZDNLNmZ4Q0xPcklTR1cxUzJHaklZcUxWcEJIUGU5?=
 =?utf-8?B?YTMvbEVGMUhOb3lwWmx3SDJSdnZRYVpmMzYyMU44Q2Z1c2RHVFZhdWJIeHh3?=
 =?utf-8?B?dnNXS3dCUlhKRUxOWjhaWVhaV0RxTlArcnY1R3V1VVlsRzVhQzMvb0gvVFc2?=
 =?utf-8?B?bE1HUmRMaEhZMkU1MUQ2ZTBCVndvRDlxM1d4ZDhobE42dkN4U1p5Y0MxdW9R?=
 =?utf-8?B?NkM3d3FSRmRoWDZQMkhaY2tBSCs4aENIbHpqWENoNVlDbmRLVStyS3hqUVJu?=
 =?utf-8?B?eTB6ZEowY21LTDhXUGhjOTVYOFB2SXFpNWNFN05WV2NaVWROUDdpV2Q5aEdH?=
 =?utf-8?B?Qm42YUwrZSs2b3dDUE1WSHR0MEs3V1oxTGdPSnRHVFhkaVp4QVcvajVld1Ez?=
 =?utf-8?B?cTJoZXVORXBncmdBcExUMENpcVhsdHFGN1g4Nyt0SE9EVzc2MXhUa1JaYnVn?=
 =?utf-8?B?NTZQYm9QbWVFS2d1RStFMGgwUnphQS9Idnh0ZmNMWkxEZlJGSmM5OFM1NHE5?=
 =?utf-8?B?dkZTRmFFbkwxNm02dzNWbFp6SklVZi9PekNqZDhXSTJ6Y3orM3Z5TDNISWVu?=
 =?utf-8?B?VFIzRE9RcjVuSThMdUFSVVV4OFc5TkVQcWJtVnZ2dDJjd1FDYVBOMy8wZlFW?=
 =?utf-8?B?azg5b2tMYmx1b0w0NDd3S094N1o4S1laMkdRREh0NHlnZTluNUlOcVI3ODcx?=
 =?utf-8?B?VStzZzNhYWxPcTJUNUtyOFpRblJpb2FMbnJoU3Y2NkcwNGpkR2pKc28zajI4?=
 =?utf-8?B?S1ZZZzlOV3R3Y0FBYjlibytrQU9ETS9JQldSc3VuMFltRWc4THk1L1lOZ3dR?=
 =?utf-8?B?bEhLeklwdk5lc2IyZERBQ1l3OUJJeWp1Tjh6UWlpUVI0K0t6TGdmNGVMRk9h?=
 =?utf-8?B?aGxjdXFUdGdIYWxrYWxmS01Dek9MMzNpWnEwZE1TcWtOK1lUVUxHd0xzdHd5?=
 =?utf-8?B?a0U0M0lUSWRRRE9SNUl3b0JnWkNvajI0a2V1bXAzMHVyUDhxYmhIYmlGNytX?=
 =?utf-8?Q?HsS5JUZdtgXnFhcBx8lFb9Ph2pEhTj2DXvbdLehKPOpJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bbea12-97b7-40de-b724-08dc7c36154f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 21:11:31.0627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoO+2vCaHU7vm8OYWXVV2HZAOlrxufdOADuMc3V4hUj/i6PXFanPa5J1wJZE+u+sWqUXaBcCQM2Mxs0ztVTOzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5832
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


On 24/05/2024 20:57, Abhinav Kumar wrote:
> Hello
> 
> On 5/24/2024 12:55 PM, Paul E. McKenney wrote:
>> Hello!
>>
>> I get the following allmodconfig build error on x86 in next-20240523:
>>
>> Traceback (most recent call last):
>>    File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in 
>> <module>
>>      main()
>>    File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
>>      parser.add_argument('--validate', 
>> action=argparse.BooleanOptionalAction)
>> AttributeError: module 'argparse' has no attribute 
>> 'BooleanOptionalAction'
>>
>> The following patch allows the build to complete successfully:
>>
>> https://patchwork.kernel.org/project/dri-devel/patch/20240508091751.336654-1-jonathanh@nvidia.com/#25842751
>>
>> As to whether this is a proper fix, I must defer to the DRM folks on CC.
>>
>>                             Thanx, Paul
>>
> 
> Thanks for the report.
> 
> I have raised a merge request for 
> https://patchwork.freedesktop.org/patch/593057/ to make it available for 
> the next fixes release for msm.


This is also now in the mainline and so would be great to get this into 
both -next and mainline.

Jon

-- 
nvpublic
