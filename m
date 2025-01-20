Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096CAA169C6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 10:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20CF10E22E;
	Mon, 20 Jan 2025 09:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dtmncvNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C410010E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 09:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHB/wPRZAuPSTmCrbiGTn2oFZyCbP/xTf/Hgs08GPwc+7bfwHVpcpYxytTk3sSLv240DSt8suwmxeXCKiHUIj5z40nwAynjduNI4DDi8OdesEXKyydegK//kmXB4DLiDAieds9iJymY0bnvtp3Ke0skHjp2lNP11+FmX0pDjEn+tyHdGocOGvcPJxfWobagbCAOtLkhnePzxn9atxA5ElGITI7Y9shPNddZM1yKT17tOb5UWTY6ePjijgHJ2wbaZ5awXeoNFzovjB/WxmnkqKU2uH3zD7Wa81bTl/Ju5LULX0pA+7sxyi7C1W/zY9YPrR3OBEnGGjUs1qFnXNf3SQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HI6RKqOm8UvIqwsR+7Ol6GveDJRZp3HytAsUjAiXObI=;
 b=XV4miNA3POt3CI0F9ncEgu+TKsVy5Ne7GBSqrKCXcrJ1vUPCXS4Oay2FEvBAnn/X6ZqRId2IASnlADZve20MyFf37mChF/EuGhsUs0hrVG30Sq7+6n3HqUL7Rh7jDfTkjSL1SsIHWhNe/hQJOCRaf2DQzY6Lamp+gb2BqzFgsYGR5DEjgBIiBUZ6ubr40Qp/TJNp1EnP66tsu3GukPfG37RvtUPAs6kIh0YlVVXLfuctjL66f93tyRY5pNhT+FaVg2VJjvyMhMYdwwKdF/3NnZh8P+CDfjl8ZOJzPb7N4JiV3Ac4pdXgUoX6LPn/by4dagUO5qR/4bhJ2NoCv7WD2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HI6RKqOm8UvIqwsR+7Ol6GveDJRZp3HytAsUjAiXObI=;
 b=dtmncvNl1s8C9R6JA2LxkmAKQtnsxCW7JhZSdFSKD2K9cr4jvrUMEqd0Nke+vhIggWqSRw9/PIR0WheQE7nG9Fsx7RFTCJx280iayhTlB7JdyybCR4RTKm/CdwjSGq1va7DtgtmswpyDpG32eBE7RvtYMLG6Qd6g+HcX1q98EPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV3PR12MB9213.namprd12.prod.outlook.com (2603:10b6:408:1a6::20)
 by MW4PR12MB6730.namprd12.prod.outlook.com (2603:10b6:303:1ec::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 09:46:03 +0000
Received: from LV3PR12MB9213.namprd12.prod.outlook.com
 ([fe80::dcd3:4b39:8a3a:869a]) by LV3PR12MB9213.namprd12.prod.outlook.com
 ([fe80::dcd3:4b39:8a3a:869a%5]) with mapi id 15.20.8356.010; Mon, 20 Jan 2025
 09:46:02 +0000
Message-ID: <835c7751-d8ba-4af0-812f-2b3a9a91d0bc@amd.com>
Date: Mon, 20 Jan 2025 20:45:51 +1100
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Baolu Lu <baolu.lu@linux.intel.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <20250109144051.GX5556@nvidia.com>
 <Z3/7/PQCLi1GE5Ry@yilunxu-OptiPlex-7050> <20250110133116.GF5556@nvidia.com>
 <Z4Hp9jvJbhW0cqWY@yilunxu-OptiPlex-7050> <20250113164935.GP5556@nvidia.com>
 <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050> <20250114133553.GB5556@nvidia.com>
 <17cd9b77-4620-4883-9a6a-8d1cab822c88@amd.com>
 <20250115130102.GM5556@nvidia.com>
 <f1ac048f-64b1-4343-ab86-ad98c24a44f5@linux.intel.com>
 <20250117132523.GA5556@nvidia.com>
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <20250117132523.GA5556@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MEVPR01CA0075.ausprd01.prod.outlook.com
 (2603:10c6:220:201::11) To LV3PR12MB9213.namprd12.prod.outlook.com
 (2603:10b6:408:1a6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9213:EE_|MW4PR12MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: 59db7e7d-ede1-4804-de20-08dd3937408a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NitrVzBXQzA1SUtRM3A2UnVDWmx0QVNsSEdWdlVFa01uY1N4R2Q2aTlRSk44?=
 =?utf-8?B?UjZkWUtSWUQrbEdqVzVUWEtXSUM1aWFBb2VmUHdwc0kzdmd6dVRBaC83WnRi?=
 =?utf-8?B?WEVLOThHWmo4R2M5UGRIaldDOWdnUXk1SXpPb2hVU2I0akUwWVd5Tno2MjN0?=
 =?utf-8?B?MThhMFFteXMwODNHNkxhLysvdDV2ZWcyKytSd3kxeXA3czVKa3FCdno5cDhl?=
 =?utf-8?B?MXFML0dMUStyVlpzSSs0eXR4TXZjRnRYUnY2ZmhlWDhrc1FwNVM0bVk0Wnk1?=
 =?utf-8?B?VmVGVW5PYnFKcGl5TzVIQjBGSUI0bDVjUDdsUHQvdGRTdTg1TFA5bFU0eU40?=
 =?utf-8?B?VnM5UExKdWZxR1d4K3ljR2t6N052Rmw4VDA5ZXZKZitFUmRadmNReTMzdlg0?=
 =?utf-8?B?dERpZUYwWVJ2TTVtOVBrUlpDZElURjFia2ZuakVkZ1M2RkR5VHZOUU1NQTdE?=
 =?utf-8?B?VmVna3RZcXNIYitpL01kLzZFbHZhVUFtMElUWUJlT21ZRHFoZ2Y4WW45R3Er?=
 =?utf-8?B?S3I2ZUg4Wk1kV2k1a1FYTmRFOFhSRjFMMEQ2QWJ2d3pZOGhuK0RGd2hGRzhj?=
 =?utf-8?B?R0RndlIvTmhHMXgwSzlIWW5kNU90b0sxMyt4TkxaanZVN29FNGN3V081NXo0?=
 =?utf-8?B?RW1ZY0YxQ0xnOVo3ZVlFNEZJc1R1UGdhSmc1a2w5YlBDeXAvMnBmR2d5akNO?=
 =?utf-8?B?WWNob3p3YzVqSzFTTm9ienBCVW5BbEJUK2I0cHB6aFp2ZStMK01WT0FURDFv?=
 =?utf-8?B?NXFSUFdZUGF6R2h5RGhKaWRZazZqb2JHRzFEQ1NibnFMaHI0YmZSVG94V1pQ?=
 =?utf-8?B?WEU1OUxkdUVGMU9NRU1CWG5jRFlQaDg2bERLbWdnR1QwRm1UUkhkU0xxVXk3?=
 =?utf-8?B?eEQvTkoyU2hreWwvbnFBR2s5TnBHZkpzZFNxVGFqSndIelc3TXQ4eWRHeVZS?=
 =?utf-8?B?NkpBMnlodEhZZ040c2xDaG5TeGdHRnBYTHB0QUhwNjRVMUtIUWZTVkZhZG5q?=
 =?utf-8?B?eTUreUNjVGxxYjJzamhnMXBYd3hRdHBRcnRkemM4WXkwSURNTGhUSjJxMnRv?=
 =?utf-8?B?UE9HaHpzdDF2VWRPaUhFb0xZMm0wQVByTG03U3J5bFlFWmZGZ1lCWTZFcjl4?=
 =?utf-8?B?S1BXeHVKOXd1OE5obTRqalFGd3AyVDZyWmw2NnljdUFPWnMyRTlRTkxIdXQr?=
 =?utf-8?B?Q1RaWHhabmNJdUVqT01keVBPNDJ4ek42N1JaMTFFR29wazd5VVJGalJlT3hq?=
 =?utf-8?B?bFVDNWhhYzFtYURSQlVXUzRNWVVTVnBNbWp2SVlQU3dKcG1XSzkzbFBSSWsr?=
 =?utf-8?B?aHQ5b0M4MlIvc1NxL3F1K0xtQzBzbVVGZUg4WXRoS0tVcC94dHIwOGYzVGpN?=
 =?utf-8?B?WmdiaVJHVkVTOE9vVEhESHcyYUQzWW00dkhmS0VWNnZsUjdUNDRJVlJWT3ow?=
 =?utf-8?B?MWxYNDdXUDk3aGxxbnB1ZGVNZkpzWkEzQ1dMQzJQUzlxMm1xZE1nM0ljR0FW?=
 =?utf-8?B?RU9DNnZQTmo5bWhxTVpqY0Y2WVJOMGovSkp5RlprTExKVlRyNk5SKzhnUGh6?=
 =?utf-8?B?OFZZZ3V6U3JHUHJDTU1jSmdCUW1JaVRnNGU4SW41Q21pK0dBQTc4a25XNVdi?=
 =?utf-8?B?N01FNGY1aFcwMVp5UkFWZ096ZnFWdFp6Mk0vM0VTVVVtaWs5Y3dJRmI1N1NH?=
 =?utf-8?B?aWhWQzU3SWVQVFNVSGtTZGh1cThtUlFnMDJ1bUFpSGU2eDg2MmlEUE5uV2kz?=
 =?utf-8?B?bXNKZFBVRS8zWTljUm5xc0JsdUNRS28rbmFmeFNWdWtxcEpwK1VqeFpsd3RZ?=
 =?utf-8?B?clppYXZmckJsZVQyYzR4QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9213.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEV0UllEOXNONXZOTTBzLzRVU0VneW9pd0c4MEZmZnNlTDBsZXpDSXA4REg0?=
 =?utf-8?B?Q0NORDB6T0tWS1NnYXdhaVRyOHU5OTRnb1p4dGJEdkx3Y1V2cFVVT2VzalBR?=
 =?utf-8?B?SENBUi9NcUVjQUIzWFF0eGt6YTR0SzF4Umd4NXA5MmttbEFPMG5hK3k2aWtR?=
 =?utf-8?B?SXBJSGh3Smg4T1hmaGlDWDBVOU1OV2VvT2c5VWl1QWhGNUtDSm1peGxtMUdS?=
 =?utf-8?B?N0w0MVE3bTQrTVM2V0gvS1dFMFEvQURMNFcydjFhdTd2Q1NJaytUVU1uY0x6?=
 =?utf-8?B?TmlFdkg0ZTZuTGkyZFFqRi9nVkRyZlRGRzY2L3pmNll0TzdiWStqa0d4LzQ4?=
 =?utf-8?B?Y1N0V252dTJyOU0zMFl4eVllMlEyZXBTOVdPR00yTitPVy9MeUtVU2JGaFpt?=
 =?utf-8?B?Z1VMM0ZTRXc2OFZEY0R4RlZDSyt6OGpwY1Z0V1o3cVdxdjVtUU1NZ1NuOXlL?=
 =?utf-8?B?WndGK2VZYVhoZXVPZFBjVGxiKzZTOVFFN0xmMURiTEs1aVlwK09EUFpVU2V1?=
 =?utf-8?B?NWxkSFZhN3RUeXJ1YUtXQkJIYk9WVG9CbXovSUlwZXMweEhObnFzcXpaSU5D?=
 =?utf-8?B?ak5ZWVZFbWVlTStJNzZ6aVlVMis1b0hKbXh0WHFkQ0ZMczB4NUxtSTc4MU1h?=
 =?utf-8?B?eFdncUxSbnpqMFI1aWZFY1dRSUVjeXhPYXI2bEVpMHdPbzJMRll4WDI0MkdB?=
 =?utf-8?B?ZWowNk9HRVVudWlPUHJNNE00MURHUGx6MlJmV21URUg4V2JvU3dPU0Q5TzJn?=
 =?utf-8?B?Z1JsZDN2ZmxBUzJwS0Nnc01oR0QwOTRyNTRBcjR3NGpoS2xVTHc1VVZVdnpS?=
 =?utf-8?B?L0FWcjl5YXNsbFk1ZCtrTE5oWGtIcWg1TTBCUEhhU080ZllJTUsxc1E4ZEY2?=
 =?utf-8?B?TVRncjVLbmtPd0Z0eEhoZ3g4WXcyS3crSXNuVU9rQWRLUTBTbS92aUs2WmEz?=
 =?utf-8?B?NFhUbjJFQmo5dEVjT1NQU0kwZkc5QTlNcU1SWis5endYMVdtdjU2ZGFCNVhV?=
 =?utf-8?B?Nzh4V0xNVXF0N01OWjg1dHdmYittb0J0MHZWaHNPYWNQRUxoU0EvVHhUbHJk?=
 =?utf-8?B?TzU1T2VCV09sc2I4ek5jR0VhVlJ6eWRKV0FRbktDSzl0YnVwUFlqaFhWdk1a?=
 =?utf-8?B?NFovV3V1SmJXQkpLQ1piUzhzVUhQajFwTWoyT01nNEpNdHZTZEgxWjZHQktz?=
 =?utf-8?B?RDEvNUJEYkFxRTZ2RVR5SFkwQmVVRXNpSC9lR3V2M1EyNU5NanQvY0x0SURR?=
 =?utf-8?B?dlFNUzNTc0FGZUtaditHLzlnd2lKZ1dmZXBwMDJ5MXZWeHhZSHo4N0h6MWF4?=
 =?utf-8?B?ZnZwcHk5S2hLb1E0dUxjbHhiWWYwak9WZm03UHNNSGxxUWJMQlF1ZGwwN1RX?=
 =?utf-8?B?RDVMS2c3TytYbnl1QXVGTHVvZnh6Qkl2ZEVIRzRqdUNBdEE0N2MxeThBdE11?=
 =?utf-8?B?V3NhU2podVlaSUxHU3JOcDlQVGRBK3IyZXVDZ1lHWGc3VmdlMURlVzVOaGxS?=
 =?utf-8?B?QU1Wb2piS3F0cG9aUW50ZDdqRUJ3V3hTMjhFdUU4YTBSQnBwTGdjdXFxTWJQ?=
 =?utf-8?B?eGdSMmk4TmpRUlNjaFpMNFhPRUJxanpnbHBYQWI0RVhVYTJ5M1o4QnVyRW10?=
 =?utf-8?B?ckdaazZKamg3N3QrbUhRQ2pyeG9jTlJHTGJwWi9Nd2hRdk9hSVBNSTNzTDg1?=
 =?utf-8?B?REVSUnFDaitnU2J3S0crbHBHb1RFWEc4TVlWaGZyTWQvdHllWlFNQW9JajV0?=
 =?utf-8?B?RG5qMWZUa2wxQ3FXbXhoaGNGMjJEZXpDQVlpY2VBUklIZjVMeHVKeDdPcXhB?=
 =?utf-8?B?MXpyWW96QnZkK2JQcjE5S2V5OWs0NU56a3oyR2Exa3kvbSt2RnhyRndBZ1JP?=
 =?utf-8?B?eHFCanRYMXloK3hiZk5MTG1WeEtsZE84YlluZ04xeFpkMnRVakl0U2VZcURP?=
 =?utf-8?B?TW9semxzbkJRV0YvNVFIZTl5SGxKOXBwOXBETzgxM3FJeVp0SStlbUFnKzh5?=
 =?utf-8?B?QTJ1S3R0dDdKUDdkMVM5TjlzMHJSSG9XTXZqdkdMU1kxYUkvREhTRm94aDFw?=
 =?utf-8?B?WTEwYnZ5LytMQTR6L0I3amhDYXZsL1NzQVd0NUxuSFFpWld2RWZ2bXpQN21Q?=
 =?utf-8?Q?gv3y1BK9JfhCcvZKgqEQWH6+T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59db7e7d-ede1-4804-de20-08dd3937408a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9213.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 09:46:02.8592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXqSzitfgnQ8eNXbZtWpjouhiTvNsMYIUcEWxpH89zvj9yzgPPfzED1Pme58oQUIbldofCAnSfT4ZctbVgzNtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6730
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

On 18/1/25 00:25, Jason Gunthorpe wrote:
> On Fri, Jan 17, 2025 at 09:57:40AM +0800, Baolu Lu wrote:
>> On 1/15/25 21:01, Jason Gunthorpe wrote:
>>> On Wed, Jan 15, 2025 at 11:57:05PM +1100, Alexey Kardashevskiy wrote:
>>>> On 15/1/25 00:35, Jason Gunthorpe wrote:
>>>>> On Tue, Jun 18, 2024 at 07:28:43AM +0800, Xu Yilun wrote:
>>>>>
>>>>>>> is needed so the secure world can prepare anything it needs prior to
>>>>>>> starting the VM.
>>>>>> OK. From Dan's patchset there are some touch point for vendor tsm
>>>>>> drivers to do secure world preparation. e.g. pci_tsm_ops::probe().
>>>>>>
>>>>>> Maybe we could move to Dan's thread for discussion.
>>>>>>
>>>>>> https://lore.kernel.org/linux-
>>>>>> coco/173343739517.1074769.13134786548545925484.stgit@dwillia2-
>>>>>> xfh.jf.intel.com/
>>>>> I think Dan's series is different, any uapi from that series should
>>>>> not be used in the VMM case. We need proper vfio APIs for the VMM to
>>>>> use. I would expect VFIO to be calling some of that infrastructure.
>>>> Something like this experiment?
>>>>
>>>> https://github.com/aik/linux/commit/
>>>> ce052512fb8784e19745d4cb222e23cabc57792e
>>> Yeah, maybe, though I don't know which of vfio/iommufd/kvm should be
>>> hosting those APIs, the above does seem to be a reasonable direction.
>>>
>>> When the various fds are closed I would expect the kernel to unbind
>>> and restore the device back.
>>
>> I am curious about the value of tsm binding against an iomnufd_vdevice
>> instead of the physical iommufd_device.
> 
> Interesting question
>   
>> It is likely that the kvm pointer should be passed to iommufd during the
>> creation of a viommu object.
> 
> Yes, I fully expect this
> 
>> If my recollection is correct, the arm
>> smmu-v3 needs it to obtain the vmid to setup the userspace event queue:
> 
> Right now it will use a VMID unrelated to KVM. BTM support on ARM will
> require syncing the VMID with KVM.
> 
> AMD and Intel may require the KVM for some reason as well.
> 
> For CC I'm expecting the KVM fd to be the handle for the cVM, so any
> RPCs that want to call into the secure world need the KVM FD to get
> the cVM's identifier. Ie a "bind to cVM" RPC will need the PCI
> information and the cVM's handle.

And keep KVM fd open until unbind? Or just for the short time to call 
the PSP?

>  From that perspective it does make sense that any cVM related APIs,
> like "bind to cVM" would be against the VDEVICE where we have a link
> to the VIOMMU which has the KVM. On the iommufd side the VIOMMU is
> part of the object hierarchy, but does not necessarily have to force a
> vIOMMU to appear in the cVM.

Well, in my sketch it "appears" as an ability to make GUEST TIO REQUEST 
calls (guest <-> secure FW protocol).

> But it also seems to me that VFIO should be able to support putting
> the device into the RUN state without involving KVM or cVMs.

AMD's TDI bind handler in the PSP wants a guest handle ("GCTX") and a 
guest device BDFn, and VFIO has no desire to dive into this KVM business 
beyond IOMMUFD.

And then this GUEST TIO REQUEST which is used for 1) enabling secure 
part of IOMMU (so it relates to IOMMUFD)  2) enabling secure MMIO (which 
is more VFIO business).

We can do all sorts of things but the lifetime of these entangled 
objects is tricky sometimes. Thanks,


>> Intel TDX connect implementation also needs a reference to the kvm
>> pointer to obtain the secure EPT information. This is crucial because
>> the CPU's page table must be shared with the iommu.
> 
> I thought kvm folks were NAKing this sharing entirely? Or is the
> secure EPT in the secure world and not directly managed by Linux?
> 
> AFAIK AMD is going to mirror the iommu page table like today.
> 
> ARM, I suspect, will not have an "EPT" under Linux control, so
> whatever happens will be hidden in their secure world.
> 
> Jason

-- 
Alexey

