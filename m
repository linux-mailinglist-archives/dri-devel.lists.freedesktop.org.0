Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE69A03F4D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 13:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A252110E6E0;
	Tue,  7 Jan 2025 12:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KPeBzaUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A0010E6D9;
 Tue,  7 Jan 2025 12:35:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnPnQVFxX633v2wbc7ISsE/9skGPJwPXPQ/0E4Ij/BS3m6y4iXvTRl3+ixmlTNISJbe3/FH08DBNm4CUWyqY/zV8eqsCuNDCzWOaEt2RxpBNZ8I58ZWBykeNDGZXpCNvNIq0mSE1ikhSt13am87FIQPIH9kjq2fDft8NwbSSkxxL4YwbAV5XEQJENkuRF6qaVmyeQL5zX9eGIhYYNYmw9yS4eNq7YT6xD0moSLhxeI/HMsCamJy5Sz3+FM83goyhtjbU7/qPyC7v6mgIzI5bxWqTmx+LLYLwQUMzV/FIPRRl5qaRgYzFSTjxCyay3qadOLyHZTh6MSNxeYiahNr3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcWCFd7igeZpvkvBhfcLnI0f2WQRJicgYDsa3j2GZHc=;
 b=ycYNYUYljo7BbCn2k9TUwX5SD8ROLUI1TLDcrk8wgGQSDcu9E2EXByqE0NOQZrBtS2/EtnJm5oU5Re9mZvyYpe7mjmqFYR8FpLWXrvU85LjuPulg1HPNjgtxKQhkEVXmp29mPgd9EeJZQSCn3ljf5ABylEnQlcqzp2lARx26Y5b+zdlfVGQuDSvLc4TUugc5Lsrmfr4bjXzJHwWtfhIB4tG0V36DdMU3pKjPwaMxF4A2D4mNm7NUnC0eFbEynftyDb5018X9joxeU8DT1Mnyw2WdSpgAhztWHCdhzwHHTqmOS/AlZLJiHHcFLEgh6UTWUnbM2v5IMFm3r2zVz1V2bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcWCFd7igeZpvkvBhfcLnI0f2WQRJicgYDsa3j2GZHc=;
 b=KPeBzaUCT96XQX/gzAO8ygctK0nCe/GkN40rH1WR9Wn6K5oM/lh1qk2lsO9cVjubEto/n7rxxdD+U0QnY0J/M/hnNM4VtfKzk1MlJw3Y6haAnymtWKJwL62AfcyormwcQYn7vos3AqTRQ9+C3Fh8wRoZvcRLni7bxV8aI8VyuWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 12:35:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Tue, 7 Jan 2025
 12:35:01 +0000
Message-ID: <8564f261-45f4-4443-bc7d-9474ec27eb57@amd.com>
Date: Tue, 7 Jan 2025 13:34:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Enable runtime modification of gpu_recovery
 parameter with validation
To: Shuai Xue <xueshuai@linux.alibaba.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Ma, Le" <Le.Ma@amd.com>, "hamza.mahfooz@amd.com" <hamza.mahfooz@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "Jun.Ma2@amd.com" <Jun.Ma2@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tianruidong@linux.alibaba.com" <tianruidong@linux.alibaba.com>
References: <20241228063245.61874-1-xueshuai@linux.alibaba.com>
 <563b1797-5524-44c5-89b0-754f245e6b8f@amd.com>
 <63938ba2-dcb5-456f-bf82-bd8c893549c0@linux.alibaba.com>
 <PH7PR12MB5685C307737F826039EEE48583152@PH7PR12MB5685.namprd12.prod.outlook.com>
 <dbaaac26-9df2-49c2-8591-7ceb7b8f5e40@linux.alibaba.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <dbaaac26-9df2-49c2-8591-7ceb7b8f5e40@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e03c9b-84b1-4eb7-01dc-08dd2f17b45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDlURWltNDVGT0ZMSHFuV1Q3NFlMWXI3TmpFa0l1ck02c3ZvRlI5M1J2aXlZ?=
 =?utf-8?B?azdOZUwwbjlpMk9BdmUxVk82SVBobW5lSXI4ZC93QlREUWpkRnZVREp6TVpO?=
 =?utf-8?B?UEltU3hDN1JWcjF6Z3l6eVo3Q0tYRll3aG9XUjNyS2d0Y01YeVBxZHNibWhV?=
 =?utf-8?B?UHlqWHVZQkFiY3JLK2NFOWNLRFRreVVBUEpyeUx6QWFPY2V0NUE2RWlHMU8y?=
 =?utf-8?B?M2tBbzE3TFhtckVWNDRDWkZac21ZNHJJRU1FMjhORjJ1SHRJK2ljdWFlMndE?=
 =?utf-8?B?akFvSlZBdG5oSGFTOTA5YVpVaHByNXVRSnFHcjlpYmZiNXJJaDZXU1U5MG1L?=
 =?utf-8?B?MWZUSUxtRFdva3VGRXVHV3RBbzVqOEJpdjZMYXQvNHFITVBZTk1ranRmZ2hI?=
 =?utf-8?B?TVlHSjNTUklxcFNwZ1Q5My9LQXdCNFYrNURNUGo4eWZMWVEvb2FybGhjVnMx?=
 =?utf-8?B?eXpUV2gvS0llKzVaeEY2dVZZV1ViQlB1YzQ1YjJQQmxKZ3dUQ29qL1ozNUxn?=
 =?utf-8?B?K0E2S1h1QmlQM3VocCt0NkFYOEFaRVpFSndBRjNBcHZrUnlVRThZZjBWUmNx?=
 =?utf-8?B?NmtLQWwrYVR6d0xrcTZmMm5UTUZRYUcrbWlaSTNoaUVUbytXT1NRWHplcGJy?=
 =?utf-8?B?VW5iaW90aUNaNGQwaVVnL3M5cUduS1RxeVI0SzdTUTNwanFDaDFhTXBCWEtC?=
 =?utf-8?B?eFpKRVkyYzYva3FBa1F4QVlsYmNBZlNObEpDN1A1RzEzOVE1d1ZUTHpDK2V4?=
 =?utf-8?B?aU51d1V4MW9McGsxQ1lQZU55NStGemhTWE1ZbldBTGJxczFYQktmckR3VWRk?=
 =?utf-8?B?SGF2dk4xT08vOGQ1ZllCK0Q5THZLUjFDeW53MDV6ZkVBbTlpcE5tdFQzYTZS?=
 =?utf-8?B?eGdVc1BPUk0rNEpKbWtBTEVYWDdhS1pqZ0JsTXQremNPdlJ5NnV6STNLZkNs?=
 =?utf-8?B?Mk0wL2lIdWlTbEFiV1E5d0VZM2ZJUzg4Qlg5QnZYTGRrQUlxeFkrQnFSYnBL?=
 =?utf-8?B?aHVYMlhtS1ZBSXFtZkV1L0JjV2NqbUh6bDNxMk5wS3N3MHRtelJEWjVRNVZR?=
 =?utf-8?B?Znc1S090M3pkWUpwbFF6L2lPUnJIZHg2aUpUd2IzYjlxR05RMjNCckx4Y1Jq?=
 =?utf-8?B?VkE5ZFYycDhlL3Y5TmYxdTB1MEl5SGhURHhqRmQxbXlNUkQrNHU0aHo1Tnpy?=
 =?utf-8?B?MGk1ZUVrUmpLOGFobVBNb0Q2OFlycnBWd1YzeExlUEJqRTlRdGNNRUlJbnFX?=
 =?utf-8?B?dm9rWFBqQ1JNQzlyMUFBYlRRWDQyVDN1WHowWjROb01reE1XUmV4am51aE9y?=
 =?utf-8?B?NzdoNTJzMnFLYXd2cHFvMXZueHlkWDNRa05KK1ZQR1FTSUVUOTcvb2pMVFlF?=
 =?utf-8?B?OE1aTTB0eW1BUFhScHgyWXMzWjFLNUpXd1F0QTUybG1mZEo2aGw0U08vTURn?=
 =?utf-8?B?V3RQV3o5S2F0VUtnb3hlTmhRaTJGcmJIeEI0bFZMT2pMRHozeDN4YXJBeXlP?=
 =?utf-8?B?KzArMzFENmgzc3F1aXhJdi90L3pvVVpRRVAxelFOdFE1MGMwdExmRk5ycDRY?=
 =?utf-8?B?Ty8vUWJPQ2pBNGpPOVkyd2tQUjUyeHd1c1FxbXlqcERuVkpCVFUzOHorYVQz?=
 =?utf-8?B?eG9oZXFJZlNRTDVuUFNtVUJqMmdOWUEwQTNiOE56QlNlb0JyQXM2WlVWaWd5?=
 =?utf-8?B?THFjUmZmRmFEQmpIcmtJMkxoZ0ZZbHlIS1RyenRIQk51aDlmems0OVJ3VFo2?=
 =?utf-8?B?TGFUSXdFd3RiMEl6UUVhVFFUZmlTOFBUVU1GLzR6Z0t5WnQxRGFuZ1lGbUE1?=
 =?utf-8?B?cmdHVjFJbDl6Zmd0a1pNd2FMTnhzSnlrUytaNTNxaGRRNEtzc3VzbVBQMzNq?=
 =?utf-8?B?V2NqV3dKNmVQRm9yZXRQWGJSUTl4eEJXeUxIcDhqcFQ0dXNpZTl2eit6UVBS?=
 =?utf-8?Q?iyHqhRNGdse10T2TSSRGLkCuL811Tm/C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmpkTGhDbW5hSkV2OElaR2hkQ1VpeTA3bDJ4TUJFdDVyZ0MwdHdxS3lPZ2tZ?=
 =?utf-8?B?c3ZxNGk5ZmlkNllxMXZRbWwxUDR5OWYrSTUwb1JHK1poaFhoZDlmNVhDMUZ6?=
 =?utf-8?B?NkZYYnpnbmo1enZyUlZoSVF2U2xFcktlYmNaMW4zbjIzT21Md01aYWd1K1Ez?=
 =?utf-8?B?QmhOQlM2d3dtVW5IUnArZ1o4czVYT1lKMmdOcGU5UUZMWDRLbWtmcTcrUnpP?=
 =?utf-8?B?dktxOWNGakoza09QUU1YTTZpdHIxNG1xK05aS0xqU0tsSjlUMnVkeXFLVmdj?=
 =?utf-8?B?WkVOdmN5RE9sY3JFQml0aEJRWTJTa2h2L0N5aTNmbnhqZWV2UUNLdEgwazBU?=
 =?utf-8?B?bER1elovS241aStoQXpSR3FLcHBGazYwcmFCOWk2VVJnajV0SnpCWXFlVEV0?=
 =?utf-8?B?ZG5ZSE51aXlPRWdkRWZXUDNMa0xiSExwNVNYWkhmNEZuYmlxZjhhSGQycGlr?=
 =?utf-8?B?MUFuZXNNVlBnMkZ6NFViWDBtRG5UR3lYc01kTm04eHV4aEl6RmFWKzlzOXF4?=
 =?utf-8?B?d250QkRZRDNETXhCZENScWJ0ZStrRzBxWWxsWHRXNks2U0xXdHdLL1JoSXNS?=
 =?utf-8?B?UThGVHMybDQ0ZG4rM1pBNWhNRHM5RVpWWWxQZFg5ZlorMTVEdU13VTVPWGMx?=
 =?utf-8?B?NkJJaTdaVXNEelRWRStQOTVmTUJ5TVV3Qlc1b2tha1lZZFBrcVp4ZlViK3VT?=
 =?utf-8?B?L2ZQSWNwZUErYUxKTC9VYWpsUGxwWkRNeERhUldrclhLaGxZM0g3UC90cWJj?=
 =?utf-8?B?cnBCQ1BMcEVXVm9CZFlERW9vUFU1S1dYTjA5ZVB3L1BUc3NqbnhYYjVORU1x?=
 =?utf-8?B?Yzg3YlJFT2t0bGpqQWo4L1hsYk5Ec2RKbC85QnNxRGxjQkxRM0VHZW5PZlV4?=
 =?utf-8?B?UjlYT0ZaK2ZsdmFEZlFLVzhzTTBDZjJvRnZOb2FqZy9Na0U5RktLazgxTXAr?=
 =?utf-8?B?bEUxQ0hhQTMydWxFWjlVVVkzaWdiRktoTUkyREJwMUFXSklpNzBkdlBvY3g1?=
 =?utf-8?B?RHJlT2U4OHJtM29nb2ZzSWZtamluSk1pMVR5aGlTYXdJS1g4VnJtYlhaS0Zs?=
 =?utf-8?B?OGk1bUsyVUZOeTBkNzgveTQ3UGdCSEdIcHR0b3dMU0hhTHdUNTdjYUhtZjAz?=
 =?utf-8?B?NEcxNzBVd0dqbjVTUWlTbkNYMHJYWEs2ZTdhdjgvcXFvWCs2SWl1cHN6OVps?=
 =?utf-8?B?V0xIY1QyNnh2a3M5NDlIa1J0cEZPa0xSaThXdER0QVVRSmx2Nm85TGhkQ2pm?=
 =?utf-8?B?NThkaGpQKzRLZjZhUE1tYlpYZURubkpQZW1FcEE4MmpMdGtrb0R3WTMvNUlz?=
 =?utf-8?B?b000cm5RTFFMMGwvZVpvdEJQM2dpVVRSUjliRElOU2VDQXQyY0pEdHBjL1hx?=
 =?utf-8?B?YzNuRWdOV3VGRU90Q1l6ZWsvVkxWWHZJMis5TXZ4OTNKRTJDUGlYM3N0Z0wx?=
 =?utf-8?B?aHU5ampmWkFRbDZrK1dRTitBako1M1hVR3Q2eC92WUUzaEZPZEUzYm9WbDZq?=
 =?utf-8?B?cXN0RFpyemRERXpCa3VKdWN3WnllZ2Jac2JIc0hWTXQ1alNvVVpkcGZpNUNn?=
 =?utf-8?B?Uk9SQ2FZemhpM3k3QmRnaEJFTmZ3bk9IMDlmSmhLOWRNTzdqUVgyN2dKaXNO?=
 =?utf-8?B?WGpQemRkUFRXcTRCVWlVcXQxWityaU9EZTRIRVdOSmhXLzBrNStXRjIxWlNm?=
 =?utf-8?B?SkRhVG9OU3pPRnBGRkNiTjlodzhUSTd2RVQwdUQvMEZFVmphckRSZUJieDVF?=
 =?utf-8?B?MVVhb2RNYkFQUVl3RDBBRGZjbk53SHVDNENJeDRTVjNVZEhCWmVTN2M3L05S?=
 =?utf-8?B?ZHBuL2tCMjV4SUJGSjdhTDZTb01xWFQ1MTBBODg0VTJkN1psZjZxYmJUV0E0?=
 =?utf-8?B?MnppSkg4eUdsN2w5N0svZUNGR1IzNHdKZU91cFhUTlJrbVQ2OXhsekNBbUZv?=
 =?utf-8?B?WXk1ZjNUK2FnOUY1M1phcDB2SW4wcVd4STU1MXY1dmhKUEY0VHZWSlFnT0VW?=
 =?utf-8?B?ZTlySFVEcUo3M0ZMSnUvV3RET1JBd2M2STJwbHpCUEI5OFRZc290TzJEY2I5?=
 =?utf-8?B?ZjFWNER0dWNCQzhmWnB0OEZ3SGU0U0R2cFlNTEY3V0F5RkE4cmp2cytGYkY1?=
 =?utf-8?Q?FNpTfEuJ5Y37ui2iyOx4z9r1B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e03c9b-84b1-4eb7-01dc-08dd2f17b45f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 12:35:01.5002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vivUhdBWTv05bh76etfcHB0+DaXhBCwOckI/DqfjE08BQn5qNo64WH5IP4hFg3o0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456
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

Am 07.01.25 um 08:06 schrieb Shuai Xue:
>
>
> 在 2025/1/3 16:21, Koenig, Christian 写道:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Hi Shuai,
>>
>> setting gpu_recovery=0 is not even remotely related to RAS. If that 
>> option affects RAS behavior in any way then that is a bug.
>>
>> The purpose of setting gpu_recovery=0 is to disable resets after a 
>> submission timeout most likely caused by an unrecoverable HW error.
>>
>> This is necessary for JTAG debugging in our labs during HW bringup 
>> and should *NEVER* be used on any production system.
>>
>> We already discussed with upstream maintainers that we should 
>> probably mark the kernel as tainted to indicate that it might be in 
>> an unreliable HW state. I will push for this now since there seems to 
>> be a big misunderstanding what this option does.
>>
>> Regards,
>> Christian.
>
>
> Hi, Christian,
>
> Got the purpose of setting gpu_recovery=0. Thanks for the your patient 
> explanation.
>
> When a ECC error occurs, the AMD GPU driver auto resets all GPUs and 
> all jobs
> are terminated. My ultimate goal is provide error isolation between 
> independent
> jobs which use a different GPU. Any suggestion?

Not of hand.

Hawking is the expert for  this, but resetting all GPUs and all jobs on 
a RAS error is a must have for system stability.

What we might be able to do is to isolate the GPU from the PCIe bus. The 
only problem with that is that you need a full system reset to get out 
of this again.

Regards,
Christian.

>
> Thank you.
> Best Regards,
>
>>
>> ________________________________________
>> Von: Shuai Xue <xueshuai@linux.alibaba.com>
>> Gesendet: Montag, 30. Dezember 2024 09:50
>> An: Koenig, Christian; Deucher, Alexander; Pan, Xinhui; 
>> airlied@gmail.com; simona@ffwll.ch; Lazar, Lijo; Ma, Le; 
>> hamza.mahfooz@amd.com; tzimmermann@suse.de; Liu, Shaoyun; 
>> Jun.Ma2@amd.com
>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; 
>> linux-kernel@vger.kernel.org; tianruidong@linux.alibaba.com
>> Betreff: Re: [PATCH] drm/amdgpu: Enable runtime modification of 
>> gpu_recovery parameter with validation
>>
>>
>>
>> 在 2024/12/30 04:11, Christian König 写道:
>>> Am 28.12.24 um 07:32 schrieb Shuai Xue:
>>>> It's observed that most GPU jobs utilize less than one server, 
>>>> typically
>>>> with each GPU being used by an independent job. If a job consumed 
>>>> poisoned
>>>> data, a SIGBUS signal will be sent to terminate it. Meanwhile, the
>>>> gpu_recovery parameter is set to -1 by default, the amdgpu driver 
>>>> resets
>>>> all GPUs on the server. As a result, all jobs are terminated. Setting
>>>> gpu_recovery to 0 provides an opportunity to preemptively evacuate 
>>>> other
>>>> jobs and subsequently manually reset all GPUs.
>>>
>>> *BIG* NAK to this whole approach!
>>>
>>> Setting gpu_recovery to 0 in a production environment is *NOT* 
>>> supported at all and should never be done.
>>>
>>> This is a pure debugging feature for JTAG debugging and can result 
>>> in random crashes and/or compromised data.
>>>
>>> Please don't tell me that you tried to use this in a production 
>>> environment.
>>>
>>> Regards,
>>> Christian.
>>
>> Hi, Christian,
>>
>> Thank you for your quick reply.
>>
>> When an application encounters uncorrected error, it will be 
>> terminate by a
>> SIGBUS signal. The related bad pages are retired. I did not figure why
>> gpu_recovery=0 can result in random crashes and/or compromised data.
>>
>> I test with error injection in my dev enviroment:
>>
>> 1. load driver with gpu_recovery=0
>> #cat /sys/bus/pci/drivers/amdgpu/module/parameters/gpu_recovery
>> 0
>>
>> 2. inject a Uncorrectable ECC error to UMC
>> #sudo amdgpuras -d 0 -b 2 -t 8
>> Poison inject, logical addr:0x7f2b495f9000 physical addr:0x27f5d4b000 
>> vmid:5
>> Bus error
>>
>> 3. GPU 0000:0a:00.0 reports error address with PA
>> #dmesg | grep 27f5
>> [424443.174154] amdgpu 0000:0a:00.0: amdgpu: Error 
>> Address(PA):0x27f5d43080 Row:0x1fd7 Col:0x0  Bank:0xa Channel:0x30
>> [424443.174156] amdgpu 0000:0a:00.0: amdgpu: Error 
>> Address(PA):0x27f5d4b080 Row:0x1fd7 Col:0x4  Bank:0xa Channel:0x30
>> [424443.174158] amdgpu 0000:0a:00.0: amdgpu: Error 
>> Address(PA):0x27f5d53080 Row:0x1fd7 Col:0x8  Bank:0xa Channel:0x30
>> [424443.174160] amdgpu 0000:0a:00.0: amdgpu: Error 
>> Address(PA):0x27f5d5b080 Row:0x1fd7 Col:0xc  Bank:0xa Channel:0x30
>> [424443.174162] amdgpu 0000:0a:00.0: amdgpu: Error 
>> Address(PA):0x27f5f43080 Row:0x1fd7 Col:0x10 Bank:0xa Channel:0x30
>> [424443.174169] amdgpu 0000:0a:00.0: amdgpu: Error 
>> Address(PA):0x27f5f4b080 Row:0x1fd7 Col:0x14 Bank:0xa Channel:0x30
>> [424443.174172] amdgpu 0000:0a:00.0: amdgpu: Error 
>> Address(PA):0x27f5f53080 Row:0x1fd7 Col:0x18 Bank:0xa Channel:0x30
>> [424443.174174] amdgpu 0000:0a:00.0: amdgpu: Error 
>> Address(PA):0x27f5f5b080 Row:0x1fd7 Col:0x1c Bank:0xa Channel:0x30
>>
>> 4. All the related bad pages are AMDGPU_RAS_RETIRE_PAGE_RESERVED.
>> #cat 
>> /sys/devices/pci0000:05/0000:05:01.0/0000:06:00.0/0000:07:00.0/0000:08:00.0/0000:09:00.0/0000:0a:00.0/ras/gpu_vram_bad_pages 
>> | grep 27f5
>> 0x027f5d43 : 0x00001000 : R
>> 0x027f5d4b : 0x00001000 : R
>> 0x027f5d53 : 0x00001000 : R
>> 0x027f5d5b : 0x00001000 : R
>> 0x027f5f43 : 0x00001000 : R
>> 0x027f5f4b : 0x00001000 : R
>> 0x027f5f53 : 0x00001000 : R
>> 0x027f5f5b : 0x00001000 : R
>>
>> AFAIK, the reserved bad pages will not be used any more.  Please 
>> correct me if
>> I missed anything.
>>
>> DRAM ECC issues are the most common problems. When it occurs, the 
>> kernel will
>> attempt to hard-offline the page, by trying to unmap the page or 
>> killing any
>> owner, or triggering IO errors if needed.
>>
>> ECC error is also common for HBM and error isolation from each user's 
>> job is a
>> basic requirement in public cloud. For NVIDIA GPU, a ECC error could be
>> contained to a process.
>>
>>> XID 94: Contained ECC error
>>> XID 95: UnContained ECC error
>>>
>>> For Xid 94, these errors are contained to one application, and the 
>>> application
>>> that encountered this error must be restarted. All other 
>>> applications running
>>> at the time of the Xid are unaffected. It is recommended to reset 
>>> the GPU when
>>> convenient. Applications can continue to be run until the reset can be
>>> performed.
>>>
>>> For Xid 95, these errors affect multiple applications, and the 
>>> affected GPU
>>> must be reset before applications can restart.
>>>
>>> https://docs.nvidia.com/deploy/xid-errors/
>>
>> Does AMD GPU provide a similar way to achieve error isolation 
>> requirement?
>>
>> Best Regards,
>> Shuai
>>
>>>
>>>>    However, this parameter is
>>>> read-only, necessitating correct settings at driver load. And 
>>>> reloading the
>>>> GPU driver in a production environment can be challenging due to 
>>>> reference
>>>> counts maintained by various monitoring services.
>>>>
>>>> Set the gpu_recovery parameter with read-write permission to enable 
>>>> runtime
>>>> modification. It will enables users to dynamically manage GPU recovery
>>>> mechanisms based on real-time requirements or conditions.
>>>>
>>>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 26 
>>>> ++++++++++++++++++++++++-
>>>>    1 file changed, 25 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> index 38686203bea6..03dd902e1cec 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> @@ -563,12 +563,36 @@ module_param_named(lbpw, amdgpu_lbpw, int, 
>>>> 0444);
>>>>    MODULE_PARM_DESC(compute_multipipe, "Force compute queues to be 
>>>> spread across pipes (1 = enable, 0 = disable, -1 = auto)");
>>>>    module_param_named(compute_multipipe, amdgpu_compute_multipipe, 
>>>> int, 0444);
>>>> +static int amdgpu_set_gpu_recovery(const char *buf,
>>>> +                   const struct kernel_param *kp)
>>>> +{
>>>> +    unsigned long val;
>>>> +    int ret;
>>>> +
>>>> +    ret = kstrtol(buf, 10, &val);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    if (val != 1 && val != 0 && val != -1) {
>>>> +        pr_err("Invalid value for gpu_recovery: %ld, excepted 
>>>> 0,1,-1\n",
>>>> +               val);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    return param_set_int(buf, kp);
>>>> +}
>>>> +
>>>> +static const struct kernel_param_ops amdgpu_gpu_recovery_ops = {
>>>> +    .set = amdgpu_set_gpu_recovery,
>>>> +    .get = param_get_int,
>>>> +};
>>>> +
>>>>    /**
>>>>     * DOC: gpu_recovery (int)
>>>>     * Set to enable GPU recovery mechanism (1 = enable, 0 = 
>>>> disable). The default is -1 (auto, disabled except SRIOV).
>>>>     */
>>>>    MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, 
>>>> (1 = enable, 0 = disable, -1 = auto)");
>>>> -module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
>>>> +module_param_cb(gpu_recovery, &amdgpu_gpu_recovery_ops, 
>>>> &amdgpu_gpu_recovery, 0644);
>>>>    /**
>>>>     * DOC: emu_mode (int)

